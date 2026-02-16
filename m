Return-Path: <linux-gpio+bounces-31698-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMbWOgfKkmnOxwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31698-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:40:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D814155A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 08:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47693300F9D4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 07:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2557C2F261C;
	Mon, 16 Feb 2026 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgCCgt3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867022A7F0;
	Mon, 16 Feb 2026 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227646; cv=none; b=ocEKm0eypNN4dInfV5xiN1rf3IWbGtWzZheUrJllNG1SkX2CO/iHej5+OixMPH4pX4on6NcmIwco6lxryBsCF9apZzJEqWkjh6sQA3NODy/HxCdN9qqBWbRB3Dol+IwnNBi6x9fY0ZE8Q3FQPgvGMUofNC0JY7M5D5eXwiRl/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227646; c=relaxed/simple;
	bh=rzl01EmAAF3JPmfSnc9X96TJUHoCxLOHucj5Oexql0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTbyEPWIsUP0hoIgJ/QaI3UiD3L/cRunxHMH0FtoYg5h5RZDxXRmrXzZ5ww5+DKYuNB3P1rn11LtA7KCDsfof9yPSDx1EIR+BQzJkpA0RyGbObFOE23z41ga3Z/LwHArvGarrBgbwuYnnhTUiKNtqEOrPgr/BG3bTFUxAykq7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgCCgt3V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771227645; x=1802763645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rzl01EmAAF3JPmfSnc9X96TJUHoCxLOHucj5Oexql0w=;
  b=KgCCgt3VfhEuInO25UkPe+x+jVmUjtK3C3q//CR4xhyzF3TLv8N8XWbg
   E2Upvd4fzmLz1Z67LUtr3RW/vjBLglbSqAPN1NVO6/Mgz5yTUoPpfVhgu
   fNzI0nLU7fsnfcnHCq9m7ryPBCXJ3L54tBSMIRD0UXPnIiiD5V7Nvgz1V
   8J0+mlI9FlMnQv4wKXF2JFEg85MY/6dWVXgtOQAW+Si8OlMyMXjYDTu/H
   +h3o1GCVIVJeSAQiiE2B+sSvpzOvVPrVfPR07UUYI/ANDLGZcUjcR26/b
   rBFdZGEpDe/WnWH+0l534tLZOZUvuAP1XEMrmpCHQiGVqtgW1G/kCSDvY
   w==;
X-CSE-ConnectionGUID: mKqGvBicRjOtP+YpdW21Gg==
X-CSE-MsgGUID: GwkHxFmvRFScMvmQ0/EuaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="74904111"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="74904111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:40:45 -0800
X-CSE-ConnectionGUID: BH0UtUILRuu9c8XvwWIhyw==
X-CSE-MsgGUID: tFeetPcMQWKoSU6GurUL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="212096952"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:40:35 -0800
Date: Mon, 16 Feb 2026 09:40:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
	Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
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
Subject: Re: [RFC v2 PATCH 00/13] hwspinlock: move device alloc into core and
 refactor includes
Message-ID: <aZLJ8Z4XOTEUJfmh@smile.fi.intel.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,foss.st.com,kernel.org,arndb.de,linux.alibaba.com,gmail.com,baylibre.com,lists.linux.dev,linuxfoundation.org,redhat.com,lwn.net,st-md-mailman.stormreply.com,analog.com,infradead.org,sholland.org,posteo.net];
	TAGGED_FROM(0.00)[bounces-31698-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 998D814155A
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 11:54:40PM +0100, Wolfram Sang wrote:
> My ultimate goal is to allow hwspinlock provider drivers outside of the
> subsystem directory. It turned out that a simple split of the headers
> files into a public provider and a public consumer header file is not
> enough because core internal structure need to stay hidden. Even more,
> their opaqueness could and should even be increased. That would also
> allow the core to handle the de-/allocation of the hwspinlock device
> itself.
> 
> This series does all that. Patches 1-7 abstract access to internal
> structures away using helpers. Patch 8 then move hwspinlock device
> handling to the core, simplifying drivers. The remaining patches
> refactor the headers until the internal one is gone and the public ones
> are divided into provider and consumer parts. More details are given in
> the patch descriptions.
> 
> One note about using a callback to initialize hwspinlock priv: I also
> experimented with a dedicated 'set_priv' helper function. It felt a bit
> clumsy to me. Drivers would need to save the 'bank' pointer again and
> iterate over it. Because most drivers will only have a simple callback
> anyhow, it looked leaner to me.
> 
> This series is based on the cleanup series "hwspinlock: remove
> platform_data from subsystem" and has been tested on a Renesas
> SparrowHawk board (R-Car V4H) with a yet-to-be-upstreamed hwspinlock
> driver for the MFIS IP core. A branch can be found here (the MFIS driver
> is still WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
> 
> Buildbots seem to be happy, too.
> 
> Looking forward to comments. I especially wonder if the last patch
> should stay as-is or if it should be broken out, so individual
> subsystems can pick up their part (with a fallback in place, of course,
> until the last user is converted).

Coincidentally I have briefly reviewed it in the Git tree before you have sent
this to ML. I like the whole series, but what I have missed is the explanation
of the removal of Contact: comment in some of the files.

-- 
With Best Regards,
Andy Shevchenko



