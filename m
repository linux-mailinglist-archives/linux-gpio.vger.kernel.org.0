Return-Path: <linux-gpio+bounces-37154-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHxKHnNqDGo8hQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37154-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:49:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FFF57FFE8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5E043038281
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C12371D10;
	Tue, 19 May 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaR7DUwP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4112409608
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198273; cv=none; b=lO+I/fIl5O0yVNuGkOTwRuFpGD2tMdLLLIYIFTcKq2Ar+pE2XqDuxSLnCm55PFELd6sFd5Ou0XqFe8+vd4XOt8fMDhlQ21mUEh8OwycTysY5ShJ6N6vwGNkhnC1ZnOTiS3jrQUDSuP8yfU52fvRJ+ujUtJzbVxgjx30zL2IhbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198273; c=relaxed/simple;
	bh=eSEClUkIjTYk2RYzPnM2h7qdF/CzgiPU0Uc+3QSp1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWljQ8pdR2CGmuk5aR4eItra2xjuVh4+VTt+6dOpQQIy2Lq2/QvYPaYCqnnkyFEUVO2nujGEB9YVkjkzL5cXB8AVE4vN2O76m9rpfg17ZVEZCuPcRMxM4YsdFicnlbUzrwjE11WNx9PpPK1IXdAVmuavAjP7WM8B6RiezMwWA4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaR7DUwP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so2476679b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198271; x=1779803071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1DiNJRVlp7uMQ4tlgv6qGYE0GaEpAwv2IFeYSPM66ZY=;
        b=DaR7DUwPAP8K66Jub5KSCoqd5ovhW/Q8pEQRRy0dMmeb2gV3m1PB8GlYIx8Q21hxT3
         2uA97F5nSTd8FIes6KGmrmfxKKEcLVmRaTR1dD5DGGEGLrpCc03JfQKto9YEPj+lCEg5
         Rt8XcBxOMVGdq/EZ0Hu4l4j0H8VE+JGDRTgCSoKksuBxHk9oUjZsiUs9tz7dOQpkQNfO
         9nFW2HNg018XrkrKF6WjcMlSEyi/4+L1ayXqSrUIDqILIhuYnfmGwLfaPRcdnipks3F3
         dBKWsNAm1TZ8HCwi1rphGWMyXzP3yVsM1T90rDVLoY8Mp3wlwNuFEjxo89GBhOA78uGd
         gIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198271; x=1779803071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DiNJRVlp7uMQ4tlgv6qGYE0GaEpAwv2IFeYSPM66ZY=;
        b=O7B5ss8NwSQnXi6EZMdkd2VcPkhFOOWW6LN7iM7JiNLv5C6IZit4aMlyHMvjr3zDCh
         bh73VxUihcjptW3f4Vm2qHGa4DpOTHqgF977wkizSTKJLNA4VZQIHZYy5s/hUZXMV8em
         xTKqhHv22sXgiFIfNFhKWcYmgAzhVimXOx8tVYrDQv49xkZmuX93ZicWNhs7+WnD+F+M
         mYT4SDwRomyqiZNIPQIBaF6xREgFrz/AHPwKMXqp2dscsbLp4QbdwOHcGuTY8biTFitm
         q8H0Y6xqx8a0eQStscTi1HcFfP7ndMk5ooXIdIduXW/NowXK/QfBW3xRtA74Zpl03kR0
         wlOA==
X-Forwarded-Encrypted: i=1; AFNElJ8bQWtVwjlM5Bxk6Rg1dbT65wXrz+/VkgQWeBaWm1vSDNEv9SqC26fQutsx7g7MnEH9whKEC08NYhqi@vger.kernel.org
X-Gm-Message-State: AOJu0YwNJsBgmknhtaCYLpTHAPWd7yk3mXRTJWrs2U1DwSoyai0MdPVu
	8gwWHYRLj7eeF648Gdg1oqbPjGRHZyoWzWu3VTawNw4SvugwqMU9SwAn
X-Gm-Gg: Acq92OE7tD+guA/ZnzZUo3gfk7KCumUJhHiX5kB2kZi/Cqbf46cX6eOgjX65k1GZ7Mt
	H9x5yVNdvqIT8nN/HJ6FpHthWQhkYtFZ2NwiYDrIJgTUuWRrL8OoYZd31WcVMjGw+S7MKzlZKS0
	XXOvrZR8g/o3VBEZPvaHdiAF9SS8BIwZKqZPvpCE3YK/gyja35rrHFLYHDy3pG4vMbPq203jP/8
	6mlZuAiMGGipr1GmuDZ9gXZkiHymUuXcdNa4TxxJW9+QvBtGPfrXxRkNsapjYn2zrsyYEfrUalL
	1MdunN8KlA+tl2UIvrLHwhUpIy8HS+CBtcrm6ONTRuvQWNk2NahWAv/9Du89xWiQTYEwze4g5rL
	Er1JSwVvMzLetYLuqyPrBW/noSnDutxbkMP/ZMYd3G0B1/vlv2NIc0zMT119u0Vua+Jrxqauo7O
	9YRC67XbBU+J6wuMwSgGf/iOrmE6TNgtE1BDjgS/eO0HE=
X-Received: by 2002:a05:6a00:a22a:b0:82a:65fa:cecf with SMTP id d2e1a72fcca58-83f33aebd61mr20344087b3a.4.1779198271161;
        Tue, 19 May 2026 06:44:31 -0700 (PDT)
Received: from rigel (106-68-217-148.tpgi.com.au. [106.68.217.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm4258233b3a.13.2026.05.19.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:44:30 -0700 (PDT)
Date: Tue, 19 May 2026 21:44:10 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cdev: check if padding of uAPI v2 line config
 attributes is zeroed
Message-ID: <20260519134410.GA93030@rigel>
References: <20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37154-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: D3FFF57FFE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 03:14:53PM +0200, Bartosz Golaszewski wrote:
> We check the padding of other uAPI v2 structures but not that of line
> config attributes. Add the missing check.
> 
> Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f36b7c06996d70b2286edbd181899e4c572b9086..f6f49376a36288cdf44493334e766d6340294ed7 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1184,6 +1184,7 @@ static int gpio_v2_line_flags_validate(u64 flags)
>  static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  					unsigned int num_lines)
>  {
> +	struct gpio_v2_line_config_attribute *attr;
>  	unsigned int i;
>  	u64 flags;
>  	int ret;
> @@ -1194,6 +1195,13 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
>  	if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
>  		return -EINVAL;
>  
> +	for (i = 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++) {
> +		attr = &lc->attrs[i];
> +
> +		if (!mem_is_zero(&attr->attr.padding, sizeof(attr->attr.padding)))
> +			return -EINVAL;
> +	}
> +

To be really pedantic, how about checking that all the unused attrs are zeroed?
With the loop here reduced to checking the padding of the used attrs.

Also, the attr padding is a u32, so is mem_is_zero() is overkill?

Cheers,
Kent.

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

