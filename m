Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB20DB76F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 21:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503431AbfJQTYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 15:24:41 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38462 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393438AbfJQTYl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 15:24:41 -0400
Received: by mail-oi1-f193.google.com with SMTP id k10so856376oij.5;
        Thu, 17 Oct 2019 12:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JbxUD4/Ch48OCt7IQSmlYFRVjr2GA3XCWfDDRfU4VJU=;
        b=Lc6AY1pt3sW7zF2T8T636zz4Gsy44kCslv9x9jlzb8QS4BrnlkTt5EC5oUPVOLxVz8
         57IupVDdiJUTinWI9huz3SY3ZNfMC46IXY/aFQ+u5pPXL5sG/P1JFG57YxXL+oxV51p9
         rsmc2ZM+vtlauHKmEsoFAa25t5YkbzNoYM2JXQLnHQZcKnpufY8iCkE9GrWJ8g61KF9V
         DNxcEADzyU9XfneHCeyPWzjWcQL6+BxFNJ3Hj8CEdHQnlu23i+vnrXcO3QOWrIMrFb47
         WcfLsqYEnwVmi4VaHp5ZSkAuZlZvMoTiPOuZsb8MGTvv/CBRutZrWEnq6m0MF7W7WVIU
         5tQw==
X-Gm-Message-State: APjAAAVx0fXPePlmIEqxpSntOr5Gva6fTDFBkehEkBCP/oVX+M9fDfIj
        thEd3J+K9wcHEPc8CbR61Q==
X-Google-Smtp-Source: APXvYqz00kRIlvZzcsK3LPl7hBlSHEH3J1/iOr9YAPvYkaFiiR1Q8p/7vSBVdqGPIDLLZFBz4i9Gjg==
X-Received: by 2002:aca:ef85:: with SMTP id n127mr4771640oih.42.1571340279227;
        Thu, 17 Oct 2019 12:24:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s6sm818858otr.5.2019.10.17.12.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 12:24:38 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:24:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mark.rutland@arm.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: brcm: Add bindings for
 xgs-iproc
Message-ID: <20191017192437.GA24080@bogus>
References: <20191017031051.20366-1-chris.packham@alliedtelesis.co.nz>
 <20191017031051.20366-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017031051.20366-2-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 17, 2019 at 04:10:50PM +1300, Chris Packham wrote:
> This GPIO controller is present on a number of Broadcom switch ASICs
> with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> blocks but different enough to require a separate driver.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - Document as DT schema
>     - Include ngpios, #gpio-cells and gpio-controller properties
> 
>  .../bindings/gpio/brcm,xgs-iproc.yaml         | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> new file mode 100644
> index 000000000000..71998551209e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom XGS iProc GPIO controller
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +description: |
> +  This controller is the Chip Common A GPIO present on a number of Broadcom
> +  switch ASICs with integrated SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,iproc-gpio-cca

enum vs. const usage depends on whether you think you'll add more 
compatibles.

> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      The first region defines the base I/O address containing
> +      the GPIO controller registers. The second region defines
> +      the I/O address containing the Chip Common A interrupt
> +      registers.

items:
  - description: the I/O address containing the GPIO controller 
      registers
  - description: the I/O address containing the Chip Common A interrupt 
      registers

And minItems/maxItems can be implicit.

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +      const: 2
> +
> +  ngpios:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Common property, doesn't need a type definition. Also, it would have to 
be under an 'allOf' to actually work.

> +    minimum: 0
> +    maximum: 32
> +
> +  interrupt-controller:
> +    type: boolean

Just 'interrupt-controller: true'

> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> + - if:
> +     properties:
> +       interrupt-controller:
> +         contains:
> +           const: true
> +   then:
> +     required:
> +       - interrupts
> +       - '#interrupt-cells'

This is mostly handled in the core schema already and 'dependencies' 
works better for this anyways. All you need here is:

dependencies:
  interrupt-controller: [ interrupts ]

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio@18000060 {
> +        compatible = "brcm,iproc-gpio-cca";
> +        #gpio-cells = <2>;
> +        reg = <0x18000060 0x50>,
> +              <0x18000000 0x50>;
> +        ngpios = <12>;
> +        gpio-controller;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +
> +...
> -- 
> 2.23.0
> 
