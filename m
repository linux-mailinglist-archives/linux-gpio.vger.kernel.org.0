Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A58B41CE62
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 23:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbhI2Vtl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 17:49:41 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:33521 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhI2Vtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Sep 2021 17:49:40 -0400
Received: by mail-ot1-f54.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so4771855otu.0;
        Wed, 29 Sep 2021 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9tEAqZNJwDzQEWaGPnZz7mESP4HPQ040E5Y0zkN5TmQ=;
        b=EIclDxNgbICpi2GaSGgRaW4imZfKvpBkNey5HwY+/PLQMEEfelPDAdX/u1eH5Wm7WL
         qvjR9Oppw003G3h6B0blWm19cV87W7kdARuFWu90A1u+DS4CIugU6ZVUdDOsjyTjAYUf
         bpVdqqRSxB5GvTzly4NAQ3sxhGVfxskNT63Pr/fSCETKRZGysJ6PsSDNo+s+luUEdoeh
         0A2pYQus3AusIOhB3cvC169KJgm5VwPx0d2kvWRR4DB3sksJdPDSigKGOgVTZzwJHG7j
         Mpgh+q2OpUzjP9nviYh2EY+Gkba7EMHD7Ha6L0L056TNZVB/48V7cMY4MgX1h3+Tdl2M
         oP7w==
X-Gm-Message-State: AOAM532UcP9+QJ2PfBGh+d/0rL+CBw5527l+lmSE6JOtWY6TqLJyQX9m
        kphvcn32WXkiQE0z9dPJKg==
X-Google-Smtp-Source: ABdhPJxeKotXQp3Lpf7KBsmo9mOFXTJ0Tf1HvSzbQ8YtUeLGQhbRfEeVPMok4PZOWUk9Jz6nlAyUiQ==
X-Received: by 2002:a9d:192c:: with SMTP id j44mr1972042ota.302.1632952078623;
        Wed, 29 Sep 2021 14:47:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a3sm191359oie.3.2021.09.29.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 14:47:57 -0700 (PDT)
Received: (nullmailer pid 273777 invoked by uid 1000);
        Wed, 29 Sep 2021 21:47:56 -0000
Date:   Wed, 29 Sep 2021 16:47:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        light.hsieh@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, sean.wang@mediatek.com,
        seiya.wang@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924080632.28410-3-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 04:06:29PM +0800, Zhiyong Tao wrote:
> For supporting SI units in "bias-pull-down" & "bias-pull-up",
> change pull up/down description
> and add "mediatek,rsel_resistance_in_si_unit" description.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86 ++++++++++++++++++-
>  1 file changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..5f642bef72af 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -49,6 +49,12 @@ properties:
>      description: The interrupt outputs to sysirq.
>      maxItems: 1
>  
> +  mediatek,rsel_resistance_in_si_unit:

s/_/-/

> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can support
> +      RSEL define or si unit value(ohm) to set different resistance.

Aren't the RSEL and ohms disjoint values? 0-207 for RSEL and >1000 for 
ohms. Why is this property even needed.

> +
>  #PIN CONFIGURATION NODES
>  patternProperties:
>    '-pins$':
> @@ -85,9 +91,85 @@ patternProperties:
>            2/4/6/8/10/12/14/16mA in mt8195.
>          enum: [0, 1, 2, 3, 4, 5, 6, 7]
>  
> -      bias-pull-down: true
> +      bias-pull-down:
> +        description: |
> +          For pull down type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm) "75000" & "5000" in mt8195.
> +          oneOf:

Because of the indentation, this is all just part of 'description'.

> +            - enum: [100, 101, 102, 103]
> +            - description: mt8195 pull down PUPD/R0/R1 type define value.

This entry is always true.

> +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]

Are these supposed to be hex?

> +            - description: mt8195 pull down RSEL type define value.

And so is this one. That makes 'oneOf' always false.

> +            - enum: [75000, 5000]
> +            - description: mt8195 pull down RSEL type si unit value(ohm).
> +
> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-down = <75000>;
> +            };
> +          };
>  
> -      bias-pull-up: true
> +      bias-pull-up:
> +        description: |
> +          For pull up type is normal, it don't need add RSEL & R1R0 define
> +          and resistance value.
> +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +          define in mt8195.
> +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +          to set different resistance by identifying property "mediatek,rsel_resistance_in_si_unit".
> +          It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +          define in mt8195. It can also support resistance value(ohm)
> +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
> +          oneOf:
> +            - enum: [100, 101, 102, 103]
> +            - description: mt8195 pull up PUPD/R0/R1 type define value.
> +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +            - description: mt8195 pull up RSEL type define value.
> +            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +            - description: mt8195 pull up RSEL type si unit value(ohm).

Same issues here.

> +          An example of using RSEL define:
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +            };
> +          };
> +          An example of using si unit resistance value(ohm):
> +          &pio {
> +            mediatek,rsel_resistance_in_si_unit;
> +          }
> +          pincontroller {
> +            i2c0_pin {
> +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> +              bias-pull-up = <1000>;
> +            };
> +          };
>  
>        bias-disable: true
>  
> -- 
> 2.25.1
> 
> 
