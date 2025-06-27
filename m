Return-Path: <linux-gpio+bounces-22368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35559AEC0D8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 22:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D04646DBD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 20:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296921D3CC;
	Fri, 27 Jun 2025 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmlTbSDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BFC2FB;
	Fri, 27 Jun 2025 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751055849; cv=none; b=nDEn7zfRIfMwU/aeFoZlv1UF6SZn92T99yvCav8A72CVCOhZtq+PmxATqY1/4nQaI0Ux2n4aXX4Qlv88nuqOqVZw4PqHJAPlU13dXtQ63lNGTQxiOXrAFqqHtNVKs4fSHP5Xxci5KlYjdcCy8P1vAftkHwpaiYRnZgTPilpXe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751055849; c=relaxed/simple;
	bh=70/EbRKDWwo2aeRNCfM/60F6mNHA//ryIMx908BwwzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLR6uP84wNT37h3FYEMRpTmF36kYoAnkNi3NWScxlFGKYNMi3kXyjQmb6DYvRGVtfWxmDr4TTBzZ3Ge3gqQnEkItIaNgLHj2Fi61SOOucSRSzDr99NgIsF+Kx/xV18qZ9UpmNKeVXAIIF161FqaTCpIyVT28ANavLRsaun89YqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmlTbSDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAEAC4CEE3;
	Fri, 27 Jun 2025 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751055845;
	bh=70/EbRKDWwo2aeRNCfM/60F6mNHA//ryIMx908BwwzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmlTbSDvPR2NipM/ujZnPWtGoBIw/ilPGSJ6PfU/sR2J2393sPU8tcQgpIMINAGdt
	 oYshfyKMhnD/rcbMsjA6E0OIDFR4hgLDiGXxRZIanRFAPOkcYlL3yG6vI7nv1fLkh4
	 sNF81L5ochon2onMUdmQClX21/SjJk4TgLgbKAhERvcXpjWpGPqcDL9gQMLA8g+Ieb
	 7zfUuXMsqw8s3g+zS+HVOhOuRtY8dq8/7YXuGMYFFFBFfLTsTpJjbTq7fXkwVKyDLR
	 8m5PNHnqaxRTMdDF62EU6fB9BWROAjqk+8+RiIUK1z/84RRAqsvCV/WwqmS3s1Wgv6
	 u5D7Mlg3bvv7Q==
Date: Fri, 27 Jun 2025 15:24:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harshit Shah <hshah@axiado.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jan Kotas <jank@cadence.com>, devicetree@vger.kernel.org,
	soc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
Message-ID: <175105584420.24329.3649042034021574004.robh@kernel.org>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-1-b3e66a7491f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-1-b3e66a7491f5@axiado.com>


On Mon, 23 Jun 2025 10:28:12 -0700, Harshit Shah wrote:
> Link: https://axiado.com
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


