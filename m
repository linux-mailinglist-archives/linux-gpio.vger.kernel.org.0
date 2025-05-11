Return-Path: <linux-gpio+bounces-19906-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B5AB29AD
	for <lists+linux-gpio@lfdr.de>; Sun, 11 May 2025 18:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 712817A4363
	for <lists+linux-gpio@lfdr.de>; Sun, 11 May 2025 16:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6870E25CC79;
	Sun, 11 May 2025 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="icTaweuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563FE256C6A
	for <linux-gpio@vger.kernel.org>; Sun, 11 May 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981764; cv=none; b=Crp64Lhhce2YVsA0r/rQucbOi9K9SMYXcDq3OXpP6nLFpmL5IREw3Wzzqda2nuhY9GI1YYWvCBZ6lJN54YaPSTz2DsASgqGiAozPxNFbvVH/7pIkP2MPrfRl6rRLu0BrgkbGCJUIcPuft9onZYuZKIrvS3zt9X505afQAU2dVXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981764; c=relaxed/simple;
	bh=aX3J2izsyfR/oGAXvYeQpGXND8eWoNdYvrCA7zPEnHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+O/mr2q6IRIHoS44c48BM5cB3qZhqIZSe+7Z6cEz2xcx2TfBZmvaBi8JeIcaFlZQlO7A7zNTyO+1/7vEx8EKTyiBuUY5X3JLHNqD9c4vyoDTikkqQac3FaCTtrHRBEVT87+B5VW10AXygodJ8oUBceQYhqC24mdmsVV+k7+GoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=icTaweuO; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Sun, 11 May 2025 12:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746981750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06G8DBL+yE+EwkMk4FIE8+EABcux+6ejNjNymvMveGU=;
	b=icTaweuOgQ1MYUdG58b9VuBfGvM0S8yMcRDmLZNfqTcgsShr1ALVEsujoabf9j48819oFV
	nRxcUiSrnTfpTrWykrRGl8Nb0vfh79/81Ykc/z/pKZ5SjMicf7SYdXkyRYtFrBuFAOag86
	Pb39WH7IQFBoYYWXsr+g4Ijyy+WOjGn+q0zKgBAyTM7v5zLxuxHIYmeSQkof9LZUzz72ql
	Tz4WpvzHXUa1Y26xBmKIljtKXAHxycR5qXXvSMSNKzcYrzxpzyzxeiDHIGTEY/zNxCfH9i
	jDhKn7IJ9hfaGGFO9aXer1EINtXujvOOJfqq30AmWy0nhGGacNR915zvkt/QFQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 04/10] soc: apple: rtkit: Make shmem_destroy optional
Message-ID: <aCDTcUtxPkXKK3lg@blossom>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-4-f5980bdb18bd@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511-smc-6-15-v5-4-f5980bdb18bd@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sun , May 11, 2025 at 08:18:39AM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> shmem_destroy isn't always required for coprocessor-managed buffers but we
> still enforce that it exists. Just relax the check.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 5fffd0f003dc2f4f377faf96cce0c1ce4ff0b788..b8d4da147d23f7e99e76eea314e4d976cddbd1c6 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -279,8 +279,7 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
>  	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
>  		buffer->size, &buffer->iova);
>  
> -	if (buffer->iova &&
> -	    (!rtk->ops->shmem_setup || !rtk->ops->shmem_destroy)) {
> +	if (buffer->iova && !rtk->ops->shmem_setup) {
>  		err = -EINVAL;
>  		goto error;
>  	}
> 
> -- 
> 2.34.1
> 
> 

