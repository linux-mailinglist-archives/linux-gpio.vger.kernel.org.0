Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0DF2C945E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 01:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388020AbgLAA42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 19:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbgLAA42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 19:56:28 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16164C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 16:55:42 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id t143so16357486oif.10
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 16:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qjmhAHYM5Uv6YgCSVcLffFE0d0XaQqUsy3Md5XjhJC0=;
        b=XaQLZzqbSPQI/On6VmIt2uWQYP0g52Jy6o+PD+ZlBzqlR1cT2UXhNp9rwajUXwkbys
         CW2CFDoen3hQxwoA1YtxLRmd7iQZrq6X7KzIuNKtIUlFXk12jON2gnV7kRq8aF2jW7k5
         OPIY+8HbokXmBNGYxACfLjDgAVbf/LC2ti4KSUd91jUNf5UAOy/6WK9L3psaOa/zSP5s
         jpAQlHYbRkLwJqq9N4UwtLeDxP9N828m+OGcd77VUTEy7Ud/VMAKINesPmh+xXhbnC1W
         33ld5KPDah9VbEwPIHabqzRixB7m8olFGPytw/0EY2iOugDxj1dnzpURNjUz0B1Z1+JC
         mycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qjmhAHYM5Uv6YgCSVcLffFE0d0XaQqUsy3Md5XjhJC0=;
        b=I6dViYg/xJxmdAkLFnsw/8B0G+2ZH/BC5w98SiTYU+dMfcXOP2+BEwTSYxtzDU1tWQ
         zQo/oEV8SIm0Kn+PinK8ES0AWdsFmtV3inH/FTTzrB4KeicGbig3y/rZl6JPp9xb+4cw
         slieTMVWAB7xrYMLG02Ue5TA2P/dCLHZZU24oADJKJ+4kkcHcb2KOxqJx0xQFJCYQmEJ
         kU3UZ8o+z/65dgS4YvctKFJoWtR4InHtAGNkmxBGrz20fq+KSp4+qnu8v2UBCqBfr7pd
         V4wXqnP9ZdsegZFCg1oKhp93XLE2kZg5Jkf6bNEh+TCg9V0kEADyWP+e1Y1LRmyti7ts
         olIw==
X-Gm-Message-State: AOAM532VSgMPvF+1ndEKMrNBn9d6Y8WnjU+s0TFhDpscOKdeINzIcWxw
        s8Z0t1UUDSyeEOpQDYU8wM35Sg==
X-Google-Smtp-Source: ABdhPJxpAJQTIQQ4yFdgr05qXvo46KusD9Pbh72fb1h6pjt9bpXkCfoWUJbzwgNZmhwbONrPt5SfAg==
X-Received: by 2002:aca:cf57:: with SMTP id f84mr212574oig.21.1606784141441;
        Mon, 30 Nov 2020 16:55:41 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l72sm53173oib.41.2020.11.30.16.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:55:40 -0800 (PST)
Date:   Mon, 30 Nov 2020 18:55:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi
 pinctrl bindings
Message-ID: <X8WUi++JFLVvbXqj@builder.lan>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
 <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 16 Nov 08:34 CST 2020, Srinivas Kandagatla wrote:

> Add device tree binding Documentation details for Qualcomm SM8250
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 000000000000..704e761146ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
> +  Low Power Island (LPI) TLMM block
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer block found in the
> +  LPASS LPI IP on most Qualcomm SoCs
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-lpass-lpi-pinctrl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: LPASS Core voting clock
> +      - description: LPASS Audio voting clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: audio
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
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9])$"
> +        minItems: 1
> +        maxItems: 14
> +
> +      function:
> +        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
> +                swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
> +                swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
> +                dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
> +                i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
> +                i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
> +                i2s2_data1 ]
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      slew-rate:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +            0: No adjustments
> +            1: Higher Slew rate (faster edges)
> +            2: Lower Slew rate (slower edges)
> +            3: Reserved (No adjustments)
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
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    lpi_tlmm: pinctrl@33c0000 {
> +        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
> +        reg = <0x33c0000 0x20000>,
> +              <0x355a000 0x1000>;

We shouldn't reference parts of blocks, so this should be 16KB at
0x35500000 and if we have multiple drivers that needs to poke in that
region we'd need to abstract that somehow (e.g. though a syscon).

Regards,
Bjorn

> +        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        clock-names = "core", "audio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpi_tlmm 0 0 14>;
> +    };
> -- 
> 2.21.0
> 
