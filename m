Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B2E337A7E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 18:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCKRJi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 12:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCKRJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 12:09:33 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066D9C061574;
        Thu, 11 Mar 2021 09:09:33 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b18so2850220wrn.6;
        Thu, 11 Mar 2021 09:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A1ulG8a2x47fhOFnfeZejsOFiRf5o+hdhEZyKWs21wk=;
        b=Yz60SrQVaIu/diCy3ZaQTcun/Ugp2cq+pM9ya8xapEmdSn+YBDRBCsULWrxTDlPr9J
         iTSvVlPIA6zjJsg/DitSm+Lg51ltkV4eeAzDX3OF4Pnwk+oI//ZbC2eoc1Wq3mSTITbQ
         S4f3xrbkb6ahy4wfSifMX67f78PryPs6fLa+4XHcISdO1zNA4vX1CNu7HYumtWpQH7Hi
         rOye5+YTR8s+uEoR8ora0Wg5pOrI+w91gdHye8Dn12R3WxB2TlC1BGOqrgmX30Tp6m8S
         hyV99ZK53xs1csIUXe6C0/lEwr6HILrv2us6pGYLzssG/UQRxegGJVtfkVyGmWaqDlox
         CW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1ulG8a2x47fhOFnfeZejsOFiRf5o+hdhEZyKWs21wk=;
        b=paTrZ69grvJYfRt+ouQIwZ4+SewhWMoSTqGCy0+5L1WgnakQ5NTQeFuisxIq9lq1SK
         gCF1ffmETQ78dzYeshtXXbFXVX543Gcm8ZLZFQ9oPFTGNKqKBWlkIVFR6IKg8uFiEGLH
         Ajlc1tLIDaeAqbpwwu260kMCTQGCtp7tubxgrC3vNi9bdicJv3rmcJjWa2H2I17NCzFs
         2iSfgqEEx2lUW09AJrCNoQyVRidRQiwv4ZRB0U7zyLmlyiTbFZ8n67+NERKc1ZMYexNO
         vS53iUvEoLlaavooz6XWiri8aOzwIG8nzM8bWJi5dkDObDZ6M78IW9xbzfKeBj7Bj4ZM
         WHPQ==
X-Gm-Message-State: AOAM531ve/WqBfe114CP+UF18b2+eoZ49IM/c5XDJybbMbYoNINzfWvK
        gC6sgxbtbxlRgy5IH+YoJ0I=
X-Google-Smtp-Source: ABdhPJzin3YJTob2zsRrxPaa6bNvrIq40Q3G4iLem7bp7g8BoIB7t5PpD82soggto6cDwnXDDgxRmg==
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr9434596wrw.415.1615482571582;
        Thu, 11 Mar 2021 09:09:31 -0800 (PST)
Received: from [192.168.1.10] ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id n186sm4440809wmn.22.2021.03.11.09.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 09:09:31 -0800 (PST)
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding
 documentation
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
 <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
 <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com>
 <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <90994df6-9d7d-686f-8668-a1cf5267aa16@gmail.com>
Date:   Thu, 11 Mar 2021 18:09:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

