Return-Path: <linux-gpio+bounces-9402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDFD964DBC
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 20:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08194B21863
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 18:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDC31B86E8;
	Thu, 29 Aug 2024 18:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITgXofYm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98AF4D59F;
	Thu, 29 Aug 2024 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956565; cv=none; b=BFSu5fr004fQ9YwRr9cq9Bck0rxod4bE3Yzn+k/rAQqGHXlEiltzmNEsEzeMhB9lvU0pIE24NgvnryMPP6f2F+DRYXrYv0f051EQ3x7Mr0BLuRL84wN7J/bvgJjwtEOdync+DGXKXPjTvYUSYruzaK/waeJGTAFRrKOhqByLG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956565; c=relaxed/simple;
	bh=Mxgf/84Y368eJ01uALZl6+hxWNZdpBDsZMUdIPn0f5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IspfnZAiYeTZe3h1KhWMjLEcDMYvrAb2X+ig8XvXrboHs1nCQGPILu1Tgg4ef6bZi6nwqPLeFmzECqWCAwQsIyOYDZl9wjQEkLOqWFaiwznlgvuaxDPdAg0CcxSm8yKG5FXfhAkrzZOHNge5y0Hdjs7hGdtLwCDb+8X7wVabCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITgXofYm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6647BC4CEC2;
	Thu, 29 Aug 2024 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724956565;
	bh=Mxgf/84Y368eJ01uALZl6+hxWNZdpBDsZMUdIPn0f5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITgXofYmvTEoWUdQ+jq3yc3XOD7MH1h4mlishkA0S+AzZMScvyn11W1HoE4N/6do9
	 nUxWggFoDfbougAQ+SMo7yYHF75VQ/2Zw2gMSTkw2+Tfs1RUeMPSfrziSSqTTx3YE7
	 gI+nQc5qXP5SQ0bHWqyFiS6eX7Gu29w/GaGhBYmCEbClL8aG3KJ0AVeHZveus0SkrM
	 iymZOgHeteGlri8HkJ4YhTmoeyH1c6SJZR5ZRLECuusoWFcDbEmbXnPYVWhdj7RwGf
	 rD78oiKXQaLQkLvSaNzHhn4Z01TPuB+89QmRb6iUh1y6ff7cQQx0WXfvrUPMAZfbUz
	 +drnU7Bobk2Ag==
Date: Thu, 29 Aug 2024 13:36:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Meng Zhang <kevin.z.m@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for
 K1 SoC
Message-ID: <172495656327.898546.917420601420420121.robh@kernel.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>


On Wed, 28 Aug 2024 11:30:23 +0000, Yixun Lan wrote:
> Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - drop spacemit,slew-rate-{enable,disable} property
> - use drive-strength instead of drive-strength-microamp
> - fold strong-pull-up into bias-pull-up
> - format fixed
> - title fixed
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


