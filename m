Return-Path: <linux-gpio+bounces-18141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B784FA77708
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 10:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CED493AAE26
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 08:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966EA1EE001;
	Tue,  1 Apr 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zVos/QVm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA091EBA0D
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 08:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497874; cv=none; b=ajy5rCkMzp5D0EG+vGGuLk8oyUMAkZvTCCF12O3n8FYs33YJetKuBuHtxjjhzQ3gAMjxd+CUYvSBqfSM+/1hWVwIL8fHH4ivutyUwA8ublWnuL07kzXVtwPdtodmJcU9dpmABeQ1PWRRxWeRv/VKkKBj+e7ZiLdvJK0J7L8Th2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497874; c=relaxed/simple;
	bh=moSrvCxTIsu/1H4kAJprDurFwFaqiLT+mpfF+2Nc9m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbvIRCVYPeWTkYlkMBW0eEKoxbTyX03w1M6nc8It8FUpr7YrtxHMOUBDBN/e8ww1YxbvIo/9HQqdXEMCrKxADud4JQnsIgp1HEwSJGtfdSr4H/xqGzGpYP141AIqx1I84SNPbIqIFhZ+grDWk5tJzhvw6AK5S6x70M6z9APC0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zVos/QVm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5611872e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743497870; x=1744102670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moSrvCxTIsu/1H4kAJprDurFwFaqiLT+mpfF+2Nc9m8=;
        b=zVos/QVmf7NUTuIZNhrnYHACVlfD3R5S5BnEOccjBhEZmJfpxVOegpsJ8ghVGQ91n3
         qlGF7qCTyBNNmQKAPu+t9AhbFWxOPSAhXjIDplm0RhsCrSXhodXVNMhpX0xlzdiD6eQN
         +g14tZ+K6ILOOu+JnCAZM8bog3iajgKUAUAenL9pQ4XSJtxOQkT2t3MHi5rquMLc5a5Q
         jJWcNiMy8lkYr5gt2kUDKOj2GhjqUAh0IyeMxeAWNxIbcNgIGa7iLrdMAx9xiYLEHzIk
         0b7cCerLUGdWHjuGYmnifDbtTMroGrMdGv5gg/dh8Uc+bMWbl3sKgT45MBc6FNfOPPxE
         jycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497870; x=1744102670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moSrvCxTIsu/1H4kAJprDurFwFaqiLT+mpfF+2Nc9m8=;
        b=qitNVBvXzj5i6dPcn8HtNqx3UaUgk+RUprWiNnsRPBtaxmgdyKIgmaSvS0QsCWvJ/Z
         AvTzuRGl278vP2UBhU8onL5/CsVpakg+XYmLiRQLlihXZGhJrslQAbLnPQAfzX6c2Sal
         C8L2JBmlh8qM2q9s/SKsRXZZMX9PbGAS7LFD2BnzY/yVRPCO1g+STxIuuWmkjHrx0kE9
         1enAGpsI/4/bgUDNElqIWOlz2nvrceLK0G1UphZfRvMOsG5w1h9wvWwHZnr7ePvAqOe3
         g7vWFKyDu4ko58q6y2wjoqmLLXn7GIo9o6lCtOOSEM7K+w83OeBbh36nBpjkawO6UPb1
         3gwA==
X-Gm-Message-State: AOJu0Yx1FhfqrzeRCN1uV59MczO4rvsScwk2YGfd3Q5nsh/7J0TP3uVu
	uL2v0ySYPHDGCBFeZ8T8doDIchH8xq/qTzHyUO/FW+vtfJU2dxQO5ZCLj0W/OFdmuyzvu/01MVo
	8uZ9DBz2yjsy3vMuhEiW2xcH6MqX+GXenUd/fBw==
X-Gm-Gg: ASbGncvyqOPrDMuj/VyDDKtW2OJX3cfmHoHeplDHfdtSbDgC4XcPwZthE+Mf8TeBWSK
	fKiTK0eC7CqnqaKUdFOZ3e/Wb/akr459so4l2d8AYbepX7PDlwfvuB0enFd9MiZJD9SQ9mW25Gy
	mPM682DonAhly9eVBNIN9DnEALO2wmEHEpU0/90ilnh9dr8zh9nMJWdE2s
X-Google-Smtp-Source: AGHT+IHVNE4vFyWCtv3mtcDXTW/DYArpMM5S90tEQJgnM/ljbfBvnuRVpFWic4vIzaVU1d1vfWv1Xl3Q3KQvEjtMUlM=
X-Received: by 2002:a05:6512:2508:b0:54b:102b:af56 with SMTP id
 2adb3069b0e04-54b10d93684mr4424889e87.4.1743497870091; Tue, 01 Apr 2025
 01:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org> <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
