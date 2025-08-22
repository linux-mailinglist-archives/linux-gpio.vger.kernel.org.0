Return-Path: <linux-gpio+bounces-24835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB6B32302
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 21:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA50C5880A7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B7C2D46C9;
	Fri, 22 Aug 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEpyDBGj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B015E90;
	Fri, 22 Aug 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891621; cv=none; b=IQiHeVVHrxwmkRfpN3tXRlyqKdcan4qooB3g+/Ued+Nw9wTh3lXrMmp3vv53yJx+/JNUilMkYGVlxXTqrwRxkynPpLs2dyQ9TtbqDJ2dvR2hSxir86hCuCdQwF+BFkqMa+j2raD+WjLuzdEa1BTpAvUyCO5tjK465Ax+jnyAL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891621; c=relaxed/simple;
	bh=KtVNSI3n9Eo/JyZH6l2EiTQ2eYL8W/635pYYJ4jBuvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLezTR8cu3JAcmY6BTnnavZyulkZF1GUTxV2gblayuPbEu0XGEMdp9VIa+8vbew3DC4MvCLdITFWksg0n9zD/Zia9hhTIvwQeraDkdnf5isZUweyFI9mBhP9rdN+JULimVEQA5Fdf3im0zftinHrY46C6ECXkZFOvQoHCuQXCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEpyDBGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66A2C4CEED;
	Fri, 22 Aug 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891621;
	bh=KtVNSI3n9Eo/JyZH6l2EiTQ2eYL8W/635pYYJ4jBuvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEpyDBGj4IkEi7MrvVMXP+ihv8WBLGzwByWxwkkH0Me1aSeYHMdvEvBH2lpiyk1Nr
	 OWzl1+UyRdtFhhblgrlNuRlpmnRCMZWz+oNpSrvne4yiRt33PYORAAgXWfZJNgZWf+
	 jJeF5sO8V/Oiv7+ImaxmD0u0VNL06Km4nUV/Mvov0/ai83PObHw23omgCC3kwJoaeK
	 oiLVUnUMzjeMvwIyQlekT9z0XQcryAs1eEBj0GEokzZxR76larKb0vOqdclB52gNFO
	 rXhbKXjCiKrv2/jxnT6mYzKlOWsEVx0E8bi45bW58nRjN2SdOeT9J4N4o3/4c3lJSv
	 45agHxWxkFhUA==
Date: Fri, 22 Aug 2025 14:40:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: cw00.choi@samsung.com, mingyoungbo@coasia.com,
	linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com,
	krzk+dt@kernel.org, linux-arm-kernel@axis.com,
	pankaj.dubey@samsung.com, hypmean.kim@samsung.com, sboyd@kernel.org,
	krzk@kernel.org, linus.walleij@linaro.org, hgkim05@coasia.com,
	conor+dt@kernel.org, jesper.nilsson@axis.com, smn1196@coasia.com,
	hrishikesh.d@samsung.com, inbaraj.e@samsung.com,
	s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
	tomasz.figa@gmail.com, mturquette@baylibre.com,
	linux-gpio@vger.kernel.org, dj76.yang@samsung.com,
	catalin.marinas@arm.com, soc@lists.linux.dev, gwk1013@coasia.com,
	arnd@arndb.de, will@kernel.org, pjsin865@coasia.com,
	kenkim@coasia.com, swathi.ks@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	shradha.t@samsung.com, ksk4725@coasia.com
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Message-ID: <175589161947.192356.7959159186855408462.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574@epcas5p3.samsung.com>
 <20250821123310.94089-5-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-5-ravi.patel@samsung.com>


On Thu, 21 Aug 2025 18:02:48 +0530, Ravi Patel wrote:
> From: SeonGu Kang <ksk4725@coasia.com>
> 
> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> which is similar to other Samsung SoC pinctrl blocks.
> 
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


