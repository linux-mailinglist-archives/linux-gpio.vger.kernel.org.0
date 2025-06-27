Return-Path: <linux-gpio+bounces-22373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CFAEC1E3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 23:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560F41BC05D2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 21:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3162262801;
	Fri, 27 Jun 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psLuxavv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572125FA34;
	Fri, 27 Jun 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059290; cv=none; b=AK/AjusXb7yvpWWZWNXJGEGeWZ+OAClUnRwL9Hfkwz9RNijukz63V4SyvCGzA5H4bE2IupaZ0cwzvx+G/spFmvhS45p5MrZSkAqzcRaV8cSWggxa2QG5tq68GqomrVWj8er5OYZI8to1akUzh2O5v4VS30TPhrCWNuprZfAytLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059290; c=relaxed/simple;
	bh=eJ4JeujYEqEr8p7iiInQq4CDjHaLLtwxoaNgL3PVvp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X56baIPlAzxPuauJfU/pTyuI+ikGJDNINfSD3XtUfSeUgAH6vv39CGxkSnzKBoYmbD68eM4AcJox49CzVtAuFuww/fMWxUPAHy910WGPnbXJscP6LwrGdRYnozGMVFDYU4LaPClhIuYj598N/XxpNc7zyQPack7jukGfYjT6FfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psLuxavv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C38C4CEE3;
	Fri, 27 Jun 2025 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059290;
	bh=eJ4JeujYEqEr8p7iiInQq4CDjHaLLtwxoaNgL3PVvp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psLuxavvIHRpyHijNtJpBPYSZpd4z1Or+RCc530bVYrLFxdjtwPN17Codm1L/WOcn
	 e+rbD54Bx3bwH7Uh+ZPJ2P42eQx9eN8u+e4GBoJN0agDLkSgZs3SSCQWGRjJdeRkl7
	 DLgm6dfoUUcVxoIbeNS2wiE3I01fvhgLu5WXALbMwY76Vku508KckvxCi51oX1YF6v
	 +4txAazDN069CRN7dbiyIZaxcUAejbfraSXeqTe0A1Xp4JN/aO/pWdZyyVZNniFGrC
	 tELVeQJuBp3Ls8JgnsVFQJYN/HWtPxsAqoWDZYr4KXsXnQ8l7N3O5WQtUusBMfgOa+
	 WAKb7Cxk9EG9g==
Date: Fri, 27 Jun 2025 16:21:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: net: sun8i-emac: Add A100 EMAC
 compatible
Message-ID: <175105928901.164047.15283634095632177281.robh@kernel.org>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-4-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626080923.632789-4-paulk@sys-base.io>


On Thu, 26 Jun 2025 10:09:21 +0200, Paul Kocialkowski wrote:
> The Allwinner A100/A133 has an Ethernet MAC (EMAC) controller that is
> compatible with the A64 one. It features the same syscon registers for
> control of the top-level integration of the unit.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


