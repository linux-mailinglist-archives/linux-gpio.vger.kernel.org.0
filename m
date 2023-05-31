Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91410717A88
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 10:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbjEaIqu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 04:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbjEaIqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 04:46:22 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA48E70
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 01:45:57 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af1e290921so57353671fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685522756; x=1688114756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/3JlIxLasZwW7mr2j+pxl+La/rNLrCab5UHw9h0z58=;
        b=gdWaO4baQuS0ZAAYUcVS/XFUsDzGboa4bsGQFUenJXuDSaHYYGji/o8IdbrSYSRg7y
         o9yybfwfnasnO6WrU6P6UD2FJ7xijopHmcxEG9pjQbGhnIdeCuEJFq4atsV6bZvLl0lA
         0O9wFtIawZJCw5l3mJvht0om6mUWXu6wZp3SmG0lK7RjzBUqq+G9VvwftMBA1yFQi53L
         DVKDacmBlfMGoioQxOwZbo7ljlF9pv7PP75flqMyKoUH1DqXW/R5js4vcJ9p/O5ScwFN
         xMbTA6u9MfTW9w3yh1+oULrD9kNGJaiVK+8MXg0GvIX20cYOwZ+t693nRApPh4I+JD3I
         LRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685522756; x=1688114756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/3JlIxLasZwW7mr2j+pxl+La/rNLrCab5UHw9h0z58=;
        b=N3/J6nuIomUjhW694Beq+Rxiw83Q+KaHxd3mhq0NVMy+vzSB/NTl8u78ZsqCRll91Q
         sh7w4unZy4KGY9YggiMmH0M8yIPmfZCKuBnTwnrzP9R7h1a4yWzMVWRDu/E6ZjERDvXg
         2YP8bUXiUZGOGWisD7PvAQhTLwdHdGJEdskOEbgAF9twugcaHojIAq+n6Zn4JLXunK3m
         03bwXPw9/stWWY/AObKlGSxC4Yg1F2vrxbrsvKYICzonu64Jp/Kb1brvJys1QhA0pgh7
         Hxwm4bUBhdPW/f0NpE9rmjSSIkm0+5BTD7o37anu1UX1zuXyAxr9lposndZN6sh6B29T
         /USw==
X-Gm-Message-State: AC+VfDwSeLOygnE50uG2B9hoX7RE2iu2hWXdMOvfPAxkaAEriLh3ZFWH
        mAiVUoTU8HxkaS+k3qWC1xPq7A==
X-Google-Smtp-Source: ACHHUZ64HhVWxcf8nLYezJ3OusU222/lHWnip5OwBFZpTzlu8aIynYjFE2d2mXsNxg3VZ9+MX3mwuA==
X-Received: by 2002:a2e:95c5:0:b0:2ad:a955:dfa3 with SMTP id y5-20020a2e95c5000000b002ada955dfa3mr2622137ljh.9.1685522755827;
        Wed, 31 May 2023 01:45:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id o23-20020a056402039700b00501c96564b5sm5401873edv.93.2023.05.31.01.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 01:45:55 -0700 (PDT)
Message-ID: <f699da97-9cfc-50ae-60e7-03e692255197@linaro.org>
Date:   Wed, 31 May 2023 10:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Document Tegra234 pin
 controllers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230530133654.1296480-1-thierry.reding@gmail.com>
 <20230530133654.1296480-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530133654.1296480-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/05/2023 15:36, Thierry Reding wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra234 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - split up into multiple files (suggested by Krzysztof)
> - do not permit underscore in pinmux node names
> - reword commit message
> 
>  .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |  61 ++++++++
>  .../nvidia,tegra234-pinmux-common.yaml        |  65 ++++++++
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 141 ++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
> new file mode 100644
> index 000000000000..9d7017a39408
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-aon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$ref: nvidia,tegra234-pinmux-common.yaml

Keep it before properties:. That's really unexpected order.


> +
> +title: NVIDIA Tegra234 AON Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-pinmux-aon
> +
> +  reg: true

Drop this one.

> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:

Why do you need this? This binding looks odd...

> +      properties:
> +        nvidia,pins:

min/maxItems? If variable, put some reasonable numbers.

> +          items:
> +            enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
> +                    can1_din_paa3, can0_stb_paa4, can0_en_paa5,
> +                    soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
> +                    can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
> +                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> +                    spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
> +                    uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
> +                    gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
> +                    sce_error_pee0, vcomp_alert_pee1,
> +                    ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
> +                    soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
> +                    hdmi_cec_pgg0,
> +                    # drive groups
> +                    drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
> +                    drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
> +                    drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
> +                    drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
> +                    drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
> +                    drive_spi2_miso_pcc1, drive_can1_dout_paa2,
> +                    drive_can1_din_paa3, drive_can0_dout_paa0,
> +                    drive_can0_din_paa1, drive_can0_stb_paa4,
> +                    drive_can0_en_paa5, drive_soc_gpio49_paa6,
> +                    drive_can0_err_paa7, drive_can1_stb_pbb0,
> +                    drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
> +                    drive_can1_err_pbb3, drive_sce_error_pee0,
> +                    drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
> +                    drive_power_on_pee4, drive_soc_gpio26_pee5,
> +                    drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
> +                    drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
> +
> +additionalProperties: false

unevaluatedProperties: false

> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
> new file mode 100644
> index 000000000000..a09d050b7d37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible: true

Drop, won't be needed with additionalProps true.

> +
> +  reg:
> +    items:
> +      - description: pinmux registers
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +    properties:
> +      phandle: true

No clue what's that but if you need it, something is broken. Remove it
and we need to fix the root cause.


> +
> +    # pin groups
> +    additionalProperties:

I still don't get what you want to express here. We usually list the
children with patternProperties for specific pattern. Your approach
could work too, but did you really check it enforces proper type/ref?
That it really works?

> +      $ref: nvidia,tegra-pinmux-common.yaml
> +      unevaluatedProperties: false
> +      properties:
> +        nvidia,function:
> +          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0, eth2,
> +                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe0, pe3,
> +                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qpsi,
> +                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uartb, uarte,
> +                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta, uartd,
> +                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wdt, tsc,
> +                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph4, spi4,
> +                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, displayb,
> +                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0, rsvd3,
> +                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
> +
> +        nvidia,pins:
> +          description: An array of strings. Each string contains the name
> +            of a pin or group. Valid values for these names are listed
> +            below.

Drop, not needed.

> +
> +        nvidia,pull: true
> +        nvidia,tristate: true
> +        nvidia,schmitt: true
> +        nvidia,enable-input: true
> +        nvidia,open-drain: true
> +        nvidia,lock: true
> +        nvidia,drive-type: true
> +        nvidia,io-hv: true

Drop all these.

> +
> +      required:
> +        - nvidia,pins
> +
> +additionalProperties: false

We keep it "true" for common schema and then the users of this binding
use unevaluatedProperties: false.


> +
> +required:
> +  - compatible
> +  - reg

Keep it before additionalProperites:.

> +...


Best regards,
Krzysztof

