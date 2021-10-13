Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5632A42B7ED
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 08:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237980AbhJMGvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 02:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbhJMGvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 02:51:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347A7C061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 23:49:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so7241337lfu.5
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ZFyXssI7TrFyz6t72UIWjHiVPEaGRTFviZ9B7b1svQ=;
        b=iPAivlo5uIKBxRfNUXcOVhQG7osPvDAYsKhzpbHwuoQ9aRqJOVq0CIRSJJLsHiVUUR
         esn/LxUxQJ3bT6IDck5KrRR4XQfGxDdO1QkAnr3Efw+Jbn0XB6gZpc621AyVERubhwWH
         hl+97CPoXQzYj7hxmpDhOVSF3m6+2E3dxeqPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZFyXssI7TrFyz6t72UIWjHiVPEaGRTFviZ9B7b1svQ=;
        b=nInPz6cycAQ89FARciwjnKMZg33tPv7aTM8Ip9hcJSJduJucNgYuz9Ds+cR/jNEQ1I
         xyWdIZBd0KjDOsebY2jbAf2RngeiT+Xk7mXCVTHq0c58V7pvSGS7vQqsUAUIRu4R5Lya
         H+W+JQRFpFbyiCle0pZnrtCeYgBhtpJtYgNiHnoprdoFtE7P7zx/hxsHl4raEDlwwjHA
         vBibH2NwIWgh4yCHwV0r8Y7FRgxA5UpeZ5kw4SsZ3E8wP6zrkpijy7ocJ6fTlol2W4dG
         UlZhQ3V5GnnyaxwIWNLl6vjIUfjv5IUTuoHhNsw4PtZSAlL+h4zjHoL5XLPBywQyUyvE
         lwKw==
X-Gm-Message-State: AOAM532qQhucvVHld/yo9asoQN79+bfwK9C7Iu4OpF2Z0lrA+2AdDhkw
        9e+K/zq0SUCoi0pzNDsIg8EKTuDz78EsggtarN0oaA==
X-Google-Smtp-Source: ABdhPJwFRC8f4YHp1POH1B8FM/bW1GCM0+rzp1dcWUlLDn5NbCrjKKqZDtFyz2PzgznWSPlne39IuFhFg8Pa7ILhz9w=
X-Received: by 2002:ac2:5627:: with SMTP id b7mr9696386lff.670.1634107780512;
 Tue, 12 Oct 2021 23:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210924080632.28410-1-zhiyong.tao@mediatek.com>
 <20210924080632.28410-3-zhiyong.tao@mediatek.com> <YVTfDJNW5Pe3iAR/@robh.at.kernel.org>
 <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
In-Reply-To: <37eac06e20d82c0fe37a5d8e5633cbbc48d4af29.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 13 Oct 2021 14:49:29 +0800
Message-ID: <CAGXv+5GoXu-Jg6Lhbfjd2an7nzzn2EHqQ7DN6FCB6EBRocavgQ@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] dt-bindings: pinctrl: mt8195: change pull up/down description
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 9:59 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Wed, 2021-09-29 at 16:47 -0500, Rob Herring wrote:
> > On Fri, Sep 24, 2021 at 04:06:29PM +0800, Zhiyong Tao wrote:
> > > For supporting SI units in "bias-pull-down" & "bias-pull-up",
> > > change pull up/down description
> > > and add "mediatek,rsel_resistance_in_si_unit" description.
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 86
> > > ++++++++++++++++++-
> > >  1 file changed, 84 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > > mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> > > mt8195.yaml
> > > index 2f12ec59eee5..5f642bef72af 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > @@ -49,6 +49,12 @@ properties:
> > >      description: The interrupt outputs to sysirq.
> > >      maxItems: 1
> > >
> > > +  mediatek,rsel_resistance_in_si_unit:
> >
> > s/_/-/
>
> Hi Rob,
>
> what do you mean?

He means: replace the hyphens ("-") with underscores ("_").
(s/X/Y/ is a regular expression.)

> >
> > > +    type: boolean
> > > +    description: |
> > > +      Identifying i2c pins pull up/down type which is RSEL. It can
> > > support
> > > +      RSEL define or si unit value(ohm) to set different
> > > resistance.
> >
> > Aren't the RSEL and ohms disjoint values? 0-207 for RSEL and >1000
> > for
> > ohms. Why is this property even needed.
> >
> No, they aren't.
> As we talked in v11. "mediatek,rsel_resistance_in_si_unit" is only a
> flag.
>
>
>
> Hi ChenYu,
>
> In the next version, we provide a solution which we discussed internal
> to avoid value clashes.
>
> The solution:
> 1. We will keep the define "MTK_PULL_SET_RSEL_000 200". It won't
> change.
>
> 2. We will add a property in pio dtsi node, for example,
> the property name is "rsel_resistance_in_si_unit".
> We will add a flag "rsel_si_unit" in pinctrl device.
> in probe function, we will identify the property name
> "rsel_resistance_in_si_unit" to set the flag "rsel_si_unit" value.
> So it can void value clashes.
>
> 3.We will provide the define "MTK_PULL_SET_RSEL_000 200" and si unit
> two solution. users can support which solution by add property
> "rsel_resistance_in_si_unit" in dts node or not.

Right. I thought that is what is implemented in this version already?

