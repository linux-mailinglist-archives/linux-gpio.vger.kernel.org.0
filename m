Return-Path: <linux-gpio+bounces-31053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHVYKfY5d2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:55:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF88641A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4C4302D5E4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 09:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE23329C66;
	Mon, 26 Jan 2026 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jydJ5qqY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k1kYdPsC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA72F8BC3;
	Mon, 26 Jan 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421029; cv=none; b=GmtNo6TUvDnLdaOhUKj848U4goP2u1pKC2pNEP54Z6S5t4l7/7DqfIGoVq8stgw0DpuSNagA8Qr8tPCWhmGfKIVQHL/dV2Vd2jFYHrTHq1ZlgoUaxQRRKSU8/RVleRLfwSiuWR0Xz9QVe1YTmkqOBaWz3kToWfyH5fMKCjyWHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421029; c=relaxed/simple;
	bh=Mu6m9QB0eM7vSPNYNCZF3Fm9kINmVn2mIma3gaIdZeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6vWY3iH51K1hiahF7seTO3p2JMcQym6c0TMZDLA2hBF6oH4dMEJ/BYi6QzD1AlR7goY2XnWd/Tb8Px1wLSJpfyoixyX3reUmCU8bYxAm7+2dHym7XR6HLIYyDHK8PejwyM/zIvNDw/pqi901/aeghv8imS4C4j423gDQPWnrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jydJ5qqY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k1kYdPsC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 26 Jan 2026 10:50:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769421026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U1zpwCXWpiFq9ur3LirJYIjTFITUOuEAJu7sCEH1cy4=;
	b=jydJ5qqYA8ASN+HraYHuoR0E0I8vFJI4yQzBOJSHFo1E32ZlwVXOnuJsX75i6PiXS/zowa
	hMOLd8X2I+AorXFCnEOejXo1CQUELzocjlArKbJ38c5IZagxq1xuXqT/15soZOcJyOobYJ
	svSp6DJg1lVh4NPxCW6+72P9DHQRMaFSv+DiTCPaL1ekBim6tLyIztUWu+5gXLtp3Hur0c
	Bf/9LgxWVhsGjdFXq8TSDwQH0rYnuR08MG5HDsXapppskSlyJTWn48Bl8hFjgWLBJonnur
	7zqVJrWvpW+yEBnZ8N4PGG7rfSL6+kHliZ3nr9WWqduc9RdquNd1YJW1vpx65Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769421026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U1zpwCXWpiFq9ur3LirJYIjTFITUOuEAJu7sCEH1cy4=;
	b=k1kYdPsC7pizmpPbXYmCSis7cGgIV46iwOV3DiWSLP887dAPuulCVuKP6OL8kjlgv7NBPq
	GzHNCjzQFSuSusAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: linusw@kernel.org, brgl@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, ke.wang@unisoc.com,
	wenhua.lin@unisoc.com, xuewen.yan94@gmail.com
Subject: Re: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
Message-ID: <20260126095024.ZEEwNmlk@linutronix.de>
References: <20260126094209.9855-1-xuewen.yan@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126094209.9855-1-xuewen.yan@unisoc.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31053-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.alibaba.com,goodmis.org,vger.kernel.org,lists.linux.dev,unisoc.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unisoc.com:email,linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,c6:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0AFF88641A
X-Rspamd-Action: no action

On 2026-01-26 17:42:09 [+0800], Xuewen Yan wrote:
> There was a lockdep warning in sprd_gpio:
> 
> [    6.258269][T329@C6] [ BUG: Invalid wait context ]
> [    6.258270][T329@C6] 6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 Tainted: G        W  OE
> [    6.258272][T329@C6] -----------------------------
> [    6.258273][T329@C6] modprobe/329 is trying to lock:
> [    6.258275][T329@C6] ffffff8081c91690 (&sprd_gpio->lock){....}-{3:3}, at: sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd]
> [    6.258282][T329@C6] other info that might help us debug this:
> [    6.258283][T329@C6] context-{5:5}
> [    6.258285][T329@C6] 3 locks held by modprobe/329:
> [    6.258286][T329@C6]  #0: ffffff808baca108 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xc4/0x204
> [    6.258295][T329@C6]  #1: ffffff80965e7240 (request_class#4){+.+.}-{4:4}, at: __setup_irq+0x1cc/0x82c
> [    6.258304][T329@C6]  #2: ffffff80965e70c8 (lock_class#4){....}-{2:2}, at: __setup_irq+0x21c/0x82c
> [    6.258313][T329@C6] stack backtrace:
> [    6.258314][T329@C6] CPU: 6 UID: 0 PID: 329 Comm: modprobe Tainted: G        W  OE       6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 PREEMPT  3ad5b0f45741a16e5838da790706e16ceb6717df
> [    6.258316][T329@C6] Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> [    6.258317][T329@C6] Hardware name: Unisoc UMS9632-base Board (DT)
> [    6.258318][T329@C6] Call trace:
> [    6.258318][T329@C6]  show_stack+0x20/0x30 (C)
> [    6.258321][T329@C6]  __dump_stack+0x28/0x3c
> [    6.258324][T329@C6]  dump_stack_lvl+0xac/0xf0
> [    6.258326][T329@C6]  dump_stack+0x18/0x3c
> [    6.258329][T329@C6]  __lock_acquire+0x824/0x2c28
> [    6.258331][T329@C6]  lock_acquire+0x148/0x2cc
> [    6.258333][T329@C6]  _raw_spin_lock_irqsave+0x6c/0xb4
> [    6.258334][T329@C6]  sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd 814535e93c6d8e0853c45c02eab0fa88a9da6487]
> [    6.258337][T329@C6]  irq_startup+0x238/0x350
> [    6.258340][T329@C6]  __setup_irq+0x504/0x82c
> [    6.258342][T329@C6]  request_threaded_irq+0x118/0x184
> [    6.258344][T329@C6]  devm_request_threaded_irq+0x94/0x120
> [    6.258347][T329@C6]  sc8546_init_irq+0x114/0x170 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258352][T329@C6]  sc8546_charger_probe+0x53c/0x5a0 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258358][T329@C6]  i2c_device_probe+0x2c8/0x350
> [    6.258361][T329@C6]  really_probe+0x1a8/0x46c
> [    6.258363][T329@C6]  __driver_probe_device+0xa4/0x10c
> [    6.258366][T329@C6]  driver_probe_device+0x44/0x1b4
> [    6.258369][T329@C6]  __driver_attach+0xd0/0x204
> [    6.258371][T329@C6]  bus_for_each_dev+0x10c/0x168
> [    6.258373][T329@C6]  driver_attach+0x2c/0x3c
> [    6.258376][T329@C6]  bus_add_driver+0x154/0x29c
> [    6.258378][T329@C6]  driver_register+0x70/0x10c
> [    6.258381][T329@C6]  i2c_register_driver+0x48/0xc8
> [    6.258384][T329@C6]  init_module+0x28/0xfd8 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
> [    6.258389][T329@C6]  do_one_initcall+0x128/0x42c
> [    6.258392][T329@C6]  do_init_module+0x60/0x254
> [    6.258395][T329@C6]  load_module+0x1054/0x1220
> [    6.258397][T329@C6]  __arm64_sys_finit_module+0x240/0x35c
> [    6.258400][T329@C6]  invoke_syscall+0x60/0xec
> [    6.258402][T329@C6]  el0_svc_common+0xb0/0xe4
> [    6.258405][T329@C6]  do_el0_svc+0x24/0x30
> [    6.258407][T329@C6]  el0_svc+0x54/0x1c4
> [    6.258409][T329@C6]  el0t_64_sync_handler+0x68/0xdc
> [    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8

This could be reduced to "BUG: Invalid wait context". The other bits
provide to added value.

> This is because the spin_lock would change to rt_mutex in PREEMPT_RT,
> however the sprd_gpio->lock would use in hard-irq, this is unsafe.
> 
> So change the spin_lock to raw_spin_lock to use the spinlock

spinlock_t to raw_spinlock_t

> in hard-irq.
> 
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>

Other than that
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

