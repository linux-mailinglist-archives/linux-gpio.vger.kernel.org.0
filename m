Return-Path: <linux-gpio+bounces-31686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFeBIwWikGl3bwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 17:25:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0E13C7A8
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 17:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A8CE301F497
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B69430BB8C;
	Sat, 14 Feb 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuZDC4L6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49527F01B;
	Sat, 14 Feb 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771086337; cv=none; b=U9BweXKBQkfkP0m8WnJ4cjMNUkoBwYrW51rtBMkYS0MyaEhWSSwzsXOPaTBlh5Bg/aBzsm2vzM0TqkkiJ1+xnhMbtGAxNYTygbTe2PZERH9I73VYVZYjNlJWyMctEQlT5aHBMSuw4XWewMvKA3FjYwL0cyRimThic5x/p7VAcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771086337; c=relaxed/simple;
	bh=++K7Jh2/PdXRpr5vpBiYZxaBs2vCGEUXKFF6g8fxMKk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuGnIhYVGN8zOjWE4pQNCMBUpmHBceSqReVN8CofJxDvsQlsqUWP7lSd4UcovTGI/nHg99Hrr8wNgGU0/4DSUcLQ+GLGf4QXAOunX1cPZYE2mVTnpbsYR+hNlM543djXpJ0FbRJh0dksfzXoGuIB1upTo0HmwCNR/j9MJavpdR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuZDC4L6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68A6C16AAE;
	Sat, 14 Feb 2026 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771086337;
	bh=++K7Jh2/PdXRpr5vpBiYZxaBs2vCGEUXKFF6g8fxMKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RuZDC4L6qWNYU/RQJ/8V1IDzFWNAkpRJ1GKLqTuP8wxkGoSal9GfJtg1ZVfjybv7z
	 8cQNpwZUgMgJ/0xwiVQC84+VahGCZdU74AvEoK7mls5FVR+JboTozi1fB+YDNsEA0W
	 1DtWDFvzCsjnA65/FR++bnJA8iJbDD9kZjLIrFfkA3UJYgQnoeRb1JJfqrCrLK2MOc
	 GIgLhDdusw+NExykSKjbzBOW0lWOFDm48lLng92VnNdWA/msOX9dLwA+yl2hWDyuj0
	 4nJjB4SIJOfC3HPlH6vmL2pO6Mp+KIjASJMvfAUbSGYQmu/DVpMPaMYhd2zXXXuY36
	 ZlOkxcQvdw0og==
Date: Sat, 14 Feb 2026 16:25:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: 434779359@qq.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 liufulin <frank.liu@faiot.com>, Waqar Hameed <waqar.hameed@axis.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <20260214162526.01e1e336@jic23-huawei>
In-Reply-To: <aYiL89Lx9r8tJT0K@smile.fi.intel.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
	<20260207134950.0f064905@jic23-huawei>
	<aYiL89Lx9r8tJT0K@smile.fi.intel.com>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31686-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[qq.com,baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,qq.com:email,faiot.com:email]
X-Rspamd-Queue-Id: 12E0E13C7A8
X-Rspamd-Action: no action

On Sun, 8 Feb 2026 15:13:23 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Feb 07, 2026 at 01:49:50PM +0000, Jonathan Cameron wrote:
> > On Sat,  7 Feb 2026 17:42:35 +0800
> > 434779359@qq.com wrote:  
> 
> > > This patch adds support for the vl53l4cx tof ic
> > > ICs used in Qualcomm reference designs
> > > 
> > > Signed-off-by: liufulin <frank.liu@faiot.com>  
> > Hi Frank and welcome to IIO.
> > 
> > This is a massive commit.  Normally roughly speaking each commit should
> > be an absolute maximum of 500-1000 lines of code because this what
> > people can realistically review in one go.
> > 
> > I'll take a superficial look at what you have here but to make any
> > progress towards upstream it will need stripping back to a much more
> > minimalist base.  From that we we can then look at adding more features
> > in future patch sets.
> > 
> > Note the largest drivers for what I'd expect to be a lot more complex
> > than a time of flight sensor are not as large as this in terms of
> > lines of code.  
> 
> Yeah, this is even barely satisfies requirement to put into staging/iio.

Just to cut off any chance of wrong interpretation: We don't put new devices
through staging/iio any more.  There is little reason to do so now that the core
is out of there and mass refactors and ABI changes are a thing of the distant
past.

Now it's much swifter to clean a driver up on list.

Maybe there is a reason we might consider drivers/staging again for IIO
device drivers, but I've not thought of it yet!

Jonathan

> It has so-o-o many style issues and other small things (I just pressed PgDn
> several times within 5 seconds). You need to take your time and invest into:
> - creating an upstream plan (roadmap)
> - as Jonathan said, start with a minimalistic setup (not more than a couple of
>   thousands of LoCs
> - be sure the style follows the Coding Style and IIO subsystem specifics
> - be sure the code uses modern APIs from kernel and not some outdated stuff
> 
> ...
> 
> > For the full series, stay under 2000 lines or in practice it won't get
> > reviewed.  
> 
> Fun fact, I answered above without looking at the rest of the message.
> 
> 