Also I just realized that this binding is limited in scope to just the
MT8195, for which we already know that the RSEL values do not overlap
with MTK_PULL_SET_RSEL_*. I assume that is why Rob thinks the flag
is unnecessary.

> > > +
> > >  #PIN CONFIGURATION NODES
> > >  patternProperties:
> > >    '-pins$':
> > > @@ -85,9 +91,85 @@ patternProperties:
> > >            2/4/6/8/10/12/14/16mA in mt8195.
> > >          enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > >
> > > -      bias-pull-down: true
> > > +      bias-pull-down:
> > > +        description: |
> > > +          For pull down type is normal, it don't need add RSEL &
> > > R1R0 define
> > > +          and resistance value.
> > > +          For pull down type is PUPD/R0/R1 type, it can add R1R0
> > > define to
> > > +          set different resistance. It can support
> > > "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > > "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull down type is RSEL, it can add RSEL define &
> > > resistance value(ohm)
> > > +          to set different resistance by identifying property
> > > "mediatek,rsel_resistance_in_si_unit".
> > > +          It can support "MTK_PULL_SET_RSEL_000" &
> > > "MTK_PULL_SET_RSEL_001"
> > > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > "MTK_PULL_SET_RSEL_100"
> > > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > "MTK_PULL_SET_RSEL_111"
> > > +          define in mt8195. It can also support resistance
> > > value(ohm) "75000" & "5000" in mt8195.
> > > +          oneOf:
> >
> > Because of the indentation, this is all just part of 'description'.
>
> Can you help to give some suggestion to fix it?

Unindent it by two spaces, so that it is at the same level with
"description:".

> > > +            - enum: [100, 101, 102, 103]
> > > +            - description: mt8195 pull down PUPD/R0/R1 type define
> > > value.
> >
> > This entry is always true.
>
> why is it always true? we only get define value.
> "100~104" are means that "#define MTK_PUPD_SET_R1R0_10 102" in
> include/dt-bindings/pinctrl/mt65xx.h.

"description" is not a conditional match, so it always evaluates to true.
Based on my limited DT schema and YAML knowledge, I think the underlying
issue is that you have the structure incorrectly defined.

"-" denotes a list item. So in your example, you have "enum" and "description"
as separate associative arrays, each as a list item part of the "oneOf" list.

What you want is actually:

    oneOf:
      - enum: [100, 101, 102, 103]
        description: mt8195 pull down PUPD/R0/R1 type define value.
      - enum: [200, 201, 202, 203, 204, 205, 206, 207]
        description: mt8195 pull down RSEL type define value.

So that "enum" and "description" are part of the same associative array.
Note the lack of a "-" and the extra indentation in front of "description".


Regards
ChenYu


> >
> > > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> >
> > Are these supposed to be hex?
> yes, it is patch 1/5 define "#define MTK_PULL_SET_RSEL_000  200".
> >
> > > +            - description: mt8195 pull down RSEL type define
> > > value.
> >
> > And so is this one. That makes 'oneOf' always false.
>
> why is it always false? we only get the si unit value.
>
> >
> > > +            - enum: [75000, 5000]
> > > +            - description: mt8195 pull down RSEL type si unit
> > > value(ohm).
> > > +
> > > +          An example of using RSEL define:
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> > > +            };
> > > +          };
> > > +          An example of using si unit resistance value(ohm):
> > > +          &pio {
> > > +            mediatek,rsel_resistance_in_si_unit;
> > > +          }
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-down = <75000>;
> > > +            };
> > > +          };
> > >
> > > -      bias-pull-up: true
> > > +      bias-pull-up:
> > > +        description: |
> > > +          For pull up type is normal, it don't need add RSEL &
> > > R1R0 define
> > > +          and resistance value.
> > > +          For pull up type is PUPD/R0/R1 type, it can add R1R0
> > > define to
> > > +          set different resistance. It can support
> > > "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> > > "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull up type is RSEL, it can add RSEL define &
> > > resistance value(ohm)
> > > +          to set different resistance by identifying property
> > > "mediatek,rsel_resistance_in_si_unit".
> > > +          It can support "MTK_PULL_SET_RSEL_000" &
> > > "MTK_PULL_SET_RSEL_001"
> > > +          & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > "MTK_PULL_SET_RSEL_100"
> > > +          & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > "MTK_PULL_SET_RSEL_111"
> > > +          define in mt8195. It can also support resistance
> > > value(ohm)
> > > +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> > > "10000" & "75000" in mt8195.
> > > +          oneOf:
> > > +            - enum: [100, 101, 102, 103]
> > > +            - description: mt8195 pull up PUPD/R0/R1 type define
> > > value.
> > > +            - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> > > +            - description: mt8195 pull up RSEL type define value.
> > > +            - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000,
> > > 75000]
> > > +            - description: mt8195 pull up RSEL type si unit
> > > value(ohm).
> >
> > Same issues here.
> >
> > > +          An example of using RSEL define:
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> > > +            };
> > > +          };
> > > +          An example of using si unit resistance value(ohm):
> > > +          &pio {
> > > +            mediatek,rsel_resistance_in_si_unit;
> > > +          }
> > > +          pincontroller {
> > > +            i2c0_pin {
> > > +              pinmux = <PINMUX_GPIO8__FUNC_SDA0>;
> > > +              bias-pull-up = <1000>;
> > > +            };
> > > +          };
> > >
> > >        bias-disable: true
> > >
> > > --
> > > 2.25.1
> > >
> > >
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
