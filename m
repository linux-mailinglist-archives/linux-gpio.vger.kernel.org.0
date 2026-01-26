Return-Path: <linux-gpio+bounces-31091-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI39OG2Yd2n0iwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31091-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:38:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7708AC3F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E7A630215B2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677A8343D7B;
	Mon, 26 Jan 2026 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWiiKDrZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE723A58F;
	Mon, 26 Jan 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445443; cv=none; b=XRp7GlCXJZDS/ltE0u1WWQNT/k9jQ3mhYNVMLdKlRHcz6k0ZpX+73cwJ0vMWoSogqD1qQAe6Kf5kXL53bOBvtpgzvBNPIuRPHk2qPyRWXMQ5ci0jQAkAUn01ijqMOEPw9DZGc6MyrnNmFs7Vm87ZK2vkzv7/8k6GSkM1tIWEuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445443; c=relaxed/simple;
	bh=w52IMLwoLwGlpPxg2eBkjjVmeOSTyMPSwOuK4yJio5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRijh+GAL3Zp6BfToxNwOCCpkMiz/leZBMlOQ26KfrHDKkKZkElZ/pXhphrg5t/cROuYfzDEG/BGJIthqgnYNdqjZNscZW2IA5/tsK4ReE5yUV7iK2EOWCaJMvqGbhP0swqWzdrRGfoXkiiM4owP1Vp+5xzTx8H+kR30Itby9VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWiiKDrZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769445440; x=1800981440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w52IMLwoLwGlpPxg2eBkjjVmeOSTyMPSwOuK4yJio5U=;
  b=VWiiKDrZtNXKU02kuhtBgTj1OxjMAbC3JB+kelzlez1At0cuyxxly0Am
   evckVuMTAySXUcSxws0Pv9CHNV1NpF8QqHa1i8dKuH3O9fKf2+26UdMqR
   5j+OeEM/z79jtN2DV2myPx+P8WH01AsZmxQA6+mPS4PdR1HjW0tkIo76U
   drQlO+M8kQGOHv/f0SxKxUgvqWRkoymOo65eWBQLrFaOgHVYJL7ognPpd
   TOFpBbwidKwejHQb30jFV2jrpmXHuHI9grGmCqoasrO351R5oGsZ8FcQ3
   qd/IetRB5S0mbYqd+smpSf/okYns2hvwueZJRsRqtC03A4ik/iuz9w5/k
   g==;
X-CSE-ConnectionGUID: 10/yEBf3Ra2+nQNE6I1Xzw==
X-CSE-MsgGUID: +8bbVI/XQPWtwB2JgdC1fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69823617"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69823617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 08:37:15 -0800
X-CSE-ConnectionGUID: lY7+mdTrR2OYJ4CIw+N3dA==
X-CSE-MsgGUID: MmAensw2QXSMCGsOsFHR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212706452"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 08:37:13 -0800
Date: Mon, 26 Jan 2026 17:37:10 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Guido Trentalancia <guido@trentalancia.com>
Cc: andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	linusw@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: intel: Add code name documentation
Message-ID: <aXeYNiRrBvIwxCRe@black.igk.intel.com>
References: <20260124081708.1141884-1-raag.jadav@intel.com>
 <1769258197.8360.4.camel@trentalancia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1769258197.8360.4.camel@trentalancia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31091-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 6C7708AC3F
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 01:36:37PM +0100, Guido Trentalancia wrote:
> On Sat, 24/01/2026 at 13.44 +0530, Raag Jadav wrote:
> > Intel pinctrl drivers support large set of platforms and the IPs are
> > often reused by their different variants, but it's currently not
> > possible
> > to figure out the exact driver that supports specific variant. Add
> > user
> > friendly documentation for them.
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Guido Trentalancia <guido@trentalancia.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220056
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Acked-by: Guido Trentalancia <guido@trentalancia.com>
> > ---
> > 
> > v2: Also document for other similar drivers (Andy)
> > 
> >  drivers/pinctrl/intel/Kconfig | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/intel/Kconfig
> > b/drivers/pinctrl/intel/Kconfig
> > index e4dc9ba899bd..488344f53d45 100644
> > --- a/drivers/pinctrl/intel/Kconfig
> > +++ b/drivers/pinctrl/intel/Kconfig
> > @@ -53,7 +53,10 @@ config PINCTRL_ALDERLAKE
> >  	select PINCTRL_INTEL
> >  	help
> >  	  This pinctrl driver provides an interface that allows
> > configuring
> > -	  of Intel Alder Lake PCH pins and using them as GPIOs.
> > +	  PCH pins of the following platforms and using them as
> > GPIOs:
> > +	  - Alder Lake HX, N and S
> > +	  - Raptor Lake HX, E and S
> > +	  - Twin Lake
> >  
> >  config PINCTRL_BROXTON
> >  	tristate "Intel Broxton pinctrl and GPIO driver"
> > @@ -137,15 +140,17 @@ config PINCTRL_METEORLAKE
> >  	select PINCTRL_INTEL
> >  	help
> >  	  This pinctrl driver provides an interface that allows
> > configuring
> > -	  of Intel Meteor Lake pins and using them as GPIOs.
> > +	  SoC pins of the following platforms and using them as
> > GPIOs:
> > +	  - Arrow Lake (all variants)
> 
> If the next entry refers to Arrow Lake HX and S platforms, this one
> (METEORLAKE) cannot include "all variants" for Arrow Lake, I suppose.

And hence the updated description :)
It's SoC vs PCH.

Raag

> > +	  - Meteor Lake (all variants)
> >  
> >  config PINCTRL_METEORPOINT
> >  	tristate "Intel Meteor Point pinctrl and GPIO driver"
> >  	select PINCTRL_INTEL
> >  	help
> > -	  Meteor Point is the PCH of Intel Meteor Lake. This pinctrl
> > driver
> > -	  provides an interface that allows configuring of PCH pins
> > and
> > -	  using them as GPIOs.
> > +	  This pinctrl driver provides an interface that allows
> > configuring
> > +	  PCH pins of the following platforms and using them as
> > GPIOs:
> > +	  - Arrow Lake HX and S
> >  
> >  config PINCTRL_SUNRISEPOINT
> >  	tristate "Intel Sunrisepoint pinctrl and GPIO driver"
> > @@ -160,7 +165,11 @@ config PINCTRL_TIGERLAKE
> >  	select PINCTRL_INTEL
> >  	help
> >  	  This pinctrl driver provides an interface that allows
> > configuring
> > -	  of Intel Tiger Lake PCH pins and using them as GPIOs.
> > +	  PCH pins of the following platforms and using them as
> > GPIOs:
> > +	  - Alder Lake H, P, PS and U
> > +	  - Raptor Lake H, P, PS, PX and U
> > +	  - Rocket Lake S
> > +	  - Tiger Lake (all variants)
> >  
> >  source "drivers/pinctrl/intel/Kconfig.tng"
> >  endmenu

