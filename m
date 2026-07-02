Return-Path: <linux-gpio+bounces-39360-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QyU0NnMoRmpOKwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39360-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:59:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1656F505C
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 10:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GcAADfa2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39360-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39360-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33DAD30434EA
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7152634DCD6;
	Thu,  2 Jul 2026 08:55:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437B3C73F7;
	Thu,  2 Jul 2026 08:55:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982559; cv=none; b=T0Qwg53MiSU06865iWTCEoUeccGTU4WqEIKctZvq43/zqcIBe8VThlXFFKh9I/fSrjf6FRUGGPsE9BNCOZshFrZIfsYUM6yACfqgvO6LE+pDxY9oaFDC2v8vKHFV308auZ3iHvLwGvazI0WMpM5fMUTlTILN8ZSOKbkFILxMt4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982559; c=relaxed/simple;
	bh=hDpmiqPBtRKVXqTxhAFqcbRY5eWJ267eKOS2nw9o3JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6pK2bTRG0gAvwENJvUgt9DsDh69MuoS2sputWjDtDKWgou99JQCnQ5Y5R6zc8Z9fwsGQ7FllOq0NeITLDlTrM8Cuq49Sk4m1IMhnW/TpouNKo7cmKmIsc8srRQ9raPTLbB4K43WCtY21ee1MD9eaa8Nh5N9rn1AYCsSwL6UNPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcAADfa2; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982558; x=1814518558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hDpmiqPBtRKVXqTxhAFqcbRY5eWJ267eKOS2nw9o3JI=;
  b=GcAADfa21wHxxqoybMUktZkrJw4DuzrSIcsPMRup281Y1Gc19I3kslND
   Lrz4HVAXwTWHH75NVHabIMMMx0LpCO0b3Nu4lKPuFTP9+BXz86GoZoQCC
   +Dx3ocwPbXU2Wd99atB/K71qVp4yRK+psW1zLdpA3eCyqMPm4WCuJFWiH
   J4eZLwrNOB0+W6sw2WAjDWgNGOT0WoWbTNNnC/2emvwfsPA+Mu4tM/EhV
   pBqWa/4676Inas/kbHEWURqlVWtmhITBNG+PReOmP1fMyz17OvPNiAAHu
   5USD4zUHipYzbJiEopY0eHQQc9/5L4Iddv7v60npbUHzQJyZnog4rb5Xq
   A==;
X-CSE-ConnectionGUID: RSPcuZH4QkeoQ/6htXwnKA==
X-CSE-MsgGUID: 6ye009nPQyWi/Xzmxoz66A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101271983"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101271983"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:55:57 -0700
X-CSE-ConnectionGUID: YXNgbGFuQRexWYihLBTsHg==
X-CSE-MsgGUID: s8YT+l/2T+qfkOFT8aZGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251755133"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:55:54 -0700
Date: Thu, 2 Jul 2026 11:55:52 +0300
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
Subject: Re: [PATCH v3 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Message-ID: <akYnmNdvTXTffNbH@ashevche-desk.local>
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
 <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-1-e6bda3032914@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-1-e6bda3032914@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39360-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A1656F505C

On Thu, Jul 02, 2026 at 03:10:38PM +0800, GaryWang wrote:
> Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
>  for device id INTC1055.
> The pinctrl-upboard driver set the correct pin function corresponding to
>  these data.

Please, fix the indentation and wrapping issues here. For example, you can
use the following version.

Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
for device id INTC1055. The pinctrl-upboard driver set the correct pin
function corresponding to these data.

-- 
With Best Regards,
Andy Shevchenko



