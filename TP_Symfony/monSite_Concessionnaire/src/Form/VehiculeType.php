<?php

namespace App\Form;

use App\Entity\Vehicule;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;


class VehiculeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('modele')
            ->add('description')
            ->add('prix')
            ->add('date_creation')
            ->add('image')
            ->add('en_vente')
            ->add('lien_redirection')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Vehicule::class,
        ]);
    }
}
