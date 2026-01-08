Return-Path: <linux-gpio+bounces-30248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D8D0191D
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 09:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B432430BD4FD
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 08:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89A033C514;
	Thu,  8 Jan 2026 07:37:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A41329E5E;
	Thu,  8 Jan 2026 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767857848; cv=none; b=pw+Id4Xqhu24f6huIsxwNa6U/d06d5E1XBRvH5BbZIcKx+W0Ey3xVGcYzkLyoULTpUK42yKV3HZCfxxwjxaD6Oyd7seKlr8+Q7EKz7yUsvmYHfubEikr8dOBbzShIRg9V/04bd4AXGkSCsGv08QhxcMW/O0TrzGczyksjEPZnS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767857848; c=relaxed/simple;
	bh=/g0Knk+PCNEBWe0CdzxrB8HOJijl1G9jpF3ofNoKGEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+9JL8KlIynzQiwdCHYYrGhaWgCxnPksjwlJVHemiEBUulLBwOB/V8nxJohXugA7NWFgH731LirZgJc7rSKZhoTMC2VYbRoJUVsvfNXi3s0Z+k1IsPId7Xozy7sUs+fYL6GmzgS/r2bQ4ILq+HpG9hxNhYc4oByfy5aeDChD5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 44324341EB7;
	Thu, 08 Jan 2026 07:37:26 +0000 (UTC)
Date: Thu, 8 Jan 2026 15:37:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
Message-ID: <20260108073722-GYA3634@gentoo.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>

Hi Troy,

  if there is one more iteration, I'd suggest to adjust the patch titile, 
to make it slightly more specific

  riscv: dts: spacemit: pinctrl: update register and IO power

On 14:42 Thu 08 Jan     , Troy Mitchell wrote:
> Change the size of the reg register to 0x1000 to match the hardware.
> This register range covers the IO power domain's register addresses.
> 
> The IO power domain registers are protected. In order to access the
> protected IO power domain registers, a valid unlock sequence must be
> performed by writing the required keys to the AIB Secure Access Register
> (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property `spacemit,apbc` is added to allow
> the pinctrl driver to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..f05429723d1bbbd718941549782461c49196ecef 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -565,10 +565,11 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x1000>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc>;
>  		};
>  
>  		pwm8: pwm@d4020000 {
> 
> -- 
> 2.52.0
> 

-- 
Yixun Lan (dlan)

