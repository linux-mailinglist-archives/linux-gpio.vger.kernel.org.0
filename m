Return-Path: <linux-gpio+bounces-37252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILmXEZbJDmoACQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:00:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF75A1B39
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 11:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F40C6302E3B6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 09:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE69366561;
	Thu, 21 May 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqArCoFx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9190332EA2
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353995; cv=none; b=r9AyGDTrUASaEiV9MKTpKWuZAciWCry8EMEoeSsilmGweFk6WoZ+4aNpmwpkYHHS1qKsNvz0lvYgw7fxEm0NkedENm0xsRFhULxZqwzbtkAcoFOfYHJwM27xASgEotphSwTvCMK+rddChr9vDhvR6ABYpR4IwLPJJkf0M1v+lxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353995; c=relaxed/simple;
	bh=H38W0lBiSTIoOs/MoWLzTyAA7/6JpvyVmCV9VrUUq+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ7Oh/hoVdCu5bPG0+OcQJCLkMBFOypV/tkYpL82EsAl1vxKTh5ZAbECOl2uXTwRNjUM5qiAoQxuFP8S6EliNTQPHHjgNH/SDIjJWNO+F+vVsyg8jZI3HblwgiCYDj4iDFZvqodIXxEHHseMu+5P0XbtfmL22vcabg94RJAJmzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqArCoFx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-841513664bbso177956b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779353992; x=1779958792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrCn2ADSJjKIeaFMxDpe/OlWW/Wegrep/94pOz1YcEE=;
        b=OqArCoFxMFXY356v4hQEIG3rCcgvjnX/rgIWAxlmgt/AvbJHe12DbM9BOrhqDYY+5K
         8RfaiaW7utlpw5LTOi/y6jG3yHu0iI2HxNJZvRpPAuj7cYfj7Z1S+RkXvzlPYEhjvvYq
         5LLTBSLN9na1gf5CZe9A17CWMeVzIpuVv6Dggqsltz/qEAIYk7ncftpHxLG0ZdD8baA2
         JVChwIjP/QbntOBGjrBVLaNcThHn3aT+5bLYI2yePrdAW7kkq4CumbEbVB6UxWudbBv8
         M9Ye947APfpf9wDUnJIjlEukunnR4MFTCRvxddpkpLevbGhZyZDdilw8RHepJz350I/+
         /7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353992; x=1779958792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrCn2ADSJjKIeaFMxDpe/OlWW/Wegrep/94pOz1YcEE=;
        b=lWRuYqCbCi1tqWhdMBeJBRJ1xF+Zp0y+Y4gTesMM/LeXb3tV46rTTWxOhYOmzNoROG
         oQQkZ1osN1D5UaKD6d3gb/CLEcjzF6cenFzhGnPub1bNMQP4Okf8ZzZvvOM3rQi6CXcA
         L3IEPEXTXkde1vvg6hq11urQL9zSmXwXOQfdAliXqoB+fRF7Ow47Fdv9PNhCZ8bk/Kk7
         Spv6Vso93Wm/ZHA2DuHEWNcY2KQoJBt/ZZQaf8bxAQZ7IooVzgk6Ehh4xEHDIJklwCPd
         3dvAyy4STVeNPRovugcUSErhg+MiXZO2YMw6p4Ssx/DcMNsZr2Pc/3E33eTJUm0orRC6
         nXrA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZiE5Y5XniAO+Wlzb3qEdkI8BE8hjZP9BaF5tRQHxNDIQ5cau5UA6KgsQRBy/rNSfH0R20LwnI0qHw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+sajtWIWDlr533IzSQenNGLjl+yYCbe5cH05IjEXYFnzSe89
	U7WsKvtXVWcO+tOPqGpK5n+LOdtt3LuKrrD5AYWtBOOjSBbIR1u4ffZA
