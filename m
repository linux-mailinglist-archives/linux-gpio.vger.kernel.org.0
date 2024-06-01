Return-Path: <linux-gpio+bounces-7027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D68D7168
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 19:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27971F21B61
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 17:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4CE74418;
	Sat,  1 Jun 2024 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pb/7z6vP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF9AD48
	for <linux-gpio@vger.kernel.org>; Sat,  1 Jun 2024 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717264140; cv=none; b=Tid61/5vyQqpv8KNyG8Lj7U8feGnZ3kWwrVB9tS/4HHw2MhdADB980ef5eNaR7G0iaIftRixObjeP0xNPCymuWqbNyvnRLKJvF0WZ54wINaSjztzjCZs9YkAw8PV+/orJr/XewsrNHKcw7afTtv5gqeyzTfBR/ZKH48ceHUzsaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717264140; c=relaxed/simple;
	bh=ip5UXAgwAlEKzI7uRlw1QVMwoLAc0kIa4iK+wIevpD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHUuh7uMOG1yfdOlsh9wHpPb61i4HCFVtOSklqklWK5pYK5bPLL88KWMJDO46Cao81D0sNTvrg8c8fB7dfb8gKKBknIz1RcCPPMB7GwnFPm16+l+HsN1PO3OByQgfcWxSfs6hMRa5NJdSgiJHw5OhJRHqdQDkNY78euxhKQNCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pb/7z6vP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6341cf2c99so329189966b.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2024 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717264136; x=1717868936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fxu9VC3T9/qx8H16vFRNG081fza+27USfBVMKFlVeY=;
        b=Pb/7z6vPmoxpRm6bfTF05QzwpNvPb/021qtIJHNkkh7G30LqzlsJj5yepjqOElPEum
         Y6KcLHlGEyqpTyVVBEWiXTskMX0OcfH49rSa9Cy0rd/WBF9iNRc8z6cKRSzl1P85Bcq4
         VuJkCfG3FuopMu5dCCtD4vIRB+I5aE8+Ub7m0cnYwOZPu/2z38OeoWzcRPdI1TaZ1F3h
         gxqnHSJIQHArQMqapp0aBHHhHhvY7zmK1PUE4lI10j863sOZ1dKN2yNAi0fU0IPCgftJ
         YhBRyKcI/hxbCJfFpHGy5tu7ZgNs83d2goWZ/aYBC/yr5PvR9BzZPKBFRjEhIcXMqmvV
         a04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717264136; x=1717868936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fxu9VC3T9/qx8H16vFRNG081fza+27USfBVMKFlVeY=;
        b=I98LjB9oUEF8xV3b0Wb9TeMvBFPLDa243CNrPgMNGs4maE5TROinjrlR/86YbJkep+
         u3SSSUw/ALlNnuQ2hhde6fVxhgUBPe/CdNyAMWGvOr3y9EtJL8y28+AgZzutk+79hBq1
         ZzoqIoFYB7OVahvlnHVAyyLcwP8UheYe3iLors+SO7pTaFAlNQSDe+GgCosEz7kO/AT/
         1vkksf6jQm9tOrhftOChSdmvXcX1zG+YwwKG5DXdumodlmxtbYqeNwyLJ/cjDqWzo8rw
         ciEzadEN005oWgEVT9ieqNQ2Ba+ZSyaEiBPlnj4RAWrZR1MMciuN69SYBuo101/ChTGW
         MPOw==
X-Gm-Message-State: AOJu0Yz+Wus9nELfFBcWCA3rplGhDxkN4BjkyHjSWlOjCqJJ23LFadXc
	OgIJ7SWOgDlWrz5BlF38/mweRa8x4/0y0yyfHGSIf8CoSA6NDJQL4IY0iJ80TBo=
X-Google-Smtp-Source: AGHT+IEGarZWvSDqTneXnvPAajOOg66chGsw9JCom2tlYHYdGNwnGCjC78xkaDPBdEAob+RGJNKnzw==
X-Received: by 2002:a17:906:3282:b0:a64:a091:91f2 with SMTP id a640c23a62f3a-a6820519e2cmr325194766b.37.1717264136002;
        Sat, 01 Jun 2024 10:48:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a552c902sm116032966b.191.2024.06.01.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 10:48:55 -0700 (PDT)
Date: Sat, 1 Jun 2024 20:48:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	liwei391@huawei.com
Subject: Re: [PATCH] pinctrl: core: fix possible memory leak in error path in
 pinctrl_enable()
Message-ID: <23343dd5-d6f9-4ca0-87bc-4d26dbfcfde6@moroto.mountain>
References: <20240601113502.2709597-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601113502.2709597-1-yangyingliang@huawei.com>

On Sat, Jun 01, 2024 at 07:35:02PM +0800, Yang Yingliang wrote:
> In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
> the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
> can not be called, it leads memory leak.
> 
> And some driver calls pinctrl_register_and_init() which is not devm_ managed,
> it also leads memory leak if pinctrl_enable() fails.
> 
> To fix this, add a flag devm_allocated to struct pinctrl_dev, free the memory
> by checking this flag.
> 
> Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/pinctrl/core.c | 9 +++++++++
>  drivers/pinctrl/core.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index cffeb869130d..374c36f5c759 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -2125,6 +2125,13 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
>  	error = pinctrl_claim_hogs(pctldev);
>  	if (error) {
>  		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
> +		if (!pctldev->devm_allocated) {
> +			pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
> +					      pctldev->desc->npins);
> +			mutex_destroy(&pctldev->mutex);
> +			kfree(pctldev);
> +		}

Why not do this free in pinctrl_register()?  It's a layering violation
to do it here.  It's not where you expect the free to be.  It will
just lead to double free bugs.

regards,
dan carpenter


