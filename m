Return-Path: <linux-gpio+bounces-23201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DCB0373E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 08:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8D7F168C96
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 06:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF2C21B192;
	Mon, 14 Jul 2025 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNjvyRYw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4879BE4A;
	Mon, 14 Jul 2025 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474968; cv=none; b=dDg5uoW0RghWCDbNpSOeSzyeHOiG+iP5bW5KD9aslVfZfHLPoYNdqixghzkWsPpPdmGz06bcF8b5CsOPYPF60mnp4XJ2ErK7BARKMtVMj1aalDDx45GA+r2JV6Qzd9X80pcOONgWwobHl6yanqLTZweTVZWthWbtwGjYMQxq1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474968; c=relaxed/simple;
	bh=COauMq+Zx3uq569P2RZsqh2PKi46abFL9EqFFIlngoY=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=HQP9Ti2geasXd6f0CtdbA6ERA4ghdI0T0JVgo8xjzf3ENQO4V1PRoxq/xDgfhmUVH2lAC7S3iF6xgvvpcx3cDQCZ327Q76LZciCYeHS23Or2td+VaD+Atvi+SWCnuom1mC/9Biutp1dkcNUYZGuWDFstVihLU20EWjx6hXrZgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNjvyRYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A7EC4CEED;
	Mon, 14 Jul 2025 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474968;
	bh=COauMq+Zx3uq569P2RZsqh2PKi46abFL9EqFFIlngoY=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=MNjvyRYw7yHD9P+QQydki15ecx2DgosCaUdFKTxhS4R9/uKCYx6aAJHX5vdqsTaRi
	 CuZ8A/4wNDMmM56Mccrox6PBjtg88wiyvLCnVQRYq1hDXA2ViQ+5d6kpvlV6QkoW4B
	 QDEyRVnWiSQ542TK0kX0miTfj5lG/00suwBTogExssr8nExAKRIbkvT0AQGicPH5CV
	 2nuuguTQkpxgV/Icg7tVXi3DLoLjphI9Qki4f0GIRJOB7SSvK8fToKxV3bAbm+DtqG
	 NwZddqh8XzKgz9qSN0f/7NxwK6QbSV0KzBVYdraCMoYwhOHVkTk/KczVbryo+38IfT
	 gcc58bp2+1mCA==
Content-Type: multipart/signed;
 boundary=f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Jul 2025 08:36:03 +0200
Message-Id: <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
Cc: "Ioana Ciornei" <ioana.ciornei@nxp.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo"
 <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Lunn"
 <andrew@lunn.ch>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
 <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
 <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
In-Reply-To: <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jul 11, 2025 at 8:06 PM CEST, Linus Walleij wrote:
> On Fri, Jul 11, 2025 at 7:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> > On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> > > On Wed, Jul 9, 2025 at 5:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > >
> > > > This is not my area, so i will deffer to the GPIO
> > > > Maintainers. However, it is not clear to me what get_direction()
> > > > should return.
> > >
> > > This callback should return the current direction as set up
> > > in the hardware.
> > >
> > > A major usecase is that this is called when the gpiochip is
> > > registered to read out all the current directions of the GPIO
> > > lines, so the kernel has a clear idea of the state of the
> > > hardware.
> > >
> > > Calling this should ideally result in a read of the status from
> > > a hardware register.
> >
> > O.K, so completely different to what is proposed in this patch.
> >
> > Maybe you can suggest a better name.
>
> If the hardware only supports one direction, then .get_direction()
> should return that direction.
>
> What the patch does is to
> read the direction from the hardware and use that in the
> set_direction() callback, as if all regmapped hardware in the
> world had fixed direction, that's wrong.
>
> I'd just add something custom in gpio-regmap if this is
> something reoccuring in regmapped GPIO drivers.
>
> bool is_fixed_direction(struct gpio_regmap *gpio, unsigned int offset)
>
> or so?
>
> Then the core can use is_fixed_direction() together
> with gpio_get_direction() to check if it can do
> a certain set_direction().
>
> Pseudocode:
>
> mydir =3D get_direction(line)
> if (is_fixed_direction(line) && (mydir !=3D requested_dir)
>   return -ERROR;

You don't need a .is_fixed_direction(). You can deduce that if only
.get_direction() is set in the gpio-regmap config.

mydir =3D get_direction(line)
if (!config->set_direction && mydir !=3D requested_dir)
  return -ERROR;

That or either Andrew's idea of setting a bitmap within the
gpio-regmap config which already tells the gpio-regmap core and then
amend gpio_regmap_get_direction() to return that fixed direction if
that bitmap is not NULL.

I'm fine with both.

-michael

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHSlVBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jQ+QF/Sh9YipYQ+NuecbEAX6M3aMt220c2QO/i
BcZFdXjO9B54HMg0xV402FYHoqqVUzMBAXwPLqgnOoKN+UW5OzisXT/wp8tx42vH
5YcYBv+I9kZuCMxqUDqGJQrewv4OJdbajA4=
=oUeW
-----END PGP SIGNATURE-----

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd--

