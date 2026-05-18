Return-Path: <linux-gpio+bounces-37011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LYlIs+rCmp35gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:03:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A5D566859
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FE03038174
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 06:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CA93DDDAD;
	Mon, 18 May 2026 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="KBLckvtX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0A53DCDB1;
	Mon, 18 May 2026 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084233; cv=none; b=lqOiJNjm3nv++8YRLbdeUQl1sqpiCLNlr4FxUWD798EXCyWZMAMdo0D4/p4hIQnN5+0PThT1cQq/Vcf0ZFUdt5it0RAJoaaPvJpnDA5TWHMMq5dp3E4ereo0wzzEoqkgTBoan9pqEc4ZMD5Xy+cd8reD4MDm0GAwXXBA/4aMOFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084233; c=relaxed/simple;
	bh=naDIk1LmehiyBilvJE7JO9LRVtvJgbRqizOvTJr793M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bjafYKzdq262u2l2gnSDkNpRjC5DY+wdyAeFWb5fSX6WmGBjhx37QLOoDB+h+9jYmJk5yHr+ilu4lriLkOyW1s3KGvgkvp2eOpqSboOqElsXBsXry3cWQyAsIafOPwlg7EeLKmbxswxhVzEMWyZFxwJNw+vseD+dtB0ySXUPNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=KBLckvtX; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=040PPyh4hyNL02s2nYCsjjVPnlanJFo/L
	2eYNDmar4M=; b=KBLckvtXUarQe0WQf2Swb1IaZe+Rj2MX6XC7EfXbYF34q7XpT
	ddIIWfnkx1xXhdJS4nYVYYTJQmR5q+fRILrYNYuR2XT/sblMZVkjZvo3HUaxj5sW
	jxN9QKtYyi1M1BtsyGRnGG0laLIZCNxxVvUXYoFmZeubuA8YVbPPJbunxU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEELUqwpqpLYEAA--.6034S2;
	Mon, 18 May 2026 14:04:04 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260515-fragrant-anyplace-e69a7d3e205d@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
 <20260515-fragrant-anyplace-e69a7d3e205d@wendy>
Date: Mon, 18 May 2026 14:03:23 +0800
Message-Id: <177908420351.2045074.18268079367799334509.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779084203; l=10842;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=naDIk1LmehiyBilvJE7JO9LRVtvJgbRqizOvTJr793M=;
 b=DrQ4DioFQMBAj1WEBHNQoAke5N6P0XKcEgIfBF1H/GgB3DND4Hf7kBMO50owTizi39YwWtoSW
 2XhiaisqCjuAMfTNnJIthn+tXvr6GWd17x6cjEdxT0M4dcwvhYsfd6h
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEELUqwpqpLYEAA--.6034S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrW3Gr1xuw15uryDKw1xZrb_yoWfZrW3pF
	s3GFWrAFW3JF15JrW0qw1UA3ZxCa10kryxGw42qryUCa909F18XFy3Kw43uaykur47ZrW7
	tF15ur1ayay29aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWoFRsMACwAass
X-Rspamd-Queue-Id: C3A5D566859
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37011-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.169.21.40:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ultrarisc.com:email,ultrarisc.com:dkim]
X-Rspamd-Action: no action

On 2026-05-15 11:12 +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 09:18:00AM +0800, Jia Wang wrote:
> > Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++++++++
> >  3 files changed, 240 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..c7ed1f96382a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC DP1000 Pin Controller
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description: |
> > +  UltraRISC RISC-V SoC DP1000 pin controller.
> > +
> > +  The binding supports two child node styles under the same controller
> > +  compatible:
> > +
> > +  - legacy DP1000-specific nodes using phandle-array properties
> > +    `pinctrl-pins` and `pinconf-pins`
> > +  - generic pinctrl nodes using `pins`, `function` and generic pin
> > +    configuration properties
> > +
> > +properties:
> > +  compatible:
> > +    const: ultrarisc,dp1000-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pinctrl-cells":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +patternProperties:
> > +  '.*-pins$':
> > +    type: object
> > +    allOf:
> > +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +    additionalProperties: false
> > +    properties:
> > +      pinctrl-pins:
> > +        description: |
> > +          The list of pins and their mux settings that properties in the node
> > +          apply to. The format: `PORT  PIN  FUNCTION`.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +      pinconf-pins:
> > +        description: |
> > +          The list of pins and their pad configuration that properties in the
> > +          node apply to. The format: `PORT  PIN  CONF`.
> > +          CONF is a DP1000-specific encoding of pull and drive strength as
> > +          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> 
> These two "legacy" properties are not acceptable, sorry.
>

