import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? name;
  final String? location;
  final LatLng? Location;
  final String? price;
  final String? description;
  final String? manager;

  MapMarker( {
    this.description,
    this.manager,
    required this.image,
    required this.name,
    required this.location,
    required this.Location,
    required this.price,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'A. Osei Tuto General motors',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322321, -2.312034),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Discover the ultimate destination for automotive care and quality spare parts. Our auto repair shop combines expert technicians with state-of-the-art equipment to handle everything from routine maintenance to major repairs. We're your reliable partner, ensuring your vehicle's peak performance. Additionally, our extensive spare parts inventory includes genuine, high-quality components for various makes and models. Rest easy knowing that your car receives the best care, and we have the parts you need to keep it running smoothly. Experience top-notch service and premium spare parts – your vehicle deserves nothing less."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Abrantee Washing Bay ',
      location: 'Sunyani Fiapre',
      Location: LatLng(7.359749, -2.350498),
      price: '20-200',
      manager: 'washingBay@manager.com',
      description: "Experience the ultimate car pampering at our state-of-the-art washing bay. We pride ourselves on delivering a spa-like treatment for your vehicle. Our automated and hand-detailing services offer a range of options to suit your car's needs. From thorough exterior washes that remove dirt and grime to meticulous interior cleaning that restores that new car feel, we've got it covered. We use eco-friendly, high-quality products to protect your car's finish and maintain its value.Our trained staff ensures attention to every detail, from tire shine to window sparkle. We offer convenient packages, including waxing, polishing, and undercarriage cleaning. Plus, we are committed to water conservation and environmentally responsible practices. Your car deserves the best, and we provide it. Treat your vehicle to the luxury it deserves at our washing bay."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Angola Auto Glass',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322321, -2.312034),
      price: '100-3000',
      manager: 'windsheild@manager.com',
      description: "Welcome to our windshield and windows shop, where clarity and safety meet style. We specialize in providing top-quality replacements and repairs for all types of automotive glass. Our experienced technicians ensure precision installations and swift repairs to keep you safe on the road. With a wide range of glass options and competitive pricing, we offer both function and aesthetics. Trust us for crystal-clear vision, expert craftsmanship, and a commitment to your satisfaction. Your vehicle's windows are our expertise; your safety is our priority."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Anointing auto shop',
      location: 'Rex',
      Location: LatLng(7.32251, -2.312034),
      price: '10-150',
      manager: 'manageryaa@shop.com',
      description: "Discover the ultimate destination for automotive care and quality spare parts. Our auto repair shop combines expert technicians with state-of-the-art equipment to handle everything from routine maintenance to major repairs. We're your reliable partner, ensuring your vehicle's peak performance. Additionally, our extensive spare parts inventory includes genuine, high-quality components for various makes and models. Rest easy knowing that your car receives the best care, and we have the parts you need to keep it running smoothly. Experience top-notch service and premium spare parts – your vehicle deserves nothing less."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Archico Vehicle Air Condition Service',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322886, -2.314329),
      price: '100-1500',
      manager: 'engineServices@manager.com',
      description: "Stay cool and comfortable with our expert air conditioning service. Our certified technicians are dedicated to ensuring your vehicle's AC system functions at its best, delivering optimal cooling performance on scorching days. We offer comprehensive AC diagnostics, repairs, and maintenance, addressing issues from refrigerant leaks to faulty compressors. Experience a refreshing driving environment with our swift and reliable service. Don't sweat the heat; trust us to keep your AC in top shape, so you can enjoy a pleasant journey every time you hit the road."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Car care Service',
      location: 'Sunyani Magazine',
      Location: LatLng(7.329979, -2.309949),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Discover excellence in automotive care at our shop. With a passion for precision and a commitment to quality, our skilled mechanics are your trusted partners for all auto needs. From routine maintenance to intricate repairs, we deliver efficient and reliable service. We prioritize your safety on the road. Visit us for expert diagnostics, transparent pricing, and a friendly, customer-focused experience. Your vehicle is in good hands here, where expertise meets integrity."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Engine Master Services',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322489, -2.314373),
      price: '100-1500',
      manager: 'engineServices@manager.com',
      description: "Revitalize your vehicle's heart with our precision engine service. Our skilled technicians provide thorough diagnostics, repairs, and maintenance to keep your engine running smoothly and efficiently. We address issues ranging from minor tune-ups to major overhauls, ensuring optimal performance and fuel efficiency. With state-of-the-art equipment and expertise, we breathe new life into your vehicle's powerplant. Trust us to deliver dependable and timely engine service, because your journey starts with a healthy engine. Drive with confidence, knowing your vehicle's heart is in capable hands."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Forsauto Diagnostic and parts centre',
      location: 'Sunyani Magazine',
      Location: LatLng(7.325134, -2.311677),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Our auto repair shop is your go-to destination for top-notch vehicle maintenance and repairs. Our team of experienced mechanics is dedicated to keeping your car running smoothly. We stock a wide range of high-quality spare parts, ensuring quick and efficient repairs. Whether it's routine maintenance or major fixes, we've got you covered. We take pride in delivering reliable service and premium spare parts to keep you safely on the road. Trust us with your vehicle, and experience excellence in automotive care."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Eusbet Tyre and Wheels services',
      location: 'Sunyani',
      Location: LatLng(7.339942, -2.336878),
      price: '50-2000',
      manager: 'wheels@manager.com',
      description: "Step into our tire and wheels shop, your destination for superior traction and style on the road. We offer a wide selection of top-tier tires and custom wheels to elevate your vehicle's performance and aesthetics. Our knowledgeable staff provides expert advice and professional installation, ensuring a perfect fit for your car. From all-weather tires to stunning rims, we cater to every need and preference. Drive with confidence, whether on the open highway or city streets, knowing you have the best tires and wheels in town, backed by our commitment to excellence."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Forsauto Diagnostic and parts centre',
      location: 'Sunyani Magazine',
      Location: LatLng(7.325134, -2.311677),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Our auto repair shop is your go-to destination for top-notch vehicle maintenance and repairs. Our team of experienced mechanics is dedicated to keeping your car running smoothly. We stock a wide range of high-quality spare parts, ensuring quick and efficient repairs. Whether it's routine maintenance or major fixes, we've got you covered. We take pride in delivering reliable service and premium spare parts to keep you safely on the road. Trust us with your vehicle, and experience excellence in automotive care."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Fashion Car Spraying',
      location: 'Sunyani Magazine',
      Location: LatLng(7.320768, -2.310891),
      price: '300-3000',
      manager: 'painting@manager.com',
      description: "Welcome to our premier car spraying shop, where we turn your vehicle into a masterpiece of automotive artistry. Our skilled craftsmen specialize in precision painting and refinishing, using the latest technology and top-quality materials to transform your car's appearance.Whether you desire a flawless factory finish, a custom color, or intricate detailing, we deliver stunning results that exceed your expectations. We handle everything from minor touch-ups to full-body repaints, restoring your vehicle's beauty and protecting it from the elements.At our shop, we combine expertise with creativity, offering a range of finishes, including gloss, matte, metallic, and pearl. Trust us to enhance your car's aesthetics and value with our meticulous car spraying service, where every detail counts."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Frimboat Motors',
      location: 'Sunyani Magazine',
      Location: LatLng(7.324689, -2.311916),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Your trusted auto repair shop, offering expert diagnostics and skilled mechanics for all your vehicle needs. We provide timely service, from routine maintenance to complex repairs, ensuring your vehicle runs smoothly and safely."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Goil filling Station Tyre services',
      location: 'Sunyani',
      Location: LatLng(7.326449, -2.318992),
      price: '30-1500',
      manager: 'wheels@manager.com',
      description: "Roll into our tire and wheel shop for a smoother ride and enhanced performance. We offer a wide selection of top-quality tires, rims, and wheels to suit your vehicle and style. Our experienced team provides expert tire installation, balancing, and alignment services, ensuring optimal safety and handling. Whether you seek all-season, performance, or off-road tires, we have the perfect fit for you. Elevate your driving experience with our range of stylish rims and custom wheel options. Visit us for precision, reliability, and personalized service, because your journey deserves the best."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Home of Car Sprays',
      location: 'Sunyani Magazine',
      Location: LatLng(7.319909, -2.311467),
      price: '300-3000',
      manager: 'painting@manager.com',
      description: "Welcome to our car spraying shop, where we turn your automotive dreams into vibrant reality. Our skilled team of professional painters and craftsmen employ cutting-edge techniques and premium-quality paints to transform your vehicle. Whether you desire a flawless factory finish, a custom color scheme, or intricate designs, we've got the expertise to make it happen. We pay meticulous attention to every detail, from surface preparation to the final clear coat, ensuring a stunning, durable finish that stands the test of time. Trust us to breathe new life into your vehicle's appearance. Drive out of our shop with a car that not only performs but also turns heads with its immaculate and personalized finish."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Iron Man Car Wash Bay',
      location: 'Sunyani Fiapre',
      Location: LatLng(7.359690, -2.350612),
      price: '20-300',
      manager: 'washingBay@manager.com',
      description: "Step into our washing bay and experience the epitome of automotive cleanliness and care. Our state-of-the-art facility is designed to rejuvenate your vehicle, inside and out. Our dedicated team of skilled professionals uses eco-friendly, high-quality products to ensure your vehicle sparkles like new.From exterior washes that eliminate dirt, grime, and road debris to meticulous interior detailing that restores that new car feeling, we pamper your ride. Our services extend beyond aesthetics; we protect your investment with treatments like waxing and ceramic coating, guarding against the elements and preserving your vehicle's finish."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'KessB auto parts',
      location: 'Sunyani Magazine',
      Location: LatLng(7.324032, -2.311832),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "We stock a wide range of high-quality spare parts, ensuring quick and efficient repairs. Whether it's routine maintenance or major fixes, we've got you covered. We take pride in delivering reliable service and premium spare parts to keep you safely on the road. Trust us with your vehicle, and experience excellence in automotive care."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Master Abu Cars Spraying Shop',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322536, -2.311949),
      price: '300-3000',
      manager: 'painting@manager.com',
      description: "Welcome to our car spraying shop, where transformation meets craftsmanship. We are dedicated to enhancing your vehicle's aesthetics and protecting its finish. Our skilled technicians use the latest techniques and top-quality paints to ensure a flawless and long-lasting finish. Whether you desire a color change, paint restoration, or custom detailing, we tailor our services to meet your vision.We prioritize precision and attention to detail, from surface preparation to the final clear coat. Trust us to revive your vehicle's appearance and protect it from the elements. With our commitment to excellence, your car will leave our shop with a showroom-quality finish that turns heads and preserves its value. Discover the art of car spraying with us."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Master Kramo Auto Electrical services',
      location: 'Sunyani Magazine',
      Location: LatLng(7.322560, -2.310273),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Discover our auto repair shop, where expertise meets excellence. Our certified technicians provide comprehensive services, from routine maintenance to complex diagnostics and repairs. With cutting-edge equipment and a commitment to quality, we ensure your vehicle performs at its best. We prioritize transparency, offering fair pricing and clear communication. Your convenience is paramount, so we provide efficient service and strive for same-day repairs whenever possible. Trust us for all your automotive needs, and experience reliable, hassle-free solutions that keep you on the road with confidence."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Master Yahaya Services',
      location: 'Sunyani Magazine',
      Location: LatLng(7.328246, -2.311005),
      price: '100-1500',
      manager: 'engineServices@manager.com',
      description: "Our skilled technicians specialize in diagnosing, repairing, and maintaining engines of all makes and models. Whether you require routine maintenance, fuel system cleaning, or complex engine repairs, we've got you covered. We use advanced diagnostics and high-quality parts to ensure your engine runs smoothly and efficiently. Trust us to maximize your vehicle's power, fuel efficiency, and longevity. Experience the difference in your driving with our expert engine service, where excellence meets reliability."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Master Yakubu Quality Glass Centre',
      location: 'Sunyani Magazine',
      Location: LatLng(7.328206, -2.311053),
      price: '100-3000',
      manager: 'windsheild@manager.com',
      description: "Welcome to Master Yakubu Quality Glass shop, where clarity meets safety. We specialize in providing top-quality replacements and repairs for your vehicle's glass components. Our skilled technicians ensure precision installations and efficient fixes, protecting you from the elements and maintaining visibility on the road. We offer a wide range of glass options, from standard to advanced, ensuring a perfect fit for your needs. Trust us to keep your view crystal clear and your vehicle secure. Drive confidently with our commitment to excellence in auto glass "
          "services."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Nana Amoako Engines',
      location: 'Sunyani Magazine',
      Location: LatLng(7.321805, -2.313457),
      price: '100-1500',
      manager: 'engineServices@manager.com',
      description: "Elevate your vehicle's performance with our precision engine service. Our skilled mechanics are dedicated to optimizing your engine's power, efficiency, and longevity. From routine maintenance to complex repairs, we tackle issues big and small. We use cutting-edge diagnostics and high-quality parts to ensure your engine runs at peak performance. Trust us to keep your vehicle reliable and responsive, so you can enjoy a smooth and powerful ride. Your engine is the heart of your vehicle, and we're here to keep it healthy and strong."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'OSTY Enterprise',
      location: 'Sunyani Magazine',
      Location: LatLng(7.3229830, -2.3118878),
      price: '50-500',
      manager: 'generalMaintenance@manager.com',
      description: "Welcome to our auto repair shop and spare parts store, your one-stop destination for all things automotive. Our skilled technicians provide top-notch repair and maintenance services, guaranteeing your vehicle's peak performance. We stock a comprehensive range of high-quality spare parts, ensuring quick and efficient replacements when needed. Whether it's routine maintenance, major repairs, or finding the right part, trust us to keep you on the road safely and reliably. Your satisfaction is our priority."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Perfect Car Spraying Shop',
      location: 'Sunyani Magazine',
      Location: LatLng(7.321555, -2.311941),
      price: '300-3000',
      manager: 'painting@manager.com',
      description: "Transform your vehicle's appearance at our top-notch car spraying shop. Our skilled artisans are passionate about delivering stunning and flawless paintwork. We offer a wide range of colors, finishes, and custom options to suit your style. Using cutting-edge technology and premium paint materials, we ensure a durable and vibrant finish. Whether it's a minor touch-up, a full-body respray, or custom detailing, we pay meticulous attention to every detail. Our goal is to make your vehicle look as good as new, or even better. Drive away with pride, knowing your car has received the finest makeover in town, where precision and creativity converge."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Perfect Washing Bay',
      location: 'Sunyani Fiapre',
      Location: LatLng(7.359519, -2.350466),
      price: '20-300',
      manager: 'washingBay@manager.com',
      description: "At our washing bay, we use environmentally friendly products and water-saving techniques, minimizing our ecological footprint while maximizing your car's shine. Our skilled team pays attention to every detail, from wheel wells to the finest interior nooks and crannies.Trust us with your vehicle's cleanliness, and experience the satisfaction of driving a freshly washed and meticulously detailed car. Your car deserves the best, and that's precisely what we deliver."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'MS.K Windscreens Ent.',
      location: 'Sunyani Magazine',
      Location: LatLng(7.326449, -2.318992),
      price: '70-3500',
      manager: 'windsheild@manager.com',
      description: "Welcome to our premier windshield and windows shop, where clarity and safety are our top priorities. Our expert technicians specialize in repairing and replacing windshields and all types of automotive windows. With state-of-the-art technology and high-quality materials, we ensure crystal-clear visibility and structural integrity for your vehicle. From minor chips to full replacements, we provide fast, reliable service. Trust us to safeguard your journey with precision and professionalism. Drive confidently with our team by your side, delivering transparent solutions for all your glass needs."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Total Services (Quertz)',
      location: 'Sunyani Rex',
      Location: LatLng(7.331883, -2.326371),
      price: '50-1000',
      manager: 'wheels@manager.com',
      description: "Rev up your driving experience at our tire and wheel shop, where performance meets style. We offer a wide selection of top-tier tires, from all-season to high-performance, ensuring safety and traction for every road. Customize your ride with our diverse range of wheels, from classic to cutting-edge designs. Our expert technicians provide tire mounting, balancing, and alignment services with precision. Experience improved handling and aesthetics while driving with confidence. Your journey begins with the perfect set of wheels and tires at our shop, where quality and expertise come together to elevate your ride."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Lucky Auto Shop',
      location: 'Sunyani',
      Location: LatLng(7.327206, -2.321053),
      price: '100-3000',
      manager: 'engineServices@manager.com',
      description: "Our skilled technicians specialize in diagnosing, repairing, and maintaining engines of all makes and models. Whether you require routine maintenance, fuel system cleaning, or complex engine repairs, we've got you covered. We use advanced diagnostics and high-quality parts to ensure your engine runs smoothly and efficiently. Trust us to maximize your vehicle's power, fuel efficiency, and longevity. Experience the difference in your driving with our expert engine service, where excellence meets reliability."),

  MapMarker(
      image: 'assets/splash/autoparts.png',
      name: 'Master Amin Quality Glass Centre',
      location: 'Sunyani',
      Location: LatLng(7.338206, -2.312053),
      price: '100-3000',
      manager: 'windsheild@manager.com',
      description: "Welcome to Master Yakubu Quality Glass shop, where clarity meets safety. We specialize in providing top-quality replacements and repairs for your vehicle's glass components. Our skilled technicians ensure precision installations and efficient fixes, protecting you from the elements and maintaining visibility on the road. We offer a wide range of glass options, from standard to advanced, ensuring a perfect fit for your needs. Trust us to keep your view crystal clear and your vehicle secure. Drive confidently with our commitment to excellence in auto glass "
          "services."),

];
