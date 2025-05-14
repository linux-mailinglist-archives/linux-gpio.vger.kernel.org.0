Return-Path: <linux-gpio+bounces-20173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0437AB784F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 23:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32AE1BA5DFA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8F6223DC8;
	Wed, 14 May 2025 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmmXcAGA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061821F2BBB;
	Wed, 14 May 2025 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259922; cv=none; b=f+q0uH+jAvRLCZ1gdcQE4ZDppqUrGLRWe5hmLTZCAW+tlXOvIpCfKYj89gI1Xs+BaDcSnXociv6jVIh6Tz8V6LxBno5yeSvXkWmnL52c4EiNEvYkbA0+qW+wMKhGib1YCgCljmSoO/BvEG86Gix5U9bv42ojQse8Bhs7GM8yIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259922; c=relaxed/simple;
	bh=vykZInbUINsawiOxFB/k38aMhOlKTpZD4MOpGwHvilM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPtyWocVe11NZ14IwuoLlQ/cHNsk2fokIX6iYdJ3XtKvyWGXLLQMs398+5ec85kKr0fAJKWDY1bcBTbqG+kO0r7FRcOTnPBi0qwnkL8IGPWz9RD/fiZZUvoP5hPkHotAZMl60xG9rtmJLcvnvcmTXTbMPQrpJdYVi+8qTo/V7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmmXcAGA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B94C4CEE3;
	Wed, 14 May 2025 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259921;
	bh=vykZInbUINsawiOxFB/k38aMhOlKTpZD4MOpGwHvilM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmmXcAGAocAdem/Lr4F7/wbqeuscJFeVx4zRZ+5gvbpT5A/+eATKxdeNRNJtJfam5
	 HbuupvBiUJI9m2+wFGXYvJCJXvZD5FTb6coC3Jh9UMFW5I3MrBINXvmPMWuxOecg3T
	 iBweZkF0RBeuZ5+UyrY4fLrXiM3wfE/NhvMRmOdAIfbD0JdB7CRbk+ntBRVhD9hi5W
	 EMPRrD6IAnePz2ZW0CcWwwslBlhz/BTuxARE7oKgVNo6MgUUast2kI/4/EQR7P2eTK
	 xm+izJ9RVHrPVFJmzwEwTqH7npv6prTT6ywo8lf773p+1Er+WkUqaVNAOohZS9y3AC
	 /Rp68MmNX8Uig==
Date: Wed, 14 May 2025 16:58:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Liu Ying <victor.liu@nxp.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Eric Biggers <ebiggers@google.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Ross Burton <ross.burton@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 02/19] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
Message-ID: <174725991910.3111130.9703709978772131529.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-3-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-3-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:11 +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of address translation for the connected I2C slaves.
> 
> Add support for I2C ATR while keeping I2C gate for compatibility to
> support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


