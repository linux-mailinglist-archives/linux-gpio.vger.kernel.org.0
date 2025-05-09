Return-Path: <linux-gpio+bounces-19884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811BAB1D3F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 21:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB0F189711C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 19:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2409525D1F9;
	Fri,  9 May 2025 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4ju9s+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB933F3;
	Fri,  9 May 2025 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746818534; cv=none; b=cC8zX6T2rOrJ4WT5uC1RvqqwaMPUh9K5Wy/Qn8Y9fU3naoX13NoFZrTqGcnkwv637e49V2m+785XOD8TPetsPIw2jEbH9r6Zsg5Nq8MHg+7Kjmd+9h2uLCeO33+5uoNkViFem2fH0j4AmkiJg+PejsBsboHqk/m4Tmzgke+7EzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746818534; c=relaxed/simple;
	bh=dA5hNV7xLnpRN9zoNb0MzWxcvFdMBNDlsrZb88qVmI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9mgardWLSTvwovUojSK3ldAXGV+Tu22i+NPzb33p5u0xWppAvM4CZp12PyjIBUAHenjhOk5fzF7H0NJJRUddu3Vz8fvTR55th9iVZBm0NE+B0pGrfsHr6p9GbFkUmcVzHKrCi5GexsoyTp4TL8YqA7H9pyx6QVnUH+uiYVNfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4ju9s+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE3BC4CEE4;
	Fri,  9 May 2025 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746818534;
	bh=dA5hNV7xLnpRN9zoNb0MzWxcvFdMBNDlsrZb88qVmI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4ju9s+QFdb/2LZabo1Bq79ixSLpDlmAINoajemtD3nw1UpKRae4DJqcciiMm4sqr
	 7Cnq4oW6n7MYrRwxBdroDCdVN71b/3mpWzf38F6TonthwysTGpjcVi1Z3yxqEIdLvl
	 rQ6mTVHVljPdGec46M0pQkWWjOXpt/zVlF6DayDeaCE2yaJboElvrki4NSBJYwIcPS
	 i+3El4sSURVvfny80qrKE1kjMEQGIR9cm2udi5YTAnt8bD/XijCBT0McFB0UMQHQjI
	 Ime1AwEZ9lUmaJCq/6hVKr8u1y9KiSf+UQJi7Jq6d6knzhM9PRzYKke/gWR9PUJSsu
	 YeQBofi6EC5zw==
Date: Fri, 9 May 2025 14:22:12 -0500
From: Rob Herring <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Document Tegra186 pin
 controllers
Message-ID: <20250509192212.GA3945761-robh@kernel.org>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <20250429-tegra186-pinctrl-v1-1-722c7c42394e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-tegra186-pinctrl-v1-1-722c7c42394e@gmail.com>

On Tue, Apr 29, 2025 at 04:33:30PM -0500, Aaron Kling wrote:
> Tegra186 contains two pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   | 285 +++++++++++++++++++++
>  1 file changed, 285 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2fcf42869d7b68671ae3ce78bd33787901ae9203
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.yaml
> @@ -0,0 +1,285 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra186-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra186-pinmux
> +      - nvidia,tegra186-pinmux-aon
> +
> +  reg:
> +    items:
> +      - description: pinmux registers
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-_]+)?$":

Is there really a case for having just 'pinmux'? Seems like there would 
always be multiple nodes.

Don't use '_' in node names.

> +    type: object
> +
> +    # pin groups
> +    additionalProperties:

Define a node name pattern here instead. Allowing any name was for 
existing bindings.

> +      $ref: nvidia,tegra-pinmux-common.yaml
> +      unevaluatedProperties: false
> +      properties:
> +        nvidia,function:

