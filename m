Return-Path: <linux-gpio+bounces-31176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D3JAroUeWl3vAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:40:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5E9A0DA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB103020D52
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964F436EA82;
	Tue, 27 Jan 2026 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPyS4WSg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0941328255;
	Tue, 27 Jan 2026 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542583; cv=none; b=uyGo/uGeulX7FKq5VMZo+QMcYUA5VjBOcEEmMbnGgR8DbbSSf7Mu7LSX6vF2ZmUdgxI+W57gZydDVUIgl4moUawMov2z5HYK2p4NbgEgNQT0QMyKPuMRGb3p8X1DRxkC2L/11+0fqYFPS3fWocrZ3qbhg1Wp8XflKHMtZpH1pT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542583; c=relaxed/simple;
	bh=lwZ7tFuk2xGcbZJvUQYVvI94x5grKWoOnedNK+VyGPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgBB6PE4+dDnLKpDpChnbjaRVN/R0ndFeXATXTquqsJVEa03tK3BTT/TP0Wo+DGUMEgg6swnPoHQcXAvXzG8gV27LFL4eEnYZVyDWkDY6gHqYbb9OSfAK9ebIccjRS5biTFzyxum3KUz9QBF8ob6Duk0mMbFf1HZj+ObLWlhd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPyS4WSg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769542582; x=1801078582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lwZ7tFuk2xGcbZJvUQYVvI94x5grKWoOnedNK+VyGPE=;
  b=IPyS4WSg0D7rcOOjUm2ZyKwsNKPYW8OWxguCkkCMP3WGWgiGPYSkQejs
   citAOw4EZLAOdU9OQp/gTqJY8sCyZOtYsVQbKkIskU4yvpU2GlrMkeLU6
   hoTHDzIGGl6eS/WjWg9OFTfaC38Hsinqg7B2meZAbMa2PRKDmx2XAeJF5
   5hK1e6I50SYa4duca4XBQ04FUKnT2EsR0dLee28mL2cz+pFbPqJdGwUfH
   WF4BfDMNJQZ34q8MWNNGzNd7dBxhh1/jlQ55ruiA5K5oXzZklwZwOhwbI
   gB/pYfHa6cu/Xc8znoMHX+K5KhldVMQi4qw9LqIiQD/8XVzS354uzkNh/
   w==;
X-CSE-ConnectionGUID: L8KKUHb5SWW2+vVR8wejqQ==
X-CSE-MsgGUID: wuCNtAmuSLyXmZyUjooGag==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69948831"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="69948831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:36:21 -0800
X-CSE-ConnectionGUID: HSrFaESzQfuct8EtPtrTOw==
X-CSE-MsgGUID: AQikmMI3S9OliG8t1FLuLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208123482"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 11:36:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6990795; Tue, 27 Jan 2026 20:36:16 +0100 (CET)
Date: Tue, 27 Jan 2026 20:36:16 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Xuewen Yan <xuewen.yan@unisoc.com>, linusw@kernel.org,
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com, clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, ke.wang@unisoc.com,
	wenhua.lin@unisoc.com, xuewen.yan94@gmail.com
Subject: Re: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
Message-ID: <aXkTsMqZ4iZyVM0J@black.igk.intel.com>
References: <20260126094209.9855-1-xuewen.yan@unisoc.com>
 <20260126095024.ZEEwNmlk@linutronix.de>
 <CAMRc=Md+ptvRvknV7C4g2W_vpkfQmLkanKUqXzM8eYSe5ns1dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md+ptvRvknV7C4g2W_vpkfQmLkanKUqXzM8eYSe5ns1dQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linutronix.de,unisoc.com,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31176-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 71A5E9A0DA
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:07:01AM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 26, 2026 at 10:50 AM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> > On 2026-01-26 17:42:09 [+0800], Xuewen Yan wrote:

...

> > > There was a lockdep warning in sprd_gpio:

> > > [    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8
> >
> > This could be reduced to "BUG: Invalid wait context". The other bits
> > provide to added value.
> >
> > > This is because the spin_lock would change to rt_mutex in PREEMPT_RT,
> > > however the sprd_gpio->lock would use in hard-irq, this is unsafe.
> > >
> > > So change the spin_lock to raw_spin_lock to use the spinlock
> >
> > spinlock_t to raw_spinlock_t
> 
> I fixed this in git.

Not sure if you noticed the above comment by Sebastian and it's actually
documented in Submitting Patches that backtraces should only carry the
necessary information, so usually ~3-5 lines is enough and not two full pages
like in the commit as I see in the repository.

> Bart
> 
> > > in hard-irq.

-- 
With Best Regards,
Andy Shevchenko



