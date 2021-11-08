Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8157449896
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 16:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241011AbhKHPn3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 10:43:29 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:33728 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbhKHPnW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 10:43:22 -0500
Received: by mail-ua1-f51.google.com with SMTP id b17so32384244uas.0;
        Mon, 08 Nov 2021 07:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBu6QKjGhdK2FHNHQPlkpimyM3UHlD5aoQZ6ixhgepo=;
        b=Cm9nvqYCntDhemvOYiyiajW2tEgbI01bOPykF+skRxe37mSB15SBxtckAPsMukuMlS
         p1Sp7crVluC2UV5UhPE8wju2HAAJTW1H8FkogFMYmUULk4lorloLHN2wJI9l+L7RqgmK
         MkYffE5bzLANC5mbXhua3OlArQMT+g/usz96hXeRlcWsy7P6YU2VYqqXzqDKY6vrVS6g
         CpvmlW6B76/BMB/baw2VK1PF4bn3P5ald9kz1qnhwCQ7BLGE8TADMYZff3CYI9B2dLyn
         PIx2D4hftiQ2EAi1fhO6/z9bGvbuGKZZBgRVnjaLKT2pu9Z7sh6ABwmieow6crJWZ1PZ
         83YQ==
X-Gm-Message-State: AOAM531L+G72x5rVKb3o8GL2aA+Aj8L1TvYB7KagV5S+0WhUfO37u4tx
        2L/rGIGE4bxjFgXLHW3cN4H+Xr//jTTu3NgK
X-Google-Smtp-Source: ABdhPJz/jue8Z6GG1PErHB8O3XJFLfnkZOGUleG33LUu7RCd/up1lWI52QGkx2fTJzcEjWMDAl+vcA==
X-Received: by 2002:ab0:6eca:: with SMTP id c10mr939380uav.118.1636386035571;
        Mon, 08 Nov 2021 07:40:35 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id g187sm854639vsc.10.2021.11.08.07.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:40:35 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id l43so32302428uad.4;
        Mon, 08 Nov 2021 07:40:35 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr934716uae.122.1636386035060;
 Mon, 08 Nov 2021 07:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211029124437.20721-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211029124437.20721-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 16:40:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwJ043PuJnNU=L9+oN05ExjU-Km9CWBoXO9zqAVizByg@mail.gmail.com>
Message-ID: <CAMuHMdXwJ043PuJnNU=L9+oN05ExjU-Km9CWBoXO9zqAVizByg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance-ohms
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 29, 2021 at 2:45 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> RZ/G2L supports two groups of pins Group-A and Group-B. For Group-A
> pins drive-strength can be configured and for Group-B output-impedance
> can be configured.
>
> This patch splits PIN_CFG_IOLH macro to PIN_CFG_IOLH_A/B and adds
> support to get/set drive-strength and output-impedance-ohms for the
> supported pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -501,7 +507,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>         unsigned int arg = 0;
>         unsigned long flags;
>         void __iomem *addr;
> -       u32 port = 0;
> +       u32 port = 0, reg;

"unsigned int index", for symmetry with rzg2l_pinctrl_pinconf_set()?

>         u32 cfg = 0;
>         u8 bit = 0;
>
> @@ -549,6 +555,24 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>                 break;
>         }
>
> +       case PIN_CONFIG_DRIVE_STRENGTH: {
> +               if (!(cfg & PIN_CFG_IOLH_A))
> +                       return -EINVAL;
> +
> +               reg = rzg2l_read_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK);

port_pin still under discussion, cfr. my comments for the other
patches in this series.

The rest looks good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
