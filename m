Return-Path: <linux-gpio+bounces-13994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEB9F6E2C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 20:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4AE16958F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF761FC0F7;
	Wed, 18 Dec 2024 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5AQXqag"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A03142624;
	Wed, 18 Dec 2024 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549848; cv=none; b=ti4VF2qCoXd5GbjR/1mxIkb60gEVZRNHFb4V3eVSOl5KaP2//Fpdy4LvlJvSCyhQVwDV1jHKp8V85DkeNLmAbNlYFjqjJAhzjJ3vFRmXiSpritJs6/wl9QJPgog+IvRbaG7K34mtmanqLzpz8GE/AjpTigtUAYcPFexvqH24/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549848; c=relaxed/simple;
	bh=QIxbYH7qS6wnsCiz7kNj97RHFp/EC3ifsaAjE00rY6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmGDXZ6n+2FVIDo+QF1D4lYCB3N5HE2cXuILEd55TS7QUoDJW3vntzF41y5VRuYEl4MnKpAkAgJlzBTPfhhBAAKG4xelvS4JxsWDtRckQGdPY31dEpqLd2OqAznKhOMt5U0pyTQoKqUhNMPL/mnB4w03G9/YWcWZwWS7JfgmbG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5AQXqag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAC4C4CED0;
	Wed, 18 Dec 2024 19:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734549848;
	bh=QIxbYH7qS6wnsCiz7kNj97RHFp/EC3ifsaAjE00rY6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5AQXqagOk8QujM98Pa86OOhYP8Y9ifsa1FZzC6c1+vkBjWg6/85L+Vup/gitchmX
	 MKTDqZeJrI2lBb/bHhKgsGFuX+PLt6rJF97Iko+EccAP9bjG5ZpN3aWdpfEb7dlwt0
	 CYm3HPXQ3hxMk8lfRDz1UD0PBjSYKtDgCdCW/4AS2zxElSrctN8EE5JDktUFCFOafl
	 mXZKbiC6FUDb5+czfydLyfmhIXq9UNP3leiBr97J9/g6cupOpyHVHQFCZXtXeozZEt
	 /A88pZYC9DpU57RgQzVTgKNEvCDmtYXnpo8gDt40Aqnv7U6t73+gHjQdpGST8xCZ2k
	 4LdmIRyEX8gMg==
Date: Wed, 18 Dec 2024 13:24:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Message-ID: <173454984612.2190555.11491209654518960131.robh@kernel.org>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216195325.164212-2-biju.das.jz@bp.renesas.com>


On Mon, 16 Dec 2024 19:53:11 +0000, Biju Das wrote:
> RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerical
> ports in DT using RZV2H_* macros.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Added new header file with separate RZV2H_P* definitions.
> v3:
>  * New patch.
> ---
>  .../pinctrl/renesas,r9a09g057-pinctrl.h       | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


