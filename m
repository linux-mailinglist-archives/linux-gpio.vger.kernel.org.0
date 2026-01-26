Return-Path: <linux-gpio+bounces-31060-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDchAfk+d2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31060-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:16:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80886A06
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 11:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70BF93023D90
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8C432F774;
	Mon, 26 Jan 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="hNwJOWGk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFDC32F76D
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422499; cv=none; b=iwuNkVle+TE0ZuOnCplp6iFbywhfwiNz0GXIUMd7OR2kOjzReFB9o/C5kxP3S4vIMqmYl9E4QBZFQvjKO+tWjtwT+GP/4xifWDyXEWv0Or2w7X7qiXT9uLjwypN4S6O2w7s7/5RVtvYMSFNEHX34Ypmxh+L6Rj4YPZJWWWMBUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422499; c=relaxed/simple;
	bh=Rwl08LlMK5tYxXpdB6OUAqXrc88pfu1wm02Z38tXUrE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gklUtxUqa8sF154csTMs8sqk1Rz4H59l6iTmlY6SJO/YuKJO1ww/FOTN2QCHSerg2ZHcLyw9gMzghX3qJNtXdyunCgtymYD81IDm0sqHwxcSCt2YvDB1PGvaGl40CDLhYzTp8O48FZc99u81Avk2IkfPPaHSyOvtRl1Z3PgdOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=hNwJOWGk; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B9675240028
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 11:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1769422488; bh=E6JNIXiL4/1bW0+UR+jZtVn2Er2iWLO91YkvCOZjL/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=hNwJOWGkuy9s5Vl4Ecc7RozjABWGHRW71P7Ia51tTQaflGzXkf7uURBXgHE0i0wax
	 s9PxnBQI3TpgkIs2XjIcc2bktcRFiuKpnDcbXYDcx+NYh41JricKsbjNSyko4kMDVj
	 TN9vJilx/BfhCbim1axucVJ85xrs4+RF2J6WMHFqHcTtH5x4/7iM3YREeIExSek3U1
	 BAVIpzN41R3uH2FBw4wMeU/8T9p9E5AMjH4qMKyhancoL3rKKE9fM7gmyAgiYmIG50
	 cLsygKVFVXyDB/5rc2oHuyed8CaIAHip6A/pZO7Dv95D+2Pqftax9e6ReF54jN9jz9
	 U6h6k3uvBE5rw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4f04CP3GGZz6tws;
	Mon, 26 Jan 2026 11:14:41 +0100 (CET)
Date: Mon, 26 Jan 2026 10:14:46 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, Antonio
 Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson
 <andersson@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai
 <wens@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio
 <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Linus Walleij
 <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Orson Zhai <orsonzhai@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Srinivas Kandagatla <srini@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <20260126111440.67394323@posteo.net>
In-Reply-To: <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
	<aXc7DxsqiCGdfzxi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,vger.kernel.org,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org];
	TAGGED_FROM(0.00)[bounces-31060-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wilken.gottwalt@posteo.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,posteo.net:mid,posteo.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A80886A06
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 11:59:43 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Jan 25, 2026 at 07:46:51PM +0100, Wolfram Sang wrote:
> > TLDR: I want to create a hwspinlock provider outside of the hwspinlock
> > directory. So, I refactored the headers into a provider/consumer pair.
> > Which seems to me like a reasonable seperation anyhow. No functional
> > changes. My build tests went fine and buildbots are happy, too.
> > 
> > Longer explanation:
> > 
> > There is a device (MFIS) in newer Renesas SoCs which combines various
> > things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
> > strictly separated. Registers are kind of mixed and its register
> > unprotection scheme will need one of its own locks. I tried various
> > paths to handle this device (MFD, auxiliary bus) but I concluded that
> > the sub-device dependencies give enough reasons for a single driver in
> > drivers/soc/. So, this series will allow me to instantiate a hwspinlock
> > provider from the other directory.
> > 
> > Patches 1+2 do the actual refactoring with a fallback being in place. I
> > used '-B' with git-format-patch in this RFC, so the actual changes are
> > more visible when the headers are moved.
> > 
> > Patch 3 converts all the users. There are not many. We could try to get
> > all the acks for this single patch. Or I can break it into single
> > patches and send them to subsystems. I don't mind.
> > 
> > Patch 4 simply removes the fallback.
> > 
> > Looking forward to comments on this approach. If the hwspinlock
> > maintainers like it as is, I would kindly propose to apply patches 1+2
> > after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
> > avoid chasing a moving target and b) this would remove one dependency of
> > the hwspinlock driver I originally intend to upstream, of course.
> > 
> > I would take care of patches 3+4 as needed.
> > 
> > A branch can be found here:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes
> > 
> > Patches are based on linux-next as of 2026-01-21.
> > 
> > Opinions?
> 
> I don't like the idea of sharing internal stuff. Why would we need to have
> a struct hwspinlock to be visible?
> 

I see what Wolfram wants to achieve. It is the same issue I encounterd while I
wrote the sun6i hwspinlock driver. Currently it is impossible to write external
(out-of-kernel-tree) drivers because of internal structures. And it was a pain
in the ass for testing purposes. I prefer to be able to write external hwspinlock
drivers.

greetings

