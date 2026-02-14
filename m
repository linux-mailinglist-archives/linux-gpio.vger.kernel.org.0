Return-Path: <linux-gpio+bounces-31684-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF21KoY7kGnUXgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31684-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 10:08:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C87AF13B8A2
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 10:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3190D3007219
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF30A32694C;
	Sat, 14 Feb 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stVjFjp3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A5527A907;
	Sat, 14 Feb 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771060097; cv=none; b=XKBK3ALc/GuQgkFfaHhdvNWLrqlzAYd4+1YTBJsNgVUi0m3kmIrPj34knMz1WMaFlPhzvcfnUQi+qeiWR+bkDkaU2lw3FqNfPYnI51/AIW904jFaLyjQi2FfFBrN0xXVZmxf0fP/DYs67otONanxJcm7IIpkr2KVoELILZbKJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771060097; c=relaxed/simple;
	bh=UEJN1THuI+kGBdgP9emslsFQy5vo+IxbviEbovWmxoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVy/DHX3z4Zmsnr9lsWGlQatr23EBiYW563Jc7+u9Avz2C6RUu5p1R583G4JQ+KyatiVA45QwEfH0RKygQQglU/szvdvGqI+DO2UWJDOkdzoxkBFubf8F4UMKJRyhfeDFtWfvrx3vwq3VqEfni0ZAZALhwtO9PmpC1f3cfd4vXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stVjFjp3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCFDC16AAE;
	Sat, 14 Feb 2026 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771060097;
	bh=UEJN1THuI+kGBdgP9emslsFQy5vo+IxbviEbovWmxoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stVjFjp3uo61UnF3qquRnVqTcMRSaltaLETay6ylFjRAKEJew5j7HhyNB8Yu17TT+
	 4jp5+HaYAhp1AXtnCvNienDUrKeozTlz7CCZqfxDNifYRruSxEwe0fokmtTTm8MNGN
	 fnQBiYR50+OLMCZQ4K1FwEfJWaYoegdWCZbasYTI/b+bkkVeBBr691ZnglAVvHJK7J
	 h7+7ZuvFjQg23RSUAX9LyO9XlAwoL17mulVOibRzNu/gdbkp+1aObo2UICfrquKEi6
	 3F5XjhrwXeUcHYnfsONtZ+tptiTLAWTxzSikyBBiqFnQQFeYTwhPAhYKieyuFwgqGX
	 aDqXSrHzxd5/g==
Date: Sat, 14 Feb 2026 10:08:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: of: add gpio-line node support
Message-ID: <20260214-goat-of-stimulating-prowess-adeabf@quoll>
References: <20260213223204.2415507-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213223204.2415507-1-james.hilliard1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31684-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: C87AF13B8A2
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 03:32:01PM -0700, James Hilliard wrote:
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index b3525d1f06a4..b934e58a07f0 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -147,10 +147,11 @@ static bool gpio_shared_of_node_ignore(struct device_node *node)
>  		return true;
>  
>  	/*
> -	 * GPIO hogs have a "gpios" property which is not a phandle and can't
> -	 * possibly refer to a shared GPIO.
> +	 * GPIO hog and gpio-line nodes have a "gpios" property which is not a
> +	 * phandle and can't possibly refer to a shared GPIO.
>  	 */
> -	if (of_property_present(node, "gpio-hog"))
> +	if (of_property_present(node, "gpio-hog") ||
> +	    of_property_present(node, "gpio-line"))

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46


Best regards,
Krzysztof


