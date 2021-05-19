Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D7A3893F4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 18:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355265AbhESQlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 12:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347329AbhESQlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 12:41:12 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBACC061760
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 09:39:51 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:c82d:5b70:209e:672d] (unknown [IPv6:2a02:a03f:eafb:ee01:c82d:5b70:209e:672d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 79EB9200B37;
        Wed, 19 May 2021 18:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621442389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xdkHu+ohiZ0kc7GcvLVwlzXNI81lDspuucHz/tbwJ2Q=;
        b=qUyTPcC/9KSPdw/8RB5J2hzib63PNFZyxILnWKUTneXZJmjXR57YpYnG1/kiSK1JxwLtIO
        2k1gkNCxr16dfQ9OKn2F339JeHwlrcaDr88Yt3NvoU2fqG579scec/sSZawwRwYlLchgc3
        zq8dHRbdi6+Nqj7UXWsikQxo4rpwmNUfvpd58ng1B3iJz8mZWr8ripBHUuFZTyaUmKdf0n
        mWt87fYP3kZCPq+/q0ethM/DKJTl0KcX38IsLfGnxH6eorPMfkL+/1g/f+q8rRUat+ZcdN
        hQ+hxEMbWOsLgyjwoQchfz1yoQESZeJzcFu7WYwGM11hdJqeTqi3e9000p3mGg==
Message-ID: <0aef1d59f5676b5357a45463a5968f5e9b566aa7.camel@svanheule.net>
Subject: Re: [PATCH 1/5] dt-bindings: leds: Binding for RTL8231 scan matrix
From:   Sander Vanheule <sander@svanheule.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 19 May 2021 18:39:46 +0200
In-Reply-To: <20210517223113.GA3302542@robh.at.kernel.org>
References: <cover.1620735871.git.sander@svanheule.net>
         <cb1910ab6ba0795666df1034b47221f8bac160f9.1620735871.git.sander@svanheule.net>
         <20210517223113.GA3302542@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-05-17 at 17:31 -0500, Rob Herring wrote:
> On Tue, May 11, 2021 at 02:25:19PM +0200, Sander Vanheule wrote:
> > Add a binding description for the Realtek RTL8231's LED support, which
> > consists of up to 88 LEDs arranged in a number of scanning matrices.
> > 
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> > ---
> >  .../bindings/leds/realtek,rtl8231-leds.yaml   | 159 ++++++++++++++++++
> >  1 file changed, 159 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-
> > leds.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-
> > leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> > new file mode 100644
> > index 000000000000..aba2b55fb9c9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> > @@ -0,0 +1,159 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/realtek,rtl8231-leds.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Realtek RTL8231 LED scan matrix.
> > +
> > +maintainers:
> > +  - Sander Vanheule <sander@svanheule.net>
> > +
> > +description: |
> > +  The RTL8231 has support for driving a number of LED matrices, by scanning
> > +  over the LEDs pins, alternatingly lighting different columns and/or rows.
> > +
> > +  In single color scan mode, 88 LEDs are supported. These are grouped into
> > +  three output matrices:
> > +    - Group A of 6×6 single color LEDs. Rows and columns are driven by GPIO
> > +      pins 0-11.
> > +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> > +                |        |        |        |        |        |
> > +       P0/P6  --<--------<--------<--------<--------<--------< (3)
> > +                |        |        |        |        |        |
> > +       P1/P7  --<--------<--------<--------<--------<--------< (4)
> > +                |        |        |        |        |        |
> > +       P2/P8  --<--------<--------<--------<--------<--------< (5)
> > +                |        |        |        |        |        |
> > +       P3/P9  --<--------<--------<--------<--------<--------< (6)
> > +                |        |        |        |        |        |
> > +       P4/P10 --<--------<--------<--------<--------<--------< (7)
> > +                |        |        |        |        |        |
> > +       P5/P11 --<--------<--------<--------<--------<--------< (8)
> > +               (0)      (1)      (2)      (9)     (10)     (11)
> > +    - Group B of 6×6 single color LEDs. Rows and columns are driven by GPIO
> > +      pins 12-23.
> > +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> > +                |        |        |        |        |        |
> > +      P12/P18 --<--------<--------<--------<--------<--------< (15)
> > +                |        |        |        |        |        |
> > +      P13/P19 --<--------<--------<--------<--------<--------< (16)
> > +                |        |        |        |        |        |
> > +      P14/P20 --<--------<--------<--------<--------<--------< (17)
> > +                |        |        |        |        |        |
> > +      P15/P21 --<--------<--------<--------<--------<--------< (18)
> > +                |        |        |        |        |        |
> > +      P16/P22 --<--------<--------<--------<--------<--------< (19)
> > +                |        |        |        |        |        |
> > +      P17/P23 --<--------<--------<--------<--------<--------< (20)
> > +              (12)     (13)     (14)    (21)      (22)     (23)
> > +    - Group C of 8 pairs of anti-parallel (or bi-color) LEDs. LED selection
> > is
> > +      provided by GPIO pins 24-27 and 29-32, polarity selection by GPIO 28.
> > +               P24     P25  ...  P30     P31
> > +                |       |         |       |
> > +      LED POL --X-------X---/\/---X-------X (28)
> > +              (24)    (25)  ... (31)    (32)
> > +
> > +  In bi-color scan mode, 72 LEDs are supported. These are grouped into four
> > +  output matrices:
> > +    - Group A of 12 pairs of anti-parallel LEDs. LED selection is provided
> > +      by GPIO pins 0-11, polarity selection by GPIO 12.
> > +    - Group B of 6 pairs of anti-parallel LEDs. LED selection is provided
> > +      by GPIO pins 23-28, polarity selection by GPIO 21.
> > +    - Group C of 6 pairs of anti-parallel LEDs. LED selection is provided
> > +      by GPIO pins 29-34, polarity selection by GPIO 22.
> > +    - Group of 4×6 single color LEDs. Rows are driven by GPIO pins 15-20,
> > +      columns by GPIO pins 13-14 and 21-22 (shared with groups B and C).
> > +          P[n]     P[n+6]   P[n+12]  P[n+18]
> > +            |        |        |        |
> > +       +0 --<--------<--------<--------< (15)
> > +            |        |        |        |
> > +       +1 --<--------<--------<--------< (16)
> > +            |        |        |        |
> > +       +2 --<--------<--------<--------< (17)
> > +            |        |        |        |
> > +       +3 --<--------<--------<--------< (18)
> > +            |        |        |        |
> > +       +4 --<--------<--------<--------< (19)
> > +            |        |        |        |
> > +       +6 --<--------<--------<--------< (20)
> > +          (13)     (14)     (21)     (22)
> > +
> > +  This node must always be a child of a 'realtek,rtl8231' node.
> > +
> > +properties:
> > +  $nodename:
> > +    const: leds
> 
> led-controller

Will update.

> > +
> > +  compatible:
> > +    const: realtek,rtl8231-leds
> 
> How is this device controlled?
> 

This device represents a part of the functionality of the RTL8231 GPIO/LED
expander, which sits on an MDIO bus or Realtek SMI bus. I'll add this bit to the
main description.

Does this answer your question, or were you looking for other details?

> > 
> > +patternProperties:
> > +  "^led@[0-9]+,[0-2]$":
> > +    description: |
> > +      LEDs are addressed by their port index and led index. Ports 0-23
> > always
> > +      support three LEDs. Additionally, but only when used in single color
> > scan
> > +      mode, ports 24-31 support two LEDs.
> 
> Normally unit-addresses are hex values.
> > 
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> 
> This should have more constraints:
> 
> reg:
>   items: 
>     - items:
>         - description: port index
>           maximum: 31
>         - description: led index
>           maximum: 2
> 

Thanks for the suggestion, I was wondering what the best approach was here. I
will change the pattern to "^led@" as well, so the address restrictions are only
defined by the reg property.
> 

Best,
Sander

