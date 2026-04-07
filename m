Return-Path: <linux-gpio+bounces-34815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JyQAyMN1WlQzwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:56:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9763AF921
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 15:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28ACB30CE86A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 13:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BF63B584E;
	Tue,  7 Apr 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg7BNpWv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E32222AC;
	Tue,  7 Apr 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569661; cv=none; b=M+7N2Pwol1lFE2Ogdw6k1Jjp5hrL4ZlnIlh6u+Pc38OLiLAWWmfX2/TA68jJJr2R64XckQhMSbnFgllB9DJONSvsej0JTRBNW+Kv6cwLxEkHUbdDZ3y/JNnd0mH/+hc1BQ2hLgK2Hx0qYApMXtO9R3Zjo5kxlmBTbaHFDapzdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569661; c=relaxed/simple;
	bh=NO2i62UYlO6ddKgbEZAUCawjWBgQw2MTuKaUmQ0/f78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9NYg2wxel/E2SNQ8K91i3fKQYOXgkFgnzpFADIdAQDghnCa+8MPfwxG0EvMsmCTHTJz3ZtvQ8SmZWReBPkoX27tCl5wnOSQczSZCadhaDEMBMLpSgDgvPJ1ym0W8E2qE3sdXbs64gmCzfjTRAUR05XwTMJK9qP4cPlglxC5MtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg7BNpWv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775569660; x=1807105660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NO2i62UYlO6ddKgbEZAUCawjWBgQw2MTuKaUmQ0/f78=;
  b=Dg7BNpWvWgvDPioZdb1tuHeoX2Chy9LMr6xf9JrYYqMcmF3MFxaHmHRI
   pAOA44G/2t8W/Dz0I1193Q91/B01h9azTGFGRr+Q/R1fPRBdfUZo8dtxM
   UWAWGAsbQ2uBOesfH9GlNvHQpHR0DLJneG/wkgdqhPAdPrGDcWL7Aksli
   lZzxm7awLfyD+P49jOnZvsaH6Wty3f1ZWPW/DMg1TAEsMnTNk187WkN2m
   9nHE+uJKEIygRcA7Zt9DS+X+FO9+hYt9Pp7i/5YMlg2KF++3FUgUcjR0e
   M2bTR4/TNkbtwkLBl2MBbzdYb4rISHRSTDr4Gnta1zvPD+DEL4BiCCIKV
   A==;
X-CSE-ConnectionGUID: bH1HvhYjS6CwYyu31qYcAg==
X-CSE-MsgGUID: tZjdbdygTPOBM6Vpr1V6UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76544899"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76544899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:47:39 -0700
X-CSE-ConnectionGUID: aYc0XUMCS+SUjJs+wS+vWQ==
X-CSE-MsgGUID: iUczbetsQq+uFftphdUKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223871549"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:47:36 -0700
Date: Tue, 7 Apr 2026 16:47:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Dmitry Mastykin <mastichi@gmail.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	Arturas Moskvinas <arturas.moskvinas@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andreas Kaessens <akaessens@gmail.com>,
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
	Thomas Preston <thomas.preston@codethink.co.uk>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
Message-ID: <adUK9YgJoBKY8fsm@ashevche-desk.local>
References: <20260330161914.1071118-1-flavra@baylibre.com>
 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
 <e66a4241ad77859921a4562dec17ab932cfd79b0.camel@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e66a4241ad77859921a4562dec17ab932cfd79b0.camel@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,svanheule.net,topic.nl,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34815-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.970];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6E9763AF921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 09:50:39AM +0200, Francesco Lavra wrote:
> On Tue, 2026-04-07 at 08:58 +0200, Linus Walleij wrote:
> > On Mon, Mar 30, 2026 at 6:19 PM Francesco Lavra <flavra@baylibre.com>
> > wrote:

...

> > > This issue has always been present, but has been latent until commit
> > > "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe
> > > and
> > > switch cache type"), which correctly removed reg_defaults from the
> > > regmap
> > > and as a side effect changed the behavior of the interrupt handler so
> > > that
> > > the real value of the MCP_GPINTEN register is now being read from the
> > > chip
> > > instead of using a bogus 0 default value; a non-zero value for this
> > > register can trigger the invocation of a nested handler which may not
> > > exist
> > > (yet).
> > > Fix this issue by disabling all pin interrupts during initialization.
> > > 
> > > Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at
> > > probe and switch cache type")
> 
> I realized I put stray double quotes around the commit hash.

Also you put way too many lines of backtrace. Submitting Patches recommends to
leave ~3-5 lines only (the one that bring value).

> > > Signed-off-by: Francesco Lavra <flavra@baylibre.com>

-- 
With Best Regards,
Andy Shevchenko



