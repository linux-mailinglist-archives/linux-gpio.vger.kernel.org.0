Return-Path: <linux-gpio+bounces-31244-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aONvK4sPemmS2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31244-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:30:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41DA22BA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FF383006B42
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73023355034;
	Wed, 28 Jan 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7Vkt8u+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EECA3542DD;
	Wed, 28 Jan 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607046; cv=none; b=KZpdY2OvBQyFd5qb+3gM0TozIbcVWBaJ7SHhE+rDfwlJKAXgMwg7oCDnyrwHgMInHquzm2X0TAcCfpS7BY8OwBc+vKhXPJIVdmjuRYSDRtDciXMiExnjecvKlSVSmpqftZWMsVP2PCs871bxALoGdE6fwTtl3S1IPZ63G034HeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607046; c=relaxed/simple;
	bh=IDYHDopI3+3e/DN4UhXY1TbLHXHicduyojfH6SkpXYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICBy5GQCakP9OeKE+v1ASZ3gepcCDYOyYcuR1l2c1pkSRVaQmZ3FIa3nDf6tZV55gkw76pohA6Pzx2mIp3IL17c1ywiNbEGmM7fDbTKoShPM3rXN4U7xgnJVC40meTYefNC9VDfjnQEOoOqoSYh1BpFu+VVIOvZmPfImupL9Mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7Vkt8u+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769607039; x=1801143039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDYHDopI3+3e/DN4UhXY1TbLHXHicduyojfH6SkpXYk=;
  b=E7Vkt8u+iXF2LVX8dCcQyu6+forvyoYd59cEwWxBYB9eKSI6SIYn3TqZ
   YsWNtMFwfyQXujKfvvwHbsk5w6oPbyrz39hMTmi5XtUtNC2hwXF6YJ8av
   up0bx4wQ0loXATYIh1H+VkfBfkOXLgl4hEtiTbZBvCciONgbmhF7LJKvq
   LPQ4ps3iObBalPqw8c5lzHBDmMXtcsR3iGFdy5DL/u0No85Rt5vBTCHsS
   IeJd5Na1NgbNwh6Y3ji7c1jErZdopFQbq9IB3y1jcC/wxx6+rmi9+jFd9
   8pWEi9+TG/kXptsJ6kMit/f21e7Aj0w5Ya/z6y9I2atQgiTuvBCXffynY
   A==;
X-CSE-ConnectionGUID: NJ1LPH49TEqFDM2D7l7Kbw==
X-CSE-MsgGUID: rT7MkTKQSCWLWWmnYVAang==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82184984"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="82184984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:30:33 -0800
X-CSE-ConnectionGUID: pUF+UhNpQ7yTUx5Sc6mAxA==
X-CSE-MsgGUID: DknCndgcQMyzHynYUUCfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208336215"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:30:31 -0800
Date: Wed, 28 Jan 2026 15:30:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1 0/3] pinctrl: core: managed resource handling cleanup
Message-ID: <aXoPdC3AM0L8Ozkj@smile.fi.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-31244-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E41DA22BA
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:32:05AM +0100, Andy Shevchenko wrote:
> I have stumbled over low-level APIs used for managed API implementations.
> Here is a clean up along with a drop of some duplicate messages.

Thanks, Bart, for the prompt review!

Linus, if you want this to take via my Intel PR, please tell me, otherwise
I consider you take it via your tree directly. Whatever works for you!

-- 
With Best Regards,
Andy Shevchenko



