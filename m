Return-Path: <linux-gpio+bounces-7576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56DF90FC87
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 08:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E5D8B237EF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 06:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED403987B;
	Thu, 20 Jun 2024 06:09:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BA2E651;
	Thu, 20 Jun 2024 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718863790; cv=none; b=uGcwZIdkY7ajIHIK6xBApHbr5oGJZEbKcMijQlKIcMDTrLY8MSp/LRsxy5/84PzUZafozmTWmD4TJRgJVvWWqaAfgYhMcwdXbKHJujhSU8tDOeqA0vNJG1cR0dpxeDGzPI9avz3ELv5zOw4ssDPKnxppXxPf8bb5o2frzlrlFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718863790; c=relaxed/simple;
	bh=K+Vf8OZitz+Lur1cZCnem+mL6y2rciJJJZ1w1AH2F0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkwMdJtJE+ygL0v1lflKQoUimmhngNRxBu0hxv/lmYNCZ04em7MbrPACljvzirXNXthuoBhlGG/EuQqvZ6vgaFdOFnzLNhkS+D8PgqphQi6JnLvNgrPqoqDlTTrI2vhtninVUIByOojtpl//+/QHgtXW9uhEOza/1n2PzdnjfOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af485.dynamic.kabel-deutschland.de [95.90.244.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AA01E61E5FE01;
	Thu, 20 Jun 2024 08:08:24 +0200 (CEST)
Message-ID: <10ada752-f464-4d3d-aeb2-9c63ebff121a@molgen.mpg.de>
Date: Thu, 20 Jun 2024 08:08:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pinctrl: aspeed-g6: Add NCSI pin group config
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
 Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
 <20240620012512.3109518-2-potin.lai.pt@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240620012512.3109518-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Potin,


Thank you for your patch.

Am 20.06.24 um 03:25 schrieb Potin Lai:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.

Please add a reference to the source for this statement.

> To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,

groupis? Do you mean group?

> reducing the number of required pins.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 7938741136a2c..31e4e0b342a00 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
>   
>   FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26, F25,
>   		E26);
> -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> +FUNC_DECL_2(RMII3, RMII3, NCSI3);
>   
>   #define F24 28
>   SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
>   
>   FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
>   		B24);
> -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> +FUNC_DECL_2(RMII4, RMII4, NCSI4);
>   
>   #define D22 40
>   SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
>   	ASPEED_PINCTRL_GROUP(MDIO2),
>   	ASPEED_PINCTRL_GROUP(MDIO3),
>   	ASPEED_PINCTRL_GROUP(MDIO4),
> +	ASPEED_PINCTRL_GROUP(NCSI3),
> +	ASPEED_PINCTRL_GROUP(NCSI4),
>   	ASPEED_PINCTRL_GROUP(NCTS1),
>   	ASPEED_PINCTRL_GROUP(NCTS2),
>   	ASPEED_PINCTRL_GROUP(NCTS3),


Kind regards,

Paul

