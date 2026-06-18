Return-Path: <linux-gpio+bounces-38660-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id waqSJlCTM2pZDgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38660-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:42:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A4069DE5C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:42:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PQOEOGPr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38660-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38660-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E736E3032995
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB4136C0AB;
	Thu, 18 Jun 2026 06:42:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172E370D45;
	Thu, 18 Jun 2026 06:41:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764919; cv=none; b=Wp+pq7BobzGSS/u3FWpTSjnZi3z6FXeMwM+0dSDtwZsI7gyfV0reR4VzhnPT00wZnZSLFvLSxbA1glqIy/nK/PttIxdYYhT/FdVM2dVvESPwas09vfL4ecSRit5jdeurDngPmv2iI6m4+CCuYlmTBuKx/evN3wSiRow1i2vIZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764919; c=relaxed/simple;
	bh=lSsjKccp0ITIjYiN0WTMFkwAMTj8W2DyDIzfocqv2g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ8FrF2exwcCtIiHEnUhPnpgRBL8gtD4GDaQUMn4nrtrzY3ZcKmW/2NJaLKkbMZ439as6d00i6YWM7vx87hunrt+kuDYTL0y5PRWPCO7B+WpFarbuhVN0SI/nfuyt/IHzlAzgN55tretdDv8IAIu8+6o8B5P0pZaNLLCwXzu/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQOEOGPr; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781764917; x=1813300917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lSsjKccp0ITIjYiN0WTMFkwAMTj8W2DyDIzfocqv2g4=;
  b=PQOEOGPrbuLtLphozZx+XrC5D0NUmNaBnhN4XEW1B3eNRvmhM2QYcgIZ
   3hZ51xaFXg1GVhQ9Q5JcYlumCm4LDASN+PSRPQ8xVy5LIzXP+qJ8QGOpe
   w2sfBGPkPpzvo7PWBR/+y/fTN8cI5xAyiVpUhI/eCAiEdlNMXZBpE3FnM
   jlVOEIizqnTNpeIGKwOsJ/vD0lrrihw0KfyjDkWPw8gggFxGhjfd1xvW5
   XluBPXp2uYELwrlHA4C5Fh4VHohASPVsqO4dWUxl2jr0FbU0y1S4+MTiS
   x3ntGKiqmZq16gmMr6m3aFazrIRelXb8gNOPRPFQlwQB9S7iPnxS27ahy
   Q==;
X-CSE-ConnectionGUID: c2eTg7CrR8KOtiESos+6wA==
X-CSE-MsgGUID: Zte37BeqQ92DGqF7eKmRtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82787474"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82787474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:41:56 -0700
X-CSE-ConnectionGUID: JhEk7TCVQ/GVc0lVgZueGA==
X-CSE-MsgGUID: NZSjF6MDSJGiA315TB5EQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="271975710"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:41:52 -0700
Date: Thu, 18 Jun 2026 09:41:50 +0300
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
Message-ID: <ajOTLrrUCBxsy5jf@ashevche-desk.local>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
 <20260618062839.4o1ewdEn@linutronix.de>
 <ajOS2UR9pw_pUBxr@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajOS2UR9pw_pUBxr@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38660-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,seu.edu.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A4069DE5C

On Thu, Jun 18, 2026 at 09:40:31AM +0300, Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 08:28:39AM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-06-17 23:40:34 [+0800], Runyu Xiao wrote:
> > > sch_irq_unmask() enables the GPIO IRQ and then updates the controller
> > > state through sch_irq_mask_unmask(), which takes sch->lock with
> > > spin_lock_irqsave().  The callback can be reached from irq_startup()
> > > while setting up a requested IRQ.  That path is not sleepable, but on
> > > PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
…
> > > Fixes: 7a81638485c1 ("gpio: sch: Add edge event support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> > 
> > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> There is already a v2.

Or not... I might have been confused with other patch that got two versions
in a row.

-- 
With Best Regards,
Andy Shevchenko



