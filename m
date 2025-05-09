Return-Path: <linux-gpio+bounces-19853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1372AB147E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 338794A2764
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3A1291878;
	Fri,  9 May 2025 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="NwgyCVj3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7428FFD9;
	Fri,  9 May 2025 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796365; cv=none; b=ZEf7B44YPbS5Gb/EkrNg39KD5uCwK1N/Fpmuj9EyQ/PbeI+Wshft3kO4+SLpvD2qglRDssJMYg86fPUwYOwKKIL9Uc5Wzykyd1Vam9kbAsGeAzGPh8DmX4nFLuJfuy71bJuurPfjrzHfg+uiyjv2Dje2P/7zczTetz7aBjqG7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796365; c=relaxed/simple;
	bh=qSlct4DDCCgoCYbECl4GdlHE+UOZT1M/mcJSKEXEBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K19tFcH74Wm8r5F3TNBHAOSq8o75c817ErKcuSKbTbn2QWbWI30zX3dKOqYh7RGkyX/D5+pTJIoN+EBu1CJ7krYXKa2IJZPtNWAgnONX+BCvyTqPQTaoi4OUSeDeJlK0yz6MLnjzLiDlMSRoY37P1SAvoUPf8Eyv/RRk53BZj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=NwgyCVj3; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Fri, 9 May 2025 09:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHE+CTrnMR2Ej/pQosbeYTQFW+gx7bU1DLRuJAwU1k8=;
	b=NwgyCVj3WnE0BcZ1RmT3kyajgJh7ZmeJ8DszNOsVFNtgnADHiFlbusgtsdfmql0lKr7le7
	F/U6iqHBzgcZwiLRnODBb7xpmz0PH+M54K3dqVDiZwJVniw6x9t6xCVoojHGC9hWKOUagx
	jgY+QYOWVk3mK87d4EjlwVDzEo9eFA00rFn3cdlQAEuE8o95bLmKoqINv+MCS8ySOok9vr
	t40+IBEs56GK+TK0iTSphbzK/Xn29pXmxGGWbTAuMncWGfQviGsRj91UpfRjwFleSw9g9e
	r67TR9B0I/7HiwHou1MT1j4oUcWbIsM8tcONEqxv9Q0D6cS1SgcOI+d0o7vchg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: Add Apple Mac System Management
 Controller
Message-ID: <aB3_QUTH5BzjzSvJ@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-3-500b9b6546fc@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250503-smc-6-15-v4-3-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , May 03, 2025 at 10:06:50AM +0000, Sven Peter via B4 Relay a écrit :
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml         | 71 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 72 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9f1058c15bbf62d84f8a72fdaa354909b02e2801
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  gpio:
> +    $ref: /schemas/gpio/apple,smc-gpio.yaml
> +
> +  reboot:
> +    $ref: /schemas/power/reset/apple,smc-reboot.yaml
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {
> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;
> +        reg-names = "smc", "sram";
> +        mboxes = <&smc_mbox>;
> +
> +        smc_gpio: gpio {
> +          compatible = "apple,smc-gpio";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d85d9d9065db4dc5869788f8a81d9d9a425d7ce3..2c16b2fc3fec76104967530f487123485af1e777 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2275,6 +2275,7 @@ F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
>  F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
>  F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
>  F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
> +F:	Documentation/devicetree/bindings/mfd/apple,smc.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> 
> -- 
> 2.34.1
> 
> 

