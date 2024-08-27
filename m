Return-Path: <linux-gpio+bounces-9205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E159960174
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 08:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1118B220DB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 06:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BB1146D6A;
	Tue, 27 Aug 2024 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyR7S/d5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA0145B0C;
	Tue, 27 Aug 2024 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739605; cv=none; b=sjIjz+RtFs8QNG29P4CyqGno5GdimKucdBRx1f1JlrmTyAi179jVupepf86BVCUQl0lyEejmEzdGyBQ5yLyVP0FLWRxvbfmMhM+MQ5z+mM/noMoiG6Gb75ovt8wMfo8Ax6ML7NgmK5O4RdKYTG8UjoOktYoa/w8YyQP2A1XNaTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739605; c=relaxed/simple;
	bh=+9tzJfq/xzY8EG6tCU+fWeZg1GtXDz0Y7NOhuziouaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrBGlrzMoeQCUdHNUl8B7RAG4ROh7J8W8CGs7NMVvOVj2W4nR5cUlOwXbr2Qy5emez9qSDZGBDS3rSqzAMXBI6au2iHvFbTZyPbx48JKrpXMqrz/CO7Q+jfJU8f8tkB5zwemjfF/z9PkC1CTwZkvsauJjF2R0yRXECA//xjYfTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyR7S/d5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9ADC8B7AA;
	Tue, 27 Aug 2024 06:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724739604;
	bh=+9tzJfq/xzY8EG6tCU+fWeZg1GtXDz0Y7NOhuziouaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyR7S/d5hISBltml6fCxQnyQqzG1LMOvpPmqODDYlOKdkz207XDv28xdwXagzCGor
	 trS0+RL+4s4/uKAEQWYv1IWG7zF8d9Eft34pFZ/FHVs+NIu4qpaTmGXAkAUHqrMEmp
	 86MHymCguw0hgNWYyMJ6AwpHkx7fMQ+hs9TMNaxr+Ku8FrBwmakNWbHI4h+OsSfo7E
	 CZOQOg+Kj06PUzPNzbqJ2oJuolf/jMXiF6e4XUGxBQQ58ofwQZg/c0DOteLZFBAJMn
	 9kv+MYeSxWAEfIDOrnf5sPCIJIx6KyKTeRr4oUAv6oNtFIm2Fsm2KZ1YFs+6EnNuwt
	 JbVDVFgEtvXYQ==
Date: Tue, 27 Aug 2024 08:20:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: Add fsl,ls1046a-pinctrl yaml
 file
Message-ID: <5js7324jqsp65kp4s4erm4rx3bms2u4otbqbsne3bldolzzq6f@wrqc4rfwaxly>
References: <b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b17a0414-8503-950e-a133-e5a1b1cab8c4@digi.com>

On Tue, Aug 27, 2024 at 12:15:08PM +1000, David Leonard wrote:
> 

Why do you keep sending emails one-by-one?

Fix your threading.

All previous comments apply.

> Add a binding schema and examples for the LS1046A's pinctrl function.
> 
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---
>  .../bindings/pinctrl/fsl,ls1046a-pinctrl.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
> new file mode 100644
> index 000000000000..3d49e42d33e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,ls1046a-pinctrl.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,ls1046a-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP QorIQ LS1046A pin multiplexing
> +
> +maintainers:
> +  - David.Leonard@digi.com
> +
> +description: >
> +  Bindings for LS1046A pinmux control.
> +
> +properties:
> +  compatible:
> +    const: fsl,ls1046a-pinctrl
> +
> +  reg:
> +    description: >

Drop >, actually entire description... insteasd list and describe the
items.

> +      Specifies the base address of SCFG_RCWPMUXCR0
> +    maxItems: 2
> +
> +  big-endian:
> +    description: >

Drop >

all other comments also apply.

Best regards,
Krzysztof


