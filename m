Return-Path: <linux-gpio+bounces-1128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06680A75E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 16:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6131F21216
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B230350;
	Fri,  8 Dec 2023 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atDuiT6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A230342
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 15:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0245C433C7;
	Fri,  8 Dec 2023 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702049281;
	bh=+emQJB/tEGBjHEN1UpmS9MKnHX7wZJOTj7iUTxN8X1Q=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=atDuiT6D3X2qeC3UUj9oUCSxHEdP6lvF58AdQ0gecAusCBkHRrbcq9iZ1UNOt/Hup
	 XwgaNSksSTD0OCS7H1NOp46LZj519xC01HJE1Zn7l7Q9wrOJQyDqZfusdf3nQXFQEf
	 9mKXHGxPIj2B4Ql02FlP85keHCenzMRNqB9B9IENz9HSA7PpRI2zz0x4h/t2BBqXfm
	 FL6p11BfX8PlmSgnXamV/1w9fmdL5M+RYZsMrK9RJFkenqVe1ZDGC5ohbKyIZiSPC7
	 gBgaswtNLv4hS+Hgf8/t3Qys0jtjrkcWYQHbLCeLJfyDmCikzVZglSgzd4Y6SnVXdN
	 YOlghkbsCSTdw==
Date: Fri, 8 Dec 2023 16:27:56 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy
 Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20231208162756.1b2fa870@dellmb>
In-Reply-To: <87il58epol.fsf@BL-laptop>
References: <20231026161803.16750-1-kabel@kernel.org>
	<20231026161803.16750-4-kabel@kernel.org>
	<20231101123806.4d258ddb@dellmb>
	<87il58epol.fsf@BL-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 08 Dec 2023 15:26:02 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello Marek,
>=20
> > On Thu, 26 Oct 2023 18:17:59 +0200
> > Marek Beh=C3=BAn <kabel@kernel.org> wrote:
> > =20
> >> +	mcu->gc.request =3D omnia_gpio_request;
> >> +	mcu->gc.get_direction =3D omnia_gpio_get_direction;
> >> +	mcu->gc.direction_input =3D omnia_gpio_direction_input;
> >> +	mcu->gc.direction_output =3D omnia_gpio_direction_output;
> >> +	mcu->gc.get =3D omnia_gpio_get;
> >> +	mcu->gc.get_multiple =3D omnia_gpio_get_multiple;
> >> +	mcu->gc.set =3D omnia_gpio_set;
> >> +	mcu->gc.set_multiple =3D omnia_gpio_set_multiple;
> >> +	mcu->gc.init_valid_mask =3D omnia_gpio_init_valid_mask;
> >> +	mcu->gc.can_sleep =3D true;
> >> +	mcu->gc.names =3D omnia_mcu_gpio_templates;
> >> +	mcu->gc.base =3D -1;
> >> +	mcu->gc.ngpio =3D ARRAY_SIZE(omnia_gpios);
> >> +	mcu->gc.label =3D "Turris Omnia MCU GPIOs";
> >> +	mcu->gc.parent =3D dev;
> >> +	mcu->gc.owner =3D THIS_MODULE; =20
> >
> > Sigh. I will need to add a custom of_xlate here that accepts 3 cells
> > instead of 2. The reason is that Pali prepared U-Boot code last year to
> > patch reset-gpios into pcie nodes if MCU node is present in the
> > devicetree, and back then we decided that the binding should be
> > 3-celled:
> >   reset-gpios =3D <&mcu BANK GPIO FLAGS>;
> >
> > So now the pcie controllers do not work because OF cannot give proper
> > GPIOs.
> >
> > I will fix this in v5. =20
>=20
> I was reviewing the seris in order to apply it, but I didn't find your
> v5 in the mainling list. Did you send it ?

Hi Gregory, no I haven't yet. I was on a vacation and before I had to
work on some other issues. Hopefully I will be able to finish it within
the month. I will ping you then.

Thank you.

Marek

