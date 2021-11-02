Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB624439EC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKBXpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhKBXpS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:45:18 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD4DC061714;
        Tue,  2 Nov 2021 16:42:43 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id b3so1216209uam.1;
        Tue, 02 Nov 2021 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
        b=n6VZ9pT7W0nCDLDr1BLiRtznprYVOhzyzxWqZRe3Dzld4TwJqFhWdnGQW72uIy7/c7
         p6Nrb/7UBpO+s3/fv4uTWtVhC5cYgoEwnFU0SM/AAySBDub0b7xVhk1qn3OmW5B9/mL0
         kSsOnYbgWoZDhcmz5tEqx+gN35vEQAcbAehYBDycY/faaZN06EJJYFJ6ncuw15SrmLML
         tjXvJ3p90QRX6fPR+tknrlMNS5RLBEH6o4xnzEQiePE4LLoIF68xw2+d08xWrSi5zsQr
         Wujoh0Yww4IpvOExhcUbhf+Tv51Leih2LL2HrCQKs5MRLal3pntCsG4k69eG/va0jX8v
         0dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8/enUMhz+riyzQ2Zd8RV/GG8++DAENfi7ZT3OLtTzs=;
        b=JsQlfMTXsE9ooXFXP3YdeEricHg59tmznLwGrj5xKOC6/y5VHovEbB2KX3xgkTG313
         rYQrCXHwDdHlxIjAuzQO6/eBlIohAo8t3cW7NBt0BdVYetYttDmXS0KXFZJH+4BRdXuN
         1WTpL0tgIoZYJo4OVLuq7nSXba1h0mtkMLZXfX2g9swZ7VjroHmhNMSHETR8joDm7fpX
         /vJ4AUa4MYqxlr7IwaL+F3NQeb6NJ7rw7BG6KQp0f3xt5V9NQm/hZKJjeCInq1rMdZ5y
         ywxnrm4jsfiikdbGr2G3s8eo7u2L7+aaI9CTiGlAsCDx78V9DqGGSWmED7bjfQwCFa4D
         aIdw==
X-Gm-Message-State: AOAM532+1LzI6G0gh0lEUVf1eKG69MjwzpshJTD3bbzp3IOiFc3zkWZf
        Ats2VXXoBNYnOs98ARGHJnXCV/isLoLG+WTCWxc=
X-Google-Smtp-Source: ABdhPJwurPunbhgaMhr2aohB9ULiuMaCOL1VxU+6z5Q9/nzQIcTtnZQ7HFyfuV8GL22sGJRc0itAFSRr6ZB6VOkTllQ=
X-Received: by 2002:a67:af13:: with SMTP id v19mr4403884vsl.5.1635896562431;
 Tue, 02 Nov 2021 16:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-13-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 2 Nov 2021 20:42:31 -0300
Message-ID: <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
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

> +/ {
> +       model = "NXP IMXRT1050-evk board";
> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
> +
> +       chosen {
> +               bootargs = "root=/dev/ram";

No need to pass bootargs here.

> +               stdout-path = &lpuart1;
> +       };
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };
> +
> +       memory@0 {

memory@80000000

Building with W=1 should give a dtc warning due to the unit address
and reg mismatch.

> +               device_type = "memory";
> +               reg = <0x80000000 0x2000000>;
> +       };
> +

Unneeded blank line.
> +
> +&iomuxc {
> +       pinctrl-names = "default";
> +
> +       imxrt1050-evk {

No need for this imxrt1050-evk container.

> +               pinctrl_lpuart1: lpuart1grp {
> +                       fsl,pins = <
> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
> +                                       0xf1

Put it on a single line. It helps readability. Same applies globally.
> +&usdhc1 {
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +       pinctrl-0 = <&pinctrl_usdhc0>;
> +       pinctrl-1 = <&pinctrl_usdhc0>;
> +       pinctrl-2 = <&pinctrl_usdhc0>;
> +       pinctrl-3 = <&pinctrl_usdhc0>;
> +       status = "okay";
> +
> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;

Make 'status' to be the last property. Remove the blank line.

> +               edma1: dma-controller@400e8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400e8000 0x4000>,
> +                               <0x400ec000 0x4000>;
> +                       dma-channels = <32>;
> +                       interrupts = <0>,
> +                               <1>,
> +                               <2>,
> +                               <3>,
> +                               <4>,
> +                               <5>,
> +                               <6>,
> +                               <7>,
> +                               <8>,
> +                               <9>,
> +                               <10>,
> +                               <11>,
> +                               <12>,
> +                               <13>,
> +                               <14>,
> +                               <15>,
> +                               <16>;

Please group more elements into the same line.

Putting one entry per line makes it extremely long.

> +               gpio5: gpio@400c0000 {
> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
> +                       reg = <0x400c0000 0x4000>;
> +                       interrupts = <88>,
> +                               <89>;

Put the interrupts into a single line.
