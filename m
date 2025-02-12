Return-Path: <linux-gpio+bounces-15825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD8A32143
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF943A34C3
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 08:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA2020551F;
	Wed, 12 Feb 2025 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrvpEPW9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46E2040B0;
	Wed, 12 Feb 2025 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739349360; cv=none; b=Y89e5hSMVpkmzZLR/ICzocf6qZxtVitB5WXEk1Gv86hITx9aITMTNnKoyB7MK24zjILILtfsSdnYM+fpid5CzWRqo/m6pPo4ctYf56Y4gEzZvgK0SWV78fjGtFaWO82ZHSoLYIWmrRfMyCZfOtWDkdVX5U8hWa5kvo1kDzeXZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739349360; c=relaxed/simple;
	bh=P/IawTMEDYQgUh6rXRi2Tx/KEi69Bj9nkUrMpq/y4JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uzyxfehpbv+eMXIfypvlhvjSFMnAD0st/seNTh3La/6PomUOh/rDF81eKZ9IwPX5LhTZjUb7B35nygkSO37Qf06bM7Gvjwb5OaW8jv/jK21oNaP5ICzqO+xg7yuThXIZyKX9ZXxCQhaBEqBNS7tSDyeLKR6cSdZ33sRnlEVCfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrvpEPW9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43956e3863eso11500305e9.2;
        Wed, 12 Feb 2025 00:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739349357; x=1739954157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oSj5xtl7bVYkJInIKtKyB/uUHYHD9dtTq2DJW2/ao8Q=;
        b=KrvpEPW9ya24rgUbKXZfhbSvCCzEsISfaplFX1WvzWP2YEW+6MAR7WY58VxnIVul0U
         gp9AQR9nW/jiEBLN7Dj/CShg6T/8efXXkArLlGaoq9lVqR1yYEPJ+oJCPFEyES55Kh68
         QVjsY/e5lQyoHU62sOW88dvOt6v6kVPVqZN14UJhQc4Mc2seUQafuPOk+IRYDNWnkHUv
         rTsNCubOJkqN8TlzsziexmZgXQyK7U+zXrSh+HIQdpy6prBO3wp8X5+JiJ3Fim1aSFRu
         lQLntAcRyDw4km1GDIP6bSdDBJlKvshYbWzlf9qVSSAHwz47ES9xHtSiPnMgiGHbZ8M3
         6sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739349357; x=1739954157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSj5xtl7bVYkJInIKtKyB/uUHYHD9dtTq2DJW2/ao8Q=;
        b=YSNs2aCvBeYr6QAgoxfBgFc7G1fnwGwd0Q3R1qqaxdaHLGSi8McvaDKOyW5cOABzvk
         x9aRGWBf1MNN0x/VqQ7mhk7eA96WbqantoU0zuiT907ubDrP/4/HnAkVXM/4/gP39/n8
         BnCOPaGH5Gd8XhkyCGmmqPBiazZbgMC2iZMYWeLxq3OI7+yTvMOiBl7I9vmoJFe1pqPJ
         A2wqXHuHVKObu2+dcl2Giqi7RsA0cxr+xv3SSt0ihoE7tMkdhBzI591Z/00vjJkNUzD3
         B1KlUBNfZuh798U71qzG1y80J2QYPu34yZplkTe/QNIbVY+rzcpj9RVPQ8dTVbvFQoqV
         oUdA==
X-Forwarded-Encrypted: i=1; AJvYcCXBXraJJuo2aol3wNQJCt0wGEcHY3m7lp8kavS0qD1abkk53jwjnSvU98BSf9X6Vpr0cM4XToeplf3nPiMW@vger.kernel.org, AJvYcCXC6rvcSUbZIufwVtvLWVNpr4G8UvyHiNPybXDJ3jBGQFaJEstR/u1KBA1yAP+oN+3scPGCFUwT@vger.kernel.org, AJvYcCXwhfQnsZrsAYqRgpEq409yFuCs+2oJWDQ2xrMVcDBfuZaz0AywlSmfuwe8Q4go+hZgKEjMcISUT4UC@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjO35BTLkS5E0pGadS3gIg1Ep9ewH6X6Z+H2gA720H7PtdrOs
	nBIflGt/MHx+EHyf76IRt9Q/UTx8CDgbdmiFZvWNW5ZhTJ+6C8KGsspDAlwx
X-Gm-Gg: ASbGnctBR8KzOL5k0m/32lmJjceymmz5OlBqUcXGzvtrfhbauEfXQadlQo7/d71Y45S
	b6IRj4Cjv7XgBjbehJI3m3K9phvSZ23xNJ7TI9ro9T84vxAiOZa53s1R0J3fXoLTJJmJa9h5WpJ
	/x9a+QNqRRHBM70piUGH7HocceHfvnECObRnVysgPWA+M+Dy8Oe3EZDZayCu+1RzWhov7agSHi7
	8QZuHtfwN9x4ZeyfXn1fv8FK/t66C19VflM/DACPHw3oE0VpRp+IqNNapS4ZdMIyYI7zFWObEiv
	/3Fx52GpACn1UUQ87m4=
X-Google-Smtp-Source: AGHT+IHY2eNLXNlPCNHbOZ700mXKJf164S+MfWhcFmXJJivb50sW1NKpTFDsmnjhKXKhysUp6XbP8A==
X-Received: by 2002:a05:600c:4710:b0:439:3e9e:929a with SMTP id 5b1f17b1804b1-439581b1d5cmr20093595e9.24.1739349356411;
        Wed, 12 Feb 2025 00:35:56 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a07867esm12630455e9.36.2025.02.12.00.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:35:55 -0800 (PST)
Message-ID: <6aa1ee3e-8310-450d-9165-7e33cc29f9ca@gmail.com>
Date: Wed, 12 Feb 2025 09:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Fix potential NULL pointer dereference
To: Chenyuan Yang <chenyuan0y@gmail.com>, geert+renesas@glider.be,
 linus.walleij@linaro.org, richardcochran@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, zzjas98@gmail.com
References: <20250210232552.1545887-1-chenyuan0y@gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250210232552.1545887-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/02/2025 00:25, Chenyuan Yang wrote:
> The `chip.label` could be NULL. Add missing check in the
> rza2_gpio_register().
> This is similar to commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> Besides, mediatek_gpio_bank_probe() in drivers/gpio/gpio-mt7621.c also
> has a very similar check.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pinctrl/renesas/pinctrl-rza2.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
> index dd1f8c29d3e7..3da8b0d389c9 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rza2.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
> @@ -246,6 +246,9 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
>   	int ret;
>   
>   	chip.label = devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
> +	if (!chip.label)
> +		return -ENOMEM;
> +
>   	chip.parent = priv->dev;
>   	chip.ngpio = priv->npins;
>   


