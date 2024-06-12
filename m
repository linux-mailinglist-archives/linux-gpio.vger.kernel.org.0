Return-Path: <linux-gpio+bounces-7385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F910904E9A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 10:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB7628485F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 08:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC48416D4DF;
	Wed, 12 Jun 2024 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALONtQTO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27618E02
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182560; cv=none; b=m03+hbB/lUwRrtqb6pSPAMg075WQz+mgQORgUf8TRha1D0bd5db6NY12sZiqwAYfytaxPfR4BGeUUJ2HuqpkNPWz3LxSl1ffUC19vGTv5cmYR+85EhUtUFZUJ57v7AAQe0M0/QtAHppMdcIMDkTIsg5E4L/M7eC71nid1bS1XBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182560; c=relaxed/simple;
	bh=xN6G6a0yMUyxcx2NTir8xAdRlDYr9yJulEc52LnFlgA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxBDuTL7z6kARbOS4DK/3tG2Pe8GjmMxFdHVRh1IT1iyvdAYfiw1HIzs7WREsmTRMblNpAf5kXJ3Z8DIqi3MIKjKTXaGE6Q/iOmi7m5cLyIjWiIesfwohZq9lJPVDKjo+19qCowL0J9CqoxZnc0WjrIDBuR8XIApSY2jzuiA9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALONtQTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B79C3277B;
	Wed, 12 Jun 2024 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718182560;
	bh=xN6G6a0yMUyxcx2NTir8xAdRlDYr9yJulEc52LnFlgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ALONtQTO4ePMPPg23nxaOb28Ovi9CTFLl9wXQpxxym0q/s/AUNDzqme9SrtN+J1tI
	 uedOmlROxO5fhDIvo8cEtrTr9AXGKp9iTboJ8Q1vhH9vsqLEG3wBf4Qfdi3VUU9A7L
	 /zbUl6kd6exjBFv5tgMfE78w3j7qICSVLBbv9QyBQ0OWCj//oXOSliLXg8CwcJejF3
	 BP8i9DRxCIvfXEQInJ4+aD5S5XnYE4hSqNkxXNcmtTAtu2+p2HaGnErlH0bJgCfApI
	 LH5fN3gTgPmxIqY3+DMT+FKz6PyxNcKGKrpUAIPpX803qZ4RoXPQPxTkzeon1jbX5e
	 1ZuTIcf99FCeA==
Date: Wed, 12 Jun 2024 10:55:55 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: how to request gpiochip line which is only valid as an
 interrupt?
Message-ID: <20240612105555.70323f9c@dellmb>
In-Reply-To: <CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
References: <20240610160155.5ca7e0d7@dellmb>
	<20240611110305.0f0c5b1f@dellmb>
	<CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Jun 2024 21:22:38 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Jun 11, 2024 at 11:03=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
