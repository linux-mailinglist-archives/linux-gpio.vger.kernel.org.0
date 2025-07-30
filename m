Return-Path: <linux-gpio+bounces-23889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A86B15A33
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 10:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE473BCF9E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 08:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D921F25A33A;
	Wed, 30 Jul 2025 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O0xPZhAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FF2253A5;
	Wed, 30 Jul 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863024; cv=none; b=d3puOyJWH5ZkMmzvvCUgCZdNT07k7MmiCjF+ZM654nli2iLQRYV6m+rxYP6Xzg3He8tl6vvFW4EJ++C6YhI1E7Ft3fkEe9KZNQLhXUMkqI3pg8oD0KJllha/1vBYgHcRkKChN9ZFIMV0wKrm5n7d9t4y2V7r95YIpZbiSl4NITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863024; c=relaxed/simple;
	bh=YBq0SKGRnPswqt43Y1t+cjiSBNY3A+c2eONjz2IpXrY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkBBB6omSCeq5coBBJT/KuW2cu77rz/SgmGTI4/TXyv1/hqFZCJpLPd5Ki8O0iu52g5ZBGurT6QPWHij2vmQiVl7phlbGcJt7a0N75Ul5ZeHFkJCVYSjvOIxesHTWz4tXc3hZwbh0MhzyCsYoA5jXIfSlPF1TAEVrBKxeHKpu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O0xPZhAj; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9796B4447C;
	Wed, 30 Jul 2025 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753863010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TthCFgIH8wLI4dLCfe2QLJEfDqNxOUUkBOW1DRbUqI=;
	b=O0xPZhAj1T/Oea/AcfHYfAUaTrBNKebzhDCnJT+5StWS+Pxqm3+InAr5J9Xsd60UVzS+JF
	3mjTU9fDV7DT6vMypFHPSWYnNAuc6TFo8AWo5Z5MorZtnTsXXhafADjfLcQB9dzdA5gfDt
	b5P2khvf98J3XbZmpl33trAOyNVEMxlvVCj9D9nmkPoRNJdgTxSqKL4xlCH27YDTSQM3UI
	8bVhF6PrZS2DWbM5VxT1y7+aY+jDAY1bx2DkeCIShjJUwyxCqUKlpxIIBaZ5tSQO2By6kw
	dWGEPEMxn/MD4AZBpCsSBv2zbq97df3gLFsHtC6xT+ExFHEfgL75AjOJSy+jJQ==
Date: Wed, 30 Jul 2025 10:10:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20250730101007.314d88ce@bootlin.com>
In-Reply-To: <aIYHD5SEAqQNfDjD@ninjato>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
	<aIYHD5SEAqQNfDjD@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvg
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

