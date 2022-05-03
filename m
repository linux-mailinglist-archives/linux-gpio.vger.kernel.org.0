Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E8D51907A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 May 2022 23:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243126AbiECVt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 17:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243086AbiECVt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 17:49:56 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21959205DE;
        Tue,  3 May 2022 14:46:22 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id z8so19588254oix.3;
        Tue, 03 May 2022 14:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L8WLgTxhwHvTOUfGaFt1s6CBcQ/mIWumkXm6DM5leOg=;
        b=X2sLuz7wEBrYU7dHY7nq8N8ecVtBvpslV6Dj3bhAa98bNv/Jy96Z6tazmbuD5v0uTy
         5MTYPdv2N3gVt4lc1+AaoywlikcFQ8pgCJfRTFV8PfwT676lfxEwXDQmmX//YI6a53dd
         2rOxGVY19uIirQzvuAsb9WuQz4aD7AK10E1spzKJpOKkbCl4NdN6k6R++wTVwnjGjp5d
         1wF7jeQ4GE2K4+BJz0uzKIMPAexl6h7dAlNbnTD45SNTJIj7ANujOtuOWrHmjalUaR2S
         dMLtGvZfScvMfbqJqmJrb1d9qrxpPxRYb1BZhunKSSWD0/7aAk84hcZPYaFXhXKSdHZY
         DY9g==
X-Gm-Message-State: AOAM531QFD93vilyViHy+ZN5aWYBrGQ3MHqYn4D/4IJEyachrlekwGJl
        pNPHq6VXdAr0E+X3LIwkOg==
X-Google-Smtp-Source: ABdhPJz2XvCGDrv3YPRNoGGEUuQMwC7aPgg4aRRjPwYCqBg2HSPVYLwtGG/FLYNeYPlnufNj0YBknw==
X-Received: by 2002:aca:1b0a:0:b0:325:bff8:e73a with SMTP id b10-20020aca1b0a000000b00325bff8e73amr2757175oib.168.1651614381337;
        Tue, 03 May 2022 14:46:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p4-20020a0568301d4400b0060603221248sm4511725oth.24.2022.05.03.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 14:46:20 -0700 (PDT)
Received: (nullmailer pid 87812 invoked by uid 1000);
        Tue, 03 May 2022 21:46:19 -0000
Date:   Tue, 3 May 2022 16:46:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
        linus.walleij@linaro.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 10/15] dt-bindings: imx: Add clock binding for
 i.MXRT1170
Message-ID: <YnGiq90ZkAHNBAXS@robh.at.kernel.org>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-11-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428214838.1040278-11-Mr.Bossman075@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 28, 2022 at 05:48:33PM -0400, Jesse Taube wrote:
> Add the clock binding doc for i.MXRT1170.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Change to GPL-2.0-only
> ---
>  include/dt-bindings/clock/imxrt1170-clock.h | 282 ++++++++++++++++++++
>  1 file changed, 282 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imxrt1170-clock.h
> 
> diff --git a/include/dt-bindings/clock/imxrt1170-clock.h b/include/dt-bindings/clock/imxrt1170-clock.h
> new file mode 100644
> index 000000000000..a88137f6cbc1
> --- /dev/null
> +++ b/include/dt-bindings/clock/imxrt1170-clock.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Should be:

(GPL-2.0-only OR BSD-2-Clause)

Unless there's a reason you can't.

