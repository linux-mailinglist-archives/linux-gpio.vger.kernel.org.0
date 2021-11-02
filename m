Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DB04439C7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhKBXhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhKBXhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:37:13 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71744C061203;
        Tue,  2 Nov 2021 16:34:38 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id o26so1156305uab.5;
        Tue, 02 Nov 2021 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WExrQsHq2+oSn64OIwRtqz+A7F4kLA/sw615cMT17iA=;
        b=HCmVnRxR0fmsMlryA0puisk728Cvco3Lv5XxJp6kRibLhmBpMZfrnNErKOsheskWB+
         22RUFqwoPnQBcSIZIYFO7pkAtmaFQ4CTgo1OBGBeIJxpYc6WyT70Ks7XagV+jnHtqwhk
         tnfPsRCiSFpcemJLu+256qHzVVNSnZgvS8JSsk4skTKgkHqqFH1/ra95nJtRG9M7l75e
         Fl558NlMqAlMABEtstkuxphKjN9f7s6qxsIIDScN2ws2WQd+zfOTZoY+ICSTE5bPag8E
         ltdHM9ZDHfY02MPV8i5FSOTnDNuehgxDHoZxx0igYv5QNYAJeyc/OsxB/77QJ4MNBJPu
         HeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WExrQsHq2+oSn64OIwRtqz+A7F4kLA/sw615cMT17iA=;
        b=h+D4i/fOj4HwPD2S3yF9Ug9SrWjY2D9GXPKzvn5/GT+hJBcQRCKCg6n9ixdxupHUM+
         jFafW/bYd6ZBWl5BmH099VzdCW+Tt6/3wN7GWREgxvVg8DjfejTqXffcXG+3sFS15E4v
         sKMOSFBxxlURFHKM+5cSO1ax+y31bKqsM1gKc+WFqmUNByTnTwP3Un29yjc/C1cvLcN7
         2IVZcNjcqRuB1GlVywB8+uRZvS79igPiqi/03sPGwp1xav+XOwL2jATcitAM/umhlc5C
         +8CVylVVBWzInKMMFtS56h1SEPbB5F1vLWJL4qdNf0xscczHKXcIYgpcA4Vg3M4JSozP
         vl7A==
X-Gm-Message-State: AOAM532q7hNOn+jk5KZ3JK1ENgoqDUwVuesPMypTeA87a0G0vx8hJ//2
        KrUB6L3PntOyleKJbOsz2O4Pktvyhw/9A3bRtw3UyKtuFdQ=
X-Google-Smtp-Source: ABdhPJyg9qRXJgiaZC755Y6Kg2Kx7dGx91462pdNgdkRYuajrdDidJO71uWcnLsyRo5wkzhZhKVLuOabQ7FZcUXZ5Hw=
X-Received: by 2002:a67:af13:: with SMTP id v19mr4344787vsl.5.1635896077608;
 Tue, 02 Nov 2021 16:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-8-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 2 Nov 2021 20:34:26 -0300
Message-ID: <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock driver
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +#include "clk.h"
> +#define ANATOP_BASE_ADDR       0x400d8000

This is now unused. Please remove it.

> +       clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
> +       clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
> +       clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
> +       clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
> +       clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
> +       clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);

The imx clock drivers have been converted to the clk_hw API.

For a reference, please check:
f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")

The same conversion could be done here.

> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
> +       clk_data.clks = clk;
> +       clk_data.clk_num = ARRAY_SIZE(clk);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);

If these clocks are essential for the SoC to work, then you could pass
the CLK_IS_CRITICAL flag instead of calling clk_prepare_enable()
