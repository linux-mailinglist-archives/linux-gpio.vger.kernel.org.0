Return-Path: <linux-gpio+bounces-18233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0DA7B90F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 10:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0CC91897E63
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 08:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1871619C54E;
	Fri,  4 Apr 2025 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="awDtH6Sm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32919994F
	for <linux-gpio@vger.kernel.org>; Fri,  4 Apr 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755899; cv=none; b=ADVU+7G03XSHqQA42Wzn5glEZuLu13CPkGWH5h2RKpI3Q2NWDT/ciAI56QNR4rbQPmcTzSmwd0exiOcKqzwHEaUqrwUWa+Z7uBAQtwNmqdbTt/OSQLzc5AJa7tMNXdJrZrsS8ol6HVnI2vMGkjqHJGgE5sJYeFuIJwNrPmNg5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755899; c=relaxed/simple;
	bh=OktGT+TBkq3WfpZd1me7J15mRYBZ6g9T1DYDBuhe3d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fN8vuvOoEMa/msXlfrt+G/Q5JqeI6haluVtjm1rPTJEcRC9/xnLb+j9NlhugkbCC85XdCU6tsldclOdxSI/VjY+UvW816LH3nq0P0Kc9aYRBuc1QUkloKef2/BtjBd7ice2N8GRkmKmdfBm+O2uQ4Wr+VvfS41xKiuY0FeQVrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=awDtH6Sm; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so15134401fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Apr 2025 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743755896; x=1744360696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjK7W0Om4uq93pjMJtCwW0RKoP5OEp/tohd8eg66f0s=;
        b=awDtH6Sm4pWEr6KInTiEOOi8NnZyDAmshppMr4eQwj9VhLy2EshRGyZ/WmootQn0oj
         OoQJLc8jRb9Xmlz/YA2gJyLUJyP+HXn1PAeaToVeOFSD4ladaH7FKdNv/3gu5iKjoCav
         VOHBvwklezw7I9mkfDBZB2JIjwtglcKweoGjK+Co1oYmycg2ZwgoFgBaBrpRtSsMJTZF
         Yt8JBAI/qKPyvjVQGwAFaCvBeCQIifzPIbixUKxoTv2wJvBCi1Ks28q9K4iPhzKxzOP5
         yZT/gHo43HobB1gghIk3cWNKFxJEnOL+BiBLeWq61RABgDaFc1x1vXn6HdlT/+ouJZBp
         /H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755896; x=1744360696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjK7W0Om4uq93pjMJtCwW0RKoP5OEp/tohd8eg66f0s=;
        b=U3UWbLgotaILuImsvKJclVd7bnlbdwcM1Kozxzpz9zM1YJVcJB5YxyuLmFuaBSzZ6f
         qXO/JRuDKHG+j2mv3eXG+joZWlaHKq6zUPOnvfbg6o/RRJgXMvWMQuFLGk5xQcxH5b4P
         VePaN1pz3o18fxTL3QV14puiQakU0BSICKzAilAkAMpRTgNeI50ypKMK7832qaJ+6GPF
         SyPC8s4eXwFfKeDXul9v5fjY1VUnyi3zbxSP0EqXMKxHIKw64Ht7i35qIuCCnuLXA7jl
         aUehR0Yf4cl106YuIsZeYJYGVtrE3vcMZTNRuv1gMGS8Hpe4/HFWL34vLvk8bNHJvM6n
         PCzw==
X-Forwarded-Encrypted: i=1; AJvYcCXM+la1iwP0YTfuI+NpYgelTaFOM0neEGc4aPxn0cDRy9zf/wIZ2boU3jE9NV4QhwpAs4EGaybVlPgl@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqmdjBt1sQUD7JHwk1ViImu6bLT0M2sKl3p9kzQkDBgiQG9FM
	enlO2mHXpsIk0i+78tXU4BCDkrp81lIVldwQtHUsFFhTd+SwS4RKGZ8Tm3FOoHe++JDMrqB6yAu
	kyAmz0yPafO0OkzuDFN42rMz92WkS728Sj0iaLA==
X-Gm-Gg: ASbGncszWfQOi9844quhOXyLZE5MhqlsM57eb4+3IDoJiDCWx+LH9h+emAbRbo3KADz
	V3nkAunfliW/M7cgjPl9/WC93FDGjfOdRE/C4aG+bkAwQk2SHmm9e70V9bw4KugRwl5N3JlVW2s
	5vSkTauUv3ybgNN1dbrLxRFidpbIn3p/g60IPFX4Ct3m3eNvu/UJ67ONa4oQ==
X-Google-Smtp-Source: AGHT+IFo1yqcfYeeSlc8DpjiZKDyI9rcLin3wb9oxxwP6e5Vf0xIJMSzOKpz/A/vVvQ7XboHvE1K21R5AhhVXknfqdg=
X-Received: by 2002:a2e:a588:0:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-30f0a0f0da0mr7997421fa.2.1743755895678; Fri, 04 Apr 2025
 01:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403160034.2680485-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250403160034.2680485-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Apr 2025 10:38:04 +0200
X-Gm-Features: AQ5f1JoFgmR-MJjXIiICCtTNAV6gI4tCP6L06BPqgDcRNqu4WYtSJEQRY5AjDtI
Message-ID: <CAMRc=Mf8AyxAeNbBbiQn1HdkrEdODmTAhTmrtiAp6H3=HUPSWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gpiolib: acpi: Refactor to shrink the code by ~8%
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> A simple refactoring of the GPIO ACPI library parts to get an impressive
> ~8% code shrink on x86_64 and ~2% on x86_32. Also reduces a C code a bit.
>
> add/remove: 0/2 grow/shrink: 0/5 up/down: 0/-1221 (-1221)
> Function                                     old     new   delta
> acpi_gpio_property_lookup                    425     414     -11
> acpi_find_gpio.__UNIQUE_ID_ddebug478          56       -     -56
> acpi_dev_gpio_irq_wake_get_by.__UNIQUE_ID_ddebug480      56       -     -=
56
> acpi_find_gpio                               354     216    -138
> acpi_get_gpiod_by_index                      462     307    -155
> __acpi_find_gpio                             877     638    -239
> acpi_dev_gpio_irq_wake_get_by                695     129    -566
> Total: Before=3D15375, After=3D14154, chg -7.94%
>
> In v2:
> - renamed par to params (Mika, Bart)
>
> Andy Shevchenko (6):
>   gpiolib: acpi: Improve struct acpi_gpio_info memory footprint
>   gpiolib: acpi: Remove index parameter from acpi_gpio_property_lookup()
>   gpiolib: acpi: Reduce memory footprint for struct acpi_gpio_params
>   gpiolib: acpi: Rename par to params for better readability
>   gpiolib: acpi: Reuse struct acpi_gpio_params in struct
>     acpi_gpio_lookup
>   gpiolib: acpi: Deduplicate some code in __acpi_find_gpio()
>
>  drivers/gpio/gpiolib-acpi.c   | 146 +++++++++++++++++-----------------
>  include/linux/gpio/consumer.h |   2 +-
>  2 files changed, 72 insertions(+), 76 deletions(-)
>
> --
> 2.47.2
>

Will you take it through your tree or do you want me to pick it up next wee=
k?

Bart

