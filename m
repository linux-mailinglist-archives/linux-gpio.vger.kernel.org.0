Return-Path: <linux-gpio+bounces-12831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359139C4906
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 23:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C425CB27A4D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 21:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280C1BBBE5;
	Mon, 11 Nov 2024 21:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG1YbClY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EA38F83;
	Mon, 11 Nov 2024 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362136; cv=none; b=R06tzE8mPFs4VM32/Ob5UDexIkHvIV8HbHM6sF5tDns3/8ys3JRwhohANhKC3vBSOgyHJwhfSLwUYz//VI5fjtWbK3ZpYV64x6EKIwncsq1B7LM6/jnBvP69yV0162fF8StzCktU6FG6ACL4M9mzdkfLxZ5gIxpJWvtCjzTbifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362136; c=relaxed/simple;
	bh=Ulbt4wtJrj0rI8CCkCKH2MYB/lSP1izaiuAWB+R5AAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzehwRBBo9Z5saj7/gY9yeEqgEM5aZw9chm3Ywfnp4PschYzAR67qUXXjIlwlmg9nfa8COhS09ScRrVB+MeMBwSyT1y4Qp6phzYsDO4GcKK3x6ULBhKjMTY+FqTtcIkXAokG1k5XrzfHxF2XoB/tnOcGV5nTMvHj1JKjVI//GZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG1YbClY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0FFC4CECF;
	Mon, 11 Nov 2024 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362136;
	bh=Ulbt4wtJrj0rI8CCkCKH2MYB/lSP1izaiuAWB+R5AAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG1YbClYCgPJFMl42r3GRpF8dyrEDfjWHxsCTW4uWM/fk5P9+Erj8yhmYkZxHu/QG
	 9HFsD4yg9KkRPSsnkdUY01psgxfcB/RV3snn15Pw0dmj+5T3vAVeafD/AhctT9lmLS
	 MVXBWEF3Kyuj3jGQhPr3+Q7G59OuZYnrebBvIW8cIQjgz0C1PetFpqBk5Hch/xYSDY
	 /5288fShDBpc1vTup8g8MIrz1T1Yo522ixrq4oHD4QKLOjPWHheNEp/6hZvfrAOgIV
	 FNTKjvSsp4hLiA4Nk2AFF3cl6kLcAflBn59RCkOMiyXw6kOEflubamwnhf5TjDb3EI
	 6jz6o8uTGAVjg==
Date: Mon, 11 Nov 2024 15:55:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Teng <andy.teng@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
Message-ID: <173136213324.2011108.6481544003216572759.robh@kernel.org>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
 <20241106100741.173825-7-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-7-y.oudjana@protonmail.com>


On Wed, 06 Nov 2024 10:09:20 +0000, Yassine Oudjana wrote:
> Add DT bindings for the MT6735 pin controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   39 +
>  MAINTAINERS                                   |    6 +
>  .../pinctrl/mediatek,mt6735-pinfunc.h         | 1148 +++++++++++++++++
>  3 files changed, 1193 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


