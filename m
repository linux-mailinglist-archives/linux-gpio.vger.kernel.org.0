Return-Path: <linux-gpio+bounces-9204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD296016D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 08:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCFD3B21764
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 06:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC54513C8F4;
	Tue, 27 Aug 2024 06:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhUN14wx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818AF9473;
	Tue, 27 Aug 2024 06:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739446; cv=none; b=sIMg2YfoY5mTK9USskov3pnutpiXVUiommaZeArYYG8PXQ7nktsTCdAfWR4Beu6uef/UFlxDY5bMyPerQ4A9aFipS3tek59hEPMtLmPYeAkbeCKyK9ZgBDTNh9VgTw+YgnueXsUjDAXH0wtg4iT8nLePa+iWi6FnQ4w+3oJJB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739446; c=relaxed/simple;
	bh=u3kXIc92xjaAwGfhI4ef8sAKfgw/DaArSZkLIDsFvpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fe0grHMf83klQNPSmykKTMQtyFD7bZKjoqhY/jk7CIBI6OrMsl0gvkJFjYm76CEKSNOoOKwjPT9MIK9EunJ5gwmCYC+tG+xasvqxjUadGZ5OSN2mowhD2pxua7sw69hCol8VaQQwkSjcAqVjreHT45X4RweUpUtS0nnX1qmHb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhUN14wx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635DCC4DE12;
	Tue, 27 Aug 2024 06:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724739446;
	bh=u3kXIc92xjaAwGfhI4ef8sAKfgw/DaArSZkLIDsFvpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhUN14wxrm0wwSPTovAt/0Ju7sbIY5GqcCYjhZ1nA2iATmHoa3U31nu4O+k5fexol
	 +CCkhJmKwrD1iMw+5FnkAJ/nvRRTBVMST/fwrlOkh55Lmv3GglhbnocJdIXb7Z274t
	 m3JiS5rV0+Iz737bJ8njaA6qjC++KjjFKXZRtkh6I/hoxb9NsxCsX0ajBkMg2h7rEq
	 UelSOxnHtqIFpE6p6r/eKhqFDOpzyUa5dmirIrK/cPxEbw6Ad/lqicT+G1kCgRlFEe
	 2y2XinTtVL1ymaEmkKoULzi/VGKkGidXhkXuvrQKLXaZYdJtMqXc+XM4iryLx3gj34
	 Be0EnkcsEKMZQ==
Date: Tue, 27 Aug 2024 08:17:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: pinctrl: Add fsl,ls1012a-pinctrl yaml
 file
Message-ID: <pywfy4ypttq7y2llfkdgkwgpjfvnzk3lcgd67efp2v6qu6f2it@fdgiw5pac7uz>
References: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a5c1eef7-372d-082b-066e-ecd5e001d1cf@digi.com>

On Tue, Aug 27, 2024 at 12:10:44PM +1000, David Leonard wrote:
> 
> Add a binding schema and examples for the LS1012A's pinctrl function.
> 
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---

It does not look like you tested the bindings, at least after quick
look. Please run  (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

>  .../bindings/pinctrl/fsl,ls1012a-pinctrl.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
> new file mode 100644
> index 000000000000..599df49b44d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,ls1012a-pinctrl.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,ls1012a-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP QorIQ LS1012A pin multiplexing
> +
> +maintainers:
> +  - David.Leonard@digi.com
> +
> +description: >

Drop >

> +  Bindings for LS1012A pinmux control.

Drop "Bindings for" and explain the hardware.

> +
> +properties:
> +  compatible:
> +    const: fsl,ls1012a-pinctrl
> +
> +  reg:
> +    description: Specifies the base address of the PMUXCR0 register.
> +    maxItems: 2

Instead list and describe the items.

> +
> +  big-endian:
> +    description: If present, the PMUXCR0 register is implemented in big-endian.

Why is this here? Either it is or it is not?

> +    type: boolean
> +
> +  dcfg-regmap:

Missing vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the DCFG registers.

Instead explain what it is needed it for, how is it used.

> +
> +patternProperties:
> +  '^pinctrl-':

Rather -pins$ or ^pins-

> +    type: object
> +    $ref: pinmux-node.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      function:
> +        enum: [ i2c, spi, gpio, gpio_reset ]
> +
> +      groups:
> +        items:
> +          enum: [ qspi_1_grp, qspi_2_grp, qspi_3_grp ]
> +
> +allOf:
> +  - $ref: pinctrl.yaml#

Thies goes after required.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@1570430 {
> +        compatible = "fsl,ls1012a-pinctrl";
> +        reg = <0x0 0x1570430 0x0 0x4>;
> +        big-endian;
> +        dcfg-regmap = <&dcfg>;
> +        pinctrl_qspi_1: pinctrl-qspi-1 {
> +            groups = "qspi_1_grp";
> +            function = "spi";
> +        };
> +        pinctrl_qspi_2: pinctrl-qspi-2 {
> +            groups = "qspi_1_grp", "qspi_2_grp";
> +            function = "spi";
> +        };
> +        pinctrl_qspi_4: pinctrl-qspi-4 {
> +            groups = "qspi_1_grp", "qspi_2_grp", "qspi_3_grp";
> +            function = "spi";
> +        };
> +    };
> +  - |
> +    qspi: quadspi@1550000 {

Drop, useless and not related.

Best regards,
Krzysztof


