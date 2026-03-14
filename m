Return-Path: <linux-gpio+bounces-33410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEOSNfHEtGklswAAu9opvQ
	(envelope-from <linux-gpio+bounces-33410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 03:16:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D9128B5ED
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 03:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052433034333
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 02:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DCC178372;
	Sat, 14 Mar 2026 02:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LshIk6eO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DD1F5EA
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773454575; cv=none; b=CHMGLcP+IamvatxjeLMVp5qqlDuwV103A2BwAvc81bJ8S+xXpKtx07yjqFMWGPDe9ANe8N+CZyegFzqZ5lIDRwEgzEgqOPMkf/fMdHvF03tA/1G/fGKYhBQtGyeO15GeNcuN6W/4wloZ7pnaX1kXB4zbuIX9AZs28OFuB9UiEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773454575; c=relaxed/simple;
	bh=1nyryU2zl6X0XnF7B8eeA+G9Ux61Cr9oC+edsdj2Vfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxoNVPJZ7RiTJlOxyW/rPz7y2o+5cP+cUKh3EEzznpSULajSstKVCORyaRemj3Tn/Kzu5fKvQSSUiCB7Czh1jbvjAjBcTrReERI4buTmi9nfqdf+wIdYaHEN1rCksVz4ZH4joOikPiAjnnQyu5keSVDzSs4YyE7CI+vn3uYRVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LshIk6eO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so1558900a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 19:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773454573; x=1774059373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fi0JAJ6LRCeMZWVEWBBt/FW6Hmc36AN0XV/03wo1PbI=;
        b=LshIk6eO6/pklWnXGXMfCLnJMkroyfiF0uyTKbFFG3f8EybHXT1thxqVER59aB7aM0
         p28DTsNQYq+k7X5B0AVu9o83WWHxBrpRRRVEudyEuzcLLzYl32ulntRGVc/MzZIEg5Sc
         hUVgyijK6RFvIJ+t4ygrmp3qhZcG86ZAlDs0/0Cd9AqKpc/KXBBVLrdTiTQ7s9Tx0cjC
         EnDu8eKdQ7RJVM+6+na7OYxQEWYCZKLx6fRXAg+JKtz3I9EJ91HcMsu7IRC8s3O47kKl
         CdUnt7biyMxG6xB4eHMeOBQsnf18BTT6kNI3auFhgw+ZUGaabKqvMIwKdli1lk0pzKXs
         bz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773454573; x=1774059373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi0JAJ6LRCeMZWVEWBBt/FW6Hmc36AN0XV/03wo1PbI=;
        b=cPAyIFwE+7c9adjKI/vJWjKUrWiA7OCK4GvtM2YnPLC1WdB+DFZzbizljROljJM4zA
         uIeAJiz8t5X5NnEc9wrK9vp94uVW0hFdfLoDGBtmnTvthLeEqsTkJR7olx/+z3WOrjNQ
         GH4vSwmQ7RjDG+094XPDh+E7zshrFpGAWVgEbVL6DNJCFQ9j+JjpH6WcqDvb7rsZInzp
         18aiWHmst73o9suV6rX7mD0o3tsch0ESuoeOsoyhP0c+RNVrahvwU27dGgN+sCmB50lp
         RrhlLJ8WYKY43kTV9UdirpTy6SwoHs3pEOaKrki/2Fxo9Bk7zdmRqoYDfe+Alts4s/PA
         J3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXnLk7rkiBl5t6NiUEqkVAwygzR8HnElrOL5LtEnBppw85Cbx3NUOGKM3pFZgv1g34q2zEkZp6p+Cah@vger.kernel.org
X-Gm-Message-State: AOJu0YyafJgLVv0pKolGaaTYNvOQJfi3O2/Evf4DGp8s1dGQtUjkSXHw
	X5TCiawzmQDNHxfTMtdE2kVVYDKEnwJu/4ueahoyebxq2BBKoxt8GBg2
X-Gm-Gg: ATEYQzyLpe5Wj+2MBiJJB2WFmp6LAR0Oybcp8Vc1c0kHvTBYuLkX+apHWUv9rNxGmPf
	PogjCnUabGGPWMUw3Ls+iF9Oyv4HGKNJIfBytZY/lSXvQ7nd8IVdCEnZd3vN4rlsfQnCxtWAnSd
	tPGlwP7fu0KJoJybA3Lr+KibqGNQs/X4aqmVAYHg1gtx3ZmxqN6M6WowjDYD/jlUmSEPvIC8/3r
	nLd9j1BMns361/Zz/A7VEic/QIdC2HzM3QijzE5H3J9mqn0pzPT9Icr3/sdGKKWOVI+vOAOzgMg
	w+wwuarVgp4Yu7S0fGW6V2j141daXOdAq3ucsukzBnRbGBT8LDoVsVCKp76xe/50vLPRFUjpALL
	7q2c62tk3ddfSQbo/OZ1O4Fk7F0rfplfPqMY/z2gjGlNlei9b75vzb7ZLXa34V4XXfKWoQ4LXfI
	kSQDJhzgyiwbLZqsDS9SDZM6nUqcSupPz0coW5ed8U
X-Received: by 2002:a17:90a:e7d1:b0:359:fecd:1cd3 with SMTP id 98e67ed59e1d1-35a2205551fmr4536206a91.23.1773454573280;
        Fri, 13 Mar 2026 19:16:13 -0700 (PDT)
Received: from rigel (121-44-73-195.tpgi.com.au. [121.44.73.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a245b6fbdsm1232518a91.11.2026.03.13.19.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:16:12 -0700 (PDT)
Date: Sat, 14 Mar 2026 10:16:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Do not enable the v1 uAPI by default
Message-ID: <20260314021607.GA4176@rigel>
References: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33410-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 59D9128B5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:07:50AM +0100, Linus Walleij wrote:
> It's been five years since we introduced the v2 uAPI and
> the major consumer libgpiod is at v2.2.3.
> 
> Let's discourage the old ABI.
> 

Agreed - I was thinking the same thing myself.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes in v2:
> - Rebase on v7.0-rc1
> - Do not explicitly state "default n", n is the default.
> - Drop RFC, I waited like two years+
> - Link to v1: https://lore.kernel.org/r/20231104-no-y-uapi1-default-v1-1-f60d318b6fbe@linaro.org
> ---
>  drivers/gpio/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..d574e5fb851d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -95,7 +95,6 @@ config GPIO_CDEV
>  
>  config GPIO_CDEV_V1
>  	bool "Support GPIO ABI Version 1"
> -	default y
>  	depends on GPIO_CDEV
>  	help
>  	  Say Y here to support version 1 of the GPIO CDEV ABI.
> @@ -103,8 +102,6 @@ config GPIO_CDEV_V1
>  	  This ABI version is deprecated.
>  	  Please use the latest ABI for new developments.
>  
> -	  If unsure, say Y.
> -
>  config GPIO_GENERIC
>  	depends on HAS_IOMEM # Only for IOMEM drivers
>  	tristate
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20231103-no-y-uapi1-default-4204e86c04a3
> 
> Best regards,
> -- 
> Linus Walleij <linusw@kernel.org>
> 

