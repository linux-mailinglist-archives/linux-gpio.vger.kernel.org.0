Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4926138CA9B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 18:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbhEUQIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 12:08:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38704 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhEUQIK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 12:08:10 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14LG6jgt109831;
        Fri, 21 May 2021 11:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621613205;
        bh=Vnl0RIBt1/tJ/Jb31YFm3Zit66WXm3me49iZt/tJsW8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pu8V3stltZVLya0k/HKI/Ed9AT0SKZ/krdE7auA69tcPcICVJhXeJMbAXb6teil1L
         /xcP/R1sgHmxqImJuACRzf5ZVtiwdMNcKp6uCuMCoRIEy7utV4lTrmYIG2418xEU8V
         q/vj+8bvF2hvkBgZsxZNunvbQ3hobZj23nzfMmvU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14LG6jw3112768
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 11:06:45 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 11:06:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 11:06:45 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14LG6gEY020893;
        Fri, 21 May 2021 11:06:43 -0500
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
CC:     Aswath Govindraju <a-govindraju@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210511090122.6995-1-a-govindraju@ti.com>
 <20210517221513.GA3263368@robh.at.kernel.org>
 <861cefe2-7bb6-c435-ab0d-483155852876@ti.com>
 <CAL_JsqKyuXYJocBMLGXL6aXuK0YnrW7qdLugV2bxdP-LJ=2+cg@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <42ec7cbd-1364-8dfe-c652-79b16bb6b87c@ti.com>
Date:   Fri, 21 May 2021 19:06:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKyuXYJocBMLGXL6aXuK0YnrW7qdLugV2bxdP-LJ=2+cg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 21/05/2021 15:56, Rob Herring wrote:
> On Fri, May 21, 2021 at 3:32 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>>
>> Hi Rob, All
>>
>> On 18/05/2021 01:15, Rob Herring wrote:
>>> On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
>>>> Convert gpio-davinci dt-binding documentation from txt to yaml format.
>>>>
>>>> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
>>>> ---
>>>>    .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>>>>    .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
>>>>    MAINTAINERS                                   |   2 +-
>>>>    3 files changed, 194 insertions(+), 168 deletions(-)
>>>>    delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>    create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>> deleted file mode 100644
>>>> index 696ea46227d1..000000000000
>>>> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>> +++ /dev/null
>>>> @@ -1,167 +0,0 @@
>>>> -Davinci/Keystone GPIO controller bindings
>>>> -
>>>> -Required Properties:
>>>> -- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
>>>> -                    "ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
>>>> -                                            66AK2E SoCs
>>>> -                    "ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
>>>> -                    "ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
>>>> -                    "ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
>>>> -                    "ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
>>>> -
>>
>> [...]
>>
>>>> -};
>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>>> new file mode 100644
>>>> index 000000000000..1e16172669c7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>>> @@ -0,0 +1,193 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: GPIO controller for Davinci and keystone devices
>>>> +
>>>> +maintainers:
>>>> +  - Keerthy <j-keerthy@ti.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - ti,k2g-gpio
>>>> +              - ti,am654-gpio
>>>> +              - ti,j721e-gpio
>>>> +              - ti,am64-gpio
>>>> +          - const: ti,keystone-gpio
>>>> +
>>>> +      - items:
>>>> +          - const: ti,dm6441-gpio
>>>> +      - items:
>>>> +          - const: ti,keystone-gpio
>>>
>>> These 2 can be expressed as an 'enum'.
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Physical base address of the controller and the size of memory mapped registers.
>>>
>>> Drop. That's every 'reg' property.
>>>
>>>> +
>>>> +  gpio-controller: true
>>>> +
>>>> +  gpio-ranges: true
>>>> +
>>>> +  gpio-line-names:
>>>> +    description: strings describing the names of each gpio line.
>>>
>>> Any constraints like min/max number of lines?
>>>
>>>> +
>>>> +  "#gpio-cells":
>>>> +    const: 2
>>>> +    description:
>>>> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
>>>> +
>>>> +  interrupts:
>>>> +    description:
>>>> +      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.
>>>
>>> Needs constraints. How many items and what are they?
>>>
>>>> +
>>>> +  ti,ngpio:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: The number of GPIO pins supported consecutively.
>>>> +    minimum: 1
>>>> +
>>>> +  ti,davinci-gpio-unbanked:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: The number of GPIOs that have an individual interrupt line to processor.
>>>> +    minimum: 0
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      clock-specifier to represent input to the GPIO controller.
>>>
>>> Drop description.
>>>
>>>> +
>>>> +  clock-names:
>>>> +    const: gpio
>>>> +
>>>> +  interrupt-controller: true
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Phandle to the power domain provider node.
>>>
>>> Drop.
>>>
>>>> +
>>>> +  "#interrupt-cells":
>>>> +    const: 2
>>>> +
>>>> +patternProperties:
>>>> +  "-hog$":
>>>> +    type: object
>>>> +    properties:
>>>> +      gpios: true
>>>> +      gpio-hog: true
>>>> +      input: true
>>>> +      output-high: true
>>>> +      output-low: true
>>>> +      line-name: true
>>>> +
>>>> +    required:
>>>> +      - gpio-hog
>>>> +      - gpios
>>
>> I see that gpio-hog.yaml dtschema has been added.
>> Can it be reused here and how?
> 
> It's applied to any node containing 'gpio-hog' property, so all you need is:
> 
> required:
>    - gpio-hog
> 
Thanks for you comments. But I'd like to clarify the Hog child node definition - will work as below?

patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object

     properties:
       gpio-hog: true

     required:
       - gpio-hog

In general, patternProperties duplicates $nodename in gpio-hog dtschema.

-- 
Best regards,
grygorii
