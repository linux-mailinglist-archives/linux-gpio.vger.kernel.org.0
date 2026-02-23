Return-Path: <linux-gpio+bounces-32086-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P1qGCrBnGmgKAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32086-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 22:05:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A091517D59D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 22:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A65C30299DF
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 20:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDF4369980;
	Mon, 23 Feb 2026 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFbomPaX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228642BEFF6;
	Mon, 23 Feb 2026 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879985; cv=none; b=DIy49EMxoX8O4oPM+MqLqQrRVGsx7vggoMvBrn3ZUSFrO59AGQrvLgA1fkeydmElPATiX7wT8llADYvozfmshqbQ9MbJxqaRUnB+3d1OtPJChaefT8VUBU9enQuFrDCpiaoKKAfqqJsof4LkONzZux5qmuZ6GoTNUQYH/TTR7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879985; c=relaxed/simple;
	bh=9ZwCRUkSygSWXdebgAt63Ndk3TSqeMDqho4QjUTbPeg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPpsPvWl2LO3a22SNzDeB2hj4j2zqFSITlYUFYxdOQw7HgcXuAwXaYESqyiQ678cqmCX6S3P1eqYka3JP91hje1rj37LILcF2tImr5LCO/vCJ6LZW3HpILl+nrjG0N0LiSZsnCsa1fpNGKAxawlYgRF//fkA7FT7L6437mgK1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFbomPaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30E3C19421;
	Mon, 23 Feb 2026 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771879984;
	bh=9ZwCRUkSygSWXdebgAt63Ndk3TSqeMDqho4QjUTbPeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dFbomPaXdm1lhsiCRGW4tHCyrO1zxgCcTPi/MDxnyMPCkNf3RBffybbw/qXjqk+CP
	 xpth8RfSTShWo/87AJ7NTbvLjgO0oNvvB6o8Ujv9pgZYqMH6gZPTQ36szCplmgoMRw
	 VsBcIZrsnIHZdZFBakvl6EOARXQszb/lyVMbMKkWBuZIoRh9xS0hv51VDmD6H/WwAe
	 JWhjCMiph2crYJceBDyWSnlB3jmJEnFJue7aUqZXucHI5imdJ7NB1oB2I+zONFeoBg
	 hhZnIPQJh1g2vEMDfXtnEQBlAHnHTJXjxl4A1WJ4nMKeODuQKyCnng8iPr9fy93EbR
	 qkqkN/33uj18w==
Date: Mon, 23 Feb 2026 20:52:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <20260223205254.472ee2b1@jic23-huawei>
In-Reply-To: <aZtVEdFoGUMx4olM@smile.fi.intel.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
	<20260219022929.3558081-5-dmitry.torokhov@gmail.com>
	<aZbC51ezuaT5Nwq7@smile.fi.intel.com>
	<aZj3deh1Em1rz3au@google.com>
	<aZtVEdFoGUMx4olM@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32086-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,analog.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: A091517D59D
X-Rspamd-Action: no action

On Sun, 22 Feb 2026 21:12:17 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Feb 20, 2026 at 04:09:47PM -0800, Dmitry Torokhov wrote:
> > On Thu, Feb 19, 2026 at 09:59:35AM +0200, Andy Shevchenko wrote:  
> > > On Wed, Feb 18, 2026 at 06:29:28PM -0800, Dmitry Torokhov wrote:  
> 
> ...
> 
> > > > +	if (error) {
> > > >  		dev_err(&spi->dev, "Error in spi setup\n");
> > > > -		return ret;
> > > > +		return error;
> > > >  	}  
> > > 
> > > And since there is already dev_err_probe() in use, I would expect this
> > > also be converted.  
> > 
> > But that would be unrelated change ;)  
> 
> I never told that this should be done here.
> 
> ...
> 
> > > Would be also nice to use
> > > 
> > > 	struct device *dev = &spi->dev;
> > > 
> > > to make less LoCs and/or make them shorter.  
> > 
> > I actually dislike introducing such temporaries in majority of the
> > cases. It makes it hard to follow what device we are dealing with and
> > does not make the code significantly shorter.  
> 
> May be, but my experience is telling me different story.
> So we have a disagreement here, I leave it to Jonathan
> to mediate.
> 
When there are multiple struct device isntances that we access
in the driver I fully agree with Dmitry that it is helpful to
fully enumerate them.  However, for IIO drivers we keep the
one buried in struct iio_dev fairly well hidden so the confusion
"opportunity" doesn't tend to occur.  As such I tend to come down just
on the "have a local variable" side of things.

Jonathan

