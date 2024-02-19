Return-Path: <linux-gpio+bounces-3451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C029E85A88B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 17:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7766F2886E6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 16:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FA43C46F;
	Mon, 19 Feb 2024 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D7n86fEA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C623BB3B
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359456; cv=none; b=iU6xSHsMxmr+zBQSp/+VJJuOEzyVcrAeKoFGseYYpMyh8ALM6RXxcr0vSdFjRuQblQ4ugWuzScOUmNmuUjUSR9dKQBCRPJtBIrlradX4EMQ+ASI/QtivpJ3P1jL2ukxi7FGvz/NcGV05BrZ+/qfG/eXqgWUyjf+qb/sAHBUQKYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359456; c=relaxed/simple;
	bh=134bTW4U/2yBPsvBKV9Njbp4VULnpfYtNg0d/8VXWnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlS7xMeDGa/bxmkViDH9dKtP557cwOJ7jFTcaf6vZm5l5MSzOlXsOAFYdeUR600FnH6SEyOMSw9ita4VkC2WgLhDMXssfVuhf6EOu3R1eG7ce8nHlVC2jfi/MCCTzYvwFKIb0Q1J5hyJ+ESgiKUXPPF0fmXZPrv4f5yfSAun7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D7n86fEA; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59f786b2b59so2070037eaf.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708359451; x=1708964251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx7otSCPMC2vGVuskOYxTO3G/UHr78DMGo93ZWkapNk=;
        b=D7n86fEABi7eir2Agli7r+8kVHPl9MdUS4U3cgA3zAxLq59Oy7tVK4yHOiWQaZvJrH
         VF3XodRiztJSbsbOYitfu7UMh7G2GKGsHRE3a2xfnfLrmpnxuh9mN2sRgvMIBAW2D6O9
         xZI5F73/yusts6KL5KcmOrxUfXQtCqF1GPUB+hfOALvH2Qccm66Jopt5mKeJKi1pxa/0
         gSIxODp+RfnR2+eHKBRgvXjodW4rrQDSNhdiGxPhMHUuasWvKR7ETfCocgMORLB7gV4N
         Z3hm1Lzh+yLxivxMeiYt9MUry/YVcVqzk4j0lkm2wvqiinSVLq+BWYKZaQnGgLfcIuQR
         mcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359451; x=1708964251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx7otSCPMC2vGVuskOYxTO3G/UHr78DMGo93ZWkapNk=;
        b=QaQHczg8rXWMuQTnm6fAZ60NRYXCNwCkqtF6wqHj3mvyJzy6Hp0ntexX+m19/hseLG
         hBJccbyxMH2keb7qvDlfKKbN58YdEzXHxT9nXKXQAG+/UU7sWEAKfFqD4n7ArHAL2Pf1
         j9asjMaqCtiTsK0//o/0TTDEQgTTYwj6zuQNwIgO2BWCBXo7DZHt/bafkDfKcEEBhDig
         5etCrdegjld65uc09oPThWNA7PqofpDGVaKnX5WIXsp5EAE+H+QoGwyZJ9iBLNibZ4+5
         rjva27P2Vi4LeNB7eMcPvBfgKNPT2zz2WD7l8Goep+lwvj52vcgmF2luFJob7ZxGgTi+
         N74g==
X-Forwarded-Encrypted: i=1; AJvYcCWBPAycKGBVU/WiDScRGGm+WnURBAksusADjzbcLCVH9MXO+JQyVibKwnbOoEYPx6vxQGwQqRVDjUXyOnIwYIS4WSTSi5pDnvaw8A==
X-Gm-Message-State: AOJu0Yw5+NUggrBIigzOq2IkWnib/vAvqM3QrC0mYpHqUpgmoqFpWZMP
	qrwG68PExDj2diAxduDkSqhvvS6uV3SxAxhr6CnAUCs3eggmlwjZoHu7psu2lO9VgP2UsapUUPg
	b9GgWhlIhugUSogHBWGm9h53crcHzuMt7xzM8qA==
X-Google-Smtp-Source: AGHT+IHLc5XDQogejfKFq5lHHEBUSI8TRIOeJ3TyooCJAymEvtY43bPRYPfmxEE9KAkgeTSwA8/zKkIr9WkBBX3Fwrg=
X-Received: by 2002:a05:6870:4706:b0:21e:b50c:3e90 with SMTP id
 b6-20020a056870470600b0021eb50c3e90mr5881476oaq.37.1708359451275; Mon, 19 Feb
 2024 08:17:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-16-f88c0ccf372b@bootlin.com> <CAMRc=MdFBFFTYKHgDfOieNZJ+-x7ZZMiYty6buOp2J=eFUjt0Q@mail.gmail.com>
 <CZ96EIJ22CYS.1AMRRY388V466@bootlin.com>
In-Reply-To: <CZ96EIJ22CYS.1AMRRY388V466@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 17:17:20 +0100
Message-ID: <CAMRc=MeKOJLMCxr2iMSYSK0A0O2L=Mw96B1opYiPdLsqQrB0_w@mail.gmail.com>
Subject: Re: [PATCH 16/23] gpio: nomadik: support shared GPIO IRQs
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 4:54=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:
>
> Hello,
>
> On Mon Feb 19, 2024 at 4:48 PM CET, Bartosz Golaszewski wrote:
> > On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@b=
ootlin.com> wrote:
> > >
> > > Support a single IRQs used by multiple GPIO banks. Change the IRQ
> > > handler type from a chained handler (as used by gpiolib
> > > for ->parent_handler) to a threaded IRQ.
> > >
> > > Use a fake raw spinlock to ensure generic_handle_irq() is called in a
> > > no-irq context. See Documentation/driver-api/gpio/driver.rst, "CHAINE=
D
> > > CASCADED GPIO IRQCHIPS" for additional information.
> > >
> >
> > Any reason for not using preempt_disable()?
>
> I did what the doc recommended:
>
> > The generic_handle_irq() is expected to be called with IRQ disabled,
> > so the IRQ core will complain if it is called from an IRQ handler which=
 is
> > forced to a thread. The "fake?" raw lock can be used to work around thi=
s
> > problem::
> >
> >   raw_spinlock_t wa_lock;
> >   static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
> >       unsigned long wa_lock_flags;
> >       raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
> >       generic_handle_irq(irq_find_mapping(bank->chip.irq.domain, bit));
> >       raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
>
> If you confirm I should be using preempt_disable() that's what I'll do
> in the next revision. I could even throw in a documentation patch if
> the advice is outdated.
>
> Thanks Bartosz,

This was added 9 years ago:

commit c307b002548590c5d8c32b964831de671ad4affe
Author: Grygorii Strashko <grygorii.strashko@ti.com>
Date:   Tue Oct 20 17:22:15 2015 +0300

    gpio: add a real time compliance notes

    Put in a compliance checklist.

    Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I'm Cc'ing Grygorii - maybe he can remember if there was any reason
for using a spinlock over preempt_disable(). But for now I'd go with
the latter.

Bart

>
> --
> Th=C3=A9o Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

