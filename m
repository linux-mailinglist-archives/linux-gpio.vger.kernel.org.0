Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F18A7630BE6
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Nov 2022 05:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiKSEYN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 23:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiKSEYM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 23:24:12 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CB54F184;
        Fri, 18 Nov 2022 20:24:11 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJ4Nxgg049070;
        Fri, 18 Nov 2022 22:23:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668831839;
        bh=PWHx06q4M3lbufn74MPeUF0tFn9oTY8oqoN3t252zGc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=foUYIoT4Q8DNIkgeEyaFRA5+1g6SZEp0R9iM7I9Vulo6EzYbFj5PZWDOPHIW/m6w+
         a9RoP6WMuXYW62rUjI9AnIqo3M646NzxkZBNzC5me848DXVOWN9UTLw+DHD6sPcUWT
         Npd4uz1wQ9lE8YdXzRSv+OTu32yOh3LiKDKCW+3Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJ4Nxde009194
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 22:23:59 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 22:23:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 22:23:58 -0600
Received: from ubuntu (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 2AJ4NnQN095304;
        Fri, 18 Nov 2022 22:23:50 -0600
Date:   Fri, 18 Nov 2022 20:23:47 -0800
From:   Matt Ranostay <mranostay@ti.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <vigneshr@ti.com>, <robh@kernel.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] Documentation: ti,tps6594: Add DT bindings for
 the TPS6594x PMIC
Message-ID: <Y3haUxShWtA4x8dy@ubuntu>
References: <20221118092218.480147-1-mranostay@ti.com>
 <20221118092218.480147-2-mranostay@ti.com>
 <b46253e0-6678-0a69-1522-83a559835669@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b46253e0-6678-0a69-1522-83a559835669@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 11:21:57AM +0100, Krzysztof Kozlowski wrote:
> On 18/11/2022 10:22, Matt Ranostay wrote:
> > Add documentation for the TPS6594x PMIC including its RTC and GPIO
> > functionalities.
> > 
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
I missed serveral feedback suggestions in the last revision. Will try to be
a little more careful in the future.

> Thank you.
> 
> The comment was about proper subject prefix. Drop also redundant, second
> "DT bindings" from the subject.
> 
> 
> > Signed-off-by: Matt Ranostay <mranostay@ti.com>
> > ---
> >  .../devicetree/bindings/mfd/ti,tps6594.yaml   | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > new file mode 100644
> > index 000000000000..81613bcef39d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/ti,tps6594x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TPS6594x Power Management Integrated Circuit (PMIC)
> > +
> > +maintainers:
> > +  - Keerthy <j-keerthy@ti.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,tps6594
> 
> tps6594 is the model name? So what was previous tps6594x used also in
> title? This does not look correct.
>

So the actual part number is TPS6594-Q1. Would tps6594q1 be more concise
for naming across the device tree, and drivers?

- Matt

> > +
> > +  reg:
> > +    const: 0x48
> > +
> > +  ti,system-power-controller:
> > +    type: boolean
> > +    description: PMIC is controlling the system power.
> > +
> > +  rtc:
> > +    type: object
> > +    $ref: /schemas/rtc/rtc.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      compatible:
> > +        const: ti,tps6594-rtc
> 
> Same problem.
> 
> > +
> > +  gpio:
> > +    type: object
> > +    unevaluatedProperties: false
> > +    properties:
> > +      compatible:
> > +        const: ti,tps6594x-gpio
> 
> 
> Not fixed.
> 
> 
> 
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        pmic: pmic@48 {
> > +            compatible = "ti,tps6594";
> > +            reg = <0x48>;
> > +
> > +            rtc {
> > +                compatible = "ti,tps6594-rtc";
> > +            };
> > +
> > +            gpio {
> > +                compatible = "ti,tps6594-gpio";
> 
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> 
> Best regards,
> Krzysztof
> 
