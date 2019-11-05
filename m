Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51493F0781
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbfKEU7g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:59:36 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45558 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfKEU7g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:59:36 -0500
Received: by mail-oi1-f194.google.com with SMTP id k2so18866504oij.12;
        Tue, 05 Nov 2019 12:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GTdZcSlaCj6B0DkM9Lw5qj2TAkpu7tNssud6DV2YzpE=;
        b=BFtYrSbJmAbz9M+hSjxg81pt0y/7FjdQnZxy5eRdMY3TWwvGTdG2X3kUmEPa464A6O
         CV5a2bMAFnoODAFvVFYs8I+JYzyKVVrTaSoXONTUJ1oBMpPxHTNSZ0toUCTjPmTX2dxn
         XT51LxXBTT/gIAd4czhCJm9uNfEh7g23R/eCoesRacasOqAbbR3uamgT0jqYjOf53RXU
         8pBC+llf3XMFWjyt6W7IuB9OKrKHVJ+yFt7Cqxxf4uAk/ZlnEf7FuqjaQqsatmV0QEiy
         whwPQJLeXObgtqoO1O7b6+UTO7clHAOilCjRGunshvQ5v+k5ypxZSctYOI5ihp4uawLe
         /UwA==
X-Gm-Message-State: APjAAAXRe6HctQ0FdS7Lvn1fJPxrtKcu8EuRF4jReHb2ABj2I/4FvvVM
        iJ/igI9CIuHKY5BWh8h7xw==
X-Google-Smtp-Source: APXvYqxfoZQYXzrqWbqrf5YESnzLMdDJ74I9O0OJcWuzBYYa9Qz/tEUJ92oPye+EYoq65rZtqp2VDA==
X-Received: by 2002:aca:b6c3:: with SMTP id g186mr860975oif.173.1572987575575;
        Tue, 05 Nov 2019 12:59:35 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l7sm6413475otf.39.2019.11.05.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 12:59:35 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:59:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
Message-ID: <20191105205934.GD629@bogus>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <37d85b2d-8fca-a998-95ae-61f0c049054d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37d85b2d-8fca-a998-95ae-61f0c049054d@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 01:14:33PM -0600, Dan Murphy wrote:
> Matti
> 
> On 11/1/19 6:32 AM, Matti Vaittinen wrote:
> > Document ROHM BD71828 PMIC LED driver device tree bindings.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > 
> > Changes from v2 - new patch
> > 
> >   .../bindings/leds/rohm,leds-bd71828.yaml      | 46 +++++++++++++++++++
> >   1 file changed, 46 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> > new file mode 100644
> > index 000000000000..d8aeac9911ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/rohm,leds-bd71828.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ROHM BD71828 Power Management Integrated Circuit LED driver
> > +
> > +maintainers:
> > +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > +  - Pavel Machek <pavel@ucw.cz>
> > +  - Dan Murphy <dmurphy@ti.com>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +  - Mark Rutland <mark.rutland@arm.com>
> I believe you are the maintainer of this driver not the maintainers

Right, should have been clearer in my other response. Put 
owner/maintainer of the device binding, not subsystem.

> > +
> > +description: |
> > +  This module is part of the ROHM BD71828 MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
> > +
> > +  The LED controller is represented as a sub-node of the PMIC node on the device
> > +  tree.
> > +
> > +  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
> > +
> > +properties:
> > +  compatible:
> > +    const: rohm,bd71828-led
> > +
> > +patternProperties:
> > +  "^led-[1-2]$":
> > +    type: object
> > +    description:
> > +      Properties for a single LED. Nodes must be named as led-1 and led-2.
> 
> Why is this required?  Can't we use the reg as the number and then we can
> use standard node labels
> 
> like led@<reg value>.  Then we can check in the code to make sure that the
> output is not out of bounds.
> 
> > +    properties:
> > +      #$ref: "common.yaml#"
> > +      function:
> > +        description:
> > +          Purpose of LED as defined in dt-bindings/leds/common.h
> > +        $ref: "/schemas/types.yaml#/definitions/string"
> > +      color:
> > +        description:
> > +          LED colour as defined in dt-bindings/leds/common.h
> 
> s/colour/color
> 
> But again I believe it is indicated above that the LEDs are either going to
> be green or amber.  Unless they can be any color.
> 
> Are there plans to make sure that the color is either green or amber in the
> code?  I don't see a patch for the code in this series
> 
> > +        $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +required:
> > +  - compatible
> 
> Is there an example of the node and properties?

For MFDs, I prefer a complete example in the MFD binding doc. We need it 
complete to validate the example.

Rob
