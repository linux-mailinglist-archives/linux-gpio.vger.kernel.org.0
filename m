Return-Path: <linux-gpio+bounces-17382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA2A59759
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 15:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE98916512E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1858122B5B1;
	Mon, 10 Mar 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HwWx5dEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2C1A314B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616269; cv=none; b=okR5jhxclY56tVggAY6hzFCqtUf8ZbotaXJmmViJ4wziTUorpGVnXlkVC47puqxU/Y91NKtgi3HH6GWti5jsLG4/KPWwaSeF/HcuKJ6/Xi+sRWlBKgmcKT38GGo2+c1qs9ohGFCrwbf/G4LgXLxnCg15+t1JtkqAJIKcNhjrqrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616269; c=relaxed/simple;
	bh=QC+AdWRhMmMYCT97+x+D2bfE2utJpDREJRUyrKLC3Ck=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cypARUrZGmFKm6rf2birW+3ojY84ylYsruX8W4aUnMZgm+bYjGyRsyJfkYsRQCAseqh2hWshC3ztnSK2fNS4Bhm6dtr8mRVW6wrus9hhvApB0ObpdZK7WCtUXd1WpGjxN/eS9qTdhthDUpaKdbeGhxJzJMX3PhFhY4wVV+rAz2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HwWx5dEY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so4325583e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741616265; x=1742221065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ul8kFO7lwW9kFVkIy43WzzdYDX4n+06svWBXDn9drJA=;
        b=HwWx5dEYpOldJBK42EW3/WRxsBIE4NjAoZga8OXYizU03fwrHir4hejA8WqaxXvAII
         NGsfqkhJijr27G5SN0vcRuajxLLxXrbNPb95+3YmnKs55doWxgA7Xk8jG7CY4lR8YA7S
         op0yuLGkD3VtL6IuYTO4jtBjadWr0t6jOqqfAnzkILqs6+gvweF9DOu+6GFuHGiDKSiY
         2qFe/MhOYtRqWpmTxs8E6Y3qmMmAZtbB/V8uDHLbz9Q5z/rGziouoyrSbpDTiBjPjmVA
         N9Y7vC5JevprosFepshqIXwEI18McFwnkixthd8TMOrUp7mVf86tkPhrq+N/vI0nkYZF
         9C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616265; x=1742221065;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul8kFO7lwW9kFVkIy43WzzdYDX4n+06svWBXDn9drJA=;
        b=Bq/pPt3xO2NwdpCyfD6Z0WZ4pxSZoin79FOxihArrA8TNa6g7l7fZPhLqncRhI+ffT
         VHP3ddd2x43BbyMgSIvqYC8oPZSnaIIaZCN3ZPS/5IZf208m+T/LMvgotVxCrEMUC7o4
         hkWF9px7luMuG6tmOliJRel3aKvVy5tiUsKqDYlPJY5wzH8BtSGwBip0lCkp1wWK2YYb
         ZfTlfhm6m77R2UjPcFpNdrxsuJEFiUJIIrHWqfdVDKcsdmtcruHQvgPuUmqztBUt1r2R
         jZ6I0jXUagBHZP1sz7FcTOnghuLJjSyRkxMMBmfYOUtBIm98UX+EhJSVE5aE4JzpA47W
         lbdw==
X-Gm-Message-State: AOJu0Yx9SmgoBPxBtOTDeyYpXMm12q9ydDwmnsEu1Si5u9xZqzpl6WUQ
	yJv1mAn1mecUWUQVx49zVwu6RYo3edsOgWAAeweVluKXzMg9qFpHCUOmzHpYc2/1J23vQoGrrI/
	V81kO34pBWgUjgFFYpiANG3N+aOVZW1Dz24vZeQ==
