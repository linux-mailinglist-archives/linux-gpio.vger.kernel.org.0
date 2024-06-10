Return-Path: <linux-gpio+bounces-7298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C442F901AC9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 08:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792861F242E7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 06:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACE73CF51;
	Mon, 10 Jun 2024 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OX5FfR/X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3F381AD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999063; cv=none; b=HaM36+U7hdkwloo0fBl2uJv1F1vdJR9FIg7DB8ERW8xJOgj0rCiFH8yMEm4JrdxiCQ3+q4fF6YvtW+alsmu8k+y+J01SZBmmR4gWinpMGBJaMImX3PCoYxsHn5gMmY+NTB6SI1sngP1UYvd77/9jXxBUNKxHLZBWWAzwuleuPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999063; c=relaxed/simple;
	bh=H9e1DtrBKyasjGaY6GRjDrdJMaI7XGOcU8lHh4uKUgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q86+fAtQi9e5AltOefL9csMoAULaRXr3phcYJc7rx+NOtVtdXTsQtcaVYX6VlTihPSs+nYwP/RHCEoUys8trcqb1x6orgFGMWIzWxd0nOSjQWApQY77T7NUMiOewnF84kw2/j6/SqytY6+Go4TAlPSY+SEio20eew+TVE31PBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OX5FfR/X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-354b722fe81so3449896f8f.3
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2024 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717999059; x=1718603859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FC/HmJJiWdO+PsgBiIdzngU/gSiU+MnAOVhV61bqZaM=;
        b=OX5FfR/X5NI7YtAupgZVf6dCXy7GZnyRCkiiasrFCP+Yq9CrZ9MymBm+o5Nash7v9f
         QfumGyi5Lac5R1sDTeSHORYcOT16s+b3s98mbow9mGSDGe1jZXbi2ODTebYnCk5NU7pn
         LPxKFknCoG392FM7VmHVHtAEFt5ynz+U7D7Mm59MYQKdJ2VNfQnDWR2j95s06gWGe9VU
         Ripnkk4d+9XWFbmncqwQmAwmuBEY5YravRq+vNztcAIBGMUutW03MgoLo5HR/3cLpcR5
         iF1nOltiloOOiBJHCW9NWqfUbTMgw9CHl6WBGGLnIlbwaV1HPjP+pHGa1MpddFS5W8nI
         56oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717999059; x=1718603859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC/HmJJiWdO+PsgBiIdzngU/gSiU+MnAOVhV61bqZaM=;
        b=GfvNfQdBcqasR6fjDeoN6R8nqnaREnq4mrwP1T4Airmuyd2oQg6Sbt50hHYQHAr+ea
         Z9H5EGzec/6vGuLmBvVlNiRmqHsHpr+MNBTSqxyNWJQ4ioe44R3iaxlQM1y3XqHz3Yd7
         d6FWTCizmhY8bNUlfpZ4r/YLTo/APgwQlIa9c+BmgxNaW2R4EYgYq1p2yjNvKA+sYFuL
         zzae5OV7vCf0TweI75hRlvWN0FbWCH9S5gfX0MJRtTeaglMKO0Kwal8pot9ITdIuPGs3
         FHdT3WQSkxGU/jCWFQwTukgzhf6it8NjCFROBkoF1jt/X+KyjWo+l4R4jTZgTmYEAHhB
         89wg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGCoLMTnscFcv+Q2pvV7T0zmBFrTYQ2vsAVUSvg61FHNo5Jnxeot2qHhFFzVMcbPtnbUpfjRi9cmbNp4O5jDFxT5SeBiqcTcn4A==
X-Gm-Message-State: AOJu0Yz4gaJM6zuOTeSnUBfBw9CJDbkx2Jf+DWaGCjhJhx08O6lLf+ui
	Ie1rX1SPUnLFSR+1oj28D1EqZoTc8Ge0oC5d3tl+bL/pGrhiOu+hOgoGq/WCYm4=
X-Google-Smtp-Source: AGHT+IEtjY19VU7Eq089Pqm61jMuYTQI/xyPIM77aNuSXET+VPetxzvIJkA3ZyLcTqGk+vK8y9ETnw==
X-Received: by 2002:a5d:634e:0:b0:35f:1384:de4d with SMTP id ffacd0b85a97d-35f1384e1e3mr3120844f8f.37.1717999059053;
        Sun, 09 Jun 2024 22:57:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29e57sm10097602f8f.2.2024.06.09.22.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:57:38 -0700 (PDT)
Message-ID: <b139a965-607a-4245-91b7-11ef9fd97082@tuxon.dev>
Date: Mon, 10 Jun 2024 08:57:37 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol
 device pointer to pinconf_generic_parse_dt_config()
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass pincontrol device pointer to pinconf_generic_parse_dt_config() in
> preparation for passing custom params.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Included RB tag
> 
> RFC->v2
> - No change
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index e60049b66203..ea1a08d272a1 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -532,7 +532,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		return -EINVAL;
>  	}
>  
> -	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &num_configs);
> +	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
>  	if (ret < 0)
>  		return ret;
>  

