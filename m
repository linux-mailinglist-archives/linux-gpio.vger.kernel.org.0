Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5517ADBD65
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 08:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392109AbfJRGAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 02:00:02 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35434 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfJRGAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 02:00:02 -0400
Received: by mail-oi1-f195.google.com with SMTP id x3so4261312oig.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 23:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UqfvRiIf/2+i2h/4Ujog5bIvchOk5tCgScNdijxQat0=;
        b=pYwivSRkBCkHKIKFMDxSUQzYxZubKHj+eCQPph1DAVEMONHUi6BTkSvZFnrCvfLDxH
         V4OwguAODrasciR5IXTpPZ+z7pwLQDiwResq2ZCCpKPZ9gC9ReqObuK06qxyekoEAnkt
         Lin0M1x80JQOW86VzKE/a/V400dWUexZDggO72ItnaHM0dmXMfVd6xC6Wgn1BvHuCudQ
         +GULmOf7tQBP3UOhpQk3PQVJyZkQCwRxOjGivUuHXavq2ko60LD+eB6Rc+0/aL0XABBw
         ZHBPvTIj+om6O9AfsDy4rIhOHzfkZ4RgLtxOeN9hldC0DmH8GJoJBm56IH7+s1eU4WZH
         szjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UqfvRiIf/2+i2h/4Ujog5bIvchOk5tCgScNdijxQat0=;
        b=sNVOSsbJmptQ8WtKg4l/RHHwCgnS5OTvgVpLQU3Pm5flNVvzYeFTYV+aCuxxN9unYx
         Hoed5G6JMEZV/A9PIYbFJ7jvS8Gn+aXsQg+3K3S+LC//lkw29YfOGUn2eWLbeokYtvRI
         CPO0BGvB5AovuHX97puFLMYAVa0UwNnf/Awc7Yh9vYVLy6f0BRULPvxl8Zl81OKoYh17
         68dAwhn2CXrtIDsfEV85Q4ZmUZ2BcvgCb1McxxZoy8mAYajkYx/Xp4thrsAYqmcPle/1
         MOaZSukM9o/jRAtQPOcfutHwYlPehWSsSZzwOeGPpQuL3Bj5I9BTBzqFF4SekJYD/zor
         Za0g==
X-Gm-Message-State: APjAAAXlC/yy+jSKhpCU1O7LnYUvv2f18W01UjHXb2np6xT0rE6JiXZP
        QFI76SM2rFIhZKii71nKIiq8Eg0afaQ9TJuDa7rttA==
X-Google-Smtp-Source: APXvYqyCvDHaJrg7j1BywNpOntr+hSlB0UMU2FiS9ccSeEXT+v+90TwnyKhF9R7q13vsCdz5mVYJmK4+DYouCWn6Cw8=
X-Received: by 2002:a54:4e83:: with SMTP id c3mr6575837oiy.170.1571378401053;
 Thu, 17 Oct 2019 23:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191017031051.20366-1-chris.packham@alliedtelesis.co.nz>
 <20191017031051.20366-2-chris.packham@alliedtelesis.co.nz> <20191017192437.GA24080@bogus>
In-Reply-To: <20191017192437.GA24080@bogus>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 18 Oct 2019 07:59:50 +0200
Message-ID: <CAMpxmJVrFK38BPjoUtGt99sqgFeOA=wHFAu=QNQg_5Rj1gU92A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 17 pa=C5=BA 2019 o 21:24 Rob Herring <robh@kernel.org> napisa=C5=82(a=
):
>
> On Thu, Oct 17, 2019 at 04:10:50PM +1300, Chris Packham wrote:
> > This GPIO controller is present on a number of Broadcom switch ASICs
> > with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> > blocks but different enough to require a separate driver.
> >
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >
> > Notes:
> >     Changes in v2:
> >     - Document as DT schema
> >     - Include ngpios, #gpio-cells and gpio-controller properties
> >
> >  .../bindings/gpio/brcm,xgs-iproc.yaml         | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-ipr=
oc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml=
 b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> > new file mode 100644
> > index 000000000000..71998551209e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom XGS iProc GPIO controller
> > +
> > +maintainers:
> > +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> > +
> > +description: |
> > +  This controller is the Chip Common A GPIO present on a number of Bro=
adcom
> > +  switch ASICs with integrated SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,iproc-gpio-cca
>
> enum vs. const usage depends on whether you think you'll add more
> compatibles.
>

What if you don't know yet? For instance we use a const compatible and
then a new chip is released for which we can reuse the driver? Is this
something that is expected to remain stable in the binding document?
The question is unrelated to this patch, I'm just unsure about my own
approach to writing yaml bindings.

Bart

> > +
> > +  reg:
> > +    minItems: 2
> > +    maxItems: 2
> > +    description:
> > +      The first region defines the base I/O address containing
> > +      the GPIO controller registers. The second region defines
> > +      the I/O address containing the Chip Common A interrupt
> > +      registers.
>
> items:
>   - description: the I/O address containing the GPIO controller
>       registers
>   - description: the I/O address containing the Chip Common A interrupt
>       registers
>
> And minItems/maxItems can be implicit.
>
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +      const: 2
> > +
> > +  ngpios:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Common property, doesn't need a type definition. Also, it would have to
> be under an 'allOf' to actually work.
>
> > +    minimum: 0
> > +    maximum: 32
> > +
> > +  interrupt-controller:
> > +    type: boolean
>
> Just 'interrupt-controller: true'
>
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#gpio-cells"
> > +  - gpio-controller
> > +
> > +allOf:
> > + - if:
> > +     properties:
> > +       interrupt-controller:
> > +         contains:
> > +           const: true
> > +   then:
> > +     required:
> > +       - interrupts
> > +       - '#interrupt-cells'
>
> This is mostly handled in the core schema already and 'dependencies'
> works better for this anyways. All you need here is:
>
> dependencies:
>   interrupt-controller: [ interrupts ]
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    gpio@18000060 {
> > +        compatible =3D "brcm,iproc-gpio-cca";
> > +        #gpio-cells =3D <2>;
> > +        reg =3D <0x18000060 0x50>,
> > +              <0x18000000 0x50>;
> > +        ngpios =3D <12>;
> > +        gpio-controller;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <2>;
> > +        interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > +
> > +
> > +...
> > --
> > 2.23.0
> >
