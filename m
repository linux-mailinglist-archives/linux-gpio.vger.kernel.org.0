Return-Path: <linux-gpio+bounces-32408-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB1YC3CEpmlQQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32408-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 07:49:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D21E9C8C
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 07:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F231D30470FA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 06:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEF62E8DEB;
	Tue,  3 Mar 2026 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+LWKQXK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680C38D;
	Tue,  3 Mar 2026 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520552; cv=none; b=fI+zygRkyitOjskR2YOXDihNnmLFljgkBl+SC+9hwmSSRYWMV08gmK4XqDuRjxTd47wdIJoI66IxyS+pzybGxTw9UxXuNQv+LWvyjjKZQEn9K6CN0hjkIL8mYsdo+3rkwECZwCvg7befEF4/OIGKlqWF7VGATLaZxjnAn9BXVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520552; c=relaxed/simple;
	bh=iwVy5g4bzG4pXkbhYjkENjYmwo6a5YAySJbmeH8yvOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjkGviQ/YdEhl/OD8OW7qusU4KiAQiZCZoGPtY2nfL3q2vbTXpbedjhMOBji8bOkKG7NDENtzI2aYWYjFy+HXr2Yc7dZFNveYIn2OZH2LBRovAIKfGfTF4irlVi5zKzht52qR93rBXF6jsTveK6oroMd9HwAN1NWgqmHxhrILSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+LWKQXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089DEC116C6;
	Tue,  3 Mar 2026 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520552;
	bh=iwVy5g4bzG4pXkbhYjkENjYmwo6a5YAySJbmeH8yvOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+LWKQXKI5ZK8EgGMHbJ5NCvyCNomA+MyA+6/6BRkwIGWkY7tUdPCxfXuPRp7XM0V
	 v5/qupq6Uxrha3Buzkui1uIfMMieFWxtgynd+H1n+0aCqnifILiBwwvA894VsZsUqj
	 yxVcOsbYke+o3mtbxd4bkNAQwBlvR8PcKjw4/+p7aXJN7RO+MF3lMwwXb+vC7ZqI5v
	 Fbu5mkfDKh1/VcwvGVpy+0/Kirscr3/9fgGVxZfg8hofiLbOhLkttfGTMiDD3sWws2
	 oxOaALc0oFeHVWDbf3hzHt9vBJ/xd8+Pz8ieF1pdITNq1pFaV4r/Qf3A5JabA1xGiv
	 QbdA4IbUU9HaQ==
Date: Tue, 3 Mar 2026 07:49:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhu Ling <1536943441@qq.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	chenbaozi@phytium.com.cn
Subject: Re: [PATCH v1 1/3] dt-bindings: gpio: add Phytium GPIO controller
Message-ID: <20260303-dashing-cricket-of-lightning-1dba54@quoll>
References: <20260302095147.2483-1-1536943441@qq.com>
 <tencent_0BC92A632DD26F0A684E608D427244637905@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_0BC92A632DD26F0A684E608D427244637905@qq.com>
X-Rspamd-Queue-Id: C14D21E9C8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32408-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,1.171.78.160:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,qq.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:45PM +0800, Zhu Ling wrote:
> Add the devicetree binding schema for the Phytium platform GPIO
> controller.

What is Phytium platform?

> 
> Register the "phytium" vendor prefix used by the compatible string.
> 
> Use ngpios as the preferred child-node property and keep nr-gpios as
> deprecated for compatibility with existing firmware descriptions.

NAK, you cannot add new deprecated properties. "existing firmware" does
not matter, because this is the first posting, thus the firmware starts
existing from now.

> 
> Signed-off-by: Zhu Ling <1536943441@qq.com>
> ---
>  .../bindings/gpio/phytium,gpio.yaml           | 134 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml b/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
> new file mode 100644
> index 000000000..1b9200c57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/phytium,gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Phytium GPIO controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Phytium GPIO controllers expose one GPIO/interrupt controller and up to
> +  two configurable ports. Child nodes describe per-port configuration.
> +
> +maintainers:
> +  - Chen Baozi <chenbaozi@phytium.com.cn>
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"

Drop

> +
> +  compatible:
> +    const: phytium,gpio

This is way too generic. Phytium made or will ever make only one controller?

> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  '#gpio-cells':
> +    const: 2

Why do you need cells here and in the children?

> +
> +  interrupts:
> +    description: |
> +      The interrupts to the parent controller raised when GPIOs generate
> +      the interrupts. If the controller provides one combined interrupt
> +      for all GPIOs, specify a single interrupt. If the controller provides
> +      one interrupt for each GPIO, provide a list of interrupts that
> +      correspond to each of the GPIO pins.
> +    minItems: 1
> +    maxItems: 32

Why is this flexible? You have one fixed device, no?

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +patternProperties:
> +  "^gpio-port@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: phytium,gpio-port

Drop compatible

> +
> +      reg:
> +        maxItems: 1
> +
> +      gpio-controller: true

So what is the controller exactly?

> +
> +      '#gpio-cells':
> +        const: 2
> +
> +      ngpios:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The number of GPIO pins exported by the port.
> +        default: 32
> +        minimum: 1
> +        maximum: 32
> +
> +      nr-gpios:

Drop, why do you create duplicated properties for everything?

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The number of GPIO pins exported by the port.
> +        deprecated: true
> +        default: 32
> +        minimum: 1
> +        maximum: 32
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - '#gpio-cells'
> +
> +    additionalProperties: false
> +
> +additionalProperties: false

This goes after required: block

> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio: gpio@28004000 {

Drop unused label

> +      compatible = "phytium,gpio";
> +      reg = <0x28004000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +
> +      porta: gpio-port@0 {
> +        compatible = "phytium,gpio-port";
> +        reg = <0>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <8>;
> +      };
> +
> +      portb: gpio-port@1 {
> +        compatible = "phytium,gpio-port";
> +        reg = <1>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <8>;
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ee7fd3cfe..2c3f9777d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1265,6 +1265,8 @@ patternProperties:
>      description: PHICOMM Co., Ltd.
>    "^phontech,.*":
>      description: Phontech
> +  "^phytium,.*":

Keep proper sorting.

> +    description: Phytium Technology Co., Ltd.
>    "^phytec,.*":
>      description: PHYTEC Messtechnik GmbH
>    "^picochip,.*":
> -- 
> 2.34.1
> 

