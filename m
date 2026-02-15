Return-Path: <linux-gpio+bounces-31691-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKdQAfiukWmelQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31691-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 12:33:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2D13E9C2
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 12:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F4863014662
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Feb 2026 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064012BD58A;
	Sun, 15 Feb 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9Eu7kx5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB56191F92
	for <linux-gpio@vger.kernel.org>; Sun, 15 Feb 2026 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771155175; cv=none; b=rfelM6y8/v3pxLS0+sggqcBQTwuG1Ea5wXlJ8mbDNkipQbKbp4vefNJ3pBIM/sg21GMk7zGA0O6vNmAfEBH/LHpzYnlojTo8xKxMiRW1Wmj4yI9/UMxAqv442jnWNtjg9i/LnYy5kgXWs+wRaoWOaGzJQ+6AaCb+6LXwF3fxpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771155175; c=relaxed/simple;
	bh=EiGztezg+QdrwfJTYNGicc2srVuiP//23AD6hVKMSNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8K0ddykbz6RIEk4WxbOVqO6kz9mmEAlZGHSXdxrVEh/YN2fTwIAZebQuyNHi7m4cTvD5fKpgnr8YaUTp3OdQbXoaLakGPHxMS2KQab/dgKmkgnp0jj8Y3VXulwHKoZIeA4zqn2kmd6eJ7jsvCpaMlP7qqN1iJ4N5ir6JXqePds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9Eu7kx5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a7a23f5915so12659675ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 15 Feb 2026 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771155173; x=1771759973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZyKqDnvoX+DGQQ7E9chqL4FWW/ISzd19EF4hzC4/To=;
        b=Z9Eu7kx5j5RyZEeAPlR3W+qB8amPo0/40NVytD1Y9TJgfyPUMkc46kns7DsU5v2g9h
         0nVb4PG4jKLlHIpkjEIJAigRWoay8LpxNF0kSyUtD/hWTy2cOYfKQwzsQJ/6wLLKfQ08
         TjrhcEzxJ+R8EC5tv3L39jG+w+vhh4kPv7JnicvA3lmRu/uk/KrBRt4XL+Y0WaePGR2u
         AsUdSFquJTv1UqhylJXQi/h7mHL+92jhP+mZXyvESxDVFJSSN0QDO3PZBqX7HyCWpMR6
         JqioEU1bVEUsynQ6g8fAWW5EytwKDex3Fy+HQcQXzBIG7EFu6KdqbvHmTB9GRRHPMPmj
         GSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771155173; x=1771759973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZyKqDnvoX+DGQQ7E9chqL4FWW/ISzd19EF4hzC4/To=;
        b=HWn5rNG2mJ6ECKfBLWwglWq0oqrwJXJYvgD2T2k7mGggL2phGkyHq1M5+lLOYT1o0b
         dLFUBsxWEXyvw9mpJ5WcgVI/OFQ2wp4sstXhXAHoko33MtPrJtpsxR4cg9TNzhGgYqL8
         l4UMRP2YBxKy4t0edlBS4elBfkuD8V/c/top8CkqeFxBgKEZ1nW6ODejvB4VDWRoJEFQ
         65PJvc7L08T8IU+iVJ8J1QwCGy3qkXUiiQQCO3dKUlTxpeq6RHxtVZuiIR1Mj7TXgDnc
         I8Vc1f8CNClqCmRKw7bs8XLsw5jPusnm+EF9rcLA1HukWtJG4jcDVWI3sUlK2eLg6/sy
         nG9A==
X-Forwarded-Encrypted: i=1; AJvYcCV4L7ZWkjRQVXOAsoJzkF+G0QiRn9u47XPtGX5Cy7S7EBgqYx/f3FcVgwpCfYU5GndqWGCtDofRGqYY@vger.kernel.org
X-Gm-Message-State: AOJu0Yygc+SULZD2VRw0xqjf0UZ9Oiugss/C3XZyXSMHP59CD2Nds916
	cB8ApxjoJdkEj/L+5h5I4QRqTk74k64eaw2dC5NQJJiU9dYnX02IBWCh
X-Gm-Gg: AZuq6aLeO6cH5KH/+71Vbm4/KnvIOscWPx7AHAvdiJd77BJALpaT73+0xLqrbvx2mi7
	zhIwFtTuoUcUP7qzIL1dXYC86BKwQ8GTLM+pPE20DA4vhESySRHwpXrrR7fSqTswCxrlKqjIr14
	mk+8yhH6tMlzy+sZMeKI+KhLlqh3EvD0JSfFIWHPlK1kbp+tb/3oIxq3JjjBgaZ/wD4sc5tFFdE
	7ocx24uxTG91bLG/HKncICB6FGAcXEXw4/f9Clw16yinMNfvH7lu8/0A/dh6l4oxERIMEpietVY
	mC12JLPONcLPqJrseo7Eq9SSa3NU3oR10iwY5qwc6UWCK5xZvpLuW1Ozqnnt4UioP5StkopELLl
	3m0Wvx7qMQo+nUQOxHls8kYomkfOY3MroFEsPm9NJMplaA+N5D8MYyIAHu7viavpWvyjrdI8Dyo
	jGuvqWz25rt36Cmpks5A+hDGkQecA47t18eQUjQMr7q9yAS1KTNg==
X-Received: by 2002:a17:902:ecca:b0:2a8:a133:dfed with SMTP id d9443c01a7336-2ab5061f123mr75612935ad.55.1771155173089;
        Sun, 15 Feb 2026 03:32:53 -0800 (PST)
Received: from rigel (27-32-126-215.static.tpgi.com.au. [27.32.126.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5c4csm42209045ad.53.2026.02.15.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:32:52 -0800 (PST)
Date: Sun, 15 Feb 2026 19:32:46 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Avoid NULL dereference in linehandle_create()
Message-ID: <20260215113246.GA46983@rigel>
References: <20260213092930.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213092930.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31691-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EC2D13E9C2
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 09:29:31AM -0800, Douglas Anderson wrote:
> In linehandle_create(), there is a statement like this:
>   retain_and_null_ptr(lh);
> 
> Soon after, there is a debug printout that dereferences "lh", which
> will crash things.
> 
> Avoid the crash by reading value needed by the printout before making
> "lh" NULL.
> 
> Fixes: da7e394bf58f ("gpio: convert linehandle_create() to FD_PREPARE()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpio/gpiolib-cdev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 2adc3c070908..13ab6a5ebb76 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -304,6 +304,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  {
>  	struct gpiohandle_request handlereq;
>  	struct linehandle_state *lh __free(linehandle_free) = NULL;
> +	u32 num_descs;
>  	int i, ret;
>  	u32 lflags;
>  
> @@ -379,6 +380,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  				      lh, O_RDONLY | O_CLOEXEC));
>  	if (fdf.err)
>  		return fdf.err;
> +	num_descs = lh->num_descs;
>  	retain_and_null_ptr(lh);
>  
>  	handlereq.fd = fd_prepare_fd(fdf);
> @@ -388,7 +390,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  	fd_publish(fdf);
>  
>  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
> -		lh->num_descs);
> +		num_descs);
>  

Use handlereq.lines rather than creating another local shadow.

Cheers,
Kent.


