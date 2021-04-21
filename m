Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312A9367184
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 19:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244811AbhDURkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 13:40:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:35562 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244814AbhDURkg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Apr 2021 13:40:36 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZGpV-0006uJ-00; Wed, 21 Apr 2021 19:40:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D0202C08D9; Wed, 21 Apr 2021 19:39:24 +0200 (CEST)
Date:   Wed, 21 Apr 2021 19:39:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC3243x GPIO controller
Message-ID: <20210421173924.GA15599@alpha.franken.de>
References: <20210421162026.41978-1-tsbogend@alpha.franken.de>
 <20210421162026.41978-2-tsbogend@alpha.franken.de>
 <20210421171727.GA1310436@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421171727.GA1310436@robh.at.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 12:17:27PM -0500, Rob Herring wrote:
> On Wed, Apr 21, 2021 at 06:20:26PM +0200, Thomas Bogendoerfer wrote:
> > Add YAML devicetree binding for IDT 79RC3243x GPIO controller
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> >  .../bindings/gpio/gpio-idt3243x.yaml          | 73 +++++++++++++++++++
> 
> Use compatible string for filename.

ok

> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > new file mode 100644
> > index 000000000000..346a57ef8298
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-idt3243x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: IDT 79RC32434x GPIO controller
> > +
> > +maintainers:
> > +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > +
> > +properties:
> > +  compatible:
> > +    const: idt,3243x-gpio
> 
> What's the 'x'? Generally, we don't do wildcards for compatible strings.

there are 3 different SoCs 79rc32434, 79rc32435 and 79rc32438. So should
I add 3 compatible strings and use the first as filename ?

> > +  ngpios:
> > +    description:
> > +      Number of available gpios in a bank.
> 
> That's every 'ngpios'. Drop.

ok.

> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    gpio0: interrupt-controller@50000 {
> 
> gpio@...
> 
> As generally it's primarily a GPIO controller and secondarily an 
> interrupt controller.

ok.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
