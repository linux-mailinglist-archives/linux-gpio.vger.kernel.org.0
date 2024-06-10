Return-Path: <linux-gpio+bounces-7331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EB902B3C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 00:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381751F238CF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 22:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FD314D6FF;
	Mon, 10 Jun 2024 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huEybc9Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0055337F;
	Mon, 10 Jun 2024 22:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056852; cv=none; b=eDsAjj4UwCI5H0Q72E7p5ilxFbAYEiUOtvopCjydDxxWlVKaE8KDdPvGlP1Noz5tiGFa3MrAgQGZzkUS/Xequ/Tkz5KRSSbDJaHQBBi2q4oVKCuYnDq0R7V6SNxfy6BmcXghVSMV87BoRUS1EOS6hvveMcgzB3vUblj6hGhqHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056852; c=relaxed/simple;
	bh=4hNrFc5LQ7zPOmlhF4e5T18BjWyq+GThHayn0/NaZ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2A3br9f0Q1kxS2i1Z36i6WRY4ROghP29UlGvHbT84Q8w6k4HNZPnMFmRbxEhfanmYu9P/GBZ3KBjS9oG1QdsYhdyR742hQ1MwnLLfZfbamazEei1AqPwQSbCpoG7AojgS5oROM1sEPeSbnO1lHsKlmUXp+ZxsYfAHiZIJUYb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huEybc9Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B717CC2BBFC;
	Mon, 10 Jun 2024 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718056852;
	bh=4hNrFc5LQ7zPOmlhF4e5T18BjWyq+GThHayn0/NaZ8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huEybc9YuEj0AZwnpmz5EXvHdpAREfdtqHkySmqqhzG3SNpEtBUesnoPIL6ndf4P1
	 UNxE7hu5V0shaT0L8hhi+YeUmp2us+aHrr3XY/CTcTBc3j+TuA4QD5MDAkK9Q0p4i6
	 Laij4U3VHDklXrUH8YhDxMzV2vbetKGgxts5PCtWsfxAiumelUv8f+tLnDp4Xydj8E
	 G2c+p0kiKlssgBeLTXH0G/eFMG/1e7gm3Y2i+3Xsji4CQhdd9hjU3A2ruFzwZ8X/d4
	 dpOpbN8xy+GXEGdlGVFEddOdZiLLzjoF8P5dcbLawM0H1pivb57o0et6/9woy7Noo4
	 ADSX+cTDtdVcg==
Date: Mon, 10 Jun 2024 16:00:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
Message-ID: <171805684854.3144242.13947017914816663654.robh@kernel.org>
References: <20240606085133.632307-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606085133.632307-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Thu, 06 Jun 2024 09:51:33 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add documentation for the pin controller found on the Renesas RZ/V2H(P)
> (R9A09G057) SoC. The RZ/V2H PFC varies slightly compared to the RZ/G2L
> family:
> - Additional bits need to be set during pinmuxing.
> - The GPIO pin count is different.
> 
> Hence, a SoC-specific compatible string, 'renesas,r9a09g057-pinctrl', is
> added for the RZ/V2H(P) SoC.
> 
> Also, add the 'renesas,output-impedance' property. The drive strength
> setting on RZ/V2H(P) depends on the different power rails coming out from
> the PMIC (connected via I2C). These power rails (required for drive
> strength) can be 1.2V, 1.8V, or 3.3V.
> 
> Pins are grouped into 4 groups:
> 
> Group 1: Impedance
> - 150/75/38/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
> 
> Group 2: Impedance
> - 50/40/33/25 ohms (at 1.8V)
> 
> Group 3: Impedance
> - 150/75/37.5/25 ohms (at 3.3V)
> - 130/65/33/22 ohms (at 1.8V)
> 
> Group 4: Impedance
> - 110/55/30/20 ohms (at 1.8V)
> - 150/75/38/25 ohms (at 1.2V)
> 
> The 'renesas,output-impedance' property, as documented, can be
> [0, 1, 2, 3], these correspond to register bit values that can
> be set in the PFC_IOLH_mn register, which adjusts the drive
> strength value and is pin-dependent.
> 
> As power rail information may not be available very early in the boot
> process, the 'renesas,output-impedance' property is added instead of
> reusing the 'output-impedance-ohms' property.
> 
> Also, allow bias-disable, bias-pull-down and bias-pull-up properties
> as these can be used to configure the pins.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Sending just the binding patch of series [0] as reset of the patches have
> been Reviewed.
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> v3->v4
> - Added a conditional schema for ensuring the reset length
>   is 2 for RZ/V2H and 3 otherwise
> - Updated description for renesas,output-impedance property
> - Dropped '|'
> 
> v2->v3
> - Updated description for renesas,output-impedance property
> - Updated commit description
> 
> RFC->v2
> - Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
> - Updated values for renesas,output-impedance
> - Added bias properties
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


