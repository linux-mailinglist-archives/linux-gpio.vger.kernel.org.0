Return-Path: <linux-gpio+bounces-13468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ECD9E2D3D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 21:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EB561656BE
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 20:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC291207A2C;
	Tue,  3 Dec 2024 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0crTEutL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C837207A1F
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258196; cv=none; b=mhq9eYYHw9USYsjNEete39D9CV7tmTe+9gShxX9W6NvsDwfu+Zq+BU3WmToM1u8xzTnfWpHRcvxmfKbByI1ZCSp44lG2hNtPOLLykIFR2Pv65gd2jIbpIHgx6Cm6Qmil6l5JX2xq+815e//vFVL/fMOS8nax4vpNyJdjIQOgJY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258196; c=relaxed/simple;
	bh=QXiY9wlQDTfv2r6SXwdbtfGBrrPbZQtGf2mESKg2h3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELXVjJAbwhROTd5r5jpmArfCfk0KJyOBroAQXXHUbVyiTMZj65PXIKRQcKKk81NsLY/yyfyrGk0w2k68nONxCF5DANH7zyjVN0VUCp2AFUQIsSZBG2RdQmWMas/3FJLq66hA7oFfWfw5p8RF3/aSn6+329AtdZbqYLW70v9Dz78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0crTEutL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dd668c5easo206182e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733258193; x=1733862993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa9RpnKEiAEb345qyNd4ttye0dPD2P0U26CPhxLTwvc=;
        b=0crTEutLtBqBaWRpl024fndkbwQ+2RODNRscfXx35dXw+oXj/qbjTHjHTNxJNoS4ZO
         W75kdQM1AHdzASfA709BVQpcXxtuTTIHELWxd0nYsIwUEyIggk/yUEPolRN3+hveL/Jv
         IGQApW2Z/ES7UORtEWE979mZiFLTDeuIapCe1zma1xhcAWfDZKS+fUGzgbtuwiDgWSdG
         NKAiT9IEPMY1kyL07N8EJDo4+Z5sgwjmRKE9L8MR/1AaJvneegG6M5lNskNrZGoljF4i
         qqCnJeqcC3tBYvwdNCHChXVi96DSp26IGVHUavsB0iLywEQdC+oajjsavlG7mtqOopPV
         N/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258193; x=1733862993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa9RpnKEiAEb345qyNd4ttye0dPD2P0U26CPhxLTwvc=;
        b=YFTXGS1nyHgvF9G2Y8TDYqm2r+aJV1p69rTIaCXNQzloan4mLkBAOTSN1OBXrw9M6G
         d+eJUODrxw55kzIHc1cg34JfoZvUKc9JUxms+S7tWNsz0hexIMh8kfVHeZZbwIwtzwAj
         o3Mp1TkZx3AgUDh/bofzay/sJgts3QQl+IWN4BcMwgaQQNnXlVjUeoZaGyWZBzqWlmCy
         OGMQ589/SPsyRjsDQOwGx3EtfFzXXUtXX1mzHWHYyT7xBsi5+FTVjMOkXKxwCUH2gXhS
         QLtRU+XoTcqpaWJl0/7YnkKSOcCdZlnE3Iz1m3wVQM5gvSVtBTs23TQV8wTJc7//W5Wj
         tFGw==
X-Forwarded-Encrypted: i=1; AJvYcCWCwpfVy9PGBPXvjzIvf+5xC7rrtCtdJqeM/S+Xs92kCJuulCJEsTMFjwUumHyFUqkEeWs6j7x5RHNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtfGpKaLENbughVJzIFdIMp+WrdU8mWTYhmvaRpeLbM5KPKzO
	jNN8U5BQI8JNjtVRQ6inLig6BW4QPsMJ1etOlk75BIsW141XXqDwM2UlNBV/w9V6jKcuSW49lur
	79+jJGh6dtmdA4844VDcW+u831QgqgKWokaeqyg==
X-Gm-Gg: ASbGncvf6Fxd288oxS7I4b+8d3Q4mj8XM4FhetOkNnXtmICupgIKdiu0aZ0WrX3lDm2
	msfqrtamXY/YyCB7BcTVRXpoSo11fEpU=
X-Google-Smtp-Source: AGHT+IF6YBoTwuBdgOpOWSXBiCbuv39rcLfGYwu6MbkSKePQciRdJZe7vgR4xcYOBqeUDoPaXH34OpbnkcC3pC4LtKo=
X-Received: by 2002:a05:6512:e8a:b0:53d:f3af:748d with SMTP id
 2adb3069b0e04-53e12da8bffmr1452545e87.4.1733258192614; Tue, 03 Dec 2024
 12:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203164143.29852-1-brgl@bgdev.pl> <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
In-Reply-To: <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 21:36:20 +0100
Message-ID: <CAMRc=Md_u3YmseW5kV5VH4F99_0P=tc4pWty_fB3dVfv_JDxWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
To: Andrew Davis <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 7:41=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 12/3/24 10:41 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > For better build coverage, allow building the gpio-omap driver with
> > COMPILE_TEST Kconfig option enabled.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   drivers/gpio/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 56fee58e281e7..fb923ccd79028 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -530,7 +530,7 @@ config GPIO_OCTEON
> >   config GPIO_OMAP
> >       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
> >       default y if ARCH_OMAP
> > -     depends on ARM
> > +     depends on ARM || COMPILE_TEST
>
> Why do we have this depends on ARM at all? It already has that condition
> above on ARCH_OMAP2PLUS which limits to ARM outside of compile testing.
>
> And anything that selects ARCH_OMAP2PLUS also selects ARCH_OMAP, so we
> could just do this:
>

I agree we can drop that bit.

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -528,9 +528,9 @@ config GPIO_OCTEON
>            family of SOCs.
>
>   config GPIO_OMAP
> -       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
> -       default y if ARCH_OMAP
> -       depends on ARM
> +       tristate "TI OMAP GPIO support"
> +       default y
> +       depends on ARCH_OMAP2PLUS || COMPILE_TEST

This would default to y with COMPILE_TEST. We definitely don't want
that. IMO it should be:

tristate "TI OMAP GPIO support"
depends on ARCH_OMAP2PLUS || COMPILE_TEST
default y if ARCH_OMAP2PLUS

Bartosz

