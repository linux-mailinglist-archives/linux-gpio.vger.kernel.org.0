Return-Path: <linux-gpio+bounces-5406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CA8A2A33
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 11:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F311F22C53
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 09:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796B658210;
	Fri, 12 Apr 2024 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RqOyfTLr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2033A58AAD
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712911969; cv=none; b=gMh7Mwq7Bil7KaprkU4DZf+pOi8MLhnQBo/gjHUxubU/Oq+w2A4rPbqI0VDvsHMl6MvF5tSR5SbYgH2vTZwmEu9joPExt1v5oQj0QL9bcSzgwYxjERxPFPCruqS3/jhA4tvv3O+VigtxhUXDIEbZ50tQkHwKesxs7bQ/RJ5PFcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712911969; c=relaxed/simple;
	bh=/IeU9ssGSLw9Ct4KuGTCKCYgaCVVK3WWsbfp9sM9Zro=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oW0huq32CtIaJNrVWDZACebvI9EzExkeK917UBM/wS0Uatp/MIxKkPQal1TRdoWAfyXKRv5oA/whT3faaYxDmPhLyh3pNAhPcTcRCQchLh1WZhwqKZRfF8bd2gs6pCGD5v7omZvtb3iD7CXWBIiYudcxsTeTm6E112MNEH90b5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RqOyfTLr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-343e096965bso365516f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712911965; x=1713516765; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqg7/6oBVG7FC2A7yaPi7N20RXmvrxHvn6/HhvcSh6c=;
        b=RqOyfTLrl4I0+Yl+iJg11oM+9a6lv6BgqUJ9wtodMOtWliCNM8w5JyeTGgqOJwBM1z
         ftB6q+27wedCE+AIuSxFU3hbRhygw5fPjxpJE5ag9XRPPC7EyLnl1n6Pm+iPQ1k8LIZp
         Xdy4CJigXNPFtOzOAg8ULhjbKBZv0GGLnERBlGMtwrDxwIbrkYv9wwKz5rsQatoO6YQ3
         7mXR36iTAjgj5hk4SGcd2Z1eeZr1gEZZA14+z5DZNCbWYi6wb7XW0+mdY7W2sNpa8JxO
         RajpZ1CxNxn5qCsrOxVol+8oU4aSwDNHBIucgM/oelKJGZgoGmRm9r0mLIgM0SGD+RYw
         WwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712911965; x=1713516765;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqg7/6oBVG7FC2A7yaPi7N20RXmvrxHvn6/HhvcSh6c=;
        b=bQR18TyT0tDz4TGEGvx0k1oKFNCbp4D2STppWTXm1EMPO1m9a6LXkXKvMmr25Pzo51
         HtNtywEf/R1OmMf0/O6NVXcOYDAtzGqgE9QQioIn2lP/QMn9XgarIIcm2YPcJwJeyhEe
         ezfJZJ20YpiJ0gbQqQ2lbdt+tOEqpB/a9KE3qDnBgLzAiYu3vxGKOcn2eNvhMk6tX4hu
         dhlw6poBbuGEJT7/cdT8pAq2ZLAFQgKbK/CTWrDk9KfzIyZtbFmNFmvFowTH4mFDM3fO
         MEk21vke8rYypHS8EtLpJne43VpJjw5wsLGb391DuvjbOmrB/jedDnvbXn2UAoNvFd6b
         8KTA==
X-Forwarded-Encrypted: i=1; AJvYcCUT/Mhu2vGMLOLDCRg+pMAh2YSJ+uqkH08u65+CNtGpZBj3aqvsn7X6R02GCnMmtiGLMXiLSqOMuivKWW6GWg82v9NqjkXd6GXadQ==
X-Gm-Message-State: AOJu0Yzl5rvRg/LtcUGWKU65XhneOQngAGCaXw11GcXZdo2Cas+v5uJa
	XENlI85H5FblQT3y0HoxKQlAucRnCxG+2G5sEKquoNJFmtl4S7XUQq7VSzAP5QE=
X-Google-Smtp-Source: AGHT+IGaJEFW2OydWrtGlJEvOj+LQ9miUlniEJ47ZdatRM1Zm7j9aYX06RboRzFi8hrNNAXWEXWFlA==
X-Received: by 2002:a5d:5982:0:b0:346:ba70:82f4 with SMTP id n2-20020a5d5982000000b00346ba7082f4mr2066199wri.46.1712911965458;
        Fri, 12 Apr 2024 01:52:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:448:76e0:776e:989f:b50c:7cf6])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00341b7d5054bsm3783180wrf.72.2024.04.12.01.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 01:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Apr 2024 10:52:43 +0200
Message-Id: <D0I0M4T4O9G1.UUESU247CE42@baylibre.com>
Cc: <m.nirmaladevi@ltts.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <jpanis@baylibre.com>, <devicetree@vger.kernel.org>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>
Subject: Re: [PATCH v6 10/11] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC
 pinctrl and GPIO
From: "Esteban Blanc" <eblanc@baylibre.com>
To: "Bhargav Raviprakash" <bhargav.r@ltts.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20240408124047.191895-1-bhargav.r@ltts.com>
 <20240408124047.191895-11-bhargav.r@ltts.com>
In-Reply-To: <20240408124047.191895-11-bhargav.r@ltts.com>

On Mon Apr 8, 2024 at 2:40 PM CEST, Bhargav Raviprakash wrote:
> From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
>
> Add support for TPS65224 pinctrl and GPIOs to TPS6594 driver as they have
> significant functional overlap.
> TPS65224 PMIC has 6 GPIOS which can be configured as GPIO or other
> dedicated device functions.
>
> Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-tps6594.c | 275 +++++++++++++++++++++++++-----
>  1 file changed, 228 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-=
tps6594.c
> index 66985e54b..f3d1c1518 100644
> --- a/drivers/pinctrl/pinctrl-tps6594.c
> +++ b/drivers/pinctrl/pinctrl-tps6594.c
> @@ -338,8 +506,20 @@ static int tps6594_pinctrl_probe(struct platform_dev=
ice *pdev)
>  	config.parent =3D tps->dev;
>  	config.regmap =3D tps->regmap;
> -	config.ngpio =3D TPS6594_PINCTRL_PINS_NB;
> -	config.ngpio_per_reg =3D 8;
> +	switch (tps->chip_id) {
> +	case TPS65224:
> +		config.ngpio =3D ARRAY_SIZE(tps65224_gpio_func_group_names);
> +		config.ngpio_per_reg =3D TPS65224_NGPIO_PER_REG;
> +		break;
> +	case TPS6593:
> +	case TPS6594:
> +		config.ngpio =3D ARRAY_SIZE(tps6594_gpio_func_group_names);
> +		config.ngpio_per_reg =3D TPS6594_NGPIO_PER_REG;
> +		break;
> +	default:
> +		break;
> +	}

Please merge the two switch case.=20

Other than that I think it's ok.

Best regards,

--=20
Esteban "Skallwar" Blanc
BayLibre

