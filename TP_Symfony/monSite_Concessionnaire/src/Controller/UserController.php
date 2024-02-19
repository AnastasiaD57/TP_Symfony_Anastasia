<?php

namespace App\Controller;


use App\Form\RegistrationFormType;
use App\Form\UserUpdateFormType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

#[Route('/user')]
#[IsGranted('ROLE_USER')]
class UserController extends AbstractController
{
    #[Route('/', name: 'index_user')]
    public function index_user(UserRepository $userRepository ): Response
    {
        $users = $userRepository->findAll();
        return $this->render('user/index.html.twig', [
            'users' => $users,
        ]);
    }

    #[Route(path : "/update/{id}", name: "update_user")]
    public function update_user(int $id, UserRepository $userRepository, UserPasswordHasherInterface $userPasswordHasher, Request $request, EntityManagerInterface $em){

        $user = $userRepository->findOneBy([ "id" => $id ]); 
                    
        $form = $this->createForm(UserUpdateFormType::class , $user);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $em->persist($user);
            $em->flush();

            return $this->redirectToRoute("index_user");
        }
        return $this->render("user/update.html.twig", [
            'form' => $form->createView(),
        ]);
    }

    #[Route(path : "/delete/{id}", name: "delete_user")]
    public function delete_user(int $id, UserRepository $userRepository, EntityManagerInterface $em){
        $user = $userRepository->findOneBy(["id" => $id]);
        $em->remove($user);
        $em->flush();
        return $this->redirectToRoute("index_user");
    }
}