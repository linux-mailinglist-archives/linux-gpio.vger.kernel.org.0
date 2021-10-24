Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE722438A80
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhJXQAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 12:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhJXQAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 12:00:53 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5564BC061745;
        Sun, 24 Oct 2021 08:58:32 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id b4so5120272uaq.9;
        Sun, 24 Oct 2021 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uFDgY4a8AamGityNJyN/mckXYNdeMMrUI41JEjk31xo=;
        b=B/Eg8KEM1fssiL5S+4I9z89ur6kddjZ5vwXho1mI8rwu99hFwx87TVYXFOoXMojBVO
         Cnl9CBD9j2ZOQsgfOVUFOhJXwdLKpzcnf1P1bmMgOF7/M5UGSCpqDdIdqfS354PON1jB
         vGbilL0TukEnCDqELMQVLBGIapLGofd3IzHrQpkq9n//cEG0YMA6tv4EcaNj1B/cM1ks
         DqPDkblLMgJrhoVG7zwlIgNW4TMgNO5VDdWfe/u9kRsLjcWcL3CDFYxpJx4XcNdhLsYe
         bJfxDRZpNl8iUrb0ujayBuYvuSW1loAiHhPS/DJwc3JXuLMOH/PcJ+56Wq4Eh1HtTSFf
         zxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFDgY4a8AamGityNJyN/mckXYNdeMMrUI41JEjk31xo=;
        b=z/04X0sIwUH2ldmeBd8rixZEjXnGZS1Or4RNHxlEp2GG54j/hYr0oSe+psgX2YJFf7
         b4oSFD8SHzKmgH1I5OER/mUt8eePED0q0bvI/2RcWtoRR5a9XOrrn8BHuzg2XoqsOqc/
         /Cwv39bFx2DHutm3PH+Nl+9nUOeGRF+nBh0lqzshrc64wkCLPpGd+BIyKGRWD+l09vDt
         4b2GwsNFV1pMU9l1xkUKjjl0OcjTPZxZY4QsNWjLA9m3oMAtWgwxfFj/QV0mK98sSJ2B
         CXc8zsnVraz4EZK7Ay9Ix0YtUWtAPbj+IkSJSWcgEP8Tx3W5USWBAhZz2cdJAyYZNqBI
         I/sg==
X-Gm-Message-State: AOAM533yUWtCNE3LZVqxItPmVmsurvAa/qnIaEaUlsIj+krRGONnbRiO
        3mAbvMXo8vJSIwy+oVLwWp8nLUegkDQ4PEYCqLhmFjK4
X-Google-Smtp-Source: ABdhPJwt5Iadh+Dx2Pj4qk8HW3e+17XkSpxtZxQTPdo+uVgg87++wO9zbnNui7XEZ6YllAqwOATPkA7hTDBp6u8NIXQ=
X-Received: by 2002:a05:6102:34e4:: with SMTP id bi4mr4287265vsb.20.1635091111412;
 Sun, 24 Oct 2021 08:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 24 Oct 2021 12:58:20 -0300
Message-ID: <CAOMZO5CZoGRpvtPb0VdjTOy7bOPQRMyxPK-dr8AOoYUrqoo6qg@mail.gmail.com>
Subject: Re: [PATCH 07/13] clk: imx: Add initial support for i.MXRT clock driver
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
        Leonard Crestez <leonard.crestez@nxp.com>,
        Anson Huang <b20788@freescale.com>,
        Fugang Duan <fugang.duan@nxp.com>,
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

Hi Jesse,

On Sun, Oct 24, 2021 at 12:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +#include "clk.h"
> +#define ANATOP_BASE_ADDR       0x400d8000

This should be retrieved from the device tree

> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
> +       clk_data.clks = clk;
> +       clk_data.clk_num = ARRAY_SIZE(clk);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +       clk_set_parent(clk[IMXRT1050_CLK_PLL1_BYPASS], clk[IMXRT1050_CLK_PLL1_REF_SEL]);

The clock parent description could be made via device tree.
