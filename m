Return-Path: <linux-gpio+bounces-36696-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LzRGgOKA2pN7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36696-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:13:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89B528FBE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9986130B3932
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E1C3AC0C1;
	Tue, 12 May 2026 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlpHeTUJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42133AB29B
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616790; cv=none; b=GpatMQugsD7Nw3Z+w3CBXW9i3nj66FHIn69sraUVRQXT0NKSwKtzDTuJCEhMKzb1l9hu+0XaqmLH4wv1Bx5BVOsxPZ7BC7hBjpjffOs0v9L1Q1XTKZhidu9xu4z90blQQKw/UA+WaNEZCRWNAiTSxJMyKyijoeXuhra8IpOBz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616790; c=relaxed/simple;
	bh=U6y8/1a9am4I5v8d1IIUJlQjMxoMQgCjZd9794OAhHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWQtLXl9Lc3dt7olrUnh0SWr++/Pt+1mkCYMAMbI6h/xrqmXuxLDdYs/jGg+RuMz1b/O5I8iwRv8wDCx8fYiCzfvRe5/rq5xcxFE8XLvfv3617OoyPhth738kU2g9mOSYkBwrybhS8BaODLasrn6pWZuSN1hcjJYfE1Cltpx9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlpHeTUJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778616789; x=1810152789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U6y8/1a9am4I5v8d1IIUJlQjMxoMQgCjZd9794OAhHA=;
  b=dlpHeTUJ5oW8xpMjPpz76ajA4a1rj0FPtKABRQmwzh9/3h1uoBkMzScn
   Vrbz2gT9XMSGmOr7di4QnDaToHNiQMF5dXhIqLMd/t7UhQYCJuURHVaWy
   mf146g6Ze3Iq/L8Ljple/eXbxJbmRdc+cI34Cj5FcGWkJL0Km/uTYMhDE
   jIYkM/xo1f2Css7EOYNKSDGlIktvIlDMvzW9Qx2bb56bUEj2Cq0WygwjO
   UrA6FB62ACg46ZLanElfu2zgRk0cHY7UEl/x4S6o09dd5JthbzjxBjVn+
   2CanyjykmgNPXL8Zm6HfIoO27/eGUc93Ot66AiqBlq/Xkd3JCaX4eWkGt
   w==;
X-CSE-ConnectionGUID: nmOtoOegTNax6W/hICe8kQ==
X-CSE-MsgGUID: 6AYunaCwSKa+A4BrUBqePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82104923"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="82104923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:13:08 -0700
X-CSE-ConnectionGUID: 7J3mwLtPSD+/7fZGBhHiXA==
X-CSE-MsgGUID: HQjHhj4MSYChlYApwvnoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="233402049"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:13:07 -0700
Date: Tue, 12 May 2026 23:13:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [GIT PULL] intel-gpio for 7.1-1
Message-ID: <agOJ0LrqDSbhHPi0@ashevche-desk.local>
References: <af18zdP5HF3_P9Vo@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af18zdP5HF3_P9Vo@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: AD89B528FBE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36696-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 08:03:57AM +0200, Andy Shevchenko wrote:
> Hi Linux GPIO  maintainers,
> 
> A single fix for ACPI interrupts handling on boot. Have been in Linux Next for
> a while without reported regressions. Please, pull for the current, v7.1 cycle.

Bart, any issues with this PR?

-- 
With Best Regards,
Andy Shevchenko



