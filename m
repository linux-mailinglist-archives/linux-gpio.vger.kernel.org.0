Return-Path: <linux-gpio+bounces-39114-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUidMvJYQmq55AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39114-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:37:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC96D9831
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:37:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PPRhueGs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39114-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39114-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46B3F30BA826
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA80403B1E;
	Mon, 29 Jun 2026 11:23:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636E403AF1;
	Mon, 29 Jun 2026 11:23:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732238; cv=none; b=nmbPkFaPtbrPtCBesPbcJsNa7OOzhTY/lEMxOd8SGcq5zWsukvS3b4K+ciDs7IMgRdECH5/KRzMdgeBF0c8K16dNZNGs5hQGbS3SGYhJOekNz6duuSU8pMLDpooRnhoTGjn7fibMm+LsPUVZHbZF+LyqdDkJol7GKdwf7mdKAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732238; c=relaxed/simple;
	bh=z+zWPxm3JBdhU/L5WtVYwuCIHZ488gQQa10lxH3MfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc9Zrgna+o+3mhBi3F7UBHGKqctp5Dn9ErP8/mVeMFwS9wAd1QzlkEMlG4wdwBr/OgxeymqL/uUwZ1Rs4ygsT4LEHAIVqRg/dBCNt9ZK4EFl2Y2VqngqUTGFwNgQlI7NqgH+Sv8lx9PG3WShi4OCaWoyMrwXhJVyVuLAcv/fw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPRhueGs; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732236; x=1814268236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+zWPxm3JBdhU/L5WtVYwuCIHZ488gQQa10lxH3MfSw=;
  b=PPRhueGsIgae11QAPgnQqge0Y45kTGi74BM+XCvuA/IPsJr9w6Oc4kVa
   vrgfQ6jCkZaEoVuFwvqgHIE7ahJZuwRjCVM6ngPjCYwZnPGMLl/jjZs5V
   ddlkfCBOwXN90zhFgdO8CnYdxOds/AvoN+6Sw+vmBkn+skG/pzvof9+Q0
   0z2U6VjtLS8BAd9yM6Hw3y7U8hcjXT5DCjXf1SWk5UwpkuOMIJqEtVpjx
   EEwHKT6naQ3tvL4Mx7VAmi+b25+Cf9qF2utBNTVlGGbz3SofizAXDFIr2
   s9a00XGrLCmM2dATiGf+Nundi0w8nwSHqP+HqDIVrPZ+XMMXFhy6cT47o
   Q==;
X-CSE-ConnectionGUID: 3EPU29jYSXOwnpzTPEu+iw==
X-CSE-MsgGUID: 1pjp/A84RZ+j9PWr2E6RLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83292444"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83292444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:20:39 -0700
X-CSE-ConnectionGUID: E/Z5r64PS/6YdODkz95kRQ==
X-CSE-MsgGUID: t/UIqA0pTvSS0IrkG6SvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252566664"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:20:34 -0700
Date: Mon, 29 Jun 2026 14:20:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] MAINTAINERS: add myself as reviewer of software node
 support
Message-ID: <akJU_1BS4NoLd3tV@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-39114-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09CC96D9831

On Mon, Jun 29, 2026 at 12:52:09PM +0200, Bartosz Golaszewski wrote:
> I've been working extensively on software nodes lately and introduced
> some changes. Add myself as reviewer so that I can help review any new
> proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks, I appreciate the move!

...

> +F:	drivers/base/test/swnode-devlink-test.c

This should be part of the patch that bring this file to life.

-- 
With Best Regards,
Andy Shevchenko



