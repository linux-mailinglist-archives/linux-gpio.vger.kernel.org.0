Return-Path: <linux-gpio+bounces-38262-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wUy6EMZzKWpWXAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38262-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:25:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F4D66A310
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 16:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aGwBMsDn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38262-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38262-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C31D30B7405
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 14:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA2C409108;
	Wed, 10 Jun 2026 14:13:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31446331ED0;
	Wed, 10 Jun 2026 14:13:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100819; cv=none; b=abPNtGxR04xbYxVbA2Z4yesFwrfcEwWj0VASAvqI9pohYkMPTI8QphqbkVlIuY/tWsfu2aOQsoeIuj2P1Vr/t2zyu1PWckoUgwKR6To4Q0/6v6jdvQ08hsfglGzFwXJpX8hoEwl/37dxGUlj8CoaUk3zFK4F5swVIUYqLZBxFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100819; c=relaxed/simple;
	bh=rSq7zMGhzypyCReEmlJ7mxuipxoZAj29BHuYX/kCQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8owjZBcrluoByj5SwcTQW8gBpAsXpOkgAidwl56ETfH1uP3NP4dE/sTY6JPaOII27Dxw2zniaAVnJcuji2eeUvTAKNTQgfGlJnWjA12/dGgq0E2O/brJbUGo/UPahFeayP0yd6xxrvODPCJrmHfvdVj7XJhcxJLrwr3TE/WdJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGwBMsDn; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781100818; x=1812636818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSq7zMGhzypyCReEmlJ7mxuipxoZAj29BHuYX/kCQ48=;
  b=aGwBMsDn6Fs+BaPEXuOlKuL7e6UA8YTxZbaDeJ+5YYt7WnqowcOqcQ3F
   0qIXGr7ZpKSZjzPtYZ1+oBG6HK13uxYOekN4yr35RBDN4KHW1U73k0hXX
   fnu+Q2GD+PW7KVFF9W48DsX/ZjGVylrW8y7Ns0BxioNuBOHeCVhNUEkLc
   CoNNjysDN65HkxLE+BFZ0LcXK01ukzf02Zum/GqAwnfcxuN5xlCLe+TqU
   QtlZ3BYfFBH0eAXJdHnLdEp++al5RSDWNrmvCmvRmyE3PAZCPoyutzDbx
   QrcZ4Eiz5UgkbeLTCslOaJbtdrB164SnX6nUJPN116/8qWHSwQN3D0Ulj
   g==;
X-CSE-ConnectionGUID: p8iGWhFdT5qYkZZPx9qb0w==
X-CSE-MsgGUID: s6B79jbOT72OzV39+Aalqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81635081"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81635081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:13:35 -0700
X-CSE-ConnectionGUID: lRS90UvWQWq/aprZVhhOGQ==
X-CSE-MsgGUID: lMSHVFshQsarH3zo2wmtfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243720051"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:13:32 -0700
Date: Wed, 10 Jun 2026 17:13:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Daniele Cleri <danielecleri@aaeon.eu>,
	JunYingLai <junyinglai@aaeon.com.tw>,
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] upboard pinctrl support for device id INTC1055
Message-ID: <ailxCrCYXPkrKqi-@ashevche-desk.local>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38262-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89F4D66A310

On Wed, Jun 10, 2026 at 04:34:22PM +0800, GaryWang wrote:
> Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.

I can take both via Intel pin control tree, just waiting for Mika's and Linus' acks.
Then I can send PR to Linus to (try to) include this to v7.2-rc2 as it seems close
enough to the category of adding new HW support without breaking anything else.

-- 
With Best Regards,
Andy Shevchenko



