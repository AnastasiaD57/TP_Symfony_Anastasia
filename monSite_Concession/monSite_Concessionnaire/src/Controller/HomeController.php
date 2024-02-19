<?php

namespace App\Controller;

use App\Repository\VehiculeRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function home( VehiculeRepository $vehiculeRepository ): Response
    {
        $vehicules = $vehiculeRepository->findAll();
        return $this->render('home/index.html.twig', [
            'vehicules' => $vehicules,
        ]);
    }

    #[Route('/legal', name: 'legal')]
    public function legal()
    {
        return $this->render('legal/index.html.twig');
    }
}
