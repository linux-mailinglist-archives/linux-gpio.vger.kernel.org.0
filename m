Return-Path: <linux-gpio+bounces-20182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F340AB78CD
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01823A7D0C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F71222425F;
	Wed, 14 May 2025 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1b4OYzm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36875222572;
	Wed, 14 May 2025 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260623; cv=none; b=Z1/0VPUHHRGBfqlW6tfXvlpbQVGTv6xv06I5d7wOPEwTXs+vPFyjWEynSf4XjtG14JGGfHcgXwy+KdpCbSCLVcyglXYzAKLCljzXRBmz3ABG5euVHpTChlv1PniSsfH6Sc7q9+0JpH6y9CTAb0VAYoJ4mHAaoOqqjEZZGN2QioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260623; c=relaxed/simple;
	bh=4VFuZ2yi3z2eOk72UlVbmTd8V3sowLhwi4xqoZboboc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcLY06rCNTd1QQMBGxiePOT5bY6llCIv/jPjxmL56BThDnh1q+QvCnPxwOLFGho0Skd7xfJsz4ILW5vj75XWcv9OSQbeD79d4LcWWZ7NOiOTlelMR5fo8a/Wx9/ShRl/iUMOrbZbkQK1zXbVmnAsXOCB3hMVKDVokpfGK4O9gq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1b4OYzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E24EC4CEE3;
	Wed, 14 May 2025 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260622;
	bh=4VFuZ2yi3z2eOk72UlVbmTd8V3sowLhwi4xqoZboboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1b4OYzmlWPkYqoi7t9vb4BJ/52mqwbnw+ZmwDprOsIrx/mKFkhumBclgUOsOYwQ7
	 KLLgwjON2hgstVwnWfM17oYgDId5DDiYpls6eyavHnLsLLLGftZ4WMFPhsxKon6KNJ
	 qLPqBrjpFKge2sZy/CP/Ut9psIvehp8tC9bv8LtZ8RHq77TSPljKFSghKTuwesXQTt
	 yhGX/CX6G6eMxITA7agm7toJLExeXgBurTVVyJK6vtunqsoGEb+g9Yj2pcjriemvNo
	 zb/lEG1TnNhQ/+sZzgXiiXTr1iQTPj6LUGYBZQyFdgOpSefgGRnvWXZLYqHmlS0Qxz
	 31Fwq6IebAGHw==
Date: Wed, 14 May 2025 17:10:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	devicetree@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhi Mao <zhi.mao@mediatek.com>, linux-media@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Mark Brown <broonie@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Conor Dooley <conor+dt@kernel.org>,
	Ross Burton <ross.burton@arm.com>,
	Eric Biggers <ebiggers@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 11/19] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Message-ID: <174726062047.3132190.1522703429549013683.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-12-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-12-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:20 +0300, Cosmin Tanislav wrote:
> MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
> only support a fixed rate of 3Gbps in the forward direction.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


