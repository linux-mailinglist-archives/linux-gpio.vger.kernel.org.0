Return-Path: <linux-gpio+bounces-25022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D0B37DAE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 10:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246087C7F7C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CB3319860;
	Wed, 27 Aug 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go8mfA+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397153376AD;
	Wed, 27 Aug 2025 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756282960; cv=none; b=l7xymUPP29qOrN2GYXtm8AkwWWtZTGBJcuXRoWWmdkMOyw0kT1lTDOU6StyVqLHZ10xhLPz1r1Sm1/zJR6DhozXJNm6p3FfdA2K0edNJQXSuhlqxafH2gfYWiK/Zr5xEVv2Y1Zn1AHq1s26nyYfkW6aACJL+wvHJ+QPFcmcd660=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756282960; c=relaxed/simple;
	bh=bpCZIr7vgXt2CKvcPZ9OCN3L7YCgR3b7Ig7779OF7jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkMnoxyy8NJ7Gh9QEJC4N1x40MD7ovp4bm2eDhAkmu+qfbIDOKeT+YiQsdJl3oP1b2FbG+Qj8p+oMydbbRzZPvkUQnjwqHcK6Dcs1SQ3fc0tg4FdX4jipJa/CuZBiZpWuXCAei1GJw0LSDpG0cWBEvzjfCT0aiyR4dMWbaQJlUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go8mfA+h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F6AC4CEEB;
	Wed, 27 Aug 2025 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756282959;
	bh=bpCZIr7vgXt2CKvcPZ9OCN3L7YCgR3b7Ig7779OF7jM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=go8mfA+hofnR5QhXjMpXqJjKQJifXlNmQdATDInNtQtO39GRaeYC7YsulSoXDY7/4
	 Ct9iXqhqE1BJD3X5z1KXu8bGu6V9Orf1knVyt42UnZFwRXxiC8Chvq9SLW/Ewixrwz
	 lrLeqnb0cL8h1mW0mDgfIrw2I+CFucveGrARWqZ25niPaqQtgY25dxlswjL+fa6GEl
	 ijBbD+1BRot9Ymp8Ltx3LR1vLsj8geS1gX4jkWLRSlBwLUI9K7OmRRDjoolBoHYmtM
	 TQKwtrm0r6z46A1PZKJmdzkxea1iczHJoaR5BMhIKordGmuyLVs/4HPDBPodmlTyFe
	 9UUez0jL9HEAw==
Message-ID: <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
Date: Wed, 27 Aug 2025 10:22:35 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250827024222.588082-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2025 04:42, Gary Yang wrote:
> Add dt-bindings docs

For what? Describe the hardware here in one, two sentences.

> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  77 +++
>  include/dt-bindings/pinctrl/pads-sky1.h       | 592 ++++++++++++++++++
>  2 files changed, 669 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pads-sky1.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..10a4a292188e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 Pin Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  Please refer to pinctrl-bindings.txt in this directory for common
> +  binding part and usage.

Drop description, not desired really.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-iomuxc
> +      - cix,sky1-iomuxc-s5

Whats the difference between? You have entire description field to
explain this but instead you said something obvious there.

> +
> +  reg:
> +    maxItems: 1
> +
> +# Client device subnode's properties
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      cix,pins:

No, use generic properties from pinmux schema.

You should also reference it.

> +        description:
> +          each entry consists of 3 integers and represents the mux and config
> +          setting for one pin. The first 2 integers <mux_reg func_num> are
> +          specified using a CIX_PAD_* macro.The last integer CONFIG is the pad
> +          setting value like pull-up on this pin.
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        items:
> +          items:
> +            - description: |
> +                "mux_reg" indicates the offset of register.
> +            - description: |
> +                "func_num" indicates the mux value to be applied.
> +            - description: |
> +                "pad_setting" indicates the pad configuration value to be
> +                applied.
> +
> +    required:
> +      - cix,pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    #include <dt-bindings/pinctrl/pads-sky1.h>
> +    iomuxc: pinctrl@4170000 {
> +        compatible = "cix,sky1-iomuxc";
> +        reg = <0x4170000 0x1000>;
> +
> +        pinctrl_hog: hog-pins {

Don't use hog.

> +            cix,pins =
> +                <CIX_PAD_GPIO144_FUNC_GPIO144 (PULL_DOWN|DS_LEVEL4)>;
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/pads-sky1.h b/include/dt-bindings/pinctrl/pads-sky1.h
> new file mode 100644
> index 000000000000..44550e4105b3
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pads-sky1.h

Bindings follow compatible naming. See writing bindings.

> @@ -0,0 +1,592 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2024-2025 Cix Technology Group Co., Ltd.
> + */
> +
> +#ifndef __SKY1_PADS_H
> +#define __SKY1_PADS_H
> +
> +#define CIX_PAD_GPIO001_OFFSET			0x0
> +#define CIX_PAD_GPIO002_OFFSET			0x4

Not bindings. Drop all this.



Best regards,
Krzysztof

