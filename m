Return-Path: <linux-gpio+bounces-29531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0605CBB6BF
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 06:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37EE93007ECF
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 05:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496DB256C8D;
	Sun, 14 Dec 2025 05:55:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422CA1ACEDF
	for <linux-gpio@vger.kernel.org>; Sun, 14 Dec 2025 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765691728; cv=none; b=fyU22/loO8vZIXXYhC0uhR2vOs/UM23yhwS2hsvG/FUVousI3DLW2O7n4y9jLfpYm7DBngRM7FkQM0B2+qz3TKW+rIiUlQxgNOBfEF7YVIfuWJN2yxR4ftZFiTWDvpfLGV5ELaFuWKOQWjw8dUVzglpeqm8XLb0CKHXXn+JyIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765691728; c=relaxed/simple;
	bh=PaIS9z16vJXFjFue2thBFXiSBuTFqUCSwMQX1/Ply0o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=I1unRWQPnoAY5Hzlgsd7Z/DKb6zb5iq1dgsf1ZxvMDVSfmARRGZl4AVgbS4BCNt7PA8v7uPRV1i2mIKsHlJ4h2w5NGlHj7e0SKLZKwE1oqD2FPo6yzly4q5XJ9YCc6rmKO4zOTXNCyMcxVuiAsi2ATVL5AOrZITsXhfOk0qtjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7c6d3685fadso2593687a34.1
        for <linux-gpio@vger.kernel.org>; Sat, 13 Dec 2025 21:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765691725; x=1766296525;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35wGLNA5UaaKChjkJVUugoGDzifP8JJlU2D+v+LykM0=;
        b=ajAjPve+77wtGC/tbsTFfL0Z9jtAdEEcdnh8dwUd4yCBU+foaUsZfON0VcgkfDlkF4
         2cL8qZg1K3gF13/2bF4zgR0qLawDOjFl35rffNRZi4+XvF14FcWLc4dcfGriKkYNMC/y
         WMsa42RI5MGFKmQ/r6ItED7WSW9nm15/oz2R5ibkm/OwpLEGA1nBs4q0PR4SA7kdheha
         oqpgJWFosF4r/HwxrwYy/JXcx+BV0VOTZEI+qY5KaQFIA9fNd7o7q20zzjBA5gKtOisy
         vUPFFVI3P0niPUJgnNnlGEmT00LCYI6Tz433rB/KlCg8kKQn6Zqs1zZ4/DTLBJCIl793
         T1iw==
X-Forwarded-Encrypted: i=1; AJvYcCUQFEjOfDsvQVbMBmnaPXTQfs3EhERn7L8wFatlGLI1ZBURYwl0rRN9fV4zlTv0OqlR8W/U55F39Tw6@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkJBlt9E5yTkyTHQRuNqTwgiLLV5k6dEpNAj1DJ9m4teHJyrg
	evCVPCrQadITuuGNA0/mqdaP5TOss9teUswCdUseiJ2npk/dDXQCqIIwCow5GNg97dsD7o1xgGS
	TQh0XO8tufC7inqVUIZXLyaxEc6luE/Z8yE2oLbLEbeBoztAyruU6qD3birk=
X-Google-Smtp-Source: AGHT+IGMUxw1Lk/V8YAoq4zpHDAtK0nkIT8g8I7bBGZb/3tYRUj4kBB91ghdZnLMPEnoI/rdteEDc+etCUM+EIJ9HiQdIz4xnSHU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:178e:b0:659:9a49:90ba with SMTP id
 006d021491bc7-65b451e3be1mr3143845eaf.57.1765691725290; Sat, 13 Dec 2025
 21:55:25 -0800 (PST)
