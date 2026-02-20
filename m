Return-Path: <linux-gpio+bounces-31949-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANIuMeE0mGn/CgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31949-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:18:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23381166C22
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 11:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B73293069986
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CE933C50D;
	Fri, 20 Feb 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqJwOIzW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571233C1B6;
	Fri, 20 Feb 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582626; cv=none; b=U+u8dPTRlm9DUAHmAykzq5LffYGGvr2dXUBgI11AjeSbwvYJxNUd8eTXUl+hfQDHu3yOUE3n76AWaBvmPG1X0YMhOddc3E4Mf3qR1n9nmLGMhBUfpODqGMai+6vaskDf6MtcHVfZ2zKQT708VBFH9b+CqjUgzxuUprRPyZRSJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582626; c=relaxed/simple;
	bh=DwJRqwTIxPH4O6waaaWkmQc1GediIB0SchBhEhcUMf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMcMpy4b+DAmOemEGEGbJT64NHcErw0iZB5Ue5Vi+A3arnvtIxHMftKdwaKDV3xyDSiYNykHAeYsRsNel/Bwz6zPzP6IVhcFBC7MUAwT7CSp/Vdf7Ri2tCxnIevnZT2IpG9i/PY1hYudeSse8KUQcL3sAsYt9QyL3B8VhhH2ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqJwOIzW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67917C116D0;
	Fri, 20 Feb 2026 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771582626;
	bh=DwJRqwTIxPH4O6waaaWkmQc1GediIB0SchBhEhcUMf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uqJwOIzWN+T6wPgd8AKTu2b9HuLG1WazY+eZbbLoQF4YGr9jtksWgUNv84WxT8uws
	 2aL2TV6mrWsFt5LUdwnxL19wEz5mltZHnYAGgIVPP0GuorDih2fY1z2EzW2LCVPLhc
	 Ntvs7TCFBE+VPdGvxq1GsRGNP13X+BP2IzT21I2+UbHzgfMoSHyp1hTOnH4xTjb4mL
	 Qhw1hge6i0CxrqkQzqDfesNW6evho36iLwI8x7OoLPymOPdY3m1CSS/VwYqs5+uVs9
	 /oPlMJLScpPxxjddiAq0XHhQlXW+HAscwFm+QzABg2SCnTu5K41aZIv7Npzhm9jYdJ
	 GQXSsD/uWNnow==
Message-ID: <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
Date: Fri, 20 Feb 2026 11:16:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>,
 Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Vincent Guittot devicetree @ vger . kernel . org"
 <vincent.guittot@linaro.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31949-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[2.159.138.16:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,4009c000:email]
X-Rspamd-Queue-Id: 23381166C22
X-Rspamd-Action: no action

On 19/02/2026 12:36, Khristine Andreea Barbulescu wrote:
>>
>>> +      reg:
>>> +        maxItems: 1
>>
>> You have 'reg' so the node name should have unit-address.
>>
>> However, there's not any real DT resources in this child node, so you 
>> should just drop it.
>>
> 
> For context, SIUL2 exposes a set of platform‑capability and SoC identification registers that are split across the two discontiguous ranges: SIUL2-0 and SIUL2-1. These registers are the source of SoC information (e.g. identification and capability flags) that other subsystems are expected to consume (e.g. PCI Express). Because those fields are physically divided between the two SIUL2 ranges, consumers need reliable access to both ranges to correctly discover and configure the platform.
> 
> Hence, my proposal is to keep the two 'syscon' child nodes.

Please wrap your replies correctly, so this will be easily parseable.

I do not understand the reasoning. If you have two register ranges, you
have two <reg> entries and having a child node has nothing to do with it.

> 
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +  "-hog(-[0-9]+)?$":
>>> +    required:
>>> +      - gpio-hog
>>> +
>>> +  "-pins$":
>>> +    type: object
>>> +    additionalProperties: false
>>> +
>>> +    patternProperties:
>>> +      "-grp[0-9]$":
>>> +        type: object
>>> +        allOf:
>>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
>>> +        description:
>>> +          Pinctrl node's client devices specify pin muxes using subnodes,
>>> +          which in turn use the standard properties below.
>>> +
>>> +        properties:
>>> +          pinmux:
>>> +            description: |
>>> +              An integer array for representing pinmux configurations of
>>> +              a device. Each integer consists of a PIN_ID and a 4-bit
>>> +              selected signal source(SSS) as IOMUX setting, which is
>>> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
>>> +
>>> +          slew-rate:
>>> +            description: Supported slew rate based on Fmax values (MHz)
>>> +            enum: [83, 133, 150, 166, 208]
>>> +        required:
>>> +          - pinmux
>>> +
>>> +        unevaluatedProperties: false
>>> +
>>> +required:
>>> +  - compatible
>>> +  - gpio-controller
>>> +  - "#gpio-cells"
>>> +  - gpio-ranges
>>> +  - interrupts
>>> +  - interrupt-controller
>>> +  - "#interrupt-cells"
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - ranges
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    pinctrl@4009c000 {
>>> +      compatible = "nxp,s32g2-siul2";
>>> +      gpio-controller;
>>> +      #gpio-cells = <2>;
>>> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
>>> +      interrupt-controller;
>>> +      #interrupt-cells = <2>;
>>> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
>>> +      #address-cells = <1>;
>>> +      #size-cells = <1>;
>>> +      ranges;
>>> +
>>> +      siul2_0: siul2_0@4009c000 {
>>> +        compatible = "syscon";
>>> +        reg = <0x0 0x4009c000 0x0 0x179c>;
>>> +      };
>>> +
>>> +      siul2_1: siul2_1@44010000 {
>>> +        compatible = "syscon";
>>> +        reg = <0x0 0x44010000 0x0 0x17b0>;
>>> +      };
>>> +
>>> +      jtag-pins {
>>> +        jtag-grp0 {
>>> +          pinmux = <0x0>;
>>> +          input-enable;
>>> +          bias-pull-up;
>>> +          slew-rate = <166>;
>>> +        };
>>> +      };
>>> +    };
>>> +...
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>> index a24286e4def6..332397a21394 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>>> @@ -11,6 +11,8 @@ maintainers:
>>>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>>>    - Chester Lin <chester62515@gmail.com>
>>>  
>>> +deprecated: true
>>> +
>>
>> I don't really see why you can't just extend this binding with GPIO and 
>> interrupt provider properties.
> 
> The existing SIUL2 pinctrl binding only describes the MSCR/IMCR registers and treats SIUL2 as a standalone pinctrl block. This is incomplete and does not correctly represent the SIUL2 hardware, which also provides GPIO control, interrupt configuration, and MIDR identification registers across two register windows. Extending the old binding would require incompatible ABI changes and would result in carved-out subregions, which is discouraged.

Can you just add missing register ranges to existing device? I really do
not see how this is incompatible ABI or how does it result in carved-out
regions.


Best regards,
Krzysztof