X-Gm-Gg: ASbGncvbtCr9gfpoGW6NeAOrKC5/q2wble060HHyUVbxCrJfoVZTK9yARMXNkNPSdwa
	HHabmGHImXXuFFY5G7rTZogW7zLaSit+4uUVgGtMTvfiNQuFAcmmq9mHs9tkTt1TtAhJX5iXAvK
	KH1ebwbnCqSDZR7ni38+sZ9sucZ0kkhC5o9XEMkSCfelpradcz4U0raj6QeuKIuqceHCfu
X-Google-Smtp-Source: AGHT+IF7buKqd7TryGjspbAJdHeKY4bDX0d6QJ+BQtS/19e2caYnT371petCLtXGjw1x+JHcIZyDqn1H4jW+wQ0e0iU=
X-Received: by 2002:a05:6512:3ba5:b0:545:2544:6ae2 with SMTP id
 2adb3069b0e04-54990e3ee03mr5412837e87.16.1741616265200; Mon, 10 Mar 2025
 07:17:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Mar 2025 10:17:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Mar 2025 10:17:44 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <oedikhiegt3iqj7xg4vtfhlqxihicd7bdtaglk73q2m3c42zla@roh336fpkszm>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
 <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com> <oedikhiegt3iqj7xg4vtfhlqxihicd7bdtaglk73q2m3c42zla@roh336fpkszm>
Date: Mon, 10 Mar 2025 10:17:44 -0400
X-Gm-Features: AQ5f1JoHwVFJ0KZuG46LXo7uOW8C5vZqS8WH6VsspLyLM8luftm_1Qi9utPPsDI
Message-ID: <CAMRc=MeHBYngume_k-tfqEnkrkt3-axWKXKS1xkxkyH-6QFSkQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Mar 2025 14:32:12 +0100, Koichiro Den
<koichiro.den@canonical.com> said:
>>
>> I did some more testing as I want to pick it up for v6.15 but I now
>> noticed that we're hitting the lockdep_assert_held(&aggr->lock) splat
>> in aggr_line_add(). Could you please look into it?
>
> Thanks. Could you share with me a sample splat?
>

Just a simple aggregator instantiation using the new_device attribute like:

    echo "gpio-sim.0:node0 3 gpio-sim.1:node0 5" > new_device

is giving me this:

