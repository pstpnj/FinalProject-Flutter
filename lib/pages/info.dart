import 'package:flutter/material.dart';

import '../preset/nav.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PresetAppBar(),
      drawer: const PresetDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'KOSEN - KMITL Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Logo image
              Image.asset(
                'assets/kosen.png', // Ensure this path is correct
                width: 150, // Adjust the size as needed
                height: 150,
              ),
              const SizedBox(height: 16),
              // Description text
              const Text(
                ' The KOSEN Institute of King Mongkut\'s Institute of Technology Ladkrabang (KOSEN - KMITL) or KOSEN Institute of KMITL is an educational institution established under the project to develop manpower in engineering, technology and innovation, supporting investment and increasing the capacity of the industrial sector in the country and the region, which was established by the Cabinet resolution on December 4, 2018, with the Office of the Basic Education Commission and the Institute for the Promotion of Teaching Science and Technology as the project managers as proposed by the Ministry of Education.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                ' The project to develop manpower in engineering, technology and innovation is in line with the Thailand 4.0 policy, which supports investment and increases the capacity of the industrial sector in the country and the region, especially industries in the Eastern Economic Corridor (EEC) and the development of manpower in science, technology and innovation to have high knowledge and potential in order to play an important role in helping to promote target industries, both existing industries with potential and future industries, and also playing an important role in driving the country with innovative and creative innovations. In addition to increasing the quality personnel in the group of practical engineers to meet the demand, it can also attract foreign companies, such as Japan, to invest more in Thailand. Therefore, the Thai government has signed an agreement with the Japanese government under the Japanese government loan program. Providing educational and academic support in such areas to enable the project to achieve its objectives.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 16),
            const Text(
              ' The KOSEN Institute of KMITL is under the supervision of the Thai KOSEN Institute, which is chaired by the Minister of Education, in order for the operations to be in accordance with the agreement between the Thai and Japanese governments. However, in order for the operations of the KMITL KOSEN Institute to comply with the Higher Education Act, King Mongkut\'s Institute of Technology Ladkrabang has established the KOSEN Institute of KMITL as a unit of the King Mongkut\'s Institute of Technology Ladkrabang, under the supervision of the KOSEN Institute Board of Directors.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              ' In addition, in order for the academic operations of the KMITL KOSEN Institute to be in accordance with the objectives approved by the Cabinet, King Mongkut\'s Institute of Technology Ladkrabang has entered into a cooperation agreement with the National Institute of Technology (NIT), Japan, to develop the curriculum of the KMITL KOSEN Institute to be in accordance with the MCC (Main Core Curriculum), which is the core curriculum of the KOSEN Institute in Japan. In order for the teaching and learning of the KMITL KOSEN Institute to be in accordance with the established curriculum, NIT has sent academic experts to teach as models. and prepare training and develop Thai teaching personnel to have experience and expertise in mathematics, science, engineering and technology according to the model of the Kosen Institute of Japan.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
