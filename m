Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2949A707F67
	for <lists+linux-gpio@lfdr.de>; Thu, 18 May 2023 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjERLeo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 May 2023 07:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjERLen (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 May 2023 07:34:43 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B3419B1
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 04:34:39 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-309382efe13so1211479f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684409678; x=1687001678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YkuQbiMNDwFYe9VzVh568KBO1jasckrWzr3nv18xHi8=;
        b=h7dUTkfyI/3JOSqADmKmzX/Rf7E9LwSSKyFLmrBoKx69QYrRbf1po8Jq9/9Ef+DnDz
         hWKq5O4LCDhgvdKJRZNXkLBhqKXD16dCYtpzZX+C4JhhLH46fA4c4PSU78Tjky6VY4XX
         2a1jZ4f3V9kBssRguP3IRUJDl82NE1HtUH3hofoC35c+hnzKNN6OLDvoaC7ccFndi9IP
         K8kqqTwJI70j0bQeDu9eK20gf2hf8trm2yYVPwjvqOVl0Agvf+B+JEe84NVNrSUeVUwz
         hnBgC7NOt2z9OIQd/V7T78hC75YKNyc1QjGwZaslIcXOvfKHuhKJfOzmOzvXHp/e9VlP
         lUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684409678; x=1687001678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkuQbiMNDwFYe9VzVh568KBO1jasckrWzr3nv18xHi8=;
        b=TgxXfzAbFSHRX7Z1xJz5F3UfzzasUQ+AqJtshpPmUFX6LD2luLpeQzWkqX4wGjROJb
         QGbgkjRm1I5ZA4ThjfFBdBZNpZqAg7MXj6R8UViF5bV3ly7f4DiTTtcXbL6Q8LVFZqu7
         H60y7zOartdRguuZUHzK7Zuu8j32kri7vElkmnsLrbu/tD+a/4Lq0lCw96QlvOq6wnoB
         wy8ED5CkIBfkEWMXEx86oqUqYRKoaAt6J2IfZU9sCSY7zjlgLmu9f3Uq3znvCQKvYPQB
         lTpugrKix2ZWhpZDArjxLtNX2htsaF6HvsdNEw0TcJ4qfYNkfVaFXrp8xdhPFw73Ip9d
         10tg==
X-Gm-Message-State: AC+VfDw1mlY7WH2srDLo9x3zAQ6Rdg//Yz71LH68Ll+s4UYlnRhcvfOm
        qnfFLnKz6ZD5xRpl2LFeBQLzIaKJpT7+dMczKz7bDQ==
X-Google-Smtp-Source: ACHHUZ5f+APY7SZ90OX7+4EzZCSu+EyMNN7YOUWstHMlB4zFGJP/EFaKakrHSpR21W07IdR0g/+w7flx5aBC47L/07o=
X-Received: by 2002:a5d:6510:0:b0:309:46f5:cea7 with SMTP id
 x16-20020a5d6510000000b0030946f5cea7mr1446355wru.17.1684409677884; Thu, 18
 May 2023 04:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <1684409015-25196-1-git-send-email-quic_rohiagar@quicinc.com> <1684409015-25196-2-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1684409015-25196-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 18 May 2023 17:04:26 +0530
Message-ID: <CAH=2NtwTP35iu+7AhKHMQdxw+UCV_Rj-SbO-OGhsPfgRpK6=cg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SDX75 pinctrl
 devicetree compatible
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        richardcochran@gmail.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 18 May 2023 at 16:53, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Add device tree binding Documentation details for Qualcomm SDX75
> pinctrl driver.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sdx75-tlmm.yaml          | 137 +++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
> new file mode 100644
> index 0000000..7cb96aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx75-tlmm.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sdx75-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SDX75 TLMM block
> +
> +maintainers:
> +  - Rohit Agarwal <quic_rohiagar@quicinc.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm SDX75 SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sdx75-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  "#interrupt-cells": true
> +  gpio-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 67
> +
> +  gpio-line-names:
> +    maxItems: 133
> +
> +  "#gpio-cells": true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sdx75-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-sdx75-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-sdx75-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2])$"
> +            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data ]
> +        minItems: 1
> +        maxItems: 36
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ adsp_ext, atest_char, audio_ref_clk, bimc_dte, char_exec, coex_uart2,
> +                coex_uart, cri_trng, cri_trng0, cri_trng1, dbg_out_clk, ddr_bist,
> +                ddr_pxi0, ebi0_wrcdc, ebi2_a, ebi2_lcd, ebi2_lcd_te, emac0_mcg,
> +                emac0_ptp, emac1_mcg, emac1_ptp, emac_cdc, emac_pps_in, eth0_mdc,
> +                eth0_mdio, eth1_mdc, eth1_mdio, ext_dbg, gcc_125_clk, gcc_gp1_clk,
> +                gcc_gp2_clk, gcc_gp3_clk, gcc_plltest, gpio, i2s_mclk, jitter_bist,
> +                ldo_en, ldo_update, m_voc, mgpi_clk, native_char, native_tsens,
> +                native_tsense, nav_dr_sync, nav_gpio, pa_indicator, pci_e,
> +                pcie0_clkreq_n, pcie1_clkreq_n, pcie2_clkreq_n, pll_bist_sync,
> +                pll_clk_aux, pll_ref_clk, pri_mi2s, prng_rosc, qdss_cti, qdss_gpio,
> +                qlink0_b_en, qlink0_b_req, qlink0_l_en, qlink0_l_req, qlink0_wmss,
> +                qlink1_l_en, qlink1_l_req, qlink1_wmss, qup_se0, qup_se1_l2_mira,
> +                qup_se1_l2_mirb, qup_se1_l3_mira, qup_se1_l3_mirb, qup_se2, qup_se3,
> +                qup_se4, qup_se5, qup_se6, qup_se7, qup_se8, rgmii_rx_ctl, rgmii_rxc,
> +                rgmii_rxd, rgmii_tx_ctl, rgmii_txc, rgmii_txd, sd_card, sdc1_tb,
> +                sdc2_tb_trig, sec_mi2s, sgmii_phy_intr0_n, sgmii_phy_intr1_n,
> +                spmi_coex, spmi_vgi, tgu_ch0_trigout, tmess_prng0, tmess_prng1,
> +                tmess_prng2, tmess_prng3, tri_mi2s, uim1_clk, uim1_data, uim1_present,
> +                uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
> +                usb2phy_ac_en, vsense_trigger_mirnat]
> +
> +    required:
> +      - pins
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    tlmm: pinctrl@f100000 {
> +        compatible = "qcom,sdx75-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 133>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        gpio-wo-state {
> +            pins = "gpio1";
> +            function = "gpio";
> +        };
> +
> +        uart-w-state {
> +            rx-pins {
> +                pins = "gpio12";
> +                function = "qup_se1_l2_mira";
> +                bias-disable;
> +            };
> +
> +            tx-pins {
> +                pins = "gpio13";
> +                function = "qup_se1_l3_mira";
> +                bias-disable;
> +            };
> +        };
> +    };
> +...
> --
> 2.7.4

While at it, please also send a separate patch to add pinctrl yaml
file entries in MAINTAINERS, which currently contains:

F:    Documentation/devicetree/bindings/pinctrl/qcom,*.txt

without which $ ./scripts/get_maintainer.pl would not indicate correct
results for your yaml dt-binding addition.

Thanks,
Bhupesh
