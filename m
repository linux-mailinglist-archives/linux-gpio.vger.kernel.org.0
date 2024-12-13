Return-Path: <linux-gpio+bounces-13858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D889F0B8F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 12:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4A128334C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 11:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5251DF725;
	Fri, 13 Dec 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="WCmUgeos"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412951DF258;
	Fri, 13 Dec 2024 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090332; cv=none; b=CfSH4r07okhSqy3cQ2QizoDk6if8S3e5xm7yZ42jUPXevJJ3RhzYC85txtPMok4xM1b2QhtXlOdWuRh6t5kvlZxSCkDkzHqh3my8VBwTfbYWwzd2jrhHs1hUnfWeI5rheO2McoCXObUHbQch1DWHzzmbsZ6JgLoBhMeI6bWXy9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090332; c=relaxed/simple;
	bh=4v/yHjAwR/PkEYsFKekNHWkBiua7t+bGZrW85oaTpxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYWFXzGZZbcfhnk74g9ixrsDTAKD8K99Lg53VPH5g9w0IblgFSOzi9czMV8Y5nd5PKi811kxMBhiCjIqpT8adPtuum7J6Y9YHeaN+J+pYOyxN0K2ywRXIZe0WD0oajyhfqxTB8wymxvWL+6krJMo2vc/RS9YDH+b3kd+/bTwM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=WCmUgeos; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E3731049DA13;
	Fri, 13 Dec 2024 12:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734090325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkBIlhUGkIaiKofFxUVhr74VClg7J+Yj/5BHdg57D+8=;
	b=WCmUgeosX4tvXaGOiHRdoD6VWNxfDTxSEKj4CLn7/x4aFicr3aW5a8/LadGjHRtv/5575d
	gCmNC2ojQGczCqkDM7MbJZu40HJus9y8cdZSvdjdYc/UysZ/eEF0VD2Xmms4Bk782EGaVq
	GGTVzilaiwLKOWrN6BMM+ZVnB6TR9UFBil3njXfibn6sPYRxHmZJUCXZc5ugdwLsQJITeK
	DxaFNzxIw+E3S5Pqa87fuxAePTuCZnktgamau651x8PqReAS4Z16bvY3Ybml4Q1E+kNe+O
	q+jvIDdzZz3l1EtJwK532EgUamcK35ZbRJFup2FuF1bHw4QWTX6BkjtMpsRbzQ==
Message-ID: <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
Date: Fri, 13 Dec 2024 12:45:19 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/13/24 2:09 AM, Mingwei Zheng wrote:

[...]

> @@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	return 0;
>   
>   err_clk:
> -	clk_disable_unprepare(bank->clk);
> +	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);


Should this be

-clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
+clk_disable_unprepare(pctl->clks[bank->bank_nr].clk);
                                   ^^^^^^^^^^^^^

?

>   	return err;
>   }
>   
> @@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> -			GFP_KERNEL);
> +				   GFP_KERNEL);
>   	if (!pctl->banks)
>   		return -ENOMEM;
>   
> +	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> +				  GFP_KERNEL);
> +	if (!pctl->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < banks; ++i)

i++

