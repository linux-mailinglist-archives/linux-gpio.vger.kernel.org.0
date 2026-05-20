Return-Path: <linux-gpio+bounces-37195-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBDjAcqdDWpO0AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37195-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:40:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DEA58CC4E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B2783304674
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CBA3DB62F;
	Wed, 20 May 2026 11:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsSpUs7w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1A3DB33B
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276502; cv=none; b=nkzQsEYvTu9TI9azbT1RgvrkiPhgy15qvZs0aP466SSpLHR8lh0mMwKCIOpUyqno9HhhRo6derv1LO0dWAcJjwxCuRdF1wVlWp3GoXI/kICgTxo/47K7bItePv6uokiunOOSQ7kBpHEAzfnvTb+lDOhMmSwYMZTHrc4saaE5W3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276502; c=relaxed/simple;
	bh=lSODUcihMPhasEzGYqEilcoX1z3BGVXfwHegaMftWQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsKZYP/k5JUb9Bq/sqsZHo+3LA0gC/Fut6rYjsP1vZvMA8J9KsMSS3oxePjB4UyKch2dSOyL94UlAsFZ7mmckeu9HDbcBaQ0cN6+9Vs2CxaH3o4nhdtjEVCZi9I47Ljd1519DIKuNZxgpkC+iFtNHoGNLnd6Z3/N9R2kezy1lnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsSpUs7w; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c7980c060cfso2093911a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276501; x=1779881301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGlAMC0+vUyGnnTWD5G/AeIQvVwPR0Xnk62RWklWM+o=;
        b=bsSpUs7wvd/vutdN6d4WtYoGEymZXrI2syV7cSwqb8Pvs0dOSiuaFiWhM1KTqBPUTf
         SIVrn3GhHOped7ajDUn3WkMV0Kami7MMuOZUzB88QN0rQ9e4S2T5qXoZa+iaFJgI3XLC
         wPnHalz0j+QwGmsWs33csK0LTxVhRiC2K4C9BcJsa1s6XAW2kcHSRcvY6VoTK6ymA5kQ
         lwvBi418eY3UN+9XGzSiRxsbPcrU8eEtr7UgEDaqnwO6cL3bqoJekFvNG6H6RNCPcrK7
         oPryB+HFQ2YhRqt0CNrFNFtFTOBuA4NzCW2s33+GdvYTP1gN1/qdX2P0bhUf1BqA/49W
         zCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276501; x=1779881301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGlAMC0+vUyGnnTWD5G/AeIQvVwPR0Xnk62RWklWM+o=;
        b=lRYG++h4Z+e/9IGAkgvSdPQ2T4JT8o5zzhxmkBcSnF8LPc9To8UCoZbJJvLrXonFqk
         HlQ1Mmka8QtgPXFFqZtgUeizy0VgOOVYvVfIUYJid9uscJR6E5TGG3/h1JxJCtMN4kZ2
         TFdA+xFdUDr8ypBO+1y/qONGcXSVarjAwHYNzjK0qEhijQ/+Ar+OKUbf0TxNTXF/PLZo
         hvjW/fpMwkTDXbqVHxsz23Mvyg/UO48M5Mjg2nsYk86Vjq0Bq8IC9S6v/FrwW4RkxWZd
         lDn0ayXaG1ORmQK/PJEp22E9V/a6RzmiI74q63hbkU2iUG+30aGkTsBgl/rXVfnbwuTk
         0UMA==
X-Forwarded-Encrypted: i=1; AFNElJ8hln02pTwpBioIYL6N810aPjzjpFfwEImoZ4sSkwlqCu+Ac15R7h/dJG77d9SYnbjg27PU4XspjwT3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw54GGMRhvYXMMsut4n4SnGB1KlgR6MVNFIuvvzMqpiX6e6Kmu
	xFFFo/hRQ5TpkReQsGMvjSYOW3FRMSVlKyfjh+w3coTLDtishPuHu4mY
X-Gm-Gg: Acq92OGniayIRCcD5UAWOD4jdMtgOlIGiyy7jLQikCIvG/TGIh292z0VZY2fMY4AcUZ
	FFRzxSiHMqwFk9jn4hjDjYPqS/0sdqosEJMzkCL8PtR2pxUaeb10J/2A22Xe64XIEy1hTdomTuk
	30Rrr4OybXYvF5gDfcMS8mezcyAk0moBmBi+f1gnZ2jGK2wuNOdfd7HI81CRalcBqT8Az422ofT
	isfHT8NZJqItSme3WnTNFbXq3+ibyODWgDW4Sor2lXeKCKXncbf2qG+mry5BJsXLwMuEiEDrPaW
	zNZ2bsbMbTI58nkEC9A/OMN3yCtAc+DJlSPoIXAdGNq9vFTMuiOeK+vKqcfXon1qtDnh+eyJLcO
	Fx8aeXZIRnBv8kugkvc5W3DLxzojaxmLnijt6PJsOlD8ERD5gFtbDCZZpyvyzQ0rwQpt3CAjJNN
	YxtJ7vyGrJsZJlSrYexMev5wLZhiO31nz8SjN1qau5ezjP9lVt6zt7Qg==
X-Received: by 2002:a05:6a20:c31b:b0:3b2:924f:41e0 with SMTP id adf61e73a8af0-3b2924f447emr10563301637.3.1779276500695;
        Wed, 20 May 2026 04:28:20 -0700 (PDT)
Received: from rigel (106-68-217-148.tpgi.com.au. [106.68.217.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff4easm18504863a12.18.2026.05.20.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:28:19 -0700 (PDT)
Date: Wed, 20 May 2026 19:28:06 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: cdev: check if uAPI v2 config attributes are
 correctly zeroed
Message-ID: <20260520112806.GA69947@rigel>
References: <20260520-gpio-cdev-attr-padding-check-v2-1-0010daf8059f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-gpio-cdev-attr-padding-check-v2-1-0010daf8059f@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37195-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: 62DEA58CC4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:42:10AM +0200, Bartosz Golaszewski wrote:
> We check the padding of other uAPI v2 structures but not that of line
> config attributes. For used attributes: check if their padding is
> zeroed, for unused: check if the entire structure is zeroed.
> 
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Make checking even stricter: check if padding is zeroed for used
>   attributes, for unused ones: check if the entire struct is zeroed
> - Link to v1: https://patch.msgid.link/20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com
> ---
>  drivers/gpio/gpiolib-cdev.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f36b7c06996d70b2286edbd181899e4c572b9086..edbcc86e4b26f88036ed12c13055bb2c371fb6a3 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1194,6 +1194,15 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
>  		return -EINVAL;
>  
> +	for (i = 0; i < lc->num_attrs; i++) {
> +		if (lc->attrs[i].attr.padding != 0)
> +			return -EINVAL;
> +	}
> +

That works for me - the explict test against 0 makes the intent as clear
as a mem_is_zero() call. For me anyway.


> +	if (!mem_is_zero(&lc->attrs[i],
> +			 (GPIO_V2_LINE_NUM_ATTRS_MAX - lc->num_attrs) * sizeof(*lc->attrs)))
> +		return -EINVAL;
> +

Dislike the use of i here.
lc->num_attrs would remove the implicit dependency on the preceeding loop.

I'm also uncomfortable with the lc->num_attrs == GPIO_V2_LINE_NUM_ATTRS_MAX
case as the pointer is out of range.  The size is 0 so it probably wont get
dereferenced, but just passing it around makes my skin crawl.
Perhaps put the size in a var and only call mem_is_zero() if size > 0?

Cheers,
Kent.

