Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413ED2F4B4D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 13:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAMMbe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 07:31:34 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:56559 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbhAMMbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2021 07:31:34 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 519F53EF18;
        Wed, 13 Jan 2021 13:30:51 +0100 (CET)
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: Add bindings for Awinic
 AW9523/AW9523B
To:     Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
 <20210113024118.GA1404906@robh.at.kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <3857e97d-2505-6a93-03cd-c36562035445@somainline.org>
Date:   Wed, 13 Jan 2021 13:30:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113024118.GA1404906@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 13/01/21 03:41, Rob Herring ha scritto:
> On Mon, Jan 11, 2021 at 07:29:28PM +0100, AngeloGioacchino Del Regno wrote:
>> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   .../pinctrl/awinic,aw9523-pinctrl.yaml        | 112 ++++++++++++++++++
>>   1 file changed, 112 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..a705c05bb5a2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
>> @@ -0,0 +1,112 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/awinic,aw9523-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Awinic AW9523/AW9523B I2C GPIO Expander
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> +
>> +description: |
>> +  The Awinic AW9523/AW9523B I2C GPIO Expander featuring 16 multi-function
>> +  I/O, 256 steps PWM mode and interrupt support.
>> +
>> +properties:
>> +  compatible:
>> +    const: awinic,aw9523-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#gpio-cells':
>> +    description: |
>> +      Specifying the pin number and flags, as defined in
>> +      include/dt-bindings/gpio/gpio.h
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Specifies the INTN pin IRQ.
>> +
>> +  '#interrupt-cells':
>> +    description:
>> +      Specifies the PIN numbers and Flags, as defined in defined in
>> +      include/dt-bindings/interrupt-controller/irq.h
>> +    const: 2
>> +
>> +#PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '^.*$':
>> +    if:
>> +      type: object
>> +      $ref: "/schemas/pinctrl/pincfg-node.yaml"
>> +    then:
> 
> I wish people would stop copying this if/then hack...
> 
> For new bindings, just name your nodes something sensible you can match
> on like '-pins$'.
> 
I always check the newest available yaml that I can find in the same 
folder before writing mine... in this case, it was sm8250-pinctrl.yaml
and I thought that this was the accepted way, since.. that's.. the 
newest one.

By the way, I've fixed it now. I'll send V4 in the evening!
Thank you!

>> +      properties:
>> +        pins:
>> +          description:
>> +            List of gpio pins affected by the properties specified in
>> +            this subnode.
>> +          items:
>> +            pattern: "^gpio([0-9]|1[0-5])$"
>> +          minItems: 1
>> +          maxItems: 16
>> +
>> +        function:
>> +          description:
>> +            Specify the alternative function to be configured for the
>> +            specified pins.
>> +
>> +          enum: [ gpio, pwm ]
>> +
>> +        bias-disable: true
>> +        bias-pull-down: true
>> +        bias-pull-up: true
>> +        drive-open-drain: true
>> +        drive-push-pull: true
>> +        input-enable: true
>> +        output-high: true
>> +        output-low: true
>> +
>> +      required:
>> +        - pins
>> +        - function
>> +
>> +      additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +  - gpio-ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c_node {
>> +        gpio-expander@58 {
>> +                compatible = "awinic,aw9523-pinctrl";
>> +                reg = <0x58>;
>> +                interrupt-parent = <&tlmm>;
>> +                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
>> +                gpio-controller;
>> +                #gpio-cells = <2>;
>> +                gpio-ranges = <&tlmm 0 0 16>;
>> +                interrupt-controller;
>> +                #interrupt-cells = <2>;
>> +                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>> +        };
>> +    };
>> -- 
>> 2.29.2
>>

