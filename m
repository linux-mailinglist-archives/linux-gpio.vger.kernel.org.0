Return-Path: <linux-gpio+bounces-31543-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBzdK93cimlFOgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31543-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 08:23:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81292117DF1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 08:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0F6230479D6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 07:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6455933345A;
	Tue, 10 Feb 2026 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/pLcOe3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF923A9A8;
	Tue, 10 Feb 2026 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708065; cv=none; b=lLmp4RAPbktFU1PkAKUvdWDHkmdXdnwB5p7OHVOTCkholvMO1jcHwalVtv4UeTHa9Ry1uXBzeuo7kWb7G16AyL1ySPNNPI9riELIdGL+epWe2LpNO41t3+WibodPcSTgzIURPSGGhEmMTzqMakXE4NVbMUuVPf487/oS2ukHnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708065; c=relaxed/simple;
	bh=OBZ7vmJOuXFVdEocUKywotsuTZKHpBEwnRySOMXd6l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdmFrjos1H8Hu0dZNjQJWkBak2zYUJR9bg03b7qqmtlWsvHt+/GCQxevGTPuM6EWA0sMn8zGPNPHWPGHQ1b4/DNhn5wqPdVZrJlUupudBaxYX/hCGyCCEOmit7OQX3+RPbEXjpGPCxBS2BHjgs5GxB1c/SKyBTR/tnJpHbkk944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/pLcOe3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708064; x=1802244064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBZ7vmJOuXFVdEocUKywotsuTZKHpBEwnRySOMXd6l0=;
  b=f/pLcOe3zsUaXu3GlMgtti46BxdIVBuVyjO6rwvbj+KWwD9xoSY10gI/
   96i01ZEnr7UH58ZBXG6jUXqPKTjAE/YNCC2un3z47QBbcX0VsnSHzVQKm
   hjf/CPMky5jmBuA3NCSC74MV7sKVck1ThykWAGKblXeaNrMjpCKOmTW+W
   Os+vGGnacqb96AG/hi5taHF1LpedpM8GrXz+8503nu2KbWTZArMomEWOF
   1dSULFaTqfQ1yGlhyhJMv+XXmSE2pItH4LNuGxZpcScJIvq9pwAMcLqCu
   JcVdI8zBqf9KhU3lUzD9MlyUp+YRGfZeXN876Knd8QfHR8NHqaUr+KzUY
   g==;
X-CSE-ConnectionGUID: LOsoUTpiShqKuAbqy8dL4A==
X-CSE-MsgGUID: iqt0ZsptRSOtDV/ILkzMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89414238"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89414238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:21:03 -0800
X-CSE-ConnectionGUID: YtCzlq72TW+BC8VOT+lUBA==
X-CSE-MsgGUID: rEiM7InjQtaVWLV1ZmJ1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234791955"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:20:55 -0800
Date: Tue, 10 Feb 2026 09:20:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
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
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYo60vooftdem4Lt@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.alibaba.com,vger.kernel.org,foss.st.com,arndb.de,gmail.com,baylibre.com,linuxfoundation.org,redhat.com,lwn.net,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_FROM(0.00)[bounces-31543-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81292117DF1
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 08:51:46PM +0100, Wolfram Sang wrote:

> > > Moving maintainers from CC to To ;) Do you, in general, approve this
> > > change to the headers?
> > 
> > Certainly, I don't think we should force unnatural slicing of drivers
> > across the source tree.
> 
> Cool, glad you like it.
> 
> > I've always found the current model unergonomic, resolving this part
> > might very well have the side effect that Andy is looking for (and I'd
> > welcome that).
> 
> Yeah probably, but frankly the task of redesigning hwlock-allocation is
> a bit exceeding my bandwidth for this project. Can we make this a second
> step on top of this series?

How do you see it's done if others will (*) start (ab)using that struct
directly?

> And if so, would be this series acceptable
> as-is then (modulo the better include-sorting mentioned by Andy)?

*From my experience it's not the Q "will they or not?", the Q is "when?"
 they start abusing it. I really prefer to hide as much as possible from
 day 1. Maybe the structure can be split to two? Currently IIO has a
 (painful and long) conversion from open to opaque. Taking this into account
 I really don't won't to repeat this design mistake. But it's all up to
 the maintainers, of course. Just my deep worries about this... while
 the idea, as I said, I fully support.

-- 
With Best Regards,
Andy Shevchenko



