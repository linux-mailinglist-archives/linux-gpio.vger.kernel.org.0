Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AB12A4BC7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 17:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbgKCQoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 11:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbgKCQoC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 11:44:02 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71783C061A04
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 08:44:02 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id w145so13339601oie.9
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 08:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j0VBbXjpdL1m/xb8jfV3yaghCTs9f/IYXw0uJjV4+rU=;
        b=M+HZ82AtYhoaAt9FZ4rgWk/5MD4+nZb7WcWR3gfEIYlUZqs2y6t1bR7CvbgCPbntUV
         Afx7XggS3KeT1i5AVXGuSUlLPcq+czFQtHIENyt7wPJWZZOW7QjUUnmHv3E1euL8fnVy
         ZvOkH9jdI6WT3jqYaIjw4Ri9uepjbGaJHN+4+/BTxjqGh5bmLSNzDAuqXG8dY/Pm96Pn
         PfHVq72w3NR4vJwri6vLDyUs+nPoxKUU/RAwC3OpLaqVahb4yJh4FjtTJ9OLAUR/CJaB
         eh+mmoT4u6H0OgG1SFuDfPavB0dvinWJqxtWq3WPL5C8xAaLmktR6hkPqz2K8GBR4lb0
         C0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j0VBbXjpdL1m/xb8jfV3yaghCTs9f/IYXw0uJjV4+rU=;
        b=kf1G30/bSeX3OqFpzIMZJh5+jHfhLnJ0sETdsvqd+6MylMUCv2OHwUjZ5VxiWfbmuy
         2wvqndqhJtkF6JrftQ+8kOS7TJCc/9PowMxerskVLdWdZFEgtj+ab2Ms+VFFJAfJ1hEw
         2/PZhBcMjiedDI0bnYg3LLGQRSe4x1V1GjKZ8SPTkhHjGuiK0Jr0W52vC7HsaXlZ8Y5s
         2miFxohOss4N5eXZTIwoAq4tTu68ihjoamxRTDRq4hYlfl0+//T6wfx5iKvmq/dHnaIy
         82aIwPDSl0Q6H8benZe0v2Uf3UoqWu5JFQqmwAPIXT0CjbfN20/GM6MyHQuMeLL5/rcR
         bGEw==
X-Gm-Message-State: AOAM531iuuNKTgbECKKvcY6d5n1zP6ikANq1/zSDrJVqtbIQ5u7u+NXo
        bWcOoFEKPHFKvSbuO1n6f6OQ3w==
X-Google-Smtp-Source: ABdhPJwZjp/dFRtE//tmZhs907FIpCy2zncucfBJOw0PNrwnOe8AbpeFlsJnAONQOEDZNee3PI9UNA==
X-Received: by 2002:a54:408b:: with SMTP id i11mr163oii.89.1604421841389;
        Tue, 03 Nov 2020 08:44:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a22sm2948498oib.52.2020.11.03.08.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:44:00 -0800 (PST)
Date:   Tue, 3 Nov 2020 10:43:58 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SDX55 pinctrl
 bindings
Message-ID: <20201103164358.GO3151@builder.lan>
References: <20201103055801.472736-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103055801.472736-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 02 Nov 23:58 CST 2020, Vinod Koul wrote:

> Add device tree binding Documentation details for Qualcomm SDX55
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
> new file mode 100644
> index 000000000000..95b77d9a608c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sdx55-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SDX55 TLMM block
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  SDX55 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdx55-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Specifies the TLMM summary IRQ
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  wakeup-parent:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins. Functions are only valid for gpio pins.
> +        enum: [ adsp_ext, atest, audio_ref, bimc_dte0, bimc_dte1, blsp_i2c1,
> +                blsp_i2c2, blsp_i2c3, blsp_i2c4, blsp_spi1, blsp_spi2,
> +                blsp_spi3, blsp_spi4, blsp_uart1, blsp_uart2, blsp_uart3,
> +                blsp_uart4, char_exec, coex_uart, coex_uart2, cri_trng,
> +                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0,
> +                ebi0_wrcdc, ebi2_a, ebi2_lcd, emac_gcc0, emac_gcc1,
> +                emac_pps0, emac_pps1, ext_dbg, gcc_gp1, gcc_gp2, gcc_gp3,
> +                gcc_plltest, gpio, i2s_mclk, jitter_bist, ldo_en, ldo_update,
> +                mgpi_clk, m_voc, native_char, native_char0, native_char1,
> +                native_char2, native_char3, native_tsens, native_tsense,
> +                nav_gpio, pa_indicator, pcie_clkreq, pci_e, pll_bist, pll_ref,
> +                pll_test, pri_mi2s, prng_rosc, qdss_cti, qdss_gpio,
> +                qdss_gpio0, qdss_gpio1, qdss_gpio2, qdss_gpio3, qdss_gpio4,
> +                qdss_gpio5, qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9,
> +                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13,
> +                qdss_gpio14, qdss_gpio15, qdss_stm0, qdss_stm1, qdss_stm2,
> +                qdss_stm3, qdss_stm4, qdss_stm5, qdss_stm6, qdss_stm7,
> +                qdss_stm8, qdss_stm9, qdss_stm10, qdss_stm11, qdss_stm12,
> +                qdss_stm13, qdss_stm14, qdss_stm15, qdss_stm16, qdss_stm17,
> +                qdss_stm18, qdss_stm19, qdss_stm20, qdss_stm21, qdss_stm22,
> +                qdss_stm23, qdss_stm24, qdss_stm25, qdss_stm26, qdss_stm27,
> +                qdss_stm28, qdss_stm29, qdss_stm30, qdss_stm31, qlink0_en,
> +                qlink0_req, qlink0_wmss, qlink1_en, qlink1_req, qlink1_wmss,
> +                spmi_coex, sec_mi2s, spmi_vgi, tgu_ch0, uim1_clk, uim1_data,
> +                uim1_present, uim1_reset, uim2_clk, uim2_data, uim2_present,
> +                uim2_reset, usb2phy_ac, vsense_trigger ]
> +
> +        drive-strength:
> +          enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +          default: 2
> +          description:
> +            Selects the drive strength for the specified pins, in mA.
> +
> +        bias-pull-down: true
> +
> +        bias-pull-up: true
> +
> +        bias-disable: true
> +
> +        output-high: true
> +
> +        output-low: true
> +
> +      required:
> +        - pins
> +        - function
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        pinctrl@1f00000 {
> +                compatible = "qcom,sdx55-pinctrl";
> +                reg = <0x0f100000 0x300000>;
> +                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +                #interrupt-cells = <2>;
> +                interrupt-controller;
> +                gpio-controller;
> +                #gpio-cells = <2>;

Isn't gpio-ranges a required property? Perhaps that's only a functional
requirement for the hogs to work?


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +        };
> +
> +...
> -- 
> 2.26.2
> 
