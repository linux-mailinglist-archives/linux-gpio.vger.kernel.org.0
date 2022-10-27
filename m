Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF49C6103F5
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 23:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237144AbiJ0VF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 17:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237209AbiJ0VE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 17:04:58 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF3E63FE1;
        Thu, 27 Oct 2022 14:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0+NXm5sqzis6CZg4BMwSRdNzvDwdqvwi8x5U/BxkVL4=; b=bKgqSkqq0YgUx8baYBXee6qgTV
        YKHZtJnh98FeBG2EWenN+GL6GdYm5b4Iysgg8HxHXZo9h+W+5A9qp/bi7FzU7/7XY04/cPUrFiogm
        tena2U29i7059DfdS6C6KDyEbUyiXwv10n2ndOvqWsEZ6+vl+qAsN4z9gzXr18CMKbYzdTRi2UP/q
        k7QoZRE55qnMfOGuN+1Om6D1YC9WtSIsfIAslNZa7/zLrAIgdUSkv/4RsgAeGDSWUhQSfIFUHYkhc
        PvE9PxN9gigjBgJkQx7agBn0GcctKcSvqQ9bfmi4LEV+si3DAPUGlP3EDueVNjKOxNlbUxNxMa2ih
        12+aSPUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34988)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oo9zR-0007WJ-PY; Thu, 27 Oct 2022 22:00:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oo9zQ-0001rF-6K; Thu, 27 Oct 2022 22:00:36 +0100
Date:   Thu, 27 Oct 2022 22:00:36 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hector Martin <marcan@marcan.st>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Y1rxdEjJox3HOqtp@shell.armlinux.org.uk>
References: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
 <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
 <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 27, 2022 at 03:53:25PM -0400, Krzysztof Kozlowski wrote:
> On 27/10/2022 13:03, Russell King (Oracle) wrote:
> > Add the DT binding for the Apple Mac System Management Controller GPIOs.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> > new file mode 100644
> > index 000000000000..a3883d62292d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> 
> Filename based on compatible, so "apple,smc-gpio.yaml"

Many of the other yaml files in gpio/ are named as such.

> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Mac System Management Controller GPIO
> > +
> > +maintainers:
> > +  - Hector Martin <marcan@marcan.st>
> > +
> > +description:
> > +  This describes the binding for the Apple Mac System Management Controller
> 
> Drop "This describes the binding for"
> 
> > +  GPIO block.
> > +
> > +properties:
> > +  compatible:
> > +    allOf:
> 
> That's not proper syntax. Look at other examples (e.g. Apple bindings)
> doing it. Probably you wanted items here.

Really? You're joking. I had sent an email to Rob to ask how this should
be done because my first guess spat out unhelpful error messages from
dt_bindings_check, and this is the best I could come up with based on
other "examples".

I tried "- items:" but that made no difference - dt_bindings_check spat
errors, so that's clearly incorrect. Specifically, I tried:

properties:
  compatible:
    - items:
        - enum:
	    - apple,t8103-smc
	- const: apple,smc-gpio

That doesn't work:

Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml: properties:compatible: [{'items': [{'const': 'apple,t8103-smc'}, {'const': 'apple,smc-gpio'}]}] is not of type 'object', 'boolean'  from schema $id: http://json-schema.org/draft-07/schema#

> > +      - enum:
> > +          - apple,t8103-smc
> > +      - const: apple,smc-gpio
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> 
> Missing required properties. Start from new bindings or example-schema.

What's missing? All the other bindings that I see follow this pattern.

> > +
> > +additionalProperties: false
> 
> Missing example, it's necessary to validate these.

Documentation states that examples are optional according to the
"writing-schema" documentation.

Honestly, I find this YAML stuff extremely difficult, especially given
the lack of documentation on how to write it and the cryptic error
messages from the tooling. It's impossible to get it right before
submitting it - and I suspect from what I see above, it's impossible
for reviewers to know what is correct either, since some of what you've
said above appears to be wrong!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