> >
> > On Mon, 10 Jun 2024 16:01:55 +0200
> > Marek Beh=C3=BAn <kabel@kernel.org> wrote:
> > =20
> > > Hello Bartosz,
> > >
> > > I would like to ask you if you could find some time to look at
> > >
> > >   [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support for
> > >                   MCU provided TRNG
> > >
> > >   https://lore.kernel.org/soc/20240605161851.13911-7-kabel@kernel.org/
> > >
> > > Andy Shevchenko added you to that conversation asking you about how to
> > > correctly do the following part:
> > >
> > >   irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> > >
> > > I am writing this to give some more light into the problem. What is
> > > going on:
> > > - the turris-omnia-mcu driver provides a gpio chip with interrupts
> > > - some lines are gpio + irq, but some lines are interrupt only
> > > - later, after the gpiochip is registered, another part of the
> > >   turris-omnia-mcu driver wants to use one interrupt only line
> > >
> > > To use the gpiod_to_irq() function, I need gpio descriptor for that
> > > line. I can get that with gpiochip_get_desc(), since this is within t=
he
> > > driver, I have access to the gpiochip. But this is semantically a
> > > little weird, because
> > >
> > >   1. gpiochip_get_desc() is supposed to be used by gpio driver, not
> > >      consumer (and the trng part of the turris-omnia-mcu code is a
> > >      consumer of the gpio)
> > >
> > >   2. reference counting?
> > >
> > > Looking at gpiolib, maybe the better function to use would be
> > > gpiochip_request_own_desc(). This also is defined in
> > > include/gpio/driver.c instead of include/gpio/consumer.c, but at least
> > > it's name suggests that it is used by code that also owns the
> > > gpiochip...
> > >
> > > One problem is that gpiochip_request_own_desc() won't work, because t=
he
> > > gpiochip initializes valid masks for both gpios and irqs, and the
> > > gpiochip_request_own_desc() function calls gpiod_request_commit(),
> > > which executes the following code
> > >
> > >   if (guard.gc->request) {
> > >     offset =3D gpio_chip_hwgpio(desc);
> > >     if (gpiochip_line_is_valid(guard.gc, offset))
> > >       ret =3D guard.gc->request(guard.gc, offset);
> > >     else
> > >       ret =3D -EINVAL;
> > >     ...
> > >   }
> > >
> > > So if a gpiochip line is not valid GPIO, only valid IRQchip line, then
> > > the GPIO cannot be requested, even for interrupts.
> > >
> > > What is the proper solution here?
> > >
> > > Thank you
> > >
> > > Marek =20
> >
> > Bart, Andy,
> >
> > it seems that if I write the mcu DT node interrupt property which
> > refers to self, i.e.:
> >
> >   mcu: system-controller@2a {
> >     ...
> >
> >     interrupts-extended =3D <&gpio1 11 IRQ_TYPE_NONE>,
> >                           <&mcu 13 IRQ_TYPE_NONE>;
> >     interrupt-names =3D "irq", "trng";
> >
> >     ...
> >   };
> >
> > it seems to work and I can use
> >
> >   irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "trng");
> >
> > even if this is called from the mcu probe method.
> >
> > Do you think this is a proper solution?
> >
> > I find it a little bit weird that the mcu DT node refers to itself in
> > it's interrupt properties.
> >
> > Marek =20
>=20
> Do I understand correctly that this is an I2C device visible under a
> single address (and represented by a single device-tree node) that
> registers with several kernel subsystems (among others: GPIO and RNG)?

Indeed. Signle device-tree node, single I2C device at one address,
signle driver, several kernel subsystems. The gpiochip is registered as
first one, it provides interrupts, the subsequent things can use the
interrupts.

> If so then the interrupts should not be visible as a device property.

And that is how I have been doing this. But the question is how should
I request for the gpio descriptor? If the own interrupts are not
described device-tree property, I can't use fwnode_irq_get() /
of_irq_get().

Originally, I used the low-level irq_create_mapping(), passing it the
gpiochip's IRQ domain, something like:

  irq =3D  irq_create_mapping(mcu->gc.irq.domain, TRNG_HWIRQ);

Andy said [1] that

  This looks like some workaround against existing gpiod_to_irq(). Why
  do you need this?

I should not poke into gpiolib's internals like that.

So I changed it to

  irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, TRNG_HWIRQ));

But now Andy rightly says:

  Okay, it's a bit more complicated than that. The gpiochip_get_desc()
  shouldn't be used. Bart, what can you suggest to do here? Opencoding
  it doesn't sound to me a (fully) correct approach in a long term.

The gpiochip_get_desc() function doesn't request the GPIO, it doesn't
change it's flags nor anything.

There is the gpiochip_request_own_desc() function, which does
requesting, but the problem there is that this GPIO line cannot be
requested, because it is not a valid GPIO line, only a valid IRQ line
(according to relevant valid_masks).

> If you have access to the GPIO chip, can you simply call
> gpiochip_lock_as_irq() and then request the interrupt?

I don't quite understand. The gpiochip's irqchip is immutable and uses
the GPIOCHIP_IRQ_RESOURCE_HELPERS macro in its definition.

This means that the .irq_request_resources method is set to
gpiochip_irq_reqres from gpiolib.c, which already calls
gpiochip_lock_as_irq().

So gpiochip_lock_as_irq() is called once I request the irq with
request_threaded_irq().

> Users can still read the value of this pin but won't be able to set
> direction to output.

Users are not supposed to read value of this pin, because it is not a
GPIO pin. The corresponding bit is not set in gpiochip.valid_mask.
It is for example impossible to export it in /sys/class/gpio.

This line is valid only as an IRQ (the
corresponding bit is set in gpiochip.irq.valid_mask).

Marek

