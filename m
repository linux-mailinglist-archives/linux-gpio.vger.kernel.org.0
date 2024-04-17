Return-Path: <linux-gpio+bounces-5626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527B8A8A69
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 19:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 885741C223BE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Apr 2024 17:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A44171671;
	Wed, 17 Apr 2024 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EgDT14Gx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFE171678
	for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713376190; cv=none; b=Uongz1IbpdKXG0398KAXELd10R85A1Ow9ZItt1cU/DLyJ+UCytlg+A1C8JUxQXNbtsTTq3C1bD4QSJaaPoiAAWzP7c6x4Cus88Kk4zplJnbJQmC4nkQYmnD17RELts9CfC5tx3Y65G4Pr6kPwXdLLZt852KDOSWDI+XO5asZ/10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713376190; c=relaxed/simple;
	bh=oxWHekQ5OXBmGUuU+tztCdvzM6eyMNbR/dCgKxXe2Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXWCRSpuxUPZO+FsHJp28EujJCzrsy6RjFLIlsrVl9+JT0ABd9JMMumCf0xzHoYWgtoLkt4qTIgPoF+vaxqijFy0+/OFeOdpJ1LQZT+xmRO07V5sJ4hrk15OYHwH6qEi8/AJnO4CXGX2xatkiiKxbSmQ6JN+1jV11DWQyq8cYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EgDT14Gx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so6070211a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Apr 2024 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713376187; x=1713980987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LRKFqV1snGd5uv5mvNVXvyTr7CU8a2cbaQuP0dc1pLQ=;
        b=EgDT14GxEEX8eQAaexcklsCWo6tkBskvNWp88VtscPZH3Rsd9Cc1MPLgZcyyPtELeP
         k/RYePLxj2J9XfiE9PBrJyXEBUOo2t8z4xQjTo1cCr2TxqRmj3i6jn0nZ3FF2D4KbFN+
         xW6iidiF2Qa4Ye4Fo/zoF5hiXIHhBap1aO8jPeTSxNBgSwKYz5Vsh5L3xyNsOfxOTRUB
         Xa8jQ8U8Y4F53Rlme0J4eNueKPfW7JI8qZegu4YAanpxCNyv0BNS3QfTbl31FCBruFg6
         kRxB8Et2AZFcMduitlwEI8HioBPv/ZZFwmACz2pclG3axXaiDupv6Y59I0CuijLKt6Lr
         cvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713376187; x=1713980987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRKFqV1snGd5uv5mvNVXvyTr7CU8a2cbaQuP0dc1pLQ=;
        b=Ba3h+MlNft58Y/gEjBz0w84ycxHbqfMyKyf2rqOoXXF98vnVH4InQErwxwpLLvpNBk
         CpAUpP+ZoZjZdZrSKHgfJC/XmLjWS9yQDUEdWRAehaQ0tDH2RcAHgErYUvq7bprGBPAu
         Mt0+DMCvcuAH1lWRqHXdaBoBGi0Cc/ZtVhWJBBqpYg/pCSZiMAa+FYy72/z8czBvcnq3
         aIJeT6txyD4gvLEfDdAOFkXxGIiFtiLRBMV2LGb/Yryqf9IVZZM6LSZpVEktm8Ibk9iU
         H4TpszkQqqIb/4Oo42HYF9NY1OlTIdmifU1zWWtIb4LyaDb/4e7Iqx7L3jvOltchI+Ly
         408Q==
X-Forwarded-Encrypted: i=1; AJvYcCXanagmDob61P5b+4+ky7DrvGEHKFiHoA++9Hh7tmH/fEp9NWUvaPuAQDOdvp8W8Q6J1rHBTVNSWDWwS03itzEXfzh5SsOZsmMhZg==
X-Gm-Message-State: AOJu0YyGHzBuhnyCKbYs07PoZxyXmnPPXynFrTQGa3a6kUqNoRtyFxbK
	ItZtfyn0c//KMd2JnaBDOZiY9vWS4J5tVPHtDrmbi/gOjV0ixv4jfBOEaY21kHwfplegaeWqfwa
	c
X-Google-Smtp-Source: AGHT+IGNRrYHORr8DLR8IoMkueik1jDbuO89DRSsICBJMLSRV946km6P3dw7KzJalXO6n1f1siPw+w==
X-Received: by 2002:a17:906:a04b:b0:a51:bc68:d61e with SMTP id bg11-20020a170906a04b00b00a51bc68d61emr160457ejb.30.1713376187064;
        Wed, 17 Apr 2024 10:49:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170906fd8400b00a5252e69c7dsm5792242ejb.160.2024.04.17.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 10:49:46 -0700 (PDT)
Date: Wed, 17 Apr 2024 20:49:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Zeng Heng <zengheng4@huawei.com>, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org, xiexiuqi@huawei.com,
	linux-gpio@vger.kernel.org, weiyongjun1@huawei.com,
	liwei391@huawei.com
Subject: Re: [PATCH] pinctrl: devicetree: fix refcount leak in
 pinctrl_dt_to_map()
Message-ID: <fe83e07f-ca28-4c00-9b1b-7d16c63bad62@moroto.mountain>
References: <20240415105328.3651441-1-zengheng4@huawei.com>
 <Zh_rM04PspfXxlv_@smile.fi.intel.com>
 <d80e09d8-5f35-4865-9fe8-195b86527972@moroto.mountain>
 <ZiAC9zzSWume8063@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiAC9zzSWume8063@smile.fi.intel.com>

On Wed, Apr 17, 2024 at 08:12:23PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 17, 2024 at 06:38:46PM +0300, Dan Carpenter wrote:
> > On Wed, Apr 17, 2024 at 06:30:59PM +0300, Andy Shevchenko wrote:
> > > On Mon, Apr 15, 2024 at 06:53:28PM +0800, Zeng Heng wrote:
> 
> ...
> 
> > > >  	for (state = 0; ; state++) {
> > > >  		/* Retrieve the pinctrl-* property */
> > > >  		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> > > > -		if (!propname)
> > > > -			return -ENOMEM;
> > > > +		if (!propname) {
> > > > +			ret = -ENOMEM;
> > > > +			goto err;
> > > > +		}
> > > >  		prop = of_find_property(np, propname, &size);
> > > >  		kfree(propname);
> > > >  		if (!prop) {
> > > >  			if (state == 0) {
> > > > -				of_node_put(np);
> > > > -				return -ENODEV;
> > > > +				ret = -ENODEV;
> > > > +				goto err;
> > > 
> > > Has it been tested? How on earth is this a correct change?
> > > 
> > > We iterate over state numbers until we have properties available. This chunk is
> > > _successful_ exit path, we may not free parsed maps! Am I wrong?
> > 
> > In this path state == 0 so we haven't had a successful iteration yet.
> 
> Ah, indeed, this is not a status. Okay, makes sense, but calling that free
> function for the purpose of the putting of_node seems an overkill...

Sure, that's one way to look at it, but it's suspicious looking when
there is a direct return which is surrounded by gotos.  As I write this,
I remember that Smatch has a warning for code like that.

Probably we should add a comment to say:

	/* Return -ENODEV if the property 'pinctrl-0' is not present. */

regards,
dan carpenter

