Return-Path: <linux-gpio+bounces-10369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316597E94C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98381F21EAC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDA195390;
	Mon, 23 Sep 2024 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="exkjM6cH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41C26BFA3;
	Mon, 23 Sep 2024 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085862; cv=none; b=kUOSC4OT6zjj5mLiJm1oZ7Dpis7hInvEP13TcsBhIenbW0gk/dhW3Nsw+9NX+Df4wYnNwzNJ/SLNuGujw0q7yb/veXixoYg4yKjJuf6oFq5UTlEbQHvjK1aI9qnY+Nef6W36S16KwsSMjTBOm0yOPaPp0x0dVYk2rNllugeaVDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085862; c=relaxed/simple;
	bh=n9V4KqCf25Lnq9DkKmw0iowk10dheuDSj2TPGJAsOUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bpd0dZIFJb0sFqa2tv2d43YR0PPBUQZp5eA0edb40Mz96D7jkCOL+EAwea8fpKMTcbqoGKaKyqeV4rlLWtk8EJxFWIooax0ZvoERCnmTDavygXD8ubn6rQ3L3c0gkFGNeclx8Tfoc4fVhbM1bhnP2zyWab4tzKSU2Kf+CfBt6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=exkjM6cH; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=ryrNTnBObv+2rQkEsJDfbBq2naG6AaoqUBl0vxgeKjk=;
	b=exkjM6cHc5QSF/M7C65wteZk8D1FqdEY363xznXKV62nDASPPhXY+0oENY+GeL
	Csn7l5XUrKM2bWihGHnU+0MU78e+3S3DfK5EWiw1AK6sVDdb3wRsxMrSoF0wPH6P
	GQitUF/4jO8cCDPqij8piA2xqO3OIH03C0Q833nxYRosA=
Received: from [192.168.31.242] (unknown [27.18.197.191])
	by gzsmtp2 (Coremail) with SMTP id sSgvCgDnU7p0PPFmZNLEBw--.28765S2;
	Mon, 23 Sep 2024 18:01:27 +0800 (CST)
Message-ID: <521a14e0-cb85-419d-87ea-1848b119c86d@163.com>
Date: Mon, 23 Sep 2024 18:01:25 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/3] dt-bindings: pinctrl: Add support for
 canaan,k230 SoC
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064225.316863-1-18771902331@163.com>
 <20240918171320.GA1810164-robh@kernel.org>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <20240918171320.GA1810164-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:sSgvCgDnU7p0PPFmZNLEBw--.28765S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWUCw13AF1fKrW5XrW8Zwb_yoWruFy3pF
	ZxKa98KF18XF47t3yxt3W8uF1aqFs7Ar4xKryUKry7ta909F1xKrWakr48WFs5urn7Jw12
	vFWjgry29w48ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UOzV8UUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJwBjombxPCUHAwAAss

On 9/19/24 1:13 AM, Rob Herring wrote:
> On Mon, Sep 16, 2024 at 02:42:23PM +0800, Ze Huang wrote:
>> Add device tree binding details for Canaan K230 pinctrl device.
>>
>> Signed-off-by: Ze Huang <18771902331@163.com>
>> ---
>>   .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..979c5bd71e3d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/canaan,k230-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan Kendryte K230 Pin Controller
>> +
>> +maintainers:
>> +  - Ze Huang <18771902331@163.com>
>> +
>> +description:
>> +  The Canaan Kendryte K230 platform includes 64 IO pins, each capable of
>> +  multiplexing up to 5 different functions. Pin function configuration is
>> +  performed on a per-pin basis.
>> +
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      A pinctrl node should contain at least one subnode representing the
>> +      pinctrl groups available on the machine.
>> +
>> +    patternProperties:
>> +      '-cfg$':
>> +        type: object
>> +        $ref: /schemas/pinctrl/pincfg-node.yaml
>> +        additionalProperties: false
>> +        description:
>> +          Each subnode will list the pins it needs, and how they should
>> +          be configured, with regard to muxer configuration, bias, input
>> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
>> +          slew-rate, drive strength.
>> +
>> +        properties:
>> +          pinmux:
>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> Drop. You need to add a $ref to pinmux-node.yaml (alongside
> pincfg-node.yaml).

OK. will use a allOf like this:

patternProperties:
   '-cfg$':
   type: object
   allOf:
     - $ref: /schemas/pinctrl/pincfg-node.yaml#
     - $ref: /schemas/pinctrl/pinmux-node.yaml#

>
>> +            description:
>> +              The list of GPIOs and their mux settings that properties in
>> +              the node apply to. This should be set with the macro
>> +              'K230_PINMUX(pin, mode)'
>> +
>> +          bias-disable: true
>> +
>> +          bias-pull-up: true
>> +
>> +          bias-pull-down: true
>> +
>> +          drive-strength:
>> +            minimum: 0
>> +            maximum: 15
>> +
>> +          input-enable: true
>> +
>> +          output-enable: true
>> +
>> +          input-schmitt-enable: true
>> +
>> +          slew-rate:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop. Already has a defined type.

Acknowledged.

>
>> +            description: |
>> +              slew rate control enable
>> +              0: disable
>> +              1: enable
>> +
>> +            enum: [0, 1]
>> +
>> +          power-source:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop. Already has a defined type.

Acknowledged.

>
>> +            description: |
>> +              Specifies the power source voltage for the IO bank that the
>> +              pin belongs to. Each bank of IO pins operate at a specific,
>> +              fixed voltage levels. Incorrect voltage configuration can
>> +              damage the chip. The defined constants represent the
>> +              possible voltage configurations:
>> +
>> +              - K230_MSC_3V3 (value 0): 3.3V power supply
>> +              - K230_MSC_1V8 (value 1): 1.8V power supply
>> +
>> +              The following banks have the corresponding voltage
>> +              configurations:
>> +
>> +              - bank IO0 to IO1: Fixed at 1.8V
>> +              - bank IO2 to IO13: Fixed at 1.8V
>> +              - bank IO14 to IO25: Fixed at 1.8V
>> +              - bank IO26 to IO37: Fixed at 1.8V
>> +              - bank IO38 to IO49: Fixed at 1.8V
>> +              - bank IO50 to IO61: Fixed at 3.3V
>> +              - bank IO62 to IO63: Fixed at 1.8V
>> +
>> +            enum: [0, 1]
>> +
>> +        required:
>> +          - pinmux
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pinctrl: pinctrl@91105000 {
> Drop unused labels.

Will do.

>
>> +        compatible = "canaan,k230-pinctrl";
>> +        reg = <0x91105000 0x100>;
>> +
>> +        uart2_pins: uart2-pins {
>> +            uart2-pins-cfg {
>> +                pinmux = <0x503>, /* uart2 txd */
>> +                         <0x603>; /* uart2 rxd */
>> +                slew-rate = <0>;
>> +                drive-strength = <4>;
>> +                power-source = <1>;
>> +                input-enable;
>> +                output-enable;
>> +                bias-disable;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.46.1
>>


