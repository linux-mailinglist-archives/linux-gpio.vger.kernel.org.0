Return-Path: <linux-gpio+bounces-18122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C297A767AF
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 16:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D0483AAC8A
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371A0213E81;
	Mon, 31 Mar 2025 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNlrkrtA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68217A2E2;
	Mon, 31 Mar 2025 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430866; cv=none; b=lEmp2f+Oq56071g0nEyP2MVZLss0rNJDSoNQO/YLOFtf8KNE2HJ88wWfepwR0aTy1olpFR2wfss3Bm9wj55X6PZwW01V01j0kHur25hST5x36oUVtgZmcS3NBN1tqLSUavdR0pD9ZySyJumxHhUr5Fy4h8E/OBchszq6zPy5O2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430866; c=relaxed/simple;
	bh=W9MupiPxxmBkPryOxN/L+ti+aXulksymMfGot8jiKJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmNCT6237atLZHTMtFB84l4nxUQFnn6yD2tJHYx15BafkKPz6gfaas+xLPe5WOukNOrpuh57BdRRked/V7DZ007bG73fXRqswmHAPdMY9y4wVSguQ5dGB98OadHl5TV3XGL2zR10F2RKoQGb2IzZfVY/IHeNo46yT3vvcC8aMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNlrkrtA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FF0C4CEE3;
	Mon, 31 Mar 2025 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430865;
	bh=W9MupiPxxmBkPryOxN/L+ti+aXulksymMfGot8jiKJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNlrkrtAbhi58Cj9Gwmace4dnDaaWlgJ+/5tKpXbS4UQM2DHXcUTOYdvUCRkjSfoy
	 izmaVW+H4PUxQjqoELkP11nQl4N02afxowDr/nmPA/TR8CFyYMSDTbQAxl4Dq1224B
	 mcYCxZh2Jw6WPBtfVLH88WkPS3rEcrkHG8S0k49DMfoWzSESKaQR34CP8kLiEIrd7h
	 5bu1YgQwPPgycrSnUabLxp9g41RYKPWvXwHm+f+q4XuUHZgUgN90S2jTyAjvvvgmZU
	 fn38OuDtWeu++T271sz/V3x7chaMlW6NWOKfi3qxYicebW1/QciDqoHKqnxyi0OX9Z
	 8cS74b2OM+gEQ==
Date: Mon, 31 Mar 2025 09:21:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-mmc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 04/15] dt-bindings: soc: renesas: Document SYS for RZ/V2N
 SoC
Message-ID: <174343086357.2718398.4573636062577343035.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 26 Mar 2025 14:39:34 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the RZ/V2N (R9A09G056) variant to the existing RZ/V2H(P) System
> Controller (SYS) binding, as both IPs are very similar.
> 
> However, they have different SoC IDs, and the RZ/V2N does not have
> PCIE1 configuration registers, unlike the RZ/V2H(P) SYS IP. To handle
> these differences, introduce a new compatible string
> `renesas,r9a09g056-sys`.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


