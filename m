Return-Path: <linux-gpio+bounces-7632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB18914186
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 06:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E5F1F23241
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 04:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3503712B63;
	Mon, 24 Jun 2024 04:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="krcq+8Gs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68BA179A7
	for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2024 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205040; cv=none; b=Wogp9yDxz0q2kgu5OEWJ8zR4/2cSV7oUx09vmmuqnIQ4qzOdGpw4RR8mx7sO1SwekGo7mmNbFLf/TPG635T40kWidfFF3shx5xrvYOPrBXgWU+jT+NYfNPVk77yrKsVEBUMchWl6vw5Lo8CqZDIlPSa8JepJlPCoIfs+D1S9hIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205040; c=relaxed/simple;
	bh=RQS/xnRPJYl85/khVKO0/IszCWpI/UWhH+0merh4Jec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRU11dgJB+1d3I70yfuBLEUlD3JZnWABfy90LsGy8oVJ4a1Swb23+ztn+/ZullLL9t8kike8frKM6HXLhR5oLBy/Hb1IKPo9AEaZBg49iL0krAE/WpaHnPOmrgiWnBEXBSPn26hrLoBce07lMsMCHzNTwmTyQtE6TvICMXUtbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=krcq+8Gs; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso4476922a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jun 2024 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719205036; x=1719809836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohlkAFRMQEfc+goI/NqcWImo6WTjyKLJAJ4QQ/QxOaI=;
        b=krcq+8GsCdbRlWi0qhbpkwCM4WNbbtykJYqSSIIHK+3rKK97U4VTIs9o5aSziS7ksr
         dmWNxLN/pFKxlfGrhHLY6NPcjAE6bfWk/r4ZOh7nS0Xzhgq+coGM95K7qICMT9gRjoI+
         bcdEuHLoagP+0okiS0GFmDoEW0rksqe+wzd7d28eVMw/2DhuSRV8h4D71f1O1e8QpKJn
         DdCJolxUZp2kVgrBArZXRhKWJU/pImz9eybV0SOw/wnVWroK4uUVhD5J5RdOMRRiAsVK
         gBq5l4Z+ZJCgVLW2MA441NvmYCi9xW/V5+CBTAoIwFuLl3SSMEAcJb7grpeGDg85OotP
         nbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719205036; x=1719809836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohlkAFRMQEfc+goI/NqcWImo6WTjyKLJAJ4QQ/QxOaI=;
        b=m6Gs2rsmniUqmi+5LxKCTS7RdrKuuiRfnfZR3auzZKcsJK7qRbvhl1XjA3KFG+HpOJ
         IFhqsJWjY7d7te1BPF58+1UXCyg5XPwJUgjQfMpH5eOCs74ABfLOE3FJVQ9cIm4vDsvY
         jSNSuFR6NkQ+GFo4HioITdFpPzMAM0TyecwMdM4HmGkVOv9oGqwwKfCO3Wwvm1MsBPKN
         dGtXV2AZTAl0u9/d0tuKHF5lOzXz3Q+L0F4ptUG9ZAp1Ak/EjwKUe/Pfci89Hzu2eQ++
         pc+3s1hlysQGncmb6U5J7qmqP9RJMGVuydBoFzcBOf2k6KuJYHod3k53w6W7k7p9MyHR
         BRbA==
X-Forwarded-Encrypted: i=1; AJvYcCXhF4MwvBFf/qnSVuG8cyxMhPz7bUNUijVot3IAO8L2X7DWeOLn75FqndPDBvPamlJiJE1GW2tvk1eDaI+YFOWDgRCwezYE60A3lg==
X-Gm-Message-State: AOJu0YxLOmNqzPHCt1px+Sze8QWbDeLNhm6hRX3tzfDthtCLAjxQkwUN
	Faj0uoOWS+BOk0O5BfMu93916FB/0T2V6sQWnNzAB+T9BkZe3utclTgWKpzFOSA=
X-Google-Smtp-Source: AGHT+IE6vgU1QtCbosxprgy3+2vqnzOl54xK/Up6rxm39ABPLyAtmfvPFkFv7O9F9eu23nt8CCSZcQ==
X-Received: by 2002:a50:d703:0:b0:57c:9d54:67cf with SMTP id 4fb4d7f45d1cf-57d4bd79da4mr2599999a12.21.1719205036154;
        Sun, 23 Jun 2024 21:57:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4209761a12.20.2024.06.23.21.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 21:57:15 -0700 (PDT)
Message-ID: <65dcadf2-9247-4c65-84fa-ef982bfe79b0@tuxon.dev>
Date: Mon, 24 Jun 2024 07:57:14 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzg2l: Adjust bit masks for
 PIN_CFG_VARIABLE to use BIT(62)
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.06.2024 20:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Shift the bit masks for `PIN_CFG_PIN_MAP_MASK` and `PIN_CFG_PIN_REG_MASK`,
> to accommodate `PIN_CFG_VARIABLE` using `BIT(62)`.
> 
> Previously, these bit masks were placed higher up in the bit range, which
> did not leave room for `PIN_CFG_VARIABLE` at `BIT(62)`. By adjusting these
> masks, we ensure that `PIN_CFG_VARIABLE` can occupy `BIT(62)` without any
> conflicts. The updated masks are now:
> - `PIN_CFG_PIN_MAP_MASK`: `GENMASK_ULL(61, 54)` (was `GENMASK_ULL(62, 55)`)
> - `PIN_CFG_PIN_REG_MASK`: `GENMASK_ULL(53, 46)` (was `GENMASK_ULL(54, 47)`)
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index bfaeeb00ac4a..b79dd1ea2616 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -87,8 +87,8 @@
>  					 PIN_CFG_FILNUM | \
>  					 PIN_CFG_FILCLKSEL)
>  
> -#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
> -#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
> +#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
> +#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
>  #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
>  
>  /*

