Return-Path: <linux-gpio+bounces-10695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FA98D4CE
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDEC1C2138D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239961D048B;
	Wed,  2 Oct 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QjmJs/ev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE21D0412;
	Wed,  2 Oct 2024 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875459; cv=none; b=LduymBfHBsbBpuUH0aXQUBUDozzWAUxY0DBL7zVRZgy4RRJ9+qlaN3AOXpmKysiUAehAIUXcPm+mcnHUbCVm9W0BlBKZnL1wLE+qTDWeBe0WdppH7SXV0Bmrv76SIetT+Yn28LUp3dWpvIt4AmZMUqCjvAxTzEtnsdIMptiP4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875459; c=relaxed/simple;
	bh=eP3rICiba2AImuO5wSHpe2ShiG6/4n7PBOA7XiAPLA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH5LasLTIURXIFFG0HIfiy+hv6g5g5lxkYMxnkSDiaZHu0IpFNxuD9IiJJDP33a8ER8SQlP9rDtAHjkkq1xaYW4kmrSpUyOatNnlHDVv7QFKq+92WL+SR3+RZP7ZZysDZClnLy2zTfSKlD1y9wZWYEhZzQ7560LtHctCYjR+6Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QjmJs/ev; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YwhUl73bkuUv9lIPuTqPqFzU/BHHZgYauhuf3U0cLiE=; b=QjmJs/ev6+lV5fyxC2U1rUl+Lu
	vZgfTnQrXwLNhogzfGbMo9kgT3US/QrlBqp+MAil9YHESKLtwUnVyURPQ2xn3jL3D7aXk/MAt5O1i
	1URNh3vC9rXLqkkjw0LCt1mTlcN3bIFObk0DI9YDUqDCZT+EQm6kX7EKWW2Vlrr1SjZWp29B1YZfW
	yPA2nS5QtrppsEGTXr0Rk3BYb0nRD9EJBfU91jrqdcPnUA1b10FAVx9w6K0E6nAFPLuIdNeQLSiDz
	Bvbcr84NqcWtnHTd5bTECO/pck0BONkRKoCX3nGVE6zBWRSNfUo3BxoMRBdh+rkUlDwEEpl2elVuH
	8vDt5SBg==;
Received: from i53875aa1.versanet.de ([83.135.90.161] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1svzKp-0007VF-L4; Wed, 02 Oct 2024 15:24:07 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH] pinctrl: rockchip: improve error message for incorrect
 rockchip,pins property
Date: Wed, 02 Oct 2024 15:24:06 +0200
Message-ID: <2014380.yKVeVyVuyW@diego>
In-Reply-To:
 <20241002-pinctrl-rockchip-error-modulo-4-v1-1-4addb4e5732a@cherry.de>
References:
 <20241002-pinctrl-rockchip-error-modulo-4-v1-1-4addb4e5732a@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 2. Oktober 2024, 14:03:03 CEST schrieb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> If one improperly writes a rockchip,pins property, the pinctrl driver
> basically just states that one in the myriad of pinctrl nodes is
> improper but does not tell you which one.
> 
> Instead, let's print the full name of the Device Tree node that is
> improper as well as provide more context on what the expected content
> is.
> 
> Note that this should be rather unnecessary if one reads the output of
> the dtbs_check as it would be highlighted as an error.

Nevertheless, having a more helpful error message in the case this
happens is still nice to have

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 5c1bc4d5b662ed403ea5c8e57a8e1cad913a31a5..04e85a6037c93f415670b286f91fccada0d38fbf 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3227,7 +3227,9 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
>  	/* we do not check return since it's safe node passed down */
>  	size /= sizeof(*list);
>  	if (!size || size % 4)
> -		return dev_err_probe(dev, -EINVAL, "wrong pins number or pins and configs should be by 4\n");
> +		return dev_err_probe(dev, -EINVAL,
> +				     "%pOF: rockchip,pins: expected one or more of <bank pin mux CONFIG>, got %d args instead\n",
> +				     np, size);
>  
>  	grp->npins = size / 4;
>  
> 
> ---
> base-commit: e32cde8d2bd7d251a8f9b434143977ddf13dcec6
> change-id: 20241002-pinctrl-rockchip-error-modulo-4-8fb1affc063a
> 
> Best regards,
> 





