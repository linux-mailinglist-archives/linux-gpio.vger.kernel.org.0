Return-Path: <linux-gpio+bounces-37305-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGDvNPKnD2rCOQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37305-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 02:48:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6BD5AD905
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 02:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79C88302266F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 00:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB25284881;
	Fri, 22 May 2026 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CvpqnL0g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2443282F34
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410804; cv=none; b=Kpib354coA+j01Z2/ppIScnX3xxf6QpGOEigiOE45EMD7zULh2YYs3LNb2PeXxMtRQt5xyxILPAq/VTfYmxtaR/fcj4bEB8VeNmuHyJw/UM+mwBkHlAhTQF6C9a7AVjoXAm6BjhCnYDxRZbif8nt7SUFpz+GXtrfKumHO3a1OHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410804; c=relaxed/simple;
	bh=4x7czOHP5J9Ubq78cdVef2P2g554A5FhbETYuc7w7SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxXB9CixIeSd9eVpCQmGi5Qs4ruJgKJ3D1k662pVi+Uec/+MN9nuJIbIyP/85AOpSLFLhtMbYGDJrrsKJLrDEi8icgLJNNWoCKdZZbZrceDzmiHjBMZwJlMOBaodIq5tTcWFLBsaeUBbBV1QIYQVWqKQE8T8RTQpLewip5h6i9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CvpqnL0g; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4043b27ddeaso4202810fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 17:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779410800; x=1780015600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kf2+EVW5FlP8qaF46nLBgeyzaD5UQgSJrYwMDiOrt4=;
        b=CvpqnL0gCYP7340jWPS+BwonqpLoajboOYlmq3Vg+yPIHLU1asQWQkiV98ra0D0tq0
         8243e9FIScwgFFze1ZSiDSVTSNZPc/f2SKFHVNQMLiNp7ABfat+K65xxEN2yS8K0Zw4n
         59BIxRuyUYflfOTnsYBND2HYdliqXRUZsEQ1tZ7YtLIdIIY9RRbUioLTOXxlIbIC36mp
         H5RDMzANnaCfTDe3Mkm41fqZWZOptQ8M6/BJ7MwczSxQ6phCa1d45xjxaBSmOsAalbKt
         cYeIhzMvVb4hi6ks+QQ+FwP0c4Bv0p3TVAYJ4PbmQw5f6PGzkOKZv3aaf7b2oiZEHPPy
         PwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410800; x=1780015600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kf2+EVW5FlP8qaF46nLBgeyzaD5UQgSJrYwMDiOrt4=;
        b=fTOa2/PoUuBy7xRv4XYV0WESNOBgg17YTjX+tSXl9+OTj5EzFvNivjnV7Gd52AH/5W
         UTwhGP3pfGjVve8FYq64PEYDQ+QqU4QS7AHPMrCs384ssQlwMNDkK2qV2GDRE2Byz6p3
         u587koJ92auFBeuudZ6PCWrMNbCI+cxxbVjZ4ssx5+uyGCJgeSqUbevPPhHxCtgHgl5C
         LdYjNaNGgxRofd92TXZ4uv7wQkZQhRJkCM4qc6stcf/uZB/q7qp7c2WIOZcOMGiyCwVZ
         B94whujE41FVDJ82Sl9yHTswY6gSvxGPXaSjXIRxTzjH5BkxkcwAa/ncG6bNsbUHGGEj
         5FoA==
X-Gm-Message-State: AOJu0Yxk7MtUVE9PMncwNq/0Z+1yf3HkHkQ9CKjvRqSPrr8nL39xM6Ss
	is59def22JiqFR4QnbEd49oCkLCJtiIp+9SBDwRbf8RXcO4Py/e48hYGmpzG/7Yvzm8=
