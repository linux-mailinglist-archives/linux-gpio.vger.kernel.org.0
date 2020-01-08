Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D371343FC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 14:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgAHNhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 08:37:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:35934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgAHNhj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 08:37:39 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA2D20880;
        Wed,  8 Jan 2020 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578490655;
        bh=znpa8ysGVYXgN+bhbIslWE8ApjZ7FIgSC5PQ3hT62GY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lf64WvEB+ngnm6aVi60z5nvsnQGKS4IHRe13hM3h/38Da9rQf6YAAgbeW355QljsL
         LIEBhj32iZg/59F8cubk/o1mqm13OXP04fgPiv5MX/AMR4iEp0DtuZ0WYr39c7l189
         TfVFsaWcrIOnYRgbGoWLAiAuoXZVNJzerzH4L5Is=
Received: by mail-qk1-f182.google.com with SMTP id k6so2606128qki.5;
        Wed, 08 Jan 2020 05:37:34 -0800 (PST)
X-Gm-Message-State: APjAAAVIvLKXf3VDoSMjr3/bSkhSGiWj0TlELh6mKDt5Mt+x0V3rLH5X
        n+VJ8mYw9aQ6UxGPpVZiEz5p0OXI7Oc569iS3g==
X-Google-Smtp-Source: APXvYqwOsbUq0wbIF7YMqyRsxUQ8uR3294XSvu0u5n1Ou5FnEm+h9nmtMZ3e/kqUedF9m35TD8q8U9wLm1fhH+0RhDo=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr4392240qkd.223.1578490653474;
 Wed, 08 Jan 2020 05:37:33 -0800 (PST)
MIME-Version: 1.0
References: <1578376710-19548-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1578376710-19548-1-git-send-email-Anson.Huang@nxp.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 8 Jan 2020 07:37:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJvQNbEoM-YGZF5BOWEc308bn5yurtiQTRL9XXUF8YaZA@mail.gmail.com>
Message-ID: <CAL_JsqJvQNbEoM-YGZF5BOWEc308bn5yurtiQTRL9XXUF8YaZA@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MP
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        marcin.juszkiewicz@linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 12:02 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Add binding doc for i.MX8MP pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> ---
> Changes since V3:
>         - Fix type using uint32-array instead of string;
>         - Fix build error by NOT using macro definition.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |  65 ++
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931 +++++++++++++++++++++
>  2 files changed, 996 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> new file mode 100644
> index 0000000..547cc1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mp-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale IMX8MP IOMUX Controller
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +description:
> +  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> +  for common binding part and usage.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-iomuxc
> +
> +# Client device subnode's properties
> +patternProperties:
> +  '-grp$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      fsl,pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          each entry consists of 6 integers and represents the mux and config

Sounds like constraints on the length. Do:

allOf:
  - $ref: /schemas/types.yaml#/definitions/uint32-array
