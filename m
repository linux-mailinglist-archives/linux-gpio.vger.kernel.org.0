Return-Path: <linux-gpio+bounces-17527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBBA5F44D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D3F17E7F3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 12:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AF12676E0;
	Thu, 13 Mar 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3846Q+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB22676D2;
	Thu, 13 Mar 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868724; cv=none; b=G68H22ObCfAklP6ef9fCA+ncorE23RXXBTHlAkdY+rOF8r9PyjIP9/DlespMK+7NSAfWHOfoznmVhFd10G/g2j5yRMak3rre0LalB4wakEoYHwoY+/rp6HmMEwelo2mmzwR83vzrJICTeQDVzZUgvpuzJeHHdZMmeHk/IXorqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868724; c=relaxed/simple;
	bh=qtso+QylSCMYkJlmOyQHdWoGgp+Hq5bh4XDeml5Lx2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEkoYHiA6/rJzC1XZvfYVoWHqcAV0gApLICDXTzKHLXr505mvam1Q0tj/JO28Wum/QbxeYkcXudN6nXcBVCb9ukXE3ANGjxsQLfOUkJkK+kOc2GQmiUKOkam3PN+hKLZncP+PJYEjei9FjbaEO1lutCed5sTa1/nQeCEOAuBKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3846Q+V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741868723; x=1773404723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qtso+QylSCMYkJlmOyQHdWoGgp+Hq5bh4XDeml5Lx2c=;
  b=e3846Q+V9eH+jFV1iYyf15u7w/aywF2EfzRmFBs914lP6NaWi/zKelcs
   GRAK2C6tVJIcMHz+8jY4ozB87tiRPxL7hfMNsJudTjWAhEng7tS5ZKMKi
   UAn13nZq6Tn9hIkxFW6RIAyAFLg6fZe4KrtnOkvVPxHNJfTEBlkE32/hx
   /7HFs53Ub57dGeHO63nKiD/xP4su7j/AyVT/mRv3Ib4g6bMjFQYlsHwRe
   GA2h3CCLN9H+xUmFkG2ADdWsq7/vFRjZRxg/jhLCTDx5PSHXxNCHcGPoa
   DA3AsXyXV5sWT44k5NjI6oJo9rhGqxwIaA22D7oVmFWQlahzTUrgVASUL
   w==;
X-CSE-ConnectionGUID: KFsSEPxuREictRu/Wwx/hA==
X-CSE-MsgGUID: tEslKlfHQ9OahTgGAihn/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43113244"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43113244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:25:22 -0700
X-CSE-ConnectionGUID: KGpsUbEJQs2MVyUdlNP4KA==
X-CSE-MsgGUID: BX9hJvZwTXqJh109+wTkSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="151782413"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:25:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 004C311F96E;
	Thu, 13 Mar 2025 14:25:09 +0200 (EET)
Date: Thu, 13 Mar 2025 12:25:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add
 support for MAX96793
Message-ID: <Z9LOpR5yiILj6KsT@kekkonen.localdomain>
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

Hi Cosmin,

On Sun, Mar 09, 2025 at 10:47:58AM +0200, Cosmin Tanislav wrote:
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
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 31fb62debdc7..02857f0364c4 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -27,6 +27,7 @@ description:
>  
>    MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
>    MAX9295A only supports pixel mode.
> +  MAX96793 also supports GMSL3 mode.

Fits on the previous line. Same goes for some of the commit messages in the
set: the limit is 75 characters per line.

>  
>  properties:
>    compatible:
> @@ -36,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - maxim,max96717
> +              - maxim,max96793
>            - const: maxim,max96717f
>  
>    '#gpio-cells':

-- 
Regards,

Sakari Ailus

