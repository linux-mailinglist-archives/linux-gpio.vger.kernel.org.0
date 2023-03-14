Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807476B9EFE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjCNSsf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjCNSse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:48:34 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601A71352E
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:48:00 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so22236134ede.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+0E+xigiB17bD19Ft1OI4VkQ2MZYZmKweeBcvoB72Rs=;
        b=YigdWQIosMHQ0uwI6NV1qo/kEazE4MRaQrrBOJxvDfyalKd01D3gpanAoihY2FXpA9
         mysNbShlD8d842l8t0mqZuTYOWtxrxcOZ5v0wT8yhW3dO37i50HRu6oXpAq3uO0foh/U
         36ZPF+q1RkxcNJ524PfPe7zG4chguGaeE0PcvY/GA6GJrRlC+WVrS2UBMxzHgeFlpwNT
         uVLELKAylADqlNeh4FjoUDoJdo5n+Jl2lWrOyJGZZxCqoYEn/ZQiOelas847OQZ32s5K
         scJXd40Mh+CYb9goOkMGagbTuyopd9eLFxqTxpzyWrgygXCeW3aN22Sr7kPsHmKAterD
         wauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0E+xigiB17bD19Ft1OI4VkQ2MZYZmKweeBcvoB72Rs=;
        b=spmuUnRLVZzMgHW3u5AgdBo8+hLOcQ3tU9eoyOZV711Q412AlFN8HbFQotl3FhgEyh
         XarwR0fmLbcc1zt6QYrjBC6E0BBOJv9ePfwRKNNCnJbi8P89x/N9F0IZr2Reo7fxMxPS
         ugji0TXwcMrVDq4l8Upa3sOgwY1K/85UhXOECqauQfzj9fnFzFZDRHxYdkSlAFJ5C5qK
         XkzdZv1W8w35B5Gbvjr+dbmPA8Rilx0P+eOXZoYIY2XG+ZZmQ+nNjfT4h85VEnIFAO1P
         vkqmUuig3rFqIJaSd/3xGQcBsBondLrnN4aWfC2mXSxV7u84Obki9WuNhOz/QbwYbVcD
         DNCA==
X-Gm-Message-State: AO0yUKXILPqcZVOH7JnUXTGgpGM1k6k6N4uRZJalb1QmO7nOgzYh9yi9
        a+/zgSUJj0ezAjCtNrmI2qXXNLRzEgscr8Hk4Cw=
X-Google-Smtp-Source: AK7set/hrg4y2EF/d46uwVHqaUa/dmc95hxkjUEOoufHZs6dTSLU74yvmxmSKXK2LYRPOei8kPbWlA==
X-Received: by 2002:aa7:dd0e:0:b0:4fa:ada1:796d with SMTP id i14-20020aa7dd0e000000b004faada1796dmr123531edv.10.1678819665954;
        Tue, 14 Mar 2023 11:47:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id m20-20020a509994000000b004aef147add6sm1445859edb.47.2023.03.14.11.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:47:45 -0700 (PDT)
Message-ID: <5c38d97d-af2a-51b5-7b4d-bac69321e5ad@linaro.org>
Date:   Tue, 14 Mar 2023 19:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Content-Language: en-US
To:     Jim Liu <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
        KWLIU@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20230314092311.8924-1-jim.t90615@gmail.com>
 <20230314092311.8924-3-jim.t90615@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314092311.8924-3-jim.t90615@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/03/2023 10:23, Jim Liu wrote:
> Add the SGPIO controller to the NPCM7xx devicetree
> 
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> ---
> Changes for v5:
>    - remove npcm8xx node
> Changes for v4:
>    - add npcm8xx gpio node
> Changes for v3:
>    - modify node name
>    - modify in/out property name
> Changes for v2:
>    - modify dts node
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index c7b5ef15b716..7f53774a01ec 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -330,6 +330,36 @@
>  				status = "disabled";
>  			};
>  
> +			gpio8: gpio@101000 {
> +				compatible = "nuvoton,npcm750-sgpio";
> +				reg = <0x101000 0x200>;
> +				clocks = <&clk NPCM7XX_CLK_APB3>;
> +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +				bus-frequency = <8000000>;

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&iox1_pins>;
> +				nuvoton,input-ngpios = <64>;
> +				nuvoton,output-ngpios = <64>;
> +				status = "disabled";
> +			};
> +
> +			gpio9: gpio@102000 {
> +				compatible = "nuvoton,npcm750-sgpio";
> +				reg = <0x102000 0x200>;
> +				clocks = <&clk NPCM7XX_CLK_APB3>;
> +				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +				bus-frequency = <8000000>;

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).



Best regards,
Krzysztof