Date: Sat, 13 Dec 2025 21:55:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693e514d.050a0220.326d2b.0011.GAE@google.com>
Subject: [syzbot] [gpio?] upstream test error: BUG: soft lockup in led_heartbeat_function
From: syzbot <syzbot+6ff4620809efa1842f1a@syzkaller.appspotmail.com>
To: brgl@kernel.org, linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c9b47175e913 Merge tag 'i2c-for-6.19-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=110ada1a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d5b48b67d177d90
dashboard link: https://syzkaller.appspot.com/bug?extid=6ff4620809efa1842f1a
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-c9b47175.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/268e383652dc/vmlinux-c9b47175.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9cb40d06afc2/zImage-c9b47175.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6ff4620809efa1842f1a@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#1 stuck for 430s! [swapper/1:0]
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
PC is at arch_spin_lock arch/arm/include/asm/spinlock.h:74 [inline]
PC is at do_raw_spin_lock include/linux/spinlock.h:187 [inline]
PC is at __raw_spin_lock include/linux/spinlock_api_smp.h:134 [inline]
PC is at _raw_spin_lock+0x40/0x58 kernel/locking/spinlock.c:154
LR is at __raw_spin_lock include/linux/spinlock_api_smp.h:132 [inline]
LR is at _raw_spin_lock+0x18/0x58 kernel/locking/spinlock.c:154
pc : [<81abbc34>]    lr : [<81abbc0c>]    psr: 80000113
sp : df805d68  ip : df805d68  fp : df805d7c
r10: 81c05450  r9 : 8415b640  r8 : 84046e88
r7 : 8415b768  r6 : 00000000  r5 : 00000001  r4 : 8415b768
r3 : 0000345e  r2 : 0000345f  r1 : 00000000  r0 : 00000001
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 30c5387d  Table: 85216dc0  DAC: 00000000
Call trace: frame pointer underflow
[<81abbbf4>] (_raw_spin_lock) from [<809c77ac>] (class_raw_spinlock_constructor include/linux/spinlock.h:535 [inline])
[<81abbbf4>] (_raw_spin_lock) from [<809c77ac>] (gpio_mmio_set+0x44/0x80 drivers/gpio/gpio-mmio.c:234)
 r5:00000001 r4:8415b640
