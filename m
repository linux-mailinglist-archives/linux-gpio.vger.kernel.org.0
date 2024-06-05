Return-Path: <linux-gpio+bounces-7155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAD8FC6C0
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 10:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992F11C229A2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 08:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A1E1946C3;
	Wed,  5 Jun 2024 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LM1V7Pol"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E91946AC
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717576826; cv=none; b=G36AP7aargU1BvphNL9CKbHR90l375dcmQYZl/BD2IbJg9qJ60Nua4CskXHqGQ4PUyTTudxvzYHtmvoS2V+1vXIs5a1B2MXydyXuKfSIfPE1NK5pWjkyy0RcJDxvJSvirzXghE7wv0lyWZfB8hIbpEjS19UrzqcdkRZX64lfjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717576826; c=relaxed/simple;
	bh=VsswezuMz9rqmFnj0g4kX1gNf+31kAZkyms4tKt/cAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGS50xmcw4OucQYhw3qhfP52W/KQv8E0bCa0RTkHef5txsdvXxN2zWu3gA6yp6/E4OzuPT9mHO33X8KlkLC5WWJH/CMu/uQNe195omZUHLwDVwfOcWjWoXNh1OPxuSGCuw+4x9zFqffHQieLmDCFE3okLfvJ9pMntV8L2C/nt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LM1V7Pol; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a692130eb19so290922866b.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717576824; x=1718181624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKpBgogtWTBGgwUWgyWYtaj/7VXDavHXEUS9caFY5OA=;
        b=LM1V7Polo8jZx7+VakCKPil+bXjLFDTAAu3WWEHR7YYP+QFwy/OyXw2/FBOpPd4/zT
         t3hNNxK/gNeFv85xaYpwBfbzg6aR/doDrF0mJDML9H85YfbG3YI6y0SQMee2+UbiogEI
         BZT2IVRLEgf02EfSxc8sJtfi8HypqUNtLskMMUml++3FDTr1c8FflgwpdqLZ4n+bbjNk
         AI2pyEXO1Phh53KqVEkyeXBwB82FPLVuU7zRELertoMN6+ovkp6LxkGikxbBKuPl3jRx
         f/dQqcQLHvPtLLcPN6DwdhJtu16Qi+KdvsIZ4t9F7RRVedp+SRTaDxbiLJb2KbGdMUkH
         jIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717576824; x=1718181624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKpBgogtWTBGgwUWgyWYtaj/7VXDavHXEUS9caFY5OA=;
        b=RUdAZUkkKdf/Crl1i7Hp8wy0+kbxnt8WtMCQhiZntj/QKKVz61VOboXrSwruMTENi7
         LJ0RSkE2I9z9iaPq2cxutq0xiycJjqCxzJHfGTH8AiYEeluf8sb/PU1kAN4JrjL0tfpv
         JOqngMg0boOeN0KFpYYNZMIBOR0c8GajUsIDjHWkLAsjURM3C6jJ3nfWmFkgvLgYmz6F
         pGNr+BIsujEkOQSk7wbQa5CvxxmSrOkBVgWfhhMVpGNwcHQ2xRY4t6/1Q/D53TeqVupV
         6X42fmsSprdCf3nBPd/KOIs+6gpaYlTZ1ltF80QUdiVdEXvHEFk9e4mM9xAzVXzQadCK
         mQqw==
X-Gm-Message-State: AOJu0YzFf1g+nwEMy9IvPc9sVhaxeWp40cOqxlf4RWOu0UinD7j5EtIE
	AcafAydd9Xzv69N02fR6aa9SqPw/lVu1SZ15z9k/l9oG3Cfck+DV/DrmuToaS4w=
X-Google-Smtp-Source: AGHT+IHPwb3x5v2D+kKuCFCfnSF7ZcAPVr3YamoAx5inMjG9LvXB6eMnPlgM66scLwiamDl82a2evg==
X-Received: by 2002:a17:907:7426:b0:a65:ab25:24da with SMTP id a640c23a62f3a-a699face4e0mr93556866b.22.1717576823478;
        Wed, 05 Jun 2024 01:40:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a69041738d8sm429364766b.217.2024.06.05.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:40:23 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:40:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, tony@atomide.com,
	haojian.zhuang@linaro.org, liwei391@huawei.com
Subject: Re: [PATCH 2/3] pinctrl: single: fix possible memory leak when
 pinctrl_enable() fails
Message-ID: <a9a591aa-7c83-45c0-a52f-d288cc08b21d@moroto.mountain>
References: <20240605073827.3380584-1-yangyingliang@huawei.com>
 <20240605073827.3380584-3-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605073827.3380584-3-yangyingliang@huawei.com>

On Wed, Jun 05, 2024 at 03:38:26PM +0800, Yang Yingliang wrote:
> @@ -1879,7 +1878,7 @@ static int pcs_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto free;
>  
> -	ret = pinctrl_register_and_init(&pcs->desc, pcs->dev, pcs, &pcs->pctl);
> +	ret = devm_pinctrl_register_and_init(pcs->dev, &pcs->desc, pcs, &pcs->pctl);
>  	if (ret) {
>  		dev_err(pcs->dev, "could not register single pinctrl driver\n");
>  		goto free;

Could you add a check in this function for if pinctrl_enable() fails?

regards,
dan carpenter


