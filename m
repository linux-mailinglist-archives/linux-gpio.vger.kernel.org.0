Return-Path: <linux-gpio+bounces-7345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96F90375D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 11:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07FFB28D2A8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E505C176221;
	Tue, 11 Jun 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tyr+K7wK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F679C8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096590; cv=none; b=mEI+JMkaHk+s5VA/xdurFotDTjUBWTbctRrUarV8R/PT+IkdvJq91dkI6NErZ0ZhSGOs3CZ0poZreibt36jgGWy9JCOXz5T6+uPghE5cgCJWtgQ5fuk1LUaBogKyL0yvIWRe+B6+G5AVWenn/FRT8mh7g/C3XQ/Oy1i4T4dUsUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096590; c=relaxed/simple;
	bh=6pupuxNHH5CKZWrerrFW3vB0alwZUHacoHBAY/KGubc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JoqQhVKhghvYdK26V8q/MQM/tMM0qUJEMdkfNZ5gOOok1NDhdDsgfQ+8aQf+UEziPDHhaHpm7nITFOm8wn2rx+liUjxOUqas4t4WWSi2JKIWxBzIDdiLfI3fJ8GP7CH8bh47dvA43X+RhIr3HW8niuGRS4uIx2w7vwKCmkfktRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tyr+K7wK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D0C2BD10;
	Tue, 11 Jun 2024 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718096590;
	bh=6pupuxNHH5CKZWrerrFW3vB0alwZUHacoHBAY/KGubc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tyr+K7wKOXzMXW8e/kb6czUcnaSyeXDObMUCOjabfBIwiA01XkFddz5lkFenRHET3
	 ZxwcWeu/fR/lvbNH/dYyiz9xPptuvsvSdBLTlVEn64Jakfm7EpLL+5W3AeY5fqYvZc
	 LRQrMNtJyIz6YpyaMTbPfYfPxJlFWyd1WuGa0uV7MjHEKX+zfCmijkhT4ywuWiBexO
	 ev5SUJcwrIQXKg1HSFibrVgxiSCAtrKXPVN/P9UTuNW63LxOTsRXCwknHxfOwgzVwC
	 71fAHPLQbP+ZeeGI7CNyDXHxk2Xi0JlB5HQTCFypwLWVGfuAWYzgnSFv+4RF6J0MIq
	 Sm7rAQqB+A1nA==
Date: Tue, 11 Jun 2024 11:03:05 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
 <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: how to request gpiochip line which is only valid as an
 interrupt?
Message-ID: <20240611110305.0f0c5b1f@dellmb>
In-Reply-To: <20240610160155.5ca7e0d7@dellmb>
References: <20240610160155.5ca7e0d7@dellmb>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Jun 2024 16:01:55 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Hello Bartosz,
>=20
> I would like to ask you if you could find some time to look at
>=20
>   [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support for
>                   MCU provided TRNG
>=20
>   https://lore.kernel.org/soc/20240605161851.13911-7-kabel@kernel.org/
>=20
> Andy Shevchenko added you to that conversation asking you about how to
> correctly do the following part:
>=20
>   irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
>=20
> I am writing this to give some more light into the problem. What is
> going on:
> - the turris-omnia-mcu driver provides a gpio chip with interrupts
> - some lines are gpio + irq, but some lines are interrupt only
> - later, after the gpiochip is registered, another part of the
>   turris-omnia-mcu driver wants to use one interrupt only line
>=20
> To use the gpiod_to_irq() function, I need gpio descriptor for that
> line. I can get that with gpiochip_get_desc(), since this is within the
> driver, I have access to the gpiochip. But this is semantically a
> little weird, because
>=20
>   1. gpiochip_get_desc() is supposed to be used by gpio driver, not
>      consumer (and the trng part of the turris-omnia-mcu code is a
>      consumer of the gpio)
>=20
>   2. reference counting?
>=20
> Looking at gpiolib, maybe the better function to use would be
> gpiochip_request_own_desc(). This also is defined in
> include/gpio/driver.c instead of include/gpio/consumer.c, but at least
> it's name suggests that it is used by code that also owns the
> gpiochip...
>=20
> One problem is that gpiochip_request_own_desc() won't work, because the
> gpiochip initializes valid masks for both gpios and irqs, and the=20
> gpiochip_request_own_desc() function calls gpiod_request_commit(),
> which executes the following code
>=20
>   if (guard.gc->request) {
>     offset =3D gpio_chip_hwgpio(desc);
>     if (gpiochip_line_is_valid(guard.gc, offset))
>       ret =3D guard.gc->request(guard.gc, offset);
>     else
>       ret =3D -EINVAL;
>     ...
>   }
>=20
> So if a gpiochip line is not valid GPIO, only valid IRQchip line, then
> the GPIO cannot be requested, even for interrupts.
>=20
> What is the proper solution here?
>=20
> Thank you
>=20
> Marek

Bart, Andy,

it seems that if I write the mcu DT node interrupt property which
refers to self, i.e.:

  mcu: system-controller@2a {
    ...

    interrupts-extended =3D <&gpio1 11 IRQ_TYPE_NONE>,
                          <&mcu 13 IRQ_TYPE_NONE>;
    interrupt-names =3D "irq", "trng";

    ...
  };

it seems to work and I can use

  irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "trng");

even if this is called from the mcu probe method.

Do you think this is a proper solution?

I find it a little bit weird that the mcu DT node refers to itself in
it's interrupt properties.

Marek

