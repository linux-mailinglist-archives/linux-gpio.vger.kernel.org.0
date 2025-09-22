Return-Path: <linux-gpio+bounces-26497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3410B92025
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 636EE163B29
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791EE2EAB61;
	Mon, 22 Sep 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMToxKmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7792E8B67;
	Mon, 22 Sep 2025 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555732; cv=none; b=oGZNkKg1jY8CEhyeodMFKPBpTyWelvEhKbldVCxcD57zKU2Avzffux8SLw/lVW+aOy+vIvNiai6eqPHyDa4IkndCOOpDmsZhj680v2JzRZFyvEzNbVtD1W8SYaNQ/UqfWXvKZB1DvRwUK3/K6AIFPv9+oJRAdT4eGlWuc68gg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555732; c=relaxed/simple;
	bh=S4ZKCw/ZbiWOG5I66sB8OoE++es1UH6MK7wMJa/tgLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsTNcys0de4zc3aj0Ezn+6/58RKUpgNdqmlImLB1kHgI6IIYwJpzBL3LbC22D3zAfpWLRCOWjes6acO1NaLISdbW2mil8oerq8h2AhP8gcqvXvh3MQpW1sVdC6OgQOF67wGlXJ6lS+0BAVtVb99U6IKDcIa+sCt3z6FWg2+7JzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMToxKmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BC9C4CEF0;
	Mon, 22 Sep 2025 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555731;
	bh=S4ZKCw/ZbiWOG5I66sB8OoE++es1UH6MK7wMJa/tgLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMToxKmXaCISE/T+s9Eq3Yk5gsGavS0cFVMAoLoMFl1bHaDJa75ges1tsrcvZ6Sxa
	 5xQ1sZllwcgBGs3BYQ+n32tS3pLQodI6SOjZbubVim6nASW6vC8hEXBfDMvBDWTMK8
	 6uPzh+9z1WVflTkR9tj2/raYa2GonGYwqhE62acPaA4IAYU60nT9Nb4M0MYmVpYyDa
	 fzStI8ztrzM3tQWu88XHKuxhz0FH64yZJajpEF4KUa+ljlBe3oi3tTrJF2P7u9U908
	 EoreqsRMSNBVTMrrXg8BMVmHO+Nze9jZr0J0AUPTP5J90ku/dmrReVU7paOaX+Eb0T
	 G0xuw3AUGig1w==
Date: Mon, 22 Sep 2025 10:42:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add
 exynos9610-pinctrl compatible
Message-ID: <175855573003.31769.17417715794632247649.robh@kernel.org>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
 <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>


On Sun, 14 Sep 2025 19:34:26 +0000, Alexandru Chimac wrote:
> Document pin controller support on Exynos9610-series SoCs.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


