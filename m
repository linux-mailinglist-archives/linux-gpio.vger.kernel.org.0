Return-Path: <linux-gpio+bounces-16985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18BBA4D3EB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B964B18936A3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 06:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3B71D7E35;
	Tue,  4 Mar 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sznl9Ps4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A235944
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 06:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741069949; cv=none; b=ShanlOIP4Yk8Kcw3GuWPR798pWdEjfmIiEjsmLym++qGhllhRoSwE54JP4QvdHFgx1WMULvxQOewg5F2S+e6R4tsLzTmfpIVFCOhk6l90J/id5MkFEIHC2JxuZpu0IO88XrodYd3EOc+9EAyr2/fHxCTFKPU5+ZoFy8PT+5Jyhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741069949; c=relaxed/simple;
	bh=uC6ivpKcisZVQftcgYvr+tEo43ybPxBheRTPC+7OIek=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=g/vb7oo1Z2HLuO2m/KdstMTCmvhJJKdwUVuTa5Q0V+yhGROr7rr+Qtii3BmNgTt/PHDy9hZVMOkBlYNJv1Omotf7S2L1tE93MerQKjKnHyaT3qQoDQCyg2Vw+Y7deRBCiDpDN2Wgk5zC8LyK+EtEbdZX8GLVxhxGkR+jM88Nlmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sznl9Ps4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf615d5f31so466301866b.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 22:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069946; x=1741674746; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alEOs00dnaUEniKTKm3KRZQBKyYlvBQ3JVj79VBIMDI=;
        b=Sznl9Ps4Mi3eiA8nrZN0EuGT/oWkDIU/xyW6Zmz+e6SJMvSg5ltqKvWTkwicXlNn0w
         A048Jta9EUza9e55o8Ax5kVTsfAgnLD/ANSwJcRolW0LJ3y6Vl8+YNzsSi/lzsJiojRz
         Dfg9D/FZDWtuZqLKeZfE3F1jb1xSKZjq/Y6659AdIwpuV7oIVLDErktrnPFnwJmUJ1RT
         DOaPheJj0iwhKCoD7zzF5g8ZogkxUutDag3TO+pG9BZ2v+YioA3YAMVxPvswsunPP4DE
         rS+hlC6nCrogpOotQJmp3Q90vR0mzpXY6zgGZKpIlqJYJMpkGDTWXs3V8Z0UdXcxmf9Z
         IrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069946; x=1741674746;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alEOs00dnaUEniKTKm3KRZQBKyYlvBQ3JVj79VBIMDI=;
        b=EfBW1FcWG0lUuNTVQztbexnYd2SKIgWMVwy1PM1MaSr6BoHn3zQtg9CwP7urG2XJc2
         41nxnl3GPbuRPyZKdSzO81lUeGzR0EKjsfLKCdh1MqUVot5y8j82YpLj18GnT1Wx9gEL
         cCwvjbCkkdhyIJuaosp/78G9gmwRBxeQhqpPC/aoxfyVJgzMvinKaQymY8DCeJf4BA5T
         pfuJvYPFgAsbtszZAwbf/K+LjYTtbIgv4NFyqEcIwZeSXTgq+5hUuk4tT1B9MKlWhL8z
         hoikEFdeq86QNi+3ls1ewHXnG4SM/JUGg3kYHxzKeJHWHFgPbqRxCfRAX9b8eTZq9DU9
         Iijw==
X-Gm-Message-State: AOJu0YxoTdv4a1pzFzaJUp9UWVEkYqeCfJXoASBch+NzrtzaEbOjjHGp
	i8foEhPfcisHS1FblI1RA6BnEeyH15fdSPwp1AywIW0mmyLjhUSCxulgDfubE9Gcr/6BNvewC79
	K9vEveBdbwmwrAyiKYgZkK5zuZ+I3kf//
X-Gm-Gg: ASbGncsGktQyKjZfkayCEt452EBXrmyG2opaVx9mdoNsuhEh0jkWxmDO+9eGTZYzGl5
	tDakf73cQo8q+1F8hSFPtiwXq1ID2G9nhKYoGHW/2jRly70VwNnbQVj4c1H4nceXi42PRZpBEC5
	X+mS05r93r1agXOj/f/tL5qfH0yCSN
X-Google-Smtp-Source: AGHT+IErlcbETwLR9nitofIa2kswMobLeVr3j+PGevKgHu/fJuVXGcKQGOWCffa+WyOopkG0DtcOx8Ylji5iGtm4nM0=
X-Received: by 2002:a17:906:269a:b0:abf:49de:36de with SMTP id
 a640c23a62f3a-abf49de3e48mr1161517866b.1.1741069945437; Mon, 03 Mar 2025
 22:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Huichun Feng <foxhoundsk.tw@gmail.com>
Date: Tue, 4 Mar 2025 14:32:15 +0800
X-Gm-Features: AQ5f1JpLEhYGaLpMxGcqlhu9bZIecFohE5Aq_ZWhvHd8Jv1hxMR_7mDP9Mf7TDw
Message-ID: <CAFbkdV1dHEjLQyZa0OV_oxB0LBJVTPSOSGHUSE4NYBbfuy1dKA@mail.gmail.com>
Subject: [QUESTION] Possible ways of preventing GPIO probing
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm on a Xilinx UltraScale+ MPSoC SoC, and the kernel is v6.6.

It's a heterogeneous SoC including:

