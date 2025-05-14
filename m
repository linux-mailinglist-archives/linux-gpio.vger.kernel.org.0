Return-Path: <linux-gpio+bounces-20175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC3AB787F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D64B1889383
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7BC2153D8;
	Wed, 14 May 2025 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlt6WydL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A45F191F98;
	Wed, 14 May 2025 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260125; cv=none; b=Pf4Tvwib3w7ifxyQurnotmyA0Q7B9m8NCAWwOKXhRnHfQ4NOg6ZRkWbGu/8F4V+S35FLjHKjCk5sOAsU596QjfH0U70pJ8F2T5jcQ5jWjY6bdAgx1Q9RsSQc4ix5li26R4bJJPu6U2FeEuO1V24t3Vv0TjIBVCmMJlmaaIfUKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260125; c=relaxed/simple;
	bh=bBCMDxAQqB223GvdKm9yHRzBPrInid0txIiE0L/rdLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxKhQU7HUx0iYRaQYV6buj3sqSXnPdsk+4s74u/0x2pMitsL2lrdy5fs3SGMAyUqDCL8RUcNIAyUTeqzokzbprTHTRhHPqKCMiC4O58GIr9nUdVtDGFye6iMXV0Cw8E1t4Z8QOthFuMu/J0w+FnXmtPGyw3ir4PXyBVenbJ8xXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wlt6WydL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0848C4CEE3;
	Wed, 14 May 2025 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260125;
	bh=bBCMDxAQqB223GvdKm9yHRzBPrInid0txIiE0L/rdLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlt6WydL4OlmyBn1uPevsmGDaJwHta+vKvolkNv5JmwU7YG1xolTibG0Sa62P+wMc
	 CAB9rSiSGyooqzKWWut3SciuoToVo8kC4olRP6xQ27WCWtBCyeH5fHXVtFC967YrlE
	 71fLEC/Hb7Ygn5kxZH4YK5so4WOs98TzJhJD7K1d0pMCLKbD+4UTHkVVCBKStLPxCs
	 F8HwjxUiZU+g/aNh09z28uunT1Va7moIR4TvvYeU/UNAQg0E9dHqt2U+Wa0qd9cc80
	 3jBVst83TxjAR26sTbP/BL6tE6K+B/hxe6ZLKufhi/7Lh1zPfudUNP8GZGbiMjLiAE
	 V3XbroG1u97Yw==
Date: Wed, 14 May 2025 17:02:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Zhi Mao <zhi.mao@mediatek.com>,
	linux-staging@lists.linux.dev,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Brown <broonie@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Message-ID: <174726012257.3116712.4544442889949224547.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-5-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-5-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:13 +0300, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
> 
> Document the compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