El 10/03/2021 a las 21:52, Rob Herring escribió:
> On Wed, Mar 10, 2021 at 12:10 PM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
>>
>> Hi Rob,
>>
>>> El 10 mar 2021, a las 19:45, Rob Herring <robh+dt@kernel.org> escribió:
>>>
>>> On Wed, Mar 10, 2021 at 11:03 AM Álvaro Fernández Rojas
>>> <noltari@gmail.com> wrote:
>>>>
>>>> Hi Rob,
>>>>
>>>>> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> escribió:
>>>>>
>>>>> On Wed, Mar 10, 2021 at 5:55 AM Álvaro Fernández Rojas
>>>>> <noltari@gmail.com> wrote:
>>>>>>
>>>>>> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
>>>>>>
>>>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>>>>> ---
>>>>>> v6: add changes suggested by Rob Herring
>>>>>> v5: change Documentation to dt-bindings in commit title
>>>>>> v4: no changes
>>>>>> v3: add new gpio node
>>>>>> v2: remove interrupts
>>>>>>
>>>>>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++++++
>>>>>> 1 file changed, 174 insertions(+)
>>>>>> create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..471f6efa1754
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>> @@ -0,0 +1,174 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Broadcom BCM6328 pin controller
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Álvaro Fernández Rojas <noltari@gmail.com>
>>>>>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>>>>>> +
>>>>>> +description: |+
>>>>>> +  The pin controller node should be the child of a syscon node.
>>>>>> +
>>>>>> +  Refer to the the bindings described in
>>>>>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: brcm,bcm6328-pinctrl
>>>>>> +
>>>>>> +  gpio:
>>>>>> +    type: object
>>>>>> +    properties:
>>>>>> +      compatible:
>>>>>> +        const: brcm,bcm6328-gpio
>>>>>> +
>>>>>> +      data:
>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +        description: |
>>>>>> +          Offset in the register map for the data register (in bytes).
>>>>>> +
>>>>>> +      dirout:
>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +        description: |
>>>>>> +          Offset in the register map for the dirout register (in bytes).
>>>>>> +
>>>>>> +      gpio-controller: true
>>>>>> +
>>>>>> +      "#gpio-cells":
>>>>>> +        const: 2
>>>>>> +
>>>>>> +      gpio-ranges:
>>>>>> +        maxItems: 1
>>>>>> +
>>>>>> +    required:
>>>>>> +      - gpio-controller
>>>>>> +      - gpio-ranges
>>>>>> +      - '#gpio-cells'
>>>>>> +
>>>>>> +    additionalProperties: false
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  '^.*-pins$':
>>>>>> +    if:
>>>>>> +      type: object
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        function:
>>>>>> +          $ref: "pinmux-node.yaml#/properties/function"
>>>>>> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
>>>>>> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
>>>>>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
>>>>>> +
>>>>>> +        pins:
>>>>>> +          $ref: "pinmux-node.yaml#/properties/pins"
>>>>>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
>>>>>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
>>>>>> +                  usb_port1 ]
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - gpio
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    gpio_cntl@10000080 {
>>>>>> +      compatible = "brcm,bcm6328-gpio-controller", "syscon", "simple-mfd";
>>>>>
>>>>> You just added "brcm,bcm6328-gpio-controller", it would need to be documented.
>>>>
>>>> I just added that because you requested me to do it ¯\_(ツ)_/¯
>>>
>>> I said 'syscon' by itself was not allowed, then asked about the multiple levels.
>>
>> Why not?
> 
> Because 'syscon' alone doesn't mean anything and doesn't describe what
> registers it contains. You need something that says this is the XYZ
> block in the ABC SoC.
> 
>> What if you have several controllers inside a syscon?
> 
> You either just add properties (e.g. just add #clock-cells and it's a
> clock provider) or you have child nodes. Which one you do generally
> depends on if the providers have DT resources themselves.
> 
>> The root should also have “something" in it?
>>
>>>
>>>> What should I do to document it?

You didn't answer my question about adding documentation...

An example driver which adds a custom compatible string and doesn't 
document it:
https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f98372ac778/Documentation/devicetree/bindings/clock/sprd%2Csc9863a-clk.yaml#L90

>>>> I still don’t get most of this .yaml stuff...
>>>>
>>>>>
>>>>>> +      reg = <0x10000080 0x80>;
>>>>>> +
>>>>>> +      pinctrl: pinctrl {
>>>>>> +        compatible = "brcm,bcm6328-pinctrl";
>>>>>> +
>>>>>> +        gpio {
>>>>>> +          compatible = "brcm,bcm6328-gpio";
>>>>>
>>>>> I'm still trying to understand why you need 3 levels of nodes here?
>>>>> The gpio controller contains a pin controller plus other undefined
>>>>> functions (because of 'syscon') and the pin controller contains a gpio
>>>>> controller?
>>>>
>>>> In previous versions the gpio controller was registered along with the pin controller, but @Linus requested me to register the gpio pin controller ranges through device tree by using gpio-ranges and I decided to use this approach, which was already used by other pin controllers.
>>>> However, there aren’t any pinctrl drivers using gpio-regmap, so this is kind of new…
>>>>
>>>>>
>>>>> I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
>>>>> should be a single node.
>>>>
>>>> I agree, but does it make sense to add gpio-ranges to a pinctrl node referencing itself?
>>>
>>> It wouldn't be. I wasn't saying the pinctrl and gpio controller are
>>> the same node. My suggestion was combining syscon and pinctrl.
>>
>> But that wouldn’t be correct if there were more “things” inside the syscon, right?
> 
> Right.
> 
>>>> Something like:
>>>> syscon {
>>>
>>> Again with the syscon. If pinctrl and GPIO are the only functions
>>> within this h/w block, then this is not a syscon. You are just abusing
>>> that having 'syscon' compatible means you get a regmap created
>>> automagically for you. Nothing here looks like a 'system controller'
>>> to me. A 'system controller' is a random collection of register bits
>>> with functions that don't fit anywhere else.
>>
>> pinctrl and GPIO aren’t the only functions within this HW block.
>> Maybe I didn’t document/code it properly, but I’m sure I’m not abusing what a system controller is.
> 
> Okay, that's the detail missing from this patch.
> 
>> Please, take a look at http://www.datashed.science/misc/bcm/gpl/broadcom-sdk-416L05/shared/opensource/include/bcm963xx/6328_map_part.h:
>> typedef struct GpioControl {
>>      uint32      GPIODirHi;                  /* 0 */
>>      uint32      GPIODir;                    /* 4 */
>>      uint32      GPIOioHi;                   /* 8 */
>>      uint32      GPIOio;                     /* C */
>>      uint32      unused0;                    /* 10 */
>>      uint32      SpiSlaveCfg;                /* 14 */
>>      uint32      GPIOMode;                   /* 18 */
>>      uint64      PinMuxSel;                  /* 1C */
>>      uint32      PinMuxSelOther;             /* 24 */
>>      uint32      TestControl;                /* 28 */
>>      uint32      unused2;                    /* 2C */
>>      uint32      RoboSWLEDControl;           /* 30 */
>>      uint32      RoboSWLEDLSR;               /* 34 */
>>      uint32      unused3;                    /* 38 */
>>      uint32      RoboswEphyCtrl;             /* 3C */
>>      uint32      RoboswSwitchCtrl;           /* 40 */
>>      uint32      RegFileTmCtl;               /* 44 */
>>      uint32      RingOscCtrl0;               /* 48 */
>>      uint32      RingOscCtrl1;               /* 4C */
>>      uint32      unused4[6];                 /* 50 - 64 */
>>      uint32      DieRevID;                   /* 68 */
>>      uint32      unused5;                    /* 6c */
>>      uint32      DiagSelControl;             /* 70 */
>>      uint32      DiagReadBack;               /* 74 */
>>      uint32      DiagReadBackHi;             /* 78 */
>>      uint32      DiagMiscControl;            /* 7c */
>> } GpioControl;
>>
>> So we’re using GPIODirHi, GPIODir, GPIOioHi and GPIOio registers for GPIO regmap driver.
>> And we’re using GPIOMode, PinMuxSel (u64 -> x2 u32), PinMuxSelOther for pinctrl driver.
>> And this is for BCM6328, but some of the other SoCs are even more scattered.
> 
> So based on this I'd do something like this:
> 
> syscon {
>    reg = <base 0x80>;
>    ranges = <0 base 0x80>;
>    pinctrl@18 {
>      reg = <0x18 0x10>;
>      foo-pins {};
>    gpio@0 {
>      reg = <0x0 0x10>;
>    };
> };

You're missing a "};", so I'm not sure if you want me to go this way (1):
syscon {
	compatible = "brcm,bcm6328-gpio-regs", "syscon", "simple-mfd";
	reg = <0x10000080 0x80>;
	ranges = <0 0x10000080 0x80>;

	gpio: gpio@0 {
		compatible = "brcm,bcm6328-gpio";
		reg = <0x0 0x10>;

		data = <0xc>;
		dirout = <0x4>;

		gpio-controller;
		gpio-ranges = <&pinctrl 0 0 32>;
		#gpio-cells = <2>;
	};

	pinctrl: pinctrl@18 {
		compatible = "brcm,bcm6328-pinctrl";
		reg = <0x18 0x10>;

		foo-pins {};
		...
	};
};

Or this way (2):
syscon {
	compatible = "brcm,bcm6328-gpio-regs", "syscon", "simple-mfd";
	reg = <0x10000080 0x80>;
	ranges = <0 0x10000080 0x80>;

	pinctrl: pinctrl@18 {
		compatible = "brcm,bcm6328-pinctrl";
		reg = <0x0 0x28>;

		gpio: gpio@0 {
			compatible = "brcm,bcm6328-gpio";
			reg = <0x0 0x10>;

			data = <0xc>;
			dirout = <0x4>;

			gpio-controller;
			gpio-ranges = <&pinctrl 0 0 32>;
			#gpio-cells = <2>;
		};

		foo-pins {};
		...
	};
};

> 
> If things are more scattered within gpio or pinctrl, then maybe you
> need multiple reg entries. Whether the OS uses 'reg' and mmio or a
> regmap from the syscon is up to you. That's independent of the
> binding.
> 
>>>>         pinctrl: pinctrl {
>>>>                 compatible …
>>>>
>>>>                 gpio-controller;
>>>>                 gpio-ranges = <&pinctrl 0 0 32>;
>>>>                 #gpio-cells = <2>;
>>>
>>> I was assuming you have multiple GPIO controllers within 1 pinctlr?
>>> The pinctrl and gpio could be a single node like above if there's only
>>> 1 GPIO controller. But I'm still somewhat guessing what the h/w looks
>>> like because I have to go searching thru the driver to decipher.
>>> Please describe the h/w in the binding.
>>
>> GPIO dirout and data rely on 2x u32 registers or a single u64 register.
>> This is can be either be implemented as a single GPIO controller, or as 2 separate GPIO controllers.
>> However, since I’m overriding reg_mask_xlate with bcm63xx_reg_mask_xlate I can register it as a single GPIO controller, which makes more sense to me.
> 
> I think 1 makes more sense.
> 
> Rob
> 

Best regards,
Álvaro.
