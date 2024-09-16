Return-Path: <linux-gpio+bounces-10202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F097A6DD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 19:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33CB1B2935C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3953F158A1F;
	Mon, 16 Sep 2024 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDraCLh/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7E15AD95;
	Mon, 16 Sep 2024 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726508455; cv=none; b=mYOQmmxSu+xH73LR4ScqCqzaRkKrJXRfbkzGg7G8IEGHVC7u3a55HaR3aJewRqpY21XbM/iKpfT6lmWpqDWxcCGOl76EpQsghNer8zbt8C+eKBYAv8p/dsY9paclxML1b/JFdD/o8wkGysJh6+EwG/uVWvy98r5aiJ1Pmo6MHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726508455; c=relaxed/simple;
	bh=H3fDLudcBrNk74QDfeWshQ2J+DgjZQCYFDUHRa1CYlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V77AsUNMfnv791n9Oy1XPO6eyNymhs7IEVIe4NsH/arLzgBipiwMABzlIXSsoJ74SCaZFdBKB98tpxZ5YP4vakOquG3L+IHRvKSTHBfgb/HEd4lnxZP+nGVNArpUP0zhyboXoA9NfuK10+MFgBvZFHLn9eeHxuwhwPufWjvVC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDraCLh/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4369EC4CEC4;
	Mon, 16 Sep 2024 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508454;
	bh=H3fDLudcBrNk74QDfeWshQ2J+DgjZQCYFDUHRa1CYlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDraCLh/vG1D7ShexGLbNoBPrsMYKGapcNed5uODqdI6A0MD54A3BwD+xqfBSVHZh
	 bjYfNl30Bo1/WNAykrEt1kArIxGu4Qlebsqdb6HPCthwijBIGwmAZqNKzuBcbL1zrh
	 5kPL3MLCokSw1zKjOeia5Nn5tetxta/TlhhKpTw+bQVs16XfmDuZPzwLakQZQXMYRO
	 qCoaU/sSgAFEic2KPnaJspXyBa7rnitJ8fmS8l1U78XNQcOdD3QUJSEFKwmoLPxOb1
	 8f+B/IbSWzPbeFiP5j/B69hCb0Ovn9raNF+gsTZHl4+5p+egmUYWMXRVqKJFEbPhXX
	 G4ghU8GhHtJBQ==
Date: Mon, 16 Sep 2024 12:40:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
Message-ID: <172650845270.858385.3434216032560496339.robh@kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>


On Wed, 11 Sep 2024 17:24:38 +0200, Neil Armstrong wrote:
> The Amlogic Meson8b SoC has 83 CBUS GPIOs, thus lower the minItems
> for gpio-line-names to account for it, fixing DTBs check on Meson8b
> based boards.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


