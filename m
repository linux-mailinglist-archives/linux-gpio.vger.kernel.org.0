Return-Path: <linux-gpio+bounces-33337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPAzIffls2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:24:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7A28163C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 660BA3020FDA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867AE35B64D;
	Fri, 13 Mar 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRGBCLr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B53C2701CB;
	Fri, 13 Mar 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397489; cv=none; b=dtfT1OUIADDwsKoQ3rojXA4banNXaT0BNVL/S+wmu+qdSOf8m/s2A6M/GFWOyDZskDpm8pA5uukQZjEBIZKzayzy3xvXCNeWS60FaTyTFkmDFyb3GWoLu2XIuesjIjLm2gKZhKjNQV0DmeN2hRzi9zjL4U9kmfx4utXvalrOvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397489; c=relaxed/simple;
	bh=pSIXKeozInO15RHz115rssASIWuS1Lg0QOEw1OSDLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai1VK85edGVofsMxdHOak3bfrPl3LwmRkULd+qxaNAAhIvVrT7PoKB8szMeaCNpLHGlXjv3mXYao2gCvx+u3R2HeALbjbKDodshgI7zVn3pszm+hm/9+JVb+1Km+yVc1QEnk2oLDGS+XhqQAUKK45s8qiajJ4i5emZ4rqpekac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRGBCLr9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773397488; x=1804933488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pSIXKeozInO15RHz115rssASIWuS1Lg0QOEw1OSDLEY=;
  b=VRGBCLr9IGUGSy6JEOpnEmDW5pEClmsHlxhF6IOYkUZ0b90Evs9twDfV
   V0Ginqnd1EY1tCTKtmzCa1hbI+BhgXfAVOGq1Xie407JRZ7klTe46U5af
   bEJz0cM72b9M8ap6obciHZfBso0bqmgOQxQRF1Pj2oivN41ByiNOEDThY
   nGKVgvtjLtDum0H65PYER9avpqMJEDz7MEhcgcECR3soGY+ao5SDi9ORf
   n8DmDc2OWjuxlUcZf0e0ZPcKy8z6xH8DzcPG9wSoscpNXcBsGfaQLj4fv
   zy3NDqGj96bGNjzNGgB4zeVpAe2yO4KbMi+Fl7w6bMgbEOnQNz+i5T+qn
   w==;
X-CSE-ConnectionGUID: MbkUSt2uSNiGjiyzAHGvbQ==
X-CSE-MsgGUID: o0LnK3kfSWyLEhwq+ag6UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="73519386"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="73519386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:24:47 -0700
X-CSE-ConnectionGUID: YnDE8TLmSAedkwDYH84VeQ==
X-CSE-MsgGUID: rreKgpQESKSv9Gnqr6+4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="244146111"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 03:24:46 -0700
Date: Fri, 13 Mar 2026 12:24:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] gpio: timberdale: remove platform data header
Message-ID: <abPl6xTMhp4TuFeV@ashevche-desk.local>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-3-4df2e9b1dab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-3-4df2e9b1dab5@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-33337-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 02A7A28163C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:04:50AM +0100, Bartosz Golaszewski wrote:
> With no more users, we can remove timb_gpio.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



