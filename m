Return-Path: <linux-gpio+bounces-29945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A3CDFC75
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 702203004406
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25EB31AAB1;
	Sat, 27 Dec 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTWjKue4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B9D2D0606;
	Sat, 27 Dec 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840305; cv=none; b=HD7CIettlVAP+uF65oxu8fBdL4RBgo0TZsSqYYnUhUQjAQ2MimX4m4vhzRWIKdiH6jSW4mPgcoK7tl/x99OB/x1peweqWgYnS3XQOS2FpjJ3uGTTSBfb4EKEmdUkHLZZT8uT9+QDa5ndmbjGwAF5H4yXXUjFgZjw9o6R3mwj31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840305; c=relaxed/simple;
	bh=/pXRR/sWcGQCcY5EBpPQcvK8Drdg24de1jwnX3o0WXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvNEPmvVvfxwm22N2FgqBxWwAvm5bRbIP1jXynmmk0LC/lX8zgbSzgq15UZvvtuscsqp94vxnEVC2tS3dJIA6S0FihQcic27LR85qyTCiWnTsbXUGRzEe89i2fFETi9C/hAFWIJQg89V7gDL+fVFUZ5pBiuTCUykmHANv8ETSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTWjKue4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1AAC4CEF1;
	Sat, 27 Dec 2025 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840305;
	bh=/pXRR/sWcGQCcY5EBpPQcvK8Drdg24de1jwnX3o0WXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTWjKue4TjA1ChtdzFqrhqVW8jMA2ZJhY0FS9H3uB6ODx57QrTRsooBNJDU/sWjtg
	 l8oLOuVJ++slptmhKHpqpCQ3jOaucdGTxmTqvXoHAxCWj69XOE2zWZPBatwzcMwHaQ
	 ko67X//SoFPtUoxeJRL0QXKgOiRbYBfQrfWNAzqP92TSE/bpP1h3LTzxaQijJhkgql
	 Hrg6T1sQz2W3kdUvHPT/yGRqxYyDU2S3OStsZL/brZtjBOKB5S9LWm5KDeFElZrnI9
	 3odLcPYqreAbaryfcizU+3Szdt/r1qp80aIcK98G3gzs2E2lOwaNEO+kDRar5ZYS4g
	 GXFdCLv8Dutbw==
Date: Sat, 27 Dec 2025 13:58:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <20251227-sambar-of-imminent-persistence-fd8c51@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>

On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index c5b0218ad6251f97b1f27089ffff724a7b0f69ae..4dc49c2cc1d52008ad89896ae0419091802cd2c4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -32,6 +32,15 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  spacemit,apbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that access the protected register
> +          - description: offset of access secure registers
> +    description:
> +      A phandle to syscon with byte offset to access the protected register

Say here for what purpose.

> +
>  patternProperties:
>    '-cfg$':
>      type: object
> @@ -111,6 +120,7 @@ required:
>    - reg
>    - clocks
>    - clock-names
> +  - spacemit,apbc

That's ABI break without justification.

>  
>  additionalProperties: false
>  
> @@ -128,6 +138,7 @@ examples:
>              clocks = <&syscon_apbc 42>,
>                       <&syscon_apbc 94>;
>              clock-names = "func", "bus";
> +            spacemit,apbc = <&syscon_apbc 0x50>;
>  
>              uart0_2_cfg: uart0-2-cfg {
>                  uart0-2-pins {
> 
> -- 
> 2.52.0
> 

