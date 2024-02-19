<?php

namespace App\Form;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Validator\Context\ExecutionContextInterface;

class RegistrationFormType extends AbstractType
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'constraints' => [
                new Assert\Callback([$this, 'validateEmailUnique'])
                ]
            ])

            ->add('plainPassword', PasswordType::class, [
                                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez créer un mot de passe',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Votre mot de passe doit faire au minimum {{ limit }} caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                    new Regex([
                        'pattern' => '/^(?=.*[A-Z])(?=.*[0-9])/',
                        'message' => 'Votre mot de passe doit contenir au minimum une majuscule et un chiffre',
                    ]),
                ],
            ])

            ->add('pseudo', TextType::class, [
                'constraints' => [
                new Assert\Callback([$this, 'validatePseudoUnique'])
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }

    public function validateEmailUnique($value, ExecutionContextInterface $context)
    {
        $existingUser = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $value]);

        if ($existingUser) {
            $context->buildViolation('Cette adresse mail est déjà utilisée.')
                ->atPath('email')
                ->addViolation();
        }
    }

    public function validatePseudoUnique($value, ExecutionContextInterface $context)
    {
        $existingUser = $this->entityManager->getRepository(User::class)->findOneBy(['pseudo' => $value]);

        if ($existingUser) {
            $context->buildViolation('Ce pseudo est déjà utilisé.')
                ->atPath('pseudo')
                ->addViolation();
        }
    }
}
