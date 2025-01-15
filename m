Return-Path: <linux-gpio+bounces-14853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D9A12941
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 17:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 440A87A26C2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 16:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85437198A2F;
	Wed, 15 Jan 2025 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nHjUu6Ye"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29A01953A9
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960165; cv=none; b=lOVPIMY7iryoVoQMJ0b5YuopmYw/YUK83RGoks8D5BPk6hxE1cmMNokN/ZRHmJXp/B/htMlLDDma8MVJ0EO7ra8yj71p6TXE+zNPaiufjodPaKKwnzB0LyFs8UXOf+tstGb9ej0kiEobgTRZSKiDYU8W2fG2m5es4Q+AZK0AaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960165; c=relaxed/simple;
	bh=RSfkRbCWqIamZDO8E8ElkZP3AhnUl+QQuRPa3vEfpEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBmBTugIy7S5NMnu1WEz3NAQiaoBSgM/40wPzAv+o4kMYu+UA+qCMwU9pTyYG83SvprYxrYhzDzLqsntyVx+zCxxB/aFt+Y1bOCADIgLOfaFqmQagcvh92vXPHUlk8R7czOQY20cIGG4Fy9z/ihJq0NjG/rZmkU67bP/BHDvDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nHjUu6Ye; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so67545261fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736960162; x=1737564962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=nHjUu6YeqQ4czKxXhuIArLW29ybB3CtTlbSrFgN3xJpCt5yi0ZNUFpCkJy3f2tyCKd
         zbFwAsFQJrCdKo/fNcSy8keiYdWCX362OZcVjYGN4zUvaavgeqArqzm4C029IgERvF+8
         z4JC/aD4wavJj7OQNzj2sLdKqTiVVtp5NfPy6K62rq3FkQt00MffoDuuGm5G9fEBiJaT
         0srO65+bNX9t3r17ui8PKWwxj5EB+VLWe2JVHBmhSGC53iUw1O93G5WUia62J2Q1jdhV
         NnOlpFoBR5JfGTQegKL7+q0ychW+OWcjq9SofCyrW2NKHZ+eDe9axJbC6kGM8rfZe58J
         KsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960162; x=1737564962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=mb9+WPtjA8fRmZ251YESrv5YPKSIut2w0UaKHZ2EjU68fLsTmsKH9KDvALE8ts5kTH
         qTrdFbYARbM7BuNsAYDOOQnf8eZir0OKnQ1hxSZxv5yK6bLvi3anBHJZCXToBX/dvxjC
         UMfVrqQowUZ8dCBm3U5Yt58lPzfn+WGnZE6gc4yi1XICJHqLiJdPWbvXcUoFutRazric
         T2eCKlDBqNZt9YINbf4JR3rv6A/YE0pIRMY/LZw/48JoeNItfZvYiIJvyMW+072BwxaV
         jg53OEAoTBHFSSjS/By2ypBJG+6nrzCUSE47sHjG9FSf4bQ/805dq7/L+eb0wAKfqNuL
         Jotw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7DMLn86Am5NVQOj7e3H/qRdDdep+y+SGQw97YOhR0fQYvDWq1v/A03rZYRHiEI/0ObQB+sn4uaiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbySN9sfqtS4cH4keQGHl3t40fi/oIHx6EwBjNsZmr6yeOwJXW
	V5xfhpqXE21ZKIG/XUBJyQepC5myrpUtIWc3q+AvgWCNAj19Naw3ftAt7bGBHOdceyoFU8hWg3K
	4RGGNwAedoJ5XB5vXzz95Br9WzRR7SCiPYFc6vg==
X-Gm-Gg: ASbGncvzirGwnOmVg99N+uLLAkEEIPcmFIcFAQaSGZr+9QlsjCHM901uqB08usPPuuv
	EPSdhuafHZLtauLpi8MYP8Z8JeD0tY7iPK7FNVwjZNBPOrH9GOSghjizCa+38i3ezlTbwaA==
X-Google-Smtp-Source: AGHT+IGVCtsxu4Nxc8II+Al+gawBhAtzB4MYz+9Ecl8oqi13xJMRfbsu1WNLIppYV5ME9m0nmbvdoGhE02xkVmEh7JE=
X-Received: by 2002:a05:651c:508:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-305f4531690mr91529781fa.6.1736960161839; Wed, 15 Jan 2025
 08:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:55:51 +0100
X-Gm-Features: AbW1kvYbGBKWyTqAigHygOqZRSa-0z8NaBAPzFESViEk5Er4NeXPKYxQ6sb6LgU
Message-ID: <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.
>
> Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/gpio/gpio-mxc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b420=
9f01b49ad1cbdb0 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         port->gc.request =3D mxc_gpio_request;
>         port->gc.free =3D mxc_gpio_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
> -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
> -                                            pdev->id * 32;
> +       port->gc.base =3D of_alias_get_id(np, "gpio") * 32;
>
>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
>
> --
> 2.39.5
>

This looks like I can pick it up separately from the rest? Is that right?

Bart

