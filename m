Return-Path: <linux-gpio+bounces-11458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 073519A115B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 20:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02991F25872
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 18:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198C72139DF;
	Wed, 16 Oct 2024 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="INR2+jAJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084F18C90E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102515; cv=none; b=JWgbufH54uUbduQEzNjmxDK5ois8Z7CdZrCvI3Ya/trlzqMu50h4Vxs2NrRT/XQsdUNvX+94ounnDAkH92q1lPzAuaGg44rx97WnuEvG6kJT+/9AZEHoP0LY7LmtWI4iQLEMkPF+M7LfghZEdBLJtjjPqXUEM7P/IZYDb+Uyd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102515; c=relaxed/simple;
	bh=mAq4AoMlxKysGb+Itk7iEnVK5aXThmWxihuz2MsOgLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhGTztYvaY/hMm4yncDmjyNbKsCcw8C+wQTVuwl+Z3AAUs6dx8nW4HTCIwoE8POi9jk40UXvMhUWY+qw35FN4XVRV38WOpNuBhXbZVJaY1bnbdyOXGS3+rpTcRJObEwZ1zwZy6eL6SudDa7GmXUx1iRgdW8TW9K+d5tL8Nt9MHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=INR2+jAJ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso95019a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729102512; x=1729707312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=INR2+jAJbEwk/lqh9HxvjvDKHVEst9SoQW9s8r6q1l9gNdRlwMt7lB0U8Rv4Ce/VKh
         bbMUgunkwVNGIuPffvvG272pEFNuHhPcY2xNY1KAyh2z+IzA3n/iK01CoE2BZlZdfMve
         OWDJtiEJAV2GyvgZKIqV7xV3uMfVH7xM8S9QOrGGHK7feucyBKHpQRG/GhZvBoVSra1N
         pHNXqM+J8oI4q1sd8rZ0hEZVxgulCT/WSk7QI9oPfHs35nM8hk/0BmolQETnjpZklpA5
         zkTVRe0I5IsUI+Hh7d2jGcdWzaKkv+aYI7Fl/oMFXaxzTj4shtYW9IePVYaOp8d6y4ex
         qhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102512; x=1729707312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=Sbj5D6NdfMP6BdyHJKVgzRBnhWS2o7lRlqx9ZyXe2nBnELNCMRRynH3pc/vdX7s+YU
         zHKalOSLcJDcIhx97SuxomKtdEj8Jq/EjIBE+RWZtAWXjcHMvK+KQySCy6pV9kG3GCKT
         9ZWp8ufo2QO44CZHcVXIWXCfLtJDVGvRGaTjoQIR92nFM0WXIaAHr19r7/0VmGY5io9M
         wuOBN1bXRvWJGL2z2Y5IoeSYiXqm2Nr7WmV4xxkoz+CSk4+F6u7dQGpW4pDkfS5GgdBj
         PDGbsPk6O0gdpycFWrY0Yce5I0x78tXSPQysa+IkB2DA7GMfSNca2mfHPsSWL+bnBVZp
         3PYA==
X-Forwarded-Encrypted: i=1; AJvYcCUW9hQYK3EkMiZtov4qXCOVZuUV2rPuJHmf5Voxs1Y1tHfAHn/WkQqPvEG1ewu/3uBrbE/LPT3jgWH1@vger.kernel.org
X-Gm-Message-State: AOJu0YxcoJfZZGWy62DLGuNBbouX5ljD8/rTKHoZXRSKOQEee6GFf31t
	TpsEPw3wBCQ1Q14+gp3mrdSi2dAv1beU/SR88IsR1ThciNb0Ah5DhDKs55d3ewg=
X-Google-Smtp-Source: AGHT+IFPs/1VOYlgs8ynT/CESZBXXAGDk0R6M8OaJ6CAurUUdtWENPzhZVi9D9E3OSJvDP5dBev+bQ==
X-Received: by 2002:a17:90a:5647:b0:2e1:682b:361a with SMTP id 98e67ed59e1d1-2e3ab8bb22bmr5177503a91.28.1729102512217;
        Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08d082dsm79600a91.23.2024.10.16.11.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:15:11 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:15:10 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
Message-ID: <ZxACrl/0hUE62eGN@x1>
References: <20241016155655.334518-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>

On Wed, Oct 16, 2024 at 04:56:55PM +0100, Colin Ian King wrote:
> The initialization of muxtype deferences pointer func before func
> is sanity checked with a null pointer check, hence we have a null
> pointer deference issue. Fix this by only deferencing func with
> the assignment to muxtype after func has been null pointer checked.
> 
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 7474d8da32f9..e641bad6728c 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -803,11 +803,12 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> -	enum th1520_muxtype muxtype = (uintptr_t)func->data;
> +	enum th1520_muxtype muxtype;
>  
>  	if (!func)
>  		return -EINVAL;
>  
> +	muxtype = (uintptr_t)func->data;
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>  				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
>  				 muxtype);
> -- 
> 2.39.5
> 

Acked-by: Drew Fustini <dfustini@tenstorrent.com>

I've tested this on top of next-20241016 on the BeagleV Ahead and
LicheePi 4A.

thanks,
drew

