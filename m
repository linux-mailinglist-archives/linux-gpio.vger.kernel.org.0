Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696BF21496
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 09:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfEQHg6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 03:36:58 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32876 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbfEQHg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 03:36:58 -0400
Received: by mail-oi1-f194.google.com with SMTP id m204so4522657oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2019 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y5vNUCWdnMFSsM/IdJp1pTLpA6OHn/LuXQv9UYiBGcw=;
        b=izH1X1dqzCfMeAvKKvh3q4eazvXsd+aoaTgwq9XCqHBnr5pskti2f1J3Pmxolu+xkn
         uWKeQVQg6TFhrgIrZKfj1JztkEl2vAhK0mdAYsYiKjQF29XKh5R5duG+TP9Mq7gW7GPH
         0rLRHiEgK2Y15r9lRRh46jIA4R5qnhVdqsW3eUvpe1WSm9fi2Fq14UmnWZtRLCMcQPgY
         MtzN0Q5pFQBepVnpXE6/0NiqfvoOquExZbISk8DaH+WxHuSOSFFN5pEP/doiTuo1qf/Z
         ZCpR2kkzcFIzdYgCScp4MUY90aEnkRV91QtOTE8sD0noacVOe9OUMDa6tQybzB/jJKuP
         aRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y5vNUCWdnMFSsM/IdJp1pTLpA6OHn/LuXQv9UYiBGcw=;
        b=CskRkW3CgqRcCDOhwc8fRu6f8tRgoryDdJCLpl/WR82ry2BJM1DPM377XGuTcptwlU
         HWf0ewGyu4kaaVosXyarjp3vlgKOAQH+h1KZlWLVBh+ly77ODVc72nJ9Wb9FlkZlwENY
         CWowgGxTytCS4AkA9tQiiBPOLIiEk+M9qCmUdQE51asMh65hQQbORi7FZc0c3bi2++TZ
         M3jgo1UH8WPKZecnoe+x71rGs+hDuODJ2jb207mRS4287r+LSZX9M9fy4AhSmryshBEz
         xGl7A63kYDMhFmgcPjP6o8Foc5981FTr0bpF+L3jM5+xJd86JwMBGiU+2+pEMJXJQsH8
         C0NQ==
X-Gm-Message-State: APjAAAV4Hdgos5vU0P/jm0F30Sg6s0BLBM6Qx/KkIE7Dn9namlyQZ7qC
        46lEH9VlAkn0QwXtuQ2pe/Nvyzhnx1ujSvJCinBKYg==
X-Google-Smtp-Source: APXvYqwbkRn+kTurLoQywWw4FFsXDiFosLnMz8eY5CLjiaOLYrXUvmYhCUTH/p1EM7gYJ+d1XHoanSxTdp1W1J820+w=
X-Received: by 2002:aca:aa48:: with SMTP id t69mr17022oie.114.1558078617216;
 Fri, 17 May 2019 00:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190516182237.5315-1-jeff.dagenais@gmail.com>
In-Reply-To: <20190516182237.5315-1-jeff.dagenais@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 17 May 2019 09:36:46 +0200
Message-ID: <CAMpxmJVUBgv5BXLwDnZt7Sr6ym1qB64KiAyipvArLsy5hEPEYA@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: add a to_irq implementation
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, michal.simek@xilinx.com,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 16 maj 2019 o 20:23 Jean-Francois Dagenais
<jeff.dagenais@gmail.com> napisa=C5=82(a):
>
> This function is required by various gpio consumer implementations as
> well as the generic gpiolib-sysfs "edge" attribute.
>
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
>  drivers/gpio/gpio-zynq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 9392edaeec3f..19ba8801a4f2 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -379,6 +379,13 @@ static int zynq_gpio_get_direction(struct gpio_chip =
*chip, unsigned int pin)
>         return !(reg & BIT(bank_pin_num));
>  }
>
> +static int zynq_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
> +
> +       return irq_find_mapping(gpio->chip.irq.domain, offset);
> +}
> +
>  /**
>   * zynq_gpio_irq_mask - Disable the interrupts for a gpio pin
>   * @irq_data:  per irq and chip data passed down to chip functions
> @@ -870,6 +877,7 @@ static int zynq_gpio_probe(struct platform_device *pd=
ev)
>         chip->direction_input =3D zynq_gpio_dir_in;
>         chip->direction_output =3D zynq_gpio_dir_out;
>         chip->get_direction =3D zynq_gpio_get_direction;
> +       chip->to_irq =3D zynq_gpio_to_irq;
>         chip->base =3D of_alias_get_id(pdev->dev.of_node, "gpio");
>         chip->ngpio =3D gpio->p_data->ngpio;
>
> --
> 2.11.0
>

Hi Jean-Francois,

the default implementation for this function is already assigned
inside the call to gpiochip_irqchip_add() and it does the same thing
internally (looks up the mapping from the domain). If there's a
problem with this driver then the culprit lies somewhere else.

Bart
