Return-Path: <linux-gpio+bounces-38625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zk04KhNWMmosywUAu9opvQ
	(envelope-from <linux-gpio+bounces-38625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:08:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAB697702
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 10:08:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=liZygvKI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38625-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38625-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67AE430DE2C8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C993B38AD;
	Wed, 17 Jun 2026 08:04:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439AD3B7760;
	Wed, 17 Jun 2026 08:04:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683495; cv=none; b=SjOWotEfwG123HZ32TIv7DZD8AF4eZ1YrfIRZyqyJavG1pWUa3Q+2bhUd9if9yE8hBhmqTW/aE21/QSC43KHIrP+o6MIvg8QrW1LnqztEyI4V4kLhYDoP6IIcsR9T3yVnGMvLkRti2vG/HQ4cL4fY0W/5rAauSSqmz7cmVFq7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683495; c=relaxed/simple;
	bh=m5bmC47bKBFPa1xRjwYqCahbmvEvgk7hVxTZoICa9V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8WKfKE2H8BCs0KYWcTAXJEVFLA6p4KizM8Z6yzekiqf4eSyCZmBBbwOzS1fU7hEmprqVIBlF9DlZXgHXJK2Hr2Ndv0elGZ5f66p9iAmsDq81xEK4XNfVfrqaDCUW5qC3PBofCe41qKLSG/ekm02VdINedUK1cHR2AZm00MeUK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liZygvKI; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781683493; x=1813219493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5bmC47bKBFPa1xRjwYqCahbmvEvgk7hVxTZoICa9V8=;
  b=liZygvKIYV2NVAjoArOwzeqJBpr6BX9Ov2XDzcWvyVHmI44b9RP3+skG
   2WNPTK8jz8evfDQocO54BRuWpUTFdaQ4QTtuF1KFN3fVcTm+cXak6Rb8k
   OE7y6nr786k4MYa96d7jgL59QQbDYOSUSE3Gza5Yglzap37jSIObJXTVx
   /BMuIdybQxmyiFHAdDAlb/UG0AA4uosfxoHzQOY0AwvG4lBGEhI3rY1ke
   mD8xj5BbInmMWsISA6Zky6jLpZdm3+5/0z4Jx4DDfV2w1VJ/7ECFuEtTG
   uetYs4qpL7iCU/QlQ6ogAR14Tf3uT8Mqvri/EoHn7ygf9LW4JTtcSY+3m
   A==;
X-CSE-ConnectionGUID: Qu1zpMkpQNqCoKy+W2YuvQ==
X-CSE-MsgGUID: OAO6mLj8ShiqcZfHF2aLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82348289"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82348289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:04:52 -0700
X-CSE-ConnectionGUID: DawnT+jjTMSSwh2YZPF/gQ==
X-CSE-MsgGUID: 7afX6aHYReO4XirZknhtKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="272063576"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 01:04:50 -0700
Date: Wed, 17 Jun 2026 11:04:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linusw@kernel.org, nathan@kernel.org,
	chaitanya.kumar.borah@intel.com
Subject: Re: [PATCH v9 0/2] i2c: designware: fix WACF2200 touchscreen probe
 ordering
Message-ID: <ajJVIJuBWk7Vapxt@ashevche-desk.local>
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
 <ajJU2wnx5wS7zmJh@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajJU2wnx5wS7zmJh@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38625-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18EAB697702

On Wed, Jun 17, 2026 at 11:03:44AM +0300, Andy Shevchenko wrote:
> On Wed, Jun 17, 2026 at 12:29:20PM +0530, Hardik Prakash wrote:
> > Patch 1 reverts the broken v8 patch 2/2 which caused boot regressions
> > (NULL pointer dereference and probe deferral loop leading to CPU
> > starvation). Patch 2 is a corrected resubmission addressing all issues.
> 
> When preparing patches, use existing tools. This series was half received by me
> as the second patch has incomplete Cc list. You may use `b4` tool (check in
> your Linux distro) or my "smart" script [1] which I use on a daily basis.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Ah, eventually got it. It was a glitch on my side, sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko



