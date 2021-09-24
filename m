Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C56416925
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 03:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243676AbhIXBB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 21:01:57 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:42500 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243678AbhIXBB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 21:01:57 -0400
Received: by mail-oi1-f173.google.com with SMTP id x124so12237425oix.9;
        Thu, 23 Sep 2021 18:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GasIhLti856Ga5HeR4f+cGNysCxF+XCkHYY1M/ZuBiw=;
        b=4mVsfYxG8qdry4qRKnb+PrIMsa+n4O9bja5YsRRWWi5Y0PlAxw0S3Op6hurzGa4Ebn
         nBe0Li0u4rlHuBuYKB41IN15Y9ZXNpx1rj3EDY/ObbdJDuY30PODF8jsCwI1LTDfApsE
         YVEQtnOdwjxAiA8XJhvTVEZOert/hJE0IZFfObMlG28nBpwu/z1IOSGFkNt5I6IQoXx3
         Q8sgYlKeEGWUiDQDXwWTv5WTd6YBOrGuyElNnzCJTazAC05qnoLYMHnqgpwjOtcMzGL0
         7U040FWSlIdxsk1XqRsuB3xblE/+mJM4og3naOEybWLJFOFhkjtEUtGFuZDCyJ+wIb98
         kALg==
X-Gm-Message-State: AOAM533LTPlqTtbBGYiCw+Wx+XyUYBnrDCZAZVTKbWUpbqw7uFqXish7
        HSNz40CdeOj+crd5CLWcmA==
X-Google-Smtp-Source: ABdhPJy3EwyotTQdzk+VORpqXwWszcJ9ggeJI7ThwmlybV4Y5HuNAm/UZzWsGRrWkehKfWCCmXAX7w==
X-Received: by 2002:a05:6808:ec8:: with SMTP id q8mr7842887oiv.94.1632445224741;
        Thu, 23 Sep 2021 18:00:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a23sm1676644otp.44.2021.09.23.18.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 18:00:24 -0700 (PDT)
Received: (nullmailer pid 3848448 invoked by uid 1000);
        Fri, 24 Sep 2021 01:00:23 -0000
Date:   Thu, 23 Sep 2021 20:00:23 -0500
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
Subject: Re: [PATCH v13 2/5] dt-bindings: pinctrl: mt8195: change pull
 up/down description
Message-ID: <YU0jJxr0OJoqahHr@robh.at.kernel.org>
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
 <20210922025640.11600-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922025640.11600-3-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 10:56:37AM +0800, Zhiyong Tao wrote:
> For supporting SI units in "bias-pull-down" & "bias-pull-up",
> Change pull up/down description
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 65 ++++++++++++++++++-
>  1 file changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> index 2f12ec59eee5..2f2afabbe4fc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -85,9 +85,70 @@ patternProperties:
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

Please make a schema:

oneOf:
  - enum: [ 0, 1, ...7 ]
  - description: MT8195...
    enum: [ 5000, 75000 ]

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

Same here.

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
