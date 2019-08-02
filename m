Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF15E7ED1E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 09:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389346AbfHBHHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 03:07:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33158 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389182AbfHBHHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 03:07:10 -0400
Received: by mail-ot1-f65.google.com with SMTP id q20so77013867otl.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Aug 2019 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RK+20dzJviISNV+93NqcQswZxg+GA6BYaDL2+ThvHdo=;
        b=no2YBNHW/GBW+3zkl06td4ZCgKjOAclq31zEfcew3umEuTOHp+y3OkHj0zTVM7aidw
         KdmGFIJwKTrVJjKKmBPgtwqN/fjYzBiAum5/8x6lGM5DKiHPLhAoGYnwuD08sLd3DlXa
         c8tQor2wpWzik/ma0YaljlGnHaFElfvNCS3AM/5uaNAv9RnNG1/Py2U2iEtiTKSqU+fw
         c+ndr6PvcF98I5p1rfZgrZjVhuC1wYHtmSHU1/xR0wlECKO5NRZ+zDMejW2TnPHxrT9O
         w33Ymg9gztLH/rncYfEBsciVUElBQO4iISkC7hrLYbE0t2yINQYV+GoPs4AZv7l6jgrx
         KPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RK+20dzJviISNV+93NqcQswZxg+GA6BYaDL2+ThvHdo=;
        b=Vfrk7zEXFig1DDM7IeFE7D+z13RM7t8G6E8Zf476asbOQ5vNCwc199uGpzK6jfRmfC
         buql5BGhPGQ4EH/UwGGcYTf3ZbwnTNeObaNHyOsmmhI3g2TlBFVyiVMeScDLkq7neHNE
         6x7Z86HEEluMBRmoQA/uYXAU4ODVJYiVhPAWLg06JTsF0LClcr6IZrx9eZw4P/nFtJES
         L4zPrIXL1CTpB9/mbjwRUTodhjIjZe7+HT30qeMNQ9KzwEmB7BmfGDtHaL149jpWyZ0A
         g8D7cje1XSRhu2Vf/AHc+qF7EGtoWmUMSBNCP5nVQ1K5PczZrnWJ8Rwbp7TEVi1DlP4r
         64MQ==
X-Gm-Message-State: APjAAAXFbVTeX4ht/vZQpo1emjzRYT/HQ3g19HErY6baz3/bRzPl3efn
        pHXTGWC+Wa8tE0LQdtmpwbf8M2s2T0mofiRIrhiPww==
X-Google-Smtp-Source: APXvYqymEusuGsezVVEUq4vGKp+HswJHP14eULqqS4ucpm/aZEmphlSBMb3viH2nKCJEE61bSr1aBGJCJKKpV85tJXY=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr37650695otk.292.1564729629450;
 Fri, 02 Aug 2019 00:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190801084439.36487-1-Anson.Huang@nxp.com>
In-Reply-To: <20190801084439.36487-1-Anson.Huang@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 2 Aug 2019 09:06:57 +0200
Message-ID: <CAMpxmJWdVx_guOGCb6aNoUmG_JBqWGui-qZmUCOuunOkxzTPFQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Use devm_clk_get_optional instead of devm_clk_get
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 1 sie 2019 o 10:54 <Anson.Huang@nxp.com> napisa=C5=82(a):
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> i.MX SoC's GPIO clock is optional, so it is better to use
> devm_clk_get_optional instead of devm_clk_get.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index b281358..7907a87 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -435,12 +435,9 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>                 return port->irq;
>
>         /* the controller clock is optional */
> -       port->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(port->clk)) {
> -               if (PTR_ERR(port->clk) =3D=3D -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               port->clk =3D NULL;
> -       }
> +       port->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
> +       if (IS_ERR(port->clk))
> +               return PTR_ERR(port->clk);
>
>         err =3D clk_prepare_enable(port->clk);
>         if (err) {
> --
> 2.7.4
>

Patch applied, thanks!

Bart
