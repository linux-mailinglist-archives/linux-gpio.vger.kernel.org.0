Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A02B73E6
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 09:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388151AbfISHSO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 03:18:14 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43626 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388079AbfISHSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 03:18:13 -0400
Received: by mail-oi1-f194.google.com with SMTP id t84so1824438oih.10
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8zgBDSez7/+bzGBV7GF5xRZlniZ5KOtG5kxmVNZ9gtI=;
        b=xKAPhdRxODA5Qbmt0V91TPi5abCsKP8XYnfz9GsKDfweG6XpzWo/1wD9t6ELjZo75Q
         7SI2L8bFsv+23zYxfXpMVJffnsFXNZsX12RLdcrJhpyhrQ4miGxiI+3kiX38wme0waUM
         515ZFhJUGaka43E9V77QtpSipUj86l0F/omjRv0cKMTdtQw4EhcS+gaYDqSOctgsDOyx
         fOLxRU/dCMwdkfhEO/83fhTUotTZQzKwy7dSrOESjsQF977VRUAu5d7Ik2UUQCND9aE7
         m/5S2Xmn++VJmqDzVULwTzZQJG9P5+2MkTpIZcweWbFJeu+mr6C691KhdsjFyisvSKiI
         sc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8zgBDSez7/+bzGBV7GF5xRZlniZ5KOtG5kxmVNZ9gtI=;
        b=biCq5ppG9lJmwjdbH51iGpDMJBr6CgolNnNrrYYWUuVhaxV8CWC/+w6RjGLV5HfLve
         8Tldlrj/0S9oJjnjyO08UX/LF+G800JW/wbsNxfixSkYrrfUNmd4/yTmD9ULJ0kkFa35
         jkKmDjk9/CUD3N03RM63BZTVtYn190Pa4lFrFG7CGqWlKkzLS4C7lEBvtNV8YkJqnU+r
         hCThu50d665wCGS58r4eW7We1ml76wztdgAG5rR/9k1mBOJKXKOgRUUp8PUy7FX45ynq
         A8/RobDqzM6GTDO//gofO7tQEZITKz+0nGN4Fgg0Bz1LvdVpJrmBKDfj2oRwU2J18Uhk
         tE7g==
X-Gm-Message-State: APjAAAVlSgsaq6MXIbz0KfFmMAwJToBK6RGgFml+eu9coESjMfupDw7x
        tj/m4YmWPUBzwAjLo/FfkadLPXr/XfFHFB19pXFdgw==
X-Google-Smtp-Source: APXvYqyMGd14fdBBLUu/zy3WcG0BTwkmqYc0Q1+98B2gJNl2xUFWbHwaXR8dXX5yU0HlUg/FFzZzyqfWUVk85xkFjkE=
X-Received: by 2002:aca:4e85:: with SMTP id c127mr1202995oib.21.1568877492010;
 Thu, 19 Sep 2019 00:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <1568873377-13433-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1568873377-13433-1-git-send-email-Anson.Huang@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Sep 2019 09:18:01 +0200
Message-ID: <CAMpxmJVm+HyKOgoEVnU0tcJ1A4ghGC=Vvf0Kw40Js=O-C_t1=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Only getting second IRQ when there is more
 than one IRQ
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

czw., 19 wrz 2019 o 08:10 Anson Huang <Anson.Huang@nxp.com> napisa=C5=82(a)=
:
>
> On some of i.MX SoCs like i.MX8QXP, there is ONLY one IRQ for each
> GPIO bank, so it is better to check the IRQ count before getting
> second IRQ to avoid below error message during probe:
>
> [    1.070908] gpio-mxc 5d080000.gpio: IRQ index 1 not found
> [    1.077420] gpio-mxc 5d090000.gpio: IRQ index 1 not found
> [    1.083766] gpio-mxc 5d0a0000.gpio: IRQ index 1 not found
> [    1.090122] gpio-mxc 5d0b0000.gpio: IRQ index 1 not found
> [    1.096470] gpio-mxc 5d0c0000.gpio: IRQ index 1 not found
> [    1.102804] gpio-mxc 5d0d0000.gpio: IRQ index 1 not found
> [    1.109144] gpio-mxc 5d0e0000.gpio: IRQ index 1 not found
> [    1.115475] gpio-mxc 5d0f0000.gpio: IRQ index 1 not found
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 7907a87..39ba7dd 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -426,9 +426,15 @@ static int mxc_gpio_probe(struct platform_device *pd=
ev)
>         if (IS_ERR(port->base))
>                 return PTR_ERR(port->base);
>
> -       port->irq_high =3D platform_get_irq(pdev, 1);
> -       if (port->irq_high < 0)
> -               port->irq_high =3D 0;
> +       err =3D platform_irq_count(pdev);
> +       if (err < 0)
> +               return err;
> +
> +       if (err > 1) {

Could you use a variable called irq_count or something here? This
'err' is a confusing name for a variable that contains a valid value.

Bart

> +               port->irq_high =3D platform_get_irq(pdev, 1);
> +               if (port->irq_high < 0)
> +                       port->irq_high =3D 0;
> +       }
>
>         port->irq =3D platform_get_irq(pdev, 0);
>         if (port->irq < 0)
> --
> 2.7.4
>
