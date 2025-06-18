Return-Path: <linux-gpio+bounces-21773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F1ADED64
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64544171862
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195DD2E3B14;
	Wed, 18 Jun 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bs6kCDY9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC67080D
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251815; cv=none; b=na25SJIOBAr14AxE4bAnVipF6x5O79SGOiGqLBCKSEbWbKNdH/deaAkgkcjkEq86Xl/My73ZnLGXBW//2EMOUWVWougA6ew11xIq0UWvX00+r66EbQ6Sp9V6QMCim/PH/19lplcSM4cOvNKMn5npEgKsH65rA+ey0fOgquZjlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251815; c=relaxed/simple;
	bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKIUL3tcP+UoOTvrZ0pWWBLGYYJmuo0G36z4B6/NVSdyh91JRudhfhmr1Qi+s5xzdtycUaXlVFPOePw5KgFFcR//a0VwMROwb8fj8MA3skGO1D8QWPH4PieUC68QGSTbsbcqSqjhRHjqnKxtjOihSsEcG6pY/EyjytCEnpy+tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bs6kCDY9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6463289e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251809; x=1750856609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=bs6kCDY9848ignP8gnIhm+8gIZj1nf5aqm1g+Eo617UJtS0fNe2gCMk/THkMBe1Tir
         tf+EmuhzlXH9LbmMvYACHpgTFo4DQnp27ppVbycz4DSfZlHawAlaZs/62fjAUSAk5lvb
         S6MvjxjiVzwYoqUcwjcqx4S4Ra2m8BIGYFUxxuqf24zX6J71KlUB3j0EzOCfSmjWIlMG
         cbDWK9+dA14Fh3FG0dmkUAIv2v3Ifjg1oC0F3hO4EwSL/ljKIpZBRMBQ6Oor4OZzAJEk
         J8Bzjnp6Pc7KxLZs65aIt+sWEvSRneXLxQYuS0Fh+MlrH+lXuE2sJYD7ugTcS5zcqcPp
         PYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251809; x=1750856609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=uyKiVFEP6TWjdL80elvzBVk7/WZVBxcG8B3ktplhztuTWt9sS5twcXtYHR7CmLZbZO
         ueybIIKFRDc+X5ov3GMAonVFXICgRP8E3m6S2e93faKrUnCaBu5ONANlNO8F7CMh6Wyu
         3omBHBjgTrX6xJe/Q4caFuzGnrxSlO9GdlteNyIQS+f2AbpTAUvWTvGKh49NY3NnWkoK
         hJlQllQVMcvpIeQL3SRT3lx9XhTDvtL/UwiXCn/64DderHrKnKsz8aWPmzu6iyi+Slsp
         oYqsFKIp1K5/51uudywAX15Pt0TJ5NTr4PeQSLvqC70iM2lGknQEYntZqDIrjFU1e/nj
         q8mg==
X-Gm-Message-State: AOJu0YzgZQm6AMjzUf7bG8b3rmB+CLn1rhu8DC/jDKxGVhl5sUwFx1ub
	Y8zm+W0vwwOOCkXaPQXw+dM4sXuhMcu6GPuphg7XEYJmNoLgLz7/7vWT689JCufPSLlGtna8Zp7
	IEhXEcjlyTdtUPsWynZ+2wx/AV+hGBWOb7GHVVhqaJg==
X-Gm-Gg: ASbGncshvlt4TNsEOORGSjBoxbux42T/aahv3qkgetIkIsW/HTUxGIU6/s8U0/mXTVI
	CJCxau83d7/0IsMJxIhDWm1ONd0anr/gb/kD0r0io/6JFtCWrJCFJDH7EiVcsBb8V47+3AdiKmU
	b4ceAAH6cM6GOoVOK2oNjYOz0sLQPC5OEmUd0v1cgB8weWpbEyv97O249Y20ieLLXZ5poM2rXrg
	AJ/F5A6iJLN
X-Google-Smtp-Source: AGHT+IEq73Sz7VEMckQ6LcsKf9Ah9LwsuMzT2V+DGZ7xnubvjoAkc8Z7a8qWgDSaz5X2ovUTBOfo+akf/lut/OxE/YQ=
X-Received: by 2002:a05:6512:3e14:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-553d444d84cmr738304e87.50.1750251808808; Wed, 18 Jun 2025
 06:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:03:17 +0200
X-Gm-Features: AX0GCFt5YjdlIT0r2MYTgVPiMMrWQk90C3yKPcU3IZdAiNWl5mP9-Yr7Xyq2AcM
Message-ID: <CAMRc=Mf-SnaY8-Azv5p3nT9z5YK0-Rtr4Gs90c6B+3+eoJnTJA@mail.gmail.com>
Subject: Re: [PATCH 09/12] gpio: reg: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I missed one instance where the set() callback is called directly via
the function pointer. Will fix in v2.

Bart

