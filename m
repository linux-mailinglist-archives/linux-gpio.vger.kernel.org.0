Return-Path: <linux-gpio+bounces-18124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D751BA767BE
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 16:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E28188B157
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 14:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CED213E85;
	Mon, 31 Mar 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObKmAjXy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A43234;
	Mon, 31 Mar 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430929; cv=none; b=VBNAxukH4Fm9wX1hFp8OCqfI5qUzUqxZE9MfHxG2veyX0Jd8imW9NWAjTjmcok803YYag585uWm67ptGJVkQEKa6xFdH89KnUOCZnuDO++dTo6QCXZpWcVaECsEuXv3JulG9RRbFfSens22lSKGRC3bGqrVBzjxsp2Uu4QTKny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430929; c=relaxed/simple;
	bh=U9hWi4Wcm+e5yEwX/JwrER+hs6BFslHlhI3vcKnyY1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJdNGT2De3qS2WfkAX+70Jl2KDyjgx7IlmQfnR1fQrcshgwzQW02TGiqZHwbaEUGfI1Wam2YV6KqSgyJD6YhavBW0lrnLMW6366/p0HXBzMQURsRFCm7487KiYcHTYRwuMTXRcXCfGnHq77YBb1C5bdTRdhGrOJyEAN9aThXG/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObKmAjXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE1AC4CEE3;
	Mon, 31 Mar 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430928;
	bh=U9hWi4Wcm+e5yEwX/JwrER+hs6BFslHlhI3vcKnyY1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObKmAjXytu57SfeL5ZeJdHC7hYqPQQhVOSE58amfPgX3A4NQ5F3hH9oqamChH/jYy
	 fPtQS66+YwpD3kOt4yjxSydo1AfNTloZabzlawbJiCVNie5ymIwKcG1KRZX2hmf04t
	 bErJdcJDKujI+ueXs5bi4d4gIW8bwla1uPwZ3kq4Qn6bpnBRLK0tiG1qlQEpLDoAs5
	 5dEBqTC6EjchWt2O4l7BKTv7n8bQ60AqmFVrTt4XjTQvAGYcys1OiJP7sT130UzLaS
	 LW1N7Pj9eBs13L/o0KsTqes+wNcfXlziXsHaOyue4ti9wOHitCH3EJU41+Ue/+3Nlu
	 PdUf3JUBs/OPA==
Date: Mon, 31 Mar 2025 09:22:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-serial@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, linux-mmc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N
 support
Message-ID: <174343092707.2719758.2548566419731901168.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 26 Mar 2025 14:39:37 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


