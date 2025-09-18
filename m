Return-Path: <linux-gpio+bounces-26263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE27B7F66B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 15:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB77D3BFB3D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 00:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E77218ADD;
	Wed, 17 Sep 2025 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlHy8TZh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5610F1;
	Wed, 17 Sep 2025 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758067255; cv=none; b=UoDMEOI2edCFgkJTvmfEav/fPPEPD6CGI6gMD/eLNPmQcK3OltfbL2sbyuPf+9lOOw4g4pGVJUa+65HC936iga9WMuGUKOevLzG1o3FT6Em0YVdgJkevxbxNF1U5hwc3hl8n2djKaYgrZX65M7OZ71xZkSfPTJ+CHMxgLzHCbGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758067255; c=relaxed/simple;
	bh=ke9zmmhKs5eb5v+Alg5/XjhaLlirlLoeVZXpSuibMM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSIUlZMpLmjkdLIXRnNP/vTxuWhQYGsvvd7/4Iq8ovDX+TnbAPiBLe+6pjfrRkWwgU8weuoxYZbnq/6cGFhBHX4qL4RVh72tLw0660s5sMDqG3H5lJq/o2W67098BFTKQRmYuSsbkJaQnMG4vyCpQk7kWdudl3ML4nOvkCgv0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlHy8TZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA362C4CEEB;
	Wed, 17 Sep 2025 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758067255;
	bh=ke9zmmhKs5eb5v+Alg5/XjhaLlirlLoeVZXpSuibMM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UlHy8TZhlJV57BFKSbW5+rOp3Es6ZL9g1CiUvHbGF+8iP91AcPlsQt85/baStMxC5
	 Uxhjk5MNwG48opHIfX/mcN7HvDoy39NRIZa+JSEKGg0TrJmFDE8+xt498TLeJA1/Zd
	 7cUUtfwPNRIS2jwGgExYxhL06VehJTXXzUFuo2OKWHofLCGLAjIO7+9kiBIAjsY5zx
	 Qv6j4UkQdJsGDgF/9WJciW0u0A4psyAhPZ0Va9uHbbv33P4ZcjzbAl1/+tKn/oLsx3
	 eosExh7i6QSE0k+pxPKmvz/0sDTnnafIe9kY5Tz2YHsgJX5aJLt9nNVUGydWpXDNjM
	 sYCPNmgIb9YdQ==
Message-ID: <689d2f80-40e8-49c4-8aca-7a5d21e62b0c@kernel.org>
Date: Wed, 17 Sep 2025 09:00:48 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/25] dt-bindings: mmc: Add RDA SDMMC controller
To: dang.huynh@mainlining.org, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
 <20250917-rda8810pl-drivers-v1-21-9ca9184ca977@mainlining.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250917-rda8810pl-drivers-v1-21-9ca9184ca977@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2025 22:25, Dang Huynh via B4 Relay wrote:
> From: Dang Huynh <dang.huynh@mainlining.org>
> 
> Add documentation describing the SD/MMC controller in RDA Micro
> RDA8810PL SoC.
> 
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
>  Documentation/devicetree/bindings/mmc/rda,mmc.yaml | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/rda,mmc.yaml b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dfdd9c6d3044061c342519e35e39c7751874bb03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/rda,mmc.yaml

filename based on compatible.

> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/rda,mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro SD/MMC Controller
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +maintainers:
> +  - Dang Huynh <dang.huynh@mainlining.org>
> +
> +properties:
> +  compatible:
> +    const: rda,8810pl-mmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  rda,mclk-adj:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      Some board need MCLK to be adjusted for the card to work.
> +      If not present, MCLK will be handled by an external PCLK.

Adjusted for what? What is the value exactly? Where is the MCLK located?

> +    minimum: 0
> +    maximum: 255
> +
> +  rda,mclk-inv:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Some board need MCLK to be inverted for the card to work.
> +      If not present, MCLK is not inverted.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - vmmc-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/rda,8810pl-apclk.h>
> +    #include <dt-bindings/dma/rda-ifc.h>
> +    mmc1: mmc@20950000 {

Drop unused label.

> +      compatible = "rda,8810pl-mmc";
> +      reg = <0x20950000 0x1000>;
> +      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&ap_syscon CLK_APB2>;
> +      clock-names = "apb";
> +      resets = <&ap_syscon RST_APB2_SDMMC1>;
> +      dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
> +      dma-names = "tx", "rx";
> +      vmmc-supply = <&vdd_sdmmc>;
> +      rda,mclk-adj = /bits/ 8 <1>;
> +      rda,mclk-inv;
> +      status = "disabled";
Cannot be disabled.

Best regards,
Krzysztof

