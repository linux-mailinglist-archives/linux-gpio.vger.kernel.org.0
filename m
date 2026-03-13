Return-Path: <linux-gpio+bounces-33336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEDcFePls2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:24:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C71EC281634
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4632C30233C2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFFF37881F;
	Fri, 13 Mar 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObhtbdAr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2E52701CB;
	Fri, 13 Mar 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397465; cv=none; b=FG7H3tEkidS+xB55tOGvmtO/wxOWQ+cQ3tocB1rFzgZl0GGQMM2VrEOhlWbvFbbC2+axlbacObBNhdfZ/N28TnerseAbT9ldohBmW3lwsJr1dN37XJ2Er399TTltAF7dGMr1yAJgj97m1CPBEEG8dgar6yT6jIGzAsNy5rmE2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397465; c=relaxed/simple;
	bh=xAZjZ10ZlHNmqU2FLa2mn3XcOc3YP87Yzq3JlPac0qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovwnKBC1zOPMPfbkTVH23nFA6KHjob59pYMzxl2qSHRkrMigab7QDXOOSHDHHvRznPTBfjP9M0GZJAGHsJKh84+Z+KnC9A8Bqwo2Dhj27DsN4jPhuEq8sD4KQ2XgUsTWEvOAUOGCeU4fwzfBjCn+GMVsy8mqBqkahSB2HuJJyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObhtbdAr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773397465; x=1804933465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAZjZ10ZlHNmqU2FLa2mn3XcOc3YP87Yzq3JlPac0qA=;
  b=ObhtbdArhsoQHiUZomeKaFsSlmlcwUPkl7tJmvNMa7PIBvslFCQgP+1N
   YmdCXAVsa2DHpCzEy948/jcTCTVGECrHE4BsCvmhgqC+eVym+WAXfGeBi
   8d5u2QT34RyFbQy8UIY1uhUUL6oy4ntMGd/+XZPCSqaCu/hrW5oQ/N6IG
   gSdeChLRKJnMKlXcIPdEOX02C2RJquoybzMZ6mofXqW/0lM8YLVPJ0jsM
   wQONE4c19UYXVH2e2zvVh+qmTDu/1McUKKXvDTbYFBALj/EmLmF3BlDsO
   5tr7oukeP8oN8vO6AkjAZD/1Q44xAP4LfwDKJdKzyk6nHzgn2W6BqCKAv
   A==;
X-CSE-ConnectionGUID: CLp4m3eMTLSg0SKDZeDt7g==
X-CSE-MsgGUID: YdqeHnrVQOOBuWc1/XKDtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74691062"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74691062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:24:16 -0700
X-CSE-ConnectionGUID: qAvCTNe1SOCxev3zuVotOQ==
X-CSE-MsgGUID: 2bFZbK2FTfCJH8ncITBpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="221073829"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:24:14 -0700
Date: Fri, 13 Mar 2026 12:24:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
Message-ID: <abPly5ZYd1M_HD5V@ashevche-desk.local>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
 <abPlPQMPZyOL_byn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abPlPQMPZyOL_byn@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33336-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: C71EC281634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:21:54PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 13, 2026 at 11:04:49AM +0100, Bartosz Golaszewski wrote:

...

> Shouldn't this be done in the respective callbacks before the
> devm_gpiochip_add_data() finishes? (Yes, it's not related to this
> patch, but it is related to seems racy driver initialisation.

And with that being said, wouldn't be better to move the driver to one
of the generic library (gpio-regmap / gpio-mmio)?

Also it mentions FPGA in the header, I am wondering what that FPGA is.
Perhaps we have already similar driver in the kernel from the FPGA vendor?

-- 
With Best Regards,
Andy Shevchenko