Understood. Will remove pinconf-pins and pinctrl-pins from the binding in v2.
 
> > +      pins:
> > +        description: List of pins affected by this state node.
> > +        minItems: 1
> > +        uniqueItems: true
> > +        items:
> > +          type: string
> > +          pattern: '^(PA([0-9]|1[0-5])|P[BCD][0-7]|LPC([0-9]|1[0-2]))$'
> 
> The regex might be neat, but I don't think that it is very
> user-friendly. It's hard to read this and understand what the pin
> namings actually are. Could you break this down into multiple patterns,
> one for each type of pin?
> I think that would make reading it much simpler.
> 

Will split the pin regex into separate patterns per pin type in v2 for
better readability. Thanks.

> > +
> > +      function:
> > +        description: |
> > +          Mux function to select for the listed pins.
> > +          gpio maps to the hardware default mode. The default mode is
> > +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> > +          func1 is not supported on LPC pins.
> > +        enum:
> > +          - gpio
> 
> > +          - func0
> > +          - func1
> 
> These two do no seem to be very useful to people writing devicetrees.
> What do func0 and func1 represent? I assume that they represent
> something different for different pins? For example, maybe qspi for LPC
> or i2c for PC?
> 

You're right. I'll replace func0 and func1 with descriptive names based
on the actual hardware functions (e.g., uart, i2c, spi) in v2. Thanks.

> pw-bot: changes-requested
> 
> Cheers,
> Conor.
>

Best Regards,
Jia Wang
 
