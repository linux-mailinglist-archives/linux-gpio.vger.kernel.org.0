Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC9D460780
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 17:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358450AbhK1Qda (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 11:33:30 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:39687 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346525AbhK1Qb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 11:31:26 -0500
Received: by mail-oi1-f176.google.com with SMTP id bf8so29701586oib.6;
        Sun, 28 Nov 2021 08:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=79L1FhRS5XEOX5R5nEMf/lvv08mrxVNOpVcZgr1MEfY=;
        b=FLtqHrBqF71U5AVhiWzVHt1xCnv2mtvTXGJbcx+ZMbgt6/Xw2Z4k1Nyo1qfdPdI6m/
         Td9+filksV5HmSHlApbZ1+3bvU0FjQQqtCWQYZUDOPCalYCaZ0Jobkn8VSdkKx1PUMtP
         f7/9jpf1ebk/kSQF+Pe95hR4SXkcZpixOxhzrySV8n7EAy9jNiMpDF7zRwvrYO8hCbpb
         8NDyovT4uhvaBVT0/PZCvPSdoKPXbEtQeDN3KjVIKkR9oyls6EHSi1bsSe4xFkzcS3y6
         yTOLT6Jvp+PY/b+8gd9hWM873DXM4RS2bSgYpsIJeIgzB5sKDJ333sszo6FrpRbe9xB5
         sZFw==
X-Gm-Message-State: AOAM531VP42sIHt4FaQ88sPgoZpSUUAHMncZC0G1qEb0ci/+VM8cpfbA
        55dfY+sgFAwhwfr1ggzpvA==
X-Google-Smtp-Source: ABdhPJwJSNQgSXnyMASxwUktIvTauJ3kBkmHFKXq+CmvAOIDEc4lsBMGmPRvMOed7vH4kEIKhzkZyg==
X-Received: by 2002:a54:4e0c:: with SMTP id a12mr35498823oiy.12.1638116889487;
        Sun, 28 Nov 2021 08:28:09 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id b1sm2193901otj.5.2021.11.28.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:28:08 -0800 (PST)
Received: (nullmailer pid 2669481 invoked by uid 1000);
        Sun, 28 Nov 2021 16:28:04 -0000
Date:   Sun, 28 Nov 2021 10:28:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 05/13] dt-bindings: imx: Add clock binding for
 i.MXRT1050
Message-ID: <YaOuFGhNzGVxdF03@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-6-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-6-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 04:14:35PM -0500, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add the clock binding doc for i.MXRT1050.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: added all clocks up to IMXRT1050_CLK_USBOH3]
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: added clocks from IMXRT1050_CLK_IPG_PDOF to
> IMXRT1050_CLK_DMA_MUX and moved IMXRT1050_CLK_END on]
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Added GPT binding
> ---
>  include/dt-bindings/clock/imxrt1050-clock.h | 73 +++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h
> 
> diff --git a/include/dt-bindings/clock/imxrt1050-clock.h b/include/dt-bindings/clock/imxrt1050-clock.h
> new file mode 100644
> index 000000000000..9811676d100b
> --- /dev/null
> +++ b/include/dt-bindings/clock/imxrt1050-clock.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Dual license matching the rest of i.MX.

