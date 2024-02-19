<?php

namespace App\Controller;

use App\Entity\Vehicule;
use App\Form\VehiculeType;
use App\Repository\VehiculeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/vehicules')]
#[IsGranted('ROLE_USER')]
class VehiculeController extends AbstractController
{
    #[Route('/', name: 'index_vehicules')]
    public function index_vehicule(VehiculeRepository $vehiculeRepository ): Response
    {
        $vehicules = $vehiculeRepository->findAll();
        return $this->render('vehicule/index.html.twig', [
            'vehicules' => $vehicules,
        ]);
    }

    #[Route(path : "/new", name: "new_vehicule")]
    public function new_vehicule(Request $request , EntityManagerInterface $em){
        $vehicule = new Vehicule();
        $form = $this->createForm(VehiculeType::class , $vehicule);

        $form->handleRequest($request); //  $_POST

        if($form->isSubmitted() && $form->isValid()){
            $em->persist($vehicule);
            $em->flush();
            return $this->redirectToRoute("index_vehicules");
        }

        return $this->render("vehicule/new.html.twig", [ "form" => $form ]);
    }

    #[Route(path : "/update/{id}", name: "update_vehicule")]
    public function update_vehicule(int $id, VehiculeRepository $vehiculeRepository, Request $request, EntityManagerInterface $em){
        $vehicule = $vehiculeRepository->findOneBy([ "id" => $id ]); 
                    
        $form = $this->createForm(VehiculeType::class , $vehicule , ["label" => "modifier"]);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $em->persist($vehicule);
            $em->flush();
            return $this->redirectToRoute("index_vehicules");
        }
        return $this->render("vehicule/update.html.twig", ["form" => $form]);
    }

    #[Route(path : "/delete/{id}", name: "delete_vehicule")]
    public function delete_vehicule(int $id, VehiculeRepository $vehiculeRepository, EntityManagerInterface $em){
        $vehicule = $vehiculeRepository->findOneBy(["id" => $id]);
        $em->remove($vehicule);
        $em->flush();
        return $this->redirectToRoute("index_vehicules");
    }
}