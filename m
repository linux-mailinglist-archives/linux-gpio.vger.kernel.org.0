Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A69D1F9101
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbgFOIHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgFOIHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 04:07:17 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C1EC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:07:15 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e16so11910931qtg.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vBzkHQlUwNAKecOw5worB4oaU4+t5XgOuetCS8fy4xw=;
        b=0HCE20cZGkuIwMcp/lz/00XZljW2XEyhB3Z82BIBuS/JPlnHoQqMuTSqVDF2TrmdtY
         ftrlj1aZ5tb+IDbDfdudEYv48TVoouxw9a2DqiZRJ+g6CIuMYJojNi+1OfPsAivMrWwd
         JhDrUvY8FuBfDZ2QfshHQvYMoQJPfEVPLcGGBD7a+gmHU3syS5c5QeE9P4mwVTh627et
         tEGs8NPttHYYqYKfj+B7FbuUjSarvnFEZLbmM0T6n6V9dbwjRmThUSwL+c+dPK4wXgH5
         KBuP4m0BnJDWAiATNhYfBoxWm4vdXLJRAD5pJyHQDD2O6ODvCPMEXGEoseZaKvzqj6F/
         StKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vBzkHQlUwNAKecOw5worB4oaU4+t5XgOuetCS8fy4xw=;
        b=s7SH5/P0hq7xVpUHHtMaXXvranT46HInQCjmeNPwIMnCaBdM4Sx+5pBojZwwPniIFo
         4zQ8Kc5i/jJpuKisjXlqLNInLHJeRL5Dyw9XEjXzzrpiYJA4G7j0J/gFqwfqd9Mg9tFa
         kjfELPIWdzwYtliZTkLWUGULUUC2NyeAqL/r6A656y7Hg29wfiXgmSlmniXxazlBc0WY
         Iq2wItVBl/Q92N27ptIS5npBO2ryYexm6Rd8pKmMM22BLOxfh0AIuxLpbK1PU7zmLdAD
         NnUfltX54eOyo8/gJZfUnjs2Eo6k/ljl6pYFfT4X/rh9eeMHliOur1f9I10VvaD58Tto
         FU3g==
X-Gm-Message-State: AOAM531ElEPt6VbXzZCbOZrOGW1SNBCm40tpy4SxILj0OEFS6VAe6/oq
        wNN3qPygHpdEzK1iI6PmuSzyk5SjhDQ7x3SgwQFtEw==
X-Google-Smtp-Source: ABdhPJx9Qqx9M5g6QH85LC2+JvGtPaEH/e5Mu1JucgvCN1amgjGhgTI8taMjFjSeSSmIAPFNXsz11PUVMXfMp48SL4E=
X-Received: by 2002:ac8:38bc:: with SMTP id f57mr14972204qtc.131.1592208434926;
 Mon, 15 Jun 2020 01:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <53b5504b-dd06-c1d5-5334-d4c5525eca93@web.de>
In-Reply-To: <53b5504b-dd06-c1d5-5334-d4c5525eca93@web.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 15 Jun 2020 10:07:04 +0200
Message-ID: <CAMpxmJWgb_s2QgSsdw8_8gTF+hQSLHiXNMiu1-wj3Bct7L5ceQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the PCAL9535
To:     Jan Kiszka <jan.kiszka@web.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 13 cze 2020 o 16:44 Jan Kiszka <jan.kiszka@web.de> napisa=C5=82(a):
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The PCAL9535 [1] is compatible to the PCA9535. Additionally, it comes
> with interrupt support and input latching. Other features are not
> supported by the GPIO subsystem.
>
> [1] https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 1fca8dd7824f..34d635e51dda 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1131,6 +1131,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>         { .compatible =3D "nxp,pca9505", .data =3D OF_953X(40, PCA_INT), =
},
>         { .compatible =3D "nxp,pca9534", .data =3D OF_953X( 8, PCA_INT), =
},
>         { .compatible =3D "nxp,pca9535", .data =3D OF_953X(16, PCA_INT), =
},
> +       { .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH=
_INT), },
>         { .compatible =3D "nxp,pca9536", .data =3D OF_953X( 4, 0), },
>         { .compatible =3D "nxp,pca9537", .data =3D OF_953X( 4, PCA_INT), =
},
>         { .compatible =3D "nxp,pca9538", .data =3D OF_953X( 8, PCA_INT), =
},
> --
> 2.26.2
>

There should be a corresponding device-tree bindings change in the
same series but in a separate patch.

Bartosz
