Return-Path: <linux-gpio+bounces-17451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF5A5CE42
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0BAF189CED0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB675263C8B;
	Tue, 11 Mar 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTDlUznV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67C26158C;
	Tue, 11 Mar 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719265; cv=none; b=gOMWcBFJQMT1Vhw+jfW8UM8Kyk0+Zi8877G3LDnilccvIJKBcAseKjNBBTiC0/ug5qRwvTdc7SmkT3++4Sb6BGos4iSVYLTxdxSPX6vE1ssRoohydzcX1dT+ZTStzRkMi4dss1XmrszmQvIw3UDs3s9TDmkGVOBTzq8u7hWsL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719265; c=relaxed/simple;
	bh=DkxbPGCo5A/e7lDRlK6FKH/uxZlqGSzRqfvmnVsyDRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X62AhwJOYRzITdg6EUwEJ/Ajco/ig9lvLq+J7WwAyTKChueWHGnvaOGVtRu8P3Y4yVgo06s8oa5t6+gbFYgVHvNCfdACOatlzab2RzMhoPDIauXm64e2Tj6HAKx95tzXe1CQ79ZyWhkiw9/PuCkYGopj0+exmMZ2kqqw1dglTUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTDlUznV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CABC4CEE9;
	Tue, 11 Mar 2025 18:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719264;
	bh=DkxbPGCo5A/e7lDRlK6FKH/uxZlqGSzRqfvmnVsyDRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTDlUznVD4Cj7FZ/kaNJUVwzonfwXS0c1KgC58c+1coh7IMQFvCkz3vbJ/U8udX+M
	 9oSXhuPOzssLUsV9aiIG4Q3dywrNW9JkLNscaearhpYFtQgboZBChhYoS4VzwrnD77
	 ARbSi3erLuagq9m13Joh9cXbMc2GB+B7ZIELq1PlsZX+zfX94eDTtoJ5BSduYFjcgW
	 5ko5NRDgQdlL1e1LUnJBWovGDwI+NLhi08i7aXN/dT/szi0MnDc1CQuIEy33vmDpqT
	 Pu9YwP62K8bBjNeXbnsKNF0cw2lKUe+gDfWfJteCVcNbNU88PPY528WARi06hRQoSV
	 9EPO71I7F9yow==
Date: Tue, 11 Mar 2025 13:54:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ross Burton <ross.burton@arm.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Will Deacon <will@kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [RFC PATCH v2 07/16] dt-bindings: media: i2c: max96712: add
 myself as maintainer
Message-ID: <174171926101.3971802.12167410956543937006.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-8-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-8-demonsingur@gmail.com>


On Sun, 09 Mar 2025 10:47:59 +0200, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


