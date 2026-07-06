Return-Path: <linux-gpio+bounces-39540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O/IgAO0KTGowfQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:07:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1637154C9
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JrIsNPYd;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39540-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39540-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B903A30242B5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 20:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810CE3D891D;
	Mon,  6 Jul 2026 20:05:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01B3D4112;
	Mon,  6 Jul 2026 20:05:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368352; cv=none; b=J8zm19DIsa5if0v4R5iHDxiH95v4yryflzlqeKES7xjlH5eT1wp2uiKsiEMTMUYM/CCML6svnUTLeSMWFn+00FdssbHVgu6zamQfWLSS5ovHELXBOyOukDnIOBaX+wprF00ivuh2+PWDiV9sSPnf+1ptkJL7AN3rF6OEwhHZL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368352; c=relaxed/simple;
	bh=A790MAqss06qaRLCi7RF7m28mRL3gUQB4idIsBO0Tcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdfEGOUlbj9fFFSLmhK6a7JcDZDeaxuKDBaoc439T8v3ONWFZCQGUZJbZgDc6Wc4hOtehWYlz1GOZf2hTlQZoqJvxbcJmLsIULEnDAfT/H9LnUSo1jlzOZpsSeg0+ABdFDbCD8xRSwLCbGJQH79IKXM6wYY7U3L8oBszmyoJ+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrIsNPYd; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783368351; x=1814904351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A790MAqss06qaRLCi7RF7m28mRL3gUQB4idIsBO0Tcw=;
  b=JrIsNPYdPtPez7WwiVHzOyf6GZbPNnaHGGSmrBTIEjmXjU7J0AbO2GqG
   6wbin4UUT9a4FK3lry56UerSfrZF8wqKjKHfxeEE4yDiVYVsC/QTCqvx6
   +e5W4fda1eaukfOewJbQkenj0KLBHjgfJyE/E/UMyX9asMZTuJswcKpmW
   3UMj3NoI9qKyoq67HbIN5CFLOAVMG9p1+2Ckq7S07Uw4LHaOY1VcwPWID
   begqVgVH9BA4IK0BIuYH2PkYP5DeuU/nkAHccBdjsMsHCLVIn0rnU5bsF
   VBKJMq/0KwQiBRFj3e366X8POhncl34EgXjQ4rd+octfvlFsg452pnoR4
   Q==;
X-CSE-ConnectionGUID: KvUVG+bsRwan38YyTeQVIA==
X-CSE-MsgGUID: R43lL2TeSy+zFOFS8wvfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84102831"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="84102831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:05:51 -0700
X-CSE-ConnectionGUID: HiYqsg0SS4+Gr6wTTThf9w==
X-CSE-MsgGUID: Qk7AXdh8TZW5ZPY3/rwsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="258717342"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:05:45 -0700
Date: Mon, 6 Jul 2026 23:05:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] software node: add kunit tests for fw_devlink support
Message-ID: <akwKlx2uTtHXI7zT@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
 <akKT8q5TjkMkZkmB@ashevche-desk.local>
 <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me4oJG47C2LOzRvagbEtAWKqbzmQ_R2VG4rt6zd1-QE5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39540-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,googlegroups.com,lists.linux.dev,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B1637154C9

On Mon, Jul 06, 2026 at 07:42:36AM -0400, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 17:49:06 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Mon, Jun 29, 2026 at 12:52:08PM +0200, Bartosz Golaszewski wrote:

...

> >> +	static const struct software_node supp_swnode = {
> >> +		.name = "swnode-devlink-test-supplier"
> >
> > Keep trailing comma.
> >
> >> +	};
> >
> >> +
> >
> > Redundant blank line.
> >
> 
> I actually leave a blank line between static, const and regular local variable
> blocks for readability.

As far as I know this is against the style.

-- 
With Best Regards,
Andy Shevchenko



