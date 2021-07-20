Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFD63CFB02
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238352AbhGTNFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jul 2021 09:05:02 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:33375 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238724AbhGTNDQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jul 2021 09:03:16 -0400
Received: by mail-ua1-f43.google.com with SMTP id d2so8096365uan.0;
        Tue, 20 Jul 2021 06:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E38sRFpfg4Nl0TXtXxQVL6c3M9xpf/OZLQC/AmFnhX0=;
        b=dqQPL7GHgGkeYBs26JfHFUN+3BqbjRqvvbC4ldBJCMhMMBGpKeXw+NSDKoGAhVNGQ6
         JpJSKPCQyDi+qL81hIl8GQ2mGBSQOOxzNsVd6T3z5jbbmNHzbf/vT8uWKj/C6p9/mGyV
         /Ers3PdKcpedqzS5aoCY29saSiyDjrJ/Bz26r3xplfHdkr0WGhGeUEGh9wz3F9g5553E
         stoTRwBTfiulgIDggbG4BkuBl7j8IUYnjHVGTT0AGCuoCvBFwHxXZoaWB/SMO/TOCVV3
         izOz9BwF+i9XbzuzSJjFfkslZquHfWPjiN2N786O6Kynl9/qjtaYMiKkMIYMZmiXMv18
         hHAA==
X-Gm-Message-State: AOAM531W3ocV5OJdFAYhrSvkm3DDbduozXM9xa/glRx0sE0+LDirx3T9
        Kb/mPYvLDoRElLDI4qxyEoN6CISt0xuUk41aIEI=
X-Google-Smtp-Source: ABdhPJwCPd8kUzwD4M0vusPzxjBGVt7Tt8dDccfy425PNDwzZ7QrhhWXBCo5/qJmiDl2wf2MHdf6UYSUh7yINyuR0AM=
X-Received: by 2002:ab0:5a2e:: with SMTP id l43mr31027655uad.4.1626788572878;
 Tue, 20 Jul 2021 06:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210712194422.12405-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 15:42:41 +0200
Message-ID: <CAMuHMdVGN+6AiEtkAiHso5=FVsQYSbd0xD3LULsdbMPsXPkc+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add
 DT bindings for RZ/G2L pinctrl
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Mon, Jul 12, 2021 at 9:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G2L family pinctrl bindings.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_RZG2L_PINCTRL_H
> +#define __DT_BINDINGS_RZG2L_PINCTRL_H
> +
> +#define RZG2L_PINS_PER_PORT    8
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 16 bits the alternate function identifier
> + */
> +#define RZG2L_PORT_PINMUX(b, p, f)     ((b) * RZG2L_PINS_PER_PORT + (p) | ((f) << 16))
> +
> +/* Convert a port and pin label to its global pin index */
> + #define RZG2L_GPIO(port, pin) ((port) * RZG2L_PINS_PER_PORT + (pin))

I know this was copied from RZ/A2, but some consistency in the naming
(b or bank vs. port, p vs. pin) would be nice to have.

> +
> +#endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
