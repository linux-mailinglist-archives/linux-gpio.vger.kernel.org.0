Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01C57CA9F0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 15:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234053AbjJPNla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 09:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbjJPNlN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 09:41:13 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241C810DD;
        Mon, 16 Oct 2023 06:41:10 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c4bf619b57so3121960a34.1;
        Mon, 16 Oct 2023 06:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697463669; x=1698068469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ/G/Xth0D6auFNQK3nHPPfnMBEhXE0kDfRXlTn6UOY=;
        b=eLwgFyt5DikRmvW7Fm6aHwG9TWBtTqL1kvC0FjL5uD0cVFzQvkySagRSQI92HT/fJc
         iSiB1JPIsOzr9+f4ea0le9X/JDjsUXHP8H5aPKReG7b3wngCsduLX7IKNZeEhGIJaiuH
         qaL0cyKnb4bN75N17SnlOgEx1gO/yUxXBnzSZdG+qa/BMpym1IOacde4zpCdqaNtjqX3
         Ztt8XixWdSXZCPKRbtZ2lLB4hlxfHn4D3TH7UiwF6v4u8O2j6jY+zgX3Pp074xu73IbP
         FNu3TtTKwkO2BKJzd5kD8wpAw5jS2et6Y0yy3XoXioOWvOjmHnrd0hhwlPN1jD/W6M6b
         f7Eg==
X-Gm-Message-State: AOJu0Ywv2OCl841qP/RiUR3nNz5IFAJZL83Xd0vcIZuuBWwBdRi396pf
        Bjck5i700LOXzmImkyf3JA==
X-Google-Smtp-Source: AGHT+IGL1M0GWp//j3qCJFUvTJjD9rn+kXQBERESjCk07ye3/whM/gGvUfOfSpVq8l85kMc+xe7a6g==
X-Received: by 2002:a9d:6398:0:b0:6bd:a82:8edb with SMTP id w24-20020a9d6398000000b006bd0a828edbmr32048175otk.10.1697463669404;
        Mon, 16 Oct 2023 06:41:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w6-20020a9d6386000000b006b96384ba1csm1689759otk.77.2023.10.16.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 06:41:08 -0700 (PDT)
Received: (nullmailer pid 2647360 invoked by uid 1000);
        Mon, 16 Oct 2023 13:41:06 -0000
Date:   Mon, 16 Oct 2023 08:41:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
Message-ID: <20231016134106.GA2643742-robh@kernel.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-7-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-7-peter.griffin@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 07:48:09PM +0100, Peter Griffin wrote:
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
> 
> Add maxItems of 50 for the interrupts property as gs101 can have
> multiple irqs.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 26614621774a..6dc648490668 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -35,6 +35,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - google,gs101-pinctrl
>        - samsung,s3c2412-pinctrl
>        - samsung,s3c2416-pinctrl
>        - samsung,s3c2440-pinctrl
> @@ -58,7 +59,8 @@ properties:
>    interrupts:
>      description:
>        Required for GPIO banks supporting external GPIO interrupts.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 50
>  
>    power-domains:
>      maxItems: 1
> @@ -134,6 +136,24 @@ allOf:
>            minItems: 1
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          description:
> +            Required for external wakeup interrupts. List all external

Is it external GPIO interrupts or wakeup interrupts?

> +            wakeup interrupts supported by this bank.
> +          minItems: 1
> +          maxItems: 50

For a given SoC, I don't see how this is variable? If it is variable, 
how do you know which entry is what?


> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.42.0.655.g421f12c284-goog
> 
