Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB1A249482
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 07:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHSFgB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 01:36:01 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:60022 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgHSFgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 01:36:01 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07J5Zl7f030284; Wed, 19 Aug 2020 14:35:47 +0900
X-Iguazu-Qid: 34tKNrBeFctMMDPOM8
X-Iguazu-QSIG: v=2; s=0; t=1597815347; q=34tKNrBeFctMMDPOM8; m=GGabhVICmOPFoyCvmKiIeC+b++fpwKVxbJzdq2PoczA=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 07J5Zkm8017886;
        Wed, 19 Aug 2020 14:35:46 +0900
Received: from enc03.toshiba.co.jp ([106.186.93.13])
        by imx12.toshiba.co.jp  with ESMTP id 07J5ZkOr019897;
        Wed, 19 Aug 2020 14:35:46 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc03.toshiba.co.jp  with ESMTP id 07J5Zj8W032020;
        Wed, 19 Aug 2020 14:35:45 +0900
Date:   Wed, 19 Aug 2020 14:35:44 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add bindings for Toshiba
 Visconti TMPV7700 SoC
X-TSB-HOP: ON
Message-ID: <20200819053544.GD1256849@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817194833.GB1432385@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817194833.GB1432385@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Mon, Aug 17, 2020 at 01:48:33PM -0600, Rob Herring wrote:
> On Mon, Aug 17, 2020 at 10:46:25AM +0900, Nobuhiro Iwamatsu wrote:
> > Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  .../pinctrl/toshiba,visconti-pinctrl.yaml     | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..4009902cd396
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba Visconti TMPV770x pin mux/config controller
> > +
> > +maintainers:
> > +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > +
> > +description:
> > +  Toshiba's Visconti ARM SoC a pin mux/config controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - toshiba,tmpv7708-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +patternProperties:
> > +  '^.*$':
> 
> For new bindings, please define something like '-pins$' for the pin 
> nodes.

OK, I will update.

> 
> > +    if:
> > +      type: object
> > +    then:
> 
> Then we don't have to do this if/then.
> 
> This also needs a $ref to the common pinctrl schemas.
> 


OK, I will fix this.

> > +      properties:
> > +        function:
> > +          description:
> > +            Function to mux.
> > +          $ref: "/schemas/types.yaml#/definitions/string"
> > +          enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
> > +            spi0, spi1, spi2, spi3, spi4, spi5, spi6,
> > +            uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
> > +

Best regards,
  Nobuhiro