- Cortex-A53*4 (APU, Application Processing Unit)
- Cortex-R5*2 (RPU, Real-time Processing Unit)
- MicroBlaze based platform management unit (PMU)
- MicroBlaze based configuration security unit (CSU)

The SoC features a facility called Xilinx Peripheral Protection Unit
(XPPU), which prevents unintended access of GPIO (and the likes) from
particular processing units.

In my case, I found that Linux running on APU (A53 cores) attempts to
probe the GPIO used by the RPU (R5 cores), which requires the RPU to
do GPIO init again after the probe. Given this, I employ XPPU to
prevent Linux from accessing the GPIO [0], which seemingly works since
Linux then panic'd after the provisioning of XPPU. Following is the
panic message:

[    3.627182] SError Interrupt on CPU0, code 0x00000000bf000002 -- SError
[    3.627190] CPU: 0 PID: 32 Comm: kworker/u9:0 Not tainted
6.6.40-xilinx-g2b7f6f70a62a #1
[    3.627197] Hardware name: ZynqMP ZCU102 Rev1.0 (DT)
[    3.627201] Workqueue: events_unbound deferred_probe_work_func
[    3.627216] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.627223] pc : zynq_gpio_probe+0x1fc/0x3b4
[    3.627232] lr : zynq_gpio_probe+0x190/0x3b4
[    3.627238] sp : ffff8000819d3b60
[    3.627240] x29: ffff8000819d3b60 x28: ffff0008001dd0c0 x27: ffff000800011498
[    3.627250] x26: ffff0008001dd100 x25: ffff000800011400 x24: ffff00080372b0c0
[    3.627258] x23: ffff0008000fcc00 x22: 0000000000000001 x21: ffff0008000fcc10
[    3.627266] x20: ffff000802ea6880 x19: ffff000802ea6940 x18: ffffffffffffffff
[    3.627275] x17: ffff000800134c00 x16: ffff000800d3e000 x15: ffff8000819d3510
[    3.627284] x14: ffff00080002791c x13: ffff80008172b520 x12: 0000000000000019
[    3.627292] x11: ffff80008112cba0 x10: ffff84008349feaf x9 : 0000000000000028
[    3.627301] x8 : ffff00080372b120 x7 : 0000000000000000 x6 : 00000000552478d3
[    3.627309] x5 : 00000000ffffffff x4 : ffff800081d54000 x3 : ffff8000806a6d1c
[    3.627317] x2 : 0000000000000000 x1 : ffff800081d54354 x0 : ffff0008000fcc10
[    3.627326] Kernel panic - not syncing: Asynchronous SError Interrupt
[    3.627330] CPU: 0 PID: 32 Comm: kworker/u9:0 Not tainted 6.6.40
-xilinx-g2b7f6f70a62a #1
[    3.627335] Hardware name: ZynqMP ZCU102 Rev1.0 (DT)
[    3.627338] Workqueue: events_unbound deferred_probe_work_func
[    3.627346] Call trace:
[    3.627349]  dump_backtrace+0x90/0xe8
[    3.627360]  show_stack+0x18/0x24
[    3.627369]  dump_stack_lvl+0x48/0x60
[    3.627379]  dump_stack+0x18/0x24
[    3.627387]  panic+0x314/0x370
[    3.627394]  nmi_panic+0x8c/0x90
[    3.627401]  arm64_serror_panic+0x6c/0x78
[    3.627407]  do_serror+0x28/0x68
[    3.627413]  el1h_64_error_handler+0x30/0x48
[    3.627423]  el1h_64_error+0x64/0x68
[    3.627429]  zynq_gpio_probe+0x1fc/0x3b4
[    3.627435]  platform_probe+0x68/0xc4
[    3.627443]  really_probe+0x148/0x2b0
[    3.627449]  __driver_probe_device+0x78/0x12c
[    3.627456]  driver_probe_device+0xd8/0x15c
[    3.627462]  __device_attach_driver+0xb8/0x134
[    3.627468]  bus_for_each_drv+0x88/0xe8
[    3.627473]  __device_attach+0xa0/0x190
[    3.627480]  device_initial_probe+0x14/0x20
[    3.627486]  bus_probe_device+0xac/0xb0
[    3.627492]  deferred_probe_work_func+0x88/0xc0
[    3.627498]  process_one_work+0x138/0x28c
[    3.627506]  worker_thread+0x2a4/0x4bc
[    3.627512]  kthread+0xe0/0xe4
[    3.627519]  ret_from_fork+0x10/0x20
[    3.627527] SMP: stopping secondary CPUs
[    3.627533] Kernel Offset: disabled
[    3.627535] CPU features: 0x0,00000008,00020000,0000420b
[    3.627540] Memory Limit: none
[    3.885271] ---[ end Kernel panic - not syncing: Asynchronous
SError Interrupt ]---

At the moment of the panic, which is just after the employment of the
XPPU, I thought that I should disable the GPIO in devicetree. However,
after the GPIO got disabled [1], the panic still present.  Is it
because that, in this case, I can't simply disabling the GPIO through
adding 'status="disable";' ?

If there's any RTFM thing I should do beforehand, please provide me
some keywords or in-tree document names.

[0] I believe this is simply an initial step since I would also need
to teach Linux not to use/probe this particular GPIO.
[1] I can assure that the GPIO does get disabled since it was a
heartbeat LED for Linux, which no longer beats/flashes after the
devicetree disable thing.

Thanks!
Fox

