Return-Path: <linux-gpio+bounces-34266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKV9I0VuxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB33343BDE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 983803039FA8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02393783AC;
	Fri, 27 Mar 2026 11:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k4QvSzox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FB37B40A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611810; cv=none; b=Rqk9khzOeSnQTBQviWRTGXSihRoXr2zydHW1lxz7lthewsR8N3FGiGRysR2nBYNMcS/XybQ/hrL82VioCp0PUop9SFpj0Y9wU/+mtAH0+QGRlHvsq6YfKxuACM9l6eLOdBCX0bkg+W+8aTzL8kMwLfWcYegL9FS0WhFdnOjLiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611810; c=relaxed/simple;
	bh=uYAApojvLTIkmyKoZpYwJZCokmKbnpF9c6WhaIacVG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwcga8on+9ZMbi1qwZonvo03sfllJlyW5FVrsfX1XTsr6YjJo4h8sRvpu5tVwKaTBT9CA+epYZzr11peR06hRxj2Uzj/QQ3T8+xKiasBoYgNyb2bPKgdvBOrDaeKSLKBUDvIbqoBeOdJdxRHx9Q7uCkwFQ9rWUKLh5YwrD07Ab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k4QvSzox; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=H/mm
	EvjF+xhmn9Wns9betMD2C6MNmROj8DyAiLE02zM=; b=k4QvSzox0bVkfsfDjzFG
	LGuc3RY6Nc4A01kHbyNKckXguVBwpBOKFgCosfhLsRsjq4eDoNRYZpMIVCJ0O3hr
	gfeanKsyTEOWbah1eONyp6cI2lvZTWiinFUqQ1+gY2hdjjx+hPdnLjDCYK70TUJ4
	aFc/YaBf28GDjSGd7mxe254RWqDfD9attVFCtj8ikS1PeMOzQ7Wq1WpZ9OE7cTEW
	LWHjg90xTnSXm5laQso2Th3BJmrtN84wxdyQWCBE0l/PveVIj91/BXi11wFJWf4A
	0Ik6WG0aYRHLixjG/wpRM3UOW+oQhTX4llCiif+gTG5sUZ6tFSGGFUkiiWl6Oq3N
	Rg==
Received: (qmail 174700 invoked from network); 27 Mar 2026 12:43:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 12:43:25 +0100
X-UD-Smtp-Session: l3s3148p1@m9s6AgBO++RUhsJN
Date: Fri, 27 Mar 2026 12:43:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/15] hwspinlock: move device alloc into core and
 refactor includes
Message-ID: <acZtXL7OiM0ceyMe@shikoro>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34266-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,lists.linux.dev,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACB33343BDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:59:22AM +0100, Wolfram Sang wrote:
> Changes since v4:
> 
> * update Documentation, too, when ABI gets changed (Thanks Antonio!)
> * rebased to 7.0-rc4
> * added more tags (Thanks!)
> 
> My ultimate goal is to allow hwspinlock provider drivers outside of the
> subsystem directory. It turned out that a simple split of the headers
> files into a public provider and a public consumer header file is not
> enough because core internal structures need to stay hidden. Even more,
> their opaqueness could and should even be increased. That would also
> allow the core to handle the de-/allocation of the hwspinlock device
> itself.
> 
> This series does all that. Patches 1-2 remove the meanwhile unused
> platform_data to ease further refactoring. Patches 3-9 abstract access
> to internal structures away using helpers. Patch 10 then moves
> hwspinlock device handling to the core, simplifying drivers. The
> remaining patches refactor the headers until the internal one is gone
> and the public ones are divided into provider and consumer parts. More
> details are given in the patch descriptions.
> 
> One note about using a callback to initialize hwspinlock priv: I also
> experimented with a dedicated 'set_priv' helper function. It felt a bit
> clumsy to me. Drivers would need to save the 'bank' pointer again and
> iterate over it. Because most drivers will only have a simple callback
> anyhow, it looked leaner to me.
> 
> This series has been tested on a Renesas SparrowHawk board (R-Car V4H)
> with a yet-to-be-upstreamed hwspinlock driver for the MFIS IP core. A
> branch can be found here (without the MFIS driver currently):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
> 
> Build bots reported success.

Sashiko found some valid issues[1], so I am already working on a v6.

[1] https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com


