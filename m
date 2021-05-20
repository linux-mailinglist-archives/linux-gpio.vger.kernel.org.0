Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69AE38B4DD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 19:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbhETRFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 13:05:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46356 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbhETRFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 13:05:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KH4A59061988;
        Thu, 20 May 2021 12:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621530250;
        bh=Hahd3sJXjUgbQKssP+efhi1/PrDATemEHuhR+XCl+SA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ll54Kt+/1sM8XptacJI2fGaMqjqQ6sDSsFszlSQr1cskjDxgt8m5sw9Ni4Y96v1OI
         R6M69OCEIkPG4jXcUFlTJaY8alqaunzKotc8OArubdgGrdB7aov0OOwQZEYJvFLL4Y
         VVL6bsyNwAirEGU8llEJj4Xqwu3HSB6+rjTuAjCE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KH4A3V004928
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 May 2021 12:04:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 12:04:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 12:04:10 -0500
Received: from [10.250.235.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KH44Wk078148;
        Thu, 20 May 2021 12:04:05 -0500
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210511090122.6995-1-a-govindraju@ti.com>
 <20210517221513.GA3263368@robh.at.kernel.org>
 <e239365e-35d7-694a-55cc-7dabfa66b108@ti.com>
 <CAL_JsqKM5unmiXdYBzM9xfEETfTVTF9RMXPuT7Lb7w0cnwd1mw@mail.gmail.com>
From:   Aswath Govindraju <a-govindraju@ti.com>
Message-ID: <50d6dea2-f35d-d620-a8f2-29ad97365119@ti.com>
Date:   Thu, 20 May 2021 22:34:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKM5unmiXdYBzM9xfEETfTVTF9RMXPuT7Lb7w0cnwd1mw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 20/05/21 10:11 pm, Rob Herring wrote:
> On Tue, May 18, 2021 at 9:13 AM Aswath Govindraju <a-govindraju@ti.com> wrote:
>>
>>
>> Hi Rob,
>>
>> On 18/05/21 3:45 am, Rob Herring wrote:
>>> On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
>>>> Convert gpio-davinci dt-binding documentation from txt to yaml format.
>>>>
>>>> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
>>>> ---
>>>>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>>>>  .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
>>>>  MAINTAINERS                                   |   2 +-
>>>>  3 files changed, 194 insertions(+), 168 deletions(-)
>>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>>>>
>>
>> [...]
>>
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
>>
>> I will change this.
>>
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Physical base address of the controller and the size of memory mapped registers.
>>>
>>> Drop. That's every 'reg' property.
>>>
>>
>> I'll drop this.
>>
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
>>
>> The max number of lines will be equal to ti,ngpio. Is there any way to
>> equate maxItems to the a property value in json schema ?
> 
> There have been discussions about something like that for json-schema,
> but nothing yet AFAIK. Is there a max for ti,ngpio? Nothing means
> 2^32. Surely there's something less than that. You can always adjust
> the max later.

Thank you. I will put an cap on this number based on the existing device
trees.

> 
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
>>
>> Here also the maximum number of interrupts is equal to ti,ngpio in
>> unbanked interrupts case. Same as above is there anyway to equate
>> maxItems to ti,ngpio property in json schma ? If not, then what would be
>> the best way to handle this ?
> 
> Banked means 1 combined interrupt?
> 
Yes, one combined interrupt per bank and there can be multiple banks per
gpio instance.

Thanks,
Aswath