[   11.125700] ------------[ cut here ]------------
[   11.125754] WARNING: CPU: 11 PID: 349 at
drivers/gpio/gpio-aggregator.c:185 aggr_line_add+0x2a5/0x370
[gpio_aggregator]
[   11.125799] Modules linked in: gpio_sim gpio_aggregator
dev_sync_probe cfg80211 parport_pc parport nfsd sch_fq_codel fuse
configfs
[   11.125933] CPU: 11 UID: 0 PID: 349 Comm: sh Not tainted
6.14.0-rc6-yocto-standard+ #80
[   11.125959] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   11.125977] RIP: 0010:aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.126005] Code: c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc
cc 49 8d be 80 01 00 00 be ff ff ff ff e8 43 f8 eb d7 85 c0 0f 85 b3
fd ff ff <0f> 0b e9 ac fd ff ff 48 c7 c7 fc aa f1 99 e8 78 c1 50 d5 e9
8d fd
[   11.126027] RSP: 0018:ffffc90002bd79e0 EFLAGS: 00010246
[   11.126057] RAX: 0000000000000000 RBX: ffff888108bb1000 RCX: 0000000000000001
[   11.126076] RDX: 0000000000000001 RSI: ffff888108bb1180 RDI: ffff88810cbf2400
[   11.126093] RBP: ffffc90002bd7a18 R08: 0000000000000001 R09: ffffed102208fc00
[   11.126110] R10: ffff88811047e003 R11: 0000000000000000 R12: 0000000000000003
[   11.126125] R13: ffff88811047e100 R14: ffff888108bb1000 R15: ffffc90002bd7ac8
[   11.126143] FS:  00007f9b3b293740(0000) GS:ffff888155180000(0000)
knlGS:0000000000000000
[   11.126171] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.126261] CR2: 0000561597676ec0 CR3: 000000010f110000 CR4: 00000000001506f0
[   11.126282] Call Trace:
[   11.126294]  <TASK>
[   11.126308]  ? show_regs.cold+0x19/0x1e
[   11.126356]  ? __warn.cold+0x60/0x245
[   11.126375]  ? aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.126402]  ? report_bug+0x20b/0x2d0
[   11.126439]  ? handle_bug+0x5b/0x90
[   11.126462]  ? exc_invalid_op+0x1c/0x50
[   11.126485]  ? asm_exc_invalid_op+0x1f/0x30
[   11.126528]  ? aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.126553]  ? configfs_register_group+0x239/0x390 [configfs]
[   11.126606]  new_device_store+0x88a/0xae0 [gpio_aggregator]
[   11.126649]  ? __pfx_new_device_store+0x10/0x10 [gpio_aggregator]
[   11.126694]  ? kernfs_fop_write_iter+0x258/0x5a0
[   11.126742]  ? __pfx_lock_acquire+0x10/0x10
[   11.126774]  ? __pfx_new_device_store+0x10/0x10 [gpio_aggregator]
[   11.126795]  ? __pfx_drv_attr_store+0x10/0x10
[   11.126819]  drv_attr_store+0x71/0xb0
[   11.126838]  ? sysfs_file_ops+0x129/0x180
[   11.126863]  sysfs_kf_write+0x10d/0x160
[   11.126888]  ? __pfx_sysfs_kf_write+0x10/0x10
[   11.126908]  kernfs_fop_write_iter+0x398/0x5a0
[   11.126939]  vfs_write+0x612/0x10a0
[   11.126963]  ? vfs_getattr_nosec+0x22a/0x310
[   11.126989]  ? __pfx_vfs_write+0x10/0x10
[   11.127020]  ? __do_sys_newfstat+0xed/0x100
[   11.127070]  ksys_write+0x112/0x200
[   11.127096]  ? __pfx_ksys_write+0x10/0x10
[   11.127119]  ? do_raw_spin_unlock+0x5d/0x220
[   11.127154]  __x64_sys_write+0x76/0xb0
[   11.127175]  ? trace_hardirqs_on+0x26/0x140
[   11.127232]  x64_sys_call+0x293/0x1d70
[   11.127252]  do_syscall_64+0x71/0x140
[   11.127277]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   11.127294] RIP: 0033:0x7f9b3b392424
[   11.127312] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f
84 00 00 00 00 00 f3 0f 1e fa 80 3d 45 7c 0e 00 00 74 13 b8 01 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24
18 48
[   11.127327] RSP: 002b:00007fff16e6fb78 EFLAGS: 00000202 ORIG_RAX:
0000000000000001
[   11.127351] RAX: ffffffffffffffda RBX: 0000000000000026 RCX: 00007f9b3b392424
[   11.127365] RDX: 0000000000000026 RSI: 00005615976c3590 RDI: 0000000000000001
[   11.127378] RBP: 00007f9b3b4735c0 R08: 0000000000000000 R09: 0000000000000001
[   11.127390] R10: 0000000000000004 R11: 0000000000000202 R12: 0000000000000026
[   11.127403] R13: 00005615976c3590 R14: 00007f9b3b470ec0 R15: 0000000000000000
[   11.127457]  </TASK>
[   11.127469] irq event stamp: 54943
[   11.127481] hardirqs last  enabled at (54949): [<ffffffff958284fc>]
__up_console_sem+0x5c/0x70
[   11.127503] hardirqs last disabled at (54954): [<ffffffff958284e1>]
__up_console_sem+0x41/0x70
[   11.127522] softirqs last  enabled at (54242): [<ffffffff956b645a>]
irq_exit_rcu+0x11a/0x1b0
[   11.127541] softirqs last disabled at (54237): [<ffffffff956b645a>]
irq_exit_rcu+0x11a/0x1b0
[   11.127576] ---[ end trace 0000000000000000 ]---
[   11.127886] ------------[ cut here ]------------
[   11.127902] WARNING: CPU: 11 PID: 349 at
drivers/gpio/gpio-aggregator.c:185 aggr_line_add+0x2a5/0x370
[gpio_aggregator]
[   11.127932] Modules linked in: gpio_sim gpio_aggregator
dev_sync_probe cfg80211 parport_pc parport nfsd sch_fq_codel fuse
configfs
[   11.128059] CPU: 11 UID: 0 PID: 349 Comm: sh Tainted: G        W
      6.14.0-rc6-yocto-standard+ #80
