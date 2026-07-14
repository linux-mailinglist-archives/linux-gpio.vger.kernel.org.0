Return-Path: <linux-gpio+bounces-40043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0P6MHFLzVWrrwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:29:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE0752648
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:29:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=S9VkOn4H;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40043-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40043-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E9BF3139004
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A113FF1AD;
	Tue, 14 Jul 2026 08:24:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3233FBB6D;
	Tue, 14 Jul 2026 08:23:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017440; cv=none; b=KRq150ZYWX3VHW1FwuOS/TCnWrz6QdzOh0TB22IQpOgwnydKtaDoj8JDB1xSzvuLg8drAc90Vf8rR/x3j+6zt7WBTAwPD5B/JEth8I1FCzObVVOMBcM/9L/fGLdfquj1BhaAl45GN7yEklIgs1ANBhJmHeuad0N7D32Hv1vQ7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017440; c=relaxed/simple;
	bh=P/hsEp30A55bn738peV2azQ9Sq9APHBY5LiVcEcyrCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ9zB2TPcmym/T0uxudelTdCIQBP7X3m3WumHEcaJDBGvNbygguRf8epO8yI6k3nLPnrgdOtUFC+cLT2nV33YK5Twvz3U2Wp99DOtrQ3PHuz4K60BR498qqs6TdJksUOxFEWLr0UvmX9r8EAhDSFmIwpH4qTBX728dPP9nR4pPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9VkOn4H; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017433; x=1815553433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P/hsEp30A55bn738peV2azQ9Sq9APHBY5LiVcEcyrCY=;
  b=S9VkOn4H1DBDKnIpnNqN4XBA2lGdRh8/q6QhZ5x8dRd1B4/1hPwLwaJQ
   ihudKs1GeVVw8XLpip1uoqDDyMnuVlC1jgletsQnNaWfKDJ29hTwzrT+E
   u+FQcFdtXhHeLgl4MTafP/TLa2EUtzciSzZRoay2eyf9FBCoatG7U7jta
   xO8NDOxwePTy4jDNPRkcIitb0WpE2sPkZhgh/x9WwhaLqkovv8nVFee9o
   pvSwMX1hWxJ+k6VaBPL2K/+ql3aIJkW8TRyLOH4/fhu4lOqMioy6H3efZ
   I0Vu5FO0VH5Eq9Fj6fhKPD2w4W4JuhU4f/f6n/yDCrSzcAuseInxXmgN+
   g==;
X-CSE-ConnectionGUID: Mep8YzpFR8K+KdAUFCBQeQ==
X-CSE-MsgGUID: U88ozrlMS8adDwwr2vUKpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84514228"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84514228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:23:48 -0700
X-CSE-ConnectionGUID: 5irz21dzQCGgHOUt1xV9gQ==
X-CSE-MsgGUID: 35Y00WJ4RVS2/ImC0Y0qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280215758"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:23:46 -0700
Date: Tue, 14 Jul 2026 11:23:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 09/20] gpio: Add missing dmi module annotations
Message-ID: <alXyEPWUS5cJg6Jb@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <eb1fdcce0f07e274e5590b8821d9dd7835f1ce0a.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb1fdcce0f07e274e5590b8821d9dd7835f1ce0a.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40043-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:westeri@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBDE0752648

On Tue, Jul 14, 2026 at 09:24:10AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> A driver module matching devices using an dmi device id table is
> supposed to declare that in the module's metadata. Add this information
> for two drivers that failed to declare these.

No, it is not supposed. Why?

...

These are quirks and enumerating by quirks sounds weird.

-- 
With Best Regards,
Andy Shevchenko



