Return-Path: <linux-gpio+bounces-30003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F190CCEA59C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 18:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9C083004ECD
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 17:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117B526ED37;
	Tue, 30 Dec 2025 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaZQLtCC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49EFD531;
	Tue, 30 Dec 2025 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116780; cv=none; b=rhBZullcyhb7s/77SJ7CnZmLF0ssFKJNwcjV65bt2X7ui4s42POZDwJ3oTLI4n2kcIvsvQIAB9CRfdjv5LOKvm62dtOVXaEtC+Y9dDozB2vA0bCDWQ6qXaJXJnccOMEojPCvHiLdaeGLtOBYz5HrPPUJRapYO4AnyMVf2AyrBgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116780; c=relaxed/simple;
	bh=ILOYy8k0vEwyHW23Hdi68K3x8vNTQdr7Kn6tc5mNowA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exu4NOMeDYoBEq7pGK2S5Mc9XtAfnuCy/n+yjuwH41rGMdnVUgZMvrSbzcIw+ejniZAsncWHtujzTf4qJGeAC0MpODyom4rXmFjDoJsQt9TJwgb1bnV72QJR9SdE3N81jeqzo+0rscJWQjxBKkVfab3JlHLqCuGc8mRa8xol0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaZQLtCC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DB3C4CEFB;
	Tue, 30 Dec 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767116780;
	bh=ILOYy8k0vEwyHW23Hdi68K3x8vNTQdr7Kn6tc5mNowA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaZQLtCCuBKPDeQKKafj+JA3Mq4a3BUcto087E4IeFDfQqkA4SOpqRHjFdXuWYyat
	 Eo7VPYMZFHtj0udAiB2ztbN6os3Ce+UBMBva+rP13Kf3+Na/zlSSXtkP7o2cLGfZNr
	 KFG5R61dq60QBmB3eH/5dOT//iYzPcs+N0hCEzIeeZUdpLGCOgLFvk+TW5FAyrqrVq
	 EUIoSibKYV/mXjkwcwxUQq3vm3iikdW4kpGmUcp02bqKaMOHMF81zZ9DRZCoNCZp+H
	 ySeKFdV/gcYamjzhntFWIYd/iSGukcvbm708WoVRnlOnmg+x+ZwZDtbx2o2FGADAiY
	 WFPCTp/JD9cIg==
Date: Tue, 30 Dec 2025 11:46:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-media@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Jernej Skrabec <jernej@kernel.org>,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add
 interconnect properties
Message-ID: <176711677675.852762.10312933098835387721.robh@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>


On Thu, 25 Dec 2025 18:36:12 +0800, Chen-Yu Tsai wrote:
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
> 
> Make sure that the interconnect properties are valid in the binding.
> 
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