[   11.128086] Tainted: [W]=WARN
[   11.128102] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   11.128118] RIP: 0010:aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.128143] Code: c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc
cc 49 8d be 80 01 00 00 be ff ff ff ff e8 43 f8 eb d7 85 c0 0f 85 b3
fd ff ff <0f> 0b e9 ac fd ff ff 48 c7 c7 fc aa f1 99 e8 78 c1 50 d5 e9
8d fd
[   11.128162] RSP: 0018:ffffc90002bd79e0 EFLAGS: 00010246
[   11.128188] RAX: 0000000000000000 RBX: ffff888108bb1000 RCX: 0000000000000001
[   11.128254] RDX: 0000000000000001 RSI: ffff888108bb1180 RDI: ffff88810cbf2400
[   11.128270] RBP: ffffc90002bd7a18 R08: 0000000000000001 R09: ffffed1020a1cfa0
[   11.128287] R10: ffff8881050e7d03 R11: 0000000000000000 R12: 0000000000000005
[   11.128302] R13: ffff8881050e7a00 R14: ffff888108bb1000 R15: ffffc90002bd7ac8
[   11.128319] FS:  00007f9b3b293740(0000) GS:ffff888155180000(0000)
knlGS:0000000000000000
[   11.128344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.128362] CR2: 0000561597676ec0 CR3: 000000010f110000 CR4: 00000000001506f0
[   11.128379] Call Trace:
[   11.128393]  <TASK>
[   11.128410]  ? show_regs.cold+0x19/0x1e
[   11.128435]  ? __warn.cold+0x60/0x245
[   11.128454]  ? aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.128482]  ? report_bug+0x20b/0x2d0
[   11.128517]  ? handle_bug+0x5b/0x90
[   11.128538]  ? exc_invalid_op+0x1c/0x50
[   11.128574]  ? asm_exc_invalid_op+0x1f/0x30
[   11.128617]  ? aggr_line_add+0x2a5/0x370 [gpio_aggregator]
[   11.128643]  ? configfs_register_group+0x239/0x390 [configfs]
[   11.128678]  new_device_store+0x88a/0xae0 [gpio_aggregator]
[   11.128721]  ? __pfx_new_device_store+0x10/0x10 [gpio_aggregator]
[   11.128766]  ? kernfs_fop_write_iter+0x258/0x5a0
[   11.128814]  ? __pfx_lock_acquire+0x10/0x10
[   11.128845]  ? __pfx_new_device_store+0x10/0x10 [gpio_aggregator]
[   11.128865]  ? __pfx_drv_attr_store+0x10/0x10
[   11.128888]  drv_attr_store+0x71/0xb0
[   11.128908]  ? sysfs_file_ops+0x129/0x180
[   11.128933]  sysfs_kf_write+0x10d/0x160
[   11.128957]  ? __pfx_sysfs_kf_write+0x10/0x10
[   11.128977]  kernfs_fop_write_iter+0x398/0x5a0
[   11.129009]  vfs_write+0x612/0x10a0
[   11.129031]  ? vfs_getattr_nosec+0x22a/0x310
[   11.129056]  ? __pfx_vfs_write+0x10/0x10
[   11.129088]  ? __do_sys_newfstat+0xed/0x100
[   11.129138]  ksys_write+0x112/0x200
[   11.129163]  ? __pfx_ksys_write+0x10/0x10
[   11.129187]  ? do_raw_spin_unlock+0x5d/0x220
[   11.129250]  __x64_sys_write+0x76/0xb0
[   11.129271]  ? trace_hardirqs_on+0x26/0x140
[   11.129292]  x64_sys_call+0x293/0x1d70
[   11.129312]  do_syscall_64+0x71/0x140
[   11.129337]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   11.129354] RIP: 0033:0x7f9b3b392424
[   11.129369] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f
84 00 00 00 00 00 f3 0f 1e fa 80 3d 45 7c 0e 00 00 74 13 b8 01 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24
18 48
[   11.129384] RSP: 002b:00007fff16e6fb78 EFLAGS: 00000202 ORIG_RAX:
0000000000000001
[   11.129405] RAX: ffffffffffffffda RBX: 0000000000000026 RCX: 00007f9b3b392424
[   11.129418] RDX: 0000000000000026 RSI: 00005615976c3590 RDI: 0000000000000001
[   11.129432] RBP: 00007f9b3b4735c0 R08: 0000000000000000 R09: 0000000000000001
[   11.129444] R10: 0000000000000004 R11: 0000000000000202 R12: 0000000000000026
[   11.129457] R13: 00005615976c3590 R14: 00007f9b3b470ec0 R15: 0000000000000000
[   11.129502]  </TASK>
[   11.129513] irq event stamp: 55455
[   11.129524] hardirqs last  enabled at (55461): [<ffffffff958284fc>]
__up_console_sem+0x5c/0x70
[   11.129544] hardirqs last disabled at (55466): [<ffffffff958284e1>]
__up_console_sem+0x41/0x70
[   11.129574] softirqs last  enabled at (55142): [<ffffffff956b645a>]
irq_exit_rcu+0x11a/0x1b0
[   11.129592] softirqs last disabled at (55137): [<ffffffff956b645a>]
irq_exit_rcu+0x11a/0x1b0
[   11.129609] ---[ end trace 0000000000000000 ]---

