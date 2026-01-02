Return-Path: <linux-gpio+bounces-30057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5ECEE3F0
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF75D300D16C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C612DF13F;
	Fri,  2 Jan 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyKegCqD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F24824728E;
	Fri,  2 Jan 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351698; cv=none; b=UA21X6wbmgGfnx3obTWLDd/aox+mN194ULsSPLrwnJTTvT2dIUag+NEqRanx65t28/L6nHjxQDcPZ1A+9esQ5Wep8tAUwar1kbFaRsH4LOp6J55mBbPiu7QQfooCgM/xpDlElwt3pr/rM256BduC50zzvEzLg8VB1W4i7c2SmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351698; c=relaxed/simple;
	bh=5IRg4FH/bYd3meE/ovtPP9K2dhz9OcEq9fFqUn6o65U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTo58dOba6Lhm0/N1vXmSOIq6z+Vc+Xnjhf6beF0GPUO1drzZzd7jxQv75QbhNybRwToSiVmsUzfZXhqR9ziN/m84/8vI+QjCVKLXw3vl0IZjMMEKD1KUSgH1lgAniIhEmxiNibCUCkVOW8Iduol1N79G6zipPlUfGXKDhJUiFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyKegCqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25C0C116B1;
	Fri,  2 Jan 2026 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351698;
	bh=5IRg4FH/bYd3meE/ovtPP9K2dhz9OcEq9fFqUn6o65U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyKegCqDoK9pUoxQ8Pbv6Ld54Ic9/3+6RQEY4awh1fl+y9IDlGIhKJNqwADGO4l+p
	 0gWSbwKEHpijP8ETZ8rD1pdY8h2WrDYuAabRpClUs+96pdE7M5g4EgyznmZdR7fmtI
	 xgKMrjPwt4D6Ejbx24coW32NiXIs94b904lnGOTXHvzzTzvcKwvBaG6C1weqJSF7W2
	 OuAOTeVch6I+6iA5ISs9ixUwLgRW/EEqycNg7ARxqaGY2KHGQ0CeS7JULjoum4SDNo
	 RBysUnLod834BXSvVjvQZ3k/UQXq53heKPxTGs1666jUkojPWsBEz1nPc9Y6T/rCU7
	 mrYkIbeUzAP9g==
Date: Fri, 2 Jan 2026 12:01:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20260102-diligent-kangaroo-of-enterprise-3d20bf@quoll>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>

On Fri, Jan 02, 2026 at 03:00:23PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


