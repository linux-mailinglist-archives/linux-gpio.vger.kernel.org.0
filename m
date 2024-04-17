Return-Path: <linux-gpio+bounces-5624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73D8A87E9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 17:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDED1C220D2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 15:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209B4148FF9;
	Wed, 17 Apr 2024 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HT7MuNfq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAA1487F1
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713368334; cv=none; b=t/2HxI6lVxVOQ5RHfDqgkCf8DX7PbzoJzpbQoNWJQQiZnHHR/dHMkLXnw1Lx7wzKj1IbfIxO+8U+RaBhh5KqOzn7izX9bHofbHUMhSVI5l3nO0bxa67XnVWbnBZ8PS7phESfYh12zrPBpuYU8DyMFdIyXWc5u3GmvAH2T2/FBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713368334; c=relaxed/simple;
	bh=m7Jg/vL/xKOfRHStwyCzgv3f4ySN7DR3F489MW4STus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7aMpEK/4vhVw9dcDzjyVYDCNpCdZ13RNK6Qlvl7XiXuHic1wrIth7Z/G0Ku777IV1e9CelKeihlF3+r2TvIv1mrihd/LmQEYNp2UDjNbDCqsyhkgBsSJXElfvsyiyFhy6VqpHO55d4v6AJ6EfH36jRKD+cMuP1R/GnBDBzwmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HT7MuNfq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57013379e17so4297742a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713368331; x=1713973131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2pX2HX1tz4L2xSO2Zk+2hCUXSnn6DNlfR6Exc5bCT0=;
        b=HT7MuNfq4lG20KJ0mD0MJJdqhtp6n2dz+Gr4e+WR8/aYSlJ5u7u9M8vGJp7doMdJWK
         1fbbkmuYsZFr1+T+TbXB0EsPYIP7I9bhSo1w77zYBJ4UCdx4OdeO0cD2RIHD5siKyRlp
         ubLuhU9tp+pT451CTb65nmo74orPc+yQKV6NO2CZKUINCUD7SBViJurqwAPuv5tvniO/
         vl9LFlJEotivVta4EL+O3lDojiUY/3RblKA2fjCwf0M9rjNQa8OibBPmud5JrjCZjW+F
         3AomIEzrDkV1fKJnMuVlyXYnWSJMrqZMu5zO89jdBhDCBKzM1yrw2fH5B8dfYSqROVUg
         PsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713368331; x=1713973131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2pX2HX1tz4L2xSO2Zk+2hCUXSnn6DNlfR6Exc5bCT0=;
        b=cqJlFPBIiMXlaVCi7PE9NvNd9tWWOjW0CpHAW7gPmLTWGGm0i7a/o9NLf2xiY/w6t8
         0IQT7oOqNjBCT1Ge2/PdTim4CJtHVOIXyLeX/9vMe/Je9oX6h2axLsl4Fvt/oMt935PJ
         b0p7iFFSJNtZkpadO/VgBczDZ8Ih+wVRs2tEn7BBWNSDo2lIXXPySgyJ/zJ9bSG/Rl3T
         AT0pHBWeXKKMPg6QKgSVHXXCBc3UZP8inKRlWwUBhQVcNTfITrdw+y2Kp6RHTCzHPuxN
         kxYcldCY3Qki9DJyxQ3jSs1wXAgu+OGr9+DqfyegfDHrTdaSFgmyfkXbHnegHDSC743x
         ekSA==
X-Forwarded-Encrypted: i=1; AJvYcCXnys4p6iSmxpSSKfure1RmdHjUnHYS454czJpkAGPelN2bq4SSst2w9B1qIn7KpfgrOU27IH9Y3xwZuswqlj4S1q0em5zCrjDe1Q==
X-Gm-Message-State: AOJu0Yykd5HlQ0TI+HGGevkaE1w7CFDUxMO5Kg7t8vSifYk86YhGMQDn
	Uszct27WNL6W9eOCl7kCIPsNJRkoTybcRoBexpbaMCfojF5xd7FYm5k+9+DgDN4=
X-Google-Smtp-Source: AGHT+IGlfGw+4FpskCxgZJHJHpEBj4/cFequxAP7fu3wNXs185hTt2/Ula2a2m4jtIdBx0Xh5KXoOw==
X-Received: by 2002:a50:cd5d:0:b0:56e:2abd:d00f with SMTP id d29-20020a50cd5d000000b0056e2abdd00fmr12943233edj.18.1713368331309;
        Wed, 17 Apr 2024 08:38:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ev27-20020a056402541b00b0056b8dcdaca5sm7427656edb.73.2024.04.17.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 08:38:50 -0700 (PDT)
Date: Wed, 17 Apr 2024 18:38:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Zeng Heng <zengheng4@huawei.com>, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org, xiexiuqi@huawei.com,
	linux-gpio@vger.kernel.org, weiyongjun1@huawei.com,
	liwei391@huawei.com
Subject: Re: [PATCH] pinctrl: devicetree: fix refcount leak in
 pinctrl_dt_to_map()
Message-ID: <d80e09d8-5f35-4865-9fe8-195b86527972@moroto.mountain>
References: <20240415105328.3651441-1-zengheng4@huawei.com>
 <Zh_rM04PspfXxlv_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh_rM04PspfXxlv_@smile.fi.intel.com>

On Wed, Apr 17, 2024 at 06:30:59PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 15, 2024 at 06:53:28PM +0800, Zeng Heng wrote:
> > If we fail to allocate propname buffer, we need to drop the reference
> > count we just took. Because the pinctrl_dt_free_maps() includes the
> > droping operation, here we call it directly.
> 
> ...
> 
> >  	for (state = 0; ; state++) {
> >  		/* Retrieve the pinctrl-* property */
> >  		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> > -		if (!propname)
> > -			return -ENOMEM;
> > +		if (!propname) {
> > +			ret = -ENOMEM;
> > +			goto err;
> > +		}
> >  		prop = of_find_property(np, propname, &size);
> >  		kfree(propname);
> >  		if (!prop) {
> >  			if (state == 0) {
> > -				of_node_put(np);
> > -				return -ENODEV;
> > +				ret = -ENODEV;
> > +				goto err;
> 
> Has it been tested? How on earth is this a correct change?
> 
> We iterate over state numbers until we have properties available. This chunk is
> _successful_ exit path, we may not free parsed maps! Am I wrong?

In this path state == 0 so we haven't had a successful iteration yet.

regards,
dan carpenter


