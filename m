Return-Path: <linux-gpio+bounces-25061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D08EEB39F37
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD8915633E3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA76311979;
	Thu, 28 Aug 2025 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W7tulER5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A891DE3DF
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388409; cv=none; b=fxgZ4uRvKlOfehX5phmu3yitDQyPJ4/gxVo/OmR9+vdfMyl4D2r9fxOxlXhlKeiSNEoYQQxR4juzwoZQ5H8WLD7btjWWwN6B3O5eHGyF1vGS2ybmPZQl5BH21ZB9iMm0feTkD36z2Jal3HAutaePHxlzG0LzZrK1ng8zJoRiM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388409; c=relaxed/simple;
	bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZJNBauC/vUa7n9Ck0jIOLve5fBvmK2Vkh0kbIzD5c7wYyUs0MmdZSJqAm/RgFKt/HHbtukudns49Vs+XmyfhOk1jmwJfpuDhRE4KUXWYub5Iw4Ds6gs6Cla/cG6vyzbCMcxnExTC0UmvpTdJU1eGlWB221g3aKcJ27EGVhhihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W7tulER5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f42e4c3ebso1005153e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756388406; x=1756993206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=;
        b=W7tulER5dq7jYeXvPM5JlH+cd7UpZLmBZ7uMNP6oIN8IM0Kn2N22RKAMvnKzwPaV/2
         9MOmj3X8vMgmD7U+RdZSmf5A4A8TM+cr48wfJUYILLXbgJ1nd9SisteHGjO9uyTnwkCc
         rwt9bYaPq5kfPkDC2pOUXw6Nv9znYP3h9UOvhcpC2gfvMGkf0IZyhDv8sFAJTveCGiaw
         Ojo7JbLRf7lnIXhDgv7HUF8rrJNAOmp0226py9aLDO0BCM41lhSjExemhbfPs9qLQuR6
         8iyNB72tToM8X/HRhpO3ZytznUjlsak/84/1qRupwdgZzHS19CIvb1GZl+yAFXPren52
         MuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388406; x=1756993206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1SJzZViXK1pDr1MQwcNm8sCV6Q5rAI1ANY20Nq5OMg=;
        b=LuOkG1QMDfTOumMmR3ea29OegZMfbrPpjlP2DfwvFRsDSUT3B+XwHZHoyghCDGqj4B
         97KqHgjZIGest7/BosUnHyx/Zooyiusdz9jUBPLz37v1s6hEAxQcqgDIHVRjE1vMx0g7
         /E1JTLjY9hkNiohqC/CaWLx99gkMCZ6KlrEd3S2Pmpo+jzgMZeraQfATCSiWvCGHXm5W
         LGeNn0Jy9EiWcmmTnAp6UshN/azKsuXB6ZgqNNk0JbKYY8i3+CecMbt5vNily1QyZD/F
         c5veXQWzy0bHQlcz74V1+aCGmo+zWsfIKf1aSUHdAMotLEzzNf5J+vguux3+1w5drGG9
         XhgA==
X-Forwarded-Encrypted: i=1; AJvYcCVHlpJfbV6c3/B8Qq+wMuzhpM4jC3T2E0CdDyxAtDrzHfmRIiwea/1otgPjouDWAsyEAvXOOAIS3LS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1VpCuogV2EWI601zo82WnpD2JevbOQTzoUXELShl17mUg2lwP
	HMDO3aRkWSu+KGfSOVHi6Hlq2TmF+gpkHbmwWIb9yerC8hulkR2BrFq3N5FI0biCLVjXZylvzzD
	3gq8ZU1DZijSrwxw5pXrMy2I1XzJ+Cn5l2JYjqrZZ8Q==
X-Gm-Gg: ASbGncuYQwHKi20uy0nddwpw6ipTpyb5FgRkwzqB7M/JN+eACFextNG1EJ7n6EbT0WV
	6Afcng+YREf/xi1CwKaq4JtamkWd22vyEKfCvSX9XuNfGA6PixAYsuA7fb4NFjBW+hsCBcWCxF+
	WQqlr+UA0wdSlN+A8SWtZeU09MCFl4RTXrWIyl6NKRBlrYGJs/EyO4850vWqHFTtjyFAhQ17ZIi
	DpsJZMi+qY7vjGpFEeXYU8IjNPfY5xkhHnxsvFDKpQJoHMfYw==
X-Google-Smtp-Source: AGHT+IGEHfgeJNFnFd0JwUZuv/xEjSmtTQV3xX9+3Fib4+CShUvUGEuUxLvZOINoJq+pi8siJ77xgUstohrji4EmgCY=
X-Received: by 2002:a05:6512:6410:b0:55c:aca3:dd31 with SMTP id
 2adb3069b0e04-55f0c6a0cb4mr6599923e87.12.1756388405786; Thu, 28 Aug 2025
 06:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 15:39:54 +0200
X-Gm-Features: Ac12FXzYXIxJ4_0Msx9nr1o6HpvE_T-GuptKwBJkpe8LH3ZfWmN-4aYU7mkYoRY
Message-ID: <CAMRc=MdBtkS-6o2wNDwwhNkJwF=FPO2BZv=Ac72v+EyL2eotkA@mail.gmail.com>
Subject: Re: [PATCH 00/16] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.
>

This doesn't apply on top of my gpio/for-next branch, can you rebase
and resend please?

Bart

