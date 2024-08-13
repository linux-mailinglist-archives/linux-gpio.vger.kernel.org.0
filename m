Return-Path: <linux-gpio+bounces-8733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031F950BA0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3318B1C220CA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE4F1A38CA;
	Tue, 13 Aug 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tpm2tApF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213991A2C32;
	Tue, 13 Aug 2024 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571334; cv=none; b=C4y/7G6imCKEP6XiQ9NKXV6qnu0EBZyk/VJr2hTQwli7QOHcl8f3f87sJbCRVBdLZpqBzfUx6JwfKWtU0EnJVvBDf4BsMvDz5Ephh7beoBW6O00Kx6wpiDVJVoEXYFHOJ5LtiD6P3hT9XbHrTXFuNvPPuAF3zyvurMwvAWGB1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571334; c=relaxed/simple;
	bh=Bekgvzb5XLT7DY1yKIoKeTm5Up/s7hwf1d4itoPtQxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CM1/WCEJvnR71Zw2zckk2DvFNoQS3otJhfyfHG60PTjGegs9Oo0YU8RPvycOXk2ZQxZmmnm9I4s8xaHbdI5FaPZUMX46XyMWymbAz9QmJU+G7B9mgx5RHQ9hpZxhQSvPgFt2Sv6aFuw9KV8s2Bqjoq2ObazEo/s75um4XW156fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tpm2tApF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F964C32782;
	Tue, 13 Aug 2024 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571333;
	bh=Bekgvzb5XLT7DY1yKIoKeTm5Up/s7hwf1d4itoPtQxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tpm2tApFdhoP+vkauerQhhmKWOP1jkFzcDTmwLzKsNbjmwtFrcR7QWNOhKn6TQETM
	 2PjR9QiPDz1UisIC7f38sNryaAOIbdDIaY3O7JaP4M9g62eEPlRHc0OxEM/26mDklY
	 L57EC4cTFKCV9C8+3rFcnVQoBE5/MxOJufIDdgwYqEsdUWa1UQTXoEsV9wHSw3YqgU
	 7M6rzFm3shsDorWiPXmbl+HcqjYA9vnanRaF1V7Xibd78t2l7svX57D5yKVpGp9jB4
	 9IXWmFo/M2/af5ZCULrfWl+KNOlx6SJlB5i7NGaiVFWSsmJXybj4t3M6LBgnxfcSwW
	 RW3VrAwFvsyEg==
Date: Tue, 13 Aug 2024 11:48:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-gpio@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos8895 compatible
Message-ID: <172357133129.1410952.16581384518223473581.robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-3-ivo.ivanov.ivanov1@gmail.com>


On Wed, 07 Aug 2024 12:08:50 +0300, Ivaylo Ivanov wrote:
> Add "samsung,exynos8895-chipid" compatible string to binding document.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


