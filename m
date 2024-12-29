Return-Path: <linux-gpio+bounces-14335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 032539FE010
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 18:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA618161CD0
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 17:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6133194A60;
	Sun, 29 Dec 2024 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="KSVapUJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31C99476;
	Sun, 29 Dec 2024 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735493875; cv=none; b=NNCo3uV1ynfYYFfSERvYYd2ah1wGtKItMbhPv+QCwjWpjYGS+khRFlq3KOvlm7I4MzGD68Yohv/JnE8lPxtci0yRUdGL6GhSIFYCLgyRdDiP2jyh3MOKV5tBD08/eKGRKLFD/iE1Pm6AaiCpIlxQgxh+jhz+Ey329SEQMDw0RsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735493875; c=relaxed/simple;
	bh=Q/6F0E5Wta5q4Af4lxq+d+DIoyX7o4sF6KNmSPr8BlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaXGo6boKjPbq2E9O5eDRX8G+bBLNBmUYuCWwMHD5ZBRhAxvBqRjNRgkyXhbS3nk/UicotYspc9Z/c7iZ8Ja9N+oPZjm4PbV5hCJtsBQJ2FfNOwAPlKuIB/UyUPnumcw6AvYwfvpZPupuUNhwEJzSxfVTfh0LTY/3GsDINoOswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=KSVapUJB; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4757104811E4;
	Sun, 29 Dec 2024 18:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735493865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfwoFskvac32DMGJaG2VVgg3dFe4kwMlCOX61uyPLDE=;
	b=KSVapUJBrd09Vwg/G5+Osz47EjxrzwoxxD5bJljCnJ4m92W0MeUuf1j+hai1P7q0slT5GP
	RUjHqtEWsRcmOt1I4s9LjHm5zamXHQRDFRQGMikQWFBE0dlNkAgIN0Knp5A6sphx2WPdCe
	cD9FYRmBHKO+wftSdPT05Nl+L0y4hH5DoGcg4DHucURTM2Fnsl1QJJ4G47V3o4FjZrhfWL
	OtkpJdAJh3wsPiDcyA9QWTmQWdneCSg5xlS7am2yVWQ0LBuSbVPmMtFCVV1whF7YvGZwTY
	M4EWyP0bUsES0SioAUSu2CVz/1iUdlVavxMwoRJiy/NWH+GJBp1WoObhj9xkYg==
Message-ID: <b2f2f1e6-a539-4d1b-876f-6715c126ac3e@denx.de>
Date: Sun, 29 Dec 2024 18:11:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241224200608.84923-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241224200608.84923-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/24/24 9:06 PM, Mingwei Zheng wrote:

[...]

> @@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	err = gpiochip_add_data(&bank->gpio_chip, bank);

There is one other nasty problem here -- this gpiochip_add_data() needs 
to be undone (*) below, otherwise ...
...

> +	ret = clk_bulk_prepare_enable(banks, pctl->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	for_each_gpiochip_node(dev, child) {
>   		ret = stm32_gpiolib_register_bank(pctl, child);

... if this stm32_gpiolib_register_bank() fails for second or later bank 
, then ...

>   		if (ret) {
>   			fwnode_handle_put(child);
> -
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> -
> -			return ret;
> +			goto err_clk;
>   		}
>   
>   		pctl->nbanks++;
> @@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	dev_info(dev, "Pinctrl STM32 initialized\n");
>   
>   	return 0;
> +
> +err_clk:
> +	clk_bulk_disable_unprepare(banks, pctl->clks);

... this clk_bulk_disable_unprepare() will disable all bank clocks, 
including the clocks for the banks which got successfully registered.

Before calling clk_bulk_disable_unprepare(), it is necessary to 
unregister the GPIO chips again, i.e.:

i = 0;
for_each_gpiochip_node(dev, child) {
   struct stm32_gpio_bank *bank = &pctl->banks[i];
   gpiochip_remove(*bank->gpio_chip);
}
clk_bulk_disable_unprepare(banks, pctl->clks);

Otherwise I think the patch is pretty good, thank you !

