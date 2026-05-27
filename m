Return-Path: <linux-gpio+bounces-37547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKhcI2FKFmrZkQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 03:35:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E835DE41C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 03:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E5453042591
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 01:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3F3128CA;
	Wed, 27 May 2026 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="knUVH0ZH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39EE218ADD;
	Wed, 27 May 2026 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779845710; cv=none; b=ZnrRKikQBK78d4aLI2evoyL3Pj/mo1hF6tp+K1JRn+rw/Ow+AJcNn/o+iqsu91Jz1DvSZr644R8DEPjHZscCq1+tYdcSi3bryLb1LFgqB5NJ3+UpXo9GQDbFtMh08FHTnSo1u1ZfzautYPAc6o4g6wRy5P/+OkAqeDRjC0CksSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779845710; c=relaxed/simple;
	bh=1ykZA9SrzvON5lsTf6WfJV0amL1FpZXXLevMcpJaaP8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FXNqrdG1XbWC3wLi1DqqN2CGPiaz8MYont2cisDnUL5LPyC/7Y5A1XWylCb/sLi+ucz0fanyYL/aZMwTn4g65DWmvpCw1Q1WYTdnTKzWh9qr+dI/1wqf6bosmnvKWI3KBy0wN7nyjZZLNH3Xw2cf1xEuvPGX819vGqVz6zS+SCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=knUVH0ZH; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=+qFSrzUqefALkuRIAwEvke9q6ABHkeluP
	uGVG4evGMU=; b=knUVH0ZHqUiF39hrXyaCEaTwA+Y1f/Ki27gx8SvJ+a7wj0ozb
	tC9jVqNLYUhIaEComyELQZ+upz9J3IIwgOUA6K5E3ioT1TbHbe1J9jyP/fFQCteL
	x1fhcqQ/UVv7liEEc2oaI15nZM03sIIsyE1Cq8wLaWrtl10mA6OCF5auWc=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEJWShZq_0MGAA--.7871S2;
	Wed, 27 May 2026 09:35:19 +0800 (CST)
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
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
In-Reply-To: <6c320ea2-e169-4c97-a183-b0d5ec3d7aa9@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
 <6c320ea2-e169-4c97-a183-b0d5ec3d7aa9@kernel.org>
Date: Wed, 27 May 2026 09:34:39 +0800
Message-Id: <177984567940.2389245.17934989685862004204.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779845679; l=11194;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=1ykZA9SrzvON5lsTf6WfJV0amL1FpZXXLevMcpJaaP8=;
 b=BhKBaaVjs6NFvfZL1B7I8iz1ugqEGs+Giof+Uv3SzRf905oee//yYDi1p3FHcN3o7Ejh8kAdW
 egM93/dS7ZUBJPHsUazHsvE6dPNPq8zX3w8F5zGjOWR2q5/QGEJKsCE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDXEEJWShZq_0MGAA--.7871S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XF17Ww4fJF4UuF13XFWxtFb_yoWfKr13pF
	s3GFWrAFW3JF15JrWIqw18A3ZxuF40krWxGr42qry7Aa909F18XFy3Kw43uaykur4xZrW2
	yF15uryayay2vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAOEWoOgUUACgAWsi
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37547-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.169.21.40:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D6E835DE41C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 22:56 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>

Thanks. I'll update the subject line to drop the redundant "bindings" in
the next version.
 
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
> 
> Missing blank line.
> 
> Please organize your bindings to match expected style. See example-schema.
> 

Will fix the missing blank line and re-check the whole binding
against example-schema.

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
> 
> New bindings CANNOT introduce legacy. It's contradictory.
>

The legacy parts will be removed in v2.
 
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
> 
> Use consistent quotes, either ' or "
> 

This will be removed together with the legacy parts in v2.

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
> > +      pins:
> > +        description: List of pins affected by this state node.
> > +        minItems: 1
> > +        uniqueItems: true
> > +        items:
> > +          type: string
> > +          pattern: '^(PA([0-9]|1[0-5])|P[BCD][0-7]|LPC([0-9]|1[0-2]))$'
> > +
> > +      function:
> > +        description: |
> > +          Mux function to select for the listed pins.
> > +          gpio maps to the hardware default mode. The default mode is
> > +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> > +          func1 is not supported on LPC pins.
> > +        enum:
> > +          - gpio
> > +          - func0
> > +          - func1
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
> 
> We do not take new code which is already legacy. Why would we want a legacy?
>

Understood. The legacy example will also be dropped in v2.

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
> 
> Not bindings, drop.
> 
> > +
> > +#define UR_DP1000_FUNC_DEF		0
> > +#define UR_DP1000_FUNC0			1
> > +#define UR_DP1000_FUNC1			0x10000
> 
> Not a binding.
> 
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
> 
> I don't see usage in the driver, so not a binding.
> 
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
> 
> Not a binding, use actual mA values in the DTS.
> 
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
> 
> Also not used in the driver. Drop entire header or move out of bindings.
>

Thanks, this header is part of the legacy series and will be dropped
completely in v2.
 
> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang



