Return-Path: <linux-gpio+bounces-23059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF051AFFA74
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210E8166220
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 07:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F612882B0;
	Thu, 10 Jul 2025 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAeG1Z8f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1911FFC1D;
	Thu, 10 Jul 2025 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131456; cv=none; b=juVV8GK/XhbrYD8sKOaeF/NOVC7k795sHm1lTZ52uNzGj12tPeJrswVgmWxaKLRvNpS2Pl+YDcqkK9+I2sOL5wqJDKgzM23nNVG2DiUtv8bZIm1ZTwMxNk0efEaSUFY73FBttMlcXIJPYtko3WooNNma18eBAdS7/1VdHSvUV5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131456; c=relaxed/simple;
	bh=PkKCrCcuyuxh4trwp8qE8i2qCxJqLT90JXicLKiO9cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxwoA+MnXfyLbq15yaLAp+ZCoVaZxC7zO9jrMCUn2tfycrd7QmPtWTzOa+9IgyV+tiPlPCFhV1YwFo5hvf7c19qRBMOzQKVZx/XMjzbGIgkAoZcMEu6iRDYKES70WdvtltPq+gNY1s1vr2YL9xKwuw1eFMNOKgZHMtqbv0rDw1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAeG1Z8f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3C0C4CEE3;
	Thu, 10 Jul 2025 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131455;
	bh=PkKCrCcuyuxh4trwp8qE8i2qCxJqLT90JXicLKiO9cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jAeG1Z8frnlkFN+0+0Nw0xKkqVZXOpspn0FYUUkeiW8FbebUB1TRP6wihV2qGCaBz
	 upffSTPPJ+5TU0GY+D1Am7yDN3eZZRLKCkvAjS1b3vyAvSZTze2402CjDpG9X/yTCR
	 0OiNSikEc3O72nfXpRJ86dh62L5FM+Ohwp+tz7CCL2MjxXkNltCMKzFsZQhWbfX2g+
	 osyX2l4l+qqXsEHtZHq8C8aTOxj6DzP8FMyq19Q4oYGfS64m99zsNUuSvlC10vYakQ
	 GpSdkAdr0TfiDmdmYTn+p1z8SENh6WaMij/5mUrXjnqjebTGEUnhFqDvgWcnswsgmE
	 8D2G8ON4F6DYw==
Message-ID: <7b9a8203-2d66-4735-a6a2-762f57fb5cef@kernel.org>
Date: Thu, 10 Jul 2025 09:10:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] dt-bindings: clock: Add ARTPEC-8 CMU bindings
To: ksk4725@coasia.com, Jesper Nilsson <jesper.nilsson@axis.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ravi Patel <ravi.patel@samsung.com>, SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>,
 GunWoo Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>,
 GyoungBo Min <mingyoungbo@coasia.com>,
 Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha Todi
 <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>,
 Swathi K S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 Dongjin Yang <dj76.yang@samsung.com>, Sang Min Kim
 <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-3-ksk4725@coasia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250710002047.1573841-3-ksk4725@coasia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2025 02:20, ksk4725@coasia.com wrote:
> From: Hakyeong Kim <hgkim05@coasia.com>
> 
> Add dt-schema for ARTPEC-8 SoC clock controller.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>

Confusing order, unless you really understand this, but considering you
did not add your own SoB I claim you do not understand this. What does
Ravi's SoB mean here?

> ---
>  .../bindings/clock/axis,artpec8-clock.yaml    | 224 ++++++++++++++++++
>  1 file changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
> new file mode 100644
> index 000000000000..baacea10599b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
> @@ -0,0 +1,224 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/axis,artpec8-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axis ARTPEC-8 SoC clock controller
> +
> +maintainers:
> +  - Jesper Nilsson <jesper.nilsson@axis.com>
> +
> +description: |
> +  ARTPEC-8 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. The root clock in that root tree
> +  is an external clock: OSCCLK (25 MHz). This external clock must be defined
> +  as a fixed-rate clock in dts.
> +
> +  CMU_CMU is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_CMU.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/axis,artpec8-clk.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - axis,artpec8-cmu-cmu
> +      - axis,artpec8-cmu-bus
> +      - axis,artpec8-cmu-core
> +      - axis,artpec8-cmu-cpucl
> +      - axis,artpec8-cmu-fsys
> +      - axis,artpec8-cmu-imem
> +      - axis,artpec8-cmu-peri
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1

reg goes second, after compatible (Samsung bindings are not the best
example because I converted them long time ago before many coding style
practices were encouraged)

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:

Drop contains.

> +            const: axis,artpec8-cmu-cmu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (25 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: fin_pll
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: axis,artpec8-cmu-bus
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (25 MHz)
> +            - description: CMU_BUS BUS clock (from CMU_CMU)
> +            - description: CMU_BUS DLP clock (from CMU_CMU)
> +
> +        clock-names:
> +          items:
> +            - const: fin_pll
> +            - const: dout_clkcmu_bus_bus
> +            - const: dout_clkcmu_bus_dlp

All these names should be changed to match what is the input. Look at
latest bindings, we moved away from that style.



Best regards,
Krzysztof

