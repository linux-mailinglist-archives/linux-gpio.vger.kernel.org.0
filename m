Return-Path: <linux-gpio+bounces-40041-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xI8zEcTyVWq/wgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40041-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:26:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6587525FB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=krzAGk1Z;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40041-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40041-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 840D630CF2AF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0143FAE0C;
	Tue, 14 Jul 2026 08:22:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DA3FB7F2;
	Tue, 14 Jul 2026 08:22:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017351; cv=none; b=Mu7xXdlkoRMoanavJCBgp2p5+qU3bOGNcwCgjSrJmW3mzPy/q5F317NM+pX0elqCOQK5y2lzPG/pwtd6MpGapRYl/+8/bpePdNeC93y15ZGa9iwor9Xx26a7rZEb61Xv/Gn+xq6Mp5tKZ+xtfK4Hnsw/WjtXjAGKOD+GMjrs5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017351; c=relaxed/simple;
	bh=7UwLK+REoWPC5QyjVTl/tTquK3kF5ZeLwwW6mmQ/+Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwCchgdueR6Ac6FtHI+Tt/8HFX/TtQo6BhB4lHIk2DJrV4Qa06UG+RIrq7kDAywjomGYTWvRqZCRaFaZvE9dLO2piVu7ls7rPzwQoQZ3dGCEI0FIaDwVzyov+jzk3Ompt62PDvZlgc08Ae1a5BFo3wYcupsFerJPX7D18FUiI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krzAGk1Z; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017346; x=1815553346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7UwLK+REoWPC5QyjVTl/tTquK3kF5ZeLwwW6mmQ/+Ns=;
  b=krzAGk1ZuSWqzAzfaBkaDo4U9yze79vdhLpp0zze7bCvlVljYW3QJBYm
   IFeZ/OzDUJKeVQLP+aEmND8yAxHZTLOadfqvTDTjz3E3R5HnoUw9IA4Im
   gEwYydqn7mbnsFzcTO6uSILt2WQIIBN4Zc3epalgG7jVp/kETYc15dap0
   2WMlyVt/Guq77If6GGPVHo1zhxw1jgclwYPrKGhibK8W7nA6d6v4qNZfN
   XC3jTrkVKwe1Kw71KogH5R5qA8oL0hbhSJK20M1c9vRg7ymPbUYqmUKfq
   3q4UwHhlBgna/tQDhlk+hvdgNL1FMZog2D2vX83+qCs5j74QAEUULJh6z
   g==;
X-CSE-ConnectionGUID: iOQ0BQsYRq6W0WkQp06Twg==
X-CSE-MsgGUID: lyuSyBP3Sge4JhAxkChkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84414527"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84414527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:22:21 -0700
X-CSE-ConnectionGUID: t6g0GdSQQiiVRRh0QXBjzQ==
X-CSE-MsgGUID: PJdBzF7wSqmJirbShV+8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="256444730"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:22:20 -0700
Date: Tue, 14 Jul 2026 11:22:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/20] gpio: sodaville: Add missing pci module
 annotations
Message-ID: <alXxuTVdAP7agxzS@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <40ab40117c9df840de84ccf0365044cf4f87d37d.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40ab40117c9df840de84ccf0365044cf4f87d37d.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40041-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C6587525FB

On Tue, Jul 14, 2026 at 09:24:07AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> A driver module matching devices using a pci device id table is


PCI

> supposed to declare that in the module's metadata. Add this information
> to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