> +/*
> + * Copyright(C) 2019
> + * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMXRT1050_H
> +#define __DT_BINDINGS_CLOCK_IMXRT1050_H
> +
> +#define IMXRT1050_CLK_DUMMY			0
> +#define IMXRT1050_CLK_CKIL			1
> +#define IMXRT1050_CLK_CKIH			2
> +#define IMXRT1050_CLK_OSC			3
> +#define IMXRT1050_CLK_PLL2_PFD0_352M		4
> +#define IMXRT1050_CLK_PLL2_PFD1_594M		5
> +#define IMXRT1050_CLK_PLL2_PFD2_396M		6
> +#define IMXRT1050_CLK_PLL3_PFD0_720M		7
> +#define IMXRT1050_CLK_PLL3_PFD1_664_62M		8
> +#define IMXRT1050_CLK_PLL3_PFD2_508_24M		9
> +#define IMXRT1050_CLK_PLL3_PFD3_454_74M		10
> +#define IMXRT1050_CLK_PLL2_198M			11
> +#define IMXRT1050_CLK_PLL3_120M			12
> +#define IMXRT1050_CLK_PLL3_80M			13
> +#define IMXRT1050_CLK_PLL3_60M			14
> +#define IMXRT1050_CLK_PLL1_BYPASS		15
> +#define IMXRT1050_CLK_PLL2_BYPASS		16
> +#define IMXRT1050_CLK_PLL3_BYPASS		17
> +#define IMXRT1050_CLK_PLL5_BYPASS		19
> +#define IMXRT1050_CLK_PLL1_REF_SEL		20
> +#define IMXRT1050_CLK_PLL2_REF_SEL		21
> +#define IMXRT1050_CLK_PLL3_REF_SEL		22
> +#define IMXRT1050_CLK_PLL5_REF_SEL		23
> +#define IMXRT1050_CLK_PRE_PERIPH_SEL		24
> +#define IMXRT1050_CLK_PERIPH_SEL		25
> +#define IMXRT1050_CLK_SEMC_ALT_SEL		26
> +#define IMXRT1050_CLK_SEMC_SEL			27
> +#define IMXRT1050_CLK_USDHC1_SEL		28
> +#define IMXRT1050_CLK_USDHC2_SEL		29
> +#define IMXRT1050_CLK_LPUART_SEL		30
> +#define IMXRT1050_CLK_LCDIF_SEL			31
> +#define IMXRT1050_CLK_VIDEO_POST_DIV_SEL	32
> +#define IMXRT1050_CLK_VIDEO_DIV			33
> +#define IMXRT1050_CLK_ARM_PODF			34
> +#define IMXRT1050_CLK_LPUART_PODF		35
> +#define IMXRT1050_CLK_USDHC1_PODF		36
> +#define IMXRT1050_CLK_USDHC2_PODF		37
> +#define IMXRT1050_CLK_SEMC_PODF			38
> +#define IMXRT1050_CLK_AHB_PODF			39
> +#define IMXRT1050_CLK_LCDIF_PRED		40
> +#define IMXRT1050_CLK_LCDIF_PODF		41
> +#define IMXRT1050_CLK_USDHC1			42
> +#define IMXRT1050_CLK_USDHC2			43
> +#define IMXRT1050_CLK_LPUART1			44
> +#define IMXRT1050_CLK_SEMC			45
> +#define IMXRT1050_CLK_LCDIF_APB			46
> +#define IMXRT1050_CLK_PLL1_ARM			47
> +#define IMXRT1050_CLK_PLL2_SYS			48
> +#define IMXRT1050_CLK_PLL3_USB_OTG		49
> +#define IMXRT1050_CLK_PLL4_AUDIO		50
> +#define IMXRT1050_CLK_PLL5_VIDEO		51
> +#define IMXRT1050_CLK_PLL6_ENET			52
> +#define IMXRT1050_CLK_PLL7_USB_HOST		53
> +#define IMXRT1050_CLK_LCDIF_PIX			54
> +#define IMXRT1050_CLK_USBOH3			55
> +#define IMXRT1050_CLK_IPG_PDOF			56
> +#define IMXRT1050_CLK_PER_CLK_SEL		57
> +#define IMXRT1050_CLK_PER_PDOF			58
> +#define IMXRT1050_CLK_DMA			59
> +#define IMXRT1050_CLK_DMA_MUX			60
> +#define IMXRT1050_CLK_GPT			70
> +#define IMXRT1050_CLK_END			71
> +
> +#endif /* __DT_BINDINGS_CLOCK_IMXRT1050_H */
> -- 
> 2.34.0
> 
> 
