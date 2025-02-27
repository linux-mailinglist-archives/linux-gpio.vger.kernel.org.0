Return-Path: <linux-gpio+bounces-16711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D4A47E80
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 14:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965C1188C842
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC94422E406;
	Thu, 27 Feb 2025 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b10c+sQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875531EB5ED;
	Thu, 27 Feb 2025 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661495; cv=none; b=haCfF2PIfSaTxipgpuuTM4AGV8hgxDUydYYJt5UmwV/qXFTOxJnYW8EWGA0L9WPtriape06aCx0lyteMX/YoDUT9TzcwoE8wUedYRv4kCW91DEroL4kForDpcoTjtr4Zhx8bxGGF+GmI5xLysG7JB1TPjiEDFw7cScbLoCoHKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661495; c=relaxed/simple;
	bh=udtwxboNDP7pZXXIYbaDmHhRboFF0iodEjdKZaF4OGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCiYJ+Gj+feNhJkCf2uklJHaz77lMG+TzonXPLtlgptgXl3NPg2rTRpKXzxLMCjdTw7eUEcjAhXIF6d73CVymZv2UpjIJrzJ1KY9YzEdv1DnJ1/hgbj3+rjKn+n05DoR2VznuSiazZ61+/saAo4/0FxAFC/WkrXI8Jqh8YMUrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b10c+sQh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BE5C4CEDD;
	Thu, 27 Feb 2025 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740661494;
	bh=udtwxboNDP7pZXXIYbaDmHhRboFF0iodEjdKZaF4OGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b10c+sQhiKTt6sQe8gm4iEdnAqrthZvvjWgbmGAicLfT7fSgfgdvNYAQMmoA2huBR
	 8puoxNB+idL1ek50JRHNYvIXuHUdI1psjvPIjQRLN0dmz8qOPQAlzkVaMmgKiFHNPc
	 bUKoWfURDbAOy1nm9/Xpbhyxk8tydq+FjZiHnIRSd2qMkkEJkjasE/OcX07pN+1mSq
	 KuLbUWduZoZ2S9KTnaGzeavECJxuYCoSXu33YeXkLo7sjkxvXUrfKJCi4bhYhgxsGM
	 4G1sBElGoc4kc1bWiy2bMPCSnBlbXfZ6G5NnvVGN7BZZm6jsewQhr2qRMW2ujFfj7q
	 axW4rgIoukwWA==
Date: Thu, 27 Feb 2025 07:04:51 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: mfd: add max77759 binding
Message-ID: <20250227130451.GA1783593-robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org>

On Wed, Feb 26, 2025 at 05:51:22PM +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes the top-level device.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * rename expected nvmem subdev nodename to 'nvmem-0'
>   I'd have preferred just 'nvmem', but that matches nvmem-consumer.yaml
>   and fails validation.
> 
> Note: MAINTAINERS doesn't need updating, the binding update for the
> first leaf device (gpio) adds a wildcard matching all max77759 bindings
> ---
>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..87e3737896a289998a18b67932dbccacfb8e3150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX77759 PMIC for USB Type-C applications
> +
> +maintainers:
> +  - André Draszik <andre.draszik@linaro.org>
> +
> +description: |
> +  This is a part of device tree bindings for the MAX77759 companion Power
> +  Management IC for USB Type-C applications.
> +
> +  The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors, USB
> +  Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> +
> +properties:
> +  compatible:
> +    const: maxim,max77759
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2

Why do you have GPIO properties here and in the child node? Either would 
be valid, but both probably not. Putting them here is actually 
preferred.

> +
> +  gpio:
> +    $ref: /schemas/gpio/maxim,max77759-gpio.yaml

