Return-Path: <linux-gpio+bounces-13223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB79D6CD9
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 08:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB80CB212A0
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 07:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0F4161320;
	Sun, 24 Nov 2024 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNjvCB77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85079847C;
	Sun, 24 Nov 2024 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732431823; cv=none; b=lM23r6vW+wzFT9ZerXodmBqaKjW16uRez4Y3Tl20aFklcI28L9QHOgRT3xiwHnCIRhCW9GxqxPFiJnlV2XNHPHqsr7wLv1mliEQR7CPRkotRmDtDt4lXwdt4LQX2GlmitKpMMGcun0UREqf0tRCa6TIWBoQRt8pldMkOT1rlPOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732431823; c=relaxed/simple;
	bh=U6Tlt3BxSKeFW+wA+3+1tADVS8GO2VfRzO09ZArFa+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrRAZXksCenBcRxINcDjAp3WT/tbfqHHLpPicaN8tkgvgIq0ZsaiT1t9h1jSU0YgYf4RcDzvqNGM+GfTVr/Nw/8I8QId27bLhgV5JoFqV+b0gIfsRdXdBJYMYoFMe44HHGQov2W8g0DTHy3qFXhkNR5hfWZcIIu4nwla47cuNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNjvCB77; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso2872241b3a.3;
        Sat, 23 Nov 2024 23:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732431820; x=1733036620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+qSEIb/xpvTf99gUqbHHSva1XFV5L53/BpJ4Wq+3k8=;
        b=hNjvCB77DZVSSoJkwmJVmvUxttz4Yb1xDyS4nWFSXwW9WMwqfEQY+typrdgyEKrtfx
         M5lqzdkpkHAGjixuX6BU/2JHYB/01vVpRat0F4sAi6TIVovSw1TfJOPD3ygFn2ceBbaM
         d2xnCX70zFQVGUzLvzhWdjSw+xkcCu6k09WQ+1ViAimAYoBrhrMekMzSEWDMhGMiIwSB
         spJ1w5iZZ8uAoQPF43YsLAm4S22gsfTiMHVH4lmQ9BkMlSpHyVOirz1420UviMAZRLBC
         btL6x222nSxqLe37IB8qfei1YaPBj/DJ8wGqxbJ0cFMpvK+GyVjNgbCb1wvbxnVUX2J/
         RloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732431820; x=1733036620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+qSEIb/xpvTf99gUqbHHSva1XFV5L53/BpJ4Wq+3k8=;
        b=Z26EflRlzSZn/UPn0UUhxp5q95uG9OGxFxdI8vGwHO2k1hcFa8nOJAE5PxAhFhftQz
         VxC5JHEq8d6xxeFRDV1rWPNLw6lJevsH0euVhwATYnmrcupMUfd25MDckFELsDIJkzto
         /qFZBrkvNNqlmBCng0BNfmagbejdJmVOJ7O8oPl9sg5acXkSgTlZzBLLZ5kPmKSpDnDc
         mcmZ+CzwVJQOyRkjFtPboKw3RJJ6e+Gi/ows/tIXCAVUl6mNfJRUJltn8G5Qzo1mHzv6
         /GaF+fmJb7yqLNHZyje84PV/3xoswKPBJJieVw5T5oSRvfZs8MQk7/tGeR/m08HNCJhD
         iqCA==
X-Forwarded-Encrypted: i=1; AJvYcCUSyh1ZZnzNJbiGeeehtuFpdlQudc6xXF+RlyHGu0mexBog0hG3QfVo8mSV/4K+mIkgg12dSqHGLdOHjrc=@vger.kernel.org, AJvYcCUUqyVwMSnyOkRwme0PGpU73MS55pphDh2EAU03GjpbtljSf18qYBB3vmfEbQZg7atlJYuvHmhr9sSx@vger.kernel.org, AJvYcCUxs8GwQJTY0we4xbCtvtAlauW8YwF2jaeZ9ZwAyNjMozMBXj945ybFO6AB7MA35afrOc/Dr4FojLg1UUj2@vger.kernel.org, AJvYcCXFQM4FACt3c8k6xtDfXlcxcpUqKZIl2yVV7jOzUdYpAcr7YhSf9GQH8hPhCvcJRnhlC2uyKg7S7U7FHTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhNRPdFxMvo287PdSkf8dFrjKrS5//Sh00x9fSCdUlTncYfs1B
	J3DNuJhWdt+JBCA18XybdzQqcv7xHEqHQgQWW4N7jBmXE4JlePah
X-Gm-Gg: ASbGncsNW2MoZW3lS4E29bUvdU6c6LqjXJHlulElgZOPHmJ0+0mTBrt4qEPxJoXU76Q
	m2OEpSp/9bCVp1rdWV9gQPAOGklW7CHlrLX8B25M73DhI3iIJu60cCyWQvMTcrvJ337p2JIkZIJ
	nsg9Gr1Yr9b8SK8RT6YWyoM+KMD2/TZ/7Jix+8lRD8Cbo0adtNWZYOVEdZQ82JODFtq5Vx4dOCj
	G/5qHi/OXfX5a5syWbokgEpMeIxNgLdb+RVDRJWd9nQgNs5eXjuVcD1vrc=
X-Google-Smtp-Source: AGHT+IH7TOHKbIPRJvFIiTj3hN04KXsPhYsJKG8MVBvbqDQfAuzhLM5JaKfeqy4Gz+rA+jUW0lh64g==
X-Received: by 2002:a17:90b:4b4f:b0:2ea:4a6b:79d1 with SMTP id 98e67ed59e1d1-2eb0e2303efmr11390699a91.11.1732431820152;
        Sat, 23 Nov 2024 23:03:40 -0800 (PST)
Received: from google.com ([2601:647:5e00:4acd:8a2a:c45a:2a1f:28b0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0d048c41sm4837160a91.41.2024.11.23.23.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 23:03:39 -0800 (PST)
Date: Sun, 24 Nov 2024 07:03:36 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0LPyMed-4a8cajD@google.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123200527.7830-2-raag.jadav@intel.com>

Hi Raag,

On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:
> Introduce '_array' variant of devm_kmemdup() for the users which lack
> multiplication overflow check.

I am not sure that this new helper is needed. Unlike allocators for
brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
of already existing object, which is supposed to be a valid object and
therefore will have a reasonable size. So there should be no chance for
hitting this overflow unless the caller is completely confused and calls
devm_kmemdup() with random arguments (in which case all bets are off).

> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  include/linux/device.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index b4bde8d22697..c31f48d0dde0 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -358,6 +358,16 @@ char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
>  const char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp);
>  void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
>  	__realloc_size(3);
> +static inline void *devm_kmemdup_array(struct device *dev, const void *src,
> +				       size_t n, size_t size, gfp_t flags)
> +{
> +	size_t bytes;
> +
> +	if (unlikely(check_mul_overflow(n, size, &bytes)))
> +		return NULL;
> +
> +	return devm_kmemdup(dev, src, bytes, flags);
> +}
>  
>  unsigned long devm_get_free_pages(struct device *dev,
>  				  gfp_t gfp_mask, unsigned int order);
> -- 
> 2.35.3
> 

Thanks.

-- 
Dmitry

