Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2652D707F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 08:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436666AbgLKHAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 02:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgLKG7c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 01:59:32 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30A6C0613D3;
        Thu, 10 Dec 2020 22:58:52 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id s1so1919126oon.2;
        Thu, 10 Dec 2020 22:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EzWEX84UzInmkz2TvYJ3PGWef5ao1pFDDJMFflQQZVA=;
        b=DWZ2dw4CoxFlz69UT2ewFOGkd9w2VuzDTHuoQpZZfFn4R56VnN7iKjLBLl2xsygTVw
         wqiGmpChTm/iSDe1Ul7A3BW2D5JBMDt1IOHkQTQ4A6ucGQAwwRcjrrmIHFzb2PD9zvv6
         Tfmfw0vXrv/bGDrmHfWU1lu470EWR2+y3JnIEPvEn2L0JOKYU6C6XMf2CvOqPli6uMAp
         82WCo9gMqm2KIP1rHhcEoCo9ubGAIktvNsLSk5W+5P2UT8GETz33v3kA2ofkMKdWCX0i
         aeuW80s1bXp7fFpp14rlkuxIr1q44PA1WARkcy0aD3OZbphyV9doDN2c3S4D+Dv2Ii3o
         LW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EzWEX84UzInmkz2TvYJ3PGWef5ao1pFDDJMFflQQZVA=;
        b=k37dYhyvbNp6VJundK4ZfOHSVXZc4fUPgVOc4rIQfzp9/A1mn+pEeHkQy3gyFVB5KG
         AJeZehzjpPm+0g/chi2bPLHpTgoJxP+UTLYhw7akH1FEvFkSxxuDMrKfpglB1mXsOUDo
         1/1LlSo+/B+PZL8aPM4q3CBhsLqT9mraCxUHYCq1ZzRjcixzhspv6h4EmPaYRWOfrz82
         BOD2S77ZCkbcOMBTiGbACBmLvIyfcZzH36y3JAp1tcqKgU4USyBiXl6700PKWf4RErR5
         +OEDoi/oZJ2mejUGKNBkOhmhMrnTZjDm25ThmX2uc23cCfvfwcpH2NjKjre8PiTZySbT
         94TA==
X-Gm-Message-State: AOAM532DnGHHxABpLLw7IrJWWDelSNwf4WVeDe151j0XLhDP2m9IrBpg
        5D0PRuqv8KXyMgE2Y5NEDYXdZ6a3DZQc1WBgKIs=
X-Google-Smtp-Source: ABdhPJzMUUA4+WqCkK3WdnilTntzzibkGR5Y9ww+a9f0INPrM5RodRYjv5ua4KocyTbMgiNpvzfU6IM3NnpHl9QA53c=
X-Received: by 2002:a4a:ded4:: with SMTP id w20mr8951843oou.49.1607669931921;
 Thu, 10 Dec 2020 22:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
 <20201208075523.7060-2-sergio.paracuellos@gmail.com> <20201210134722.GA2398182@robh.at.kernel.org>
In-Reply-To: <20201210134722.GA2398182@robh.at.kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 11 Dec 2020 07:58:41 +0100
Message-ID: <CAMhs-H8nMxO8Xtm5GbsTHyM2se_fCjy3Z9LiY9C=052my9oi+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: rt2880: add binding document
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Thu, Dec 10, 2020 at 2:47 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 08, 2020 at 08:55:22AM +0100, Sergio Paracuellos wrote:
> > The commit adds rt2880 compatible node in binding document.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../pinctrl/ralink,rt2880-pinmux.yaml         | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> > new file mode 100644
> > index 000000000000..7dea3e26d99e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinmux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ralink rt2880 pinmux controller
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +description:
> > +  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
> > +  is not supported. There is no pinconf support.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ralink,rt2880-pinmux
>
> What's the control interface as you have no 'reg' property.

There is not used in pinctrl. Every pin has a gpio function and
pinctrl and gpio are separate drivers. Here only pin functions and
groups are defined. The glue
code for this driver is done in arch/mips/ralink/mt7621.c using
specific pinmux.h header defined for ralink and then all that settings
are used in drivers through
the pinctrl driver.

>
> > +
> > +  pinctrl-0:
> > +    description:
> > +      A phandle to the node containing the subnodes containing default
> > +      configurations. This is for pinctrl hogs.
> > +
> > +  pinctrl-names:
> > +    description:
> > +      A pinctrl state named "default" can be defined.
> > +    const: default
>
> These 2 properties go in consumer nodes.

Ok, So I have to remove them from here. I see.

>
> > +
> > +required:
> > +  - compatible
> > +
> > +patternProperties:
> > +  '[a-z0-9_-]+':
> > +    if:
> > +      type: object
> > +      description: node for pinctrl.
> > +      $ref: "pinmux-node.yaml"
> > +    then:
>
> For new bindings, don't do this hack. Just name the nodes '-pins$'

I see. I will update bindings for pinctrl in staging and avoid this
if-then clause.

>
> > +      properties:
> > +        groups:
> > +          description: Name of the pin group to use for the functions.
> > +          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
> > +                 pcie, sdhci]
> > +        function:
> > +          description: The mux function to select
> > +          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
> > +                 mdio, nand1, nand2, sdhci]
>
>          additionalProperties: false

Ok, I will add this.

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # Pinmux controller node
> > +  - |
> > +    pinctrl {
> > +      compatible = "ralink,rt2880-pinmux";
> > +      pinctrl-names = "default";
> > +      pinctrl-0 = <&state_default>;
> > +
> > +      state_default: pinctrl0 {
> > +      };
> > +
> > +      i2c_pins: i2c0 {
> > +        i2c0 {
> > +          groups = "i2c";
> > +          function = "i2c";
> > +        };
> > +      };
> > +    };
> > --
> > 2.25.1
> >

Thanks for the review.

Best regards,
    Sergio Paracuellos
