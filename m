Return-Path: <linux-gpio+bounces-12904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C029C696D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3408283DFA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 06:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A0F17A92F;
	Wed, 13 Nov 2024 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVg+GVaf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9088314F9FD;
	Wed, 13 Nov 2024 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731480096; cv=none; b=Lvyg3xNo6I2IcDI/z5Js1icyhNP2wkdTAul2COokTZLSl48I6ROtVZS8jGfHtOffp4upT7ImQfIyORqcQpg6jcYVh6Sv7P73teJn9gkBvYOGzY9GuMPxbhAEVq+9BsANGfsouA0HilPY+U089N0+h+TUg6o9Sq6ybOsXsA14TEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731480096; c=relaxed/simple;
	bh=wyQyDHdXtyzcRPz2ARXn4TOAdhuwmr5UYlMO4VyOe08=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rKsq2HZLmtehef6laIEZ2xdHc0ncdk5iGFzp2gZCmBYoiaoRHl/qoBOAf5SQ1NGQQYxSDfUhIaFOqUB/QmNFpJeCWG/tnx6DUeoPUujjZiw+JyiWgnDoCCwptGaQVxLpTmU+senglMxmO8IaioOEd0gnspxr1W2mEXeBzpEEDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVg+GVaf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E24EC4CECD;
	Wed, 13 Nov 2024 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731480096;
	bh=wyQyDHdXtyzcRPz2ARXn4TOAdhuwmr5UYlMO4VyOe08=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=iVg+GVaf7TzsDb5ROiATlK6YmnGZpnTPtCf3ZmkWVtyv82UJ8wjnMoTdGV7OUFsXR
	 zRXhsdxSYW0pwa6XyMRIlpafSWfukENwg5e9/zPrVTWGnAEXhg/jTz0ujtdRcWEBCT
	 8Mcroin3/IfPwuNjNzUNd+YXFoViyHTmkVE0lU5VU8cdM1QeumcPnsWbqWsg5RQzFO
	 oGxXTVaJwGFgAN9OfkqUz25JkoZA84UU3mLTEy5CM3dXfl9gGWfGcHc4ckBikrsvH3
	 wtu+TCjXxNoiWiG7ioSnX5+Xh+syE2YNenbQByTt9DGuh/kJ4LFWztPJrDm+4MQMcU
	 PQFaW19ZiB6lA==
Message-ID: <e3ff8ec3-1995-408d-aa75-6afc11f51ebd@kernel.org>
Date: Wed, 13 Nov 2024 15:41:34 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v3] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113063611.5330-1-zhangjiao2@cmss.chinamobile.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113063611.5330-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 15:36, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is no need anymore,

You forgot to fix "no need -> not needed".
And you forgot to add my review tag as well.

> use its name in the #undef statement instead of
> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
> v2->v3:
> 	Modify commit info.
> 
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index caf20215aaba..eddb01796a83 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -181,7 +181,7 @@ static const u32 k210_pinconf_mode_id_to_mode[] = {
>  	[K210_PC_DEFAULT_INT13] = K210_PC_MODE_IN | K210_PC_PU,
>  };
>  
> -#undef DEFAULT
> +#undef K210_PC_DEFAULT
>  
>  /*
>   * Pin functions configuration information.


-- 
Damien Le Moal
Western Digital Research

