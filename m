Return-Path: <linux-gpio+bounces-11150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4921999163
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 20:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95241282679
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 18:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D761EF0B5;
	Thu, 10 Oct 2024 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCnW6Cyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565B1EC01D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728585202; cv=none; b=u7rGtJLoYz4SbFcGizEsYXk4IXeSFTGDRST+cT36J+adxj5aPE48gAmvbExb35GkYGYV2Y+3eAAMoaNXqIwM5htGFwURLX10+djlBj2jisR9/G8ZFJsItmBbJyHlA8r+FFuaTOOAQRSg9o+TUFv13WZauZ65OUorlqCqzlgey5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728585202; c=relaxed/simple;
	bh=EvpdF4o+eTE353b7lPVCCkBuvlU8ZotwOuPm5RFipmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me9ZUXtMoFAPDlAdb1+GO9abGi2txhp9d8C+GJk6lgC2KEOQhIDANDLwtZ7Nf9Wzw8pFk5IyH8+pSwo1D9TS+lwHnEt87dFnuTjgOQQXQXPV+ResEDURV2UuTXRGq7xFjzyoYaa1rzvhpnQVOgXJqokiB18PRL1Z1uK1E7ZTtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCnW6Cyb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb2c68ea2cso3119101fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728585198; x=1729189998; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S8dhMNKbmDfk6ntzkcElrhnsoyWcoYIA88ZJ+oPBaYU=;
        b=GCnW6Cybrk4gYkSTQpP+UsVRtnAQAct36s61xRT3vcPGzz0sDyK5YEQwMVHHgIB2Tf
         90UNxVfE4S7z+fDuYpUWEvsmJCz7ihST5ArUZGKRxfE1PXZ4D5SQFYT0zzXN2agjy697
         rk2wFfm/yEzbTFziKHcaxX0KdL0s0urqd/aW1wTB6UxkPmuPfOBu0iHghJr/oCFly0QZ
         Faa5VUZ9pXjkmsB4lnwKJEaYWxR/L7MJDND1FS5UukJbOf+KLQJtPeRG5b8ZJA8iuK08
         H1w/AleygqHEJJUbbo5mW/u78401P/nM1p2Qb+uk9DbCd8mNnTIiqfOkc5r1JAMyNDFa
         llXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585198; x=1729189998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8dhMNKbmDfk6ntzkcElrhnsoyWcoYIA88ZJ+oPBaYU=;
        b=YVYpE4X/PZBkN4XsmsclFLTJV19RgCZKNC8AdkGQcka0guRcXh8N8+zi/xM+hS9UlO
         cFu7lVWE+f1GuMIbixqgQ7PNpOPlB6NkYS9z4W7Cb0mlHZ7rWeOOpr+iTQH2+fMSJ5Lb
         hkGQIxesGqGXuz+HCIh24nWW5ONWLruLNWQu/PTRO26reXGviulC2oKSctYbotr9RFvL
         o3jYO4VkVCSaQSDRpBDTQrvYYRb9YgeOh0kVtdGJ9cMNChsAyiXh3nwlvU1Sqec8O1cp
         YUKwKQJ/5QhtWzBCeetYrxHkvP6ZBGVBbERk1IPry44ZtaMi82p8BXqKXOB6FdT5zbO3
         /yKA==
X-Forwarded-Encrypted: i=1; AJvYcCVYUBph8IYE/ME474PdKYpxNgiwhBvnZd1lUOKR0xTSXkKcrbp6DSH7T3aJTvqASyCwsL28JwN6G0dB@vger.kernel.org
X-Gm-Message-State: AOJu0Yydg1Nr59lVwV8xvbfE3k9/9rv+3MJthfgcLIKVLOhAShz8SVb+
	PI0LZNvT3udCSdCrEjoyGHhketvumv6G1rMVB0UgOG7dkjtU5uWybpyO5sEaL4E=
X-Google-Smtp-Source: AGHT+IE/GyWzYEm5bY3Ai4NUr1mnH78AdtfAV+UVt1nP9Ymb2ORVwrT+5GQEc2yWbqYCTFtLYXtlqQ==
X-Received: by 2002:a2e:4c1a:0:b0:2f7:52c5:b75 with SMTP id 38308e7fff4ca-2fb1873881amr37026721fa.15.1728585198417;
        Thu, 10 Oct 2024 11:33:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748cddasm55065085e9.40.2024.10.10.11.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:33:18 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:33:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in
 cv1800_pctrl_dt_node_to_map()
Message-ID: <aac19faa-fd95-4c6a-9a41-e4f03f8e1733@stanley.mountain>
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
 <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>

On Thu, Oct 10, 2024 at 07:17:19PM +0200, Christophe JAILLET wrote:
> Le 10/10/2024 à 13:18, Harshit Mogalapalli a écrit :
> > 'map' is allocated using devm_* which takes care of freeing the allocated
> > data, but in error paths there is a call to pinctrl_utils_free_map()
> > which also does kfree(map) which leads to a double free.
> > 
> > Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.
> > 
> > Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
> > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > ---
> > This is based on static analysis with smatch, only compile tested.
> > ---
> >   drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> > index d18fc5aa84f7..57f2674e75d6 100644
> > --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> > +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> > @@ -221,7 +221,7 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> >   	if (!grpnames)
> >   		return -ENOMEM;
> > -	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
> > +	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
> >   	if (!map)
> >   		return -ENOMEM;
> 
> Hi,
> 
> drivers/pinctrl/nuvoton/pinctrl-ma35.c seems to have the same issue.
> 

Yep.  That one is too complicated for Smatch to find.  In this case, the kfree()
happened in the cleanup so it was in the same function.

regards,
dan carpenter

