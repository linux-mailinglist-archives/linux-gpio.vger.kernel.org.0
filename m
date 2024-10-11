Return-Path: <linux-gpio+bounces-11203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700499A949
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 18:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 222C31C21960
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665461A2545;
	Fri, 11 Oct 2024 16:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtsUMn7X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7317F9;
	Fri, 11 Oct 2024 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665935; cv=none; b=mxivMXOGT+TwGRSYeJ+iCckHOy7+cKjhKpDnGT1Kso26f7NsnYYK6wfCRMFuXJgTEcYqd+0rbfuOlwL0QUyeZhjo5Y483wpgHI5594rartHCqIsI1/iXhdPHBQZ1/RuENL2kTk3yVzMd/xd6uRXI7Fn7eq+4CHL0K97FA7EcRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665935; c=relaxed/simple;
	bh=Z1+E1JGeVbHwFfLhXSVM5s/2nmC9ov0l6GX58bhyPrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYz3TbVwN3boAZyTT/OU0GFYV/9Xva4jpYtV/S9kXSfCe5whwZXm3zKh26Nlbj1C0GXmLGl7O8Nu8GksuC26aoi+1OCzPN7mFHudLEsF29BI19AQPD4sFNKnoVAF5naluWfRfulCK1oQ+Hh4jFBLuROSKXB97dvuv6SUuLcNJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtsUMn7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E9DC4CEC3;
	Fri, 11 Oct 2024 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728665934;
	bh=Z1+E1JGeVbHwFfLhXSVM5s/2nmC9ov0l6GX58bhyPrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtsUMn7XTiN63YG35ddYTaNvjY0tQG1iQePfIoXL0FZI+zQlUs6ToKaiNXAptWVfM
	 HKCt722/vxWK+QUka+ZKvzL7U5tuF2HOgxrPY9fg3AMHEIQLc91VWsztZbNv4CkTip
	 6peTxbp6Klku0Dyigz0yx5PSflyLRSO8mzC/hM9/QAqhYpAhMbLBtLQJOlucYOo03o
	 VX5sULcYfxYJAZEqLjJF0eHyoMV03bTwIj2Umni+pHzm8vxWDPIaBTdk+vcLoPQeOw
	 TcKZEZImsLBpdnI6ObhTJLOsE+e2dOZg/lWV2EhFxqg8VO58vwc5MDzi7KcAWuMzDr
	 5f2+r7OPgtq7A==
Date: Fri, 11 Oct 2024 11:58:41 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
Message-ID: <20241011165841.GA2504125-robh@kernel.org>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011120520.140318-7-y.oudjana@protonmail.com>

On Fri, Oct 11, 2024 at 03:03:51PM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT bindings for the MT6735 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combination.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                                   |    6 +
>  .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>  2 files changed, 1154 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

This should be squatched with patch 7.

