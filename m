Return-Path: <linux-gpio+bounces-1125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DC80A565
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 15:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938DF1C20D87
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EC31DFD7;
	Fri,  8 Dec 2023 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Nf2hjyDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3E41738
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 06:26:04 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8D841BF205;
	Fri,  8 Dec 2023 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702045563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Cul0TBbYEtzC30+f9W9k6p8Gg5s0PWpQ/0hISXTeEs=;
	b=Nf2hjyDv5jZZ0Z7zW3aVU0c2y4t8XlktF4v6Y65uVD71BrNWpW0bB0aPgM6uymaPLp4j7b
	TciIDpLhEPbhrv3bZHjcTiJ4c4QWuiUbTRqEG7Cf9+ECfkuJAARArDBtvO7oApB4TeIBdz
	T+shsHb19v0ZWfzhvT/19CIaZ6OWdMkgDegjnXrolcROEufTZ0qVJ2J+nslg7VtlVGamE/
	2BsjNj07kAevyoE7L5gSipBRm1Lsh4Tc8D7Tq+jTtfumm79QYpWL1p470I7Qt+2JOArmOj
	YN6LQ22mN0TDNcgaMUUQmMdVpzW9nWwl5JVLssfBbJsWXL7yGMdyKZSDK6Op6g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>,
 soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
In-Reply-To: <20231101123806.4d258ddb@dellmb>
References: <20231026161803.16750-1-kabel@kernel.org>
 <20231026161803.16750-4-kabel@kernel.org> <20231101123806.4d258ddb@dellmb>
Date: Fri, 08 Dec 2023 15:26:02 +0100
Message-ID: <87il58epol.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Marek,

> On Thu, 26 Oct 2023 18:17:59 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
>> +	mcu->gc.request =3D omnia_gpio_request;
>> +	mcu->gc.get_direction =3D omnia_gpio_get_direction;
>> +	mcu->gc.direction_input =3D omnia_gpio_direction_input;
>> +	mcu->gc.direction_output =3D omnia_gpio_direction_output;
>> +	mcu->gc.get =3D omnia_gpio_get;
>> +	mcu->gc.get_multiple =3D omnia_gpio_get_multiple;
>> +	mcu->gc.set =3D omnia_gpio_set;
>> +	mcu->gc.set_multiple =3D omnia_gpio_set_multiple;
>> +	mcu->gc.init_valid_mask =3D omnia_gpio_init_valid_mask;
>> +	mcu->gc.can_sleep =3D true;
>> +	mcu->gc.names =3D omnia_mcu_gpio_templates;
>> +	mcu->gc.base =3D -1;
>> +	mcu->gc.ngpio =3D ARRAY_SIZE(omnia_gpios);
>> +	mcu->gc.label =3D "Turris Omnia MCU GPIOs";
>> +	mcu->gc.parent =3D dev;
>> +	mcu->gc.owner =3D THIS_MODULE;
>
> Sigh. I will need to add a custom of_xlate here that accepts 3 cells
> instead of 2. The reason is that Pali prepared U-Boot code last year to
> patch reset-gpios into pcie nodes if MCU node is present in the
> devicetree, and back then we decided that the binding should be
> 3-celled:
>   reset-gpios =3D <&mcu BANK GPIO FLAGS>;
>
> So now the pcie controllers do not work because OF cannot give proper
> GPIOs.
>
> I will fix this in v5.

I was reviewing the seris in order to apply it, but I didn't find your
v5 in the mainling list. Did you send it ?

Regards,

Gregory

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

