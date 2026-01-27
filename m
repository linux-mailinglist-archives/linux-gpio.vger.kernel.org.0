Return-Path: <linux-gpio+bounces-31112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OwtNOWBeGkzqgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:14:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D8918C1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B29430BE931
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6846C33A702;
	Tue, 27 Jan 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs+MAtnm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A833A9EC
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504837; cv=none; b=uFIG8sbHzo3c5d4CQezE/UcceAs4+upPE6StnaumSV8AX2vfdZxF6RxLHP9BzbAQiG5Ukhix8H2sAnqLs2K/CpczPzI3ZEr8KSwR8EnKo9ofHYOLZ2PKckeevgM5JxYjNa2XQCFHEJQ5OIYscLFyGvG7ykhoM1X/ENsNm/2huRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504837; c=relaxed/simple;
	bh=ALEpDQwJonQujxs0CxjuR/MO51rmhAfTE3KVimPZQ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntwyxLLh8lbvMwJp5yGYZ98peSiKVblaKEapm7wK2idUPsol0Btc6JObyqnSBzQgVI/Lj/PiB6jmt7iNnK8e6Ge8YYhzdtAtSO5SsE2yx/jSa8GsWPGrdU6W89RS0xgFryBxA42o2jNLpPOZCwyEPEpcb7ksoyKQXFQuStQnvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs+MAtnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4394FC4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504836;
	bh=ALEpDQwJonQujxs0CxjuR/MO51rmhAfTE3KVimPZQ1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rs+MAtnm46woVfapXKl88JtCs0bsdPNHbml3TqnULZt0VkhAyoVQXhrTGf6pC5f3o
	 OUaAprIe9QOt9bT85nGtP25rVaXq0pO38jzqHov6AhcruAdA3+wlCiqdrmYXozxoJw
	 aKAALnBuf+qEk8ZfpHVFsuddvDqcw9v2n8JqJUKhLqIi1SJIsqUl7Kr7Tmr2xPaDZZ
	 8ORq3iFI7V1ZVy+Fur6s9dvxTqUA+UB4xcUbW3ZSw9cJiaeCnhdRui/EpT9yWrPxDQ
	 1lU7tXdByeWj878UonRZ9yhELcZS4xYSKKD0rF43qOmgXNxgqZJmG3EO6jjbCqUdiy
	 VigRs+HqqAhDw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6416574e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:07:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlHVaMBlAgww7gUY1iEhR5YF8JGhJBdchjf8C6DAlkNGhQD4+x8ohBF9vIia2/Gr6i+mldoBSOBEqr@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdAv5D4UxIqN5nXKmHQcROfd/yaFRnqSt+v/5Sr+6LTKw3nre
	FbwAjKDoN7lfTfdmDIn8gwwkw86KWis3XaTHmf1y4aIK7le0GwWwzLp5PJ+u+dDc6Szqn2mF51R
	LMLZkvcLzgjhqq6tXOhDqeOLgtO3HumjlfFWSHEG9lg==
X-Received: by 2002:ac2:4f07:0:b0:59d:e350:3c45 with SMTP id
 2adb3069b0e04-59e0412c85dmr443715e87.52.1769504834932; Tue, 27 Jan 2026
 01:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126094209.9855-1-xuewen.yan@unisoc.com> <20260126095024.ZEEwNmlk@linutronix.de>
In-Reply-To: <20260126095024.ZEEwNmlk@linutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 27 Jan 2026 10:07:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md+ptvRvknV7C4g2W_vpkfQmLkanKUqXzM8eYSe5ns1dQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgf0JUu4eQObYOkmY-gEPiUDrM8kzv9a2P_5yClOMjll0DjSTreo0CNK7E
Message-ID: <CAMRc=Md+ptvRvknV7C4g2W_vpkfQmLkanKUqXzM8eYSe5ns1dQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, linusw@kernel.org, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, clrkwllms@kernel.org, 
	rostedt@goodmis.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, ke.wang@unisoc.com, wenhua.lin@unisoc.com, 
	xuewen.yan94@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31112-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[unisoc.com,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unisoc.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email,c6:email]
