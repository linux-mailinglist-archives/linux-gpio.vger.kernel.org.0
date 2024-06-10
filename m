Return-Path: <linux-gpio+bounces-7310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A5902364
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94DDA284AC6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD59B13D8BF;
	Mon, 10 Jun 2024 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7IMglbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAEE12FB31
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028119; cv=none; b=IKMbAcI+rr4ossAKCwVR2+RmY7BzCvV/uuMl0/dleJjCtBFDP4gBFn0/jtyyrjbn1p0IiJmF2W2Zb00hG3DA9ov2i8yUkL6w7uulPYHw9SYFLUED3LVsq0xbd0ZHKyN8CXXQ2NNJmDsS6bV3mNW2rOuWGcevtKMpwjDhTCR6Un8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028119; c=relaxed/simple;
	bh=GEd8aJcEFmDnV+9rKkpV5YqOgMOwPygYCLFyrRcb8kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X2dZvbMF5cTx3dz/IPfh/5p3nuVpGLwyP97nLY0pBlkVGUS2oG2Cyk8UOgK3oXE4wuwOteoeELUbSrpJY0OVP7khSqT138/UeosX8dDUYAcv8d6i1KIA0pwEQ7gR6H8slvTXIYrj7AD5t5j0au233lpo/e5IkPI+HW9XL9lHQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7IMglbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D634C2BBFC;
	Mon, 10 Jun 2024 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718028119;
	bh=GEd8aJcEFmDnV+9rKkpV5YqOgMOwPygYCLFyrRcb8kk=;
	h=Date:From:To:Cc:Subject:From;
	b=I7IMglbi6IwBfw2h6KOYMO9QPN5owMLaHwFRoM0t+/guwjP/EWTopxarlXNa1X6Zy
	 VEhd7v3nu4EC3CKXdhQ43F65yU8EPxMiFFMvrohND89bvLRac/yDlRPyEqTL1+TmAr
	 pAmkeRFg16yrpxkMDGS0Bmf9uVkuA9vZW6MIm/GFUc0t8lDiveQPMEDBCWTi9DyXx4
	 BQ1P4FRXErJojhSNutWdeSBbv9kG+RbKISVGPHAkPZJonb2cujie3ni/EfKixyb7Rk
	 xok5pJqyeGzBFAMhNAbIYODKyYSLjoMzL646np76y0dAc8fmv7XiIXlvzVqLEhfO7p
	 xGHHTyyULQlDw==
Date: Mon, 10 Jun 2024 16:01:55 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Subject: how to request gpiochip line which is only valid as an interrupt?
Message-ID: <20240610160155.5ca7e0d7@dellmb>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Bartosz,

I would like to ask you if you could find some time to look at

  [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support for
                  MCU provided TRNG

  https://lore.kernel.org/soc/20240605161851.13911-7-kabel@kernel.org/

Andy Shevchenko added you to that conversation asking you about how to
correctly do the following part:

  irq = gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));

I am writing this to give some more light into the problem. What is
going on:
- the turris-omnia-mcu driver provides a gpio chip with interrupts
- some lines are gpio + irq, but some lines are interrupt only
- later, after the gpiochip is registered, another part of the
  turris-omnia-mcu driver wants to use one interrupt only line

To use the gpiod_to_irq() function, I need gpio descriptor for that
line. I can get that with gpiochip_get_desc(), since this is within the
driver, I have access to the gpiochip. But this is semantically a
little weird, because

  1. gpiochip_get_desc() is supposed to be used by gpio driver, not
     consumer (and the trng part of the turris-omnia-mcu code is a
     consumer of the gpio)

  2. reference counting?

Looking at gpiolib, maybe the better function to use would be
gpiochip_request_own_desc(). This also is defined in
include/gpio/driver.c instead of include/gpio/consumer.c, but at least
it's name suggests that it is used by code that also owns the
gpiochip...

One problem is that gpiochip_request_own_desc() won't work, because the
gpiochip initializes valid masks for both gpios and irqs, and the 
gpiochip_request_own_desc() function calls gpiod_request_commit(),
which executes the following code

  if (guard.gc->request) {
    offset = gpio_chip_hwgpio(desc);
    if (gpiochip_line_is_valid(guard.gc, offset))
      ret = guard.gc->request(guard.gc, offset);
    else
      ret = -EINVAL;
    ...
  }

So if a gpiochip line is not valid GPIO, only valid IRQchip line, then
the GPIO cannot be requested, even for interrupts.

What is the proper solution here?

Thank you

Marek

