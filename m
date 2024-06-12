Return-Path: <linux-gpio+bounces-7399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD590527D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 14:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F386EB232CB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 12:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF32E16FF38;
	Wed, 12 Jun 2024 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HPgZsJef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93616FF2B
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195473; cv=none; b=bm1+KeYUOrlZwnWUIfItyO0gFlOqS5jiGVh05+FtoLLS8X8OKDpT1D38Mjwft62ljTFrDxoKCw+gFR+B+QbwHH1hVz+vnqqIqMUWaDLZ+Xlc+WfzfcKCZdgFd2FLUWfPZsxsagW+Au78Z+7rYWVyAbPOIGeJCP1+MDxlE7hiB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195473; c=relaxed/simple;
	bh=QhHM5v/C1EIAhza+G/G+1tZsGlWQ1niqHl+43g7rc0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3SrzId4zNcYMzN+D1/VPaa7hUDNnfVdNeynTt781N0Rquk48D1A9tsuujLxYsbNyp90QUcbRCiG0fjrMRxoPn9/qYazmCoM2YtSGG1KNGD08ITfqLYsS3B/fyW60XNetsjikTJBWntWMVonal9Ro7GFJeS83nCfhDxiz82IXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HPgZsJef; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c525257feso5360583e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 05:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718195470; x=1718800270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voPG9BVSQ593Yng+myR7gVXVfj/S2r72EYe2WG5qII0=;
        b=HPgZsJefCBFYKOK0z90RToh49b627diExpzAzZiBNXDmjfQX0vCgjQSRyL1pDn0eWl
         0PTUdvcpa7dBZ1c9R6wDVn6zGCeNrAf3GfNzZe1r+00EYeou2CsGhPE64Fqzpkoo6fR3
         3Vxagdvsh51649wpsRjac4cnX1ZvL6CHPgBcFp8hwurnNXWGny/KGq6UAOlghZbeKZd6
         FA/8kFG5sO3FcoHvo/pO72Vk8ADdkvfX4oKfvpJu9IlCT7fCBDXEseMXnJ2kMpypPVvm
         nZu2bpmAm1cjJNidv7FETwrIOx2o/DEfOB24zhomWn3+7fAzZTe2AhumGS0t3tKbGezb
         ZVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718195470; x=1718800270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voPG9BVSQ593Yng+myR7gVXVfj/S2r72EYe2WG5qII0=;
        b=MwlE//eYDPdnLo+LQqlfprMLajFxf5j1uIODnKgwmImOxvowvj8uATx6W2sPQwnlC0
         tuMq3Ca3p2d5i5RSYC7GrtSnsktNXCXLGGtccYYHtCa7phKNh9v1XCiy1Ien/z4uHC1K
         /lDMWW4gPcdTXaqn88jp53cHxNF6Cw0sBYcrYorHJysGV7pwZOdshpBTOvBacyFpvHMP
         1wG2VtDy0EgtVULgwj0MwxEMScmz5mexUA9BwOjaHNhQswuauQNtbnmPSotgvDZn8FjY
         ilaUCjyiFxAf8JgVb/bwaCGhGKSMIE7it6CJvJB0/oARgEgZDol09Hrh7wy9va9tomq5
         GJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQfSTFSIJFmRju7lOIPztZeqoxHub4oaAU83jilO8QiruCnDyFRUdPW7aaDVbkapf5fvvp82Dp3ELCoYjk3sy+Aa2AcaFXZxGjUg==
X-Gm-Message-State: AOJu0Yz3Al+B/7GkCB3fkV1JvbJkgopKI7vSASaMdKym1tZbdQwwOrHK
	T5zpzneQmh7iuS/apcTigfULUut1HkF6ncp7oH5JGgAFbOXnESauKlNZgGGgwPgMxb0RQocYnsM
	TJfvxQkSVX8T//IdkkN2iztH3n49fj3FWPYb6fvfAacOIqSz3
X-Google-Smtp-Source: AGHT+IHTKlKYn3D751FHo/fuW5odeXj9iM3u2rk10yX1SGYkyGTAvVFdaK9/ZwdxBsx2xMYjkoZtR0Yj4lKllJahmwI=
X-Received: by 2002:a05:6512:ad2:b0:52c:8289:e890 with SMTP id
 2adb3069b0e04-52c9a3b7922mr1181845e87.4.1718195469957; Wed, 12 Jun 2024
 05:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610160155.5ca7e0d7@dellmb> <20240611110305.0f0c5b1f@dellmb>
 <CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
 <20240612105555.70323f9c@dellmb> <20240612110314.68c5ef7c@dellmb>
In-Reply-To: <20240612110314.68c5ef7c@dellmb>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Jun 2024 14:30:58 +0200
Message-ID: <CAMRc=Mc_X0h0qSez_0cYG42Qi9Nmxueefj4AcKiC7iWUDBNEYw@mail.gmail.com>
Subject: Re: how to request gpiochip line which is only valid as an interrupt?
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 11:03=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
>
> On Wed, 12 Jun 2024 10:55:55 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
> > > Users can still read the value of this pin but won't be able to set
> > > direction to output.
> >
> > Users are not supposed to read value of this pin, because it is not a
> > GPIO pin. The corresponding bit is not set in gpiochip.valid_mask.
> > It is for example impossible to export it in /sys/class/gpio.
> >
> > This line is valid only as an IRQ (the
> > corresponding bit is set in gpiochip.irq.valid_mask).
>

Ah, I missed the bit about these pins not being marked as valid.

> I am starting to thing that this might be the problem, that the line is
> not valid as GPIO, only as an IRQ. gpiolib seems to be unable to handle
> that.
>
> Indeed, the definition of the function
>   gpiochip_irqchip_irq_valid()
> first checks if the line is valid as gpio:
>
>   static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
>                                          unsigned int offset)
>   {
>           if (!gpiochip_line_is_valid(gc, offset))
>                   return false;
>           ...
>

TBH Maybe using the GPIO provider APIs for something that isn't a GPIO
doesn't make much sense? They are called GPIO irqchips for a reason
after all? How about handling the non-GPIO interrupts with regular
irqchip code and only exposing actual GPIOs using gpiolib?

What is the exact layout of these pins? Are the GPIOs and non-GPIOs
somehow grouped together? Maybe export several separate GPIO banks?

Bart

