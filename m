Return-Path: <linux-gpio+bounces-4988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29781894FA0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 12:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D06E1C20B9B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE64F5A4E1;
	Tue,  2 Apr 2024 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PdHDG0hD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7759B56
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052642; cv=none; b=D2PNhmuOEKYWFmdoKJv1JoaXzfbvOLW+xZi/gIbW0quD3wQRkqXrAiSA4I3iWf+b+P98OjIyNxg6/pSri9+8bJeIrV951+c86eANx14gSPDYOxwYHVihrfogslMy/jh+WxgR8nluYB/wQKyjg4JfK5dUQHDNlB6Iu3+Km476KMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052642; c=relaxed/simple;
	bh=WWVfJ5cioUxz6S/7fvZQePLLUrTUQzf8HJTUqnq+zNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc5JR2TK/+NNEn/Ch3Mxqlgm8jbKR7GsUm3fyGGsLBV11F88ZRlhPokltOlc5LiD3RfpoZ+J9yuLA0R3mLdzEzs2zcWMtIRH2MzFUGQhnebC6IIV2W6tXCYHFsezJ1hzlD6pLwGE9O5Mxd85ejhoJuixphUMY9ZxGhCZLFJlUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdHDG0hD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso8228721e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052639; x=1712657439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3dTkfTfTmTvc+VC+51bPMt1Qpx/m6tf4J512elF7jQ=;
        b=PdHDG0hDrwftoYcsL2ubR2chrjaAZAyQvWxwE9l59a0GGaFfJeYHQjR8wZZ9sXV2BE
         LImCsTZ+JBrpk/Gg1eDMXpjKxokHoEeA7Rb3+LMP2plPczGSc9BW0ia3B4tjj4Y0W427
         L6aZ2+a1qPMfkegJpZgYMIRroue+Q8SOE9hZU2UdIUrZvkpD0P/rhTWxLFQNjcU5IFQs
         eOT4h9ckhKknLXSQynhzblAWmZS9ElZ2KzEOgI9QI0GFwj3+C7gcyn+aWUhjUWm7L7GI
         yauBvpI+LCwl86dOpBExPgVw6UzOAXBGJJqqRLxOiepl/72NICStbGNdYVJZWB9pHr5Y
         w9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052639; x=1712657439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3dTkfTfTmTvc+VC+51bPMt1Qpx/m6tf4J512elF7jQ=;
        b=MZMMt9b69K339MMOAYQ7kZhhf4ttblXS2qwJjCk3uwDs+fSSINJxGGWwUcCRv4scwb
         DESut19pGmzbPpNDmfHq9gFxNGpksR2imGegmkLPwT1yzBgJBiqe1iMXZQvOGDEKt5li
         PeUEq5TJ4E+bynZOz/QL66Ambdo+TTJ8VX9c5ss1mT7g64tEvUu12SxrepQmNNgDKaFE
         6yzpB+2lbzfsP52Sa8cPLBIwdVCIBaNPJi7kL9QVySCDi2bhMAGyQ0ttSpX6fBAe661d
         ksFJVglB+6wapMylGEcwvMe2D1Bcx8VxW07zvqdkkWFZX4KdZH/RPXQDjALkYmsoMKty
         zwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ79NYJggUW44w80A2gxp9u5BzKMMXSJ3lCQ66wuYHIeDU3ogYeVsiSG6PEDS4n1UeI2nAm10FijO5vtY0c7n0nVeZn9tm2RzJmQ==
X-Gm-Message-State: AOJu0YyMfn/0u5WrmLQM88dsNGF8dUSoxNg3JuY/TybAkV04vbISeJLu
	bvgPbO6g6/tLcf9f62Lo0H6JLnF1iWY/66C34UovionpBPjSRoK25+AdM545rnE=
X-Google-Smtp-Source: AGHT+IHNkFT8bTmOdfTTgGqZjVoDCZyaezeA9aZ2HSvnF4VqQ6nRD668Hld3aD1xS3tB5xSXeI+ptA==
X-Received: by 2002:a05:6512:312d:b0:512:fe25:550b with SMTP id p13-20020a056512312d00b00512fe25550bmr1006845lfd.47.1712052638622;
        Tue, 02 Apr 2024 03:10:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id js18-20020a170906ca9200b00a4e57c8e947sm3385482ejb.118.2024.04.02.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:10:38 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:10:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: mediatek: paris: Fix
 PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
Message-ID: <88555630-7232-4762-8215-afb65006e290@moroto.mountain>
References: <20240327091336.3434141-1-wenst@chromium.org>
 <20240327091336.3434141-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327091336.3434141-2-wenst@chromium.org>

On Wed, Mar 27, 2024 at 05:13:33PM +0800, Chen-Yu Tsai wrote:
> In the generic pin config library, readback of some options are handled
> differently compared to the setting of those options: the argument value
> is used to convey enable/disable of an option in the set path, but
> success or -EINVAL is used to convey if an option is enabled or disabled
> in the debugfs readback path.
> 
> PIN_CONFIG_INPUT_SCHMITT_ENABLE is one such option. Fix the readback of
> the option in the mediatek-paris library, so that the debugfs dump is
> not showing "input schmitt enabled" for pins that don't have it enabled.
> 
> Fixes: 1bea6afbc842 ("pinctrl: mediatek: Refine mtk_pinconf_get()")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index b6bc31abd2b0..9353f78a52f0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -193,6 +193,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  		}
>  
>  		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
> +		if (!ret)
> +			err = -EINVAL;

In this function "ret" contains a mix of different data depending on
what the param is.  It's not always clear what "ret" means from one
line to the next.  I think it would be more clear to say
if (ret == MTK_DISABLE) in this case...

(I'm sorry to the list for sending so many nit picks today).

regards,
dan carpenter

