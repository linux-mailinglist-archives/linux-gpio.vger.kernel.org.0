Return-Path: <linux-gpio+bounces-28740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC5C6DA20
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 10:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C5AA52DB83
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50041336EDD;
	Wed, 19 Nov 2025 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vINaM7nM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1C328621
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543626; cv=none; b=OueCiCOoc2RWUkR9hdPpdTpNcc3qDYKEZ2LmTKZPBekF1kX5qquZjPTJ0kj8ZtbPFKu/PjyxGI4YgWkBcxGf+KfS8czZ0x/z4f8ZltYudhzbgSGMxeQiIxsKpRIMalRCL3QThTwvroGAP2P/RrmhUE4iLhquOXx72whVWToguLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543626; c=relaxed/simple;
	bh=SbhtefDEL1JVdo9c7AxfhRGCxX4s0TnTb32liO2X7YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irc+joBodfPJMS3/BDzV0LRKKxHW+Zir1X5Y7BWTq6vqV681X7+81DAHirRHCW83N6pPv1lavXpmqvZWce4R0hCh9wKO14n0Ae4L8ShBDkWW1TEd2drPJC2HkH5oAmJ9fAEjfiAX2HoE8DiRPPpYEB0tvGYM/M/8FaxXu2C4fDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vINaM7nM; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a49389deeso39177961fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 01:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763543623; x=1764148423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbhtefDEL1JVdo9c7AxfhRGCxX4s0TnTb32liO2X7YE=;
        b=vINaM7nMx0gUYKm933DxgFJ1vdxfMb8jPCNTBTVfYO+M9p0utcluwnFF1n3Q0M/On7
         0tBM0EKbITKR2qvsSIA97b69TcwBj7q+TwTzxB9KKyp3cJpUF7C5eXzgKF/IFoj/wmaF
         kdKavfo0nUR7fMNNUbGiyW3S/fyPjZWdEPb1g3b6/Bs67sYCI84jrfbsTAbw0WesixJS
         fEFitDtWzF9UABMhZIZ9ooJu9k9Y5msLew0646YcT/veqv04nPqRz3vIno6aGi0QWXXv
         2oxEbHDNfrszMUvE1sD8YzmM6uuqp+AT0GuSGP7ibuG2FQ8sDgEQu1XQbfHvIcz2+JZ6
         LS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543623; x=1764148423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbhtefDEL1JVdo9c7AxfhRGCxX4s0TnTb32liO2X7YE=;
        b=Xa1TjTM+foBQVNIoAiI/0BygMSyo9nseCXx/wS5Ai1cV1x6EZBFqgShBwcRQQatMYd
         S6RHavXRDj5WQTGzcfOpENF+SMAAwdPkduJCszyD8U0UIJ+LLVR+FdV11eYPHqqm6t1q
         Xi4I2E4/Z/NQMazbmjRLyoCYuQqOI8gOJnbs05PhJuCh7eV6Cps1qeeYzj2FkmKZEhAj
         lu3k9yoqFfR/whDX8i7D9PdxokF6Kg4M1vf5Y5nSkKYpJl/ik5nUjx4xIcpTMgrlJg5X
         bcDb33TaaxrXPFs5VRzqep2mnorEp7st2WYA8Zwmnf+a6K11BOT2Xj7hjYmG13VpBbvl
         ac5w==
X-Forwarded-Encrypted: i=1; AJvYcCUt9vZD3op0ZnY/AjR+kYuZk+spd8UtXyw7uBQBccVHGzd7EoN+U96D4NE/isMDdnIlHbVHZnaxStUN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kbAhA3i85wDXCj9sYxxeybT2vxJQdFbn5n+Kki7+9qKlswuy
	cPdxREgy36fbAYHuSl43pDkTXm//CPd+L9JzHSges2W6fgdcsNg1vNkUOA/c6rlJe6GUB160CU0
	7qnLEXkbjp8BcCY40Q16uqXCwmrgnabjMP+k/KnloFA==
X-Gm-Gg: ASbGncuGRGoe1xUm0VlTKX/BcT4HGLuWpA+sMS+bgocqfmgotisPoF9vbgH/icn3kh7
	Yj7E4cLdc7fX1rpTES7YGk+2fb7ABvy3odlpCt02bq/CUZSEY7AVqEEmcjMNgthR3I/jd1kJGZL
	WcUzGLOvG0PbbW6v0ZlA/IWoNr15O8sVV2o83L02XREL9imoZabftSdumwSqh9rH5yfSJfQT5rD
	bxI9mFxbm4+UnErbipr6a2IEq6bUwGXRMr0ZcFAZkL7za/cRnOpvAOL5h7QbCLgNNpJqW4BFHQi
	yOySGJQr8gDV60FX36SWO50vnluv1i49MhUNkQ==
X-Google-Smtp-Source: AGHT+IHwrmWVe0fTzGNmVIVPgXHKs8nRB7AdVRKxxPYxEkvRQiwB2I68CSlaxxDkR+T2G+m2AFalkbENOhtcE9IAPPo=
X-Received: by 2002:a05:6512:e88:b0:592:f773:3cb4 with SMTP id
 2adb3069b0e04-595841f0d7emr7194876e87.31.1763543622810; Wed, 19 Nov 2025
 01:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org>
 <aRyf7qDdHKABppP8@opensource.cirrus.com> <CAMRc=MfD7ZbwU4akkCJNgmRPwgSOqSVi2-L2dJDOBHrfdD-yZw@mail.gmail.com>
 <aRy31U8EQA1DO/R6@opensource.cirrus.com> <CAMRc=MfNf+WMtSW=Wag0QHAaYzcRe9igrbOeRZiY92KmOH70oQ@mail.gmail.com>
 <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdKN4Uj4RZk=3L82c0-0Z0CihbAfzVK0zMBb9Tsjh3BqQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 10:13:30 +0100
X-Gm-Features: AWmQ_bmlF3VxlIlJXnVsQfGfeaQK6PW5ypfTwhEDVOWnrVb0vJ3HHNi3iPCJoYI
Message-ID: <CAMRc=MeYEoiXWCdYNSmmbquMwmt99vPgzW+0gmX22Of9o127+A@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 9:41=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Nov 19, 2025 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > I have an idea for fixing it, let me cook up a patch. It'll still be a
> > bit hacky but will at least create a true link.
> >
>
> Scratch that, I didn't notice before but we register both devices from
> MFD core. We can just set up software nodes there.
>

Here you go: https://lore.kernel.org/all/20251119-cs42l43-gpio-swnodes-v1-1=
-25996afebd97@linaro.org/

Please give it a try. This is independent from this series and should
probably be backported to stable.

Bartosz