> > +
> > +      bias-disable: true
> > +      bias-high-impedance: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +
> > +      drive-strength:
> > +        description: Output drive strength in mA.
> > +        enum: [20, 27, 33, 40]
> > +
> > +    oneOf:
> > +      - allOf:
> > +          - anyOf:
> > +              - required: [pinctrl-pins]
> > +              - required: [pinconf-pins]
> > +          - not:
> > +              required: [pins]
> > +      - allOf:
> > +          - required: [pins]
> > +          - not:
> > +              anyOf:
> > +                - required: [pinctrl-pins]
> > +                - required: [pinconf-pins]
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinmux@11081000 {
> > +        compatible = "ultrarisc,dp1000-pinctrl";
> > +        reg = <0x0 0x11081000  0x0 0x1000>;
> > +        #pinctrl-cells = <2>;
> > +
> > +        i2c0-pins {
> > +          pins = "PA12", "PA13";
> > +          function = "func0";
> > +          bias-pull-up;
> > +          drive-strength = <33>;
> > +        };
> > +
> > +        uart0-pins {
> > +          pins = "PA8", "PA9";
> > +          function = "func1";
> > +          bias-pull-up;
> > +          drive-strength = <33>;
> > +        };
> > +      };
> > +    };
> > +
> > +  - |
> > +    /* Legacy example */
> > +    #include <dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinmux@11081000 {
> > +        compatible = "ultrarisc,dp1000-pinctrl";
> > +        reg = <0x0 0x11081000  0x0 0x1000>;
> > +        #pinctrl-cells = <2>;
> > +
> > +        i2c0-pins {
> > +          pinctrl-pins = <
> > +            UR_DP1000_IOMUX_A  12  UR_DP1000_FUNC0
> > +            UR_DP1000_IOMUX_A  13  UR_DP1000_FUNC0
> > +          >;
> > +
> > +          pinconf-pins = <
> > +            UR_DP1000_IOMUX_A  12  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> > +                                                  UR_DP1000_DRIVE_DEF)
> > +            UR_DP1000_IOMUX_A  13  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> > +                                                  UR_DP1000_DRIVE_DEF)
> > +          >;
> > +        };
> > +
> > +        uart0-pins {
> > +          pinctrl-pins = <
> > +            UR_DP1000_IOMUX_A  8  UR_DP1000_FUNC1
> > +            UR_DP1000_IOMUX_A  9  UR_DP1000_FUNC1
> > +          >;
> > +
> > +          pinconf-pins = <
> > +            UR_DP1000_IOMUX_A  8   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> > +                                                  UR_DP1000_DRIVE_DEF)
> > +            UR_DP1000_IOMUX_A  9   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> > +                                                  UR_DP1000_DRIVE_DEF)
> > +          >;
> > +        };
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5bf971ff48b2..baaaa46b1a56 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27358,6 +27358,13 @@ S:	Maintained
> >  F:	drivers/usb/common/ulpi.c
> >  F:	include/linux/ulpi/
> >  
> > +ULTRARISC DP1000 PINCTRL DRIVER
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-gpio@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > +F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> > +
> >  ULTRATRONIK BOARD SUPPORT
> >  M:	Goran Rađenović <goran.radni@gmail.com>
> >  M:	Börge Strümpfel <boerge.struempfel@gmail.com>
> > diff --git a/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> > new file mode 100644
> > index 000000000000..bef28115898d
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * UltraRISC DP1000 pinctrl header.
> > + *
> > + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> > +#define _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> > +
> > +/**
> > + * UltraRISC DP1000 IO pad configuration
> > + * port: A, B, C, D, LPC
> > + *     Pin in the port
> > + * pin:
> > + *     PA: 0 - 15
> > + *     PB-PD: 0 - 7
> > + *     LPC: 0 - 12
> > + * func:
> > + *     UR_DP1000_FUNC_DEF: default
> > + *     UR_DP1000_FUNC0: func0
> > + *     UR_DP1000_FUNC1: func1
> > + */
> > +#define UR_DP1000_IOMUX_A		0x0
> > +#define UR_DP1000_IOMUX_B		0x1
> > +#define UR_DP1000_IOMUX_C		0x2
> > +#define UR_DP1000_IOMUX_D		0x3
> > +#define UR_DP1000_IOMUX_LPC		0x4
> > +
> > +#define UR_DP1000_FUNC_DEF		0
> > +#define UR_DP1000_FUNC0			1
> > +#define UR_DP1000_FUNC1			0x10000
> > +
> > +/**
> > + * Configure pull up/down resistor of the IO pin
> > + * UR_DP1000_PULL_DIS: disable pull-up and pull-down
> > + * UR_DP1000_PULL_UP: enable pull-up
> > + * UR_DP1000_PULL_DOWN: enable pull-down
> > + */
> > +#define UR_DP1000_PULL_DIS	0
> > +#define UR_DP1000_PULL_UP	1
> > +#define UR_DP1000_PULL_DOWN	2
> > +/**
> > + * Configure drive strength of the IO pin
> > + * UR_DP1000_DRIVE_DEF: default value, reset value is 2
> > + * UR_DP1000_DRIVE_0: 20mA
> > + * UR_DP1000_DRIVE_1: 27mA
> > + * UR_DP1000_DRIVE_2: 33mA
> > + * UR_DP1000_DRIVE_3: 40mA
> > + */
> > +#define UR_DP1000_DRIVE_DEF	2
> > +#define UR_DP1000_DRIVE_0	0
> > +#define UR_DP1000_DRIVE_1	1
> > +#define UR_DP1000_DRIVE_2	2
> > +#define UR_DP1000_DRIVE_3	3
> > +
> > +/**
> > + * Combine the pull-up/down resistor and drive strength
> > + * pull: UR_DP1000_PULL_DIS, UR_DP1000_PULL_UP, UR_DP1000_PULL_DOWN
> > + * drive: UR_DP1000_DRIVE_DEF, UR_DP1000_DRIVE_0, UR_DP1000_DRIVE_1,
> > + *        UR_DP1000_DRIVE_2, UR_DP1000_DRIVE_3
> > + */
> > +#define UR_DP1000_BIAS(pull, drive)		(((pull) << 2) | (drive))
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H */
> > 
> > -- 
> > 2.34.1
> > 



