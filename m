Return-Path: <linux-gpio+bounces-13313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1279DA551
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 11:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C102B28357D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 10:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CDC18DF62;
	Wed, 27 Nov 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TIborYry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA319413C
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701881; cv=none; b=IzUL8RPsqqXd7Q4b+UqKqbAlVcLk5jN/3WIcilLsYSzMP0d1U7rrwrO2ySbohHMzWux9wobuq86JCKQuq434CCwXnrogptpaRdkz80YIS7nI0qmXLOm+U3E6LeRaQesoWA3PyyH69ersHyh2sfoXcJkvam4zn48MFUZzXP+x3CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701881; c=relaxed/simple;
	bh=wNSW+FIAoqdK+JFp7CNVFvLcbUwf12stFr8KcvLvM+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2r8UAUBsUIZyLXLb78i0iSRsUwX4HpROv6w+zApCGr0HpuadSZA52l55DyfUTn0Q5xb0n8yl3ZhGoV+A5YYO5LMBQWXrXT5SLkmySoao02Y7bKgrF/Gevz9/rMFDSJ5EXvI/qpZfJFS3ZrxlKmXFGKjTHUBZ4ell6oNp3tw+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TIborYry; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df119675dso507948e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732701877; x=1733306677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vf1wKRQe6FutxLcxtYMQtFIbCMrmTBRP7ZXF6k4oMIM=;
        b=TIborYry8hM8nN4Js1j3Pv8UisDZ/aA0FgnM1ByC0dIKviGYPsm+NnrvKVy3u6hmSp
         c1KgH+RPssw2YJt9n2uykzFT56LxwVGaBbpz0kQuBFCraySmtkIumwwzNuqrY0gspSII
         4rmEbDdXHxCuHH4hK1Wjf64RBNZD3VhVuCqb1quE31Zf2TRWGhsagS3G7ELDrpju4ucT
         fKQzbpIzYKT64e1FI23zaFu0IQe54BIeu7H24qCwTvy2LPJ/Tgmo7hVFqF0tIKHPGhZl
         w8k4hbm6IDhymKdGNamxlPvSdfvJmGbCcuAVNLrhJKkQevR/yRhRKn391jWHggHK7nOq
         cLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701877; x=1733306677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vf1wKRQe6FutxLcxtYMQtFIbCMrmTBRP7ZXF6k4oMIM=;
        b=abdnnlK3CL+ffjvQyzrn37SH8oEbLQX0OdLaOyhLCt3vCvGUD6bzemY9MuNAgCnYfj
         Gn79LZ/nSicrppQahNaEEjxgRexaJnAUOaN4acOPXWY+QsLfwwzSgyUX6eNUAOPYTCoB
         oXeIyjAZVt722l1ZBD+aLP9LgPiTqKOGvFrqg5nJ4to9qGQ2yphijrRTFJ+QvjQQMwTF
         wi5JLdRZiOSo1ovqNnr8vdseA6MnTP6uu0FHZqa/YpeyyJSG/K3+KcVCEiudN5/5GKx/
         aybePjoPos9PHxzj99ollgzkpi07XrTfAQbTt0xhGo+RieX1D2HlxdEp7mNwMxQhzYkH
         tbGg==
X-Forwarded-Encrypted: i=1; AJvYcCVW32qtaF26KSCcrSO8E7jjCqV+YrlVU2IWSdW+b4VBR/wC5K4/HpOqXUiOXYumrIjhhx+JSUPhprBB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7hA1vmHmcWc9RLpTqpIsWqZ80USHxFnqzRx0WqC4fc7QnUgm
	OkQsotA/WVbsDVNHT459efLk1tx3kKRQdLphv34je0SlFUFY7kFRbnqQC/+2lt8O3LvpQFguzWP
	KTo+SBJ8bSrMxSaJOojw09OmD/+GlpVHUEX7BZA==
X-Gm-Gg: ASbGncv1Zet4mvOQoD0h7UaN+ajV/AMa8Kl2Zr5+jFYezTYCtrxLjoPVU1aOA9JXDK/
	PQBY1kmh3J85kyGFj8U70PtYQOazZKfbSA+N0zlhMnqnZ6aDdilwjzBJBn0W+Gms=
X-Google-Smtp-Source: AGHT+IGveN0IV2OvJiUHdP1fItf0srV3Qo3ILoto0JMQSeR9WrrvS4nGF/+8MBrRzMMrZZ/G4EsFWKMavI5zqh+TSwA=
X-Received: by 2002:a05:6512:3b96:b0:53d:e691:8471 with SMTP id
 2adb3069b0e04-53df00dc89emr1102825e87.30.1732701877026; Wed, 27 Nov 2024
 02:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
 <CAMRc=Md03oSc6jkib=g9B7C51i4aAD6LdXGHsmXuRxB7VjDxaA@mail.gmail.com> <0f5f4cca8b7f69b4b9cd3c34abceb7846e4cc187.camel@siemens.com>
