Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A0243BB99
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 22:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239196AbhJZUeT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 16:34:19 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:44627 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhJZUeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 16:34:19 -0400
Received: by mail-oi1-f169.google.com with SMTP id y207so314357oia.11;
        Tue, 26 Oct 2021 13:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XtmuOEZYMhsFsb3i0iIEltNzDOQ7OassI+bJ42BIaFo=;
        b=ZKs7TafCjVc3rOcVp/TB4kC3avAbOoHSxGhOaF+Jc2rfqGXz/Mfygyd7I0g5OdjET5
         84DQTr7fxbwMHw2dCswPkwfk6l5CIdd6QerKrbBg+ti/ZCXH+zp2m2fxbwXG5qKjkRhw
         hFjmu11IsVaH+o7AqQzrDUxxsD7x4+6EiVtP2LPnzK9Cfixx5zP7yEkLkKzNbuFXFrnC
         LErBoduoXMHMDQ6YHIvz92kSUQJH5SwyRHWw7ZnELorIoMmSxJd3+rhtyEFX3cZSaNWl
         Ug0q3IKAz/smM3YXhFtCnCFZhzY2UeeE9SdosP7gvGufqUW80jQAKOxBuEWhyV3iCSnB
         1BFA==
X-Gm-Message-State: AOAM530xkuRNXlIS2BsiBSGJhCUC18S9HmrpwpR8q3nA2Y9mpxQndSrX
        bIhFgYHZqmH1+bQnOdJtiA==
X-Google-Smtp-Source: ABdhPJzqXaZxoLwNOZtIHjl28fGjJ6Qm3jAbL9MG+5Tb1wfxVJOCny5ywNtDzEAj1Mt51g1y3qZPIw==
X-Received: by 2002:aca:e183:: with SMTP id y125mr794822oig.112.1635280314519;
        Tue, 26 Oct 2021 13:31:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z8sm4025350oof.47.2021.10.26.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:31:53 -0700 (PDT)
Received: (nullmailer pid 3192062 invoked by uid 1000);
        Tue, 26 Oct 2021 20:31:53 -0000
Date:   Tue, 26 Oct 2021 15:31:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: uniphier: Add child node
 definitions to describe pin mux and configuration
Message-ID: <YXhluRBQ+sGMYGkj@robh.at.kernel.org>
References: <1634136848-20091-1-git-send-email-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634136848-20091-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 13, 2021 at 11:54:08PM +0900, Kunihiko Hayashi wrote:
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
>  .../pinctrl/socionext,uniphier-pinctrl.yaml        | 46 +++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> index a804d9bc1602..4567330fe536 100644
> --- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> @@ -26,11 +26,53 @@ properties:
>        - socionext,uniphier-pxs3-pinctrl
>        - socionext,uniphier-nx1-pinctrl
>  
> -required:
> -  - compatible
> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:

After coming up with this hack, I found a better way using 
additionalProperties:

additionalProperties:
  type: object

and then all this:

> +      allOf:
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
> +      patternProperties:
> +        "^.*$":
> +          if:
> +            type: object
> +          then:

Same thing here.

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
>  
>  additionalProperties: false
>  
> +required:
> +  - compatible
> +
>  examples:
>    - |
>      // The UniPhier pinctrl should be a subnode of a "syscon" compatible node.
> -- 
> 2.7.4
> 
> 
