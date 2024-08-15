Return-Path: <linux-gpio+bounces-8760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113839535E7
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 16:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD002835CB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 14:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC90B1AD402;
	Thu, 15 Aug 2024 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dI2Cu8Hh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90681AD3EF
	for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2024 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732937; cv=none; b=OKjp0XRm6tXX3tHU01eZus8gSAsDg2FSliyplcd0KgxkXaLEmi/evzWqbiZRK5cbDStASOee46TCxWXtfujW4/aRNb0w3kHQtS3syEyoeQ6nIHKTqcAB6B7pmWrBekMtqwUTOCo2Gy5+WhgkTZOd/SPy+ptaV9qGSWPZB8ZQhG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732937; c=relaxed/simple;
	bh=i5siM9opYRDdXz4TrrsV5yDspn2fgtr37BzgHz4ZMpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H35b358xqbQFcysQBfA7NQI3g++i9MScHnCTMlz9fzWNgVUzWj0/j4OFEw9YRkYkHeH4rdzsXh8wNkMAq0Unwzq6RYMYfUrkrVCNw+6eGWhrYFvBjOfJyGk9BDwZhk3f2+93nXa0gmE6r75chnRzn/5zsmwuSgPdjGHTCEh8mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dI2Cu8Hh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-429e29933aaso6653615e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2024 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723732934; x=1724337734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYfO09Nu4eDpFFzd3pXkfQxa0IarQCFdXjgX0H+LjAw=;
        b=dI2Cu8Hhqamzma4axhZsx51zVlxIsnuRslYmDxSp0WMjH8aWig1IblgjztuKmrjVZp
         CjxW7jJKSNETmPhdtCn/TXU/9mqBvXA3aS+neR0nDK89CpGwmEwzgvgI5T76Y8WNgZcQ
         J67YAabfhHUA6eIYYoQEeJs0EwLU8QpRUOFVhjisgXN4/hPgJ44sKrF6kGerReGUULr/
         pv3aXP5mZ8vQA4DsgW3DbBHETFU53U0sUna/MAA4WLP0Yc31CZN6x8o2zseMx/fZ9+0S
         gnrnLvMedszyoTkoXsqsnGH2MAti98yyUgBM6XpN6gE/Q99rApON7z5L1ApnnLsaHr6/
         0UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723732934; x=1724337734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYfO09Nu4eDpFFzd3pXkfQxa0IarQCFdXjgX0H+LjAw=;
        b=cCa236viF00E4Ps9N4NO9C7hHQF93i3KlC3awnbmQ10iU4B7/bff7ZKpT159NJFOz9
         bDp8OauESzMuIPwUglY5Y3xvyztH8WG32TG44J4p7Dwgc9JoSm6IUSBWtXftROezA6p6
         yD7oeglbxrX536+/l7qte04b0pSwtlaY9taw/O9UFmO/b78+HYFquJzdlACfk4PLs7gv
         YpCqw9E4rIzHaAGXa+GX44nDSg0wBIuSKC54GEzdic1geolz66s7WFBgEiv/3OBE1sXX
         m8olEjI23TLJffN1EDEKqYBfBehqngKwTay0rwJA7ogH5lrj4K4Q9FUmjn9WHzY4JfvD
         JdPg==
X-Gm-Message-State: AOJu0Yyx9hRUqMDBWR6eXuW0/IUiog5bSZO0Y6MsfNnQ/dt0RrSb8O3N
	A7zXcmj1VlcYIybnt8AyaWKQZgm2ySHJpw+2U8HtkaPiq/BIudRMGmoDjxhaknU=
X-Google-Smtp-Source: AGHT+IH35ZrKCFkbVbHnjsd4ANKHHfllHcs21rfQ9Q2/rlJTYocPR9HrQPLJdhVM3aGxvMyeSxl18A==
X-Received: by 2002:adf:f00f:0:b0:371:8748:cb19 with SMTP id ffacd0b85a97d-3718748cd48mr1826609f8f.56.1723732933908;
        Thu, 15 Aug 2024 07:42:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b8e8asm1694144f8f.116.2024.08.15.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 07:42:13 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:42:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, tony@atomide.com,
	haojian.zhuang@linaro.org, liwei391@huawei.com
Subject: Re: [PATCH v2 2/3] pinctrl: single: fix possible memory leak when
 pinctrl_enable() fails
Message-ID: <7273f419-871d-40c0-a2b6-be879ea48cfe@stanley.mountain>
References: <20240606023704.3931561-1-yangyingliang@huawei.com>
 <20240606023704.3931561-3-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606023704.3931561-3-yangyingliang@huawei.com>

On Thu, Jun 06, 2024 at 10:37:03AM +0800, Yang Yingliang wrote:
> This driver calls pinctrl_register_and_init() which is not
> devm_ managed, it will leads memory leak if pinctrl_enable()
> fails. Replace it with devm_pinctrl_register_and_init().
> And call pcs_free_resources() if pinctrl_enable() fails.
> 
> Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/pinctrl/pinctrl-single.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index a798f31d6954..4c6bfabb6bd7 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1329,7 +1329,6 @@ static void pcs_irq_free(struct pcs_device *pcs)
>  static void pcs_free_resources(struct pcs_device *pcs)
>  {
>  	pcs_irq_free(pcs);
> -	pinctrl_unregister(pcs->pctl);
>  
>  #if IS_BUILTIN(CONFIG_PINCTRL_SINGLE)
>  	if (pcs->missing_nr_pinctrl_cells)
> @@ -1879,7 +1878,7 @@ static int pcs_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto free;
>  
> -	ret = pinctrl_register_and_init(&pcs->desc, pcs->dev, pcs, &pcs->pctl);
> +	ret = devm_pinctrl_register_and_init(pcs->dev, &pcs->desc, pcs, &pcs->pctl);
>  	if (ret) {
>  		dev_err(pcs->dev, "could not register single pinctrl driver\n");
>  		goto free;
> @@ -1912,8 +1911,10 @@ static int pcs_probe(struct platform_device *pdev)
>  
>  	dev_info(pcs->dev, "%i pins, size %u\n", pcs->desc.npins, pcs->size);
>  
> -	return pinctrl_enable(pcs->pctl);
> +	if (pinctrl_enable(pcs->pctl))
> +		goto free;

Sorry, I didn't notice this until now.  This should have been:

	ret = pinctrl_enable(pcs->pctl);
	if (ret)
		goto free;

The error code needs to be saved.

regards,
dan carpenter

>  
> +	return 0;
>  free:
>  	pcs_free_resources(pcs);
>  
> -- 
> 2.25.1

