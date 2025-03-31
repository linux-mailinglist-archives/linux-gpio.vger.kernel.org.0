Return-Path: <linux-gpio+bounces-18125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2DA767C6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 16:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700981888761
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 14:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7462214204;
	Mon, 31 Mar 2025 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcEBVVtr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016C21127E;
	Mon, 31 Mar 2025 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430989; cv=none; b=AU+gG9sxJkswvVkBrxSy8GLdPBQEdUXUym51KVFwrS/j1a8daJzXAJO4xg6CorYF6p19mtg4rIbuZJYpbxzqv1OZZRS6Spqwazzq2oWmFOzafN+2bit+TIPBS4/2U6kzohwIn0ivp5yrW99lV1HHwzFWCeq2tmrDcpuKFw+2it4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430989; c=relaxed/simple;
	bh=09cF1DDuW9O5QO9g7DxuD6Lrf2Qs3ubzxujS8A/3Rho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMupXp5h89gOYZO1Q8PyhvZ0ImFCINu+mBKfP3mTKf4QztpmkJ/lV9D2M1Q3Y5mzzrUuF29OifqSRkqpl9LO5Aol07YX1XCzKySj6hs5jAuGhupV/wXx6bmV8+K2692zcC7CEKBop5m9bqlX1lnTx0IRNUnEcGyFLB1fDDBL8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcEBVVtr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E376C4CEE3;
	Mon, 31 Mar 2025 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430988;
	bh=09cF1DDuW9O5QO9g7DxuD6Lrf2Qs3ubzxujS8A/3Rho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcEBVVtrXNVyIuBDQsTheOM4Xd3dziRMcK5I8XsO2poo+r1C5pIvRN8yUdTU+DxDe
	 WVcGhg6IHdrACDrXUvFb27qiwe8x95oLJuehpxDjI/cON8U5vjGARPLBzeDEWuHK1m
	 +F/xyMnBAacXdH5yRg16xoxLmcEGY2AVTCDywYiIqBl0xG9ukDzylYdeslWFCOcnvC
	 NAgluqK9YH9X6C3JCz4NI5r85CjJPnvFdnLsaVcWj8PDAoKQ3i1rHJ6grKSfDd9j8/
	 TAxa5EIMtAejT+R1Cg9yHZdCRP81v2rX+44JA27zaC6miRvybCWThk5UO6TrLIT0wA
	 Ldd++XibU6H2A==
Date: Mon, 31 Mar 2025 09:23:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-serial@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 08/15] dt-bindings: clock: renesas: Document RZ/V2N SoC
 CPG
Message-ID: <174343098722.2720962.4671608983688904024.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 26 Mar 2025 14:39:38 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
> SoC Clock Pulse Generator (CPG).
> 
> Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
> RZ/V2N SoC and adjust the title and description accordingly.
> 
> Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
> constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
> clock driver will be reused for this SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     |  5 ++--
>  .../dt-bindings/clock/renesas,r9a09g056-cpg.h | 24 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