> +/*
> + * Copyright(C) 2022
> + * Author(s): Jesse Taube <Mr.Bossman075@gmail.com>
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMXRT1170_H
> +#define __DT_BINDINGS_CLOCK_IMXRT1170_H
> +
> +#define IMXRT1170_CLK_DUMMY			0
> +#define IMXRT1170_CLK_OSC			1
> +#define IMXRT1170_CLK_OSC_32K			2
> +#define IMXRT1170_CLK_RCOSC_16M			3
> +#define IMXRT1170_CLK_RCOSC_48M			4
> +#define IMXRT1170_CLK_RCOSC_48M_DIV2		5
> +#define IMXRT1170_CLK_RCOSC_400M		6
> +#define IMXRT1170_CLK_PLL_ARM_PRE		7
> +#define IMXRT1170_CLK_PLL_ARM_BYPASS		8
> +#define IMXRT1170_CLK_PLL_ARM_DIV		9
> +#define IMXRT1170_CLK_PLL_ARM			10
> +#define IMXRT1170_CLK_PLL_AUDIO			11
> +#define IMXRT1170_CLK_PLL_VIDEO			12
> +#define IMXRT1170_CLK_PLL1			13
> +#define IMXRT1170_CLK_PLL1_DIV2			14
> +#define IMXRT1170_CLK_PLL1_DIV5			15
> +#define IMXRT1170_CLK_PLL2_PRE			16
> +#define IMXRT1170_CLK_PLL2_BYPASS		17
> +#define IMXRT1170_CLK_PLL2			18
> +#define IMXRT1170_CLK_PLL2_PFD0			19
> +#define IMXRT1170_CLK_PLL2_PFD1			20
> +#define IMXRT1170_CLK_PLL2_PFD2			21
> +#define IMXRT1170_CLK_PLL2_PFD3			22
> +#define IMXRT1170_CLK_PLL3_PRE			23
> +#define IMXRT1170_CLK_PLL3_BYPASS		24
> +#define IMXRT1170_CLK_PLL3			25
> +#define IMXRT1170_CLK_PLL3_DIV2_GATE		26
> +#define IMXRT1170_CLK_PLL3_DIV2			27
> +#define IMXRT1170_CLK_PLL3_PFD0			28
> +#define IMXRT1170_CLK_PLL3_PFD1			29
> +#define IMXRT1170_CLK_PLL3_PFD2			30
> +#define IMXRT1170_CLK_PLL3_PFD3			31
> +#define IMXRT1170_CLK_M7_SEL			32
> +#define IMXRT1170_CLK_M7_GATE			33
> +#define IMXRT1170_CLK_M7			34
> +#define IMXRT1170_CLK_M4_SEL			35
> +#define IMXRT1170_CLK_M4_GATE			36
> +#define IMXRT1170_CLK_M4			37
> +#define IMXRT1170_CLK_BUS_SEL			38
> +#define IMXRT1170_CLK_BUS_GATE			39
> +#define IMXRT1170_CLK_BUS			40
> +#define IMXRT1170_CLK_BUS_LPSR_SEL		41
> +#define IMXRT1170_CLK_BUS_LPSR_GATE		42
> +#define IMXRT1170_CLK_BUS_LPSR			43
> +#define IMXRT1170_CLK_SEMC_SEL			44
> +#define IMXRT1170_CLK_SEMC_GATE			45
> +#define IMXRT1170_CLK_SEMC			46
> +#define IMXRT1170_CLK_CSSYS_SEL			47
> +#define IMXRT1170_CLK_CSSYS_GATE		48
> +#define IMXRT1170_CLK_CSSYS			49
> +#define IMXRT1170_CLK_CSTRACE_SEL		50
> +#define IMXRT1170_CLK_CSTRACE_GATE		51
> +#define IMXRT1170_CLK_CSTRACE			52
> +#define IMXRT1170_CLK_M4_SYSTICK_SEL		53
> +#define IMXRT1170_CLK_M4_SYSTICK_GATE		54
> +#define IMXRT1170_CLK_M4_SYSTICK		55
> +#define IMXRT1170_CLK_M7_SYSTICK_SEL		56
> +#define IMXRT1170_CLK_M7_SYSTICK_GATE		57
> +#define IMXRT1170_CLK_M7_SYSTICK		58
> +#define IMXRT1170_CLK_ADC1_SEL			59
> +#define IMXRT1170_CLK_ADC1_GATE			60
> +#define IMXRT1170_CLK_ADC1			61
> +#define IMXRT1170_CLK_ADC2_SEL			62
> +#define IMXRT1170_CLK_ADC2_GATE			63
> +#define IMXRT1170_CLK_ADC2			64
> +#define IMXRT1170_CLK_ACMP_SEL			65
> +#define IMXRT1170_CLK_ACMP_GATE			66
> +#define IMXRT1170_CLK_ACMP			67
> +#define IMXRT1170_CLK_FLEXIO1_SEL		68
> +#define IMXRT1170_CLK_FLEXIO1_GATE		69
> +#define IMXRT1170_CLK_FLEXIO1			70
> +#define IMXRT1170_CLK_FLEXIO2_SEL		71
> +#define IMXRT1170_CLK_FLEXIO2_GATE		72
> +#define IMXRT1170_CLK_FLEXIO2			73
> +#define IMXRT1170_CLK_GPT1_SEL			74
> +#define IMXRT1170_CLK_GPT1_GATE			75
> +#define IMXRT1170_CLK_GPT1			76
> +#define IMXRT1170_CLK_GPT2_SEL			77
> +#define IMXRT1170_CLK_GPT2_GATE			78
> +#define IMXRT1170_CLK_GPT2			79
> +#define IMXRT1170_CLK_GPT3_SEL			80
> +#define IMXRT1170_CLK_GPT3_GATE			81
> +#define IMXRT1170_CLK_GPT3			82
> +#define IMXRT1170_CLK_GPT4_SEL			83
> +#define IMXRT1170_CLK_GPT4_GATE			84
> +#define IMXRT1170_CLK_GPT4			85
> +#define IMXRT1170_CLK_GPT5_SEL			86
> +#define IMXRT1170_CLK_GPT5_GATE			87
> +#define IMXRT1170_CLK_GPT5			88
> +#define IMXRT1170_CLK_GPT6_SEL			89
> +#define IMXRT1170_CLK_GPT6_GATE			90
> +#define IMXRT1170_CLK_GPT6			91
> +#define IMXRT1170_CLK_FLEXSPI1_SEL		92
> +#define IMXRT1170_CLK_FLEXSPI1_GATE		93
> +#define IMXRT1170_CLK_FLEXSPI1			94
> +#define IMXRT1170_CLK_FLEXSPI2_SEL		95
> +#define IMXRT1170_CLK_FLEXSPI2_GATE		96
> +#define IMXRT1170_CLK_FLEXSPI2			97
> +#define IMXRT1170_CLK_CAN1_SEL			98
> +#define IMXRT1170_CLK_CAN1_GATE			99
> +#define IMXRT1170_CLK_CAN1			100
> +#define IMXRT1170_CLK_CAN2_SEL			101
> +#define IMXRT1170_CLK_CAN2_GATE			102
> +#define IMXRT1170_CLK_CAN2			103
> +#define IMXRT1170_CLK_CAN3_SEL			104
> +#define IMXRT1170_CLK_CAN3_GATE			105
> +#define IMXRT1170_CLK_CAN3			106
> +#define IMXRT1170_CLK_LPUART1_SEL		107
> +#define IMXRT1170_CLK_LPUART1_GATE		108
> +#define IMXRT1170_CLK_LPUART1			109
> +#define IMXRT1170_CLK_LPUART2_SEL		110
> +#define IMXRT1170_CLK_LPUART2_GATE		111
> +#define IMXRT1170_CLK_LPUART2			112
> +#define IMXRT1170_CLK_LPUART3_SEL		113
> +#define IMXRT1170_CLK_LPUART3_GATE		114
> +#define IMXRT1170_CLK_LPUART3			115
> +#define IMXRT1170_CLK_LPUART4_SEL		116
> +#define IMXRT1170_CLK_LPUART4_GATE		117
> +#define IMXRT1170_CLK_LPUART4			118
> +#define IMXRT1170_CLK_LPUART5_SEL		119
> +#define IMXRT1170_CLK_LPUART5_GATE		120
> +#define IMXRT1170_CLK_LPUART5			121
> +#define IMXRT1170_CLK_LPUART6_SEL		122
> +#define IMXRT1170_CLK_LPUART6_GATE		123
> +#define IMXRT1170_CLK_LPUART6			124
> +#define IMXRT1170_CLK_LPUART7_SEL		125
> +#define IMXRT1170_CLK_LPUART7_GATE		126
> +#define IMXRT1170_CLK_LPUART7			127
> +#define IMXRT1170_CLK_LPUART8_SEL		128
> +#define IMXRT1170_CLK_LPUART8_GATE		129
> +#define IMXRT1170_CLK_LPUART8			130
> +#define IMXRT1170_CLK_LPUART9_SEL		131
> +#define IMXRT1170_CLK_LPUART9_GATE		132
> +#define IMXRT1170_CLK_LPUART9			133
> +#define IMXRT1170_CLK_LPUART10_SEL		134
> +#define IMXRT1170_CLK_LPUART10_GATE		135
> +#define IMXRT1170_CLK_LPUART10			136
> +#define IMXRT1170_CLK_LPUART11_SEL		137
> +#define IMXRT1170_CLK_LPUART11_GATE		138
> +#define IMXRT1170_CLK_LPUART11			139
> +#define IMXRT1170_CLK_LPUART12_SEL		140
> +#define IMXRT1170_CLK_LPUART12_GATE		141
> +#define IMXRT1170_CLK_LPUART12			142
> +#define IMXRT1170_CLK_LPI2C1_SEL		143
> +#define IMXRT1170_CLK_LPI2C1_GATE		144
> +#define IMXRT1170_CLK_LPI2C1			145
> +#define IMXRT1170_CLK_LPI2C2_SEL		146
> +#define IMXRT1170_CLK_LPI2C2_GATE		147
> +#define IMXRT1170_CLK_LPI2C2			148
> +#define IMXRT1170_CLK_LPI2C3_SEL		149
> +#define IMXRT1170_CLK_LPI2C3_GATE		150
> +#define IMXRT1170_CLK_LPI2C3			151
> +#define IMXRT1170_CLK_LPI2C4_SEL		152
> +#define IMXRT1170_CLK_LPI2C4_GATE		153
> +#define IMXRT1170_CLK_LPI2C4			154
> +#define IMXRT1170_CLK_LPI2C5_SEL		155
> +#define IMXRT1170_CLK_LPI2C5_GATE		156
> +#define IMXRT1170_CLK_LPI2C5			157
> +#define IMXRT1170_CLK_LPI2C6_SEL		158
> +#define IMXRT1170_CLK_LPI2C6_GATE		159
> +#define IMXRT1170_CLK_LPI2C6			160
> +#define IMXRT1170_CLK_LPSPI1_SEL		161
> +#define IMXRT1170_CLK_LPSPI1_GATE		162
> +#define IMXRT1170_CLK_LPSPI1			163
> +#define IMXRT1170_CLK_LPSPI2_SEL		164
> +#define IMXRT1170_CLK_LPSPI2_GATE		165
> +#define IMXRT1170_CLK_LPSPI2			166
> +#define IMXRT1170_CLK_LPSPI3_SEL		167
> +#define IMXRT1170_CLK_LPSPI3_GATE		168
> +#define IMXRT1170_CLK_LPSPI3			169
> +#define IMXRT1170_CLK_LPSPI4_SEL		170
> +#define IMXRT1170_CLK_LPSPI4_GATE		171
> +#define IMXRT1170_CLK_LPSPI4			172
> +#define IMXRT1170_CLK_LPSPI5_SEL		173
> +#define IMXRT1170_CLK_LPSPI5_GATE		174
> +#define IMXRT1170_CLK_LPSPI5			175
> +#define IMXRT1170_CLK_LPSPI6_SEL		176
> +#define IMXRT1170_CLK_LPSPI6_GATE		177
> +#define IMXRT1170_CLK_LPSPI6			178
> +#define IMXRT1170_CLK_EMV1_SEL			179
> +#define IMXRT1170_CLK_EMV1_GATE			180
> +#define IMXRT1170_CLK_EMV1			181
> +#define IMXRT1170_CLK_EMV2_SEL			182
> +#define IMXRT1170_CLK_EMV2_GATE			183
> +#define IMXRT1170_CLK_EMV2			184
> +#define IMXRT1170_CLK_ENET1_SEL			185
> +#define IMXRT1170_CLK_ENET1_GATE		186
> +#define IMXRT1170_CLK_ENET1			187
> +#define IMXRT1170_CLK_ENET2_SEL			188
> +#define IMXRT1170_CLK_ENET2_GATE		189
> +#define IMXRT1170_CLK_ENET2			190
> +#define IMXRT1170_CLK_ENET_QOS_SEL		191
> +#define IMXRT1170_CLK_ENET_QOS_GATE		192
> +#define IMXRT1170_CLK_ENET_QOS			193
> +#define IMXRT1170_CLK_ENET_25M_SEL		194
> +#define IMXRT1170_CLK_ENET_25M_GATE		195
> +#define IMXRT1170_CLK_ENET_25M			196
> +#define IMXRT1170_CLK_ENET_TIMER1_SEL		197
> +#define IMXRT1170_CLK_ENET_TIMER1_GATE		198
> +#define IMXRT1170_CLK_ENET_TIMER1		199
> +#define IMXRT1170_CLK_ENET_TIMER2_SEL		200
> +#define IMXRT1170_CLK_ENET_TIMER2_GATE		201
> +#define IMXRT1170_CLK_ENET_TIMER2		202
> +#define IMXRT1170_CLK_ENET_TIMER3_SEL		203
> +#define IMXRT1170_CLK_ENET_TIMER3_GATE		204
> +#define IMXRT1170_CLK_ENET_TIMER3		205
> +#define IMXRT1170_CLK_USDHC1_SEL		206
> +#define IMXRT1170_CLK_USDHC1_GATE		207
> +#define IMXRT1170_CLK_USDHC1			208
> +#define IMXRT1170_CLK_USDHC2_SEL		209
> +#define IMXRT1170_CLK_USDHC2_GATE		210
> +#define IMXRT1170_CLK_USDHC2			211
> +#define IMXRT1170_CLK_ASRC_SEL			212
> +#define IMXRT1170_CLK_ASRC_GATE			213
> +#define IMXRT1170_CLK_ASRC			214
> +#define IMXRT1170_CLK_MQS_SEL			215
> +#define IMXRT1170_CLK_MQS_GATE			216
> +#define IMXRT1170_CLK_MQS			217
> +#define IMXRT1170_CLK_MIC_SEL			218
> +#define IMXRT1170_CLK_MIC_GATE			219
> +#define IMXRT1170_CLK_MIC			220
> +#define IMXRT1170_CLK_SPDIF_SEL			221
> +#define IMXRT1170_CLK_SPDIF_GATE		222
> +#define IMXRT1170_CLK_SPDIF			223
> +#define IMXRT1170_CLK_SAI1_SEL			224
> +#define IMXRT1170_CLK_SAI1_GATE			225
> +#define IMXRT1170_CLK_SAI1			226
> +#define IMXRT1170_CLK_SAI2_SEL			227
> +#define IMXRT1170_CLK_SAI2_GATE			228
> +#define IMXRT1170_CLK_SAI2			229
> +#define IMXRT1170_CLK_SAI3_SEL			230
> +#define IMXRT1170_CLK_SAI3_GATE			231
> +#define IMXRT1170_CLK_SAI3			232
> +#define IMXRT1170_CLK_SAI4_SEL			233
> +#define IMXRT1170_CLK_SAI4_GATE			234
> +#define IMXRT1170_CLK_SAI4			235
> +#define IMXRT1170_CLK_GC355_SEL			236
> +#define IMXRT1170_CLK_GC355_GATE		237
> +#define IMXRT1170_CLK_GC355			238
> +#define IMXRT1170_CLK_LCDIF_SEL			239
> +#define IMXRT1170_CLK_LCDIF_GATE		240
> +#define IMXRT1170_CLK_LCDIF			241
> +#define IMXRT1170_CLK_LCDIFV2_SEL		242
> +#define IMXRT1170_CLK_LCDIFV2_GATE		243
> +#define IMXRT1170_CLK_LCDIFV2			244
> +#define IMXRT1170_CLK_MIPI_REF_SEL		245
> +#define IMXRT1170_CLK_MIPI_REF_GATE		246
> +#define IMXRT1170_CLK_MIPI_REF			247
> +#define IMXRT1170_CLK_MIPI_ESC_SEL		248
> +#define IMXRT1170_CLK_MIPI_ESC_GATE		249
> +#define IMXRT1170_CLK_MIPI_ESC			250
> +#define IMXRT1170_CLK_CSI2_SEL			251
> +#define IMXRT1170_CLK_CSI2_GATE			252
> +#define IMXRT1170_CLK_CSI2			253
> +#define IMXRT1170_CLK_CSI2_ESC_SEL		254
> +#define IMXRT1170_CLK_CSI2_ESC_GATE		255
> +#define IMXRT1170_CLK_CSI2_ESC			256
> +#define IMXRT1170_CLK_CSI2_UI_SEL		257
> +#define IMXRT1170_CLK_CSI2_UI_GATE		258
> +#define IMXRT1170_CLK_CSI2_UI			259
> +#define IMXRT1170_CLK_CSI_SEL			260
> +#define IMXRT1170_CLK_CSI_GATE			261
> +#define IMXRT1170_CLK_CSI			262
> +#define IMXRT1170_CLK_CKO1_SEL			263
> +#define IMXRT1170_CLK_CKO1_GATE			264
> +#define IMXRT1170_CLK_CKO1			265
> +#define IMXRT1170_CLK_CKO2_SEL			266
> +#define IMXRT1170_CLK_CKO2_GATE			267
> +#define IMXRT1170_CLK_CKO2			268
> +#define IMXRT1170_CLK_USB			269
> +#define IMXRT1170_CLK_END			270
> +
> +#endif /* __DT_BINDINGS_CLOCK_IMXRT1170_H */
> -- 
> 2.35.1
> 
> 