On Sun, 27 Jul 2025 13:01:35 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Hervé,
> 
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.  
> 
> Yes, way cool! Very happy to see this upstreaming effort!
> 
> > The first two patches of the series add support for GPIO (binding update
> > and device-tree description).  
> 
> So, I started simple and used the first two patches to enable LEDs on
> pins 92 and 93 on my board. I added this on top of patch 1+2:
> 
> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> index 3258b2e27434..4790ffad578f 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -185,6 +185,12 @@ fixed-link {
>  	};
>  };
>  
> +&gpio1 {
> +	pinctrl-0 = <&pins_gpio1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &i2c2 {
>  	pinctrl-0 = <&pins_i2c2>;
>  	pinctrl-names = "default";
> @@ -256,6 +262,11 @@ pins_cpld: pins-cpld {
>  			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
>  	};
>  
> +	pins_gpio1: pins-gpio1 {
> +		pinmux = <RZN1_PINMUX(92, RZN1_FUNC_GPIO)>,	/* GPIO1B[23] */
> +			 <RZN1_PINMUX(93, RZN1_FUNC_GPIO)>;	/* GPIO1B[24] */
> +	};
> +
>  	pins_eth3: pins_eth3 {
>  		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
>  			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>
> 
> to my board dts. The controller gets probed but I can't control the
> LEDs. Neither with exported GPIOs (via sysfs) nor with a dedicated LED
> node. Am I missing something obvious? The LEDs are attached to PL_GPIO92
> and PL_GPIO93 which are mapped to GPIO1b[23] and GPIO1b[24]. That seems
> to be in accordance with the datasheet. I hope I just overlooked
> something simple. Some outputs, first /sys/kernel/debug/gpio:
> 
> 	...
> 	gpiochip1: GPIOs 552-583, parent: platform/5000c000.gpio, 5000c000.gpio:
> 
> 	gpiochip2: GPIOs 584-615, parent: platform/5000c000.gpio, 5000c000.gpio:
> 	 gpio-608 (                    |sysfs               ) out hi 
> 
> And /sys/kernel/debug/pinctrl/40067000.pinctrl/pinmux-pins:
> 
> 	Pinmux settings per pin
> 	Format: pin (name): mux_owner gpio_owner hog?
> 	...
> 	pin 92 (pl_gpio92): 5000c000.gpio (GPIO UNCLAIMED) function pins-gpio1 group pins-gpio1
> 	pin 93 (pl_gpio93): 5000c000.gpio (GPIO UNCLAIMED) function pins-gpio1 group pins-gpio1
> 
> I wonder about the "(GPIO UNCLAIMED)" a little? How do you use it on
> your board?
> 

Strange, I have a LED working on my side.

My LED is connected to gpio0b[9] (GPIO17).

I just used:
--- 8< ---
	gpio_leds {
		compatible = "gpio-leds";

		led_1g: led-0 {
			label = "led_1g";
			gpios = <&gpio0b 9 GPIO_ACTIVE_HIGH>;
		};
	};

	&gpio0 {
		pinctrl-0 = <&pins_gpio0>;
		pinctrl-names = "default";
		status = "okay";
	};

	&pinctrl{
		/*
		 * I have other pins used as GPIOs but my led is :
		 *    RZN1_PINMUX(17, RZN1_FUNC_GPIO)
		 */

		pins_gpio0: pins_gpio0 {
			pinmux = <
				RZN1_PINMUX(13, RZN1_FUNC_GPIO)	/* GPIO0B[7] */
				RZN1_PINMUX(14, RZN1_FUNC_GPIO)	/* GPIO0B[8] */
				RZN1_PINMUX(15, RZN1_FUNC_GPIO)	/* GPIO0A[6] */
				RZN1_PINMUX(16, RZN1_FUNC_GPIO)	/* GPIO0A[7] */
				RZN1_PINMUX(17, RZN1_FUNC_GPIO)	/* GPIO0B[9] */
				RZN1_PINMUX(18, RZN1_FUNC_GPIO)	/* GPIO0B[10] */
				RZN1_PINMUX(22, RZN1_FUNC_GPIO)	/* GPIO0A[9] */
				RZN1_PINMUX(23, RZN1_FUNC_GPIO)	/* GPIO0B[13] */
			>;
			drive-strength = <6>;
			bias-disable;
		pins_gpio0_pullup {
			pinmux = <
				RZN1_PINMUX(25, RZN1_FUNC_GPIO)	/* GPIO0B[14] - A70CI_EN_N */
				RZN1_PINMUX(26, RZN1_FUNC_GPIO)	/* GPIO0B[15] - A71CH_EN_N */
				RZN1_PINMUX(27, RZN1_FUNC_GPIO)	/* GPIO0A[11] - TRUST_M_EN_N */
				RZN1_PINMUX(28, RZN1_FUNC_GPIO)	/* GPIO0A[12] - TRUST_X_EN_N */
				RZN1_PINMUX(32, RZN1_FUNC_GPIO)	/* GPIO0B[19] - STMA100_EN_N*/
			>;
			drive-strength = <6>;
			bias-pull-up;
		};

	};
--- 8< ---

Of course with:
  CONFIG_GPIO_DWAPB=y
  CONFIG_LEDS_CLASS=y
  CONFIG_LEDS_GPIO=y

My led is accessible from the user-space without any issue:
  echo 255 > /sys/class/leds/led_1g/brightness

I have checked /sys/kernel/debug/pinctrl/40067000.pinctrl/pinmux-pins and
I have also the "(GPIO UNCLAIMED)":
	...
	pin 12 (pl_gpio12): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 13 (pl_gpio13): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 14 (pl_gpio14): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 15 (pl_gpio15): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 16 (pl_gpio16): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 17 (pl_gpio17): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 18 (pl_gpio18): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 19 (pl_gpio19): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 20 (pl_gpio20): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 21 (pl_gpio21): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 22 (pl_gpio22): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 23 (pl_gpio23): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0
	pin 24 (pl_gpio24): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 25 (pl_gpio25): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0_pullup
	pin 26 (pl_gpio26): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0_pullup
	pin 27 (pl_gpio27): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0_pullup
	pin 28 (pl_gpio28): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0_pullup
	pin 29 (pl_gpio29): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 30 (pl_gpio30): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 31 (pl_gpio31): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	pin 32 (pl_gpio32): 5000b000.gpio (GPIO UNCLAIMED) function pins_gpio0 group pins_gpio0_pullup
	pin 33 (pl_gpio33): (MUX UNCLAIMED) (GPIO UNCLAIMED)
	...

When you described the LED on your side, did you reference the GPIO using &gpio1b
for instance gpios = <&gpio1b 23 GPIO_ACTIVE_HIGH>;

For GPIO accesses from user space I used gpioget/gpioset tools from libgpiod
without any issues to read/write a GPIO.

Best regards,
Hervé

