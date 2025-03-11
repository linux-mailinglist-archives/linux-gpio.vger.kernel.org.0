Return-Path: <linux-gpio+bounces-17454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D165A5CF0C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE8B189BC34
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18EA266F1C;
	Tue, 11 Mar 2025 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkaUpWFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6A266B7B;
	Tue, 11 Mar 2025 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719769; cv=none; b=KhqFqY62wXtpcvHlYp7XDVP+T0dHmput9Zp53wly8206R3JtQ5DTtHHPB275qcy4kW4vAgBt9GSOJe4QZ6qXUf6Tnn9x3tdIH7pyAANIgxgY3Sskzc0fT6hCR/uu70rNEuJoGn4lRn3B3zaA6xI9RpFaLCgbUi0B4MUa6P1izbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719769; c=relaxed/simple;
	bh=903w085l1k6ydor21DnGi+IQsYPV/L4oQPMCNZIraXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOTZ66ftR/JCQmangQ7JBpvom9E66mYRfLZQNk5vR/We27z+Qi5HpSRA8YpZOyj348sGNrcs14yFVWQuLhrtvL3zs/qaIjxpq9o+Vi7beBx6tXvs4eooAca/ryl4S4nPBdp46SCdETH9qYJDLEOdCoLddYhwpzxCdZe+tAhbzIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkaUpWFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA1BC4CEE9;
	Tue, 11 Mar 2025 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719769;
	bh=903w085l1k6ydor21DnGi+IQsYPV/L4oQPMCNZIraXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkaUpWFC6tonuAozpZLRP44Mvhbl9mjvUdNpmQEM9MEl9LVsmHnVfX5Ye3l4xANs5
	 3F+7S348veq0VbbP6e6uKnv7WBZ7XsoYLHnfDUetMq2y9OaDgJQbDZiwsQiigRpjkK
	 xS94S5HNcVEV3bxzkr05+ELKkcq4I9otxTszR+kBPh94Vosbwg7JE4BsWj0rGe5CY5
	 1Q0PdJl0mb8O2c+azuvNtTFn4MQeMY65V31g+MT/wEheoi9B1OApnfc8oF1JT6+j70
	 GLLAr/04IkYZ+rVPnCPTN+6UmOiGOFuE8B8F6pUt47BESyKCN0zsC7IxFfVKqGLf2J
	 U9eYovL+GD5rg==
Date: Tue, 11 Mar 2025 14:02:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Zhi Mao <zhi.mao@mediatek.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH v2 10/16] dt-bindings: media: i2c: max96712: add
 support for POC supplies
Message-ID: <174171976682.3984722.17562171213323916839.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-11-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-11-demonsingur@gmail.com>


On Sun, 09 Mar 2025 10:48:02 +0200, Cosmin Tanislav wrote:
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


