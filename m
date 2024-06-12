Return-Path: <linux-gpio+bounces-7400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B059053D5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 15:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B47D283D9D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D5A53365;
	Wed, 12 Jun 2024 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mySW3nPU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632764688
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718199147; cv=none; b=WX1WYwgWQZHPlIhrliIid/NTQQS3q9yrWWLGDDINI5MAh86hqpYOtFZ6kcPKfnryHFPDoFOukFujl5Hlz7MVpBGmnnDwPzwYxTW+t+EShkQ2ucNiRV4l6LiJiBOHCfqQ7HU/6nJKhxY9exYV8u7/UYPj8LqguTQ3AMugx98oXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718199147; c=relaxed/simple;
	bh=jAUjp4hQXR/TE45NrygJ/Tcu56wT0bRqOfvo2SLsuUA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlHaYP1diZ3+jbctaUxaLw0q9TbASSiJVrbgGJokDhVRXf4oceMLjZ5IE01HAx+4fetKitsK9Q776KESRs/ql4S8XNEWcIcKMos/3Pojux859NiMmq9nk5vLySg7xoBLGEOZC0EHowMRVWVfDM7GEFJcwRzze8w2i/qWzU+t9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mySW3nPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B446C3277B;
	Wed, 12 Jun 2024 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718199147;
	bh=jAUjp4hQXR/TE45NrygJ/Tcu56wT0bRqOfvo2SLsuUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mySW3nPUJutUdQrjVJQbcjOojnnwdTk8sL5UoAgBPLvwMJ71IkbDkxlAlDHAyWbZG
	 9W3I3zA641v3cFjilGV5kEUmzRQwxEZllZw3TWyk4WtPWC6krn2e6gRVVwLaoK77BQ
	 H0CfHDTEnya/QPAhQkLHSXSsNBSLWyVz28cQyywfueXkfanJZ7+h1gkCvt605LcaJt
	 M14O2froRj81DVso5GlpOL62znHZpoWm1wSClNwhqZEi3JhoRpUndZZ7y1ZIBDbyr+
	 kyMwHlUJPj4POs9aU7l7SvF5XnRytMprXsCTBa6FlxJYdwBDFLAkG42GcyjBsQntUp
	 tvYAikCzjdTNA==
Date: Wed, 12 Jun 2024 15:32:22 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: how to request gpiochip line which is only valid as an
 interrupt?
Message-ID: <20240612153222.427a3cba@dellmb>
In-Reply-To: <CAMRc=Mc_X0h0qSez_0cYG42Qi9Nmxueefj4AcKiC7iWUDBNEYw@mail.gmail.com>
References: <20240610160155.5ca7e0d7@dellmb>
	<20240611110305.0f0c5b1f@dellmb>
	<CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
	<20240612105555.70323f9c@dellmb>
	<20240612110314.68c5ef7c@dellmb>
	<CAMRc=Mc_X0h0qSez_0cYG42Qi9Nmxueefj4AcKiC7iWUDBNEYw@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 14:30:58 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Wed, Jun 12, 2024 at 11:03=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
> >
> > On Wed, 12 Jun 2024 10:55:55 +0200
> > Marek Beh=C3=BAn <kabel@kernel.org> wrote:
> > =20
> > > > Users can still read the value of this pin but won't be able to set
> > > > direction to output. =20
> > >
> > > Users are not supposed to read value of this pin, because it is not a
> > > GPIO pin. The corresponding bit is not set in gpiochip.valid_mask.
> > > It is for example impossible to export it in /sys/class/gpio.
> > >
> > > This line is valid only as an IRQ (the
> > > corresponding bit is set in gpiochip.irq.valid_mask). =20
> > =20
>=20
> Ah, I missed the bit about these pins not being marked as valid.
>=20
> > I am starting to thing that this might be the problem, that the line is
> > not valid as GPIO, only as an IRQ. gpiolib seems to be unable to handle
> > that.
> >
> > Indeed, the definition of the function
> >   gpiochip_irqchip_irq_valid()
> > first checks if the line is valid as gpio:
> >
> >   static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
> >                                          unsigned int offset)
> >   {
> >           if (!gpiochip_line_is_valid(gc, offset))
> >                   return false;
> >           ...
> > =20
>=20
> TBH Maybe using the GPIO provider APIs for something that isn't a GPIO
> doesn't make much sense? They are called GPIO irqchips for a reason
> after all? How about handling the non-GPIO interrupts with regular
> irqchip code and only exposing actual GPIOs using gpiolib?
>=20
> What is the exact layout of these pins? Are the GPIOs and non-GPIOs
> somehow grouped together? Maybe export several separate GPIO banks?

It is a little bit more complicated.

The MCU has some pins configured in GPIO mode, and the purpose of this
driver is to expose them to the operating system.
Their direction cannot be changed (with one exception).

Because of different MCU firmware versions, different GPIO groups are
readable/writable via different MCU commands. The driver exposes the
GPIOs via 3 banks:
 bank  cmd width  read command             write command
  1st  16 bits    GET_STATUS_WORD          GENERAL_CONTROL
  2nd  32 bits    GET_EXT_STATUS_DWORD     n/a
  3rd  16 bits    GET_EXT_CONTROL_STATUS   EXT_CONTROL

So for example the 1st bank has 16 lines, because the I2C command is 16
bits wide. But of these 16 bits, not all bits correspond to a real GPIO.
But the binding was created as if the bank has 16 lines to make things
simpler, and they can potentially been filled with firmware upgrade.
(More importantly we want to be compaitble with real U-Boot binaries
which already use this binding.).

Now, interrupt support was added to the MCU firmware later, and reading
interrupt status is done by a different MCU command (GET_INT_AND_CLEAR).
This command supports 32 interrupts, of which some map to the GPIOs,
but the mapping is not 1 to 1, since there is only one interrupt
command (32 bits wide) and three GPIO commands (64 bits wide in total).

So the driver exposes a gpiochip with 64 lines (of which not all are
valid), and to make it simple, it maps the GPIO lines that support
interrupts to the corresponding interrupt bit in the MCU interrupt
command. This way it is possible to use the gpiolib's internal irqchip.

Example:

  GPIO bank/line  IRQ line  Description
          0/   4         4  MiniPCIe0 Card Detect
          0/   5         5  MiniPCIe0 mSATA Indicator
          0/  12        12  Front Button

But the MCU also provides three interrupts that do not map to a real
GPIO, they are semantically different. For example the trng interrupt
is fired when MCU has generated entropy, to inform the system that it
can collect it.

I have mapped these 3 interrupts onto bits 11, 13 and 14 of bank 0,
because bank 0 corresponds to the GET_STATUS_WORD command, and these
bits of the GET_STATUS_WORD command reply can never correspond to a
GPIO (they have different meaning).

I do realize that this is rather complicated, but it is properly
documented in the device-tree binding, and is already being used this
way in the wild...

Marek

