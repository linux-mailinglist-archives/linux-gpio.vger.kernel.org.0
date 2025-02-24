Return-Path: <linux-gpio+bounces-16510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD0A42697
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E402168396
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314DE254865;
	Mon, 24 Feb 2025 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZ2xschZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA2248867;
	Mon, 24 Feb 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411503; cv=none; b=A0vzbEhINj0vSbRArQ/9zI114o0WVHIfdTx9u/pO7cW89a2hg3+wBz6YqhtQr6X81BGeewNL0B3c+8lBuh09usIZIrPeTDth0UR1HG8v4k2skeZRZwvjGUd449aeoBSxEs/VjUtu0GPQS9I/9Z89yVYmlE61YMGGeD5SZ7HvwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411503; c=relaxed/simple;
	bh=90PJZjtFuy95io+yd+ZZG5UzIZ/EE7b1PaxoX1bap9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF6ee0IBwbDPMptgDS5HlfkeTjl7megnYFs190fj/Tp9ft42Aqcj08Qg/eDyqgVolvUpGlSXt1odFisjkdrNHXF8+2e7D0AnhVFMCwSp7YSaB06o2+tVixcKmDnUteUaHZPPpffgtHfW5fA30a2ROIn1yuKbs8hTbAUZ1FfzeYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZ2xschZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C0C4CED6;
	Mon, 24 Feb 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740411502;
	bh=90PJZjtFuy95io+yd+ZZG5UzIZ/EE7b1PaxoX1bap9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZ2xschZy6znO0bohrpv8XLkavIG5C/OjpbdOEAxuZXlOVykk07FQadoyBDL9nGg7
	 63klknJKHtBmymMmFXC8ISJ/TeKwxm6BDoosVM4dWh9bgvS+7TTVEIpThAzbzcIGKM
	 nlb9dGxu7/duV+FbrGk95oRHso8ZdCSRH8Y5twIvMpC68cueWBCy1ZDp3EN7QGWNUp
	 ckqJ9LOnLxIEJU4+P5F0gjWJQYO6F7PBl0UJ47spTDESUvNx3FKT5KEH9N5Ft5c7j7
	 7T6U1eLYlrHG40xMVQ+SOet+NxaALkoweQoLEtl/6xcnAucibg7m9l9yp00jpAX+Tx
	 rL4WeiZCgnw/A==
Date: Mon, 24 Feb 2025 09:38:20 -0600
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
Subject: Re: [PATCH 3/6] dt-bindings: nvmem: add max77759 binding
Message-ID: <20250224153820.GB3137990-robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-3-2bff36f9d055@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-max77759-mfd-v1-3-2bff36f9d055@linaro.org>

On Mon, Feb 24, 2025 at 10:28:51AM +0000, André Draszik wrote:
> Add the DT binding document for the NVMEM module of the Maxim MAX77759.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
> new file mode 100644
> index 000000000000..d3b7430ef551
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX77759 Non Volatile Memory
> +
> +maintainers:
> +  - André Draszik <andre.draszik@linaro.org>
> +
> +description: |
> +  This module is part of the MAX77759 PMIC. For additional information, see
> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> +
> +  The MAX77759 is a PMIC integrating, amongst others, Non Volatile Memory
> +  (NVMEM) with 30 bytes of storage which can be used by software to store
> +  information or communicate with a boot loader.
> +
> +properties:
> +  compatible:
> +    const: maxim,max77759-nvmem
> +
> +  wp-gpios: false
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nvmem {

Drop the example here. The MFD binding has a complete one.

> +        compatible = "maxim,max77759-nvmem";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        nvmem-layout {
> +            compatible = "fixed-layout";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            rsoc@a {
> +                reg = <0xa 2>;
> +            };
> +        };
> +    };
> 
> -- 
> 2.48.1.658.g4767266eb4-goog
> 