While at it I now noticed that removing a top-level attribute from
/sys/kernel/config/gpio-aggregator results in the following lockdep AND KASAN
splats:

[   18.245874] ------------[ cut here ]------------
[   18.246196] DEBUG_LOCKS_WARN_ON(mutex_is_locked(lock))
[   18.246205] WARNING: CPU: 11 PID: 394 at
kernel/locking/mutex-debug.c:114 mutex_destroy+0xd1/0x110
[   18.247143] Modules linked in: gpio_aggregator dev_sync_probe
cfg80211 parport_pc parport nfsd sch_fq_codel fuse configfs
[   18.247888] CPU: 11 UID: 0 PID: 394 Comm: rmdir Not tainted
6.14.0-rc6-yocto-standard+ #80
[   18.248413] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   18.249124] RIP: 0010:mutex_destroy+0xd1/0x110
[   18.249414] Code: 03 0f b6 14 11 38 d0 7c 04 84 d2 75 3f 8b 05 9e
b3 71 04 85 c0 75 86 48 c7 c6 c0 f8 e7 b0 48 c7 c7 00 f9 e7 b0 e8 4f
b6 e9 ff <0f> 0b e9 6c ff ff ff 48 c7 c7 80 7d 4d b3 e8 0c 5f 6d 00 e9
51 ff
[   18.250594] RSP: 0018:ffffc900028b7c60 EFLAGS: 00010286
[   18.250962] RAX: 0000000000000000 RBX: ffff88810fc71118 RCX: 0000000000000027
[   18.251415] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88815b1a8a48
[   18.251920] RBP: ffffc900028b7c68 R08: 0000000000000001 R09: ffffed102b635149
[   18.252401] R10: ffff88815b1a8a4b R11: 0000000000000001 R12: ffff88810fc71118
[   18.252887] R13: ffff88810fc71000 R14: ffffffffc0a96660 R15: 0000000000000000
[   18.253367] FS:  00007faabbf07740(0000) GS:ffff88815b180000(0000)
knlGS:0000000000000000
[   18.253920] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.254283] CR2: 00007faabc0e8000 CR3: 000000010331c000 CR4: 00000000001506f0
[   18.254765] Call Trace:
[   18.254942]  <TASK>
[   18.255093]  ? show_regs.cold+0x19/0x1e
[   18.255359]  ? __warn.cold+0x60/0x245
[   18.255610]  ? mutex_destroy+0xd1/0x110
[   18.255882]  ? report_bug+0x20b/0x2d0
[   18.256140]  ? handle_bug+0x5b/0x90
[   18.256382]  ? exc_invalid_op+0x1c/0x50
[   18.256644]  ? asm_exc_invalid_op+0x1f/0x30
[   18.256943]  ? mutex_destroy+0xd1/0x110
[   18.257206]  gpio_aggr_device_release+0x86/0xb0 [gpio_aggregator]
[   18.257617]  config_item_cleanup+0x122/0x220 [configfs]
[   18.257981]  config_item_put+0x52/0x6a [configfs]
[   18.258302]  configfs_rmdir+0x6f9/0xe20 [configfs]
[   18.258629]  ? __pfx_configfs_rmdir+0x10/0x10 [configfs]
[   18.258999]  ? __kasan_check_read+0x15/0x20
[   18.259284]  ? do_raw_spin_unlock+0x5d/0x220
[   18.259577]  vfs_rmdir+0x1b0/0x5d0
[   18.259821]  ? hook_path_rmdir+0x17/0x20
[   18.260092]  do_rmdir+0x31c/0x380
[   18.260322]  ? __pfx_do_rmdir+0x10/0x10
[   18.260585]  ? __kasan_check_write+0x18/0x20
[   18.260885]  ? __kasan_check_write+0x18/0x20
[   18.261179]  ? getname_flags+0xb5/0x400
[   18.261442]  __x64_sys_rmdir+0x44/0x60
[   18.261698]  x64_sys_call+0x114f/0x1d70
[   18.261973]  do_syscall_64+0x71/0x140
[   18.262225]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   18.262565] RIP: 0033:0x7faabc005d7b
[   18.262821] Code: f0 ff ff 73 01 c3 48 8b 0d a2 00 0e 00 f7 d8 64
89 01 48 83 c8 ff c3 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 54 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 71 00 0e 00
f7 d8
[   18.264054] RSP: 002b:00007ffea3b3d9b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000054
[   18.264559] RAX: ffffffffffffffda RBX: 00007ffea3b3dba8 RCX: 00007faabc005d7b
[   18.265047] RDX: 0000000000000000 RSI: 00007ffea3b3dee2 RDI: 00007ffea3b3dee2
[   18.265520] RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
[   18.266004] R10: fffffffffffff199 R11: 0000000000000246 R12: 00007ffea3b3dee2
[   18.266478] R13: 0000000000000001 R14: 00007faabc135000 R15: 0000559416916a78
[   18.266965]  </TASK>
[   18.267122] irq event stamp: 3193
[   18.267351] hardirqs last  enabled at (3193): [<ffffffffadca3bf7>]
__call_rcu_common.constprop.0+0x597/0xdf0
[   18.268009] hardirqs last disabled at (3192): [<ffffffffadca3c1a>]
__call_rcu_common.constprop.0+0x5ba/0xdf0
[   18.268656] softirqs last  enabled at (2320): [<ffffffffb0095be7>]
release_sock+0x147/0x190
[   18.269216] softirqs last disabled at (2318): [<ffffffffb0095ac4>]
release_sock+0x24/0x190
[   18.269760] ---[ end trace 0000000000000000 ]---
[   18.270091] ==================================================================
[   18.270573] BUG: KASAN: slab-use-after-free in
__mutex_unlock_slowpath+0xb1/0x6d0
[   18.271078] Read of size 8 at addr ffff88810fc71118 by task rmdir/394
[   18.271508]
[   18.271623] CPU: 11 UID: 0 PID: 394 Comm: rmdir Tainted: G        W
         6.14.0-rc6-yocto-standard+ #80
