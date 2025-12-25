Return-Path: <linux-gpio+bounces-29882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE565CDD7A5
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 09:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F7623012274
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 08:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638122FF14C;
	Thu, 25 Dec 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NFjI0geC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973176.qiye.163.com (mail-m1973176.qiye.163.com [220.197.31.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87C2BAF7;
	Thu, 25 Dec 2025 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766649635; cv=none; b=SqVmFbLg+IcaznZRY4qCQrt25C3o86KddaAwlvV74h3Yeb+UoZMy1IUCVWKoukWyK9auG6Q8awfOyr2pfzLBJRSysoTGGaPEYtQutmMYpA2ehKJRyBEucQRtZq8yFkVtiYU0Qz63RCQfSgl0XDm43iMZz+gm6UEzsDLEoYqjuZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766649635; c=relaxed/simple;
	bh=EmMPBHNv8l7FpfGgiRztcQEpH94ZVLtbmS2k25v7eAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiJr1rbi3/0cgOCIPt94BwaFEcXHsT58wZ4PvgXa+j49M+iTDvELDRFAHa7DMa6wOL6CN648nuSn3blJ4lU3eY2vztI2AV+iQEA+aA/WVoAUArLaB6sRiglBF9G27gmhuqkIcDdcFjFtez+/36upk5hD8dngTFgjFbEWKO7+Jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NFjI0geC; arc=none smtp.client-ip=220.197.31.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e853b369;
	Thu, 25 Dec 2025 14:44:42 +0800 (GMT+08:00)
Message-ID: <74125120-5d62-41b6-9c3a-904f1565fc95@rock-chips.com>
Date: Thu, 25 Dec 2025 14:44:41 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com>
 <5154ca76-0f23-4b52-8e6d-07005c52ac6d@kernel.org>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <5154ca76-0f23-4b52-8e6d-07005c52ac6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5440a75109d8kunmbea0253a543cec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNMGFYdGE0fQ0IeSR9KSxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NFjI0geCArm106vmwFhIZvbaRsfE1lvwDxXf2qGfk/DvqY5KIuxxmY3fxZlkO74srT92FNlZJ/CSUg5JE0CEF57lUAkMtozTYTsOe1Z8arcZZWCM5tCJqCkobDFSJE93twRIXkGA174W8qdh7CAmacOGPUvB+dXhJnEKOBMLGyI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=nKEoDfhyi2StAxkLL8XvpoJq5Ra7z8/ASNkBN5tze50=;
	h=date:mime-version:subject:message-id:from;


在 2025/12/16 23:52, Krzysztof Kozlowski 写道:
> On 16/12/2025 12:20, Ye Zhang wrote:
>> 1. Add header file with constants for RMIO function IDs for the Rockchip
>> RK3506 SoC.
>> 2. Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
>> which is a sub-device of the main pinctrl on some Rockchip SoCs.
>>
>> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
>> ---
>>   .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>>   .../bindings/pinctrl/rockchip,rmio.yaml       | 106 +++++++++++++++++
>>   .../pinctrl/rockchip,rk3506-rmio.h            | 109 ++++++++++++++++++
>>   3 files changed, 224 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>>   create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> index 97960245676d..9a27eaf7942b 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> @@ -82,6 +82,15 @@ required:
>>     - rockchip,grf
>>   
>>   patternProperties:
>> +  "rmio[0-9]*$":
>> +    type: object
>> +
>> +    $ref: "/schemas/pinctrl/rockchip,rmio.yaml#"
>> +
>> +    description:
>> +      The RMIO (Rockchip Matrix I/O) controller node which functions as a
>> +      sub-device of the main pinctrl to handle flexible function routing.
> No. Your child has no resources, so it's not proper hardware
> representation. Don't use Linux driver model in the bindings.
>
> That's a NAK. Don't send the same AGAIN without addressing comments like
> you did here.
I understand your point now.  In v4, I will remove rockchip,rmio. yaml 
and drop the separate RMIO child node entirely.
Instead of creating a fake device node, I will use a phandle property 
within the main pinctrl node to reference the GRF/PMU syscon that 
contains the RMIO registers.  For example:
rockchip,rmio-grf = <&rmio_grf>;
The fixed parameters (like offset and pin count) will be moved into the 
driver code.
>> +
>>     "gpio@[0-9a-f]+$":
>>       type: object
>>   
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>> new file mode 100644
>> index 000000000000..af0b34512fb9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
>> @@ -0,0 +1,106 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RMIO (Rockchip Matrix I/O) Controller
>> +
>> +maintainers:
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description: |
>> +  The RMIO controller provides a flexible routing matrix that allows mapping
>> +  various internal peripheral functions (UART, SPI, PWM, etc.) to specific
>> +  physical pins. This block is typically a sub-block of the GRF
>> +  (General Register Files) or PMU (Power Management Unit).
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - rockchip,rk3506-rmio
>> +      - const: rockchip,rmio
> I don't see how pinctrl deserves generic compatible. I already commented
> on this.
In v4, I will remove the generic compatible string rockchip,rmio and 
rely solely on the specific compatible.  Since the separate RMIO node is 
being removed (as per the point above), this compatible issue will 
naturally be resolved as the logic moves into the main driver.
>
>> +
>> +  rockchip,rmio-grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of the syscon node (GRF or PMU) containing the RMIO registers.
>> +      This property is required if the RMIO registers are located in a different
>> +      syscon than the parent pinctrl node.
> Why "if"? How this can be flexible?
>
> Anyway, you did not address my previous comment at all.
>
> NAK
The description will be corrected to"Phandles to the GRF/PMU syscons 
containing the RMIO registers. These are required to access the RMIO 
controller registers"

>> +
>> +  rockchip,offset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The offset of the RMIO configuration registers within the GRF.
> No, this belongs to the phandle.
>
> Look how this is already described and do not come with other style.
In v4, I will remove rockchip,rmio. yaml

>> +
>> +  rockchip,pins-num:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The number of physical pins supported by this RMIO instance.
>> +      Used for boundary checking and driver initialization.
>> +
>> +patternProperties:
>> +  "^[a-z0-9-]+$":
> No, use a prefix or suffix. See other pinctrl bindings.
In v4, I will remove rockchip,rmio. yaml

>> +    type: object
>> +    description:
>> +      Function node grouping multiple groups.
>> +
>> +    patternProperties:
>> +      "^[a-z0-9-]+$":
> Same ocmment
>
>> +        type: object
>> +        description:
>> +          Group node containing the pinmux configuration.
>> +
>> +        properties:
>> +          rockchip,rmio:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +            description:
>> +              A list of pin-function pairs. The format is <pin_id function_id>.
>> +            minItems: 1
>> +            items:
>> +              items:
>> +                - description: RMIO Pin ID (0 to pins-num - 1)
>> +                  minimum: 0
>> +                  maximum: 31
>> +                - description: Function ID
>> +                  minimum: 0
>> +                  maximum: 98
>> +
>> +        required:
>> +          - rockchip,rmio
> Why aren't you using standard pinctrl bindings?
The standard pinmux binding is not suitable here because RMIO acts as a 
secondary layer of muxing, distinct from the primary IOMUX.
The primary IOMUX (handled by rockchip,pins) routes the pin to the RMIO 
block, while the RMIO configuration determines the specific function 
within that block.
In v4, I plan to define rockchip,rmio as a supplemental vendor-specific 
property within the pin group, formatted as <rmio_id rmio_pin_id 
rmio_function>.

For example:

&pinctrl {
         rm_io24 {
                 /omit-if-no-ref/
                 rm_io24_uart1_tx: rm-io24-uart1-tx {
                         rockchip,pins =
                                 <1 RK_PB1 16 &pcfg_pull_none>;
                         rockchip,rmio =
                                 <0 24 RMIO_UART1_TX>;
                 };
};

>> +
>> +        additionalProperties: false
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - rockchip,rmio-grf
>> +  - rockchip,offset
>> +  - rockchip,pins-num
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
>> +
>> +    pinctrl: pinctrl {
> What's this?
In v4, I will remove rockchip,rmio. yaml
>> +        rmio: rmio {
>> +            compatible = "rockchip,rk3506-rmio", "rockchip,rmio";
>> +            rockchip,rmio-grf = <&grf_pmu>;
>> +            rockchip,offset = <0x80>;
>> +            rockchip,pins-num = <32>;
>> +
>> +            rmio-uart {
>> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
>> +                    rockchip,rmio = <27 RMIO_UART1_TX>;
>> +                };
>> +
>> +                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
>> +                    rockchip,rmio = <28 RMIO_UART1_RX>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
>> new file mode 100644
>> index 000000000000..b129e9a8c287
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
>> @@ -0,0 +1,109 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>> +/*
>> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
>> +#define __DT_BINDINGS_PINCTRL_ROCKCHIP_RK3506_RMIO_H
>> +
>> +/* RMIO function definition */
>> +#define RMIO_UART1_TX			1
>> +#define RMIO_UART1_RX			2
>> +#define RMIO_UART2_TX			3
>> +#define RMIO_UART2_RX			4
>> +#define RMIO_UART3_TX			5
>> +#define RMIO_UART3_RX			6
>> +#define RMIO_UART3_CTSN			7
>> +#define RMIO_UART3_RTSN			8
>> +#define RMIO_UART4_TX			9
>> +#define RMIO_UART4_RX			10
>> +#define RMIO_UART4_CTSN			11
>> +#define RMIO_UART4_RTSN			12
>> +#define RMIO_MIPITE			13
>> +#define RMIO_CLK_32K			14
>> +#define RMIO_I2C0_SCL			15
>> +#define RMIO_I2C0_SDA			16
>
> I do not see how this is a binding. Please point me to the patch using
> this in the driver.
These macros are intended to be used in the Device Tree sources to 
improve readability, avoiding “magic numbers” for the RMIO function IDs.

For example, instead of writing <0 24 1>, the DTS uses <0 24 
RMIO_UART1_TX>, which is much clearer.

in v4, I will provide the relevant dts
> Best regards,
> Krzysztof
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

