Return-Path: <linux-gpio+bounces-38659-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vexyIuaSM2osDgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38659-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:40:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91869DE2A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:40:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cRMD+n+T;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38659-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38659-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D863064050
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17709343891;
	Thu, 18 Jun 2026 06:40:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2E23370EC;
	Thu, 18 Jun 2026 06:40:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764833; cv=none; b=j3fNKePMD8UUuqdIr21U/C1mCYWzu8TMjvDS/902Ba8n+naq537DjONaHyQ39xKKDExu268300jwOLtWjyuKIpP8wHf4v8Cv/EZ5iP671k3qiWWl4l1UTpYTW7YtJXp/MpmvxRvfyPROQpl0/0OantxO3b2stlQ+8kmCKvaptbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764833; c=relaxed/simple;
	bh=BumMsBSMG1s9RkeZoB5IVq+5GgZbpDM82QYWrngLh0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHkOEVGPCqgt19kJQ599+WxZVDc+odhKvM6xfIHJSNNHmTStypJjp2GbQoOIOhtrTXBig2DHs2FNfnDUG3WeFwCPQUtN/JAi7HX++tti0KZiNfgLN13Zli84z5ZVgAW061ot3bIvre+oA70i4Bvp2c7s1R25t5KRJDuudMMSTrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRMD+n+T; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781764832; x=1813300832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BumMsBSMG1s9RkeZoB5IVq+5GgZbpDM82QYWrngLh0g=;
  b=cRMD+n+TCBUEYZGcTEXskT9XwGj7BzP/QGvzIfSBJDw2JXwD8w/UZz5V
   QsyNlqaGc2FLSySliPVk1riCoRUJK9FrYq30otMHCI81Em5eTzD9MfXvN
   KilhV3751rR0aug9+aSaKSDQDF4IAcv7WL/0pYhxsmTB1aIaS5X1J6MpY
   Cu/5Om3LM9rtaA/1d/9jJx570tN0R31WANv8NV+3rxob3HLPkQ4KGHb7f
   pbvheLKkBqkgAOxsahR63TuLrEG5SUbZuiKm7JyOrqlyCokqEmNwUkeAA
   X4KhVKv97X5cr3by+kIJQNnk9fgx1Fk7mfV8YvCD6wxyJaXl8lQJzrW7f
   g==;
X-CSE-ConnectionGUID: dM3Uw8fZSpyfQyhq7Ght1A==
X-CSE-MsgGUID: nXTOOMkoQNCKJMH7yjPclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86504824"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="86504824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:40:32 -0700
X-CSE-ConnectionGUID: MB7qguYtRgqQyZ9s2rpayA==
X-CSE-MsgGUID: ZleeRUKyTEOdeByrUeHoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248371127"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:40:28 -0700
Date: Thu, 18 Jun 2026 09:40:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: sch: use raw_spinlock_t in the irq startup path
Message-ID: <ajOS2UR9pw_pUBxr@ashevche-desk.local>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
 <20260618062839.4o1ewdEn@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618062839.4o1ewdEn@linutronix.de>
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
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38659-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[seu.edu.cn,linaro.org,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,seu.edu.cn:email,vger.kernel.org:from_smtp,linutronix.de:email,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC91869DE2A

On Thu, Jun 18, 2026 at 08:28:39AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-06-17 23:40:34 [+0800], Runyu Xiao wrote:
> > sch_irq_unmask() enables the GPIO IRQ and then updates the controller
> > state through sch_irq_mask_unmask(), which takes sch->lock with
> > spin_lock_irqsave().  The callback can be reached from irq_startup()
> > while setting up a requested IRQ.  That path is not sleepable, but on
> > PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
> …
> > Fixes: 7a81638485c1 ("gpio: sch: Add edge event support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> 
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

There is already a v2.

-- 
With Best Regards,
Andy Shevchenko



