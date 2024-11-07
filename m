Return-Path: <linux-gpio+bounces-12666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D79C02E8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F46E1C21C69
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FEA1EF93B;
	Thu,  7 Nov 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpv9rIPU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA7D1D932F;
	Thu,  7 Nov 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976594; cv=none; b=cxdIQvTmCRuQXdsswtgKi+z2sNI33BNsNRFwhg3B6NjUs6db1VBxUABlv67H53CMknoMINqjfN/7M9nk1Plmou5MW432MBH9NCz/41I6EUBsOhg5JUmyhuUJ2kQyaidoHUZkQBhLWNtzUccyAVDtT+BctHAL5aWTy4Br1GrMB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976594; c=relaxed/simple;
	bh=mUePM4kJA7mE+bcutoPAeqaPmUxIkvjcyKAZS3M/q4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME6ZJO7ckD4Rurq0bviRKRUYSjxhAi9aM+vKH8myeM8wu7o3lMFpk+O5cq2RULA3NpnPdtzNPPVzqnrgOtgdqDUzJOfYRpDqIlkz9s82FU+HPKxE8tbscFvPgKzDPvSYYoh9rbPP486eMRr0B2AtpDIacPnBrElNc10xOEzgQNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpv9rIPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918E0C4CECC;
	Thu,  7 Nov 2024 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730976594;
	bh=mUePM4kJA7mE+bcutoPAeqaPmUxIkvjcyKAZS3M/q4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bpv9rIPUOzl8S7uTwbRdM9J9o0YsxiYmbVAAKH5ceD9qwLO3eIAENejzZK0rZnTw7
	 2rqHf8V3HixrmYWbgwhJKGt/78yp34yBfjzMWtqdcl1djBeVi6s4c+X1owfkrgifT9
	 CyBNcIk66RhN6/3ahYjF1QQVylKigIXpEMD6ziRRBpbkiT3Z1KZ8XzcB69qALTimhP
	 3V5zhUGD6hm/BEupTNIeZ+/5c8d3MtGRPKzn5ADb4XANWrCAN5VtApMuvFmCmGzenp
	 TO+hks87+zwpAnYA1HQQ6ona/qvszFBudNQXvTkRSe9nbBviwkpKrbLSqLPhx00G60
	 gux9zaBP3+JSg==
Date: Thu, 7 Nov 2024 11:49:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	Adam.Thomson.Opensource@diasemi.com, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 03/31] dt-bindings: clock: versaclock3: Document 5L35023
 Versa3 clock generator
Message-ID: <4m26zy7gfxlwfaid5v7yds5sitwqlojqd3h4hpnar73fi6ll6f@iy3moda672ls>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106081826.1211088-4-claudiu.beznea.uj@bp.renesas.com>

On Wed, Nov 06, 2024 at 10:17:58AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> There are some differences b/w 5L35023 and 5P35023 Versa3 clock
> generator variants but the same driver could be used with minimal
> adjustments. The identified differences are PLL2 Fvco, the clock sel
> bit for SE2 clock and different default values for some registers.

This is one of the best commit messages I saw for such simple binding
change. Much appreciated, thank you.

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


