Return-Path: <linux-gpio+bounces-12384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D99B80C7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0327B1F21B48
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 17:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D691BD03C;
	Thu, 31 Oct 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z4jMgQG2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F51A0B00
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394179; cv=none; b=Lr8GdSCVJvN/8HOMbJUVjNU/3Bb0MHfR6G2v+p6+yXwms/AQvIwSzeqKjQ5daVFYQyaNn4QvzMOnWHSbGNRPPdVDcfeg6HCTTiN7oLNLZX9yPJL4xf3XRWrCH67nSPP8qnvXajkbN+3tLxAWxgwE+5SIIhErG2qEJ/U2lO2i4AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394179; c=relaxed/simple;
	bh=rkD19Bqc79gsPO5JVFTOqLgcccwuavxcVndttCcVjlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gx1tDy3pPDaZKXUtxGvspaTUcGcIl+pnWInaYu0+xYB1c/NSDqiddDlhvvpD1R+Sg2nNyGQmo8Juiq4JJHbvwMMWsu3Wj4U+iA0Zfc88GpkAx9e5ihn7R+mp0+iTmCE/BRK66fdTIfvy2maO8AWMMlJ3jm0kqK8+2vW2jBuLG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z4jMgQG2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so2012903e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730394175; x=1730998975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itclNzkuhsNhu+rLimeOXz9VP4f+jH+BEVTSGay6rCw=;
        b=Z4jMgQG22yeSNkBwV+gYoJ2j2ep0LXQMNzfTrLdGWKmj8a+HpKvCuPOEu74hahtPZC
         yvCsrFpvieMYs/dm8OdTlW7WLWhRayqM8hcMBLYwPyteZnKBBFKs1kOzwPOvmbg9Zv1o
         J3VeQ2TiNf7+Q0dVkmXESoODFZjeONZR5Qn9Q6Ao+RD+0A/QARduMBOdQDS0IZ8ifK91
         JaxyduackvfjcGbX9DWTWHJkNHzERp5TQCG5YaVztfqiDAlyA1krBxQGxlzW8EjIqbEg
         Hygc2TC4Fzw+2jbZ2+orotyviyL2tzEs0NHFb/9cgZwjQk4+vxNq3KFX7EeUxI+Q6l1m
         aolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730394175; x=1730998975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itclNzkuhsNhu+rLimeOXz9VP4f+jH+BEVTSGay6rCw=;
        b=vCJ+Jm65V44okZAJIAU4wLRePgbLWZQP95szEGlWRJKo11k+8SYMI+K2aroU8QmsmC
         Rs0+gSEp6MZKhoDtmegpcmrf3mGxKfzUrgA1cDtV0TLXiZRFKOiBJMY39Jfhmq9CVdZ3
         JPD9tNNtdJcve5cMm8oi3CUXDvB1T5V0Si3boC4Df1CYXqXgNNqmsRHUgQ+kIpSL+9yZ
         TJwc7X+hj/eUag3KqsumIzQO8/Pd+6lWLdl4TrjBoEvSujTbNstS84U57U5dRxCArmVG
         nHv/H7qztUytN0sSffYDAxiZ3nyZabT+Wh+Kxy87nl1ukOvEbsgh9L5rITtui3YDY792
         jN8g==
X-Forwarded-Encrypted: i=1; AJvYcCW7B6DEXp7lEd1/Rq4InqfafsDIX8wo6Y0/yFCff3oXdinIIuAvA5bLzxy5iLp69uXXF4A2yBa92xmK@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWMvN/a9CFUsPhXgMReravum2ANe2ToZl2d2CMrjw6k5eLM9g
	Qd5lRTiC9hC/v0+2No+weEDEZQSbVxJsaYWnbFGqe1K/nqJzoXGw1ynSDuDZCUloNfj3siCArU/
	U4ShuDpEIIXUQFDnq8A9uc145rIqFYw7/H0cqBA==
X-Google-Smtp-Source: AGHT+IFkGhs17fk1WNgW2Lc1+p4at0/K/jnNWJKMySLeyD5thsCli3RrFU2Jul/rDz+A9y3BBriis/mOAyCzaxsMr+U=
X-Received: by 2002:a05:6512:3a8b:b0:539:89a8:600f with SMTP id
 2adb3069b0e04-53d65de5298mr761196e87.23.1730394174627; Thu, 31 Oct 2024
 10:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028125000.24051-1-johan+linaro@kernel.org> <20241028125000.24051-3-johan+linaro@kernel.org>
In-Reply-To: <20241028125000.24051-3-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 18:02:43 +0100
Message-ID: <CAMRc=Mf6yaZMsF5x=vPet=y9fa5ZTuWSAA=oi+Qw07TF8GEFbA@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: fix debugfs dangling chip separator
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 1:50=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Add the missing newline after entries for recently removed gpio chips
> so that the chip sections are separated by a newline as intended.
>
> Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
> Cc: stable@vger.kernel.org      # 6.9
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e27488a90bc9..2b02655abb56 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4971,7 +4971,7 @@ static int gpiolib_seq_show(struct seq_file *s, voi=
d *v)
>
>         gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
>         if (!gc) {
> -               seq_printf(s, "%s%s: (dangling chip)",
> +               seq_printf(s, "%s%s: (dangling chip)\n",
>                            priv->newline ? "\n" : "",
>                            dev_name(&gdev->dev));
>                 return 0;
> --
> 2.45.2
>

But with this change we go from an incorrect:

# cat /sys/kernel/debug/gpio
gpiochip0: (dangling chip)
gpiochip1: (dangling chip)
gpiochip2: (dangling chip)root@qemux86-64:~#

to still incorrect:

# cat /sys/kernel/debug/gpio
gpiochip0: (dangling chip)

gpiochip1: (dangling chip)

gpiochip2: (dangling chip)

Bart