maxItems: 6

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> +          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
> +          integer CONFIG is the pad setting value like pull-up on this pin. Please
> +          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
> +
> +    required:
> +      - fsl,pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    iomuxc: pinctrl@30330000 {
> +        compatible = "fsl,imx8mp-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +        pinctrl_uart2: uart2grp {
> +            fsl,pins = <
> +                0x228 0x488 0x5F0 0x0 0x6      0x49
> +                0x228 0x488 0x000 0x0 0x0      0x49
> +            >;
> +        };
> +    };
> +
> +...
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> new file mode 100644
> index 0000000..da78f89
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -0,0 +1,931 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2019 NXP
> + */
> +
> +#ifndef __DTS_IMX8MP_PINFUNC_H
> +#define __DTS_IMX8MP_PINFUNC_H
> +
> +/*
> + * The pin function ID is a tuple of
> + * <mux_reg conf_reg input_reg mux_mode input_val>
> + */
> +#define MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00                          0x014 0x274 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__CCMSRCGPCMIX_ENET_PHY_REF_CLK_ROOT  0x014 0x274 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__MEDIAMIX_ISP_FL_TRIG_0              0x014 0x274 0x5D4 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K                  0x014 0x274 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__CCMSRCGPCMIX_EXT_CLK1               0x014 0x274 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO00__SJC_FAIL                            0x014 0x274 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01                          0x018 0x278 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT                            0x018 0x278 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__MEDIAMIX_ISP_SHUTTER_TRIG_0         0x018 0x278 0x5DC 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__ANAMIX_REF_CLK_24M                  0x018 0x278 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__CCMSRCGPCMIX_EXT_CLK2               0x018 0x278 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO01__SJC_ACTIVE                          0x018 0x278 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO02__GPIO1_IO02                          0x01C 0x27C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B                        0x01C 0x27C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO02__MEDIAMIX_ISP_FLASH_TRIG_0           0x01C 0x27C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_ANY                      0x01C 0x27C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO02__SJC_DE_B                            0x01C 0x27C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03                          0x020 0x280 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__USDHC1_VSELECT                      0x020 0x280 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__MEDIAMIX_ISP_PRELIGHT_TRIG_0        0x020 0x280 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__SDMA1_EXT_EVENT00                   0x020 0x280 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__ANAMIX_XTAL_OK                      0x020 0x280 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO03__SJC_DONE                            0x020 0x280 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04                          0x024 0x284 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT                      0x024 0x284 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__MEDIAMIX_ISP_SHUTTER_OPEN_0         0x024 0x284 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__SDMA1_EXT_EVENT01                   0x024 0x284 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__ANAMIX_XTAL_OK_LV                   0x024 0x284 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO04__USDHC1_TEST_TRIG                    0x024 0x284 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05                          0x028 0x288 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__M7_NMI                              0x028 0x288 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__MEDIAMIX_ISP_FL_TRIG_1              0x028 0x288 0x5D8 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__CCMSRCGPCMIX_PMIC_READY             0x028 0x288 0x554 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__CCMSRCGPCMIX_INT_BOOT               0x028 0x288 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO05__USDHC2_TEST_TRIG                    0x028 0x288 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06                          0x02C 0x28C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__ENET_QOS_MDC                        0x02C 0x28C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__MEDIAMIX_ISP_SHUTTER_TRIG_1         0x02C 0x28C 0x5E0 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__USDHC1_CD_B                         0x02C 0x28C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__CCMSRCGPCMIX_EXT_CLK3               0x02C 0x28C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO06__ECSPI1_TEST_TRIG                    0x02C 0x28C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07                          0x030 0x290 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__ENET_QOS_MDIO                       0x030 0x290 0x590 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__MEDIAMIX_ISP_FLASH_TRIG_1           0x030 0x290 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__USDHC1_WP                           0x030 0x290 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__CCMSRCGPCMIX_EXT_CLK4               0x030 0x290 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO07__ECSPI2_TEST_TRIG                    0x030 0x290 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08                          0x034 0x294 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_IN             0x034 0x294 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__PWM1_OUT                            0x034 0x294 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__MEDIAMIX_ISP_PRELIGHT_TRIG_1        0x034 0x294 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_AUX_IN         0x034 0x294 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__USDHC2_RESET_B                      0x034 0x294 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__CCMSRCGPCMIX_WAIT                   0x034 0x294 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO08__FLEXSPI_TEST_TRIG                   0x034 0x294 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09                          0x038 0x298 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__ENET_QOS_1588_EVENT0_OUT            0x038 0x298 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT                            0x038 0x298 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__MEDIAMIX_ISP_SHUTTER_OPEN_1         0x038 0x298 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__USDHC3_RESET_B                      0x038 0x298 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__AUDIOMIX_EXT_EVENT00                0x038 0x298 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__CCMSRCGPCMIX_STOP                   0x038 0x298 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO09__RAWNAND_TEST_TRIG                   0x038 0x298 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10                          0x03C 0x29C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__HSIOMIX_usb1_OTG_ID                 0x03C 0x29C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__PWM3_OUT                            0x03C 0x29C 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO10__OCOTP_FUSE_LATCHED                  0x03C 0x29C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11                          0x040 0x2A0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__HSIOMIX_usb2_OTG_ID                 0x040 0x2A0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT                            0x040 0x2A0 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__USDHC3_VSELECT                      0x040 0x2A0 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__CCMSRCGPCMIX_PMIC_READY             0x040 0x2A0 0x554 0x5 0x1
> +#define MX8MP_IOMUXC_GPIO1_IO11__CCMSRCGPCMIX_OUT0                   0x040 0x2A0 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO11__CAAM_RNG_OSC_OBS                    0x040 0x2A0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12                          0x044 0x2A4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__HSIOMIX_usb1_OTG_PWR                0x044 0x2A4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__AUDIOMIX_EXT_EVENT01                0x044 0x2A4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__CCMSRCGPCMIX_OUT1                   0x044 0x2A4 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO12__CSU_CSU_ALARM_AUT00                 0x044 0x2A4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13                          0x048 0x2A8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__HSIOMIX_usb1_OTG_OC                 0x048 0x2A8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__PWM2_OUT                            0x048 0x2A8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__CCMSRCGPCMIX_OUT2                   0x048 0x2A8 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO13__CSU_CSU_ALARM_AUT01                 0x048 0x2A8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                          0x04C 0x2AC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__HSIOMIX_usb2_OTG_PWR                0x04C 0x2AC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__USDHC3_CD_B                         0x04C 0x2AC 0x608 0x4 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__PWM3_OUT                            0x04C 0x2AC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__CCMSRCGPCMIX_CLKO1                  0x04C 0x2AC 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO14__CSU_CSU_ALARM_AUT02                 0x04C 0x2AC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                          0x050 0x2B0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__HSIOMIX_usb2_OTG_OC                 0x050 0x2B0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__USDHC3_WP                           0x050 0x2B0 0x634 0x4 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__PWM4_OUT                            0x050 0x2B0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__CCMSRCGPCMIX_CLKO2                  0x050 0x2B0 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_GPIO1_IO15__CSU_CSU_INT_DEB                     0x050 0x2B0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC                          0x054 0x2B4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_MDC__AUDIOMIX_SAI6_TX_DATA00               0x054 0x2B4 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16                            0x054 0x2B4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_MDC__USDHC3_STROBE                         0x054 0x2B4 0x630 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_MDC__SIM_M_HADDR15                         0x054 0x2B4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO                        0x058 0x2B8 0x590 0x0 0x1
> +#define MX8MP_IOMUXC_ENET_MDIO__AUDIOMIX_SAI6_TX_SYNC                0x058 0x2B8 0x528 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17                           0x058 0x2B8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_MDIO__USDHC3_DATA5                         0x058 0x2B8 0x624 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_MDIO__SIM_M_HADDR16                        0x058 0x2B8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3                    0x05C 0x2BC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TD3__AUDIOMIX_SAI6_TX_BCLK                 0x05C 0x2BC 0x524 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TD3__GPIO1_IO18                            0x05C 0x2BC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TD3__USDHC3_DATA6                          0x05C 0x2BC 0x628 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_TD3__SIM_M_HADDR17                         0x05C 0x2BC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2                    0x060 0x2C0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK   0x060 0x2C0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__AUDIOMIX_SAI6_RX_DATA00               0x060 0x2C0 0x51C 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19                            0x060 0x2C0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__USDHC3_DATA7                          0x060 0x2C0 0x62C 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_TD2__SIM_M_HADDR18                         0x060 0x2C0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1                    0x064 0x2C4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TD1__AUDIOMIX_SAI6_RX_SYNC                 0x064 0x2C4 0x520 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20                            0x064 0x2C4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TD1__USDHC3_CD_B                           0x064 0x2C4 0x608 0x6 0x1
> +#define MX8MP_IOMUXC_ENET_TD1__SIM_M_HADDR19                         0x064 0x2C4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0                    0x068 0x2C8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TD0__AUDIOMIX_SAI6_RX_BCLK                 0x068 0x2C8 0x518 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21                            0x068 0x2C8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TD0__USDHC3_WP                             0x068 0x2C8 0x634 0x6 0x1
> +#define MX8MP_IOMUXC_ENET_TD0__SIM_M_HADDR20                         0x068 0x2C8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL              0x06C 0x2CC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__AUDIOMIX_SAI6_MCLK                 0x06C 0x2CC 0x514 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__AUDIOMIX_SPDIF_OUT                 0x06C 0x2CC 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22                         0x06C 0x2CC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__USDHC3_DATA0                       0x06C 0x2CC 0x610 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_TX_CTL__SIM_M_HADDR21                      0x06C 0x2CC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK    0x070 0x2D0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__ENET_QOS_TX_ER                        0x070 0x2D0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__AUDIOMIX_SAI7_TX_DATA00               0x070 0x2D0 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23                            0x070 0x2D0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__USDHC3_DATA1                          0x070 0x2D0 0x614 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_TXC__SIM_M_HADDR22                         0x070 0x2D0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL              0x074 0x2D4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__AUDIOMIX_SAI7_TX_SYNC              0x074 0x2D4 0x540 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__AUDIOMIX_BIT_STREAM03              0x074 0x2D4 0x4CC 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24                         0x074 0x2D4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__USDHC3_DATA2                       0x074 0x2D4 0x618 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RX_CTL__SIM_M_HADDR23                      0x074 0x2D4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK    0x078 0x2D8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER                        0x078 0x2D8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__AUDIOMIX_SAI7_TX_BCLK                 0x078 0x2D8 0x53C 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__AUDIOMIX_BIT_STREAM02                 0x078 0x2D8 0x4C8 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25                            0x078 0x2D8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__USDHC3_DATA3                          0x078 0x2D8 0x61C 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RXC__SIM_M_HADDR24                         0x078 0x2D8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0                    0x07C 0x2DC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__AUDIOMIX_SAI7_RX_DATA00               0x07C 0x2DC 0x534 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__AUDIOMIX_BIT_STREAM01                 0x07C 0x2DC 0x4C4 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26                            0x07C 0x2DC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__USDHC3_DATA4                          0x07C 0x2DC 0x620 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RD0__SIM_M_HADDR25                         0x07C 0x2DC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1                    0x080 0x2E0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__AUDIOMIX_SAI7_RX_SYNC                 0x080 0x2E0 0x538 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__AUDIOMIX_BIT_STREAM00                 0x080 0x2E0 0x4C0 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27                            0x080 0x2E0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__USDHC3_RESET_B                        0x080 0x2E0 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RD1__SIM_M_HADDR26                         0x080 0x2E0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2                    0x084 0x2E4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__AUDIOMIX_SAI7_RX_BCLK                 0x084 0x2E4 0x530 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__AUDIOMIX_CLK                          0x084 0x2E4 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__GPIO1_IO28                            0x084 0x2E4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__USDHC3_CLK                            0x084 0x2E4 0x604 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RD2__SIM_M_HADDR27                         0x084 0x2E4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3                    0x088 0x2E8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__AUDIOMIX_SAI7_MCLK                    0x088 0x2E8 0x52C 0x2 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__AUDIOMIX_SPDIF_IN                     0x088 0x2E8 0x544 0x3 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__GPIO1_IO29                            0x088 0x2E8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__USDHC3_CMD                            0x088 0x2E8 0x60C 0x6 0x0
> +#define MX8MP_IOMUXC_ENET_RD3__SIM_M_HADDR28                         0x088 0x2E8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK                             0x08C 0x2EC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__ENET1_MDC                              0x08C 0x2EC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__I2C5_SCL                               0x08C 0x2EC 0x5C4 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX                           0x08C 0x2EC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__UART1_DTE_RX                           0x08C 0x2EC 0x5E8 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__GPIO2_IO00                             0x08C 0x2EC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_CLK__SIM_M_HADDR29                          0x08C 0x2EC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD                             0x090 0x2F0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__ENET1_MDIO                             0x090 0x2F0 0x57C 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__I2C5_SDA                               0x090 0x2F0 0x5C8 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX                           0x090 0x2F0 0x5E8 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_CMD__UART1_DTE_TX                           0x090 0x2F0 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__GPIO2_IO01                             0x090 0x2F0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_CMD__SIM_M_HADDR30                          0x090 0x2F0 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0                         0x094 0x2F4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__ENET1_RGMII_TD1                      0x094 0x2F4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__I2C6_SCL                             0x094 0x2F4 0x5CC 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__UART1_DCE_RTS                        0x094 0x2F4 0x5E4 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__UART1_DTE_CTS                        0x094 0x2F4 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__GPIO2_IO02                           0x094 0x2F4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA0__SIM_M_HADDR31                        0x094 0x2F4 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1                         0x098 0x2F8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__ENET1_RGMII_TD0                      0x098 0x2F8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__I2C6_SDA                             0x098 0x2F8 0x5D0 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS                        0x098 0x2F8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__UART1_DTE_RTS                        0x098 0x2F8 0x5E4 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_DATA1__GPIO2_IO03                           0x098 0x2F8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA1__SIM_M_HBURST00                       0x098 0x2F8 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2                         0x09C 0x2FC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__ENET1_RGMII_RD0                      0x09C 0x2FC 0x580 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__I2C4_SCL                             0x09C 0x2FC 0x5BC 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__UART2_DCE_TX                         0x09C 0x2FC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__UART2_DTE_RX                         0x09C 0x2FC 0x5F0 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__GPIO2_IO04                           0x09C 0x2FC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA2__SIM_M_HBURST01                       0x09C 0x2FC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3                         0x0A0 0x300 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__ENET1_RGMII_RD1                      0x0A0 0x300 0x584 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__I2C4_SDA                             0x0A0 0x300 0x5C0 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__UART2_DCE_RX                         0x0A0 0x300 0x5F0 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_DATA3__UART2_DTE_TX                         0x0A0 0x300 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__GPIO2_IO05                           0x0A0 0x300 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA3__SIM_M_HBURST02                       0x0A0 0x300 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__USDHC1_DATA4                         0x0A4 0x304 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__ENET1_RGMII_TX_CTL                   0x0A4 0x304 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL                             0x0A4 0x304 0x5A4 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__UART2_DCE_RTS                        0x0A4 0x304 0x5EC 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__UART2_DTE_CTS                        0x0A4 0x304 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06                           0x0A4 0x304 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA4__SIM_M_HRESP                          0x0A4 0x304 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__USDHC1_DATA5                         0x0A8 0x308 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__ENET1_TX_ER                          0x0A8 0x308 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA                             0x0A8 0x308 0x5A8 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__UART2_DCE_CTS                        0x0A8 0x308 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__UART2_DTE_RTS                        0x0A8 0x308 0x5EC 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07                           0x0A8 0x308 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA5__TPSMP_HDATA05                        0x0A8 0x308 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__USDHC1_DATA6                         0x0AC 0x30C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__ENET1_RGMII_RX_CTL                   0x0AC 0x30C 0x588 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__I2C2_SCL                             0x0AC 0x30C 0x5AC 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__UART3_DCE_TX                         0x0AC 0x30C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__UART3_DTE_RX                         0x0AC 0x30C 0x5F8 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08                           0x0AC 0x30C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA6__TPSMP_HDATA06                        0x0AC 0x30C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__USDHC1_DATA7                         0x0B0 0x310 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__ENET1_RX_ER                          0x0B0 0x310 0x58C 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__I2C2_SDA                             0x0B0 0x310 0x5B0 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__UART3_DCE_RX                         0x0B0 0x310 0x5F8 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_DATA7__UART3_DTE_TX                         0x0B0 0x310 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09                           0x0B0 0x310 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_DATA7__TPSMP_HDATA07                        0x0B0 0x310 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__USDHC1_RESET_B                     0x0B4 0x314 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__ENET1_TX_CLK                       0x0B4 0x314 0x578 0x1 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__I2C3_SCL                           0x0B4 0x314 0x5B4 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS                      0x0B4 0x314 0x5F4 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__UART3_DTE_CTS                      0x0B4 0x314 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10                         0x0B4 0x314 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_RESET_B__ECSPI3_TEST_TRIG                   0x0B4 0x314 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD1_STROBE__USDHC1_STROBE                       0x0B8 0x318 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD1_STROBE__I2C3_SDA                            0x0B8 0x318 0x5B8 0x3 0x0
> +#define MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS                       0x0B8 0x318 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD1_STROBE__UART3_DTE_RTS                       0x0B8 0x318 0x5F4 0x4 0x1
> +#define MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11                          0x0B8 0x318 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD1_STROBE__USDHC3_TEST_TRIG                    0x0B8 0x318 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B                           0x0BC 0x31C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                            0x0BC 0x31C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_CD_B__CCMSRCGPCMIX_TESTER_ACK               0x0BC 0x31C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                             0x0C0 0x320 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__ECSPI2_SCLK                            0x0C0 0x320 0x568 0x2 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__UART4_DCE_RX                           0x0C0 0x320 0x600 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__UART4_DTE_TX                           0x0C0 0x320 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__GPIO2_IO13                             0x0C0 0x320 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__CCMSRCGPCMIX_OBSERVE0                  0x0C0 0x320 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_CLK__OBSERVE_MUX_OUT00                      0x0C0 0x320 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                             0x0C4 0x324 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__ECSPI2_MOSI                            0x0C4 0x324 0x570 0x2 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__UART4_DCE_TX                           0x0C4 0x324 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__UART4_DTE_RX                           0x0C4 0x324 0x600 0x3 0x1
> +#define MX8MP_IOMUXC_SD2_CMD__AUDIOMIX_CLK                           0x0C4 0x324 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__GPIO2_IO14                             0x0C4 0x324 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__CCMSRCGPCMIX_OBSERVE1                  0x0C4 0x324 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_CMD__OBSERVE_MUX_OUT01                      0x0C4 0x324 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                         0x0C8 0x328 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_DATA0__I2C4_SDA                             0x0C8 0x328 0x5C0 0x2 0x1
> +#define MX8MP_IOMUXC_SD2_DATA0__UART2_DCE_RX                         0x0C8 0x328 0x5F0 0x3 0x2
> +#define MX8MP_IOMUXC_SD2_DATA0__UART2_DTE_TX                         0x0C8 0x328 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_DATA0__AUDIOMIX_BIT_STREAM00                0x0C8 0x328 0x4C0 0x4 0x1
> +#define MX8MP_IOMUXC_SD2_DATA0__GPIO2_IO15                           0x0C8 0x328 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_DATA0__CCMSRCGPCMIX_OBSERVE2                0x0C8 0x328 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_DATA0__OBSERVE_MUX_OUT02                    0x0C8 0x328 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                         0x0CC 0x32C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_DATA1__I2C4_SCL                             0x0CC 0x32C 0x5BC 0x2 0x1
> +#define MX8MP_IOMUXC_SD2_DATA1__UART2_DCE_TX                         0x0CC 0x32C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_DATA1__UART2_DTE_RX                         0x0CC 0x32C 0x5F0 0x3 0x3
> +#define MX8MP_IOMUXC_SD2_DATA1__AUDIOMIX_BIT_STREAM01                0x0CC 0x32C 0x4C4 0x4 0x1
> +#define MX8MP_IOMUXC_SD2_DATA1__GPIO2_IO16                           0x0CC 0x32C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_DATA1__CCMSRCGPCMIX_WAIT                    0x0CC 0x32C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_DATA1__OBSERVE_MUX_OUT03                    0x0CC 0x32C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                         0x0D0 0x330 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__ECSPI2_SS0                           0x0D0 0x330 0x574 0x2 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__AUDIOMIX_SPDIF_OUT                   0x0D0 0x330 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__AUDIOMIX_BIT_STREAM02                0x0D0 0x330 0x4C8 0x4 0x1
> +#define MX8MP_IOMUXC_SD2_DATA2__GPIO2_IO17                           0x0D0 0x330 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__CCMSRCGPCMIX_STOP                    0x0D0 0x330 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_DATA2__OBSERVE_MUX_OUT04                    0x0D0 0x330 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                         0x0D4 0x334 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_DATA3__ECSPI2_MISO                          0x0D4 0x334 0x56C 0x2 0x0
> +#define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_SPDIF_IN                    0x0D4 0x334 0x544 0x3 0x1
> +#define MX8MP_IOMUXC_SD2_DATA3__AUDIOMIX_BIT_STREAM03                0x0D4 0x334 0x4CC 0x4 0x1
> +#define MX8MP_IOMUXC_SD2_DATA3__GPIO2_IO18                           0x0D4 0x334 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_DATA3__CCMSRCGPCMIX_EARLY_RESET             0x0D4 0x334 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_RESET_B__USDHC2_RESET_B                     0x0D8 0x338 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19                         0x0D8 0x338 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_RESET_B__CCMSRCGPCMIX_SYSTEM_RESET          0x0D8 0x338 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_WP__USDHC2_WP                               0x0DC 0x33C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SD2_WP__GPIO2_IO20                              0x0DC 0x33C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SD2_WP__CORESIGHT_EVENTI                        0x0DC 0x33C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SD2_WP__SIM_M_HMASTLOCK                         0x0DC 0x33C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__RAWNAND_ALE                           0x0E0 0x340 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK                        0x0E0 0x340 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__AUDIOMIX_SAI3_TX_BCLK                 0x0E0 0x340 0x4E8 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__MEDIAMIX_ISP_FL_TRIG_0                0x0E0 0x340 0x5D4 0x3 0x1
> +#define MX8MP_IOMUXC_NAND_ALE__UART3_DCE_RX                          0x0E0 0x340 0x5F8 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_ALE__UART3_DTE_TX                          0x0E0 0x340 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__GPIO3_IO00                            0x0E0 0x340 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__CORESIGHT_TRACE_CLK                   0x0E0 0x340 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_ALE__SIM_M_HPROT00                         0x0E0 0x340 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__RAWNAND_CE0_B                       0x0E4 0x344 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B                     0x0E4 0x344 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__AUDIOMIX_SAI3_TX_DATA00             0x0E4 0x344 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__MEDIAMIX_ISP_SHUTTER_TRIG_0         0x0E4 0x344 0x5DC 0x3 0x1
> +#define MX8MP_IOMUXC_NAND_CE0_B__UART3_DCE_TX                        0x0E4 0x344 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__UART3_DTE_RX                        0x0E4 0x344 0x5F8 0x4 0x3
> +#define MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01                          0x0E4 0x344 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__CORESIGHT_TRACE_CTL                 0x0E4 0x344 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_CE0_B__SIM_M_HPROT01                       0x0E4 0x344 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_CE1_B__RAWNAND_CE1_B                       0x0E8 0x348 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_CE1_B__FLEXSPI_A_SS1_B                     0x0E8 0x348 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE                       0x0E8 0x348 0x630 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_CE1_B__I2C4_SCL                            0x0E8 0x348 0x5BC 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02                          0x0E8 0x348 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_CE1_B__CORESIGHT_TRACE00                   0x0E8 0x348 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_CE1_B__SIM_M_HPROT02                       0x0E8 0x348 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_CE2_B__RAWNAND_CE2_B                       0x0EC 0x34C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_CE2_B__FLEXSPI_B_SS0_B                     0x0EC 0x34C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5                        0x0EC 0x34C 0x624 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_CE2_B__I2C4_SDA                            0x0EC 0x34C 0x5C0 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_CE2_B__GPIO3_IO03                          0x0EC 0x34C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_CE2_B__CORESIGHT_TRACE01                   0x0EC 0x34C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_CE2_B__SIM_M_HPROT03                       0x0EC 0x34C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_CE3_B__RAWNAND_CE3_B                       0x0F0 0x350 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_CE3_B__FLEXSPI_B_SS1_B                     0x0F0 0x350 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6                        0x0F0 0x350 0x628 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_CE3_B__I2C3_SDA                            0x0F0 0x350 0x5B8 0x4 0x1
> +#define MX8MP_IOMUXC_NAND_CE3_B__GPIO3_IO04                          0x0F0 0x350 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_CE3_B__CORESIGHT_TRACE02                   0x0F0 0x350 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_CE3_B__SIM_M_HADDR00                       0x0F0 0x350 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__RAWNAND_CLE                           0x0F4 0x354 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__FLEXSPI_B_SCLK                        0x0F4 0x354 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7                          0x0F4 0x354 0x62C 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_CLE__UART4_DCE_RX                          0x0F4 0x354 0x600 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_CLE__UART4_DTE_TX                          0x0F4 0x354 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__GPIO3_IO05                            0x0F4 0x354 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__CORESIGHT_TRACE03                     0x0F4 0x354 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_CLE__SIM_M_HADDR01                         0x0F4 0x354 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__RAWNAND_DATA00                     0x0F8 0x358 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00                   0x0F8 0x358 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__AUDIOMIX_SAI3_RX_DATA00            0x0F8 0x358 0x4E4 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__MEDIAMIX_ISP_FLASH_TRIG_0          0x0F8 0x358 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__UART4_DCE_RX                       0x0F8 0x358 0x600 0x4 0x3
> +#define MX8MP_IOMUXC_NAND_DATA00__UART4_DTE_TX                       0x0F8 0x358 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__GPIO3_IO06                         0x0F8 0x358 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__CORESIGHT_TRACE04                  0x0F8 0x358 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA00__SIM_M_HADDR02                      0x0F8 0x358 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__RAWNAND_DATA01                     0x0FC 0x35C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01                   0x0FC 0x35C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__AUDIOMIX_SAI3_TX_SYNC              0x0FC 0x35C 0x4EC 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__MEDIAMIX_ISP_PRELIGHT_TRIG_0       0x0FC 0x35C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__UART4_DCE_TX                       0x0FC 0x35C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__UART4_DTE_RX                       0x0FC 0x35C 0x600 0x4 0x4
> +#define MX8MP_IOMUXC_NAND_DATA01__GPIO3_IO07                         0x0FC 0x35C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__CORESIGHT_TRACE05                  0x0FC 0x35C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA01__SIM_M_HADDR03                      0x0FC 0x35C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__RAWNAND_DATA02                     0x100 0x360 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02                   0x100 0x360 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__USDHC3_CD_B                        0x100 0x360 0x608 0x2 0x2
> +#define MX8MP_IOMUXC_NAND_DATA02__UART4_DCE_CTS                      0x100 0x360 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__UART4_DTE_RTS                      0x100 0x360 0x5FC 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__I2C4_SDA                           0x100 0x360 0x5C0 0x4 0x3
> +#define MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08                         0x100 0x360 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__CORESIGHT_TRACE06                  0x100 0x360 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA02__SIM_M_HADDR04                      0x100 0x360 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__RAWNAND_DATA03                     0x104 0x364 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03                   0x104 0x364 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__USDHC3_WP                          0x104 0x364 0x634 0x2 0x2
> +#define MX8MP_IOMUXC_NAND_DATA03__UART4_DCE_RTS                      0x104 0x364 0x5FC 0x3 0x1
> +#define MX8MP_IOMUXC_NAND_DATA03__UART4_DTE_CTS                      0x104 0x364 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__MEDIAMIX_ISP_FL_TRIG_1             0x104 0x364 0x5D8 0x4 0x1
> +#define MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09                         0x104 0x364 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__CORESIGHT_TRACE07                  0x104 0x364 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA03__SIM_M_HADDR05                      0x104 0x364 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__RAWNAND_DATA04                     0x108 0x368 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__FLEXSPI_B_DATA00                   0x108 0x368 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0                       0x108 0x368 0x610 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_DATA04__FLEXSPI_A_DATA04                   0x108 0x368 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__MEDIAMIX_ISP_SHUTTER_TRIG_1        0x108 0x368 0x5E0 0x4 0x1
> +#define MX8MP_IOMUXC_NAND_DATA04__GPIO3_IO10                         0x108 0x368 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__CORESIGHT_TRACE08                  0x108 0x368 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA04__SIM_M_HADDR06                      0x108 0x368 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__RAWNAND_DATA05                     0x10C 0x36C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__FLEXSPI_B_DATA01                   0x10C 0x36C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1                       0x10C 0x36C 0x614 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_DATA05__FLEXSPI_A_DATA05                   0x10C 0x36C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__MEDIAMIX_ISP_FLASH_TRIG_1          0x10C 0x36C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__GPIO3_IO11                         0x10C 0x36C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__CORESIGHT_TRACE09                  0x10C 0x36C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA05__SIM_M_HADDR07                      0x10C 0x36C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__RAWNAND_DATA06                     0x110 0x370 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__FLEXSPI_B_DATA02                   0x110 0x370 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2                       0x110 0x370 0x618 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_DATA06__FLEXSPI_A_DATA06                   0x110 0x370 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__MEDIAMIX_ISP_PRELIGHT_TRIG_1       0x110 0x370 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__GPIO3_IO12                         0x110 0x370 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__CORESIGHT_TRACE10                  0x110 0x370 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA06__SIM_M_HADDR08                      0x110 0x370 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__RAWNAND_DATA07                     0x114 0x374 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__FLEXSPI_B_DATA03                   0x114 0x374 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3                       0x114 0x374 0x61C 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_DATA07__FLEXSPI_A_DATA07                   0x114 0x374 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__MEDIAMIX_ISP_SHUTTER_OPEN_1        0x114 0x374 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__GPIO3_IO13                         0x114 0x374 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__CORESIGHT_TRACE11                  0x114 0x374 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DATA07__SIM_M_HADDR09                      0x114 0x374 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__RAWNAND_DQS                           0x118 0x378 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__FLEXSPI_A_DQS                         0x118 0x378 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__AUDIOMIX_SAI3_MCLK                    0x118 0x378 0x4E0 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__MEDIAMIX_ISP_SHUTTER_OPEN_0           0x118 0x378 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__I2C3_SCL                              0x118 0x378 0x5B4 0x4 0x1
> +#define MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14                            0x118 0x378 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__CORESIGHT_TRACE12                     0x118 0x378 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_DQS__SIM_M_HADDR10                         0x118 0x378 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__RAWNAND_RE_B                         0x11C 0x37C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__FLEXSPI_B_DQS                        0x11C 0x37C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4                         0x11C 0x37C 0x620 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_RE_B__UART4_DCE_TX                         0x11C 0x37C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__UART4_DTE_RX                         0x11C 0x37C 0x600 0x4 0x5
> +#define MX8MP_IOMUXC_NAND_RE_B__GPIO3_IO15                           0x11C 0x37C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__CORESIGHT_TRACE13                    0x11C 0x37C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_RE_B__SIM_M_HADDR11                        0x11C 0x37C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_READY_B__RAWNAND_READY_B                   0x120 0x380 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_READY_B__USDHC3_RESET_B                    0x120 0x380 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_NAND_READY_B__I2C3_SCL                          0x120 0x380 0x5B4 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16                        0x120 0x380 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_READY_B__CORESIGHT_TRACE14                 0x120 0x380 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_READY_B__SIM_M_HADDR12                     0x120 0x380 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_WE_B__RAWNAND_WE_B                         0x124 0x384 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK                           0x124 0x384 0x604 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_WE_B__I2C3_SDA                             0x124 0x384 0x5B8 0x4 0x2
> +#define MX8MP_IOMUXC_NAND_WE_B__GPIO3_IO17                           0x124 0x384 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_WE_B__CORESIGHT_TRACE15                    0x124 0x384 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_WE_B__SIM_M_HADDR13                        0x124 0x384 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_NAND_WP_B__RAWNAND_WP_B                         0x128 0x388 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD                           0x128 0x388 0x60C 0x2 0x1
> +#define MX8MP_IOMUXC_NAND_WP_B__I2C4_SCL                             0x128 0x388 0x5BC 0x4 0x3
> +#define MX8MP_IOMUXC_NAND_WP_B__GPIO3_IO18                           0x128 0x388 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_NAND_WP_B__CORESIGHT_EVENTO                     0x128 0x388 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_NAND_WP_B__SIM_M_HADDR14                        0x128 0x388 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI5_RXFS__AUDIOMIX_SAI5_RX_SYNC                0x12C 0x38C 0x508 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXFS__AUDIOMIX_SAI1_TX_DATA00              0x12C 0x38C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT                             0x12C 0x38C 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL                             0x12C 0x38C 0x5CC 0x3 0x1
> +#define MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19                           0x12C 0x38C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_SAI5_RX_BCLK                 0x130 0x390 0x4F4 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_SAI1_TX_DATA01               0x130 0x390 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXC__PWM3_OUT                              0x130 0x390 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA                              0x130 0x390 0x5D0 0x3 0x1
> +#define MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_CLK                          0x130 0x390 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20                            0x130 0x390 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD0__AUDIOMIX_SAI5_RX_DATA00              0x134 0x394 0x4F8 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD0__AUDIOMIX_SAI1_TX_DATA02              0x134 0x394 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT                             0x134 0x394 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL                             0x134 0x394 0x5C4 0x3 0x1
> +#define MX8MP_IOMUXC_SAI5_RXD0__AUDIOMIX_BIT_STREAM00                0x134 0x394 0x4C0 0x4 0x2
> +#define MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21                           0x134 0x394 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_RX_DATA01              0x138 0x398 0x4FC 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI1_TX_DATA03              0x138 0x398 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI1_TX_SYNC                0x138 0x398 0x4D8 0x2 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC                0x138 0x398 0x510 0x3 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_BIT_STREAM01                0x138 0x398 0x4C4 0x4 0x2
> +#define MX8MP_IOMUXC_SAI5_RXD1__GPIO3_IO22                           0x138 0x398 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD1__CAN1_TX                              0x138 0x398 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_RX_DATA02              0x13C 0x39C 0x500 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI1_TX_DATA04              0x13C 0x39C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI1_TX_SYNC                0x13C 0x39C 0x4D8 0x2 0x1
> +#define MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK                0x13C 0x39C 0x50C 0x3 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_BIT_STREAM02                0x13C 0x39C 0x4C8 0x4 0x2
> +#define MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23                           0x13C 0x39C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD2__CAN1_RX                              0x13C 0x39C 0x54C 0x6 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_SAI5_RX_DATA03              0x140 0x3A0 0x504 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_SAI1_TX_DATA05              0x140 0x3A0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_SAI1_TX_SYNC                0x140 0x3A0 0x4D8 0x2 0x2
> +#define MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_SAI5_TX_DATA00              0x140 0x3A0 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_BIT_STREAM03                0x140 0x3A0 0x4CC 0x4 0x2
> +#define MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24                           0x140 0x3A0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX                              0x140 0x3A0 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK                   0x144 0x3A4 0x4F0 0x0 0x0
> +#define MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI1_TX_BCLK                0x144 0x3A4 0x4D4 0x1 0x0
> +#define MX8MP_IOMUXC_SAI5_MCLK__PWM1_OUT                             0x144 0x3A4 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI5_MCLK__I2C5_SDA                             0x144 0x3A4 0x5C8 0x3 0x1
> +#define MX8MP_IOMUXC_SAI5_MCLK__GPIO3_IO25                           0x144 0x3A4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX                              0x144 0x3A4 0x550 0x6 0x0
> +#define MX8MP_IOMUXC_SAI1_RXFS__AUDIOMIX_SAI1_RX_SYNC                0x148 0x3A8 0x4D0 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXFS__AUDIOMIX_SAI5_RX_SYNC                0x148 0x3A8 0x508 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXFS__ENET1_1588_EVENT0_IN                 0x148 0x3A8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00                           0x148 0x3A8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXC__AUDIOMIX_SAI1_RX_BCLK                 0x14C 0x3AC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXC__AUDIOMIX_SAI5_RX_BCLK                 0x14C 0x3AC 0x4F4 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXC__AUDIOMIX_CLK                          0x14C 0x3AC 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI1_RXC__ENET1_1588_EVENT0_OUT                 0x14C 0x3AC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01                            0x14C 0x3AC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD0__AUDIOMIX_SAI1_RX_DATA00              0x150 0x3B0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD0__AUDIOMIX_SAI5_RX_DATA00              0x150 0x3B0 0x4F8 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD0__AUDIOMIX_SAI1_TX_DATA01              0x150 0x3B0 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD0__AUDIOMIX_BIT_STREAM00                0x150 0x3B0 0x4C0 0x3 0x3
> +#define MX8MP_IOMUXC_SAI1_RXD0__ENET1_1588_EVENT1_IN                 0x150 0x3B0 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02                           0x150 0x3B0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD1__AUDIOMIX_SAI1_RX_DATA01              0x154 0x3B4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD1__AUDIOMIX_SAI5_RX_DATA01              0x154 0x3B4 0x4FC 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD1__AUDIOMIX_BIT_STREAM01                0x154 0x3B4 0x4C4 0x3 0x3
> +#define MX8MP_IOMUXC_SAI1_RXD1__ENET1_1588_EVENT1_OUT                0x154 0x3B4 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03                           0x154 0x3B4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD2__AUDIOMIX_SAI1_RX_DATA02              0x158 0x3B8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD2__AUDIOMIX_SAI5_RX_DATA02              0x158 0x3B8 0x500 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD2__AUDIOMIX_BIT_STREAM02                0x158 0x3B8 0x4C8 0x3 0x3
> +#define MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC                            0x158 0x3B8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04                           0x158 0x3B8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD3__AUDIOMIX_SAI1_RX_DATA03              0x15C 0x3BC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD3__AUDIOMIX_SAI5_RX_DATA03              0x15C 0x3BC 0x504 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD3__AUDIOMIX_BIT_STREAM03                0x15C 0x3BC 0x4CC 0x3 0x3
> +#define MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO                           0x15C 0x3BC 0x57C 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05                           0x15C 0x3BC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD4__AUDIOMIX_SAI1_RX_DATA04              0x160 0x3C0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD4__AUDIOMIX_SAI6_TX_BCLK                0x160 0x3C0 0x524 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD4__AUDIOMIX_SAI6_RX_BCLK                0x160 0x3C0 0x518 0x2 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0                      0x160 0x3C0 0x580 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD4__GPIO4_IO06                           0x160 0x3C0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI1_RX_DATA05              0x164 0x3C4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI6_TX_DATA00              0x164 0x3C4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI6_RX_DATA00              0x164 0x3C4 0x51C 0x2 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD5__AUDIOMIX_SAI1_RX_SYNC                0x164 0x3C4 0x4D0 0x3 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1                      0x164 0x3C4 0x584 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD5__GPIO4_IO07                           0x164 0x3C4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD6__AUDIOMIX_SAI1_RX_DATA06              0x168 0x3C8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD6__AUDIOMIX_SAI6_TX_SYNC                0x168 0x3C8 0x528 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD6__AUDIOMIX_SAI6_RX_SYNC                0x168 0x3C8 0x520 0x2 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2                      0x168 0x3C8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08                           0x168 0x3C8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD7__AUDIOMIX_SAI1_RX_DATA07              0x16C 0x3CC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD7__AUDIOMIX_SAI6_MCLK                   0x16C 0x3CC 0x514 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_RXD7__AUDIOMIX_SAI1_TX_SYNC                0x16C 0x3CC 0x4D8 0x2 0x3
> +#define MX8MP_IOMUXC_SAI1_RXD7__AUDIOMIX_SAI1_TX_DATA04              0x16C 0x3CC 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3                      0x16C 0x3CC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09                           0x16C 0x3CC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXFS__AUDIOMIX_SAI1_TX_SYNC                0x170 0x3D0 0x4D8 0x0 0x4
> +#define MX8MP_IOMUXC_SAI1_TXFS__AUDIOMIX_SAI5_TX_SYNC                0x170 0x3D0 0x510 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL                   0x170 0x3D0 0x588 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_TXFS__GPIO4_IO10                           0x170 0x3D0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXC__AUDIOMIX_SAI1_TX_BCLK                 0x174 0x3D4 0x4D4 0x0 0x1
> +#define MX8MP_IOMUXC_SAI1_TXC__AUDIOMIX_SAI5_TX_BCLK                 0x174 0x3D4 0x50C 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC                       0x174 0x3D4 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXC__GPIO4_IO11                            0x174 0x3D4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD0__AUDIOMIX_SAI1_TX_DATA00              0x178 0x3D8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD0__AUDIOMIX_SAI5_TX_DATA00              0x178 0x3D8 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0                      0x178 0x3D8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD0__GPIO4_IO12                           0x178 0x3D8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD1__AUDIOMIX_SAI1_TX_DATA01              0x17C 0x3DC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD1__AUDIOMIX_SAI5_TX_DATA01              0x17C 0x3DC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1                      0x17C 0x3DC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD1__GPIO4_IO13                           0x17C 0x3DC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD2__AUDIOMIX_SAI1_TX_DATA02              0x180 0x3E0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD2__AUDIOMIX_SAI5_TX_DATA02              0x180 0x3E0 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2                      0x180 0x3E0 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14                           0x180 0x3E0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD3__AUDIOMIX_SAI1_TX_DATA03              0x184 0x3E4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD3__AUDIOMIX_SAI5_TX_DATA03              0x184 0x3E4 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3                      0x184 0x3E4 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD3__GPIO4_IO15                           0x184 0x3E4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD4__AUDIOMIX_SAI1_TX_DATA04              0x188 0x3E8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD4__AUDIOMIX_SAI6_RX_BCLK                0x188 0x3E8 0x518 0x1 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD4__AUDIOMIX_SAI6_TX_BCLK                0x188 0x3E8 0x524 0x2 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL                   0x188 0x3E8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD4__GPIO4_IO16                           0x188 0x3E8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI1_TX_DATA05              0x18C 0x3EC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI6_RX_DATA00              0x18C 0x3EC 0x51C 0x1 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI6_TX_DATA00              0x18C 0x3EC 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC                      0x18C 0x3EC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17                           0x18C 0x3EC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI1_TX_DATA06              0x190 0x3F0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI6_RX_SYNC                0x190 0x3F0 0x520 0x1 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI6_TX_SYNC                0x190 0x3F0 0x528 0x2 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD6__ENET1_RX_ER                          0x190 0x3F0 0x58C 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18                           0x190 0x3F0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI1_TX_DATA07              0x194 0x3F4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI6_MCLK                   0x194 0x3F4 0x514 0x1 0x2
> +#define MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_CLK                         0x194 0x3F4 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD7__ENET1_TX_ER                          0x194 0x3F4 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19                           0x194 0x3F4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI1_MCLK__AUDIOMIX_SAI1_MCLK                   0x198 0x3F8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI1_MCLK__AUDIOMIX_SAI5_MCLK                   0x198 0x3F8 0x4F0 0x1 0x1
> +#define MX8MP_IOMUXC_SAI1_MCLK__AUDIOMIX_SAI1_TX_BCLK                0x198 0x3F8 0x4D4 0x2 0x2
> +#define MX8MP_IOMUXC_SAI1_MCLK__ENET1_TX_CLK                         0x198 0x3F8 0x578 0x4 0x1
> +#define MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20                           0x198 0x3F8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__AUDIOMIX_SAI2_RX_SYNC                0x19C 0x3FC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__AUDIOMIX_SAI5_TX_SYNC                0x19C 0x3FC 0x510 0x1 0x2
> +#define MX8MP_IOMUXC_SAI2_RXFS__AUDIOMIX_SAI5_TX_DATA01              0x19C 0x3FC 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__AUDIOMIX_SAI2_RX_DATA01              0x19C 0x3FC 0x4DC 0x3 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX                         0x19C 0x3FC 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__UART1_DTE_RX                         0x19C 0x3FC 0x5E8 0x4 0x2
> +#define MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21                           0x19C 0x3FC 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_RXFS__AUDIOMIX_BIT_STREAM02                0x19C 0x3FC 0x4C8 0x6 0x4
> +#define MX8MP_IOMUXC_SAI2_RXFS__SIM_M_HSIZE00                        0x19C 0x3FC 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_RXC__AUDIOMIX_SAI2_RX_BCLK                 0x1A0 0x400 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_RXC__AUDIOMIX_SAI5_TX_BCLK                 0x1A0 0x400 0x50C 0x1 0x2
> +#define MX8MP_IOMUXC_SAI2_RXC__CAN1_TX                               0x1A0 0x400 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX                          0x1A0 0x400 0x5E8 0x4 0x3
> +#define MX8MP_IOMUXC_SAI2_RXC__UART1_DTE_TX                          0x1A0 0x400 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                            0x1A0 0x400 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_RXC__AUDIOMIX_BIT_STREAM01                 0x1A0 0x400 0x4C4 0x6 0x4
> +#define MX8MP_IOMUXC_SAI2_RXC__SIM_M_HSIZE01                         0x1A0 0x400 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00              0x1A4 0x404 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00              0x1A4 0x404 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__ENET_QOS_1588_EVENT2_OUT             0x1A4 0x404 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_TX_DATA01              0x1A4 0x404 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS                        0x1A4 0x404 0x5E4 0x4 0x2
> +#define MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS                        0x1A4 0x404 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__GPIO4_IO23                           0x1A4 0x404 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_BIT_STREAM03                0x1A4 0x404 0x4CC 0x6 0x4
> +#define MX8MP_IOMUXC_SAI2_RXD0__SIM_M_HSIZE02                        0x1A4 0x404 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC                0x1A8 0x408 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI5_TX_DATA01              0x1A8 0x408 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__ENET_QOS_1588_EVENT3_OUT             0x1A8 0x408 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_DATA01              0x1A8 0x408 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS                        0x1A8 0x408 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS                        0x1A8 0x408 0x5E4 0x4 0x3
> +#define MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24                           0x1A8 0x408 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_BIT_STREAM02                0x1A8 0x408 0x4C8 0x6 0x5
> +#define MX8MP_IOMUXC_SAI2_TXFS__SIM_M_HWRITE                         0x1A8 0x408 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK                 0x1AC 0x40C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI5_TX_DATA02               0x1AC 0x40C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI2_TXC__CAN1_RX                               0x1AC 0x40C 0x54C 0x3 0x1
> +#define MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25                            0x1AC 0x40C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_BIT_STREAM01                 0x1AC 0x40C 0x4C4 0x6 0x5
> +#define MX8MP_IOMUXC_SAI2_TXC__SIM_M_HREADYOUT                       0x1AC 0x40C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00              0x1B0 0x410 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI5_TX_DATA03              0x1B0 0x410 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__ENET_QOS_1588_EVENT2_IN              0x1B0 0x410 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX                              0x1B0 0x410 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__ENET_QOS_1588_EVENT2_AUX_IN          0x1B0 0x410 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26                           0x1B0 0x410 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__CCMSRCGPCMIX_BOOT_MODE04             0x1B0 0x410 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SAI2_TXD0__TPSMP_CLK                            0x1B0 0x410 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK                   0x1B4 0x414 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI5_MCLK                   0x1B4 0x414 0x4F0 0x1 0x2
> +#define MX8MP_IOMUXC_SAI2_MCLK__ENET_QOS_1588_EVENT3_IN              0x1B4 0x414 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_SAI2_MCLK__CAN2_RX                              0x1B4 0x414 0x550 0x3 0x1
> +#define MX8MP_IOMUXC_SAI2_MCLK__ENET_QOS_1588_EVENT3_AUX_IN          0x1B4 0x414 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27                           0x1B4 0x414 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI3_MCLK                   0x1B4 0x414 0x4E0 0x6 0x1
> +#define MX8MP_IOMUXC_SAI2_MCLK__TPSMP_HDATA_DIR                      0x1B4 0x414 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC                0x1B8 0x418 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI2_RX_DATA01              0x1B8 0x418 0x4DC 0x1 0x1
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI5_RX_SYNC                0x1B8 0x418 0x508 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_DATA01              0x1B8 0x418 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SPDIF_IN                    0x1B8 0x418 0x544 0x4 0x2
> +#define MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28                           0x1B8 0x418 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_BIT_STREAM00                0x1B8 0x418 0x4C0 0x6 0x4
> +#define MX8MP_IOMUXC_SAI3_RXFS__TPSMP_HTRANS00                       0x1B8 0x418 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK                 0x1BC 0x41C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI2_RX_DATA02               0x1BC 0x41C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI5_RX_BCLK                 0x1BC 0x41C 0x4F4 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_RXC__GPT1_CLK                              0x1BC 0x41C 0x59C 0x3 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__UART2_DCE_CTS                         0x1BC 0x41C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__UART2_DTE_RTS                         0x1BC 0x41C 0x5EC 0x4 0x2
> +#define MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29                            0x1BC 0x41C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_CLK                          0x1BC 0x41C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SAI3_RXC__TPSMP_HTRANS01                        0x1BC 0x41C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00               0x1C0 0x420 0x4E4 0x0 0x1
> +#define MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI2_RX_DATA03               0x1C0 0x420 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00               0x1C0 0x420 0x4F8 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_RXD__UART2_DCE_RTS                         0x1C0 0x420 0x5EC 0x4 0x3
> +#define MX8MP_IOMUXC_SAI3_RXD__UART2_DTE_CTS                         0x1C0 0x420 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30                            0x1C0 0x420 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_BIT_STREAM01                 0x1C0 0x420 0x4C4 0x6 0x6
> +#define MX8MP_IOMUXC_SAI3_RXD__TPSMP_HDATA00                         0x1C0 0x420 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                0x1C4 0x424 0x4EC 0x0 0x1
> +#define MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI2_TX_DATA01              0x1C4 0x424 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI5_RX_DATA01              0x1C4 0x424 0x4FC 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_DATA01              0x1C4 0x424 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SAI3_TXFS__UART2_DCE_RX                         0x1C4 0x424 0x5F0 0x4 0x4
> +#define MX8MP_IOMUXC_SAI3_TXFS__UART2_DTE_TX                         0x1C4 0x424 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31                           0x1C4 0x424 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_BIT_STREAM03                0x1C4 0x424 0x4CC 0x6 0x5
> +#define MX8MP_IOMUXC_SAI3_TXFS__TPSMP_HDATA01                        0x1C4 0x424 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK                 0x1C8 0x428 0x4E8 0x0 0x1
> +#define MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI2_TX_DATA02               0x1C8 0x428 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI5_RX_DATA02               0x1C8 0x428 0x500 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_TXC__GPT1_CAPTURE1                         0x1C8 0x428 0x594 0x3 0x0
> +#define MX8MP_IOMUXC_SAI3_TXC__UART2_DCE_TX                          0x1C8 0x428 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_TXC__UART2_DTE_RX                          0x1C8 0x428 0x5F0 0x4 0x5
> +#define MX8MP_IOMUXC_SAI3_TXC__GPIO5_IO00                            0x1C8 0x428 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_BIT_STREAM02                 0x1C8 0x428 0x4C8 0x6 0x6
> +#define MX8MP_IOMUXC_SAI3_TXC__TPSMP_HDATA02                         0x1C8 0x428 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00               0x1CC 0x42C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI2_TX_DATA03               0x1CC 0x42C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI5_RX_DATA03               0x1CC 0x42C 0x504 0x2 0x2
> +#define MX8MP_IOMUXC_SAI3_TXD__GPT1_CAPTURE2                         0x1CC 0x42C 0x598 0x3 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SPDIF_EXT_CLK                0x1CC 0x42C 0x548 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__GPIO5_IO01                            0x1CC 0x42C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__CCMSRCGPCMIX_BOOT_MODE05              0x1CC 0x42C 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_SAI3_TXD__TPSMP_HDATA03                         0x1CC 0x42C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK                   0x1D0 0x430 0x4E0 0x0 0x2
> +#define MX8MP_IOMUXC_SAI3_MCLK__PWM4_OUT                             0x1D0 0x430 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI5_MCLK                   0x1D0 0x430 0x4F0 0x2 0x3
> +#define MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SPDIF_OUT                   0x1D0 0x430 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SAI3_MCLK__GPIO5_IO02                           0x1D0 0x430 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SPDIF_IN                    0x1D0 0x430 0x544 0x6 0x3
> +#define MX8MP_IOMUXC_SAI3_MCLK__TPSMP_HDATA04                        0x1D0 0x430 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_SPDIF_TX__AUDIOMIX_SPDIF_OUT                    0x1D4 0x434 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_SPDIF_TX__PWM3_OUT                              0x1D4 0x434 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL                              0x1D4 0x434 0x5C4 0x2 0x2
> +#define MX8MP_IOMUXC_SPDIF_TX__GPT1_COMPARE1                         0x1D4 0x434 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SPDIF_TX__CAN1_TX                               0x1D4 0x434 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03                            0x1D4 0x434 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SPDIF_RX__AUDIOMIX_SPDIF_IN                     0x1D8 0x438 0x544 0x0 0x4
> +#define MX8MP_IOMUXC_SPDIF_RX__PWM2_OUT                              0x1D8 0x438 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA                              0x1D8 0x438 0x5C8 0x2 0x2
> +#define MX8MP_IOMUXC_SPDIF_RX__GPT1_COMPARE2                         0x1D8 0x438 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SPDIF_RX__CAN1_RX                               0x1D8 0x438 0x54C 0x4 0x2
> +#define MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04                            0x1D8 0x438 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SPDIF_EXT_CLK__GPT1_COMPARE3                    0x1DC 0x43C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05                       0x1DC 0x43C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_SPDIF_EXT_CLK__AUDIOMIX_SPDIF_EXT_CLK           0x1DC 0x43C 0x548 0x0 0x1
> +#define MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT                         0x1DC 0x43C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK                        0x1E0 0x440 0x558 0x0 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                       0x1E0 0x440 0x5F8 0x1 0x4
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DTE_TX                       0x1E0 0x440 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__I2C1_SCL                           0x1E0 0x440 0x5A4 0x2 0x1
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__AUDIOMIX_SAI7_RX_SYNC              0x1E0 0x440 0x538 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__GPIO5_IO06                         0x1E0 0x440 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SCLK__TPSMP_HDATA08                      0x1E0 0x440 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI                        0x1E4 0x444 0x560 0x0 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX                       0x1E4 0x444 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DTE_RX                       0x1E4 0x444 0x5F8 0x1 0x5
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__I2C1_SDA                           0x1E4 0x444 0x5A8 0x2 0x1
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__AUDIOMIX_SAI7_RX_BCLK              0x1E4 0x444 0x530 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__GPIO5_IO07                         0x1E4 0x444 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MOSI__TPSMP_HDATA09                      0x1E4 0x444 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO                        0x1E8 0x448 0x55C 0x0 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS                      0x1E8 0x448 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MISO__UART3_DTE_RTS                      0x1E8 0x448 0x5F4 0x1 0x2
> +#define MX8MP_IOMUXC_ECSPI1_MISO__I2C2_SCL                           0x1E8 0x448 0x5AC 0x2 0x1
> +#define MX8MP_IOMUXC_ECSPI1_MISO__AUDIOMIX_SAI7_RX_DATA00            0x1E8 0x448 0x534 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08                         0x1E8 0x448 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI1_MISO__TPSMP_HDATA10                      0x1E8 0x448 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SS0__ECSPI1_SS0                          0x1EC 0x44C 0x564 0x0 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS                       0x1EC 0x44C 0x5F4 0x1 0x3
> +#define MX8MP_IOMUXC_ECSPI1_SS0__UART3_DTE_CTS                       0x1EC 0x44C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SS0__I2C2_SDA                            0x1EC 0x44C 0x5B0 0x2 0x1
> +#define MX8MP_IOMUXC_ECSPI1_SS0__AUDIOMIX_SAI7_TX_SYNC               0x1EC 0x44C 0x540 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09                          0x1EC 0x44C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI1_SS0__TPSMP_HDATA11                       0x1EC 0x44C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK                        0x1F0 0x450 0x568 0x0 0x1
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DCE_RX                       0x1F0 0x450 0x600 0x1 0x6
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DTE_TX                       0x1F0 0x450 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__I2C3_SCL                           0x1F0 0x450 0x5B4 0x2 0x3
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__AUDIOMIX_SAI7_TX_BCLK              0x1F0 0x450 0x53C 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__GPIO5_IO10                         0x1F0 0x450 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SCLK__TPSMP_HDATA12                      0x1F0 0x450 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI                        0x1F4 0x454 0x570 0x0 0x1
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DCE_TX                       0x1F4 0x454 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DTE_RX                       0x1F4 0x454 0x600 0x1 0x7
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__I2C3_SDA                           0x1F4 0x454 0x5B8 0x2 0x3
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__AUDIOMIX_SAI7_TX_DATA00            0x1F4 0x454 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__GPIO5_IO11                         0x1F4 0x454 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MOSI__TPSMP_HDATA13                      0x1F4 0x454 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MISO__GPIO5_IO12                         0x1F8 0x458 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MISO__TPSMP_HDATA14                      0x1F8 0x458 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO                        0x1F8 0x458 0x56C 0x0 0x1
> +#define MX8MP_IOMUXC_ECSPI2_MISO__UART4_DCE_CTS                      0x1F8 0x458 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI2_MISO__UART4_DTE_RTS                      0x1F8 0x458 0x5FC 0x1 0x2
> +#define MX8MP_IOMUXC_ECSPI2_MISO__I2C4_SCL                           0x1F8 0x458 0x5BC 0x2 0x4
> +#define MX8MP_IOMUXC_ECSPI2_MISO__AUDIOMIX_SAI7_MCLK                 0x1F8 0x458 0x52C 0x3 0x1
> +#define MX8MP_IOMUXC_ECSPI2_MISO__CCMSRCGPCMIX_CLKO1                 0x1F8 0x458 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SS0__ECSPI2_SS0                          0x1FC 0x45C 0x574 0x0 0x1
> +#define MX8MP_IOMUXC_ECSPI2_SS0__UART4_DCE_RTS                       0x1FC 0x45C 0x5FC 0x1 0x3
> +#define MX8MP_IOMUXC_ECSPI2_SS0__UART4_DTE_CTS                       0x1FC 0x45C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SS0__I2C4_SDA                            0x1FC 0x45C 0x5C0 0x2 0x4
> +#define MX8MP_IOMUXC_ECSPI2_SS0__CCMSRCGPCMIX_CLKO2                  0x1FC 0x45C 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13                          0x1FC 0x45C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_ECSPI2_SS0__TPSMP_HDATA15                       0x1FC 0x45C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL                              0x200 0x460 0x5A4 0x0 0x2
> +#define MX8MP_IOMUXC_I2C1_SCL__ENET_QOS_MDC                          0x200 0x460 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C1_SCL__ECSPI1_SCLK                           0x200 0x460 0x558 0x3 0x1
> +#define MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14                            0x200 0x460 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C1_SCL__TPSMP_HDATA16                         0x200 0x460 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA                              0x204 0x464 0x5A8 0x0 0x2
> +#define MX8MP_IOMUXC_I2C1_SDA__ENET_QOS_MDIO                         0x204 0x464 0x590 0x1 0x2
> +#define MX8MP_IOMUXC_I2C1_SDA__ECSPI1_MOSI                           0x204 0x464 0x560 0x3 0x1
> +#define MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15                            0x204 0x464 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C1_SDA__TPSMP_HDATA17                         0x204 0x464 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL                              0x208 0x468 0x5AC 0x0 0x2
> +#define MX8MP_IOMUXC_I2C2_SCL__ENET_QOS_1588_EVENT1_IN               0x208 0x468 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C2_SCL__USDHC3_CD_B                           0x208 0x468 0x608 0x2 0x3
> +#define MX8MP_IOMUXC_I2C2_SCL__ECSPI1_MISO                           0x208 0x468 0x55C 0x3 0x1
> +#define MX8MP_IOMUXC_I2C2_SCL__ENET_QOS_1588_EVENT1_AUX_IN           0x208 0x468 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16                            0x208 0x468 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C2_SCL__TPSMP_HDATA18                         0x208 0x468 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA                              0x20C 0x46C 0x5B0 0x0 0x2
> +#define MX8MP_IOMUXC_I2C2_SDA__ENET_QOS_1588_EVENT1_OUT              0x20C 0x46C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C2_SDA__USDHC3_WP                             0x20C 0x46C 0x634 0x2 0x3
> +#define MX8MP_IOMUXC_I2C2_SDA__ECSPI1_SS0                            0x20C 0x46C 0x564 0x3 0x1
> +#define MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17                            0x20C 0x46C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C2_SDA__TPSMP_HDATA19                         0x20C 0x46C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                              0x210 0x470 0x5B4 0x0 0x4
> +#define MX8MP_IOMUXC_I2C3_SCL__PWM4_OUT                              0x210 0x470 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C3_SCL__GPT2_CLK                              0x210 0x470 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_I2C3_SCL__ECSPI2_SCLK                           0x210 0x470 0x568 0x3 0x2
> +#define MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18                            0x210 0x470 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C3_SCL__TPSMP_HDATA20                         0x210 0x470 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                              0x214 0x474 0x5B8 0x0 0x4
> +#define MX8MP_IOMUXC_I2C3_SDA__PWM3_OUT                              0x214 0x474 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C3_SDA__GPT3_CLK                              0x214 0x474 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_I2C3_SDA__ECSPI2_MOSI                           0x214 0x474 0x570 0x3 0x2
> +#define MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19                            0x214 0x474 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C3_SDA__TPSMP_HDATA21                         0x214 0x474 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL                              0x218 0x478 0x5BC 0x0 0x5
> +#define MX8MP_IOMUXC_I2C4_SCL__PWM2_OUT                              0x218 0x478 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C4_SCL__HSIOMIX_PCIE_CLKREQ_B                 0x218 0x478 0x5A0 0x2 0x0
> +#define MX8MP_IOMUXC_I2C4_SCL__ECSPI2_MISO                           0x218 0x478 0x56C 0x3 0x2
> +#define MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20                            0x218 0x478 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C4_SCL__TPSMP_HDATA22                         0x218 0x478 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA                              0x21C 0x47C 0x5C0 0x0 0x5
> +#define MX8MP_IOMUXC_I2C4_SDA__PWM1_OUT                              0x21C 0x47C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_I2C4_SDA__ECSPI2_SS0                            0x21C 0x47C 0x574 0x3 0x2
> +#define MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21                            0x21C 0x47C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_I2C4_SDA__TPSMP_HDATA23                         0x21C 0x47C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX                         0x220 0x480 0x5E8 0x0 0x4
> +#define MX8MP_IOMUXC_UART1_RXD__UART1_DTE_TX                         0x220 0x480 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART1_RXD__ECSPI3_SCLK                          0x220 0x480 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART1_RXD__GPIO5_IO22                           0x220 0x480 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART1_RXD__TPSMP_HDATA24                        0x220 0x480 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX                         0x224 0x484 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART1_TXD__UART1_DTE_RX                         0x224 0x484 0x5E8 0x0 0x5
> +#define MX8MP_IOMUXC_UART1_TXD__ECSPI3_MOSI                          0x224 0x484 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART1_TXD__GPIO5_IO23                           0x224 0x484 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART1_TXD__TPSMP_HDATA25                        0x224 0x484 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                         0x228 0x488 0x5F0 0x0 0x6
> +#define MX8MP_IOMUXC_UART2_RXD__UART2_DTE_TX                         0x228 0x488 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART2_RXD__ECSPI3_MISO                          0x228 0x488 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART2_RXD__GPT1_COMPARE3                        0x228 0x488 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24                           0x228 0x488 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART2_RXD__TPSMP_HDATA26                        0x228 0x488 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                         0x22C 0x48C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART2_TXD__UART2_DTE_RX                         0x22C 0x48C 0x5F0 0x0 0x7
> +#define MX8MP_IOMUXC_UART2_TXD__ECSPI3_SS0                           0x22C 0x48C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART2_TXD__GPT1_COMPARE2                        0x22C 0x48C 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25                           0x22C 0x48C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART2_TXD__TPSMP_HDATA27                        0x22C 0x48C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX                         0x230 0x490 0x5F8 0x0 0x6
> +#define MX8MP_IOMUXC_UART3_RXD__UART3_DTE_TX                         0x230 0x490 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS                        0x230 0x490 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS                        0x230 0x490 0x5E4 0x1 0x4
> +#define MX8MP_IOMUXC_UART3_RXD__USDHC3_RESET_B                       0x230 0x490 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__GPT1_CAPTURE2                        0x230 0x490 0x598 0x3 0x1
> +#define MX8MP_IOMUXC_UART3_RXD__CAN2_TX                              0x230 0x490 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__GPIO5_IO26                           0x230 0x490 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART3_RXD__TPSMP_HDATA28                        0x230 0x490 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX                         0x234 0x494 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART3_TXD__UART3_DTE_RX                         0x234 0x494 0x5F8 0x0 0x7
> +#define MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS                        0x234 0x494 0x5E4 0x1 0x5
> +#define MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS                        0x234 0x494 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART3_TXD__USDHC3_VSELECT                       0x234 0x494 0x000 0x2 0x0
> +#define MX8MP_IOMUXC_UART3_TXD__GPT1_CLK                             0x234 0x494 0x59C 0x3 0x1
> +#define MX8MP_IOMUXC_UART3_TXD__CAN2_RX                              0x234 0x494 0x550 0x4 0x2
> +#define MX8MP_IOMUXC_UART3_TXD__GPIO5_IO27                           0x234 0x494 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART3_TXD__TPSMP_HDATA29                        0x234 0x494 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX                         0x238 0x498 0x600 0x0 0x8
> +#define MX8MP_IOMUXC_UART4_RXD__UART4_DTE_TX                         0x238 0x498 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART4_RXD__UART2_DCE_CTS                        0x238 0x498 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART4_RXD__UART2_DTE_RTS                        0x238 0x498 0x5EC 0x1 0x4
> +#define MX8MP_IOMUXC_UART4_RXD__HSIOMIX_PCIE_CLKREQ_B                0x238 0x498 0x5A0 0x2 0x1
> +#define MX8MP_IOMUXC_UART4_RXD__GPT1_COMPARE1                        0x238 0x498 0x000 0x3 0x0
> +#define MX8MP_IOMUXC_UART4_RXD__I2C6_SCL                             0x238 0x498 0x5CC 0x4 0x2
> +#define MX8MP_IOMUXC_UART4_RXD__GPIO5_IO28                           0x238 0x498 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART4_RXD__TPSMP_HDATA30                        0x238 0x498 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX                         0x23C 0x49C 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_UART4_TXD__UART4_DTE_RX                         0x23C 0x49C 0x600 0x0 0x9
> +#define MX8MP_IOMUXC_UART4_TXD__UART2_DCE_RTS                        0x23C 0x49C 0x5EC 0x1 0x5
> +#define MX8MP_IOMUXC_UART4_TXD__UART2_DTE_CTS                        0x23C 0x49C 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_UART4_TXD__GPT1_CAPTURE1                        0x23C 0x49C 0x594 0x3 0x1
> +#define MX8MP_IOMUXC_UART4_TXD__I2C6_SDA                             0x23C 0x49C 0x5D0 0x4 0x2
> +#define MX8MP_IOMUXC_UART4_TXD__GPIO5_IO29                           0x23C 0x49C 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_UART4_TXD__TPSMP_HDATA31                        0x23C 0x49C 0x000 0x7 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_EARC_SCL                  0x240 0x4A0 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL                          0x240 0x4A0 0x5C4 0x3 0x3
> +#define MX8MP_IOMUXC_HDMI_DDC_SCL__CAN1_TX                           0x240 0x4A0 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26                        0x240 0x4A0 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SCL__AUDIOMIX_test_out00               0x240 0x4A0 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_EARC_SDA                  0x244 0x4A4 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA                          0x244 0x4A4 0x5C8 0x3 0x3
> +#define MX8MP_IOMUXC_HDMI_DDC_SDA__CAN1_RX                           0x244 0x4A4 0x54C 0x4 0x3
> +#define MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27                        0x244 0x4A4 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_HDMI_DDC_SDA__AUDIOMIX_test_out01               0x244 0x4A4 0x000 0x6 0x0
> +#define MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_EARC_CEC                      0x248 0x4A8 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_HDMI_CEC__I2C6_SCL                              0x248 0x4A8 0x5CC 0x3 0x3
> +#define MX8MP_IOMUXC_HDMI_CEC__CAN2_TX                               0x248 0x4A8 0x000 0x4 0x0
> +#define MX8MP_IOMUXC_HDMI_CEC__GPIO3_IO28                            0x248 0x4A8 0x000 0x5 0x0
> +#define MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_EARC_DC_HPD                   0x24C 0x4AC 0x000 0x0 0x0
> +#define MX8MP_IOMUXC_HDMI_HPD__AUDIOMIX_EARC_HDMI_HPD_O              0x24C 0x4AC 0x000 0x1 0x0
> +#define MX8MP_IOMUXC_HDMI_HPD__I2C6_SDA                              0x24C 0x4AC 0x5D0 0x3 0x3
> +#define MX8MP_IOMUXC_HDMI_HPD__CAN2_RX                               0x24C 0x4AC 0x550 0x4 0x3
> +#define MX8MP_IOMUXC_HDMI_HPD__GPIO3_IO29                            0x24C 0x4AC 0x000 0x5 0x0
> +
> +#endif /* __DTS_IMX8MP_PINFUNC_H */
> --
> 2.7.4
>
