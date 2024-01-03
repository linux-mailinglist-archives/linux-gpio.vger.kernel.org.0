Return-Path: <linux-gpio+bounces-1982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317D822B95
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 11:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C041C22868
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAD418C2A;
	Wed,  3 Jan 2024 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IEOhpq6o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCA18C1B
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-46788b25f95so292392137.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704278861; x=1704883661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K4oedJlgK7fm0kTTajG8Yf6Z8+LscjYprqJKbd1jFQ=;
        b=IEOhpq6oyseJJX6TRDUlKYCRsjw3VRaH5vDJsDMrQRyuIMeVkPYkwSnND0eOkjgAb3
         LPtGTgHrA7aVeaBxa/3IiQ2miREdu9riv9bsPfnn4Ae6Mdnqf76JgOxog4U2mhirmQ+a
         dqcITsukUEbo3c97d89KUPDO659oXYPsD/WGdpB7KTQfKkx0xG6xdn8ULPvYnSc8JouW
         HBdYuSXOlaugZ8cRGijA+J47qUquk11wOjeUCgAxXh2g/aWfsaOF7NJxHEhC5du14Wnm
         vuh8kI0TcrQDZvlOJsUO9zCJT9JP9QcBz/+eK0XuXGkPv9hODsZvaq8c2dEaq8Mhvvge
         goLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704278861; x=1704883661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K4oedJlgK7fm0kTTajG8Yf6Z8+LscjYprqJKbd1jFQ=;
        b=OoWH8zqAvlP5KRVm7+SXy9TKfPZR/MMAbhwUHt2GYcNtH14x5R87zfMqgs27osJeYq
         Wu8aeRhDiBBYGwKy3Ym6y5GR3AO5/Mip+3u2SHhQkuJlhtuNBzSZjQnvcSfqLndOHvsn
         KnHl+osTfOSyQQ6QP+deqy7c9C0ynj6NKXRxBRFiIRjDSiSdl7bfjF5I+xYJgOsKwQ5M
         tBt5UbhvkwNAdAG23jQ3PgxkjlIFaIR7oOYIPjLR4H/KZSje7wle9Dn6ZYMky8bA12eR
         a7sck9svUifw0abgwALJ7T3AJElBf/l6hnMxQ0kqbz6OZVKXnKngtIrqx+8jAOnQXdOF
         mu6A==
X-Gm-Message-State: AOJu0YwIdrtYwHuXn7ftYG4HUKunvXbeGrIANJ0Ch+e2Blb8p7xS/x85
	wmyq2emLJRD67jeEAzFPdE2M8HPQWIGtJC6UkQ/p7prNRhsh4Q==
X-Google-Smtp-Source: AGHT+IHi8XxiCT7XQL5cHO6EzQzHVM40A96vJDWAEVBjQDx4n9kUVD/7G3bR8AOh1osJOecBZgGpAoYE1yoJ+4xKcKU=
X-Received: by 2002:a05:6102:6c1:b0:466:61aa:8de9 with SMTP id
 m1-20020a05610206c100b0046661aa8de9mr8460699vsg.6.1704278861585; Wed, 03 Jan
 2024 02:47:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
In-Reply-To: <CAJ8C1XPiYYeOzbZXcDFR2GX-CoRFuvJim6QVi9-O-oR4mZBauA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jan 2024 11:47:30 +0100
Message-ID: <CAMRc=Mfmf1pPnkGkyZZKmucOprq4cLnnfxSLaSxSB3Ra_3iYeg@mail.gmail.com>
Subject: Re: Some thoughts following a brief test of libgpiod ver 2.1
To: Seamus de Mora <seamusdemora@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 28, 2023 at 2:20=E2=80=AFAM Seamus de Mora <seamusdemora@gmail.=
com> wrote:
>

[snip]

>
> 1. I do not agree with the lack of "persistence" - at least as far as
> it seems to be practiced in the 'gpioset' tool. When it comes to
> "turning things ON and OFF", there is a long-established paradigm that
> says when something is 'turned ON', it remains ON until the user takes
> an action to turn it OFF. This seems simple and obvious to me. Using
> the light switch in my bedroom as a simple example, I cannot see the
> logic behind a Design Decision that requires me to keep my finger on
> the light switch to keep it OFF so I can sleep.
>

This begs the question: WHO is the user? Are you making an assumption
that the bash process (and its associated UID) that invoked gpioset is
THE ONLY user on your multi user linux system? When gpioset acquires
the GPIO for exclusive usage, it becomes THE user but as soon as it
releases it - anyone else (with appropriate permissions) can come
around and re-claim that GPIO.

To use your light switch example: you turn it ON and take a step back.
The light is still on. But then your friend walks by and turns it OFF
because you were not actively blocking access to that switch.

> When I was in school we studied 'state machines'. I felt I had a
> decent understanding of them - they were useful in designing automated
> systems. Yet, in 'gpioset' it seems the concept of a 'state' has been
> turned on its ear! We can 'set' a GPIO pin to a state, but that state
> reverts immediately (a single clock cycle?). There seems to be an
> underlying thought/theory at work in 'gpioset' that demands that it be
> kept resident in memory to maintain a 'state'. There may be hardware
> systems that demand continuous software oversight to function, but I
> know of no such GPIO hardware systems. Also, AFAIK previous
> programming interfaces/libraries all had "persistence".
>

If you're referring to sysfs, then it has no more persistence than a
driver that requests a GPIO and keeps it requested. You can imagine it
as a central GPIO authority - a guy holding the lightswitch whom you
tell how to set it. And your friend can tell him the opposite and
he'll gladly comply.

[snip]

Bart

