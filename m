Return-Path: <linux-gpio+bounces-9035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AC95C931
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8901F2488A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEEA14B083;
	Fri, 23 Aug 2024 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="I9KihzUv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108E139D00;
	Fri, 23 Aug 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405230; cv=none; b=Lb+4VRVOQMDOD8kh4cwnJHZfPETIeFlzKmaXmtAHsLDFu86MicrqiQlfe4FQOf5tJ7E6V3WO6DIw58XfVV+khtznfjU01V0xd8by3ToH5owbRhLBM1TgVWAhKGocGu1ULsEgzfLevo0if84W+GDcc8nvTnSs/9ooDZm+XuKYei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405230; c=relaxed/simple;
	bh=LjzOa5VYF5uE48fuF+oizFl+TE1qvTWS/NM0ytVg2+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZZAwIxNCT9GdoKa0BmUV1OmEuLGIJtdmpMRR1EumeMPp04UZ9ZCd6ee0eVqYkQ85RzFx9p32sYUGeDA+9giMC+X0lzw0NK50KZeWD34RKcezEcjgfNLAehteNJKfOLeIsOVr2nc+xgrnN4PWGpOB8DUDZyhaXsIrBRlXD8MTUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=I9KihzUv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=61W4JP5s8vUt9uD7fkH3yJkHJ3h3zSgOoudSNB9+DCA=; b=I9KihzUvS9amZ6JG12fLnBmKOM
	lF26nIdAMu1Q8D+Gl9Igb3TD3gGII3hFL9Ofj7fA18GPywbsAxh4ONokft8g6YX1qUHlzRLS5Xyk6
	xGDA5io3HKnw8C+2XMAOMpWrkW9Lqgc0qAuGNB1z5zPpIk9A7oA2PKeiaIZpGdYXS2hjiavrEr/Fz
	JMvuIg6fPC/bpxW+/ATFBBBiuGITbmuGWDcYdgV15ju7gcwJpqHo0zEEL5U5dqyGKHyDqEZMmRo2w
	k3H3pzJweSL5R3WcKcaOXZnCtE2Eaq8nC1MRtQBlfxAfRqJ29lt4YFiJx0uvh64olgXLZQpo99gB0
	ZW8Pj2yQ==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shQZN-0003nE-Os; Fri, 23 Aug 2024 11:26:57 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
 tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
 tim.chen@rock-chips.com, elaine.zhang@rock-chips.com,
 Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v2] gpio: rockchip: avoid division by zero
Date: Fri, 23 Aug 2024 11:27:38 +0200
Message-ID: <3370558.KgjxqYA5nG@diego>
In-Reply-To: <20240823034314.62305-2-ye.zhang@rock-chips.com>
References:
 <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 23. August 2024, 05:43:04 CEST schrieb Ye Zhang:
> If the clk_get_rate return '0', it will happen division by zero.
> 
> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 0bd339813110..712258224eb3 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -207,6 +207,8 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
>  	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
>  		div_debounce_support = true;
>  		freq = clk_get_rate(bank->db_clk);
> +		if (!freq)
> +			return -EINVAL;
>  		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
>  		if (debounce > max_debounce)
>  			return -EINVAL;
> 





