Return-Path: <linux-gpio+bounces-17450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D651CA5CDF4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 19:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A042A189DBC6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 18:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCB6263C84;
	Tue, 11 Mar 2025 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoZvPbqF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B9260375;
	Tue, 11 Mar 2025 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717857; cv=none; b=p6Xmt/elK2eij0s4QyhHAnOnYw9GjF94r6BnsVrMI7UWGET8g96/0gJKu6BfA5pTBpxJO/llQwOAQCTk2eLDzf7OQuSwJ0SfrSWX1NlhngmEI4UyVNjhaZs7zekioJSVua0pjZLeXMHGJoH9qdhZNw7/qGy07AjpnKpEK1cM+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717857; c=relaxed/simple;
	bh=nqJGj2gczt5ZrI0zy+StoezidkdBwshZUOHFEphXLc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glfPIFzykBCOsIDkMpEGjrGzQCs+Rxy6cKyJt/c1vU/qkFbYE7Ylr8sqEH12CrD3bu4fLSGZK6Y8MQn0GTq5Az6VB+p52GeOqIMGlSTU6zxH7sHANRGkyL3v7B5fN5mqGgjF0j5bEBWSqR878RZ20MH4NLjot7BAELCNP386pM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoZvPbqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C876EC4CEE9;
	Tue, 11 Mar 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717856;
	bh=nqJGj2gczt5ZrI0zy+StoezidkdBwshZUOHFEphXLc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoZvPbqFccgIhq0iGup/S17CS4VzxYEJuyq+OnE0v74gahP5QyKad6RAV5jErhefo
	 Pb/+leksiPh+OL5l9/zSdGCmjtHlRCmm/4Xw2hUbx66t7AY3dWJ9KcaIuUDZqlJO9h
	 Bhz6kpy9lIW66lBBNJMaRF3MtQbWk3jb2cOERLFzl2OLr/nF6riLAsgvG7diV5cqyT
	 OvCXawCJz1sDeo+Xp8WGu6pUWR6HmYW9sL5HJ9dthaAbE/7jNdnfZGdgVwvuvbewq4
	 2pVR21sULRo37Qq21csVzbcjRD6YTka/oU4CGunC2eUKV6r1LfMG/5vyn7/11smX2w
	 gvLJPulaVUdHg==
Date: Tue, 11 Mar 2025 13:30:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
	linux-gpio@vger.kernel.org,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add
 support for MAX96793
Message-ID: <174171785257.3942045.11201403719435330786.robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-7-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-7-demonsingur@gmail.com>


On Sun, 09 Mar 2025 10:47:58 +0200, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


