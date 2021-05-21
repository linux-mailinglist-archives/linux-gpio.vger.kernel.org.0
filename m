Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F7B38C1DC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhEUId2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:33:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43322 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbhEUId2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 04:33:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14L8W3ud053831;
        Fri, 21 May 2021 03:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621585923;
        bh=MOUPIRXUwXmLPYczhUeKPgIWYaZIsJK7spC0Tb6vuTI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=s6WFFiDHKxoceCE8FOc2HHpVjRjiPsgmcnlIremPUYWO5kjNorAhP/UjtBde1cKM6
         9Sq41S+PlRSFbY9msc16UBOXKKMfCHm7f13GqT1tHKHTUGrJofOkcXPs7e3rJjoxPA
         gmsJacbNZ1ybSJwS/uFlyANrLLVguFDaaeER+3sE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14L8W363115480
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 03:32:03 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 03:32:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 03:32:03 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14L8W0gb032440;
        Fri, 21 May 2021 03:32:00 -0500
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Rob Herring <robh@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210511090122.6995-1-a-govindraju@ti.com>
 <20210517221513.GA3263368@robh.at.kernel.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <861cefe2-7bb6-c435-ab0d-483155852876@ti.com>
Date:   Fri, 21 May 2021 11:31:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210517221513.GA3263368@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob, All

On 18/05/2021 01:15, Rob Herring wrote:
> On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
>> Convert gpio-davinci dt-binding documentation from txt to yaml format.
>>
>> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
>> ---
>>   .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>>   .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
>>   MAINTAINERS                                   |   2 +-
>>   3 files changed, 194 insertions(+), 168 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>> deleted file mode 100644
>> index 696ea46227d1..000000000000
>> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>> +++ /dev/null
>> @@ -1,167 +0,0 @@
>> -Davinci/Keystone GPIO controller bindings
>> -
>> -Required Properties:
>> -- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
>> -			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
>> -						66AK2E SoCs
>> -			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
>> -			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
>> -			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
>> -			"ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
>> -

[...]

>> -};
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>> new file mode 100644
>> index 000000000000..1e16172669c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>> @@ -0,0 +1,193 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GPIO controller for Davinci and keystone devices
>> +
>> +maintainers:
>> +  - Keerthy <j-keerthy@ti.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,k2g-gpio
>> +              - ti,am654-gpio
>> +              - ti,j721e-gpio
>> +              - ti,am64-gpio
>> +          - const: ti,keystone-gpio
>> +
>> +      - items:
>> +          - const: ti,dm6441-gpio
>> +      - items:
>> +          - const: ti,keystone-gpio
> 
> These 2 can be expressed as an 'enum'.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Physical base address of the controller and the size of memory mapped registers.
> 
> Drop. That's every 'reg' property.
> 
>> +
>> +  gpio-controller: true
>> +
>> +  gpio-ranges: true
>> +
>> +  gpio-line-names:
>> +    description: strings describing the names of each gpio line.
> 
> Any constraints like min/max number of lines?
> 
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +    description:
>> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
>> +
>> +  interrupts:
>> +    description:
>> +      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.
> 
> Needs constraints. How many items and what are they?
> 
>> +
>> +  ti,ngpio:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: The number of GPIO pins supported consecutively.
>> +    minimum: 1
>> +
>> +  ti,davinci-gpio-unbanked:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: The number of GPIOs that have an individual interrupt line to processor.
>> +    minimum: 0
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description:
>> +      clock-specifier to represent input to the GPIO controller.
> 
> Drop description.
> 
>> +
>> +  clock-names:
>> +    const: gpio
>> +
>> +  interrupt-controller: true
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      Phandle to the power domain provider node.
> 
> Drop.
> 
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>> +patternProperties:
>> +  "-hog$":
>> +    type: object
>> +    properties:
>> +      gpios: true
>> +      gpio-hog: true
>> +      input: true
>> +      output-high: true
>> +      output-low: true
>> +      line-name: true
>> +
>> +    required:
>> +      - gpio-hog
>> +      - gpios

I see that gpio-hog.yaml dtschema has been added.
Can it be reused here and how?


>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - gpio-controller
>> +  - "#gpio-cells"
>> +  - interrupts
>> +  - ti,ngpio
>> +  - ti,davinci-gpio-unbanked
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +

[...]

-- 
Best regards,
grygorii
