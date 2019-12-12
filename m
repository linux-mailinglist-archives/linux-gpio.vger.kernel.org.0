Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9CF11D1F2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729754AbfLLQLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:11:07 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38255 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729744AbfLLQLG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 11:11:06 -0500
Received: by mail-qt1-f195.google.com with SMTP id z15so2723093qts.5
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J36V1pJhDWvY+Dx/L59DhKRMdQPLMp4TrnMDkwawEps=;
        b=eYdgXXDrLo3N7TPOZym8Ii4a5/0fYUMf4V+43Bx1p/z4aK9/4EicJHuOCuZPzzGcz5
         lpj5BDFYD0+VzZ74OyD41X01yE7sa3sK1UwegrzRxerZgLsSHHOMHon9h03I4f/hsNJg
         SBkVbzLihP65cQOtMI2awN8Yg/5RexJzOyz3OjJlyXdOqJGVRcges1eo/1YSDH+m1vvG
         20st/o37g5Hlr3CMWakQrg3/Kh1Co0bmteRFuk6ub1LV8AqiTGyJn8UhflGrsOnebocT
         JQsxDDznfa2eIEsdxX34TEacUROZaxUo8yGRCRc9N7+TiuDV633fCymRyPv/vO9G5SBQ
         6iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J36V1pJhDWvY+Dx/L59DhKRMdQPLMp4TrnMDkwawEps=;
        b=aRjaHIPHCzbiDLrJMAvuS/vrH3e5L4xQZDW9xUVKTcMViGHa8kqY6+CcwSG5+ZRXKg
         U4L1ISNwHD5jUsBHu1Kd2j4pU29MhaHe5mV+SpzwSl0/fjJnt7BXI+Cr/Ox5P6V6pHz2
         oFZMI2YcHA3yQvGRBPiJhGdZd/wGWL+BSM7v/qzr7qiqspxszU0KH5Iav8jdfVI4S9Ug
         KqxTyv6qPEXsBo588XGH/FDOX+/LsL3eiEonLqQ+gAu9re0zulzswOyiLkN2syOH7tqz
         lHPkGfpYcnys/yhPHiEeaAd7Re3jp7P19ZtCPYxsrDllrCuLEc4Fnc4KeCVC2BsooMtl
         ruNA==
X-Gm-Message-State: APjAAAWhKaAVJyAzxGnmJ6Zy+ta1aIbXVCL8/JnUSqlmh8ptMtWzeoFB
        CirvZw2+9vZ8rB9APXHQfaDfwl5KTT9PUpTHbog3q2oh
X-Google-Smtp-Source: APXvYqzQNMLm12HDtTY9Fu12AhKO1C1qBUDdIZjUED1tgYBSQI1deZivaPUJvMmFZxWCZuAR5xVLdblmx83EfGnfDts=
X-Received: by 2002:ac8:3703:: with SMTP id o3mr3873610qtb.208.1576167065988;
 Thu, 12 Dec 2019 08:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20191212133306.24663-1-info@metux.net>
In-Reply-To: <20191212133306.24663-1-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Dec 2019 17:10:55 +0100
Message-ID: <CAMpxmJU0UmA0ZppFPDMgMZ9jfz5v55P0yy87-qY5=P=QKzckiw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: remove unneeded MODULE_VERSION() usage
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 gru 2019 o 14:33 Enrico Weigelt, metux IT consult
<info@metux.net> napisa=C5=82(a):
>
> Remove MODULE_VERSION(), as it isn't needed at all: the only version
> making sense is the kernel version.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/gpio-sama5d2-piobu.c | 1 -
>  drivers/gpio/gpio-tb10x.c         | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d=
2-piobu.c
> index b04c561f3280..4d47b2c41186 100644
> --- a/drivers/gpio/gpio-sama5d2-piobu.c
> +++ b/drivers/gpio/gpio-sama5d2-piobu.c
> @@ -244,7 +244,6 @@ static struct platform_driver sama5d2_piobu_driver =
=3D {
>
>  module_platform_driver(sama5d2_piobu_driver);
>
> -MODULE_VERSION("1.0");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("SAMA5D2 PIOBU controller driver");
>  MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@microchip.com>");
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 5e375186f90e..866201cf5f65 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -243,4 +243,3 @@ static struct platform_driver tb10x_gpio_driver =3D {
>  module_platform_driver(tb10x_gpio_driver);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("tb10x gpio.");
> -MODULE_VERSION("0.0.1");
> --
> 2.11.0
>

Patch applied.

Bart
