Return-Path: <linux-gpio+bounces-13302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AB9DA060
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 02:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ED3F284D7E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 01:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF6FC8CE;
	Wed, 27 Nov 2024 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE5ZCxuD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081D22083;
	Wed, 27 Nov 2024 01:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671384; cv=none; b=kmcihIR+cusOVvm20iS7m/GcesQPJ16Bf0yplC68J/U+CzcAiPKvKHhOlId0mLcErG5mECx4cRfRJcp/bamwJ0peThSSd/If3KrLCalLy7625i4Q3MhaR1DLU2Fhln6oQwFk2DY5/mtIPKxXNw7pIsDm4X3rbot+TWPllrHnNXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671384; c=relaxed/simple;
	bh=Ld+iBctaZhQZ1XJv7+nYbPrD41lUjhTx3xIscAge+N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COWosOufu/K2hfAfnNcAv96JmYEH/PIihemcSYUpm5pa1Q/U3XbUajGtphHQaGdr3t5eZNBM9M8SzDeE5KrI6tY82pU892X61k8Hp4UhRDOV6q8wtE+DD3HfO2R3JWU2bWdBIS3ocfdRUYj3v9ag8ZhPYXDAiVDOhQSXcZYkXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE5ZCxuD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7250844b0ecso2903664b3a.1;
        Tue, 26 Nov 2024 17:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732671382; x=1733276182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/wo1GFpZhpZj5SY2kROU72Fv/RanMmDtkwLviczBxQ=;
        b=OE5ZCxuDshpsydl4eoAVB3zKq3wWmoo6Fe5Ix1c7h/gfX45pdiW2zf3ICt7ds0+D1M
         RLoJXgiiYFlKZcrRmG68ME1v3RUC3mIH7+gyzLI0xR6BHz/HlM7fpYYNAv7QPdDLINDs
         IxMdLzEVTmJ/PHe2szbjnZ12jb6lR8TEDe1DxBEYkroe+BvFeqejzWv1Jg3Tf1TKDHY4
         wXlYXvcJYM/S2FSoLL29X5rXAwcycaEjOXRSOrwKQphWYreZ/xJkDWJBVuD+trCkrrx4
         IPtm06gOGHuVI7ksHL5fhzjmrRihguVbjYOeJR4G5TfDrwLgxI1oXce6JbnPvRhpklmu
         TrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671382; x=1733276182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/wo1GFpZhpZj5SY2kROU72Fv/RanMmDtkwLviczBxQ=;
        b=LhgD8ITv+X2odn4hubMuLjP/zhIZ3UZiW1+2A2qibwsyC3P2Q82R8s4FfogjDoimsm
         U7llhyl2LbMcXlnzeHOUiLJyjfiQ+xdhVi9ErLcAZasBwdPU3WUohja/C2qqz6LvmMMR
         ZJa7B7zRfqOQlGXWI6WEv7Sy81dHC5nluiITw4sd03rWj3uBXGUaSUVfFneU1GtH9v2O
         nceaJHcpcNJ6nC4KIij8AuNeEEafOY8KCLi0AYXNNJaqX6qEYVWMIBDG24i+bzsdkEbT
         fkXigplx+NM+V1gWDjKjfnBEpIpUwx6pPXxt3R4p3TtKgYHSR/GWVz5ZYiRA/Ohnw6nt
         EweQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZCfLTGaSoLwqJ12A+W3QWrGeoSrP5qvFtInWOXR/G8u+Bg1waH4ahiDF3znfZtMIOUnfg6U1Dr+K0V/o@vger.kernel.org, AJvYcCUiYxETeTKJsPetWTx5R5CtbNfz42zS50SFEHVxLXvpl6Hlz/t+sQgJmhQm2zgx63RmpBUckZ+ZV6CoJcw=@vger.kernel.org, AJvYcCW/7ATtQQMO2TIs42afKA+1PH4EZMxd8PPJVYKvxRLtQMMq/hAEz/GkFUy/FQZfZzX9XgCMnOipe8Ya+FA=@vger.kernel.org, AJvYcCXQRR2A57c0+cP7+4cbxe4s1EiJSubSvOEB9GmEfvqPfqX2IqXidmF4ozM/9UykrdNjS2hL052fllna@vger.kernel.org
X-Gm-Message-State: AOJu0Yzma6gN05kleTrTAIEeZfTSkNIEZwWbfT2iKtoefPSJtXg0n/ML
	x7clmNqEIsyruS4kv1sHOKr+5MI4d3b2Aji9CRyrbHf0ekjac82I
X-Gm-Gg: ASbGncuxaUqCQ8TPRNFdnnejkb3eRNNbZ+fQRYfCezsL6wCw2p7CLrRGcs0YWLHYtGy
	7H5x+qLTBfmOZXTZY7U70jxHsuTlUWJlER0m28hHN+bKxZQ8IHfy0O2Ac89xf/I4u+SLpNKPY4q
	+4DXLnV2Assrw95MZyFEJQIoavMrCJyfpIdpgPfC6KXy8ZxUePJqPi1R2VRkVcr5m8Fr9Lo0G6L
	2VXrelLNPIXu8ihwccHwrbL7c9sXN+/P68hmFd9uZtG8qrVoX8=
X-Google-Smtp-Source: AGHT+IH8a/Z+Yh2FRduXQIzqqJFFIoxKRTfcIRS0Dt/p+a68GxeKkGxlzcOq8zqE673e4rr04DF2YA==
X-Received: by 2002:a05:6a00:4392:b0:725:20e0:e777 with SMTP id d2e1a72fcca58-7253005b83cmr2017627b3a.13.1732671382233;
        Tue, 26 Nov 2024 17:36:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554fe1sm9090206b3a.137.2024.11.26.17.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:36:21 -0800 (PST)
Date: Tue, 26 Nov 2024 17:36:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/6] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0Z3kng9q2JfR6JU@google.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <20241126172240.6044-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172240.6044-2-raag.jadav@intel.com>

On Tue, Nov 26, 2024 at 10:52:35PM +0530, Raag Jadav wrote:
> Introduce '_array' variant of devm_kmemdup() which is more robust and
> consistent with alloc family of helpers.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Thank you for making the changes.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  include/linux/device.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index b4bde8d22697..c2032aab1586 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -358,6 +358,11 @@ char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
>  const char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp);
>  void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
>  	__realloc_size(3);
> +static inline void *devm_kmemdup_array(struct device *dev, const void *src,
> +				       size_t n, size_t size, gfp_t flags)
> +{
> +	return devm_kmemdup(dev, src, size_mul(size, n), flags);
> +}
>  
>  unsigned long devm_get_free_pages(struct device *dev,
>  				  gfp_t gfp_mask, unsigned int order);
> -- 
> 2.35.3
> 

-- 
Dmitry

