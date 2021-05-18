Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4727387AD0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 16:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349869AbhEROPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 10:15:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54042 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349875AbhEROPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 10:15:09 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IEDmet040816;
        Tue, 18 May 2021 09:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621347228;
        bh=rWOOHxlCumxcrMn6+epkc1yup2Wpt2T3DIHsNEB8X/c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=EsuxIOVUURKFgH8hZekJL0NhZomtrJX6K8njcDP3iNmwVZGJoCpvR04Xqv72IENUa
         IOxlyMTV8xeuUuZZd0+NJemKkwiz7b7+QvdECikjREu8Ht1yoOPh+ld0avAe49VLnX
         LvvhtXmWSoYTdPhjbwvaeNIsHHzBENkszR6EsbGQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IEDmlW101625
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 09:13:48 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 09:13:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 09:13:47 -0500
Received: from [10.250.235.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IEDd0H001345;
        Tue, 18 May 2021 09:13:40 -0500
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210511090122.6995-1-a-govindraju@ti.com>
 <20210517221513.GA3263368@robh.at.kernel.org>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <e239365e-35d7-694a-55cc-7dabfa66b108@ti.com>
Date:   Tue, 18 May 2021 19:43:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210517221513.GA3263368@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Rob,

On 18/05/21 3:45 am, Rob Herring wrote:
> On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
>> Convert gpio-davinci dt-binding documentation from txt to yaml format.
>>
>> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>>  .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
>>  MAINTAINERS                                   |   2 +-
>>  3 files changed, 194 insertions(+), 168 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>

[...]

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

I will change this.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Physical base address of the controller and the size of memory mapped registers.
> 
> Drop. That's every 'reg' property.
> 

I'll drop this.

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

The max number of lines will be equal to ti,ngpio. Is there any way to
equate maxItems to the a property value in json schema ?

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

Here also the maximum number of interrupts is equal to ti,ngpio in
unbanked interrupts case. Same as above is there anyway to equate
maxItems to ti,ngpio property in json schma ? If not, then what would be
the best way to handle this ?

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

Will drop this.

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
> Drop

Will drop this.
.
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
>> +examples:
>> +  - |
>> +    #include<dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    gpio0: gpio@2603000 {
>> +      compatible = "ti,k2g-gpio", "ti,keystone-gpio";
>> +      reg = <0x02603000 0x100>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      ti,ngpio = <144>;
>> +      ti,davinci-gpio-unbanked = <0>;
>> +      clocks = <&k2g_clks 0x001b 0x0>;
>> +      clock-names = "gpio";
>> +    };
>> +
>> +  - |
>> +    #include<dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    gpio1: gpio@260bf00 {
>> +      compatible = "ti,keystone-gpio";
>> +      reg = <0x0260bf00 0x100>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      /* HW Interrupts mapped to GPIO pins */
>> +      interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
>> +                   <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> +      clocks = <&clkgpio>;
>> +      clock-names = "gpio";
>> +      ti,ngpio = <32>;
>> +      ti,davinci-gpio-unbanked = <32>;
>> +    };
>> +
>> +  - |
>> +    wkup_gpio0: wkup_gpio0@42110000 {
> 
> gpio@...
> 

will change this in respin

Thanks,
Aswath

>> +      compatible = "ti,am654-gpio", "ti,keystone-gpio";
>> +      reg = <0x42110000 0x100>;
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      interrupt-parent = <&intr_wkup_gpio>;
>> +      interrupts = <60>, <61>, <62>, <63>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      ti,ngpio = <56>;
>> +      ti,davinci-gpio-unbanked = <0>;
>> +      clocks = <&k3_clks 59 0>;
>> +      clock-names = "gpio";
>> +    };
>> +
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6e183abbbd2e..6b3519db8085 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18269,7 +18269,7 @@ TI DAVINCI SERIES GPIO DRIVER
>>  M:	Keerthy <j-keerthy@ti.com>
>>  L:	linux-gpio@vger.kernel.org
>>  S:	Maintained
>> -F:	Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>> +F:	Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>  F:	drivers/gpio/gpio-davinci.c
>>  
>>  TI DAVINCI SERIES MEDIA DRIVER
>> -- 
>> 2.17.1
>>