[<809c7768>] (gpio_mmio_set) from [<809b7f68>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000000 r6:00000000 r5:00000000 r4:840e1840
[<809b7f4c>] (gpiochip_set) from [<809ba830>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809ba7b8>] (gpiod_set_raw_value_commit) from [<809bc0d0>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:81c05450 r9:df805ebc r8:00000102 r7:ffffa9af r6:00000035 r5:00000000
 r4:840e1840
[<809bc08c>] (gpiod_set_value_nocheck) from [<809bc120>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809bc0e4>] (gpiod_set_value) from [<809cc8bc>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:83fc1044 r4:83fc1044
[<809cc860>] (gpio_led_set) from [<809ca154>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809cc860>] (gpio_led_set) from [<809ca154>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809cc860>] (gpio_led_set) from [<809ca154>] (led_set_brightness_nosleep+0x38/0x44 drivers/leds/led-core.c:369)
 r5:83fc1044 r4:84b62c4c
[<809ca11c>] (led_set_brightness_nosleep) from [<809cd1b8>] (led_heartbeat_function+0x84/0x144 drivers/leds/trigger/ledtrig-heartbeat.c:90)
[<809cd134>] (led_heartbeat_function) from [<80326f70>] (call_timer_fn+0x30/0x220 kernel/time/timer.c:1748)
 r7:ffffa9af r6:809cd134 r5:84b62c4c r4:83216000
[<80326f40>] (call_timer_fn) from [<80327424>] (expire_timers kernel/time/timer.c:1799 [inline])
[<80326f40>] (call_timer_fn) from [<80327424>] (__run_timers+0x2c4/0x3f8 kernel/time/timer.c:2373)
 r9:df805ebc r8:ffffa9af r7:00000000 r6:809cd134 r5:dddd9f00 r4:84b62c4c
[<80327160>] (__run_timers) from [<803275c0>] (__run_timer_base kernel/time/timer.c:2385 [inline])
[<80327160>] (__run_timers) from [<803275c0>] (__run_timer_base kernel/time/timer.c:2377 [inline])
[<80327160>] (__run_timers) from [<803275c0>] (run_timer_base+0x68/0x78 kernel/time/timer.c:2394)
 r10:83216000 r9:82804d80 r8:00000102 r7:00000001 r6:00000082 r5:00000002
 r4:dddd9f00
[<80327558>] (run_timer_base) from [<803275ec>] (run_timer_softirq+0x1c/0x34 kernel/time/timer.c:2404)
 r4:82804084
[<803275d0>] (run_timer_softirq) from [<8025b55c>] (handle_softirqs+0x140/0x458 kernel/softirq.c:622)
[<8025b41c>] (handle_softirqs) from [<8025b9d0>] (__do_softirq kernel/softirq.c:656 [inline])
[<8025b41c>] (handle_softirqs) from [<8025b9d0>] (invoke_softirq kernel/softirq.c:496 [inline])
[<8025b41c>] (handle_softirqs) from [<8025b9d0>] (__irq_exit_rcu+0x110/0x1d0 kernel/softirq.c:723)
 r10:00000000 r9:83216000 r8:00000000 r7:df865e08 r6:82443ff8 r5:8247f12c
 r4:83216000
[<8025b8c0>] (__irq_exit_rcu) from [<8025bd48>] (irq_exit+0x10/0x18 kernel/softirq.c:751)
 r5:8247f12c r4:826c3a9c
[<8025bd38>] (irq_exit) from [<81aad6a4>] (generic_handle_arch_irq+0x7c/0x80 kernel/irq/handle.c:295)
[<81aad628>] (generic_handle_arch_irq) from [<81a7d654>] (call_with_stack+0x1c/0x20 arch/arm/lib/call_with_stack.S:40)
 r9:83216000 r8:84046e88 r7:df865e3c r6:ffffffff r5:60000013 r4:809c7fac
[<81a7d638>] (call_with_stack) from [<80200bec>] (__irq_svc+0x8c/0xbc arch/arm/kernel/entry-armv.S:228)
Exception stack(0xdf865e08 to 0xdf865e50)
5e00:                   e0299008 0000000d 0000345e 00000000 e0299008 0000000d
5e20: 00000001 8415b768 84046e88 8415b640 00000000 df865e6c df865e58 df865e58
5e40: 809c7fa8 809c7fac 60000013 ffffffff
[<809c7f8c>] (gpio_mmio_write32) from [<809c77cc>] (gpio_mmio_set+0x64/0x80 drivers/gpio/gpio-mmio.c:241)
 r5:00000008 r4:8415b640
[<809c7768>] (gpio_mmio_set) from [<809b7f68>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000001 r6:00000000 r5:00000003 r4:840e187c
[<809b7f4c>] (gpiochip_set) from [<809ba830>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809ba7b8>] (gpiod_set_raw_value_commit) from [<809bc0d0>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:00000000 r9:00000000 r8:00000001 r7:ddde24c0 r6:83e7a298 r5:00000001
 r4:840e187c
[<809bc08c>] (gpiod_set_value_nocheck) from [<809bc120>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809bc0e4>] (gpiod_set_value) from [<809cc8bc>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:000000ff r4:83fc1314
[<809cc860>] (gpio_led_set) from [<809ca1e4>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809cc860>] (gpio_led_set) from [<809ca1e4>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809cc860>] (gpio_led_set) from [<809ca1e4>] (led_set_brightness_nosleep drivers/leds/led-core.c:369 [inline])
[<809cc860>] (gpio_led_set) from [<809ca1e4>] (led_set_brightness+0x84/0x90 drivers/leds/led-core.c:328)
 r5:000000ff r4:83fc1314
[<809ca160>] (led_set_brightness) from [<809cbd64>] (led_trigger_event drivers/leds/led-triggers.c:420 [inline])
[<809ca160>] (led_set_brightness) from [<809cbd64>] (led_trigger_event+0x40/0x58 drivers/leds/led-triggers.c:408)
 r5:000000ff r4:83fc1314
[<809cbd24>] (led_trigger_event) from [<809cd3c0>] (ledtrig_cpu+0xac/0xf4 drivers/leds/trigger/ledtrig-cpu.c:86)
 r7:ddde24c0 r6:00000002 r5:82b15cd8 r4:000001fd
[<809cd314>] (ledtrig_cpu) from [<80227a38>] (arch_cpu_idle_exit+0x14/0x18 arch/arm/kernel/process.c:98)
 r9:00000000 r8:00000001 r7:8280c710 r6:83216000 r5:8280c6d0 r4:00000001
[<80227a24>] (arch_cpu_idle_exit) from [<802b158c>] (do_idle+0x5c/0x2d8 kernel/sched/idle.c:334)
[<802b1530>] (do_idle) from [<802b1b38>] (cpu_startup_entry+0x30/0x34 kernel/sched/idle.c:430)
 r10:00000000 r9:414fc0f0 r8:80003000 r7:82a7b4a4 r6:83216000 r5:00000001
 r4:00000092
[<802b1b08>] (cpu_startup_entry) from [<8022f360>] (secondary_start_kernel+0x128/0x194 arch/arm/kernel/smp.c:478)
[<8022f238>] (secondary_start_kernel) from [<80220094>] (__enable_mmu+0x0/0xc arch/arm/kernel/head.S:446)
 r7:82a7b4a4 r6:30c0387d r5:00000000 r4:830b7bc0
Sending NMI from CPU 1 to CPUs 0:


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

