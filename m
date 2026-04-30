Return-Path: <linux-gpio+bounces-35924-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEYwOf1T82mLzgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35924-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:07:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDC4A32A0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C64300A745
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC46340F8D8;
	Thu, 30 Apr 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRG20x3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67940B6F0;
	Thu, 30 Apr 2026 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554088; cv=none; b=bLe4Jl23SJT5P5FR8X8zQd5FP7HKVLjG4ZZtDd5Lxclo73Ia5tlRHrM4a9Dl6jkdr+4yudEhNyEWE5xCQjLcy0Huv++1l2yta4BzvXRGisj/MU+2PKEJLKH1UVsvHQQgjksjSoDpVkrVSNOPScqfjDbf+T0JWe7kagABJocEEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554088; c=relaxed/simple;
	bh=MZgJ0oBWrhy8i1yH1rGUVjfYjDAk40yvCjLYbXjWgTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4FCRSodAKU0SkNApfYrFoi7h0B8T1+uzv6uEGBtgn7QbJ62HX16cz08ZBx1MbAUMiwAaks0zlkppQSJdyRl9mWITME8HJAS9OeRqqWNNe0NfRFdQnPeoJqI39+NRq5dDet1Tul0gkTWM1cUo2cM+YEFEBCP2aZukkBVoWLCEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRG20x3q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777554087; x=1809090087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MZgJ0oBWrhy8i1yH1rGUVjfYjDAk40yvCjLYbXjWgTI=;
  b=YRG20x3qMNpTzuSvCCCyzJhNZXIWttMP0hyxLEPRW5ZzRXWOBpwLRwmm
   2ztjkfwRw3c7yhXR47VrAK6ElyLvwVZwnHMJRuCeFSQz6StNwW8bN2FwF
   t2/oZ6JbnhcP3WXEcHQ1rax6KL3hG2uCm4rt8tu+wgj/ufKOKKRa1pAV6
   nBi7xdXLG7ua1m2BDRNJlU5Ub1cLfah+doIqhsH5ioPUALpj6L+ma922d
   O8flL/tVu9Ul1y94wTpgSvQ8208217Kph2ciX2wbfz13oPXc7VoeFYCs4
   FGNtlC5W66uWRj30VNDlrTHsDx5x7suM3+cvG/6O7QeqanBiIMIYcgHU9
   g==;
X-CSE-ConnectionGUID: qnxgHchOR0OlNMbnF/0bjg==
X-CSE-MsgGUID: 2TfPKjfzQSyhX3IeVX0K9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89877496"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89877496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:01:26 -0700
X-CSE-ConnectionGUID: oq+UgGJGQSuAaaHPoJWDwA==
X-CSE-MsgGUID: c+4LrUYMSXmrcstSM8JCag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234467576"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:01:22 -0700
Date: Thu, 30 Apr 2026 16:01:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v4 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Message-ID: <afNSn42sB7sC_L9x@ashevche-desk.local>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
 <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
 <afNQbtmd3j6wG0iI@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afNQbtmd3j6wG0iI@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5CEDC4A32A0
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-35924-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Thu, Apr 30, 2026 at 03:51:58PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 30, 2026 at 09:34:06AM +0200, Bartosz Golaszewski wrote:

...

> > +	for (swnode = gpiochip_node_group; *swnode; swnode++) {
> > +		struct device *dev __free(put_device) =
> > +				acpi_bus_find_device_by_name((*swnode)->name);
> > +		if (!dev) {
> > +			dev_err(parent, "Failed to find the required GPIO controller: %s\n",
> > +				(*swnode)->name);
> 
> swnode at this point is registered, meaning we have an associated fwnode
> handle, hence why not use %pfwP here?

After reading the code again I think your version is KISS, no need for over
engineering :-)

> > +			return -ENODEV;
> > +		}

-- 
With Best Regards,
Andy Shevchenko



