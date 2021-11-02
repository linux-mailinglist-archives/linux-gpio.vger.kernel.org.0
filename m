Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A245443974
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhKBXUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhKBXUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:20:07 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D57CC061203;
        Tue,  2 Nov 2021 16:17:31 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id e5so1042104uam.11;
        Tue, 02 Nov 2021 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZsNw+rozMJw0uF1kikrp6ToQQ8yZiRgQpxArMCQC7PY=;
        b=fl9496zHGb1NMIhicizBPN50+jkvVCzoSslA/3cjMnpa+V5Kk/tzqoNIW+vTJbkT46
         UnfGFq/LPeYOmOIklcJ/kTkv1M02gBxrdakFh/fHfrLqPQub6NnpOHSvOUgZndUCTvsA
         UxncsTS2FxzQzqnp5E4pKxsnzvtfexsn4kdBAyHztGytBIP0UtSUHrHE+m5aDlWCaXno
         CImAuLb8lQL3fI2V7b1LB8jiwAaxTpJrA7LxeF82W9qFv9pBpn96+XVytZ3+BXGfFUhM
         JoPLD1oxIHfd9RDAANGZiCow8xM3fDv06KG7SVCD4qmhxZ+HGYLbXctdsVepreqoYo0Q
         7S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZsNw+rozMJw0uF1kikrp6ToQQ8yZiRgQpxArMCQC7PY=;
        b=eO3NI9erepxl0Eoa1BMxhiIZho/TDNaxkNMfsbNgQFUkLNpyYCQpZpfOoY1XFBgJRg
         uoHMSibTPSnI/dZuifoMfBLPKSpRf0MMUIM9lyJYbvtVHWb/3gZgFq72h84uzz5cEzM9
         8+zOAhjuEzmDdHNBHeYhlEu12eDyRsqfOvY9dY5YCjHY32K1s2GtM2GWY1BBcI56VK/9
         22cB3WZzgzIUoZQBudtUU7I72IfUQ9SKMoIq75l9D3j/2llxOfr9obot4yroiSPMicMF
         6M7252q9+otgs14ooh3iSzU6dOgvtqfKw7sdTix+QEChZJwQovUSsDj11wixFEbLBeul
         cjkQ==
X-Gm-Message-State: AOAM531ZtEHJLhS6vYwP6/BHpr2ffrr9OJDIcsuhD+y2tGgi4UPWdpr2
        1Er+SRaswhhlj744A50MWpOOz7XzrARnb9tW2ao=
X-Google-Smtp-Source: ABdhPJyKSz6TCwnh7C+kJRYFN36Ph1nCIbuAY9M8q8RU9WcxjgDuFfVym1xz6Ue87gxiQx13egUc+1+Z88EDJpe8oCo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr31958596uaa.133.1635895049876;
 Tue, 02 Nov 2021 16:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com> <20211102225701.98944-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 2 Nov 2021 20:17:19 -0300
Message-ID: <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
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

>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
>         .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },

I thought Rob suggested to use the SoC name, so this would be:

{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },

The same applies to the other bindings in the series.

This way it would be possible to differentiate between future
supported i.MX RT devices.
