Return-Path: <linux-gpio+bounces-16509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A16A426A3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A941898DBA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB70224EF6D;
	Mon, 24 Feb 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jniKeYp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAC1A0BD6;
	Mon, 24 Feb 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411438; cv=none; b=ieZrBmKOphAp1WjZN+13HMm3XRroKBTbqpYRXrSUnUo/zVze2qH9NfbNapFtSkbT4JukYZJW9XylvtBLIb8zmxEjEYCnogp89T899RottK06kgOJ5dq6wsKisyNZViexYbjDy4GZr51YJUUoHVjuSS5PzJEnVwuqF2s3c/OsnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411438; c=relaxed/simple;
	bh=yhH5CefLifdIL3/VFY7y8OY6C4KGgUDfVENSrOJRD6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP0gU2CIBmkdyW/JU142/br9N4P4TYk43/rWT8N8gqrJ0c+Hd6ZNTboePl18Qbf8Mi/sPZ0dhav+WmN4iBRtSZlOwqVo2omQVi8fcs4q1p++XtsSN30Pg6yn1jInRKo8pPGA7dQqRp8NhNm8b7dVZUYWpZ0tcTJeTjVr7rs6SY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jniKeYp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE423C4CED6;
	Mon, 24 Feb 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740411437;
	bh=yhH5CefLifdIL3/VFY7y8OY6C4KGgUDfVENSrOJRD6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jniKeYp6f0hbItNPYyxoaqFxMZ9Aj53HJ9oTyPeiazwTL+ROU2sK8joQ/KV8C4Mp4
	 tCm3xjIy4bvWgF0dOzK1e4un1nopNwXanjWh4or3x1pHyHqU6Pg0p9UCgS+6b6kWca
	 g8rLJiytSiXNuReVDrW6/rNoP0VNqo3clpNmbfO1HQULGhJfKcDMp+HBOsRNov/nGF
	 GRIKKvHpkGTyvEPw5ljzs3sew3WHgiM2NhZu9PyezjSDDN0rDNjU9cI6PCMjiQfgAl
	 LYH9tuSIsHZPhZ7PKBlzkQXShHZfGN71G2a32ahB4vKefeJGfs1oC9eOrNpv2Lk5PD
	 dPG4MAsMDaTPQ==
Date: Mon, 24 Feb 2025 09:37:16 -0600
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
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
Message-ID: <20250224153716.GA3137990-robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>

On Mon, Feb 24, 2025 at 10:28:49AM +0000, André Draszik wrote:
> Add device tree binding for the Maxim MAX77759 companion PMIC for USB
> Type-C applications.
> 
> The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors,
> USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes the core mfd device.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> new file mode 100644
> index 000000000000..1efb841289fb
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
> +
> +  gpio:
> +    $ref: /schemas/gpio/maxim,max77759-gpio.yaml
> +
> +  reg:
> +    maxItems: 1
> +
> +  pmic-nvmem:

Just 'nvmem'

> +    $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@66 {
> +            compatible = "maxim,max77759";
> +            reg = <0x66>;
> +            interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +
> +            gpio {
> +                compatible = "maxim,max77759-gpio";
> +
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +            };
> +
> +            pmic-nvmem {

nvmem {

> +                compatible = "maxim,max77759-nvmem";
> +
> +                nvmem-layout {
> +                    compatible = "fixed-layout";
> +                    #address-cells = <1>;
> +                    #size-cells = <1>;
> +
> +                    reboot-mode@0 {
> +                        reg = <0x0 0x4>;
> +                    };
> +
> +                    boot-reason@4 {
> +                        reg = <0x4 0x4>;
> +                    };
> +
> +                    shutdown-user-flag@8 {
> +                        reg = <0x8 0x1>;
> +                    };
> +
> +                    rsoc@10 {
> +                        reg = <0xa 0x2>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f076360ce3c6..f2c19a1b4c05 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14322,6 +14322,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>  F:	drivers/mfd/max77714.c
>  F:	include/linux/mfd/max77714.h
>  
> +MAXIM MAX77759 PMIC MFD DRIVER
> +M:	André Draszik <andre.draszik@linaro.org>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
> +
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>  M:	Javier Martinez Canillas <javier@dowhile0.org>
>  L:	linux-kernel@vger.kernel.org
> 
> -- 
> 2.48.1.658.g4767266eb4-goog
> 