In-Reply-To: <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Apr 2025 10:57:39 +0200
X-Gm-Features: AQ5f1JoeyDHZT3nRgIi26c7fEQx15tO8O2w3Mtv49X-LBE_RrWPzOPezefjryZ8
Message-ID: <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 12:49=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Mar 31, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>
> > +Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
> > +
> > +This flag is an awful workaround that was created for some regulator
> > +corner-cases but got out of hand and is now used in at least 33 places
> > +treewide. Unlike what the intuition may tell users, it's not a referen=
ce
> > +counted mechanisms like what clocks or regulators use but just a raw a=
ccess
> > +to the same GPIO descriptor from multiple places with no synchronizati=
on (other
> > +than what the underying driver offers). It doesn't even correctly supp=
ort
> > +releasing the supposedly non-exclusive GPIOs. This whole thing should =
go and be
> > +replaced with a better solution - for exampe: using the relatively new=
 power
> > +sequencing subsystem.
>
> Try to focus on the solution instead of writing so much about the problem=
.
> We mostly get the information that the GPIO maintainer dislikes them,
> not so much about why they exist and what can be done about them.
>

I'm sorry, after a second thought this does indeed sound too harsh but
when I realized that people started slapping this non-exclusive flag
on every problem - like when the GPIO ACPI code requests some GPIOs
(possibly erroneously), so driver authors just request it as
non-exclusive instead of investigating the actual problem, or some
codec drivers in sound/ which seem to not even need it and it looks
like a bad copy-paste, I got really frustrated that it's another thing
on the pile of stuff to fix. I will reword this entry.

> I would describe the actual problem and the actual solution,
> something like:
>
> "A problematic usecase for GPIOs is when two consumers want to use
> the same descriptor independently, as a consumer (in Linux a struct
> device) is generally assumed to have exclusive access to all of its
> resources, with a resource being defined as anything obtained behind
> a devm_* managed resource API such as devm_gpiod_get().
>

This is not a devres issue though. I don't think we should mention it
here. The real problem about this flag is that it effectively allows
two users to "fight" over a line's state. It would be better if it
would count the enable operations but this would go against the spirit
of the "gpiod_set_value()" interface, where you expect the value to be
actually set to what you request it to be. GPIOs should remain
exclusive and any "packaging" should happen in a higher layer.

This is one of those pesky resource ownership issues really.

> Providers such as regulators pose a special problem here since
> regulators instantiate several struct regulator_dev instances containing
> a struct device but using the *same* enable GPIO line: i.e. from a Linux
> point of view this enable line has a many-to-one ownership. You can
> imagine a 12V and a 5V regulator being turned on by the same GPIO
> line for example. The regulator resources need to have two different
> devices in Linux because they have different voltages, but they are enabl=
ed
> by the same GPIO.
>
> This breaks the devres resource assumptions:
>

The same thing would happen without devres. I think the regulator
framework should have some way of mediating GPIO use. There should
only really be a single gpiod_get() call for all enable-gpios of a
single regulator provider. I have it on my roadmap to look into it.
Whether the right approach is a GPIO quirk or a power sequence
provider binding to the top-level regulator provider, I don't know
yet.

> If several providers with their own struct device is using one
> and the same GPIO line, the devres consumer is unclear: which
> struct device should own the GPIO line?
>

Well, other subsystems just use reference-counted resources in this
case but see above - this is not a good fit for GPIOs.

> A hack allows GPIO lines to be shared between several consumers
> with the flag GPIOD_FLAGS_BIT_NONEXCLUSIVE but this API is
> confusing and prone to abuse, as is the related devm_gpiod_unhinge() API.

This is another thing that should most likely be deprecated and
removed. It's clearly a case of papering over unclear ownership of a
resource. I believe that any "hand-over" of ownership is really asking
for trouble. The entity that does the "get" should also do the "put"
in almost all cases. Fortunately it's only limited to a few use-cases
in drivers/regulator/ so it's not nearly as bad. However, I don't
really see a close relationship between these two issues. How about
adding a task for that as well?

>
> A better solution to some of the problems is to use approaches such as
> the power sequencing subsystem, which avoids having several owners of
> a resource by strictly sequencing the order in which they are obtained
> and activated.
>
> For example a GPIO turning on the power for both wireless and bluetooth
> chips can be obtained and turned on in a power sequence such that this
> problem never occurs: it is always active when when it needs to be, it ha=
s
> just one owner (the power sequence itself, struct pwrseq_device, which
> contains a struct device) and the GPIO regulator driver is not used in th=
is
> scenario."
>

So this bit is also unrelated - in the case of the wcn pwrseq driver,
there are two separate GPIOs for wifi and bluetooth. They just need a
delay between toggling one and the other. I would skip it.

Bart

