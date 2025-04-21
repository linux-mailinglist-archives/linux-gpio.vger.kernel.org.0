Return-Path: <linux-gpio+bounces-19104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6449A95686
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 21:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123511880817
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Apr 2025 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF9F1EDA2C;
	Mon, 21 Apr 2025 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbC0NnAi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25971EDA14;
	Mon, 21 Apr 2025 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262682; cv=none; b=UH5zkDySKAtZuQP2k0LrDnNeTeqqYp2Ie2JPx/PSx07cjlLAx6uLcwVZGapOrph7HhYQItAaTtiSXwgOH/DocKtAMCGMP00kdDl/uNXUjO3gGQjxStxsCe8GKuvYju0iYiQXE4Ywq9KoX7OIVSojXgZ6mk7No8/wm2fgfskxoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262682; c=relaxed/simple;
	bh=h7Ge3JqI2gUvZQ3tKqKvk1UQ6gAx76a/Wgupd8InyfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpZaAPAEDbRbVjAGuFUmLGN7sQs9BS3ouCxvPMO8Wg/6FNPiEC33YDAJPDfkNIj/vt57RGrO0qBF2cFeEOkPe8D9rdq9DFCUn/VRaisHnXHmLyZeQIyGaRRe0B7SZLDxbwRI/FbSOHqvV2Kh0bpqxOavIUx1LnZ3Z/1KTFLAbx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbC0NnAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF655C4CEE4;
	Mon, 21 Apr 2025 19:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745262681;
	bh=h7Ge3JqI2gUvZQ3tKqKvk1UQ6gAx76a/Wgupd8InyfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbC0NnAizemZjXaq5L97y59y6hQNh6bjPjqf/2hSnifbBDjzWQaw1oFn8tBxaA+yU
	 ad5lMhd4r2JU1ZbjD0Xps/X2EB0fAmbj+umO45aoiza5/R048EkZ4XSvktgbyqe/nT
	 E1jieRne9VQDbWeWT2bWnTFRhW5/svlmVpordBRXe93kIWIHWRBENvN71qJ/Wj8YQ8
	 Nt7m5jHUwB9aukmeG/tXfpOJGfpQb7QO2KPLoTFqyWtinOJCfSmfqMzaR9u/yWqYGQ
	 Y43e2dcVQvNojJ06XC79rePdJn8EivPj/uv2ayDYD40b3OhA09+Nsd6Hdi++//CTzM
	 agu1CAVkTFGdQ==
Date: Mon, 21 Apr 2025 14:11:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor+dt@kernel.org>, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
Message-ID: <174526267847.2645979.6771559999426063209.robh@kernel.org>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>


On Wed, 16 Apr 2025 08:15:27 +0800, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


