Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF61E1E09FD
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 11:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbgEYJRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 05:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389427AbgEYJRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 05:17:09 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39A7C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:17:09 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f83so16856773qke.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UPKAWDXzbYpZcHZzE/jvh4sEsCXtgHO9Rviklrj4c2Y=;
        b=h5iYImghCJhux6GT4d2kO7zNAoMA8fEcSSkSURRXarw2tjaLULyyfuxuVY/52g3yz3
         6kODCAB7qd44fe7EVjnkJU3QcnefChDGILeJaBR5sIW1L+egXZ2DLr3hDAzLUtLQunwG
         eqrRDW/LuS29vX5ageDRPa2c1Q+vCrhIvkwv1bCPNoLEwhFuSZ7BlyChZ3sLdPgj6AsV
         f6185DEYuUvH2iZYAvOotSKaTIPDe5z0godcIwSgpxDxjypOqtTjTWq6RvDxhSEe9Wpz
         me/D89KNUT8EGL6Cm9qTKEdA8QRqR+5vNgWnR26pw4j2W5iKOzr8y7mulkdGIvYx2ViZ
         No9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UPKAWDXzbYpZcHZzE/jvh4sEsCXtgHO9Rviklrj4c2Y=;
        b=T7Kb3BHeVsM0dd1ommVDrRuBsH9d2vq9lxZJ35QcxDlhib0lBLUaYiYvEksdA5EYeY
         mWRV1IgO7h4Xri3FmTxl5KUM0PwVvh4qVi17nuc+z2eTIAiuQ7sUfOoKNK3MGHjAc5wW
         P/Mmp1JUyOV/IcugUo/6VypVlI8FBOpyI4nnI9dO/dheiXipQedNJi9WdQKCrwbNlCjq
         0HV45Ialyh+vqEZBf+ROtN535rck7EjyZM6zQEtaB41T/2qM0/XbXRnBOhvoAVxviSUg
         2fA8HhfWRYQI5V4UfrodmVl11+SWjUuZjaYFR3XGAuk3ZFXZvLI8ekPTUSNBQQWnfvCY
         HRbw==
X-Gm-Message-State: AOAM532QptWwVMDR1BdsR1ZmiGwROdfHxuH6IxrrjQb+V8E96ThbqCQT
        d93uTWJzWnzNrarBHnVV57n7k7VrRQC18BYbTxIE2w==
X-Google-Smtp-Source: ABdhPJz7FwnxTWiLNqiIZD5a8zZv3R4oMP54vdsGuztkluwJWwXSbqlfJg38I7TnuuwobKL54EcMhe/ah8LeU9964M4=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr3484622qkn.323.1590398228936;
 Mon, 25 May 2020 02:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 11:16:58 +0200
Message-ID: <CAMpxmJVYPweUL9J5uitp6zCAniQAZ2+EBuxt-pYcDarLJkcqDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 22 maj 2020 o 06:12 Tiezhu Yang <yangtiezhu@loongson.cn> napisa=C5=82(=
a):
>
> When call function devm_platform_ioremap_resource(), we should use IS_ERR=
()
> to check the return value and return PTR_ERR() if failed.
>
> Fixes: 72d8cb715477 ("drivers: gpio: bcm-kona: use devm_platform_ioremap_=
resource()")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/gpio/gpio-bcm-kona.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index baee8c3..cf3687a 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -625,7 +625,7 @@ static int bcm_kona_gpio_probe(struct platform_device=
 *pdev)
>
>         kona_gpio->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(kona_gpio->reg_base)) {
> -               ret =3D -ENXIO;
> +               ret =3D PTR_ERR(kona_gpio->reg_base);
>                 goto err_irq_domain;
>         }
>
> --
> 2.1.0
>

I fixed the commit message, since this patch addresses the error code
propagation, not the checking itself. Applied for fixes.

Bartosz
