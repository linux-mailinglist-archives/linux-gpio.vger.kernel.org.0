Return-Path: <linux-gpio+bounces-10234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8D97B59F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 00:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D355228443C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 22:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A4518BC15;
	Tue, 17 Sep 2024 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4X2vVKm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34615B0F2;
	Tue, 17 Sep 2024 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611273; cv=none; b=Wv1CwvZzYYjq7hoX4uIz2TfEMAnw8ZA1VCDljVDnCY8HF8LOxmDSAtV2d3R5pLCdQVZjPkUFZuQIY0ysb6ZYYEQ6YcLMHdvOM6aUwHcb5hwM2RZxLWsbgU2fSniWzYpGRMzt61YYihDS113ciVaYqLuEWZ25SWbKNS+tgEAnjz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611273; c=relaxed/simple;
	bh=cobEPWqsWZm0Du07sK1Y/uq1qTyF38HoM8wKmDcvw2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k881lGiceQmVuppfal4+GZt3EoafhPM7+hh1qeCsndKkXOhPas6rZ8KgPDs5LP50m85p/0yBW+6owVHIlfDSvdc3036cD+Ww+M5kAuoo7iqtqpCmQPoCMPGUzcA180cSezh9FnzrNF6fi2FonxDAbipLxv9w8w4i0klpSm0LoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4X2vVKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2DCC4CEC5;
	Tue, 17 Sep 2024 22:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726611272;
	bh=cobEPWqsWZm0Du07sK1Y/uq1qTyF38HoM8wKmDcvw2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4X2vVKmbAepbDsue3YVaTy/2eU/nZYHcrYk0VQt8pALx1LNE+8YfKxPQn+m34Wlj
	 JNAd+WzJM78pAcFsUXs4p4XCvxSfJYd7xB/rDgGKsJzBsOjcpNtOP1CVYkvoBtg5M5
	 3G3SD15OjMJslkY6P56iAfAw45ujfY2g36BX7xNswZiggNFJssmSd4tYs2T9AL8mC7
	 XQj9LmEnyaANxyKG3wkRnAbl4E4gnTzarj0Ln7o/Emdb1J237erlNEVAh8fwW45ykF
	 iMSlYpElce8vNA/LGqQoC8cU/N93QXMYCoB1a+wwnYD7TZtUuMZnGg0YwINNp7N2QY
	 DLmOWOD35dkRw==
Date: Tue, 17 Sep 2024 17:14:30 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add
 interrupt-parent
Message-ID: <20240917221430.GA4049704-robh@kernel.org>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>

On Tue, Sep 17, 2024 at 06:32:44PM +0100, Fabrizio Castro wrote:
> All the platforms from the renesas,rzg2l-pinctrl.yaml binding
> actually require the interrupt-parent property. Add it.

But they don't require it. It *never* is required. If interrupt-parent 
is not found in a node, the parent will be checked.

The check failure is because the example extraction has to play with 
interrupt-parent to make interrupt parsing work.

> 
> Fixes: 35c37efd1273 ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties to handle GPIO IRQ")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

