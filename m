Return-Path: <linux-gpio+bounces-30695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD3D393F6
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 11:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83EB5300F5B4
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 10:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FF42DE709;
	Sun, 18 Jan 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C42Pc/2a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883582BE031;
	Sun, 18 Jan 2026 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731692; cv=none; b=STrASouOJn5Vy7Bwy8xYtO56dRKkh3AYLfH20fl6d7I22lW0iGvvT+pDymNnatwT/lH5n/OuAc76lR6l7TNWfZnZhfp+RpzWftIB4SvlLF7mbqxcovC+BaeKUUrMIhdDOg4WEKjTf/rXb+oiqTiu5dhZWmwUXAPHhXRhbamUqxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731692; c=relaxed/simple;
	bh=MJ/WTcCQVn5ZPmWc0MlqQHQO30rxkRLjFAJjMF+vpdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnWvnA0qDPYoFPXnKyG0oG8ehut4dTeSe5utjk/dsxHwrkdqkLz45kGZejo5Mwa5Vp3JZJ3IwlNoZqFfFfOAb9EkacJBNbNa0jwiK08NCwruzcOxQNrtqGD9H9B2rO3tuQfJR6PzkN15yS84emmMi5GxWkLEU7oUlcrXhl2/328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C42Pc/2a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FAAC116D0;
	Sun, 18 Jan 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731692;
	bh=MJ/WTcCQVn5ZPmWc0MlqQHQO30rxkRLjFAJjMF+vpdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C42Pc/2aoxnPfLZTVaspSQ7sLfoI1nqCfz6LUamigZ16zFYqwXA1PVYgn/d2zOdJR
	 sNFTCRvgAZ7RqnaAv4K9N7UXYtPr06+ejcItBIWazrTmPMBawvzxlTS5ACy1lznj2b
	 o3TsceRQIptk+OXVwrJtbYpVRrHIkkUzPvKqLcmA1pI6aCRni6HyHcld3vZYChZZq6
	 c2m8/dXXSmzCh7EZ9/Y8lylwTOo2rTE/JqXmiuMxEifR6DpLxme5sPu5y/taerBP1m
	 lAlkDe+cZ725rC5OqU2zl8lO4dA4AbMmHxmc2CEdI0B+LLlTdqKfKtKru32m1fFfKs
	 RMK6O5cJ5N9lQ==
Date: Sun, 18 Jan 2026 11:21:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, bmc-sw@aspeedtech.com
Subject: Re: [PATCH 4/5] dt-bindings: gpio: aspeed,sgpio: Support ast2700
Message-ID: <20260118-cunning-robin-of-greatness-4c735a@quoll>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117-upstream_sgpio-v1-4-850ef3ffb680@aspeedtech.com>

On Sat, Jan 17, 2026 at 07:17:11PM +0800, Billy Tsai wrote:
> The AST2700 is the 7th generation SoC from Aspeed, featuring two SGPIO
> master controllers: both with 256 serial inputs and outputs.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


