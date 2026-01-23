Return-Path: <linux-gpio+bounces-31017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ6rKYaDc2kDxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:19:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A076E8D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 511EB301C940
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2263D311C15;
	Fri, 23 Jan 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PJEfFsnG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEF283FC5;
	Fri, 23 Jan 2026 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177982; cv=none; b=OYpxNxeTswmcS/Xuf6a5modNozdoltSymRSXEb++0Sl3MJZgPHaME9K5scLQpSntLpszimYrJ4xqX821qaTxxOwDCbt4lV9GjKJbS+b5IVk6B4mPjDdhu2rQp1h4QGdfTxJ5mvM8blBbgrFkwwmX5uAM12l2bBqEwNpdry2KZ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177982; c=relaxed/simple;
	bh=N+NfZKQxM25HyaRd5dNRvdZ4oRLieFCo6keEF5bY3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSp22gHBxMLtfu+0VYvrIXw/kNQpU6GPsP0vvWJgJH+KGcwnpWo6L52Waw1rDPNB+BUVyumx2hzjIgCr0BD/ohN51yM0O08FMSURuXTAsTuv1O5m3qj3ZmdfwbwYdMgUa+/KkFDOu8LurvdvZeJUGDFqYuM8kzlCYsjHGbxSSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PJEfFsnG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1272CC4CEF1;
	Fri, 23 Jan 2026 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769177982;
	bh=N+NfZKQxM25HyaRd5dNRvdZ4oRLieFCo6keEF5bY3zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJEfFsnG3Y5zKh450Oz7AabP5Sp9OEam12BX1dnAIsZ0YL2RV/N1GTEnSz31O4nvY
	 NngKj8xFT01SCDYDbQdF0xhKM1Lp6NePwMGiveqIsMryEIk9ENoSx/3A3rgS2oXn8c
	 SJdG7LiFILuPQ884IUCjqaDFSDoucUhqmb9ESpJQ=
Date: Fri, 23 Jan 2026 15:19:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, broonie@kernel.org, will@kernel.org,
	grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
	linusw@kernel.org, brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Message-ID: <2026012354-stinging-lapdog-2a54@gregkh>
References: <20260123133614.72586-1-dakr@kernel.org>
 <DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31017-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SURBL_MULTI_FAIL(0.00)[linuxfoundation.org:query timed out];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 5F8A076E8D
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:57:45PM +0100, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 2:31 PM CET, Danilo Krummrich wrote:
> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> > index e136e81794df..8db71a2db9ff 100644
> > --- a/drivers/gpio/gpio-omap.c
> > +++ b/drivers/gpio/gpio-omap.c
> > @@ -800,9 +800,7 @@ static struct platform_device omap_mpuio_device = {
> >  static inline void omap_mpuio_init(struct gpio_bank *bank)
> >  {
> >  	platform_set_drvdata(&omap_mpuio_device, bank);
> > -
> > -	if (platform_driver_register(&omap_mpuio_driver) == 0)
> > -		(void) platform_device_register(&omap_mpuio_device);
> > +	(void)platform_device_register(&omap_mpuio_device);
> >  }
> 
> On a second look, it recognize that this did abuse the fact that
> platform_driver_register() fails when attempting to register a driver multiple
> times to avoid registering the same static device multiple times.
> 
> So, I guess this has to be changed to:
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 8db71a2db9ff..3e1ac34994fb 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -799,8 +799,13 @@ static struct platform_device omap_mpuio_device = {
> 
>  static inline void omap_mpuio_init(struct gpio_bank *bank)
>  {
> +       static bool registered = false;
> +
>         platform_set_drvdata(&omap_mpuio_device, bank);
> -       (void)platform_device_register(&omap_mpuio_device);
> +       if (!registered) {
> +               (void)platform_device_register(&omap_mpuio_device);
> +               registered = true;
> +       }
>  }

But there are no platform resources for this at all, shouldn't this be a
faux device instead?

That being said, ignoring the return value of platform_device_register()
is probably not something we want to keep around.

thanks,

greg k-h

