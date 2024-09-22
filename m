Return-Path: <linux-gpio+bounces-10343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68F97E366
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2905A1C20F40
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFEC6F2E3;
	Sun, 22 Sep 2024 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0F4ZPoU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0552AE75;
	Sun, 22 Sep 2024 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037981; cv=none; b=HHgK8+z/4AIJ7PRi9erbDMSnPPb1WOkvQ+Z/6GzvP+XpArP4WgV16rZkiXrrjdSf1kgEj2hFJO+8WlFDCEmsOiFP2vU84UOgXkEDEY3pfJr/WCRudWijA3CSs8fv5L3G0M8AxiV2sCwZD5jtGv8CeWcQovafwqFJSzzR5dBwgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037981; c=relaxed/simple;
	bh=r9ANPSP59lg6+3f0AGa1Y3MykoCnLy7a+ZaKQQfvl/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2Lx6RFErcJgo6cBTii4q2IOVEIqUvkNOf8nu0g5M9/6vPsrUNPNJ9jkgckbB2SRStxIh2BRwD7/6O4YtO15A8Ku0W5PSLD6oZid6rFRcIF/4AY1RmAERYTMiSD8EQLMJBQhghzDT7MbMSIeCX0gnzjXf4szgdgB2Eplbt1CLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0F4ZPoU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5A7C4CEC3;
	Sun, 22 Sep 2024 20:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037981;
	bh=r9ANPSP59lg6+3f0AGa1Y3MykoCnLy7a+ZaKQQfvl/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0F4ZPoUtF3AkX+X86XPMlOk6NgbKGWVmLFDpg3dxgZsQBjWWHK2H78/Gstg4Rc0u
	 YZDeRspQ7spGLpLuz0E66tPt40wGzs5+TBK+83zsXrEOc2+e6pkQIE1GRJjLzpxFkO
	 Iov/ZBgpW/sRWkjStGocbcj9VEcQcbHDZOraJ5AiZxVTdnsyJSZx0LpEAT+100GjDs
	 nx3yKaraW1yr9Oyl3RTzt4EAod+/Iu9FYfNwtnHTz5r6dcnAm1XoBX0N18v8arBBya
	 PBx/w6r2tUdO47Nha07A8624N6PNZYWQ0rzqHXDfz4D3Q+p5OrEoacoJFPJX6KShEJ
	 BYixzfAQY+sWQ==
Date: Sun, 22 Sep 2024 22:46:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 07/20] dt-bindings: arm: apple: Add A9 devices
Message-ID: <zc475qgi432bgev72oqtxkkcjdqitdsfb5vmhkab62erxlu4zq@7ayoihkiquog>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-8-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-8-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:56AM +0800, Nick Chan wrote:
> Adds the following apple,s8000 and apple,s8003 based platforms:
> 
> - iPhone 6s
> - iPhone 6s Plus
> - iPhone SE (2016)
> - iPad 5
> 
> apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


