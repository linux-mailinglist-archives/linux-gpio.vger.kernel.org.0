Return-Path: <linux-gpio+bounces-12482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605499B9DF3
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 09:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35E3FB2197A
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 08:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B31D15886D;
	Sat,  2 Nov 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0WCIbhb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9051448C7;
	Sat,  2 Nov 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730536982; cv=none; b=Vxbo6V6WF56OJ0Jfp9NJaGHvgxhYC9K2QwBdAA27V+CFyEfRRd6KGK9YQSz3aWSeEYg47B4cH/0aU+lQ4/vfaUxU/FrgquBdYUDcaKU1fw2Z10rGNRY1pYlY0OFZ1wUo0LXDL6cz8PB6PS0yco5nfUM04b1tuUEvKRaV4jIYyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730536982; c=relaxed/simple;
	bh=pP3R8S8xXnbNhkQNcIbqwo5q8l9UVwjgjBAsSLuY7NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlRYOtpEAzaPoccXmKtAEryIYu2ABvcc6huV7/eqcmVd9YHqrYPxhpw7oF+gQHrTAIaPXaj0WdSfGStcKkvy4Q8J63K3A0F1vxKf81vRXeykZr39wVQfqIIzX2RX79JPY4hAyJTmioDveQqSW9gWVmfG6/8YTb2hoHiKO74PV6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0WCIbhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E81C4CEC3;
	Sat,  2 Nov 2024 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730536982;
	bh=pP3R8S8xXnbNhkQNcIbqwo5q8l9UVwjgjBAsSLuY7NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0WCIbhbyv1O/gIfnwtwITHf3NvkZBn7MUKM7h8Xy8Wv7jxr1TRUC33LeLvjKL3am
	 vPQvLpI16LRVaNAjtnHQzGEeq0KVfKyr8Vdlrd5UjUPKyWzxcq/AGeDLywt+1Rr2nw
	 qDaSalaWyHcKw8ghzxSNcMk4T6w4COlnOwwU2EGiXHC145qlGM7719McNshXD94tbI
	 TThDrX5CLsAbRU9/Qnn1L11VffW/eyYq9LE00rIVj6IfMXqX7QFAAZQQojESPzwuc3
	 MSa+sKZ83UKuADIfb4opJWl+SXNMp6di2+gARznfWQ3P1IU+IpsT5y0zugut3f3u34
	 lt0een9XyltUQ==
Date: Sat, 2 Nov 2024 09:42:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <vlkhmja7xjfjin5yffnet5ava62shsoflmkzfav6c2ylh3o6kk@hvpnmd4uyjca>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-2-andrei.stefanescu@oss.nxp.com>

On Fri, Nov 01, 2024 at 10:06:07AM +0200, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../devicetree/bindings/mfd/nxp,siul2.yaml    | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml
> new file mode 100644
> index 000000000000..141ec1219821
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nxp,siul2.yaml

filename based on compatible, e.g. nxp,s32g2-siul2.yaml

> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/nxp,siul2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: System Integration Unit Lite2 (SIUL2)

NXP S32 System Integration Unit Lite2 (SIUL2)?

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
> +    enum:
> +      - nxp,s32g2-siul2
> +      - nxp,s32g3-siul2
> +
> +  reg:
> +    items:
> +      - description: SIUL2_0 module memory
> +      - description: SIUL2_1 module memory
> +
> +  reg-names:
> +    items:
> +      - const: siul20
> +      - const: siul21
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 2

You can drop minItems

> +    maxItems: 2
> +
> +  gpio-reserved-ranges:
> +    minItems: 2

Missing maxItems

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  nvmem-layout:
> +    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +    description:
> +      This container may reference an NVMEM layout parser.
> +
> +patternProperties:
> +  '-hog(-[0-9]+)?$':
> +    required:
> +      - gpio-hog
> +
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-grp[0-9]$':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        description:
> +          Pinctrl node's client devices specify pin muxes using subnodes,
> +          which in turn use the standard properties below.
> +
> +        properties:
> +          bias-disable: true
> +          bias-high-impedance: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          input-enable: true
> +          output-enable: true
> +
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

missing required: block

> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"

Keep consistent quotes, ' or "

> +  - gpio-ranges
> +  - gpio-reserved-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    siul2: siul2@4009c000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

e.g. pinctrl

> +      compatible = "nxp,s32g2-siul2";
> +      reg = <0x4009c000 0x179c>,
> +            <0x44010000 0x17b0>;
> +      reg-names = "siul20", "siul21";

Best regards,
Krzysztof


