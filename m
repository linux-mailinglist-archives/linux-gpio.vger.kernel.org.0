Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917F2443719
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhKBURu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhKBURt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:17:49 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447F8C061714;
        Tue,  2 Nov 2021 13:15:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ee33so1591480edb.8;
        Tue, 02 Nov 2021 13:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqKC2t1Z5DmsnmpUEFoy3liKWP90tFs8sH60erHgihQ=;
        b=fEzLluxtpVt49nA4nW9VmHwOB8olNv+cr8vCPFXRg0BkU9xXcs+9xohjH/dbJb/JZm
         Jn3Q3DM8vHyiyVHH9L88UrLBov1G/x2g9AS8+xnhPdqgsW3BSmt0mE0+OlmkbrDrd0jp
         9LhOL8TleGNjvJ8eV+5+vmURHblBY/BVRfriYPyvzd8G/vkEED7FSUuW1YE22Qfbf+qg
         jaNSsvv5/ym05HE998urmd/1qGbYVG5FTeSoz5dM7zj779osugHcFdEe8INh9MBGEafG
         RUGhXbDGYgkziz96URb0Gr84f6OovpS6941kwHY0lsVhfWJNPA2rtK8XlwpQjnxrR9PT
         kDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqKC2t1Z5DmsnmpUEFoy3liKWP90tFs8sH60erHgihQ=;
        b=fUgb6F/H2CHsjqnm2CtZxT9pZjkonJxxVSE3KZsDrsPwR4Y+ofRFAcEXIlk5a5L5hP
         K4gnH4OtO9J5YKN9Mp5SESn/WSUpWYaAF5UE5IOw5O+zltOWBPpXQoVvNRUAxThosLB0
         mqdCxdASor+jfjJkRoMn3fmFhftc026iHUIj/DvTCLAA822qzTwPoupFVq3JW1fM4f3i
         HbhL41uaNF47Xsc31RIaylYVXZ5O6wUiH4fusMgSy6p7Hlz3wOdlwPS/JRriyh/2Jn1i
         Cw28vPpbVROTaB6OmVPQrXEWAzIRnV6PGy5cNW8ErjkirwKL7hL0WUspqARvmQr/rq6x
         iVKg==
X-Gm-Message-State: AOAM531tsuz2pwsT5x4P0tOBQeXHsJ4MKjShQRB1YqukBSXHYWG1RdRr
        +g3B9+wzJnSJJYx5HWAmQ3/jCH/Rq/1MnwACYeM=
X-Google-Smtp-Source: ABdhPJxCzvbiL8SrPnqlEyRkEgG13MVi98u1HbMKyGOzzMrOjh5GeBgylI4pX9nKhd44bj3Ih6Nc/FPn8GJISHkbprU=
X-Received: by 2002:a17:906:1707:: with SMTP id c7mr47407307eje.377.1635884112761;
 Tue, 02 Nov 2021 13:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-15-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-15-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 22:14:23 +0200
Message-ID: <CAHp75VeyC9nW0zSD9Hz23ypN8jQqU+JXOAG=oJfhebq4ptmm1w@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 6:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
> exactly 16 * 115200Hz and many other common bitrates. Trying this will
> only result in a higher input clock, but low enough that the UART's
> internal divisor can't come close enough to the baud rate target.
> So rather than try to set the input clock it's better to skip the
> clk_set_rate call and rely solely on the UART's internal divisor.

Bingo!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 53f57c3b9f42..1769808031c5 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>
>                 if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
>                         p->serial_out = dw8250_serial_out38x;
> +               if (of_device_is_compatible(np, "starfive,jh7100-uart"))
> +                       p->set_termios = dw8250_do_set_termios;
>
>         } else if (acpi_dev_present("APMC0D08", NULL, -1)) {
>                 p->iotype = UPIO_MEM32;
> @@ -696,6 +698,7 @@ static const struct of_device_id dw8250_of_match[] = {
>         { .compatible = "cavium,octeon-3860-uart" },
>         { .compatible = "marvell,armada-38x-uart" },
>         { .compatible = "renesas,rzn1-uart" },
> +       { .compatible = "starfive,jh7100-uart" },
>         { /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
