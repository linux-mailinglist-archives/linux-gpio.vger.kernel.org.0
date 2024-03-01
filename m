Return-Path: <linux-gpio+bounces-4013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941F86DC05
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 08:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB60284672
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 07:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816C66994B;
	Fri,  1 Mar 2024 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VJ4wAtDN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B938DEA
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709277683; cv=none; b=YPQJt0sQOx9aXDGrOrtrwMr6/vGtenn7kfKBV5HF948rL7IqKWJqobP0cCbbeXwD+wiOPtH/+hktFoOSFaJS39Eizkab8qCqfck+hnGvDVMsAj8PlLuzqxfA30rZwkdgGKaCi1BSlHJt7kdLuoGfTnq/ly3Ez55xDiTfmDb86UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709277683; c=relaxed/simple;
	bh=OrncqaTXrlnSSo5Ks5wvawPnkOUwSaYWu/OShdbLwDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRgxG2AkNEen76TwUnFbtJPDHUJ90tQyVwcYS4fOvjkjaKERpoUM5HMagpfqY9tQK4TYMfoGK004czK02PZDg/YIADs/zFIfQ46Q/XLuHV4BhzH0OpxmZX0O3KToWMGIHGCypubm+aRHF93TV+ngATlGkeX7Lhi5iTJTJsaBLgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VJ4wAtDN; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d5bbbe5844so1051162241.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709277680; x=1709882480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyoG1uo3ScEmdemTn2LXfZu/G+/KNWf3x3wgjIbdxkI=;
        b=VJ4wAtDNdhEBwcUNNPUoYwcsj+hjhwXNWjZunHGWpWwkOaOEMCEaOCNFpy5uS+Egja
         5xwW1TL47yWAIcxh7OQ1qWbBzrd5degy3Z7xT/SJ7RMe15iFjPYszk6JmdLISlu7DOAq
         +tZyMw06yFzLMnJrSff4IWe/rElLgED16kwIJlugtW04or/A3aX6tVSCdCZGAhAShynp
         t1+6RLrjdREt0s4ZlC/Ye544ENtyFE7ZdHjEBNILjw9Kqx2SLdqkuD5bVM7S5bJCn1B2
         kUvhD1Zn3GynBlseGIH/jmaXei+I9QxEE+yxn2JpPfs2cP5VnJHrp3hHilSiF85GAb+6
         mvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709277680; x=1709882480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyoG1uo3ScEmdemTn2LXfZu/G+/KNWf3x3wgjIbdxkI=;
        b=adqxhC5AcshZIa4c164iFKBY2mW716j4i3M/ZK8KbasCSe5rEmoPFx8m27ln0JfGYV
         qJD62aP/ukv3FB2UlGWSPpifWvJB5CQw7OrYJbByjGTq/fYELFBDJM7JZiav98Hg/1nt
         4SpdSKoJYxPPuXgQMeXn+IqUXE0/qtIlu0ZqNDaWl5u8EDsAk0F/35pZ77vhMjMfpc5H
         AHlgBL9MlHfhDmadI0AUiwOdm1YXRRoZ/v5FO95yeph74Uw+SyB7lhHeMvPaVzhphj/M
         2YpfkeEeX+kFiiCOPAI12MFq14JJjYWeAypHFajXoJCHqaO6D/ZgWxZngylv2HXPGYk5
         BsvA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Hn2LUYFajJdLY4F7cpX+ssZSa7EczvJz56EGJjyfeDFo8h72XIvaiJKI7BqPVFl9rRxP9fPvwf8bSLxI5tj+17dMbGpMnn3nRQ==
X-Gm-Message-State: AOJu0YyT53NR4HGlsDyjrCqB1S5Wc/4YKoE/J6zBHSkKKY5ejqgSy/nx
	0GvGXlhzbiS6t0hSXN2lbr59zYnCAF7Qp7iwKf0lVvGuBoGW5RYqTLuerOm61OsjIVk7OY0RJ2g
	Q0GHPN9J9AjuGxcia/Mp6bh1butlE+KJlLlPLSg==
