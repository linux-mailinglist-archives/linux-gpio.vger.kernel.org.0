Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB8664CAD6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 14:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbiLNNNf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 08:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238267AbiLNNNP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 08:13:15 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30625205CB
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 05:13:14 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id y4so6559366ljc.9
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 05:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+g8bhbYuaQlXpPh9UOtgjVnfBA2QaGFWh99Dxpg4ZE=;
        b=pH4lW0UzND66hSwgAr90gmNeJlHhMMjKxH++4eW3mWYQyc+QzxOJXFiGhRsFLzgJq3
         k3+WVeQmb6prwQwLr5tbLcNSDjevfkbBMeexkjwydyfk5wzC2d01uaqZ9KTKR4ZbmmSj
         P4BbNAO9HG/VNcHskBIak4fVt3eAS+98lwqxCaBfK7/840N6KSl+juF26s9XyI+9zx72
         v0SctXCPovZc5s4h19qrHjlfhaBFG7899spkzEHoVKHOe5BCc8b80P8G48Su4s+kR1L/
         flqXg0HjT5iXo4wesLl9SlcpG8/MXK43CZfSuMIKHUY2pU04i7qiRlmDFXAraT+VJGTV
         D/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+g8bhbYuaQlXpPh9UOtgjVnfBA2QaGFWh99Dxpg4ZE=;
        b=gk4BPa01/kcuwwnElG0OCdjYMb08+jc4WRiNYVymjaNJU68EYCuAPWPe7TC1Y8XroU
         9kjP+EZAUEEg8oqVzhrEn2Wmpdpfmdw1AaZvjxX5ECJJJCyPqqPz8Cq/kTqLniouWIZK
         hRROgz8nWnBr0SKpNLNwr6za7VmHZ29a0sSDwgDmQUcb66t/rMDchnoXO62W99HwYecM
         lDe2Nl9Mzc8di5unw5t5LCezwCv+rHv8htuBk2+75oqfsRzftpnDmKs1dvpoAHPlffac
         W0OPmyJQ1iwDN1UhWrFCSfSf+Waj1pI4S/CBJQFV5wiGHUBfZO3nSS0NsXOnSxauRl/k
         jzLw==
X-Gm-Message-State: ANoB5pky1BP+UgUUf3g2gTHdtr95jjWoT9tRl2IOeisBiP1bIZKIXrXT
        FabpnkA0LSDUlzzdUCbpWKDwBA==
X-Google-Smtp-Source: AA0mqf5PHGVRyKqw0AGxvuMvc+S3bUW9QX8UFoENXdCLSqKdTBPI3OD0tyhSW0GEGTa31bX/AAwYJQ==
X-Received: by 2002:a05:651c:883:b0:26f:db34:a157 with SMTP id d3-20020a05651c088300b0026fdb34a157mr5864463ljq.26.1671023592549;
        Wed, 14 Dec 2022 05:13:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd9-20020a05651c168900b00279e93c9c25sm596663ljb.29.2022.12.14.05.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 05:13:11 -0800 (PST)
Message-ID: <9d7bda38-69c9-95c8-e867-8bd5733debe2@linaro.org>
Date:   Wed, 14 Dec 2022 14:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: mt7621: add proper function
 muxing binding
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
 <20221213130430.172876-4-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213130430.172876-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/12/2022 14:04, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/ralink,mt7621-pinctrl.yaml        | 204 +++++++++++++++++-
>  1 file changed, 197 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> index 61e5c847e8c8..0efb03f1d88e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
> @@ -29,21 +29,212 @@ patternProperties:
>          $ref: pinmux-node.yaml#
>  
>          properties:
> -          groups:
> -            description: The pin group to select.
> -            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi, uart1,
> -                   uart2, uart3, wdt]
> -
>            function:
> -            description: The mux function to select.
> +            description:
> +              A string containing the name of the function to mux to the group.
>              enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk,
>                     pcie rst, pcm, rgmii1, rgmii2, sdhci, spdif2, spdif3, spi,
>                     uart1, uart2, uart3, wdt refclk, wdt rst]
>  
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a group.

Here and in all patches - please add maxItems:1. The definition of field
should have some constraints (and your if:then: might miss a case).

Best regards,
Krzysztof

