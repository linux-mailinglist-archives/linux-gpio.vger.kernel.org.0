Return-Path: <linux-gpio+bounces-23191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE2B02CDA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 22:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCC94E0EDB
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jul 2025 20:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3173275B1A;
	Sat, 12 Jul 2025 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="c7P7iUQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196E3C3C;
	Sat, 12 Jul 2025 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752352121; cv=pass; b=Eqfh16qKtdSLfGIWCZ1EkTsiN1grProkLRifXjy3XVS7Dzyp72RxLg4n585h/CSumWM4sMSVVNH5orW88Mmp6xnC5gIdp/eMli8x+fWYhKYh+utXxtrHkYTMq/DkQP672SXbaCAwsnaZsnyKwSbm/LoFdTQ1uGvA9af4eetPn24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752352121; c=relaxed/simple;
	bh=JNSL3luxKmboM2Q9AAdcbE8OG++EWYKAzEG7PANFsAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSPNZAjSnRqqaiqG1KEtU3WkYYNf7JUn23a9mTF5uqxV0uIbPFOzkpXQotdt3iUiRdOQu814BpFnCYWpi8jdPli8bO3vdVDn2D9uLihjQiTeNVUVmBUF8FTThjrLbRPZQBhtFRNP63M5iRF8ycvg3ex15d21TUg7lHiJoYsLYSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=c7P7iUQh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752352114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PZDnyJH6WRjrG1YcZBjLlJ08NEyy9NEjSEYjmdIF82Df1fqS2LQ0gTSEsc0rpTj2kjBeX32GFYboTBgP3I6L4Mr1+euRWBBUd/C0s2r/IZPLRF3sDymMshUxuJlBHLkmUXzyDd3pOaMLAbr8cjCvIYCa06tvv/cqG5Y6FJ8b3nI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752352114; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0dUr3aZvtw1d3KnkMIPP8wNMbVfAcRS+5NL5zMgTfFU=; 
	b=D8RIYYb+/EdU9OMuAeovyaX0S9UETjKnJ/TEX/BOu3S9AQpDSGdQgEF+oRmopi3AvhJ75L1UZoTGVneO5qhuphrPiUZVgn39i3qZ1BM9U3GOV/Xrr0E6CY9/PMvh5oTu44dyP44Tywhga6BUDK+cKyPRhdpZR8kc7WdVv1xlhDM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752352114;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=0dUr3aZvtw1d3KnkMIPP8wNMbVfAcRS+5NL5zMgTfFU=;
	b=c7P7iUQhb+piNjIXjnAFf8qqmp4ZQmpwRvY/l93179Swvdsr3vJ3z/N+kC4IjpFu
	QDx0McDX0otTS1q79TZCXdAB6n1Nvz5VictrGRFzBJ7vfRRTgz7Yvq8cGdv39m4/oTa
	vXkUA7+pFoQDUHdiWTT5dkYkl+SZF9pQRSNxTZRk=
Received: by mx.zohomail.com with SMTPS id 1752352110596190.32093102983913;
	Sat, 12 Jul 2025 13:28:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3291B180F0F; Sat, 12 Jul 2025 22:28:27 +0200 (CEST)
Date: Sat, 12 Jul 2025 22:28:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ian Ray <ian.ray@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Message-ID: <se5ok3bzlej4gecaep3albatkigcczsj4ailmulqebd737qe7a@ly3vlkqhgm3q>
References: <20250709071825.16212-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709071825.16212-1-brgl@bgdev.pl>
X-ZohoMailClient: External

Hi,

On Wed, Jul 09, 2025 at 09:18:24AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Nandor's address has been bouncing for some time now. Remove it from
> MAINTAINERS.

+Cc: Ian Ray, just in case somebody from GEHC wants to be notified
for this.

Greetings,

-- Sebastian

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  MAINTAINERS | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efba8922744a3..c780cbd11ffb9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27466,13 +27466,6 @@ S:	Supported
>  W:	http://www.marvell.com
>  F:	drivers/i2c/busses/i2c-xlp9xx.c
>  
> -XRA1403 GPIO EXPANDER
> -M:	Nandor Han <nandor.han@ge.com>
> -L:	linux-gpio@vger.kernel.org
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
> -F:	drivers/gpio/gpio-xra1403.c
> -
>  XTENSA XTFPGA PLATFORM SUPPORT
>  M:	Max Filippov <jcmvbkbc@gmail.com>
>  S:	Maintained
> -- 
> 2.48.1
> 
> 

