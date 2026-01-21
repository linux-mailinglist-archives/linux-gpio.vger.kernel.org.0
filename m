Return-Path: <linux-gpio+bounces-30830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDgpMek3cGmWXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:20:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 079484FA7F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90D49B80FF9
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 02:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429F2326D65;
	Wed, 21 Jan 2026 02:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgK4DjRv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69724E4C4;
	Wed, 21 Jan 2026 02:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961955; cv=none; b=U0oC+26VYX4YodBIVe2jwSvsdn2mkNsk95Y0V/mbiDcJH/DxgKqVU0fYgMW/JjGnVI0FyZVO2FNUqULIx4DzNAWi6xgk0bzZJyPO2eWpNa4QpZGmywK7xO2rgjojavruk7uFQE0477bsEbR9t7ciPAmS0c6lxfY0TjZeO3/HBqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961955; c=relaxed/simple;
	bh=yGMEQ4ojmcfspvpRv2qKf7LcLugvHtAKNMYSBdIlZYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiUt8Eah5MM7JclI3gnVUr/IbUzmXSMXCFsvbEYiEss8BytcGxY3I5zitRZdsItlkRlMjER4fSilVV1fMzp7AcN5iaTonKZkZHJn8pOzbbPK5wPU6JscFQQYbQL6E2t+JxIGOnArfsAu2uEkQaVgqjNpfC5/3XtZ5zt16vpymrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgK4DjRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5345EC16AAE;
	Wed, 21 Jan 2026 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961954;
	bh=yGMEQ4ojmcfspvpRv2qKf7LcLugvHtAKNMYSBdIlZYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgK4DjRvUdDyxCUmm7yH+Hn1hvBJvLmgL4p5/VvbVIgR6NaLgZ0VtZLlP5PEdx1sn
	 W7U4UWBmr/i2f9h0/aKpb6Ix8y7VSxIRx7G0b3JgV8M53LPJIkXPpha2WNI6EGwCAW
	 qgieh6bqsDoQVlhM04xqSEzcjEChC1QFgzbQSyB4N7JY9WuugWz5xLEPaYOjGWK4GB
	 1T+2r3PaLZbWbd7RMaISEZlPtjFRzBnCti6v4b3H1WM5mjCjHzahh95kiqCiOIsaR4
	 gvC4S0WmIy/xkMMe0diUuqfwW9iUac70rJQEbud+6m+Qla5k0oWE8YyNgpCP/jetGh
	 XsuvMODmHH7kA==
Date: Tue, 20 Jan 2026 20:19:13 -0600
From: Rob Herring <robh@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20260121021913.GA1704619-robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-30830-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[2.159.138.16:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,devicetree.org:url,4009c000:email,nxp.com:email]
X-Rspamd-Queue-Id: 079484FA7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 01:59:13PM +0200, Khristine Andreea Barbulescu wrote:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> Add the new dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> The existing SIUL2 pinctrl bindings becomes deprecated because it
> do not correctly describe the hardware. The SIUL2 module also
> offers GPIO control and exposes some registers which contain
> information about the SoC. Adding drivers for these functionalities
> would result in incorrect bindings with a lot of carved out regions
> for registers.
> 
> SIUL2 is a complex module that spans multiple register regions
> and provides several functions: pinmux and pin configuration
> through MSCR and IMCR registers, GPIO control through PGPDO
> and PGPDI registers, interrupt configuration registers,
> and SoC identification registers (MIDR).
> These registers are grouped under two instances, SIUL2_0 and
> SIUL2_1, and share the same functional context. The legacy
> binding models SIUL2 as a standalone pinctrl node, which only
> covers MSCR and IMCR.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 ++++++++++++++++++
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
>  2 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

Doesn't look like this was tested...

> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> new file mode 100644
> index 000000000000..ec743cf5f73e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32 System Integration Unit Lite2 (SIUL2)
> +
> +maintainers:
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description: |
> +  SIUL2 is a hardware block which implements pinmuxing,
> +  pinconf, GPIOs (some with interrupt capability) and
> +  registers which contain information about the SoC.
> +  There are generally two SIUL2 modules whose functionality
> +  is grouped together. For example interrupt configuration
> +  registers are part of SIUL2_1 even though interrupts are
> +  also available for SIUL2_0 pins.
> +
> +  The following register types are exported by SIUL2:
> +    - MIDR (MCU ID Register) - information related to the SoC
> +    - interrupt configuration registers
> +    - MSCR (Multiplexed Signal Configuration Register) - pinmuxing and pinconf
> +    - IMCR (Input Multiplexed Signal Configuration Register)- pinmuxing
> +    - PGPDO (Parallel GPIO Pad Data Out Register) - GPIO output value
> +    - PGPDI (Parallel GPIO Pad Data In Register) - GPIO input value
> +
> +  Most registers are 32bit wide with the exception of PGPDO/PGPDI which are
> +  16bit wide.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-siul2
> +      - items:
> +          - enum:
> +              - nxp,s32g3-siul2
> +          - const: nxp,s32g2-siul2
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    description: Address translation ranges for child nodes.
> +
> +
> +patternProperties:
> +  "^siul2_[0-1]$":

Don't use '_'.

> +    type: object
> +    description: SIUL2 hardware instances represented as syscon.
> +    properties:
> +      compatible:
> +        const: syscon

'syscon' alone is not allowed.

> +      reg:
> +        maxItems: 1

You have 'reg' so the node name should have unit-address.

However, there's not any real DT resources in this child node, so you 
should just drop it.

> +    required:
> +      - compatible
> +      - reg
> +
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +  "-pins$":
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "-grp[0-9]$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pinctrl@4009c000 {
> +      compatible = "nxp,s32g2-siul2";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&siul2 0 0 102>, <&siul2 112 112 79>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      siul2_0: siul2_0@4009c000 {
> +        compatible = "syscon";
> +        reg = <0x0 0x4009c000 0x0 0x179c>;
> +      };
> +
> +      siul2_1: siul2_1@44010000 {
> +        compatible = "syscon";
> +        reg = <0x0 0x44010000 0x0 0x17b0>;
> +      };
> +
> +      jtag-pins {
> +        jtag-grp0 {
> +          pinmux = <0x0>;
> +          input-enable;
> +          bias-pull-up;
> +          slew-rate = <166>;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> index a24286e4def6..332397a21394 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
> @@ -11,6 +11,8 @@ maintainers:
>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
>    - Chester Lin <chester62515@gmail.com>
>  
> +deprecated: true
> +

I don't really see why you can't just extend this binding with GPIO and 
interrupt provider properties.

Rob

