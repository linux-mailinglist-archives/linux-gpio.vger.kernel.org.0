Return-Path: <linux-gpio+bounces-9564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C696862E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB9F1F2289D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F821849E7;
	Mon,  2 Sep 2024 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="z1eQ+3/l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC7184538;
	Mon,  2 Sep 2024 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276415; cv=none; b=mQ8tmGUwEI0ycwvnQxgL6M+yzzNK4UpO4QYZO6VpuBTxUFQBSjXb9IfT3opfCp4XbX21xtGm5QjnYm07NViNciY8oIE1O0ZCl+ahIzNeSPlmRtC4qHTnGeFZWlvzR429SjcjZp2cEWBcscmnxfiUmWirYODshauMsf3UtkuMCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276415; c=relaxed/simple;
	bh=dhVEMimgLw8HC85L59Ag3Ru0kt8YNwjK33ZcxFMYMZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8zLRTlrMY6/ICSDqORDCUL4nlxp08uWhpJpgs4Vkh/mOKODpnPf4SU4dwpoCQ74AMxiVee2CigtIVEea3ar5mTLb7BlF6nxnTtu1sSRJPHF5vEsWdNiesJUtGFxgWq8DNicJ1QQ4IO8snrZePLLE49lLCKzEy1eWHoIffjJvhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=z1eQ+3/l; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u/5qvrxdwCRzZHM1ri7I900pedp9vJAN87y6E4mli+w=; b=z1eQ+3/lXdHxKMnUOMYPDnCWeY
	uPUacVN6YOITajfc93YDwFOELs9dmWjPcX81psJyNLX4Mi2tOvkvSiS6+ipjbUfKwgv3IIcRLXHPI
	iSYGJQL/+p2Gj0hXMp/d+VxH54RO5acTmKRHzrcm+j5ARyNMxmGJ/QqVYGGP19ME7BVARKe7e1/2r
	bLJIEQbPkD9Uvk6/I9d2q7HSD+QObY5HQOLIWpDkt/PaUHxGu/Fb40bchmTXmULMpPEw2wtY03gnc
	nWZd0Q3KqgSBQ2ahPWegjA69kPJBAoPoKAHEJo5rfmi9hMOnS5FfOeUASlhx1jl0aIkXh7QREiVkc
	R5L1kytQ==;
Received: from i5e860d00.versanet.de ([94.134.13.0] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sl5Ci-0001p7-Kw; Mon, 02 Sep 2024 13:26:40 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] gpio: rockchip: fix OF node leak in probe()
Date: Mon, 02 Sep 2024 13:28:15 +0200
Message-ID: <2405471.3c9HiEOlIg@diego>
In-Reply-To: <20240826150832.65657-1-krzysztof.kozlowski@linaro.org>
References: <20240826150832.65657-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 26. August 2024, 17:08:32 CEST schrieb Krzysztof Kozlowski:
> Driver code is leaking OF node reference from of_get_parent() in
> probe().
> 
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpio-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 0bd339813110..365ab947983c 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -713,6 +713,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	pctldev = of_pinctrl_get(pctlnp);
> +	of_node_put(pctlnp);
>  	if (!pctldev)
>  		return -EPROBE_DEFER;
>  
> 

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




