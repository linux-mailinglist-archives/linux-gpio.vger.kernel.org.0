Return-Path: <linux-gpio+bounces-31019-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMwMJnmSc2ntxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31019-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 16:23:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1942777BF9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 16:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0793630038F2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 15:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C037C2F3614;
	Fri, 23 Jan 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r2o/lwJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE102E8DFD;
	Fri, 23 Jan 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181813; cv=none; b=qFxi8NwOuLPYQX1bDGduObUv4RUOZlu4i1eo6U6fojSOMDRxMYY8iBzLtltnjF5H/EwQ7gOAP8PAsgYnwYUY927uaNGUxWdRtS6jaaSN1+tzr9fYMGth9XaJQLnNV5RSCH75fqB+HJPnZjwaUYKGRhoNyTmdbubG3RwodylvlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181813; c=relaxed/simple;
	bh=0eJHB/NW+Njfdnl0UGtavS5LEpA5japm1g6BMCj9IWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXfmoeaPm4e6d7wNLdB6ztpaTR+HoNs42eZNpItA8+uExBGju1T/IXNgMdaAJuXPmiLRDNyToFD5cfJb+ySkmzE2ib1bNKt35rVvDzDf/TZxGtGKgwQf7hhKrqJG3dlP5+0xlvULCQ40dwABMpPyRaUdbmHsFyRrjnzKoefkaok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r2o/lwJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD45C4CEF1;
	Fri, 23 Jan 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769181813;
	bh=0eJHB/NW+Njfdnl0UGtavS5LEpA5japm1g6BMCj9IWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2o/lwJGDK75/rWVzTOoz/6NjQm91Er7KDEh87lqtJGEKNK0ijxycIO50NJiVBWR8
	 UJaEVx8ov0afcfl89TKRwd5mYMwUyvNh8zPd7rfnw6MlcQnKzEiFzzZGFIN/u5f0/8
	 iYf5V2hpvUmFeq4/+OucSQSH8DRuB6/rtWt9e6pY=
Date: Fri, 23 Jan 2026 16:23:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, broonie@kernel.org, will@kernel.org,
	grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
	linusw@kernel.org, brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: do not register driver in probe()
Message-ID: <2026012302-nutmeg-grandly-1a09@gregkh>
References: <20260123133614.72586-1-dakr@kernel.org>
 <DFW0SC4QG4W8.C7BRHX02W3IK@kernel.org>
 <2026012354-stinging-lapdog-2a54@gregkh>
 <DFW1DQTKRQS0.YXYIGV3FF6TK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFW1DQTKRQS0.YXYIGV3FF6TK@kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31019-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1942777BF9
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:25:43PM +0100, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 3:19 PM CET, Greg KH wrote:
> > On Fri, Jan 23, 2026 at 02:57:45PM +0100, Danilo Krummrich wrote:
> >> On Fri Jan 23, 2026 at 2:31 PM CET, Danilo Krummrich wrote:
> >> > diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> >> > index e136e81794df..8db71a2db9ff 100644
> >> > --- a/drivers/gpio/gpio-omap.c
> >> > +++ b/drivers/gpio/gpio-omap.c
> >> > @@ -800,9 +800,7 @@ static struct platform_device omap_mpuio_device = {
> >> >  static inline void omap_mpuio_init(struct gpio_bank *bank)
> >> >  {
> >> >  	platform_set_drvdata(&omap_mpuio_device, bank);
> >> > -
> >> > -	if (platform_driver_register(&omap_mpuio_driver) == 0)
> >> > -		(void) platform_device_register(&omap_mpuio_device);
> >> > +	(void)platform_device_register(&omap_mpuio_device);
> >> >  }
> >> 
> >> On a second look, it recognize that this did abuse the fact that
> >> platform_driver_register() fails when attempting to register a driver multiple
> >> times to avoid registering the same static device multiple times.
> >> 
> >> So, I guess this has to be changed to:
> >> 
> >> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> >> index 8db71a2db9ff..3e1ac34994fb 100644
> >> --- a/drivers/gpio/gpio-omap.c
> >> +++ b/drivers/gpio/gpio-omap.c
> >> @@ -799,8 +799,13 @@ static struct platform_device omap_mpuio_device = {
> >> 
> >>  static inline void omap_mpuio_init(struct gpio_bank *bank)
> >>  {
> >> +       static bool registered = false;
> >> +
> >>         platform_set_drvdata(&omap_mpuio_device, bank);
> >> -       (void)platform_device_register(&omap_mpuio_device);
> >> +       if (!registered) {
> >> +               (void)platform_device_register(&omap_mpuio_device);
> >> +               registered = true;
> >> +       }
> >>  }
> >
> > But there are no platform resources for this at all, shouldn't this be a
> > faux device instead?
> 
> Probably, but that's for another patch, since this one may potentially be
> backported beyond the existence of the faux bus.
> 
> > That being said, ignoring the return value of platform_device_register()
> > is probably not something we want to keep around.
> 
> Yes, as mentioned below the commit message, there are a couple of things that
> need to be followed up on here.
> 
> With this patch I only intend to fix the deadlock condition and otherwise keep
> all the existing semantics as it is.
> 
> I.e. maybe it is intentional and this driver should not abort probing if this
> can't be registered for some reason.

Ok, fair enough, fixing this immediate bug is good enough for me.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

