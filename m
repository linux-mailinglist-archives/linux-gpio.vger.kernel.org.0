Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A9B443791
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKBVA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 17:00:28 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:42795 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhKBVA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 17:00:28 -0400
Received: by mail-ot1-f49.google.com with SMTP id v19-20020a9d69d3000000b00555a7318f31so605842oto.9;
        Tue, 02 Nov 2021 13:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=66ck82izyu4qoaKeTAXAblgBu0F6EcIPcvB7IIzWoYw=;
        b=X6d/oFq5G94E87VgE25KSFEuyqSUNXXCnvVsKGcLFR8/TOTKQD8RiplC6evGIopOOD
         c/e9fjWIG0HhZhIl6V1WO9GK0dVQGsLq7dAQnKlr1WtD8JmM188BKZlpcdCTZTSIsrle
         pDBKhxp9nI0+bQSdXID7T9SnBmkD0QSMUVvAxTdoff47UXL3TQ8vT2UF2IvIuGevruLy
         0aG7pYs2vXtl32Upi6BkLNlVFoJPWY4kKBtbS6KtMUsA/ValfIhYKF2pqxknZQ98v8f0
         zDLYWbowAWNLob6TNd3FJcmAaebYK2fD5VxO+SkBvfoSsoDwYnLTJfZSH1xV1WDo/hmP
         xiGQ==
X-Gm-Message-State: AOAM533NKpc5I+/dp9oXdbDtMPyz/twpkyNPrU0onPDwGnhaAqdJxH5N
        1SpaMi9z/MgO81i76UwV8Q==
X-Google-Smtp-Source: ABdhPJx8mAcZMxugS0NdsFzh+dnyXo5rNadhHimq6L2KWur3IT+B/oKSvO/RZy+PAImlwBBIRLciGg==
X-Received: by 2002:a9d:2ac1:: with SMTP id e59mr28481258otb.80.1635886672840;
        Tue, 02 Nov 2021 13:57:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j19sm20502oot.25.2021.11.02.13.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 13:57:52 -0700 (PDT)
Received: (nullmailer pid 3463519 invoked by uid 1000);
        Tue, 02 Nov 2021 20:57:51 -0000
Date:   Tue, 2 Nov 2021 15:57:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: uniphier: Add child node
 definitions to describe pin mux and configuration
Message-ID: <YYGmT9zLiqpb1fH8@robh.at.kernel.org>
References: <1635385599-17778-1-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635385599-17778-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 28, 2021 at 10:46:39AM +0900, Kunihiko Hayashi wrote:
> In arch/arm/boot/dts/uniphier-pinctrl.dtsi, there are child nodes of
> pinctrl that defines pinmux and pincfg, however, there are no rules about
> that in dt-bindings.
> 
> 'make dtbs_check' results an error with the following message:
> 
>    pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', ...
>    ... 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> To avoid this issue, add the rules of pinmux and pincfg in each child node
> and grandchild node.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
> Changes since v1:
> - Replace additionalProperties with unevaluatedProperties
> - Add additionalProperties for child and grandchild nodes
> 
>  .../pinctrl/socionext,uniphier-pinctrl.yaml        | 50 +++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> index a804d9bc1602..7e504e003181 100644
> --- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> @@ -26,10 +26,58 @@ properties:
>        - socionext,uniphier-pxs3-pinctrl
>        - socionext,uniphier-nx1-pinctrl
>  
> +additionalProperties:
> +  type: object
> +
> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:
> +      allOf:

All of the above should be:

additionalProperties:
  type: object
  allOf:
  ...

> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      properties:
> +        phandle: true
> +        function: true
> +        groups: true
> +        pins: true
> +        bias-pull-up: true
> +        bias-pull-down: true
> +        bias-pull-pin-default: true
> +        drive-strength: true
> +
> +      additionalProperties:
> +        type: object
> +
> +      patternProperties:
> +        "^.*$":
> +          if:
> +            type: object
> +          then:
> +            allOf:
> +              - $ref: pincfg-node.yaml#
> +              - $ref: pinmux-node.yaml#
> +
> +            properties:
> +              phandle: true
> +              function: true
> +              groups: true
> +              pins: true
> +              bias-pull-up: true
> +              bias-pull-down: true
> +              bias-pull-pin-default: true
> +              drive-strength: true
> +
> +            unevaluatedProperties: false
> +
> +      unevaluatedProperties: false
> +
>  required:
>    - compatible
>  
> -additionalProperties: false
> +unevaluatedProperties: false

Drop +unevaluatedProperties.

>  
>  examples:
>    - |
> -- 
> 2.7.4
> 
> 
