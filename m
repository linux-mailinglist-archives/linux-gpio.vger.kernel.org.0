Return-Path: <linux-gpio+bounces-20184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81755AB78D4
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17EA64A77CF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DCB224224;
	Wed, 14 May 2025 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8oD9goZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0311BC3F;
	Wed, 14 May 2025 22:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260680; cv=none; b=tITn/iENrayVoXfmJcvdOZbN9pBPHvZHpzx35pATFfrZ4GGFDDyAQ2b6aDnydAXU9Nz6K8Dk2TIhNrCfcarKeCOGeG4QvqlVAVnPkav8NtbWfPv9MWYMzBmiJvRpd3r9BUlJHR48Wek34+FcgdEztO6Eeyt41agJCUFU7CLbjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260680; c=relaxed/simple;
	bh=4UaJQCgd2hT5pkJkwrytXoNgO3X8wC20SnyuDVFYARo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH/CD1xQjKqlv4smQWN+DwI1Bkg4C7NOgAy4CY9Yr1PR0BWSfyUPF5QZ68Vl8FJLcrcY/3SsTX/F+h4iPVt8f75zRcGhJdf1YqmegVowC9nVW3hsUhXc+jfTIHKcuhAR74+KZ7rm8gYIwpzz0lqpQjss9y1P+0A2/58v6GeAsFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8oD9goZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F6EC4CEE3;
	Wed, 14 May 2025 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260680;
	bh=4UaJQCgd2hT5pkJkwrytXoNgO3X8wC20SnyuDVFYARo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8oD9goZh6UuqsEju1LgX/cz+3etVU8bQZmK9BDGxyt3kRth1HC0B+pIwW0WKX/+q
	 bavDuMc7udEHHdAp0xK4POoX7khNWR2RmN1jWJHoH+XJzEv5J2cmgFIbzjACMCmV6i
	 ubs8GS1TwunKmx3Q0tz8Lu1BFyRBE2mqptFwaMu/Locchb2fwmOBO7QyaVGsEt5F1g
	 pcNbcOxIblc7uacp+8QSW2nT7WhwEIAcBIcBYkGtgf2IEb0h6uRM48x8PqNNdeNV7o
	 JhyVpUag0Fhzhhuzi04oGOedgTxstO8OxYKIRS66zMxSh9FQPeAB4q8i256PlNFhWX
	 GBCFdHkX+XGqA==
Date: Wed, 14 May 2025 17:11:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Taniya Das <quic_tdas@quicinc.com>, linux-staging@lists.linux.dev,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Eric Biggers <ebiggers@google.com>, Liu Ying <victor.liu@nxp.com>,
	devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 13/19] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Message-ID: <174726067779.3133689.811162498884437185.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-14-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-14-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:22 +0300, Cosmin Tanislav wrote:
> MAX96714R is a lower capability variant of the MAX96714 which only
> supports a fixed rate of 3Gbps in the forward direction.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


