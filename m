Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A2538C1E9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbhEUIgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:36:14 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53004 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhEUIgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 04:36:13 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14L8YnIQ116606;
        Fri, 21 May 2021 03:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621586089;
        bh=HtUbpcY2SMZnwx9bd+87FwQyhJV4VAHqnM5eMnOSmE8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BukQm+pc8VX/BVYe99bSVgnM7z0grQv3CpoBHjOza2erxY96Qnl1QvYkgk7iY2h6T
         WzU6RoSTOzEf2hJ7ygNw6wWlkph0uuzVnFqAu6reMNounyObCWpDFlFjlgWaevkfPz
         sypVr3kcII3eB3mdn3RKnfz9QbAjqVb8+A7Qs3mQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14L8Ynwg004822
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 03:34:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 03:34:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 03:34:48 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14L8YhUD038009;
        Fri, 21 May 2021 03:34:45 -0500
Subject: Re: [PATCH v2] dt-bindings: gpio: gpio-davinci: Convert to
 json-schema
To:     Aswath Govindraju <a-govindraju@ti.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210521075103.13917-1-a-govindraju@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <9b50c1c6-7ec8-5fd5-6a1c-20c445d49f51@ti.com>
Date:   Fri, 21 May 2021 11:34:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521075103.13917-1-a-govindraju@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Aswath, Rob,

On 21/05/2021 10:51, Aswath Govindraju wrote:
> Convert gpio-davinci dt-binding documentation from txt to yaml format.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
> 
> changes since v1:
> - combined the individual compatible properties into one enum
> - added maxItems and minItems properties for gpio-line-names and
>    interrupts
> - updated the description of interrupts property
> - removed the description for properties that are general
> - updated the pattern property for gpio hog to indicate any sort
>    node name based on its usage
> - corrected the example wakeup gpio node name
> 
>   .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>   .../bindings/gpio/gpio-davinci.yaml           | 196 ++++++++++++++++++
>   MAINTAINERS                                   |   2 +-
>   3 files changed, 197 insertions(+), 168 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> deleted file mode 100644
> index 696ea46227d1..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ /dev/null
> @@ -1,167 +0,0 @@
> -Davinci/Keystone GPIO controller bindings
> -
> -Required Properties:
> -- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
> -			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
> -						66AK2E SoCs
> -			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
> -			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
> -			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
> -			"ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> new file mode 100644
> index 000000000000..28b924997be5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controller for Davinci and keystone devices
> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,k2g-gpio
> +              - ti,am654-gpio
> +              - ti,j721e-gpio
> +              - ti,am64-gpio
> +          - const: ti,keystone-gpio
> +
> +      - items:
> +          - enum:
> +              - ti,dm6441-gpio
> +              - ti,keystone-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  gpio-line-names:
> +    description: strings describing the names of each gpio line.
> +    minItems: 1
> +    maxItems: 100
> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
> +
> +  interrupts:
> +    description:
> +      The interrupts are specified as per the interrupt parent. Only banked
> +      or unbanked IRQs are supported at a time. If the interrupts are
> +      banked then provide list of interrupts corresponding to each bank, else
> +      provide the list of interrupts for each gpio.
> +    minItems: 1
> +    maxItems: 100
> +
> +  ti,ngpio:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of GPIO pins supported consecutively.
> +    minimum: 1
> +
> +  ti,davinci-gpio-unbanked:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of GPIOs that have an individual interrupt line to processor.
> +    minimum: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: gpio
> +
> +  interrupt-controller: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:
> +      properties:
> +        gpios: true
> +        gpio-hog: true
> +        input: true
> +        output-high: true
> +        output-low: true
> +        line-name: true
> +
> +      required:
> +        - gpio-hog
> +        - gpios

Missed v2 - copy pasting here also:

I see that gpio-hog.yaml dtschema has been added.
Can it be reused here and how?

[...]

-- 
Best regards,
grygorii
