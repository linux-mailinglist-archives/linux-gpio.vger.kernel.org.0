Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3468B447CE3
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 10:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238447AbhKHJf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 04:35:28 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:40466 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbhKHJfU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 04:35:20 -0500
Received: by mail-ua1-f50.google.com with SMTP id e2so30156091uax.7;
        Mon, 08 Nov 2021 01:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=natkUAgTheIcsUsHIOKrKwm02jUscvarcAWkR9vE/gg=;
        b=Qz3RRymHzuJjJXHo4tG/uvcnlefVze6axCfx1mf6z1rseco3fjOXL5UGL2zh3EHqsv
         dWtem89E1P35Zm9fTb1zRnULThgNfdDD6wf05SAAYTGGOSn77TgKurtD3Max0OAkM8H7
         Qo9r59UgkQY+DLmRpdjnNS/WYzZII6htcg8xipl9MRhJ8iEVOLtxT9bqj81XmI+vluLw
         CKC5FB5fCd+6+vbF2Q0+OqLTxAP8NcYZLkUcA4voUKgHISo5f8xnVvlhi5TgnNE9A1R9
         FgWZGhTB/Fz56ztxNaPx9KQMAATZxRs3+Nu6YIk0BRVf3t+HAclEP6lICuqD4txoIert
         fd1g==
X-Gm-Message-State: AOAM532UKTNvZQGPI/FW+ZV+6h2J49iXaOIAwy+qANQpir93XYUpBpB1
        GiLqs0BG+A9xjB8fay35g/xC1lW5rTynag==
X-Google-Smtp-Source: ABdhPJxvihut3Hp2eJTF+Zk6V+XSNksCPaXvC2rKzD+WiMxZSgb4VBp6iqohFHuEGE3y/w7FEy9PeQ==
X-Received: by 2002:a67:e18e:: with SMTP id e14mr11488790vsl.49.1636363955295;
        Mon, 08 Nov 2021 01:32:35 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id d128sm3095209vsd.20.2021.11.08.01.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:32:34 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id p22so6149216vke.7;
        Mon, 08 Nov 2021 01:32:34 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id f16mr18817472vkp.26.1636363954170;
 Mon, 08 Nov 2021 01:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-15-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-15-kernel@esmil.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 10:32:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz1R_K7Zayj9LJBM1GpMVi2s8k9jFa8DZPhNWM6B2prA@mail.gmail.com>
Message-ID: <CAMuHMdVz1R_K7Zayj9LJBM1GpMVi2s8k9jFa8DZPhNWM6B2prA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

Hi Esmil,

On Tue, Nov 2, 2021 at 5:12 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
> exactly 16 * 115200Hz and many other common bitrates. Trying this will
> only result in a higher input clock, but low enough that the UART's
> internal divisor can't come close enough to the baud rate target.
> So rather than try to set the input clock it's better to skip the
> clk_set_rate call and rely solely on the UART's internal divisor.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>
>                 if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
>                         p->serial_out = dw8250_serial_out38x;
> +               if (of_device_is_compatible(np, "starfive,jh7100-uart"))
> +                       p->set_termios = dw8250_do_set_termios;

BTW, it would be great for a follow-up patch to get rid of
all these of_device_is_compatible() checks, and start using
dw8250_of_match[...].data instead.

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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
