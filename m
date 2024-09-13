Return-Path: <linux-gpio+bounces-10075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5F978258
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 16:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9ED7B21835
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503E31DB954;
	Fri, 13 Sep 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxbVG2+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095451D86D1;
	Fri, 13 Sep 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236830; cv=none; b=dbTNjVFSYOns623cXtv8XU8nQUR/3gBdBSYgZqClIIVxzLDv2n3AtFQSQ67pna8ypYc7VhRJKmzCsVEKqsIsEvUTErZ1Yzj6N7faysLNZBXgEjFjouPAsMy0hBiMz5xFq5nLYF5Qlf6Slx1goq45JNxL7nXO2QJR/YBSvNFfi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236830; c=relaxed/simple;
	bh=rzh+ZplpHkGn5/za9ywrJDHUn0bLFa2FobPA7fn0fP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzEcT23FOf60nBid3PGDqyq9wcAWxbKTq/xCY2EY7nGaTnYI8W7uQb4lxVJXq3Olen0NX+0hvDoPucrT9tTavQih4k33EEvECfoeUCFEDxPWBek/rQ0Pdcy1XRNHNRMprDWef/+zpz55s1UxdBYRSipYURkwd3s9mPWNxofJptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxbVG2+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B160DC4CEC0;
	Fri, 13 Sep 2024 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726236829;
	bh=rzh+ZplpHkGn5/za9ywrJDHUn0bLFa2FobPA7fn0fP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxbVG2+hMBHOO59cV0kjfZdOjGjr0NRvVwokBjnYh06AwU3G6TfSEFPWKYQtDxPPT
	 Gu/ZYLSzdalFxe2usKX9RVOWKzi8gEWj80LT/4hYEWXM2yenRMO+46t+eRi0+MGyWs
	 W3x17VPBTZ2tZzRIYZGvTx+Q8IfO59gP9CWyMPbRB8Tkct/GXI0Q+Po4gVBm/gbNDC
	 T3RLQLCpqOT/bT75Ja4LM9YAtPMqEzw/b+e6YnrEhJoBQpcXJCE0Wkr6cubNaRdZxQ
	 uF87yFDCsQU9Uvp30qTtf85jA88eW1Zc2d8geGUdshY65Y1w+Or6MP/2F+ixSaG0Si
	 yGI7uwXuLlLmg==
Date: Fri, 13 Sep 2024 09:13:48 -0500
From: Rob Herring <robh@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240913141348.GA3927538-robh@kernel.org>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913082937.444367-3-andrei.stefanescu@oss.nxp.com>

On Fri, Sep 13, 2024 at 11:29:33AM +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
> 
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> new file mode 100644
> index 000000000000..8be8eb3a971d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,gpio-siul2-s32g2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2 SIUL2 GPIO controller
> +
> +maintainers:
> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> +  - Larisa Grigore <larisa.grigore@nxp.com>
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description:
> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> +  chips. It includes an IRQ controller for all pins which have
> +  an EIRQ associated.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: nxp,s32g2-siul2-gpio
> +
> +  reg:
> +    items:
> +      - description: PGPDO (output value) registers for SIUL2_0
> +      - description: PGPDO (output value) registers for SIUL2_1
> +      - description: PGPDI (input value) registers for SIUL2_0
> +      - description: PGPDI (input value) registers for SIUL2_1
> +      - description: EIRQ (interrupt) configuration registers from SIUL2_1
> +      - description: EIRQ IMCR registers for interrupt muxing between pads
> +
> +  reg-names:
> +    items:
> +      - const: opads0
> +      - const: opads1
> +      - const: ipads0
> +      - const: ipads1
> +      - const: eirqs
> +      - const: eirq-imcrs
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 2

This gets expanded to 'maxItems: 2'. Is that what you want? If not, 
maxItems should be explicit.

> +
> +  gpio-reserved-ranges:
> +    minItems: 2
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
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
> +    gpio: siul2-gpio@4009d700 {

gpio@...

Drop unused label.

> +        compatible = "nxp,s32g2-siul2-gpio";
> +        reg = <0x4009d700 0x10>,
> +              <0x44011700 0x18>,
> +              <0x4009d740 0x10>,
> +              <0x44011740 0x18>,
> +              <0x44010010 0xb4>,
> +              <0x44011078 0x80>;
> +        reg-names = "opads0", "opads1", "ipads0",
> +                    "ipads1", "eirqs", "eirq-imcrs";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +                      /* GPIO 0-101 */
> +        gpio-ranges = <&pinctrl 0   0   102>,
> +                      /* GPIO 112-190 */
> +                      <&pinctrl 112 112 79>;
> +        gpio-reserved-ranges = <102 10>, <123 21>;
> +        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };
> -- 
> 2.45.2
> 