In-Reply-To: <0f5f4cca8b7f69b4b9cd3c34abceb7846e4cc187.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Nov 2024 11:04:26 +0100
Message-ID: <CAMRc=Mc6D=isJCWzZekx8p9RYXG3Bmr39u15bThEeXbzKgAbEQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "ssantosh@kernel.org" <ssantosh@kernel.org>, 
	"khilman@kernel.org" <khilman@kernel.org>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 9:59=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz!
>
> On Tue, 2024-11-26 at 21:37 +0100, Bartosz Golaszewski wrote:
> > > @@ -647,6 +656,13 @@ static void omap_gpio_irq_shutdown(struct irq_da=
ta *d)
> > >          unsigned long flags;
> > >          unsigned offset =3D d->hwirq;
> > >
> > > +       /*
> > > +        * Enable the clock here so that the nested clk_disable() in =
the
> > > +        * following omap_clear_gpio_debounce() is lockless
> > > +        */
> > > +       if (bank->dbck_flag)
> > > +               clk_enable(bank->dbck);
> > > +
> >
> > But this looks like a functional change. You effectively bump the
> > clock enable count but don't add a corresponding clk_disable() in the
> > affected path. Is the clock ever actually disabled then?
> >
> > Am I not getting something?
>
> Actually I though I enable and disable them in the very same function, so=
 for the
> first enable above...
>
> >
> > >          raw_spin_lock_irqsave(&bank->lock, flags);
> > >          bank->irq_usage &=3D ~(BIT(offset));
> > >          omap_set_gpio_triggering(bank, offset, IRQ_TYPE_NONE);
> > > @@ -656,6 +672,9 @@ static void omap_gpio_irq_shutdown(struct irq_dat=
a *d)
> > >                  omap_clear_gpio_debounce(bank, offset);
> > >          omap_disable_gpio_module(bank, offset);
> > >          raw_spin_unlock_irqrestore(&bank->lock, flags);
> > > +
> > > +       if (bank->dbck_flag)
> > > +               clk_disable(bank->dbck);
>                     ^^^^^^^^^^^^^^^^^^^^^^^^
>
> this would be the corresponding disable.
>
> > >   }
> > >
> > >   static void omap_gpio_irq_bus_lock(struct irq_data *data)
> > > @@ -827,6 +846,13 @@ static void omap_gpio_free(struct gpio_chip *chi=
p, unsigned offset)
> > >          struct gpio_bank *bank =3D gpiochip_get_data(chip);
> > >          unsigned long flags;
> > >
> > > +       /*
> > > +        * Enable the clock here so that the nested clk_disable() in =
the
> > > +        * following omap_clear_gpio_debounce() is lockless
> > > +        */
> > > +       if (bank->dbck_flag)
> > > +               clk_enable(bank->dbck);
>                     ^^^^^^^^^^^^^^^^^^^^^^
> And for this second enable....
>
> > > +
> > >          raw_spin_lock_irqsave(&bank->lock, flags);
> > >          bank->mod_usage &=3D ~(BIT(offset));
> > >          if (!LINE_USED(bank->irq_usage, offset)) {
> > > @@ -836,6 +862,9 @@ static void omap_gpio_free(struct gpio_chip *chip=
, unsigned offset)
> > >          omap_disable_gpio_module(bank, offset);
> > >          raw_spin_unlock_irqrestore(&bank->lock, flags);
> > >
> > > +       if (bank->dbck_flag)
> > > +               clk_disable(bank->dbck);
>                     ^^^^^^^^^^^^^^^^^^^^^^^
> ... this would be the corresponding 2nd disable.
>
> > > +
> > >          pm_runtime_put(chip->parent);
> > >   }
> > >
>
> Aren't they paired from your PoV?
>

Ok, I needed to take a long look at this driver.

IIUC what happens now:

In omap_gpio_irq_shutdown() and omap_gpio_free() you now enable the
clock (really just bumping its enable count) before entering
omap_clear_gpio_debounce() so that its internal call do clk_disable()
only decreases the reference count without actually disabling it and
the clock is really disabled one level up the stack.

If that's correct, isn't it unnecessarily convoluted?
omap_clear_gpio_debounce() is only called from these two functions so
why not just move the clk_disable() out of it and into them?

Bartosz

