Return-Path: <linux-gpio+bounces-26528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BEB96541
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 16:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2B5189070E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 14:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEFB21D011;
	Tue, 23 Sep 2025 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyunBIKi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61CD1EE7B7;
	Tue, 23 Sep 2025 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638229; cv=none; b=lBeLvlBu0fMROMYRRHNAcE50KSYGt8GputMmquQg7lI6IktBvzQV2BnuvSY5X1ogfJ838M9znHB0H4VL0Hk+qPGNcfHQoNIqocf/ZWzBRRaEDBfretqlbq5gShAL70mlL2oxmvmNpyvWWJJakiVw67rD0JRU+oj2ew30HMsZfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638229; c=relaxed/simple;
	bh=q2LUE1tbWJErcoRmks/z7EI8Qn93WkmAb2uHaEnm6uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcjCeO8xJTai5nM3RiWwtHEZ3WzsAcEKMYBmEAyBsgOz3Q/6+x4ithyPSn+dHD4SBJc0S5Q+WsD/+4MnSc6dHQ0Qohr1nDISmywJZHjQRW04T/ivWafsyaqGGl3dx+VWBHfMPMUh+hD0E7ay1+zdPN/D1CAMtHQvvW3rB1471aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyunBIKi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BCAC4CEF5;
	Tue, 23 Sep 2025 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758638228;
	bh=q2LUE1tbWJErcoRmks/z7EI8Qn93WkmAb2uHaEnm6uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyunBIKiEsq42Mhh7s405JBkwY5YqmL0CVnP4IjpdOjkBL3CsYmDU3hNlXGiUWlHF
	 fr+KIDCvgLrE6/gmcQCNonnHNzyf1phXt5/zkKYP1JkZaIiAcEAn7qgdAGJ8xdixJC
	 Sd7WQ73pQIKUR4WSPeXgcOafwejI0GZHOtiDo1xzFHdhLPC1UCl3MGCtDJoDYRkfNk
	 ms4T5j+SNSZ+wEOZ0zUmTvCjadYXtU5b0KTrsLu5pTpkQ/+Ra51rmv+xHiHryYvrlF
	 alelBPbV5wMVH+yCH0RmZ5E6o+1FE/r+qjVOY0M0ADFbKtNITvvYjaRqdgrOxMgxnL
	 NlP8LhazRJdEA==
Date: Tue, 23 Sep 2025 09:37:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: fsl,fpga-qixis: describe the gpio
 child node found on LS1046AQDS
Message-ID: <175863819103.3194626.3121186874199604555.robh@kernel.org>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <20250922142427.3310221-4-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922142427.3310221-4-ioana.ciornei@nxp.com>


On Mon, 22 Sep 2025 17:24:18 +0300, Ioana Ciornei wrote:
> Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
> controller and explicitly list its compatible string
> fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v3:
> - new patch
> Changes in v4:
> - none
> Changes in v5:
> - none
> 
>  .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


