Return-Path: <linux-gpio+bounces-39370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBjKBHdYRmoNRQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 14:24:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 626506F7864
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 14:24:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CNx0Udga;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39370-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39370-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2028930B72B6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8CB480DE8;
	Thu,  2 Jul 2026 12:20:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02147DFB6;
	Thu,  2 Jul 2026 12:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994849; cv=none; b=mGdSn33Q1YsxWokPc4JCNxhuT3nrJp0lQ/1EQQvLSWdl46a1OZA+ximiW8gps2mFOtJRzZhBbH/FdJK2DwOL5YJ74mV28hCtk36nDSCBMwFWxeExtEppvXp538dEvuEGMWL2V+A4BebJWMIGeIJDCvV47cJDFwyE8hBh35gshKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994849; c=relaxed/simple;
	bh=2OyQTHwtfQUlB+aQ986J+OOG5zzNAqhuf/f+oWNlWg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX1C30cVQ7b1eKowpVzRmomsLBRRVC4gA7CfIeLubo8U/cYZHPc0J+xUuv5+Uw06Q//e/FIyStR/k8/73P+HPgqgSGJhzfqFm1HowbN8qU/2HzVWdAlxv2w+vEaED1CkiRGLrhBTnFAUsNRo1Qbxlke8dpEfg5dzYpDEmOCKW24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNx0Udga; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03661F00A3A;
	Thu,  2 Jul 2026 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782994848;
	bh=ustYcUo3kt4OVVOYQdPCDv3uHvjC2n9q5apTBwlHguQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CNx0UdgaDX9InYyybD8wbZs+XM+cCvP8ky/xoF8jeXYOMOVWwBMQmgByGeWne+GPC
	 8YAHIsjcTWyA1BvyqFCZxUKSrprvsr3lMGpDclmqB8le2I8CA5nzuoNcFoLz4n701l
	 b/FCkVgHkaCB0xAqLNGSxqhz/zfKTjFNGYScR6t41sF+CmJrNhOrczTiPu+wAir5xo
	 Jw3e+SCJ/ABjeS9ZzhVBzX2g9/RZxZiaiWhP1BnvIumgJqrpHJTp+34X+PKSeIRJVT
	 wE88VCGuD+KLBLfwoZVeaUmTFdb7JP19vaIW5Fw/Lhs+vC0CKqGSuZENeke7JwIuuk
	 oyxgmdipUTsxg==
Date: Thu, 2 Jul 2026 13:20:44 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: riku.voipio@iki.fi, pavel@kernel.org, linusw@kernel.org,
	brgl@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH] leds: pca9532: Fix inverted GPIO output polarity
Message-ID: <20260702122044.GM2108533@google.com>
References: <20260617053934.2122685-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617053934.2122685-1-chou.cosmo@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39370-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chou.cosmo@gmail.com,m:riku.voipio@iki.fi,m:pavel@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:cosmo.chou@quantatw.com,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 626506F7864

 n Wed, 17 Jun 2026, Cosmo Chou wrote:

> The pca9532_gpio_set_value() function incorrectly mapped the requested
> value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
> A requested logical high (val=1) incorrectly enabled the LED output
> driver, which on this open-drain device pulls the pin low, while a
> requested logical low (val=0) released the pin.
> 
> Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
> high-impedance) and val=0 yields PCA9532_ON (pin driven low).
> 
> pca9532_gpio_direction_input() is also updated to pass val=1 to
> pca9532_gpio_set_value() to align with the corrected polarity mapping,
> ensuring the pin remains not driven when configured as an input.
> 
> Fixes: <3c1ab50d0a31b27bb4e55168f4901dd91e6e5ea4> ("drivers/leds/leds-pca9532.c: add gpio capability")

'Fixes: 3c1ab50d0a31 ("drivers/leds/leds-pca9532.c: add gpio capability")'

> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>  drivers/leds/leds-pca9532.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 0344189bb991..80bf94e699d4 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -325,9 +325,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
>  	struct pca9532_led *led = &data->leds[offset];
>  
>  	if (val)
> -		led->state = PCA9532_ON;
> -	else
>  		led->state = PCA9532_OFF;
> +	else
> +		led->state = PCA9532_ON;
>  
>  	pca9532_setled(led);
>  
> @@ -347,7 +347,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
>  static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
>  {
>  	/* To use as input ensure pin is not driven */
> -	pca9532_gpio_set_value(gc, offset, 0);
> +	pca9532_gpio_set_value(gc, offset, 1);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
Lee Jones