X-Gm-Gg: Acq92OGPNigN4zJZBQv6CbN0MFxG4aST1f5KRQj4lzO+piu5/t0pI0niJmP7OKIG+Di
	zYNWKN5Iqgi+q7lL7ceAuFGX0sy+u6sQ7vnuPrQFS3HdElcX1j7bmh5oCabEseHfrzF9PU7WAOy
	2T8Wjqpf81GfQ7Z9K5mWDVGSiVQdT7+HcqTfKi4gnHHZLpMPcqIuRJ6lMVQ1PxyGVohsmPRAybW
	4TRehJsnv41ybRuwzsLZq1B3vqzdgiLdY7KYYgGNiEKupb70dMlL+hJfBkO3CWXNovcxDpXA1Mm
	Bq2IxvVkBHSFI7JgwTkQe9mj5mPeEBrqOSHZIhkNs4axzQIs6ovDAAhRmLyh4Iqkhx3kLmR2e1Q
	7zoMYrHkK9TLHqYw6fPG6FF7TU8azcRkFtrhPtFlVqR5spqoUenOXZUFThuybr10OqNorcRd57f
	hfSRh7qA0Y3WUuO2fshu55BmZFHIJ4xsJZjS/Pgu748eiWMbObr6nmPBIe/UVAaGzPY5TDzF3KH
	Q==
X-Received: by 2002:a05:6870:c85:b0:43b:4f9c:8916 with SMTP id 586e51a60fabf-43b5aa8f2c8mr961740fac.11.1779410799700;
        Thu, 21 May 2026 17:46:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:569b:86c6:c367:5139? ([2600:8803:e7e4:500:569b:86c6:c367:5139])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b635e373fsm314368fac.8.2026.05.21.17.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 17:46:39 -0700 (PDT)
Message-ID: <cde2abb2-4cc8-4fc9-b34a-0c5d2b95779f@baylibre.com>
Date: Thu, 21 May 2026 19:46:37 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: adnp: use lock guards for the I2C lock
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
 <20250306-gpiochip-set-conversion-v2-1-a76e72e21425@linaro.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250306-gpiochip-set-conversion-v2-1-a76e72e21425@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37305-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: EA6BD5AD905
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/6/25 11:19 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Reduce the code complexity by using automatic lock guards with the I2C
> mutex.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

...

> @@ -248,32 +232,24 @@ static irqreturn_t adnp_irq(int irq, void *data)
>  
>  	for (i = 0; i < num_regs; i++) {
>  		unsigned int base = i << adnp->reg_shift, bit;
> -		u8 changed, level, isr, ier;
> +		u8 changed, level = 0, isr = 0, ier = 0;
>  		unsigned long pending;
>  		int err;
>  
> -		mutex_lock(&adnp->i2c_lock);
> +		scoped_guard(mutex, &adnp->i2c_lock) {
> +			err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
> +			if (err < 0)
> +				continue;

I think this unintentionally changes the flow here. scoped_guard() is a
for loop, so the continue now breaks out of the scoped_guard() rather
than the outer for loop.

>  
> -		err = adnp_read(adnp, GPIO_PLR(adnp) + i, &level);
> -		if (err < 0) {
> -			mutex_unlock(&adnp->i2c_lock);
> -			continue;
> +			err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
> +			if (err < 0)
> +				continue;
> +
> +			err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
> +			if (err < 0)
> +				continue;
>  		}
>  
> -		err = adnp_read(adnp, GPIO_ISR(adnp) + i, &isr);
> -		if (err < 0) {
> -			mutex_unlock(&adnp->i2c_lock);
> -			continue;
> -		}
> -
> -		err = adnp_read(adnp, GPIO_IER(adnp) + i, &ier);
> -		if (err < 0) {
> -			mutex_unlock(&adnp->i2c_lock);
> -			continue;
> -		}
> -
> -		mutex_unlock(&adnp->i2c_lock);
> -
>  		/* determine pins that changed levels */
>  		changed = level ^ adnp->irq_level[i];
>  

