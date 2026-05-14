Return-Path: <linux-gpio+bounces-36854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPEWHnXjBWrndAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 17:00:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C97543A3C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 17:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86CCD30731D1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136B642316F;
	Thu, 14 May 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtiiB/os"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55953E6DFA;
	Thu, 14 May 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770107; cv=none; b=TPdyfjKqYpYk3+T7L4q/ToMvtoo03iKAHtmBXubUw8+C8qnGSUIh5hvC3euCVH1joDyeGHXcZbfmTtBRbIKj6SXUsroJWhdlxNysnLlcmJDpVsiVT1qk48wKoDDGGCS6p2JG0LdkL2QfxUdB7f+PDoq9gyFkIO+gqH6/QieivM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770107; c=relaxed/simple;
	bh=3kA6ObmP3YasrMsaMisbunu12sclK2aZFDEflfXroSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMW/vVgIhBd4XAxxSRkB2P2HLOHPC2LJsrcu/rDi6siBanRvr2bB4Mo52/5ClvH6GQxtXk4n4fI/U2vrYxBCEn5LLQc3xYXrf1sIDfG4+FxMCUCY7D4ZgisI5dpBWA1HI2SxSQXvfwuEnBimNTmHryAWOU5FHoh2fI01ceKrS3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtiiB/os; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39631C2BCB3;
	Thu, 14 May 2026 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778770107;
	bh=3kA6ObmP3YasrMsaMisbunu12sclK2aZFDEflfXroSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtiiB/os0CdAB9BAV3nbe9frccr6I7dUvljf61ktcDLXxM71fSqJgvbSqsZkPgg6E
	 eEMmrXWDYrzx+4KuqaU+v3LhvlS/fqvHMsF+aJ2JhB+99gLjepQS9tC9u61Zxe8Q/p
	 U6A0SPLjpNsrh+AA2iJSVVqD4IX8Hl+GquTzoBN69Bu38n2i4Cq8PM3XzEuhIyUYq5
	 ZcbtrD4M1lt9njLS+tRH3Uw1YKR0AFrhIzA88vSL9CMoXdQ3+XTWXDZ2Bctf43aLKV
	 NXNLfnlZHof81GuVYppCASms0KAL+dC05ytR4STkZHotdOCBF1k1GnnRLFzjkWFzdk
	 +oswHy2t8EvGQ==
Date: Thu, 14 May 2026 15:48:22 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] [v3] leds: gpio: make legacy gpiolib interface optional
Message-ID: <20260514144822.GM305027@google.com>
References: <20260505155915.3698243-1-arnd@kernel.org>
 <afrjkMqRUosKtkY8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afrjkMqRUosKtkY8@ashevche-desk.local>
X-Rspamd-Queue-Id: 83C97543A3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36854-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 06 May 2026, Andy Shevchenko wrote:

> On Tue, May 05, 2026 at 05:58:48PM +0200, Arnd Bergmann wrote:
> 
> > There are still a handful of ancient mips/armv5/sh boards that use the
> > gpio_led:gpio member to pass an old-style gpio number, but all modern
> > users have been converted to gpio descriptors.
> > 
> > While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
> > and related helpers is currently turned on in all kernel builds,
> > the plan is to only enable it on the few platforms that actually
> > pass gpio numbers in any platform_data.
> > 
> > Split out the legacy portion of the platform_data handling into a custom
> > helper function that is guarded with in #ifdef block, to allow the
> > the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
> > gets turned off. Once the last user is converted, this function can
> > be removed.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> There is a couple of nit-picks, but I'm not objecting if they are not
> going to be addressed.
> 
> ...
> 
> >  	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
> > -	if (IS_ERR(gpiod))
> > -		return gpiod;
> > -	if (gpiod) {
> > +	if (!IS_ERR(gpiod))
> >  		gpiod_set_consumer_name(gpiod, template->name);
> > -		return gpiod;
> > -	}
> >  
> > -	/*
> > -	 * This is the legacy code path for platform code that
> > -	 * still uses GPIO numbers. Ultimately we would like to get
> > -	 * rid of this block completely.
> > -	 */
> > +	return gpiod;
> 
> Okay, let's stick with this form.
> 
> ...
> 
> > -			if (template->gpiod)
> > -				led_dat->gpiod = template->gpiod;
> > -			else
> > -				led_dat->gpiod =
> > -					gpio_led_get_gpiod(dev, i, template);
> > +			led_dat->gpiod = gpio_led_get_gpiod(dev, i, template);
> > +			if (!led_dat->gpiod)
> > +				led_dat->gpiod = gpio_led_get_legacy_gpiod(dev,
> > +								  i, template);
> 
> Why not keep the style as before:
> 
> 				led_dat->gpiod =
> 					gpio_led_get_legacy_gpiod(dev, i, template);
> 
> ? (Yes, it's a bit longer than 80, but I think in this case it's justified for
> readability).
> 
> > +
> 
> This blank like is not needed.

May as well fix them before I do a full review.

-- 
Lee Jones

