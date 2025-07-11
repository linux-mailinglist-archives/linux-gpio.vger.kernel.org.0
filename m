Return-Path: <linux-gpio+bounces-23177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF8B02385
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7AE5C0A1F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E52F2C5C;
	Fri, 11 Jul 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1bRN4l6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D828DF27;
	Fri, 11 Jul 2025 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258138; cv=none; b=B+Dct8eutducT7+KUyNfY9EGppqRfz53B86lFzRkzoGZj773HXnrlAAjskQeYuUtarwPU6SzWdll5D69EUl1J+ZpSELICJeoZ9uqLhcIPkpE6ZnUlio8jeC98ALY49uHCf5+MIPNzxo53cBaRw7Q9Fr6lq/Yisb6uZgHDoetHp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258138; c=relaxed/simple;
	bh=JMFnro4S2+uEJbPEf6pcuOfTY8pUVut/obbX3jU5bFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDMOrGxnLZD6m0xXb+iMN/saJGFGYk6myz+JepXLs7Du9vc+0TiOdSKjA47IQW++bSIaeoL0D6ofM5fjhIZL1CqBz+XDv/yfYOHZ+VOekqUGTuGy5PV51qORC79T4vAd+AuzrBTQue5E/JWIs4UddV5apDrLCLTWKANB0SytdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1bRN4l6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4B8C4CEED;
	Fri, 11 Jul 2025 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752258137;
	bh=JMFnro4S2+uEJbPEf6pcuOfTY8pUVut/obbX3jU5bFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U1bRN4l6oxak+tvbW/yxX+FqOgjyiKYybGjPH9RETgzNivv6t4vCm0aYCObGBpOLV
	 yOBZ7M/1/JOiF5yeCGFg2CjoP+y6ZkJ+xQg1cwnNUR1bpq9kPsQbJdZMb/gT4NQyp8
	 iuoiwqXJiQfdurOLEmFfMBoea4bsPVFirWMIDpRiR7sV0geMA0Fz2iwfWN5ytynPqN
	 vWELjNQDA8uwg2pFMbK03L3aM6KWuAV/DSwDOEC8Tk6EkgytoNig7rSz5GISKgs6Zg
	 ikVbIa6FjrtHu6gFZxjAa0hcmGFklOj7qNQfcfmtjF5GEngs05joFqhi0nq8cbdRMA
	 TNpBN/12eHt1g==
Date: Fri, 11 Jul 2025 13:22:16 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
Message-ID: <20250711182216.GA974600-robh@kernel.org>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>

On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
> Document the Top Level Mode Multiplexer on the Milos Platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/pinctrl/qcom,milos-tlmm.yaml          | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0091204df20a0eca7d0d0e766afcb8d08042b015
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-tlmm.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,milos-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Milos TLMM block
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm Milos SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,milos-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 84
> +
> +  gpio-line-names:
> +    maxItems: 167
> +
> +patternProperties:
> +  "-state$":

       type: object

Because a boolean "foo-state;" would actually pass without.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +    oneOf:
> +      - $ref: "#/$defs/qcom-milos-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-milos-tlmm-state"
> +        additionalProperties: false