X-Rspamd-Queue-Id: 329D8918C1
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:50=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-01-26 17:42:09 [+0800], Xuewen Yan wrote:
> > There was a lockdep warning in sprd_gpio:
> >
> > [    6.258269][T329@C6] [ BUG: Invalid wait context ]
> > [    6.258270][T329@C6] 6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 =
Tainted: G        W  OE
> > [    6.258272][T329@C6] -----------------------------
> > [    6.258273][T329@C6] modprobe/329 is trying to lock:
> > [    6.258275][T329@C6] ffffff8081c91690 (&sprd_gpio->lock){....}-{3:3}=
, at: sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd]
> > [    6.258282][T329@C6] other info that might help us debug this:
> > [    6.258283][T329@C6] context-{5:5}
> > [    6.258285][T329@C6] 3 locks held by modprobe/329:
> > [    6.258286][T329@C6]  #0: ffffff808baca108 (&dev->mutex){....}-{4:4}=
, at: __driver_attach+0xc4/0x204
> > [    6.258295][T329@C6]  #1: ffffff80965e7240 (request_class#4){+.+.}-{=
4:4}, at: __setup_irq+0x1cc/0x82c
> > [    6.258304][T329@C6]  #2: ffffff80965e70c8 (lock_class#4){....}-{2:2=
}, at: __setup_irq+0x21c/0x82c
> > [    6.258313][T329@C6] stack backtrace:
> > [    6.258314][T329@C6] CPU: 6 UID: 0 PID: 329 Comm: modprobe Tainted: =
G        W  OE       6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 PREEMPT=
  3ad5b0f45741a16e5838da790706e16ceb6717df
> > [    6.258316][T329@C6] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUN=
SIGNED_MODULE
> > [    6.258317][T329@C6] Hardware name: Unisoc UMS9632-base Board (DT)
> > [    6.258318][T329@C6] Call trace:
> > [    6.258318][T329@C6]  show_stack+0x20/0x30 (C)
> > [    6.258321][T329@C6]  __dump_stack+0x28/0x3c
> > [    6.258324][T329@C6]  dump_stack_lvl+0xac/0xf0
> > [    6.258326][T329@C6]  dump_stack+0x18/0x3c
> > [    6.258329][T329@C6]  __lock_acquire+0x824/0x2c28
> > [    6.258331][T329@C6]  lock_acquire+0x148/0x2cc
> > [    6.258333][T329@C6]  _raw_spin_lock_irqsave+0x6c/0xb4
> > [    6.258334][T329@C6]  sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd 8145=
35e93c6d8e0853c45c02eab0fa88a9da6487]
> > [    6.258337][T329@C6]  irq_startup+0x238/0x350
> > [    6.258340][T329@C6]  __setup_irq+0x504/0x82c
> > [    6.258342][T329@C6]  request_threaded_irq+0x118/0x184
> > [    6.258344][T329@C6]  devm_request_threaded_irq+0x94/0x120
> > [    6.258347][T329@C6]  sc8546_init_irq+0x114/0x170 [sc8546_charger 22=
3586ccafc27439f7db4f95b0c8e6e882349a99]
> > [    6.258352][T329@C6]  sc8546_charger_probe+0x53c/0x5a0 [sc8546_charg=
er 223586ccafc27439f7db4f95b0c8e6e882349a99]
> > [    6.258358][T329@C6]  i2c_device_probe+0x2c8/0x350
> > [    6.258361][T329@C6]  really_probe+0x1a8/0x46c
> > [    6.258363][T329@C6]  __driver_probe_device+0xa4/0x10c
> > [    6.258366][T329@C6]  driver_probe_device+0x44/0x1b4
> > [    6.258369][T329@C6]  __driver_attach+0xd0/0x204
> > [    6.258371][T329@C6]  bus_for_each_dev+0x10c/0x168
> > [    6.258373][T329@C6]  driver_attach+0x2c/0x3c
> > [    6.258376][T329@C6]  bus_add_driver+0x154/0x29c
> > [    6.258378][T329@C6]  driver_register+0x70/0x10c
> > [    6.258381][T329@C6]  i2c_register_driver+0x48/0xc8
> > [    6.258384][T329@C6]  init_module+0x28/0xfd8 [sc8546_charger 223586c=
cafc27439f7db4f95b0c8e6e882349a99]
> > [    6.258389][T329@C6]  do_one_initcall+0x128/0x42c
> > [    6.258392][T329@C6]  do_init_module+0x60/0x254
> > [    6.258395][T329@C6]  load_module+0x1054/0x1220
> > [    6.258397][T329@C6]  __arm64_sys_finit_module+0x240/0x35c
> > [    6.258400][T329@C6]  invoke_syscall+0x60/0xec
> > [    6.258402][T329@C6]  el0_svc_common+0xb0/0xe4
> > [    6.258405][T329@C6]  do_el0_svc+0x24/0x30
> > [    6.258407][T329@C6]  el0_svc+0x54/0x1c4
> > [    6.258409][T329@C6]  el0t_64_sync_handler+0x68/0xdc
> > [    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8
>
> This could be reduced to "BUG: Invalid wait context". The other bits
> provide to added value.
>
> > This is because the spin_lock would change to rt_mutex in PREEMPT_RT,
> > however the sprd_gpio->lock would use in hard-irq, this is unsafe.
> >
> > So change the spin_lock to raw_spin_lock to use the spinlock
>
> spinlock_t to raw_spinlock_t
>

I fixed this in git.

Bart

> > in hard-irq.
> >
> > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
>
> Other than that
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Sebastian

