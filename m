Return-Path: <linux-gpio+bounces-31434-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEB5FjxEg2nqkgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31434-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:06:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1FE6293
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 14:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C63D3002B62
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E386F40B6C8;
	Wed,  4 Feb 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS45bXfC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72372D8375
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210339; cv=none; b=mG7pePlWadMfjkBsUl2eFFIfL2X9CmzcM+mx12eQNkxDJ5Tm5LFcfVmgzAwVuX6x9HmTgbBENg+WxZ3x8dHRp7oNTQ73cYXUb7dQCZiYy/mfFfZJQP6jwuqg7mL1yagC44uFP1yP6bLmtcSYoPJdF2nkSVGcIy2tb45KIzabQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210339; c=relaxed/simple;
	bh=MceK1FWr7uO09+e0oNNf2CKYnk3kLvfctEP7/08Y11Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOZRx732XEPN40pT9uk/qoznd4w6JOkkgdMV0sSEnWjzU0IQnCUiOndX1P/Mb9lx2ExEfvsYKehQzv0LnECDEcZo3DtBbps8l3LuN2PniH4Cxad65anm49GdKCXZQNg8D/IV12MDxV0M4TFyRGSQWzLDf1ISLzH17ZYdGV6ZRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS45bXfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4FEC4CEF7
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210339;
	bh=MceK1FWr7uO09+e0oNNf2CKYnk3kLvfctEP7/08Y11Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=KS45bXfC+Qvl1oNmvsdbm6lYf/LkgoDuXfgsUhGs4tfEKsI9jjJeRJLJ328zcItt2
	 PFBc51RBD9a2NspdnhMkQmMYx53JuKwub/TJPT62+cnb/jSsPQ0XKEeZWaicD3T1BB
	 iMBvezjXqOV4pdVIWDaU88k8Og58gdj+DnOEozC9XIRB4lu+TFadWy4hm/iPPdpdul
	 /Vyu2u2Bdpp6cSsW+V2OOWKDRUSyOPh0s7MPM+G0PibSqFHAClOzCCoCFyKBlqIIyE
	 gYnI1x/7LKyPxbtrY921t4xzPYVfECwP71R7Wk0XIKituWKswEiZSwedOXrr0AWx4/
	 WTM1NBsAgIscA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-385d9fb297dso67761601fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 05:05:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9wTwY/L171arYyXEGPGTy0lQPOdrBEOW/pzJXineZKTtWTWI4Ew9bC5uuEqesrWWCsuJeIXOb+xR+@vger.kernel.org
X-Gm-Message-State: AOJu0YwEDyQ1INSGwzAFsimYQwltavaXoLyyVEDbqFxYLVxgyhlfkRA5
	FCc/gZBu2J4T3M5wOuHlW1VXOSpL9Z/YTqhsiAohLUf2MxGagDn5wCjv+Kn1Ydw1IlUFYkO3SCS
	MZlOfaYPCR3XPqXfnAqiAjPiSs8MDFWp1QJ8bgN2ogA==
X-Received: by 2002:a05:651c:1612:b0:382:4d6b:993b with SMTP id
 38308e7fff4ca-38691db82d0mr11012071fa.35.1770210338208; Wed, 04 Feb 2026
 05:05:38 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 08:05:37 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 08:05:37 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-10-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-10-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 08:05:37 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdqTPf_N-KL8jcAyH+mh+0-uot=qCCfNrRTm8s6r2DJWw@mail.gmail.com>
X-Gm-Features: AZwV_QiS_gD9thEzCdck2pzMmfPSD64C68D0lO0cAZxu4uE90UD4YTjUhhJdjmI
Message-ID: <CAMRc=MdqTPf_N-KL8jcAyH+mh+0-uot=qCCfNrRTm8s6r2DJWw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] gpio: Remove gpio_chip_guard by using revocable
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31434-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67B1FE6293
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 07:10:56 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> Struct gpio_device now provides a revocable provider to the underlying
> struct gpio_chip.  Leverage revocable for accessing the struct
> gpio_chip instead of using gpio_chip_guard.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> --

[snip]

> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index cd136d5b52e9..ce6273cc74f2 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -224,27 +224,6 @@ struct gpio_desc {
>
>  #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
>
> -struct gpio_chip_guard {
> -	struct gpio_device *gdev;
> -	struct gpio_chip *gc;
> -	int idx;
> -};
> -
> -DEFINE_CLASS(gpio_chip_guard,
> -	     struct gpio_chip_guard,
> -	     srcu_read_unlock(&_T.gdev->srcu, _T.idx),
> -	     ({
> -		struct gpio_chip_guard _guard;
> -
> -		_guard.gdev = desc->gdev;
> -		_guard.idx = srcu_read_lock(&_guard.gdev->srcu);
> -		_guard.gc = srcu_dereference(_guard.gdev->chip,
> -					     &_guard.gdev->srcu);
> -
> -		_guard;
> -	     }),
> -	     struct gpio_desc *desc)
> -

Ah, yes, I'll gladly export this into someone else's header. :)

Bart

