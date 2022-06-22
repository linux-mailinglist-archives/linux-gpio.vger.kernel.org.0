Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198C6554ED4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 17:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359146AbiFVPOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 11:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359152AbiFVPNJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 11:13:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D9038BC3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 08:13:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e2so13421533edv.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Dd9o2JrmgxuX9CbeMpsJCVutDNWP2KQDZreRpDw1RAo=;
        b=FjYAv8ZhVHzMNIOB5DLrHWhMDOoSii6hdAQpHJrCHbHno4nufxXe4yNmaxmt/bsI1m
         OSRdXLUsBWItZ+eT+B/iZ5BXMdKBMAd1VSnU/vWVn4Jm/NoPxQuoy9P47Q0PASAjxLiK
         zTUOfOb5tKteyL6Jf3vgQL5R4WGs84yPMSSJgbi/4DItldcaB3xYFfwlyMFkXR1zGBvk
         K0HOOZODtUTEYzowO6w7u/8HhJoAzr2FU43ojVEJOcEFI7oF+iftTkT1+W6lCoTe/4CZ
         ADtUrzgwAGWfkwlgjBWoN45mrag+3qgM9GXSDJoUFK+ePMSJJ3SceHTGy3ID0Xb3Etp9
         ErFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Dd9o2JrmgxuX9CbeMpsJCVutDNWP2KQDZreRpDw1RAo=;
        b=EFxAhuSBMgq9bWeipX5ekHQ8UXjSx+tmQxKgD3W7lK8oGf8FSWTaBZTu5ikYKuQZuy
         0xtyryu8A8PGp6qvrN0QT9KcfbFxU3zr9xht/DXU1OhQIF8zKhpPidXbd1P5CQCCHSzW
         FJcqxRyQ1apARZYVCuyl8pRT+aX7ghc4pIeHLJYY3/pfqBxnT1EADADyzIirlZ6K0n90
         gYJi6yzUcW4QYQ408tYdXqgvZnUU+bDaRgMSjtI0ZJe8sVZw1BUQmyNqvJIBehennVCl
         iYMcoLhAprzw5rXUtgRmYc7xvstR1pqi+BRFIP2PzyLQC9d8btTrZ5EgtTLGXDVE0rYu
         HRmw==
X-Gm-Message-State: AJIora9a7XT9Ccwiy+TuWWiL+pj32etF/iY0uhqTMBYhoOGbxrFTooMi
        4Jdm6VA2OExdmFFi/GWlRfFxbQ==
X-Google-Smtp-Source: AGRyM1toMruHcn/GPFWYSw4dsfrauoOf2Q4fnnKbo/geN2QJFcJBjyRmHxtlFDczm6DzN0aV53vLHg==
X-Received: by 2002:a05:6402:195:b0:431:5499:35eb with SMTP id r21-20020a056402019500b00431549935ebmr4713416edv.346.1655910783959;
        Wed, 22 Jun 2022 08:13:03 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906315300b00704cf66d415sm9632020eje.13.2022.06.22.08.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 08:13:03 -0700 (PDT)
Message-ID: <11697f16-67b1-d32a-eea4-18f56631c72f@linaro.org>
Date:   Wed, 22 Jun 2022 17:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V2 4/8] dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl
 bindings
Content-Language: en-US
To:     Sricharan R <quic_srichara@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
 <20220621161126.15883-5-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621161126.15883-5-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/06/2022 18:11, Sricharan R wrote:
> From: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> Add device tree binding Documentation details for ipq5018
> pinctrl driver.
> 
> Co-developed-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Co-developed-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

SoB should go after Co-developed.

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L473

> ---
>  .../pinctrl/qcom,ipq5018-pinctrl.yaml         | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
> new file mode 100644
> index 000000000000..9b16c08bd127
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5018-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. IPQ5018 TLMM block
> +
> +maintainers:
> +  - Varadarajan Narayanan <quic_varada@quicinc.com>
> +  - Sricharan R <quic_srichara@quicinc.com>
> +  - Nitheesh Sekar <quic_nsekar@quicinc.com>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  IPQ5018 platform.
> +
> +properties:
> +  compatible:
> +    const: qcom,ipq5018-pinctrl
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
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pinmux$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"

No need for quotes

> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([1-9]|[1-7][0-9]|80)$"

Use consistent quotes in the patch: either ' or ". Don't mix.

> +        minItems: 1
> +        maxItems: 4
> +
> +      function:
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +        enum: [ atest_char, atest_char0, atest_char1, atest_char2, atest_char3,
> +          audio_pdm0, audio_pdm1, audio_rxbclk, audio_rxd, audio_rxfsync,
> +          audio_rxmclk, audio_txbclk, audio_txd, audio_txfsync, audio_txmclk,
> +          blsp0_i2c, blsp0_spi, blsp0_uart0, blsp0_uart1, blsp1_i2c0,
> +          blsp1_i2c1, blsp1_spi0, blsp1_spi1, blsp1_uart0, blsp1_uart1,
> +          blsp1_uart2, blsp2_i2c0, blsp2_i2c1, blsp2_spi, blsp2_spi0,
> +          blsp2_spi1, btss0, btss1, btss10, btss11, btss12, btss13, btss2,
> +          btss3, btss4, btss5, btss6, btss7, btss8, btss9, burn0, burn1,
> +          cri_trng, cri_trng0, cri_trng1, cxc_clk, cxc_data, dbg_out, eud_gpio,
> +          gcc_plltest, gcc_tlmm, gpio, mac0, mac1, mdc, mdio, pcie0_clk,
> +          pcie0_wake, pcie1_clk, pcie1_wake, pll_test, prng_rosc, pwm0, pwm1,
> +          pwm2, pwm3, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
> +          qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
> +          qdss_cti_trig_out_a1, qdss_cti_trig_out_b0, qdss_cti_trig_out_b1,
> +          qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
> +          qdss_tracedata_a, qdss_tracedata_b, qspi_clk, qspi_cs, qspi0, qspi1,
> +          qspi2, qspi3, reset_out, sdc1_clk, sdc1_cmd, sdc10, sdc11, sdc12,
> +          sdc13, wci0, wci1, wci2, wci3, wci4, wci5, wci6, wci7, wsa_swrm,
> +          wsi_clk3, wsi_data3, wsis_reset, xfem0, xfem1, xfem2, xfem3, xfem4,
> +          xfem5, xfem6, xfem7 ]
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges

Missing allOf with reference to pinctrl schema.

> +
> +additionalProperties: false
> +


Best regards,
Krzysztof
