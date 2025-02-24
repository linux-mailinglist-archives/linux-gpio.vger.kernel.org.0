Return-Path: <linux-gpio+bounces-16511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D9A4269C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0F31634E8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E34254858;
	Mon, 24 Feb 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFWYLXR4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C6248867;
	Mon, 24 Feb 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411541; cv=none; b=ocsVP7i0cjh11Um2bhj3p4ImA3B3J6qXFVeKE4yyNdpeLpSExqn9IoWCWa/tNtUPJ8TUUJ/81UvQ9pUljOc+0rqZtEsuc8acrE/wc28dsoiR8aed/73ZMi+6SabJIWsgQ+RZIDDDaa3KrC/yUo+5zPsCJ7/dLzKrpHg34ogidlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411541; c=relaxed/simple;
	bh=uHE6a9B5XPyUDD/iN3v6X1m7W1TfcxQ4dgw/9RjT7V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPK45fLkEIdIdLgyQUrigtygeaoSMIISZhIwHDJXN9bSCUJ9MNEWtfBPjPXOnr36kjBMDm60Cgm5p1p3jhuxLR7uA+Ox10FjScrzqMWANOAJS0xvAK4evDZM6kTF+SD0Xe8mZs1WcIY639U9ze2jwYOj9zM1+lDhi6StWSho780=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFWYLXR4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3E3C4CED6;
	Mon, 24 Feb 2025 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740411540;
	bh=uHE6a9B5XPyUDD/iN3v6X1m7W1TfcxQ4dgw/9RjT7V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFWYLXR4phIW27CJ1L1kPIDEHC1m3u27FzVi/IPKGzpbFkqILfFlLwHRTKRSXHF9M
	 Jwr7WLPdDzaNy2Ib4SrP1iEwbTNKg0VQ4AOxB+dr5YPzHjNDyQKxQlLnvJ5v4wPP9K
	 RIYHV7WZTpKKK+Xuu5/LgkEsFBHA0ZaR7OIEmnNXyZV0n3QzaixQvDYTJ7sUBozEcM
	 eH8AiY/ge3OBM+8mCmeGD/tp53zGCNs1PWq5bbDdIfNoBWmDhXnlvRo5n0GCHcnbGZ
	 ppXOqUxAU4QOu6kWdhzdprglqNdov1Vc209MVjY7PMfNzpYa+HL8pFQIf8CLGxdH0u
	 H3W5IpSmic/eg==
Date: Mon, 24 Feb 2025 09:38:58 -0600
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
Subject: Re: [PATCH 2/6] dt-bindings: gpio: add max77759 binding
Message-ID: <20250224153858.GC3137990-robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-2-2bff36f9d055@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-max77759-mfd-v1-2-2bff36f9d055@linaro.org>

On Mon, Feb 24, 2025 at 10:28:50AM +0000, André Draszik wrote:
> Add the DT binding document for the GPIO module of the Maxim MAX77759.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/gpio/maxim,max77759-gpio.yaml         | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
> new file mode 100644
> index 000000000000..9bafb16ad688
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/maxim,max77759-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX77759 GPIO
> +
> +maintainers:
> +  - André Draszik <andre.draszik@linaro.org>
> +
> +description: |
> +  This module is part of the MAX77759 PMIC. For additional information, see
> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> +
> +  The MAX77759 is a PMIC integrating, amongst others, a GPIO controller
> +  including interrupt support for 2 GPIO lines.
> +
> +properties:
> +  compatible:
> +    const: maxim,max77759-gpio
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 2

You need to define what each interrupt is.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +
> +additionalProperties: false
> 
> -- 
> 2.48.1.658.g4767266eb4-goog
> 

