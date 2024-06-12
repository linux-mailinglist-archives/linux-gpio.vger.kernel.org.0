Return-Path: <linux-gpio+bounces-7387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5A904F05
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E618628A0B4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 09:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB39A16DEAE;
	Wed, 12 Jun 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r52f5vqj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5EF16DEA7
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718183985; cv=none; b=DFJjVT2Lc8jsjoLuVyPsOHF/q3gs+LhLn5ApsvDaCrjGTay99n1TmR9Lo4Hpw/apuNWS9LCy3ZOJ7B4PqbaU/9HsXKcYdUOkyVUG1bFp5WxPYjavTjPMnBwASvegkKt/Xoa4NP1Zxh4y3LX5yV6UFYcLy+hShcL90JMC5xdR7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718183985; c=relaxed/simple;
	bh=9Io1JO8iEX7mB7o8gzNN9BTzGgNcbKJpkCl9o9f1D6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EcCEPQbwdaWDoFQEaa46EbKk9XhFG9Tihv65BJh701N7G2RpxeHm/jsNACFZC0P1OqHxI1D90MMjAP994x7hW8xmWuRLbPk73pKKVEMJRc4eQMlDoyQz1Ituw569rVjd37LPfDKdTOtY5p0RaEAaRl624S0RyLBQPG6tOOlHjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r52f5vqj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D42C32789;
	Wed, 12 Jun 2024 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718183985;
	bh=9Io1JO8iEX7mB7o8gzNN9BTzGgNcbKJpkCl9o9f1D6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r52f5vqjkiKdRLIPXwgngN4kQwY7UkNHrhQRVgPTrd14kpLwQcQrlFOnpRRL8hPKO
	 wFU/vM/4wUSmgUv9MMTFW0tleait0xOTXNFMyNfaGxnF+ZwkYzGgkjeUxBxrjaWx8i
	 UqdsEDVmgpPDzv66b/AQ/yGy9OOjPPVly8vWyo5+gZt2DmIbAhzRyK8QVZocoANqnQ
	 I4JwjFfKrVJEocMZQbC2GW3Y5GPmSHAHCf/6+AxQ0Dxh+6QPJeA2ZPoY0BngU+7Q+Y
	 HCVLc7CAw/TmKnGI2FtiMXUkQd0xq4lDaQVqFMvrssdqnNBiBh2GpO+9GXEXO3vUZU
	 vqnL3yC8bFMww==
Date: Wed, 12 Jun 2024 11:19:40 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: how to request gpiochip line which is only valid as an
 interrupt?
Message-ID: <20240612111940.6cdce4f5@dellmb>
In-Reply-To: <20240612105555.70323f9c@dellmb>
References: <20240610160155.5ca7e0d7@dellmb>
	<20240611110305.0f0c5b1f@dellmb>
	<CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
	<20240612105555.70323f9c@dellmb>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Andy,

On Wed, 12 Jun 2024 10:55:55 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Originally, I used the low-level irq_create_mapping(), passing it the
> gpiochip's IRQ domain, something like:
>=20
>   irq =3D  irq_create_mapping(mcu->gc.irq.domain, TRNG_HWIRQ);
>=20
> Andy said [1] that
>=20
>   This looks like some workaround against existing gpiod_to_irq(). Why
>   do you need this?
>=20
> I should not poke into gpiolib's internals like that.
>=20
> So I changed it to
>=20
>   irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, TRNG_HWIRQ));

I think the original code=20

  irq =3D irq_create_mapping(mcu->gc.irq.domain, TRNG_HWIRQ);

should be used. The trng part of the driver is interested in the
interrupt, it does not care if the interrupt is provided via a GPIO
chip.

The mcu device is a gpio-controller, but also an interrupt-controller.
That the interrupts are provided via gpiolib is irrelevant.

So I think that what we did back in April, changing to gpiod_to_irq(),
is not actually correct, from semantic point of view.

For example if some other driver wanted to use a MCU interrupt, it
would have simply used:
  of_get_irq()
not referring to gpio descriptors at all, i.e. not something like
  gpiod_to_irq(gpiod_find_and_request())

(I do actually have code prepared for another driver that will use
an interrupt provided by the MCU.)

What do you think?

Marek