X-Gm-Gg: Acq92OFCl+YDnjEnJVpHkNKIKEjF6ZOYmWzrwH+m8d1aioKlGeAs0+N3Ksi9bb9G9y1
	fwe9gS/xQL5uwkUXQnSkCQl7VTr+fN+uhYqiebYV0DDMs4mUVHSWkbvOxqBUuMni4qCykPXMF0w
	73aGtvse91+Nei/iKrWp7cNXtq4pjWHKmd3x2Q9FhQSC5aMmV45OOoVCTP7fYK3Ms9V7fIQfbjp
	YF+8VZfgbvVbTS+UCI85Rx4hmYoTxWKOljMAual9Y9y28eqtDPS+esI9SPm02+DpE5MctQ8FV0y
	gezT+ilgO9bvhgqZxzrO2E7W2ERrxuLsO0zMfwDSSutiDef9d2awJbDNsNqa1+gjkxOwX6xUwMk
	VBgekR5Lo8owH1fvZdgZQyRlitWE9f5jTFWo8IPtTn9oFQG2pfnrSPQFI0oz/xnearinZXhck5k
	JO2WJovzE9TzXgz3avIx3d+fBkFzHue0cl/gYhDVBp3eo=
X-Received: by 2002:a05:6a00:240e:b0:82f:3017:6157 with SMTP id d2e1a72fcca58-8414b3e1583mr1782013b3a.7.1779353991933;
        Thu, 21 May 2026 01:59:51 -0700 (PDT)
Received: from rigel (106-68-217-148.tpgi.com.au. [106.68.217.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e02781sm720267b3a.32.2026.05.21.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:59:50 -0700 (PDT)
Date: Thu, 21 May 2026 16:59:45 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: cdev: check if uAPI v2 config attributes are
 correctly zeroed
Message-ID: <20260521085945.GA59870@rigel>
References: <20260521-gpio-cdev-attr-padding-check-v3-1-ec3bcbe2e358@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-gpio-cdev-attr-padding-check-v3-1-ec3bcbe2e358@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37252-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: DFCF75A1B39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:42:16AM +0200, Bartosz Golaszewski wrote:
> We check the padding of other uAPI v2 structures but not that of line
> config attributes. For used attributes: check if their padding is
> zeroed, for unused: check if the entire structure is zeroed.
> 
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> ---
> Changes in v3:
> - Don't try to check unused attributes if there are none
> - Don't reuse the loop iterator from the attribute padding check
> - Link to v2: https://patch.msgid.link/20260520-gpio-cdev-attr-padding-check-v2-1-0010daf8059f@oss.qualcomm.com
> 
> Changes in v2:
> - Make checking even stricter: check if padding is zeroed for used
>   attributes, for unused ones: check if the entire struct is zeroed
> - Link to v1: https://patch.msgid.link/20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com
> ---
>  drivers/gpio/gpiolib-cdev.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f36b7c06996d70b2286edbd181899e4c572b9086..82f27db0b2304679eae4c4f28302e9845d7cbaa3 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1184,6 +1184,7 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  					unsigned int num_lines)
>  {
> +	size_t unused_attrs;
>  	unsigned int i;
>  	u64 flags;
>  	int ret;
> @@ -1191,9 +1192,21 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  	if (lc->num_attrs > GPIO_V2_LINE_NUM_ATTRS_MAX)
>  		return -EINVAL;
>  
> +	unused_attrs = GPIO_V2_LINE_NUM_ATTRS_MAX - lc->num_attrs;
> +
>  	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
>  		return -EINVAL;
>  
> +	for (i = 0; i < lc->num_attrs; i++) {
> +		if (lc->attrs[i].attr.padding != 0)
> +			return -EINVAL;
> +	}
> +
> +	if (unused_attrs) {
> +		if (!mem_is_zero(&lc->attrs[lc->num_attrs], unused_attrs * sizeof(*lc->attrs)))
> +			return -EINVAL;
> +	}
> +
>  	for (i = 0; i < num_lines; i++) {
>  		flags = gpio_v2_line_config_flags(lc, i);
>  		ret = gpio_v2_line_flags_validate(flags);
> 
> ---
> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> change-id: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 

