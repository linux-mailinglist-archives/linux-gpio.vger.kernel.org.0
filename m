Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6026C5155B5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Apr 2022 22:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379826AbiD2UfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Apr 2022 16:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357885AbiD2UfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2022 16:35:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCDF644F3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2022 13:31:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so17518155ejd.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2022 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cOTYvKnpssw+HjajD028HmP+wTShZ9IeCONkU/DnTDM=;
        b=IS1Bwm1KfpiUP9DD8wNp7WoHCXusyqm+r96FFYBPQnjwMo4DHP7CiRZTs7jb3p5XCW
         spWHOr7uLBLxmBGed7edoEFKUzDZw4lfa+zF/UssDIXgb5glOSFPpl0eRZgdk2tpJTjw
         2dnQFVEV5XluFKgdMiXjg/WVa6dhmTbKzRETUVxk3qsNELPl4TPDZHepIIdG5lBbYYAq
         OmUAb2CPekhK3R8YB9uIBwwCN8KjMK4pXvataQGiWRx8r3y6C58oJUvIBE9rgzMBG1/t
         SfXe0quGxmGX8L9S4V6NIcVtP6hhLWksn8EjxYNmEkgQaYonwOn9HZ8uU+fi/RWarzkB
         DZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cOTYvKnpssw+HjajD028HmP+wTShZ9IeCONkU/DnTDM=;
        b=vHpsKX0rPeQYGkX5cTki4OeyhMwCrITnTZ0gT33/5wAWlvAnOccmFGVZqucV+MRhNS
         fllmSJGN6rdvaKxgI112KXtBtfQwbNopz2t8ip7uVJogQyqoJHZmXHpCkxIdBNmGkgJV
         mkOCa9OIYhyY3YMprIqtHLiHrvFSB4QkEn7f1+AalIcI/QsaPdOEzIb2l6r+SXdh+f61
         5RQKWE/bC7mZFgberkVz817cACzQj3KpFjUUQj5lZWcCvweoZd9EJOPMo0vB0ZkVRiHJ
         sG2AffUsOZIsyGNLWfdn/v1R3jeJOQDk3Sm34Ab0+C5OOYP9au/CKn/YbAoTwFmVIBnM
         ++CA==
X-Gm-Message-State: AOAM5338Vvuei61fyrR+O87ghNVvMOjDO+M7ZdbomDtF0GzNopwEmpp5
        I96taHWTOyg7aTSGghlXEYuGCw==
X-Google-Smtp-Source: ABdhPJwiJe/sfIfNDfS8+1kj10ZZagdOYEQqXZdXUtpduVnOH4GD+F84f5RxC6lUMiPC7SCi359tyw==
X-Received: by 2002:a17:907:7f26:b0:6f4:69c:196f with SMTP id qf38-20020a1709077f2600b006f4069c196fmr956890ejc.613.1651264313578;
        Fri, 29 Apr 2022 13:31:53 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i8-20020aa7c708000000b0042617ba63absm3299258edq.53.2022.04.29.13.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 13:31:53 -0700 (PDT)
Message-ID: <4adf790c-5773-a78e-3c8e-2a510e3dbd1e@linaro.org>
Date:   Fri, 29 Apr 2022 22:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8192: Add mediatek,pull-down-adv
 property
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220429200637.2204937-1-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429200637.2204937-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/04/2022 22:06, Nícolas F. R. A. Prado wrote:
> Add the mediatek,pull-down-adv property to the pinctrl-mt8192 dt-binding
> to allow configuring pull-down resistors on the pins of MT8192. It is
> the same as in mt8183-pinctrl.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> index c90a132fbc79..e462f49eae6f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -117,6 +117,17 @@ patternProperties:
>              $ref: /schemas/types.yaml#/definitions/uint32
>              enum: [0, 1, 2, 3]
>  
> +          mediatek,pull-down-adv:
> +            description: |
> +              Pull down settings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:

Trailing ':' should be escaped, so '::'


> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]

It's okay, but for all these and other values (you have few such in the
binding), you should maybe add header and defines. It's much more
readable for humans...

Is the property valid without bias-pull-down?

Best regards,
Krzysztof
