Return-Path: <linux-gpio+bounces-39122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OfuqOV9yQmrL7QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:25:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056E6DB2DE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:25:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HzsTFNc2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39122-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39122-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 662B230FF7E9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9F6407CD1;
	Mon, 29 Jun 2026 13:10:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92940DFDE;
	Mon, 29 Jun 2026 13:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738646; cv=none; b=Pb3mudgwYMSI6MrhZ13d6Qgt2anJ9Jj8OZaPV/TUneWOthlCf8fTcdEfykdkbL1eJf9xE6EsrY5ycKSK0H21GRxpaI6x8/EMUZdKFp5Q1j2NGR+3XBlldSEaWJNY4UszUXkKeyXE3qa8gRyS7iHRBsuiZzxOxeMIYrf9wcxoY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738646; c=relaxed/simple;
	bh=+SZHj6c3TR75LKCepf8zLyR5T3pu8Wtz4kCpkODb+oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd+8HoEMigDoqDtCS5fFi6dzgZIc9wHlYT9ZVzCUA5gaFNGPG9rlH7hYvSlf8ZCJy+OIqTZrHqKKpgXmsCLTNfWb2vxsn8Muf543FbBEC9jeBlpi+RGcm54Y9rGvTUlfRS//5rtnFzqGUcYNK0sOQnFrsLawR+31g5U+6fforw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzsTFNc2; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782738646; x=1814274646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+SZHj6c3TR75LKCepf8zLyR5T3pu8Wtz4kCpkODb+oY=;
  b=HzsTFNc2vtdtrnz6AzF1u/FOJ7pzqMZuJkwS2Hpdj7eDAT4dOlezFVhB
   uEbLjqAMME7OVE6/n0T2IGVT/gqHtnh0buNYy8shwLkG+F5bqpWHl96hl
   L0IJUQJMczFHkY0dK7J8DwebNRMIkj3b9uuLT/lop8otTArJQD1J86RxO
   JC3kNdQIcQ6QGVFQP/uSqGRaEezSbf17x0jOkVHx317NZn6hl0ydFGkYj
   2biwZwXBURfea1RXQJpX9SZkXrREWA7LgeJKwvt2Aa58RjK0NaBCVNQPg
   LKFYc6LK1Bi8zUdBEVvM9PxuPWc/dxhEdBw9Dda0oTRF8TUFqRV5cKIOK
   Q==;
X-CSE-ConnectionGUID: d3bDQ6ENR4+LxPKimBx6Bg==
X-CSE-MsgGUID: LrLb7Uz3RveiqoEoSize1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83431957"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83431957"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:10:45 -0700
X-CSE-ConnectionGUID: Rc8lBtZURA+PGR7GzXT3tg==
X-CSE-MsgGUID: bbzexMOpTAWn+oUvR3iO6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="245592396"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 06:10:42 -0700
Date: Mon, 29 Jun 2026 16:10:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
Message-ID: <akJu0EFRFUjxaq34@ashevche-desk.local>
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39122-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8056E6DB2DE

On Mon, Jun 29, 2026 at 12:54:58PM +0200, Bartosz Golaszewski wrote:
> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
> swnode: don't use the swnode's name as the key for GPIO lookup") tried to
> enforce this but had to be reverted: it broke existing users who abused
> the software node mechanism by creating "dummy" software nodes named
> after the device they want to get GPIOs from, without ever attaching them
> to the actual GPIO devices. Those users relied on GPIOLIB matching the
> label of the GPIO controller against the name of the software node rather
> than on a real firmware node link.
> 
> All such users have now been coverted to using attached software nodes
> via the fwnode address lookup path and the kernel documentation has been
> updated to recommend it as the correct approach. This allows us to remove
> the old behavior.
> 
> This will allow us to leverage the upcoming support for fw_devlink for
> software nodes in GPIO core.

I am in favour of this,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
(but I prefer cleaner diff, see below).

...

>  fwnode_lookup:
> -	gdev = gpio_device_find_by_fwnode(fwnode);

> -	return gdev ?: ERR_PTR(-EPROBE_DEFER);


Can we simply leave these two instead?

-- 
With Best Regards,
Andy Shevchenko



