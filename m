Return-Path: <linux-gpio+bounces-24814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659CB31BFE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A7AB41875
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9A43093BD;
	Fri, 22 Aug 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9Iw445E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DE2D7DC1;
	Fri, 22 Aug 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872855; cv=none; b=jEgvzlaRgt2SZWXFfTMsPWu8vyaA7xmx/1a8sSQlcaf60+vZMWG5Ift8U61hyPgf32zf++sh1StkQXhhGUa1BkUP0mhc/LCpFEENN4N7M+2gn2FO15caSLRkFR9kg80C9KJnRx1eg3eMs4Va/HC8vQ1bBmCnIwIKH+WqmvHZaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872855; c=relaxed/simple;
	bh=8F9BbYfnOTNHBOO+Z3nv2sPP1jZcZHNE98BLd3qLBs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYRiXhfwOwfQo81YHNdVZrp/Lctu24oMXrh5Jvl/Y6bH7GPus+sv6+oW7ZTgYpxYioPJqNNH+RXCT64wmqYG7mo6CMzkBCWFtuCwkOscHrYl5dXE2C4xAu4Suc+4Clq8f49TAzbl2G9keoLBxg8e1HP0FUdG3EIcz/xsDvcX2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9Iw445E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE7FC4CEED;
	Fri, 22 Aug 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872855;
	bh=8F9BbYfnOTNHBOO+Z3nv2sPP1jZcZHNE98BLd3qLBs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9Iw445E+SOWmXKGD1xGgBNUvUQsJJNBotJ+vYEzKZbgos7ybOowT51+mSV2N9Pos
	 Q8t522BLGi+fNYg1SPhremVDXtfTGKjLP1+YNiUxDm29HCuzSUsQ7G6X6Itf9076Bg
	 jliWSQj2tPXS/mrYiidZh5ipOerNyVFRNSuC7dF7MepN4bwNw1xVzY9Q2VE2QnJchU
	 vnahMVproW4mHT7rX2CISqldU1/L5IiFcG3FuarpMH45X3cFNg50nKxBHZbl0GlhfS
	 T78XOLlizlzxnfDY2p8ENvyPtxl08MePXn7577wPwEnSbSxzMCrgM5ATiaAIWgJF8p
	 TtmgLp8b1tkOQ==
Date: Fri, 22 Aug 2025 09:27:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>,
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: gpio-mmio: Add MMIO for IXP4xx
 expansion bus
Message-ID: <175587285377.3657858.11210919466369180925.robh@kernel.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
 <20250820-ixp4xx-eb-mmio-gpio-v1-3-0e167398c8ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-3-0e167398c8ac@linaro.org>


On Wed, 20 Aug 2025 12:59:45 +0200, Linus Walleij wrote:
> This expansion is a simple MMIO-mapped GPIO device but the bus has a
> number of additional properties that we need to bring in using
> a reference to the bus child node schema.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio-mmio.yaml        | 31 +++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


