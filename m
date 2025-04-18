Return-Path: <linux-gpio+bounces-19067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E340A94085
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Apr 2025 01:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4220846508C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 23:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138D12550D8;
	Fri, 18 Apr 2025 23:59:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A548253B7B;
	Fri, 18 Apr 2025 23:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020750; cv=none; b=JvpI3J7ZBgta8PTUN/1HNwyek2Qnj5WAOeD19rrFvLNrpQceSvXBxrTU3G5CxLsz+p5CEvsjAo9Lmzcxz3SYy38z/JWpcgNnrWl283FIJNGvpadtaxaKw39eUfEay4VWMDWusqA8NSRMfNZi+30DvDFrm3X/BEq1hzOfOn/FJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020750; c=relaxed/simple;
	bh=r4ShnKaPDMsDiKTEtiQxcaFuIttTo8iXusa45azuNkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5cqbhnlEmJJ7jiblqjZEPNPZMlr0Kpt6Yuiz78fiuag21B5eV3wf+3wTXwIGsra8MpbCjLf0m7Z+BpLmLulKZgjJ0ByvOmMhnogTgiA4dSw9WDvJNUHMf8bBvzlKO+PduesFmc6AqDL7WwBjKLAFDFDQTrUOcTh5abFyd9UF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5850434301C;
	Fri, 18 Apr 2025 23:59:08 +0000 (UTC)
Date: Fri, 18 Apr 2025 23:59:04 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
Message-ID: <20250418235904-GYA38034@gentoo>
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>

Hi Linus,

On 08:15 Wed 16 Apr     , Yixun Lan wrote:
> SpacemiT K1 pinctrl requires two clocks in order to be functional,
> also one reset line from hardware persepective.
> 
> In this series, adding clock property in dt-binding, and activate
> them in the driver. But for reset, making it optional for now.
> 
> For DT part patch, I plan to submit after clock driver merged.
> This may result dtb warnings in this version due to the mising
> clock property in pinctrl dt node.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v2:
> - fix typo
> - drop the _optional_ API
> - Link to v1: https://lore.kernel.org/r/20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org
> 
> ---
> Yixun Lan (2):
>       dt-bindings: pinctrl: spacemit: add clock and reset property
>       pinctrl: spacemit: add clock support for K1 SoC
> 
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>  drivers/pinctrl/spacemit/pinctrl-k1.c                  | 10 ++++++++++
>  2 files changed, 28 insertions(+)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
> 

I think this series is good to go, can you queue for 6.16,
we need it along with clock merged (see link below)..

thanks

https://lore.kernel.org/r/174484549885.160158.3249067849153986093.b4-ty@gentoo.org


-- 
Yixun Lan (dlan)