[   18.271627] Tainted: [W]=WARN
[   18.271629] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   18.271630] Call Trace:
[   18.271632]  <TASK>
[   18.271633]  dump_stack_lvl+0x63/0x90
[   18.271637]  print_report+0x159/0x53a
[   18.271640]  ? __virt_addr_valid+0x201/0x420
[   18.271644]  ? kasan_complete_mode_report_info+0x64/0x200
[   18.271648]  kasan_report+0xec/0x130
[   18.271652]  ? __mutex_unlock_slowpath+0xb1/0x6d0
[   18.271656]  ? __mutex_unlock_slowpath+0xb1/0x6d0
[   18.271661]  kasan_check_range+0x122/0x1f0
[   18.271664]  __kasan_check_read+0x15/0x20
[   18.271667]  __mutex_unlock_slowpath+0xb1/0x6d0
[   18.271670]  ? __kasan_slab_free+0x61/0x70
[   18.271674]  ? __kasan_slab_free+0x61/0x70
[   18.271677]  ? trace_hardirqs_on+0x26/0x140
[   18.271681]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[   18.271685]  ? __kasan_slab_free+0x61/0x70
[   18.271689]  ? kfree+0x154/0x420
[   18.271693]  mutex_unlock+0x16/0x20
[   18.271696]  gpio_aggr_device_release+0x9b/0xb0 [gpio_aggregator]
[   18.271701]  config_item_cleanup+0x122/0x220 [configfs]
[   18.271707]  config_item_put+0x52/0x6a [configfs]
[   18.271713]  configfs_rmdir+0x6f9/0xe20 [configfs]
[   18.271721]  ? __pfx_configfs_rmdir+0x10/0x10 [configfs]
[   18.271727]  ? __kasan_check_read+0x15/0x20
[   18.271730]  ? do_raw_spin_unlock+0x5d/0x220
[   18.271735]  vfs_rmdir+0x1b0/0x5d0
[   18.271738]  ? hook_path_rmdir+0x17/0x20
[   18.271742]  do_rmdir+0x31c/0x380
[   18.271746]  ? __pfx_do_rmdir+0x10/0x10
[   18.271750]  ? __kasan_check_write+0x18/0x20
[   18.271754]  ? __kasan_check_write+0x18/0x20
[   18.271757]  ? getname_flags+0xb5/0x400
[   18.271761]  __x64_sys_rmdir+0x44/0x60
[   18.271765]  x64_sys_call+0x114f/0x1d70
[   18.271768]  do_syscall_64+0x71/0x140
[   18.271772]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   18.271775] RIP: 0033:0x7faabc005d7b
[   18.271777] Code: f0 ff ff 73 01 c3 48 8b 0d a2 00 0e 00 f7 d8 64
89 01 48 83 c8 ff c3 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 54 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 71 00 0e 00
f7 d8
[   18.271779] RSP: 002b:00007ffea3b3d9b8 EFLAGS: 00000246 ORIG_RAX:
0000000000000054
[   18.271782] RAX: ffffffffffffffda RBX: 00007ffea3b3dba8 RCX: 00007faabc005d7b
[   18.271784] RDX: 0000000000000000 RSI: 00007ffea3b3dee2 RDI: 00007ffea3b3dee2
[   18.271786] RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
[   18.271787] R10: fffffffffffff199 R11: 0000000000000246 R12: 00007ffea3b3dee2
[   18.271789] R13: 0000000000000001 R14: 00007faabc135000 R15: 0000559416916a78
[   18.271795]  </TASK>
[   18.271796]
[   18.288331] Allocated by task 392:
[   18.288566]  kasan_save_stack+0x3d/0x60
[   18.288830]  kasan_save_track+0x18/0x40
[   18.289118]  kasan_save_alloc_info+0x3b/0x50
[   18.289410]  __kasan_kmalloc+0xb7/0xc0
[   18.289667]  __kmalloc_noprof+0x1c8/0x4e0
[   18.289945]  aggr_alloc+0x22/0x190 [gpio_aggregator]
[   18.290281]  gpio_aggr_make_group+0xc1/0x100 [gpio_aggregator]
[   18.290673]  configfs_mkdir+0x3f9/0xd40 [configfs]
[   18.291003]  vfs_mkdir+0x3ca/0x610
[   18.291239]  do_mkdirat+0x27b/0x320
[   18.291481]  __x64_sys_mkdir+0x69/0x90
[   18.291739]  x64_sys_call+0x15d6/0x1d70
[   18.292004]  do_syscall_64+0x71/0x140
[   18.292259]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   18.292602]
[   18.292717] Freed by task 394:
[   18.292933]  kasan_save_stack+0x3d/0x60
[   18.293198]  kasan_save_track+0x18/0x40
[   18.293462]  kasan_save_free_info+0x3f/0x70
[   18.293748]  __kasan_slab_free+0x56/0x70
[   18.294022]  kfree+0x154/0x420
[   18.294237]  gpio_aggr_device_release+0x8e/0xb0 [gpio_aggregator]
[   18.294649]  config_item_cleanup+0x122/0x220 [configfs]
[   18.295008]  config_item_put+0x52/0x6a [configfs]
[   18.295331]  configfs_rmdir+0x6f9/0xe20 [configfs]
[   18.295659]  vfs_rmdir+0x1b0/0x5d0
[   18.295896]  do_rmdir+0x31c/0x380
[   18.296131]  __x64_sys_rmdir+0x44/0x60
[   18.296390]  x64_sys_call+0x114f/0x1d70
[   18.296654]  do_syscall_64+0x71/0x140
[   18.296909]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   18.297251]
[   18.297365] The buggy address belongs to the object at ffff88810fc71000
[   18.297365]  which belongs to the cache kmalloc-512 of size 512
[   18.298186] The buggy address is located 280 bytes inside of
[   18.298186]  freed 512-byte region [ffff88810fc71000, ffff88810fc71200)
[   18.298992]
[   18.299106] The buggy address belongs to the physical page:
[   18.299481] page: refcount:0 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x10fc70
[   18.300018] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   18.300526] flags: 0x8000000000000040(head|zone=2)
[   18.300852] page_type: f5(slab)
[   18.301076] raw: 8000000000000040 ffff888100042c80 dead000000000100
dead000000000122
[   18.301591] raw: 0000000000000000 0000000080200020 00000000f5000000
0000000000000000
[   18.302109] head: 8000000000000040 ffff888100042c80
dead000000000100 dead000000000122
[   18.302629] head: 0000000000000000 0000000080200020
00000000f5000000 0000000000000000
[   18.303152] head: 8000000000000003 ffffea00043f1c01
ffffffffffffffff 0000000000000000
[   18.303671] head: 0000000000000008 0000000000000000
00000000ffffffff 0000000000000000
[   18.304194] page dumped because: kasan: bad access detected
[   18.304568]
[   18.304682] Memory state around the buggy address:
[   18.305008]  ffff88810fc71000: fa fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[   18.305491]  ffff88810fc71080: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[   18.305975] >ffff88810fc71100: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[   18.306456]                             ^
[   18.306731]  ffff88810fc71180: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[   18.307215]  ffff88810fc71200: fc fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc
[   18.307696] ==================================================================

Bart

