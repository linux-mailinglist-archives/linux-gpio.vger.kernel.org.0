Return-Path: <linux-gpio+bounces-23974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C248B194A0
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 19:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC8F1894448
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Aug 2025 17:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD57C1C8616;
	Sun,  3 Aug 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDeZilT7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB561A08A4;
	Sun,  3 Aug 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754240913; cv=none; b=lS/YRT4yPHIGvWHlKqDiJdymwkxvaqvoDTBUPGF8rnLIAIu9mwmq1TssCQLytqGD2KvUyAYcH0xad7zijo1TzmdnEAxsSFbXOEceAG7Z0K0tV+DvrAfYY1aPU6IEvTsGoT29CFIRUBgETGU7zeEiBq6jlgYI7hHWjqpWhUILxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754240913; c=relaxed/simple;
	bh=/ZZtatKkLrPIKjN/Dctlo4xJJmel6AFn/3nBEM2/hvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAArtDXubk36UZX5HGVZ0yUDtULFeox9v3hiJxo+Vc2lri3U7iwKGhXoInkzqubQeu+BjV+8+1LVHzQtj3WlXTXv21BwRDhwRx1EeqsSy+Kqld4lk8ni1biDCH87wXachoM+xq1pBM3d2Mkz7ItxcT/x7LHEcyL3L3zquBG3v/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDeZilT7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF58C4CEEB;
	Sun,  3 Aug 2025 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754240913;
	bh=/ZZtatKkLrPIKjN/Dctlo4xJJmel6AFn/3nBEM2/hvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDeZilT7Sz7ehXlkGHJ7sVIixzH7xQFhJFCuR+ZUcbvlaANVa+jSeYcttAsrUg7o8
	 4IGHgLgVz5r2EocKcer6JXv38SshWucqQQatOnW33pUWl3K6OoAvH8Er2DYp4O2FJK
	 zOKOnxyYGGJrer05HHMktnK7T6y4BPM7tIs4qZwiCKxmQ6xkLWVFwkGFjHsY3xtEkg
	 rydyhQgi0OCDiotyWJmt/dF7VulVEdvfqXVaGZp/AE1BCy0sT3Ykt4sLP/dCLEJTSF
	 vDo2sDZU6HtQzPzp9f9jMd3QfWJj/Oix+MRmJfd3nPgD7pBl2u9Zx+AKm9YslsrI35
	 e7XTChQ3tTAOg==
Date: Sun, 3 Aug 2025 12:08:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H
 and RZ/N2H SoCs
Message-ID: <175424091132.539145.9156019133375295764.robh@kernel.org>
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 01 Aug 2025 16:45:48 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the pin and GPIO controller IP for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> header file used by both the bindings and the driver.
> 
> The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> Both share the same controller architecture; separate compatible
> strings are added for each SoC to distinguish them.
> 
> Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Used patternProperties for pin configuration nodes
> - Expanded example nodes
> 
> v2->v3:
> - Dropped refference to gpio.txt instead pointed to
>   in include/dt-bindings/gpio/gpio.h.
> 
> v1->v2:
> - Added a new DT binding file
> ---
>  .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 177 ++++++++++++++++++
>  .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
>  2 files changed, 199 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


