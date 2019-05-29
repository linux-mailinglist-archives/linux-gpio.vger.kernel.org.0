Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D6D2E7AD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 23:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfE2VyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 17:54:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35524 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfE2VyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 17:54:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id n14so3644248otk.2;
        Wed, 29 May 2019 14:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0RV3+kisHUMXyneeAKaGTJdWRVaLmpR4yiYkhivyfc=;
        b=b/kK+HUOCpztpaHykIhF9DikDJvLs+iRQuDhcDKeJjV5OW+j3cKgnYladmp3jQ+3iS
         pYT2zdtrR9CIXGBip2T8y9HJODZx+TAIjCMGvvDbqgHW/jxRm7RMIJbxaOOjFWxH3Iu0
         7fgDW00+WUyZ0cI6axsB8LZx8QglNk5q68emHuy5DCRRT1uyphxwX9YTVD3FOGFnqLu/
         IixHKir8B5IACAjaufWTcvv874NGR6rexYWAhEVUIOoUAq9toSDKbdJMF5SdI3pgzWNW
         plLmnbdx6ItNhHInFrfaqzTcwkvRjnv10SXYzoTAlJHP3aqvBoViwCWgPB8fHK7YbDnh
         JkvA==
X-Gm-Message-State: APjAAAU8jycD4L4u2U8DJ9GPQPh+JONEqmqsuzGdGy6TqrFappDGym2A
        DjJUerdHVAVLIJirPorfqkcp8Gq0wGQ=
X-Google-Smtp-Source: APXvYqzrKWTxIu04+QqxzysOQWMh1txFa3MBWVB/r24ex7U1/u3liDy6ZewvC/BEmGVEX/uq24wOcQ==
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr9834otq.185.1559166846326;
        Wed, 29 May 2019 14:54:06 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id h67sm142594otb.24.2019.05.29.14.54.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 14:54:05 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id u64so3391887oib.1;
        Wed, 29 May 2019 14:54:04 -0700 (PDT)
X-Received: by 2002:aca:e44b:: with SMTP id b72mr359320oih.108.1559166843892;
 Wed, 29 May 2019 14:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
In-Reply-To: <20190529083254.39581-1-chuanhua.han@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 29 May 2019 16:53:52 -0500
X-Gmail-Original-Message-ID: <CADRPPNRTf6ooaJJDkO8xa9qhJhh1ZaQ5crRDX7sLaSV0CoRVyg@mail.gmail.com>
Message-ID: <CADRPPNRTf6ooaJJDkO8xa9qhJhh1ZaQ5crRDX7sLaSV0CoRVyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mpc8xxx: Enable port input and interrupt
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Zhang Ying-22455 <ying.zhang22455@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 3:33 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> The GPIO Input Buffer Enable register is used to control the input
> enable of each individual GPIO port. When an individual GPIO port's
> direction is set to input (GPIO_GPDIR[DRn=0]), the associated
> input enable must be set (GPIOxGPIE[IEn]=1) to propagate the port
> value to the GPIO Data Register.

I cannot relate what you are saying here with the code you changed.

>
> This patch enable port input and interrupt.

NACK

Why do we need to unmask all the interrupts by default?  The correct
behavior is that all interrupts masked until they are actually
requested.

>
> Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index c8673a5d9412..555e0e7957d9 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -373,9 +373,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         if (!mpc8xxx_gc->irq)
>                 return 0;
>
> -       /* ack and mask all irqs */
> +       /* ack and enable irqs */
>         gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
> -       gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
> +       gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
> +       gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
>
>         irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
>                                          mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> --
> 2.17.1
>