X-Google-Smtp-Source: AGHT+IERSVUgpvpyYMrdOTfgI4JxiMpYQbWoDI6IXuRXf9ALPcJwc0uXFrdgjYiNqA/rxy7WgVdFWYxJiaPV9/JKcGo=
X-Received: by 2002:a05:6122:2709:b0:4d3:3974:657a with SMTP id
 ej9-20020a056122270900b004d33974657amr701603vkb.14.1709277680325; Thu, 29 Feb
 2024 23:21:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227113426.253232-1-herve.codina@bootlin.com>
 <CAMRc=MeSMTnPUYGyJir4fc=6=Gnw_MVP9wfEKMQ6Ck33FYCrRA@mail.gmail.com> <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com>
In-Reply-To: <CACRpkdZbGUd-u3ZcmmK1POSEq8z9J1aDhbGPAbcR6guKuEpEFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 08:21:09 +0100
Message-ID: <CAMRc=MeqiYZv3ViHRKKUsXTqG5Pc8Ev2jUcN=A4VuX3RU7dDtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Kent Gibson <warthog618@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 3:09=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Feb 27, 2024 at 8:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Feb 27, 2024 at 12:34=E2=80=AFPM Herve Codina <herve.codina@boo=
tlin.com> wrote:
>
> > > Herve Codina (2):
> > >   gpiolib: call gcdev_unregister() sooner in the removal operations
> > >   gpiolib: cdev: release IRQs when the gpio chip device is removed
> (...)
> > Sorry but this is just papering over the real issue. I'd say NAK for
> > now as I'd really prefer to get to the root of the problem and fix it
> > for all GPIO interrupt users.
> >
> > Kent, Linus: what do you think?
>
> I'm not sure. What does "all GPIO interrupt users" mean in this context?
>
> If you mean "also the kernel-internal" (such as some random driver
> having performed gpiod_to_irq() and requested it or, taken it from a
> phandle in the device tree) then I think these are slightly semantically
> different.
>

Yes I mean both in-kernel and user-space consumers.

> The big difference is that users of the cdev are *expected* to *crash*
> sometimes, releasing the file handle and then this cleanup needs to
> happen. Also cdev is more likely to be used for hotplugged/unplugged
> GPIOs.
>
> The kernel-internal users are *not* expected to crash, but to clean up
> their usage the right way. Also they are predominantly if not exclusively
> used for fixed GPIOs such as those on an SoC that do not hot-unplug
> and go away randomly.
>
> Use case 1: you run gpio-mon on a random GPIO with IRQ on a board.
> It is using a SoC-native GPIO. Suddenly gpio-mon crashes because
> of OOM or whatever and releases the filehandle on the way down.
> What to do?
>
> Use case 2: you plug in a USB dongle with GPIOs on. Start gpio-mon
> on one of the pins. Unplug the dongle. Then it is fair that the cdev clea=
ns
> up the irq, because I don't see any way that a kernel driver would
> request any of these GPIOs (but I'm more uncertain here).
>
> I just think it is necessary to think about the big picture here.
>

Agreed and the big picture - just like with the reason behind the SRCU
rework - is the fact that even static GPIO chips defined in ACPI or DT
can be unbound. Unless you want to make the decision that we
arbitrarily suppress_bind_attrs for all GPIO chips which I don't think
you do.

I have shown in the discussion under the previous iteration that a
static GPIO chip defined in DT that is also marked as an
interrupt-controller may have interrupts requested directly from its
irq domain bypassing the .to_irq() callback. As long as this GPIO chip
may be unbound (and we do not restrict this) it means the splat
mentioned here can be triggered from user-space with a simple rmmod
because a requested irq does not increase the module reference count
nor do device links seem to work for interrupts not associated with a
struct device explicitly.

I DO want to fix it, don't get me wrong. I don't want to just leave it
like this, especially since we've made so much progress with
hotpluggability recently. I just don't believe this is the right fix,
I will try to come up with a solution that addresses the issue
globally.

Bart

> Yours,
> Linus Walleij

[1] https://lore.kernel.org/lkml/CAMRc=3DMf5fRWoOMsJ41vzvE=3D-vp3wi-Obw=3Dj=
5fBk3DuQaZNQP2Q@mail.gmail.com/

