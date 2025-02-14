Return-Path: <linux-gpio+bounces-15995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0748A35B49
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613C618931D1
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8784925743B;
	Fri, 14 Feb 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B+TmeMG7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D3A255E42
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528100; cv=none; b=ef63v7s4JNYrg/Phy4g4uiHT/NpuWQlNaBUIAlkkXXvGZw5X9j1nm+SPCn/azZc4meuZhu1w7V8wtaaRjWgA8MKipDPvRL1IYbLqERdiPb3y+qvDUSz5YXJCHHkcquwhxzSQHhtFVW0G32Y8HUOKIQ2AYu0c/bCdoBQaaAijPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528100; c=relaxed/simple;
	bh=96IUlvA4Kab/E8aWKKJlXMsjG5KwQVnXCwIZK25zn9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCy37B1ajdbwC/ebdzLzLyOMbQnRIA4JXnetCuUGB4NrVZpJPMhpFVGn4nHoVFNDv4FFfbkGv06QNJrbwAPC5RkvPP5p/yXspzcKCQMXn8wvbAj5CJ1Pm+U1QEksMhBlg2xC/QLsA0D0BZX5NxCUPgd6YiY9blvUTzGAac/QYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B+TmeMG7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so19669711fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739528097; x=1740132897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96IUlvA4Kab/E8aWKKJlXMsjG5KwQVnXCwIZK25zn9I=;
        b=B+TmeMG7fChE+5sf5xiiZZNZjtKynx3/vb2uM6xsOuuI4xcwSKb2M7EhOdwZ0DqBhc
         a/lspK+dm+4XaaOwpAr38tpgV6tRkMGuUzmCMIPibqUfJekZ3Gk+fDmwD6tgsalvkl0m
         cYzslemXfpyKPqezcPV9Ku6y6LNGyH9ZepaYOTAA1J0WHV0lh3TLOQPJwAFE4lkx6DOz
         VkI7Ia+Z99BjX1Bs7P9Ks9xu3esMlb9wQrk9nBeyXKCf0lTNfQhKVo5JKiXzQvBUaHrB
         jTBDd0VQVuLr6qHNgl1essykKGo9K0j2+KLHvk3Eh9qUCXOuvm5hpbFKx4BF2KaT6f9J
         faFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528097; x=1740132897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96IUlvA4Kab/E8aWKKJlXMsjG5KwQVnXCwIZK25zn9I=;
        b=Q8lhbcQLUaAyZUeEW5m9CosA8vx7CarOGUL3untrxaTa86EEG8u5qCPPofPaNbjWCX
         tuuAAaoTrbJyx8PuyCjRM3AIM9rgZM/2iJM5T1T8YJuvnEmzwFQOVFWwPhuff7TAFv6I
         u8HhaqNjncS2LAY44yBDVMngsV+LhO4v4jtpv0miHu48U/5RyIgqiarfBZQfY4VWuK+x
         t8+rnc3x6wZSPsmYXOhvQH61VgUtmZPdRZIgYfi+7MUrXXW0AbW22LjgyALnPK+dTSKD
         5eujb/WiYKAURmkoYDtye0KqnoE34t3m6ad0DwijsaF+aXCH1cI1Ph9iqKOmIKpKvC1V
         dOAg==
X-Forwarded-Encrypted: i=1; AJvYcCW6PuhpOEh+3qf5ljS9mYruD/gPlsmzYLauTW9NyRNXrSq9IVc7DL4klwhKvvM1G3TYcWwTGExPFCKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tSfsMLx73ommsH00dy10N8mw8V5vAD7zq8fw52+Xpbog7buf
	3oKxnA7mvUTv98jDmuiMtk/UJXiKVUX903/ZeYZBG4xuPylfcWzcu+uB6t3enpRGH3vbms3wbex
	jXot88G6kzzp3wnBUCRQCPZ93rCQ6v5cFlGIQ8Q==
X-Gm-Gg: ASbGncvT9r3w/lJEO3WTgk059kYVYtJHZ3NwSx9ZnAndrBZaLhtYU/SaFiWtP1yk/2S
	XPE19/VVpCyHc2mAJwUCoonlHwfcaKJ7i0oLjXTNHzJjgkpc42M3cuBVwGyN6EBdnnqzkOdQ+lJ
	usUf3z8qne+BdNnmyCs5ZrrgyIvtw=
X-Google-Smtp-Source: AGHT+IGIHT58DThOkHUQCnE0Th1WDTQk4pOddXfAj+W59mKK6nphQZOjUH2rQySGLrnHMOPeaMVkwqsD4JIkTWJHbzc=
X-Received: by 2002:a05:6512:230d:b0:545:c51:4a0f with SMTP id
 2adb3069b0e04-545180ea93emr3217951e87.4.1739528096595; Fri, 14 Feb 2025
 02:14:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org> <CACRpkdYL4odi-00YDi-cFuVgw8uBncA+ZxGYnRRhuYR7eZuBWw@mail.gmail.com>
In-Reply-To: <CACRpkdYL4odi-00YDi-cFuVgw8uBncA+ZxGYnRRhuYR7eZuBWw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Feb 2025 11:14:45 +0100
X-Gm-Features: AWEUYZlEKbgfCg5LM4mAcnDmuKyPgH0ZcuCi6oqVDIjGsTxRu9-K5fCxAVSS7C4
Message-ID: <CAMRc=McEgpm+rafr64N-NeOEqk9OzwaEb=7u5ZXQ6vwnQBgyTQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] gpiolib: indicate errors in value setters
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 10:56=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Tue, Feb 11, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > The value setter callbacks (both for single and multiple lines) return
> > void even though we have many types of controllers that can fail to set
> > a line's value: i2c, SPI, USB, etc.
>
> Yeah this is a remnant from the design that was done of gpiolib,
> at the time (by David Brownell) assumed to be simple MMIO register
> writes, so not much could go wrong there.
>
> > This series proposes to start the process of converting the setters to
> > returning int thus making it possible to propagate any errors to the
> > user.
>
> My worry is that this project will be another one that stalls at
> 85% completion (like with the eternal descriptor rewrite project)
> but I guess the upside outweighs the downside, and I also trust
> your proven grittiness so:
>

Unlike the descriptor API, the changes here are quite trivial. There
are about 350 drivers that need changing but can be done relatively
fast.

Bart

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> for the series +/- minor nitpicks I may send that I am sure
> you would address anyway.
>
> Yours,
> Linus Walleij

