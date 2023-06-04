Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797ED72161D
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jun 2023 12:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjFDKca (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jun 2023 06:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjFDKc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jun 2023 06:32:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D511AF
        for <linux-gpio@vger.kernel.org>; Sun,  4 Jun 2023 03:32:27 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9741a0fd134so624186766b.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jun 2023 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685874745; x=1688466745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQUNHUJDoslvptjth9v1DI1C+JDDptVC9mC980ftiRQ=;
        b=Jxsgc/H04yUrlsLGMFulAj1Y2/UKO5PvwDgl9LNKrYbdZszlCJTvkR0GpAD2146xEF
         Uv6Wm2/7eOe0dez1+/YNuAT1uOG0DW4SwHivPThafMcWKx9Oy6eERQAJIcI+WRThZopU
         OCxMQGFQt6fswXYGzmamvDhUmrJb+ulJAU5tfxDtq6KiCViPP/Z1xbkqt7pKkw2EgP7P
         WtMCD4DP9W6VYQvT9NQ1hp4rgXdF41DpoLSMTxsJbOldbP/NTTu2IcqPWpsBz8B4AyD2
         0lsyLMjZYZpIAPZWpgFjHr9N2+doOeAEaHt9U+WEoJb5r0uSc8snamUcQuK5yKctsuhj
         nC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685874745; x=1688466745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQUNHUJDoslvptjth9v1DI1C+JDDptVC9mC980ftiRQ=;
        b=KHsz0ID3IyonHJh1ie+zrYYy/55VV4xREQlfcFHahEIQuNul9vMWs43u3Ve1BxHujZ
         iU11YM7RUtzg0jh4mWrDwUJHofUF/zQ62gJnMutlUFj23RUWNWGVT70vw+0G4F51ATLj
         e6j6J+VIb5NBEZlABFloMJbtrwjCvMGMqMw0KJpFWB/sJJ+12qi4JoEzZGZcuNSwNScX
         vtM87o4teELWXbZ+x9wHPb3zLcdUlAYycCP1tHFDOzuE70EnXJ/yatYThMf9XUioziAe
         FuyEcoFKsHQuDDodoFjMcI9uQxBUNQBeQrJEhveYhDyWIHB+j6hr72SPBAuZ22dsNfOL
         EJKg==
X-Gm-Message-State: AC+VfDzQFJdY8eraM97vNDy+yUSJ2zUdnxh3Y+LN/fBSvUs3f2jHADGn
        0uFt0R3Kd22QrxfEOn0U8keN/w==
X-Google-Smtp-Source: ACHHUZ5gOQxAW/KGGTeRoUvUnw5zuV3SROq0N6bXvu/xKhL2M2v0X3R9B7mPqRh6ssbSz1Vht2a1vw==
X-Received: by 2002:a17:907:745:b0:974:7713:293f with SMTP id xc5-20020a170907074500b009747713293fmr3686547ejb.41.1685874745565;
        Sun, 04 Jun 2023 03:32:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906594600b009745e1b6226sm2899904ejr.125.2023.06.04.03.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 03:32:25 -0700 (PDT)
Message-ID: <772cf729-e42d-14ac-f9d5-31cf071bd58d@linaro.org>
Date:   Sun, 4 Jun 2023 12:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Document Tegra234 pin
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
References: <20230602141445.3012550-1-thierry.reding@gmail.com>
 <20230602141445.3012550-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602141445.3012550-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/06/2023 16:14, Thierry Reding wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra234 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v4:
> - move "$ref" and "required" properties into more standard locations
> - use "additionalProperties: true" for common bindings
> - use unevaluatedProperties for specific bindings
> - only allow valid per-SoC pin group properties
> - drop unnecessary or duplicated properties
> 
> Changes in v3:
> - split up into multiple files (suggested by Krzysztof)
> - do not permit underscore in pinmux node names
> - reword commit message
> 
>  .../pinctrl/nvidia,tegra234-pinmux-aon.yaml   |  59 ++++++++
>  .../nvidia,tegra234-pinmux-common.yaml        |  66 +++++++++
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 139 ++++++++++++++++++
>  3 files changed, 264 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
> new file mode 100644
> index 000000000000..4ec969451eec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux-aon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 AON Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +$ref: nvidia,tegra234-pinmux-common.yaml
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra234-pinmux-aon
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:
> +      properties:
> +        nvidia,pins:
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
> +unevaluatedProperties: false

I missed in the previous review, apologies, can you add here example
DTS? Each device binding (except common parts) is expected to have example.

Best regards,
Krzysztof

