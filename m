Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE3437950C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 19:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhEJRLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 13:11:05 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:63886 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbhEJRLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 13:11:05 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 04c0d1db;
        Mon, 10 May 2021 19:09:58 +0200 (CEST)
Date:   Mon, 10 May 2021 19:09:58 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kettenis@openbsd.org, devicetree@vger.kernel.org, marcan@marcan.st,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <3bad54b9-599a-91c6-48b8-dd1c494f61b5@canonical.com> (message
        from Krzysztof Kozlowski on Mon, 10 May 2021 09:03:13 -0400)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
References: <20210508142000.85116-1-kettenis@openbsd.org>
 <20210508142000.85116-2-kettenis@openbsd.org> <3bad54b9-599a-91c6-48b8-dd1c494f61b5@canonical.com>
Message-ID: <5612be6e2a63adbd@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Date: Mon, 10 May 2021 09:03:13 -0400
> 
> On 08/05/2021 10:19, Mark Kettenis wrote:
> > The Apple GPIO controller is a simple combined pin and GPIO conroller
> > present on Apple ARM SoC platforms, including various iPhone and iPad
> > devices and the "Apple Silicon" Macs.
> > 
> > Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> > ---
> >  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/pinctrl/apple.h           |  13 +++
> >  3 files changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/apple.h
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> > new file mode 100644
> > index 000000000000..cc7805ca6ba1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple GPIO controller
> > +
> > +maintainers:
> > +  - Mark Kettenis <kettenis@openbsd.org>
> > +
> > +description: |
> > +  The Apple GPIO controller is a simple combined pin and GPIO conroller
> > +  present on Apple ARM SoC platforms, including various iPhone and iPad
> > +  devices and the "Apple Silicon" Macs.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: apple,t8103-pinctrl
> > +      - const: apple,pinctrl
> 
> What is the point of having very generic final compatible in the binding
> which does not relate to actual hardware?
> 
> Let's say next SoC will be
> apple,x-abcd-foo-2323-whatever-nothing-in-common and you still have to
> use generic "apple,pinctrl" even though HW is not at all compatible?
> This looks like wildcard, not HW description.

Hi Krzysztof,

See my reply to Rob's mail.  We have some confidence that Apple isn't
changing their GPIO block very often.  If they were to change it in an
incompatible way in a future SoC, we'd drop the "apple,pinctrl"
compatible of course.

Thanks,

Mark
