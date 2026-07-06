Return-Path: <linux-gpio+bounces-39541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioxKHeMLTGpxfQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:11:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE5715529
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:11:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=k8aIQtaa;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39541-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39541-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B150530143F3
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 20:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94263DB65A;
	Mon,  6 Jul 2026 20:10:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D723DA5DA;
	Mon,  6 Jul 2026 20:10:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368608; cv=none; b=J85qLupgbxrBBxLyqicjkAlBfTp1LEX+/d90g3ifkuDOu9P5YswX3GfAb22e8oLATCwlOuQ0DbOXWCRYXHVUyO7undValWx9zPMYwiZLjc3bkTD5j0LHXzBwKpfOeE4Zbkv3aCsRMyro9LWflXZk11SBBeqhvnx/+XQW5i+Kh4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368608; c=relaxed/simple;
	bh=ldkS6quYL+wbZMXQEB4I2LyPcjr/4m8xDdI3braiYSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6SDsQdYMt2mQpU6/39m8+WA0pQ91O0ikMoCxJFB7EeHFJ1emWyprZNNElIM1paGLpfgdvJyXzzmWJadCJj5ugx1565uqfEf172qhEHJ/Y8Gv1gDUGIDMG8GnjFoSooNVlhPpTA9ue+9I9Tf9cVeCo/gz4b1Mxp2D1ZXOC3LHDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8aIQtaa; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783368608; x=1814904608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ldkS6quYL+wbZMXQEB4I2LyPcjr/4m8xDdI3braiYSk=;
  b=k8aIQtaaTUkh3YkN9URH42N4MGXkDGMXAJVMavICzEFxHVR1KlySuN1S
   c7l8wN302iJMmeMCNVKSQEOsccbzldwrneb1F2FxveAIPMPzQPr0phHVl
   22ijqxHdzxklnLpSEXOaCV91iv9f401TreLyYhttI27ZIBvDQRD3SgtiE
   Vi0wcjZq3uPmjK646QlSJ7BAb/C43yklUxLu52H46GPCsYDOBafKEqTY6
   qn/0Ec1xKUz/tudbd50fvfZdz6DNxt6tr8anAuwrRPFX8+BnGXsWPX79o
   d6kHic7rVRXRwmGldkbeVjHY67zzxSvJsNjbWg8aq+FUmtl7PFfcLWpWW
   g==;
X-CSE-ConnectionGUID: U9OvCpGWTbi4zVZdnhHEkQ==
X-CSE-MsgGUID: porbr6vdSOeuPLfbwlwMPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95525123"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="95525123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:10:07 -0700
X-CSE-ConnectionGUID: NkPn3f94R++QcuJuCLmE6w==
X-CSE-MsgGUID: MZ/eYlPFRaeyA8oeT/40Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="257379314"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 13:10:02 -0700
Date: Mon, 6 Jul 2026 23:09:39 +0300
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
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink
 support
Message-ID: <akwLg6XiA6eJblH2@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
 <akKWGNpGmHjWYdfX@ashevche-desk.local>
 <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md1K_ZfO7pUANNhCkwEpmF6nX-Wo=AeuiO57hjKLtWDWg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39541-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DDE5715529

On Mon, Jul 06, 2026 at 08:32:28AM -0400, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 17:58:16 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:

...

> >> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
> >> +	struct gpio_desc *desc;
> >
> >> +	pdata->probe_count++;
> >
> > Even in case of error?
> 
> We're counting how many times we *enter* probe, so yes, I think it's right.

Perhaps a (short) comment on top of this line?

	/* Count probes independently on being successful or unsuccessful */

-- 
With Best Regards,
Andy Shevchenko



