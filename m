Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2E4F05C2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390808AbfKETQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 14:16:02 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60696 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390526AbfKETQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 14:16:01 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA5JFQhd056692;
        Tue, 5 Nov 2019 13:15:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572981326;
        bh=EcoGS6j0s8IWE01lKKx9TXLRSHW8gbHmupnZYacNFWg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hiQv1SCTJvcMHBzAopoD1ytQNtPv60OtKZshyfH/29z8ioz2LfWvN1b6r1jvxX/mB
         4gfSiu8zMV3JsJtVr7SuiOmlbSRr5eM6ayTtFaTHNdIp7aBtbX3gkajdTkAaBJyJDz
         Kuu5/s09dJ9Njpx1TrveXVrZ/3+olbhatO4LjHEI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA5JFQK7069157
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 Nov 2019 13:15:26 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 5 Nov
 2019 13:15:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 5 Nov 2019 13:15:11 -0600
Received: from [10.250.33.226] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA5JFPs1030118;
        Tue, 5 Nov 2019 13:15:25 -0600
Subject: Re: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        <mazziesaccount@gmail.com>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <37d85b2d-8fca-a998-95ae-61f0c049054d@ti.com>
Date:   Tue, 5 Nov 2019 13:14:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Matti

On 11/1/19 6:32 AM, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC LED driver device tree bindings.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> Changes from v2 - new patch
>
>   .../bindings/leds/rohm,leds-bd71828.yaml      | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> new file mode 100644
> index 000000000000..d8aeac9911ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/rohm,leds-bd71828.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit LED driver
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Dan Murphy <dmurphy@ti.com>
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Mark Rutland <mark.rutland@arm.com>
I believe you are the maintainer of this driver not the maintainers
> +
> +description: |
> +  This module is part of the ROHM BD71828 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
> +
> +  The LED controller is represented as a sub-node of the PMIC node on the device
> +  tree.
> +
> +  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
> +
> +properties:
> +  compatible:
> +    const: rohm,bd71828-led
> +
> +patternProperties:
> +  "^led-[1-2]$":
> +    type: object
> +    description:
> +      Properties for a single LED. Nodes must be named as led-1 and led-2.

Why is this required?  Can't we use the reg as the number and then we 
can use standard node labels

like led@<reg value>.  Then we can check in the code to make sure that 
the output is not out of bounds.

> +    properties:
> +      #$ref: "common.yaml#"
> +      function:
> +        description:
> +          Purpose of LED as defined in dt-bindings/leds/common.h
> +        $ref: "/schemas/types.yaml#/definitions/string"
> +      color:
> +        description:
> +          LED colour as defined in dt-bindings/leds/common.h

s/colour/color

But again I believe it is indicated above that the LEDs are either going 
to be green or amber.  Unless they can be any color.

Are there plans to make sure that the color is either green or amber in 
the code?  I don't see a patch for the code in this series

> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +
> +required:
> +  - compatible

Is there an example of the node and properties?

Dan

