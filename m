Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EBF7BDF9
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 12:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfGaKFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 06:05:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43186 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfGaKFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 06:05:16 -0400
Received: by mail-ot1-f68.google.com with SMTP id j11so12275028otp.10
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+1oHf1+ErP2HL7hVOGccTTUzsvFfZGUFo4kLW3/NF74=;
        b=V4wjj7k//NOYAnpNAy96d0VR3zxB/qYbLmdYJlrlx0nf+bmL39DVNQc/aRXm7+14Id
         PRhm47KopeSw/zRX9YujsBjwurOMNyRArBrMcO+4PVWv9/YoJEewX7M3rp6sBlkT5poE
         Lw7+yeT4e2/pjmdK4Rp+CK7UaMbXrRIPKlX/0lLBU3osLmjUg6j2dUhXAp3+FHUnib8n
         VLrjR/DC1z5Nx4pcVMj3mDFFdkRItDwZSDrRw39UzVjSc6p9hhMhztFlQvQ/WdfGgpl0
         LsRicLctxiARRIw8wpN9xzzeS2+TT5nIbWW0twE2svcmdPwDEmgbFlYvm0RT6HYPOfAW
         K5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+1oHf1+ErP2HL7hVOGccTTUzsvFfZGUFo4kLW3/NF74=;
        b=G7d15wMQK2ZXUSRY683/TYq+CWw0ewOHFiv3sAteG6afKZF1Vu/odOtnTyDygpXzax
         PWLwziY1jDF++YXraxVZ2OMUKbRvRoHzIPFeo6N8Nv6F0+1HNXO+6IlKswfIQ160li/e
         h4idGDQcaV73nExWnrxLzX91w2LLeWDbAOm9NtjFfuUq2MowH9MAbMFCIImguvVaYu7F
         3iYBLV/X3+UZqNIWgll3s2j3DSz5yiyR7puf2hiOM3BhNNciqy9IdGT3SyqhNdQ/s6vW
         KD3V6EAT6VSdbTbDDdzp7EQRaV5r9wTyEjYCVZB4l9AAnwpOx7vDG2qqhwZyRmyW5pru
         3yyA==
X-Gm-Message-State: APjAAAVF2f3CwMPimerqj6ZefryD0Hq48h28NDyBuUZ7SYzoEAidnwoh
        QtqONep2OvWs73ejoPAJBb10Xz+0SBFE3eU54CW9zg==
X-Google-Smtp-Source: APXvYqz5jnxUo8M7IbSxK0LhJprE4y7hCuX1ujLyNA1InAolL8RUQuVGlHq6hYe8FOBh+P3mZT3Ka7f3nLqQT5diftM=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr27744113otk.292.1564567515226;
 Wed, 31 Jul 2019 03:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <1564566474-18294-1-git-send-email-dingxiang@cmss.chinamobile.com>
In-Reply-To: <1564566474-18294-1-git-send-email-dingxiang@cmss.chinamobile.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Jul 2019 12:05:04 +0200
Message-ID: <CAMpxmJXmvcbU5JD6qjEpJfdyWhDMtPbzMsmFHgASuDYzWBWGqA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ixp4xx: remove redundant dev_err message
To:     Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 31 lip 2019 o 11:48 Ding Xiang <dingxiang@cmss.chinamobile.com> n=
apisa=C5=82(a):
>
> devm_ioremap_resource already contains error message, so remove
> the redundant dev_err message
>
> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
> ---
>  drivers/gpio/gpio-ixp4xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 670c2a8..2b2b89b 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -321,10 +321,8 @@ static int ixp4xx_gpio_probe(struct platform_device =
*pdev)
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         g->base =3D devm_ioremap_resource(dev, res);
> -       if (IS_ERR(g->base)) {
> -               dev_err(dev, "ioremap error\n");
> +       if (IS_ERR(g->base))
>                 return PTR_ERR(g->base);
> -       }
>
>         /*
>          * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
> --
> 1.9.1
>
>
>

Patch applied, thanks!

Bart
