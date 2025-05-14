Return-Path: <linux-gpio+bounces-20180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF5AB78BC
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135221B62811
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B114226863;
	Wed, 14 May 2025 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YArlUvJ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD61E0489;
	Wed, 14 May 2025 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260311; cv=none; b=EJUUSWTJV1pE93Mn+b8uC7Xe7qY6aUp0ZkNPIZqqPUrbfTmvuNimcpc370WS7GcjeFrrfUXjo5v9fCK5Xbrh10+aaDH/2B14GciopcjnafGepesYFNe1gd+gc8nFA01AjK4Cu9GKBBRUFXtDbL6SWY72kokiJcyd6PYF9dJgodo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260311; c=relaxed/simple;
	bh=F1JbH1eATkPBeJkGH4i74QeDy3H0QrGsbTi6OhDM7VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI0Ao8if8AQAf284NLiFST62r7vf92nVrLzNQEGcMMgvfH1J7AzPN5qn0V7aHgWdN5Xz7cA0qFwwxhR4n/pM6eq70nliBpbjvTAIPPek29LwhA5ZR4YHJGUYpN1egK0gKYzQPn38Chz6dUVGejaRaQq1lYLGRRt6q1u03Hn35LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YArlUvJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3945FC4CEE3;
	Wed, 14 May 2025 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260310;
	bh=F1JbH1eATkPBeJkGH4i74QeDy3H0QrGsbTi6OhDM7VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YArlUvJ5HgmZhwJHRxUZwhChPTmKiMZoT0Au29oRU2t/zj62Vv7O8beD+m4vtyMzs
	 EoF4+0CSRHYpq2kvrGGRM2T5GnGMmyYELs/mqvaCN8muKWXZdDgF6gNxoShVpP9xBv
	 Kf6YRuMya1258sPB9y16Y5ObFiD/RBFVpDLcXH4S7SEj6x3WTlcV/z/Adbxkrl6vn3
	 79oWrzKTPM2aJafokjtZk0r/aHdHhEqogqpV40drxQIMqlhUMkogL2RwVL52D7rqGP
	 fblr5EOrcggaloU8L/TtmtMXEq6/+9WI6an4sedZ46PIC1hd/ySbxBQKcjbRauJlG/
	 XQVTLNU7xiRlQ==
Date: Wed, 14 May 2025 17:05:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Eric Biggers <ebiggers@google.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Liu Ying <victor.liu@nxp.com>, Mark Brown <broonie@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-gpio@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-staging@lists.linux.dev,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ross Burton <ross.burton@arm.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/19] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Message-ID: <174726030810.3124901.1578644990539282460.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-10-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-10-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:18 +0300, Cosmin Tanislav wrote:
> The GMSL links can carry power to the serializer when using coaxial
> cables.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


