Return-Path: <linux-gpio+bounces-28655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8FC694C4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA7334F55A4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1390355035;
	Tue, 18 Nov 2025 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQzFbHym"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1635388A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467634; cv=none; b=GYyThpyjCncvbVJqtMspUShPSI/o4Ozy5Ix7Awy42wC5fk3L3+u4aKsXrawWPLOeV77o6/rnmtijX/Pylk4RxqYu+kh4l03f/CBQzoCtf1zViGtw0YImjQd7BlhMspXZkjTVuN+cGctjZeidviwf4PlOeKH23sCp+71ASSLSkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467634; c=relaxed/simple;
	bh=DeHwKKEjLZWFTse7g9tHY7GfyY976LJPMenDaQrV2BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJV1FhDCn4mYeNiEUq3rhy9Q86OPZ9rcgN8ge5+opIX/Ck2EJJxX8X9/JlY/O50bkpHg7+8XzencZkvba28Xc0f1xIr0XmeOhjbCII7xqPqffHU/2Qn5zhP9u4JJTJhgiwK4vMBdbl1bQtx/VHeDnn50VGZJYS8BvzOvaJphOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQzFbHym; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7277324054so749740666b.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467631; x=1764072431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=GQzFbHymMuXAamVgsgwvyfrGKDiQr0asQFaJoGh14bFnhTFCgKmv2YeP6LjUoHkhhU
         1L+c624DAccv81HZ7qUdLA2N4CdTgxk+TECriLKwfF4Ly0bL5q20XRdE/Jb4MgmzieOb
         ZuHqlXaHk0fndchvyR+WBGUU78zy47gC3HHMqgSG4MPi5BvoaFVBwYJFsqxEE6LoDyCp
         IVzEHBX7jR1ZpL2x3R0YuLkWIujPb1Z1H/7HCoRnO+i+H9p5XL1KgvfyxORQyvoEQ5i/
         aoxcNQB+CuwpUMvGjBcSQh/Tb1xDx4xWimF15TZTrXEBUHiGrl68FLe4lRPaXNbBweZ8
         lsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467631; x=1764072431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=ZP/uYhXnt+PLN8P2+4MkyA34yhZAbLF759xXteJeyNVQ0Xa+EdLQEUIJuK7xkc6dHW
         mMITGxCMNUQit8UpG7TZvq3jTXfhrIKL9A1v8N+j9grQFc3XLvBd8p1RyQexRkLL/7um
         416DP0SShlaGuOy5k5bOjl4xrmWcax81+o/5/qq2TgEGM/0QY6VRYkUND46gFyX6lpgT
         K1BFcPE9okRk5DKMYdAduCUc949wCGWiCmWioRHeJ4MwUvvzaTKnioar5HvuFyfYikGq
         C4a7yHfA9sc7/6brMUvzkCmH59iOj4pLVYUfoY4sOouKV6BcnSwBxFsPZFZWIiKOeEoM
         e3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtDs8C1m3kmq1ydHotWyxDqVA/rfngAImdbSUx0v+cTKMJ1xZ5GkQmUWd7yDzjYGGD439HD4cANwqD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtv1eyKTNy/qAffsOAQAoc1xGtc1an19md8y4IZdvinfhJkKPD
	ZbxgmbOy2Qa16qMu3cQ4HWAcv7txPd/n7kd8kcwddKnwPkS3kTWcAzHAAmVGSFsER32ALDisak0
	3Zlz7+UL71AG3/nUGTChZ5P+rVPkJb8k=
X-Gm-Gg: ASbGncthXGJD9iyFb5HP5rws2wVhLlN7VUwPpwwbe0CD+GR9vK5oOlHK+mqu77J0Csp
	03qgIH9/lwjnJYoe5dCifZ47+BkphPpyr62hN0oLb/ztU1tATMPAYHCeAEw77WdRgXdGIL4Gu1z
	p8wAGs0Z6FSN3OXhFsL6bGdjKGIxxhq48N8kgkOkN7rla99DWhOusl8wIIge6F6ZG9fM3U0kiMy
	wjxtPgEtdVitSK9na3HKpRSJM6CDIoAqG1hCnpRW43gA2uCvGhiGOr+TahpBldvd6EkGv9+7fVr
	ONDgjgFdkPX1Q27gbb6HabbZ+XnCgmj4qlADYRuMiyqc677lBvvUONzYC6EnanaE2VLFpt25U5V
	p4fd41g==
X-Google-Smtp-Source: AGHT+IFy67x9V6cH2hLqaJFod32QM89W3J9APhleRbLJkEvfU8oukE776A3bhfCtC5MGo4gC9KLgMlhG45du7MmtybA=
X-Received: by 2002:a17:907:7e8c:b0:b73:8e7d:4f87 with SMTP id
 a640c23a62f3a-b738e7d5088mr905707766b.45.1763467630576; Tue, 18 Nov 2025
 04:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-6-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 14:06:34 +0200
X-Gm-Features: AWmQ_bleoiALlFg3xQPLT0jXfJmB6ug8AfTDr-vB_7secp2PIEnh_6lO4x7Rkb8
Message-ID: <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>         unsigned long   irq_mask;
>         unsigned long   irq_edge_rise;
>         unsigned long   irq_edge_fall;

> -

Stray blank line removal.

> -#ifdef CONFIG_PM
>         unsigned long   saved_gplr;
>         unsigned long   saved_gpdr;
>         unsigned long   saved_grer;
>         unsigned long   saved_gfer;
> -#endif

Otherwise, LGTM.

--=20
With Best Regards,
Andy Shevchenko

