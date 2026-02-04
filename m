Return-Path: <linux-gpio+bounces-31442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ELsCzJxg2mFmwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:17:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE56EA147
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 451C4302256E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 16:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC46426684;
	Wed,  4 Feb 2026 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lirJICWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9071C5D57;
	Wed,  4 Feb 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770221825; cv=none; b=Xgk2s+X8GLKcJhlvf56trfSUSizjMg2hbn4nn6WFxaTkKCFLtwkkxn9AkSqnYSgYBpLbqotnT2MFR6dITFxA7lZ7OMm+yK4jjCSAWVQqGTUefYuHi7pmlFYOk3RDmB/EYjlDjob/t4SBSLxFtt2O/6v8/Qs68q/rpaJXwtLPLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770221825; c=relaxed/simple;
	bh=IcghZ54w5jFehAy4KhdaevfCZ6WEwvI3d61AEC2l8NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caD2nmkOn8plnLl5dy1e7pNAgvLFLAxXyYF3PQbyRamrjgHBR74zqiv8TiGVqWssNp/HTFdKVRQaz+yIqTTpbV3dddGHf2OwpgL2pyYqSqTv/xavr2JKaoMdI+FHUrnjyoEvbsrDEni5kNBt5dh5lbfLIsv0OJfEYeEcK4gaO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lirJICWN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770221825; x=1801757825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IcghZ54w5jFehAy4KhdaevfCZ6WEwvI3d61AEC2l8NY=;
  b=lirJICWNO27BWkWqv4pMGPhbFCDu9zkHmmKExQYKgGLruzySFDjv1MT2
   eWY5WpInH08hvAUsMyybUJfu6nxg9GWKVG8FqlyM226s23w7RMmfNlQ3T
   Ap6CBcr3TuzK+VVSfC1H63rztdNWk2BITv5J+beM7tCV/Be+hGYgBOAAi
   uCImhGu91grzr4cRYoeTNA5ZX9rrZNA8YPLOesXuwN0iHLX2ySHbM9p9D
   2zxAGx6EpNERttqCo0bNrnrFzJmQn+ApIVczv48mIYaRGazMvwqZHcvUW
   VoNobYYkkjAyMN6kGuWm3VDcKA87EhWjMpRw2yRMSfcsgA4yla7+3LvTu
   Q==;
X-CSE-ConnectionGUID: rzLG6ApdTfy64QAuNQVMNw==
X-CSE-MsgGUID: MU/zwvjIQ6CvcFqEw5gCXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74016665"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="74016665"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:04 -0800
X-CSE-ConnectionGUID: h0qBT9R/Sm65Ew0DhBZEFA==
X-CSE-MsgGUID: TfCa+Iy7QemO+kJ8lNsh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210227633"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 08:17:01 -0800
Date: Wed, 4 Feb 2026 18:16:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
 <20260204-credit-precinct-5424c122a79f@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204-credit-precinct-5424c122a79f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31442-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 9AE56EA147
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:50:02PM +0000, Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 04:26:29PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> > > On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > > > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > > > > Note, please, remove extra '.' (dot) in the Subject.o
> > > > 
> > > > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > > > from the function since the subject was really long, not referring to
> > > > a member of an ops struct.
> > > 
> > > Yes, and that's how we refer to the callbacks — with a single dot and parentheses:
> > > 
> > > 	.my_cool_cb()
> > > 
> > > Alternatively
> > > 
> > > 	->my_cool_cb()
> > > 
> > > but it one character longer and TBH it slightly less readable (I personally
> > > used the latter and then switched to the former in the recent years).
> > 
> > Hmm... My memory tricked me, it seems I switched to ->cb() notation, at least
> > there are patches with that from October last year. Whatever, choose one and
> > use it :-)
> 
> I think you missed my point, I was /not/ trying to refer to an ops struct
> member. For those I follow the first of the two notations you listed.

Indeed, for that cases I usually use and underscore (however it might
in some cases be ambiguous):

  pinctrl: pinconf-generic: move _dt_node_to_map_pinmux() to amlogic-am4 driver

I think it's possible to drop the 'pinctrl:' prefix, the pinconf-generic is
unique enough and had been used in the past a couple of times (yes, I know that
the convention is to use subsystem prefix).

Also word 'driver' can be dropped.

TL;DR: My point that double dots is confusing and non-standard way to refer to
something which is cut. If not full, ideally it can use triple dots followed by
underscore

  pinconf-generic: move ..._dt_node_to_map_pinmux() to amlogic-am4 driver


-- 
With Best Regards,
Andy Shevchenko



