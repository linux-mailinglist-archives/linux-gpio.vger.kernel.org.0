Return-Path: <linux-gpio+bounces-18156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177BA77E11
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 16:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39A373A8265
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 14:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08944204F61;
	Tue,  1 Apr 2025 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fjCrmTkR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFD204F63
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518575; cv=none; b=U30OhcNXvqKhn1qxh9mCKHwEMjaEDVzpqTsqSiYUsXbWmLOMgMwrAirIQ+ksTImI6m2WL8FES8EfWNuBcPNbS6EHbcHza5zwqmHFTZQI9rK67ya0kH4GhA8At5/+YvsfXoBlBAFaX4LYx5y075H/080mFAPZsP9HCrDTur2ZsvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518575; c=relaxed/simple;
	bh=WaAmYeGlXVLIMGYtadgDzWol5UWcmx6qZyJV86g3FLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsMoojJi2D57AWhMN/RE/OG+jeH42KN3xNdBrPjb6lWntLF6XlvFm9nqpO+wLbUrEVK9Yp+GIG27kbP9ZaPdz4c36GT0JrSwfoul5tlxsU1qLcwJddRLB+wwnYED4WOxWEy2MHgtRgM7k76NxynhCqvDb9mbo5BpOC459aT7KCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fjCrmTkR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499659e669so1168703e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743518572; x=1744123372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoKh3xRlz5mCw5TurAZL1ObVidlP7k9BL/bfJaoO1EA=;
        b=fjCrmTkR225EelhmGO7Hekaqxx7jrEsM0yLl7Kdl1PzZ8RltUcTyoxm9unNdTVU6qu
         Td1A4WbZnIAs/I/xjg1b317gJC0GJFKCL/UCUknTLVBJgWYxoo55AWNZfsdyt0a7C4+E
         fwXlEnQ4j8FKxAWaFM9F6XVRmMCpYK7UzfuVbKBf7hL/rZfYWun2YkLiAYX16GQmHTdL
         edgFdgMEQTom+ZILnxxu1GyFZYZ3V2NigfOoUfxVGfciKV0fy+X0iwgGNgSLWAHJhUNg
         Jj+Dwezhai6htH/J6/EszwZ/Jv59oAfW6xs4OXTEv2LFk4RVg5i5yOI4vvJ28rEbmpvd
         8+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518572; x=1744123372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoKh3xRlz5mCw5TurAZL1ObVidlP7k9BL/bfJaoO1EA=;
        b=byTQFJFdOyOjLZzGNS7hQbiZSTTL7E/FvgL8LpyW2t2gQHK8//2vHk5z1Rigm/tLcQ
         ICu3EWZ+97x52tBlbM0ZDJjgpfZzduuxssSZnYA7s/wFqcBFAto6cL420YYQsQPgEwML
         69EmRg/j01lKfAHj7hViNiHEk8e5NHrEmgFCK26R2S4V7aWQrtJIr9AkGC6VUnXmoLRy
         jlikz3lBzas05AWySHZYFjvzRH3F+ZZam7wLTp2KoWxI4NnhrZCDN1ppV7xGAKDjOhcy
         AVoHaljZ1JgR7Qn0w8nTkGpjf5LHyjACLUcdxPNJDrTdiHd+IJvr7oCvvGl80el56R31
         Kz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0zy6ufu7BG8Jy6eds1VQbnbn3R5kG4KaOOG0UmtWqloBvBwqBhkWZOc5TnzfK7ivo5Ofy9TvUXkCs@vger.kernel.org
X-Gm-Message-State: AOJu0YxifjN1Jy7uGTDrs7hH+RABXqs/KmywR3cuTIGuUuL3udZKzDdo
	aFhnDV4iCL8eE54iOB3eDIlqxUNPS1UgRp2BVpe4+qJ4s5TYo1cldZOgwu1mclZ7umf4wQdYDz9
	yEj4hJorA4MwzYVyY5QsG6/X+FkOCLW1Vw+0Jyg==
X-Gm-Gg: ASbGncvw6NC37HQdBSv+QDl038goCgbrEseHQDy2IrrTdXw+okA4IKGwa3uctdksVqx
	BE1/+by5MlOv9BFZ/dc2C6Yac/lnvESOJlvBEr//FINZxsrjr2TF75i2O/kdECCN1qNBTELDRkP
	QOzJ/sdEua5kZx82ayrALk2HMxNBId4dF0jTN48yPoYo7ObX93jPjJ3wrG
X-Google-Smtp-Source: AGHT+IEfmhNL17r5nidNNv0tEQJKHtPF37KT698U/Xyea3ScXmWlnAbRZJLN1MOgu7vZBJKVLkZB3XPWxHnOGzPHiy4=
X-Received: by 2002:a05:6512:12c6:b0:549:9143:4ce1 with SMTP id
 2adb3069b0e04-54c0a4b5a19mr1146779e87.3.1743518572001; Tue, 01 Apr 2025
 07:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
In-Reply-To: <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Apr 2025 16:42:40 +0200
X-Gm-Features: AQ5f1JpjeDYSzEVGoQc1OoMcPQRfFfdR7yZhH4_uZk30TzdP2JDK8Wf9AT6IIJ4
Message-ID: <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Apr 01, 2025 at 02:46:41PM +0200, Bartosz Golaszewski wrote:
>
> > Let's deprecate both symbols officially, add them to the MAINTAINERS
> > keywords so that it pops up on our radars when used again, add a task t=
o
> > track it and I plan to use the power sequencing subsystem to handle the
> > cases where non-exclusive access to GPIOs is required.
>
> What exactly is the plan here?  The regulator (and reset) usage seems
> like a reasonable one TBH - the real problem is having an API from the
> GPIO subsystem to discover sharing, at the minute you can't resolve a
> binding enough to find out if there's sharing without actually
> requesting the GPIO.

Hard disagree on the reasonable usage. Let's consider the following:

You have two users and one goes gpiod_set_value(desc, 0), the other:
gpiod_set_value(desc, 1). Who is right? Depending on the timing the
resulting value may be either.

For it to make sense, you'd have to add new interfaces:
gpiod_enable(desc) and gpiod_disable(), that would keep track of the
enable count. However you can't remove the hundreds of existing users
of gpiod_set_value() so the problem doesn't go away. But even if you
did introduce these new routines, what about
gpiod_direction_input/output()? My point is: the GPIO consumer API is
designed with exclusive usage in mind and it makes no sense to try to
ram shared GPIOs into the GPIO core.

Also: there are no non-exclusive GPIO usars under drivers/reset/.

What I want to propose is the following:

1. Audit all users of GPIOD_FLAGS_BIT_NONEXCLUSIVE

Outside of drivers/regulator/ it seems that there are several users
who don't really needs this (especially under sound/) and where using
this flag is just a result of a copy-paste.

2. Fix the actual problem with buggy DSDT

Some GPIOs are requested by GPIOLIB ACPI code even though platform
drivers also want them. Those drivers just used the non-exclusive flag
with gpiod_get() but we should instead fix it with an ACPI request
quirk in GPIO core.

3. Use pwrseq where drivers really need non-exclusive GPIOs.

The power sequencing subsystem seems like a good candidate to fix the
issue. I imagine a faux_bus pwrseq driver that would plug into the
right places and provide pwrseq handles which the affected drivers
could either call directly via the pwrseq_get(), pwrseq_power_on/off()
interfaces, or we could have this pwrseq provider register as a GPIO
chip through which the gpiod_ calls from these consumers would go and
the sharing mediated by pwrseq.

Bartosz

