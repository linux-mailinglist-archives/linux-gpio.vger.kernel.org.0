Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706275F9D8E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Oct 2022 13:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbiJJL1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbiJJL1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 07:27:40 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB20A6E8A1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 04:27:31 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id g11so1627954qts.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nSjTFaTwHPwjZGfr8E/xLaRY+zXJO4LqPIEifjrfoTQ=;
        b=Y1CkvobD1V1y3GjwD966ve4tQ+VBxUsL2HuIu4DnGRt4ZagEpIIAaz/wURxeZt3msF
         /W/ZYds95zmNeiCVwFuoTU3cX8V3Y1oVq6+4ka/qRo+o2206eXXJi6pI19Hu4XJcKwIr
         X2HK9bHpQm0LM4IK694ZCJFyGPajDIOkuioZyCpAG3iUSjCncK9EEW/73Yxwul46y4Ed
         j3sqOP/sCh/URjpYohEDz+vZrlk3LTWPHgtV7rAmLfPskoQOeh9pq7fs76YKpYwa0Snp
         LSS6xtXixaTiQ+aL5LloffHYJTjrkL5kmUjNsqCczBbRY0JAZDvExzjeSaXNPlGDg1jK
         ju7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSjTFaTwHPwjZGfr8E/xLaRY+zXJO4LqPIEifjrfoTQ=;
        b=2ZFE1NJQjgCgkUQq+IzdHx99rNgdwk5R2s/oFA9luqo2DqtolvHpbJIPaBuSsXi/Yz
         QdcEPCFk4LcipQTyWqvGWAqgikhFkRx+eng72rQRme1OV3+Ovm0Lvfsh3LvVheKhgkjl
         SbXf9IgXWcF81jwCdNbh/bKVNZsLgLXXVSzSZ9MouBL+gs4yWMriiDvW385gkT9erBzQ
         BpleLomnAU7xeYe8n4pgNzJ8hCSI8A8dLiW1FJ2aYYhbG+xiZy1E0pZspYzlkGaJT63J
         IbhcmOQbzBV1xLJ/ypdFfs0HjQ0JBfVbArRR7wj88bIQ5tn1Pk0L/dZsvinW0GPvbWNz
         1bAQ==
X-Gm-Message-State: ACrzQf2oDM3Yo76xzVic5huKt2YIVe55pAWHyXP6JncxR3Nqz/1FhSZN
        xvnoPtskP1ZRFQ4czX97goChSA==
X-Google-Smtp-Source: AMsMyM48kE4mbcoryr6M5z/FYPc1qt6vfqtHUIXrJ+kU/szZ7iL2Q7z8GlBKVvw+gzg2ObohiQtDGQ==
X-Received: by 2002:a05:622a:10c:b0:35d:4d0f:fead with SMTP id u12-20020a05622a010c00b0035d4d0ffeadmr14224343qtw.325.1665401250775;
        Mon, 10 Oct 2022 04:27:30 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id dt27-20020a05620a479b00b006ed61f18651sm1710023qkb.16.2022.10.10.04.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:27:30 -0700 (PDT)
Message-ID: <14317653-bf79-2926-1a9e-7747854df05f@linaro.org>
Date:   Mon, 10 Oct 2022 07:25:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 08/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
 <20221007125904.55371-9-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007125904.55371-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/10/2022 08:59, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index cada3530dd0a..71a9aae2cc8c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -18,6 +18,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt6765-pinctrl
>        - mediatek,mt6779-pinctrl
>        - mediatek,mt6795-pinctrl
>        - mediatek,mt6797-pinctrl
> @@ -62,6 +63,28 @@ required:
>  
>  allOf:
>    - $ref: "pinctrl.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt6765-pinctrl
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +
> +        reg-names:
> +          items:
> +            - const: iocfg0
> +            - const: iocfg1
> +            - const: iocfg2
> +            - const: iocfg3
> +            - const: iocfg4
> +            - const: iocfg5
> +            - const: iocfg6
> +            - const: iocfg7
> +            - const: eint

Blank line

>    - if:
>        properties:
>          compatible:

Best regards,
Krzysztof

