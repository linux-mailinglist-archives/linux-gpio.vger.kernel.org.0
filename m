Return-Path: <linux-gpio+bounces-20178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95DAB78A1
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 00:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D62A116E461
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF10222D7A5;
	Wed, 14 May 2025 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF4woT/P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40922D4C1;
	Wed, 14 May 2025 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260256; cv=none; b=vBEXnXA5C7Rguz5mqoC69VD4n7FXdtJ7tyVAVb0cS/Aiict3NVtrxcR5nOPT/Ei1U8aprYuQHTUtyi7SyUjf6rTcN8j1xknai82rn3bF19B70DrrnMAx+o6RpOvN2B9DXebuK0CC+MWooOONQzGIKcxLgwppAPy6y8ItNGVOv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260256; c=relaxed/simple;
	bh=kSYN5wSnAW3gZ+9G6lJ65RsA0L1GRRokgz8LEmwge8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5OwNfpGm5flvUVfz9kFls8afXtMy2+oOcnSex6dJR+K5qDMM8QHEJD2JaBUIa1Y/p/mj/Vr6LGgFJmihScte22Wba0kDuOBAjLenaCy3ewYbIBUp1Ta+Nic7SiLG4PwwRtT+snEDG4uAQ8Uc/B3M9P6F2QwsPj8cJufjzEhBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF4woT/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756E9C4CEEF;
	Wed, 14 May 2025 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260255;
	bh=kSYN5wSnAW3gZ+9G6lJ65RsA0L1GRRokgz8LEmwge8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UF4woT/PdK5/zYCNEqorTNCUe/N1+BoNjs3pgsYXQuukwOstmZoDbUxS7Rm7nq8KT
	 wCApHTnyhWsv8YVBvX2mTKGT7gfAY7iY9SLqJF3dhZkS/HdNf4JTOHRG2VUXFQViaV
	 Q/81W/B9Bc29AxdKGJ9kLJhqEZTogfMZ+dP70Q35UQs4X9W2iu+VlLwv9596fFaQ/P
	 Cetobslyxg/fVJ6XpjZ2BroXp6QCY5SMWy8lI0rJ3KlGe7tal5IFRhemOa9kfjgvHb
	 2BChcdGELMAm+P/DUho+o0GQ3Ho31ZWZJlf4ajL7h+tRO7bzrNrq+90VcJ39nab4p1
	 Pn0EtQOi7+TQQ==
Date: Wed, 14 May 2025 17:04:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Eric Biggers <ebiggers@google.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ross Burton <ross.burton@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liu Ying <victor.liu@nxp.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-gpio@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 07/19] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Message-ID: <174726025353.3123437.1360215980060366369.robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-8-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-8-demonsingur@gmail.com>


On Tue, 13 May 2025 00:28:16 +0300, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


