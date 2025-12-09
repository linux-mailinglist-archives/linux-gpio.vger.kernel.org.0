Return-Path: <linux-gpio+bounces-29401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180ACAE8E5
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 01:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA4B8300D54D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0EB23C506;
	Tue,  9 Dec 2025 00:44:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4DF2153D8
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765241068; cv=none; b=b3IHwL84qHYziE903mD6oFlNs7fa+7/y1a5LAjlDnOW1N+SEbP3viFzJvQoQfsCjIh/e1BW49K7LwAZ95euGeek/+8uWAw6lpnD0NakQtYdUu/f+iF8J5PngiJ8wuqwrfFGpsCkaaax5wpE8MwZ8yUZrBJNv2gJiVkC7uNnYo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765241068; c=relaxed/simple;
	bh=BHtB48KAtOWbuDQl7waRI/NEKrB9ZxEyZPK1s9A9MI8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=S6eYEox3XIgbRewhPMGhNUjujlT9fBlg4ygC8gjPCHrytwQFgx10I9JBObrNi271PLw8Q66zThlHW847iEAOhJjlT0z8O8u9q8ruNPobxsgek4znbTZyY8ROcAcXGkceaxUYjZw+k7sPAlqx9Sc8rsm1Aixzzwpgzao0si9+H+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-656bc3a7ab3so7773863eaf.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 16:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765241066; x=1765845866;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVYm9pWO+JyG/r/70USwrpSZzAADqXlZ7JW8GOWjD0w=;
        b=RU4ZIVc1fXnAN/nAwY1veOVziz/VTcfbOk6f9rTbCPMaaVJRypUEf5FRHU2u9uiLVG
         DRZTgWqmEd8DRLa65lpIJfeeVk5vOPqKt/MRoQqSRffNDepCl0UZ78DHAPoNRvZudr9E
         yNUyiuWb/A6/gTJez5onv2g7oiq0G3XBm3qwn0P3Lq7piuclHoe0/GMZ4+dCTclG31R+
         ST0T89wckErLE4pyFxiwguDWGJ4NOvIDPfLJpZdf8DCjMFS7hbhmEttRwTGYNXbY0OoE
         2vQRJ7eRaXujgKGHbUOB3WfYhzl/+z5O/O9IrO6fSfgCrU6Cp8HWsK4pKFOTPRPx+TnI
         9tQA==
X-Forwarded-Encrypted: i=1; AJvYcCXlUpSYCtG8QjAHkvw2kXmZZVUgPSWScNJ+1DqhBkhPL36xBGMk2tiFFQw/4cY9lNBNTxXkeihyLMcS@vger.kernel.org
X-Gm-Message-State: AOJu0YznvNc9KOs/lq0SKOMmlAvTDXKhPS5saOi4QnkBM/K6uFqPcpet
	yFlqtjkipkEMbT2V9eBbLpZQrB5iP6MnGT87l1/TK4W67b72YUSJjUSSWaMMlkFQ8KMjeeC/lcp
	H37mwC5oY2mKCf5Hu30FUbkoQ/InzFEE1eCGrHPdPFUIALJ8QAZkjcLcUw3U=
X-Google-Smtp-Source: AGHT+IH0LPLHb3t0z1bkabPO88ncG7OvQHtQI3t5pKY6ZqR4p4mROZbPS/GiKSo4WVpbHwS3VLWUUj1sr+7k309VO2h9Sh0LoyNq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:659:9a49:8fd0 with SMTP id
 006d021491bc7-6599a97baeemr4129570eaf.73.1765241066076; Mon, 08 Dec 2025
 16:44:26 -0800 (PST)
Date: Mon, 08 Dec 2025 16:44:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693770ea.a70a0220.38f243.00b5.GAE@google.com>
Subject: [syzbot] [gpio?] BUG: soft lockup in led_heartbeat_function
From: syzbot <syzbot+7736397b23ea34050017@syzkaller.appspotmail.com>
To: brgl@kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c2f2b01b74be Merge tag 'i3c/for-6.19' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d2721a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d5b48b67d177d90
dashboard link: https://syzkaller.appspot.com/bug?extid=7736397b23ea34050017
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-c2f2b01b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1d5b0c92d398/vmlinux-c2f2b01b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab235c28e1ed/zImage-c2f2b01b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7736397b23ea34050017@syzkaller.appspotmail.com

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
pc : [<81abb6f4>]    lr : [<81abb6cc>]    psr: 80000113
sp : df805d68  ip : df805d68  fp : df805d7c
r10: 81c05450  r9 : 83f73440  r8 : 83f0da88
r7 : 83f73568  r6 : 00000000  r5 : 00000001  r4 : 83f73568
r3 : 00006cc6  r2 : 00006cc8  r1 : 00000000  r0 : 00000001
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 30c5387d  Table: 84e31880  DAC: 00000000
Call trace: frame pointer underflow
[<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (class_raw_spinlock_constructor include/linux/spinlock.h:535 [inline])
[<81abb6b4>] (_raw_spin_lock) from [<809c74b8>] (gpio_mmio_set+0x44/0x80 drivers/gpio/gpio-mmio.c:234)
 r5:00000001 r4:83f73440
[<809c7474>] (gpio_mmio_set) from [<809b7c74>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000000 r6:00000000 r5:00000000 r4:8409a780
[<809b7c58>] (gpiochip_set) from [<809ba53c>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809ba4c4>] (gpiod_set_raw_value_commit) from [<809bbddc>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:81c05450 r9:df805ebc r8:00000102 r7:ffffbf8d r6:0000000a r5:00000000
 r4:8409a780
[<809bbd98>] (gpiod_set_value_nocheck) from [<809bbe2c>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809bbdf0>] (gpiod_set_value) from [<809cc5c8>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:832f7844 r4:832f7844
[<809cc56c>] (gpio_led_set) from [<809c9e60>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809cc56c>] (gpio_led_set) from [<809c9e60>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809cc56c>] (gpio_led_set) from [<809c9e60>] (led_set_brightness_nosleep+0x38/0x44 drivers/leds/led-core.c:369)
 r5:832f7844 r4:84b77dcc
[<809c9e28>] (led_set_brightness_nosleep) from [<809ccec4>] (led_heartbeat_function+0x84/0x144 drivers/leds/trigger/ledtrig-heartbeat.c:90)
[<809cce40>] (led_heartbeat_function) from [<80326f70>] (call_timer_fn+0x30/0x220 kernel/time/timer.c:1748)
 r7:ffffbf8d r6:809cce40 r5:84b77dcc r4:83216000
[<80326f40>] (call_timer_fn) from [<80327424>] (expire_timers kernel/time/timer.c:1799 [inline])
[<80326f40>] (call_timer_fn) from [<80327424>] (__run_timers+0x2c4/0x3f8 kernel/time/timer.c:2373)
 r9:df805ebc r8:ffffbf8d r7:00000000 r6:809cce40 r5:dddd9f00 r4:84b77dcc
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
 r10:00000000 r9:83216000 r8:00000000 r7:df865e08 r6:82443e68 r5:8247ef9c
 r4:83216000
[<8025b8c0>] (__irq_exit_rcu) from [<8025bd48>] (irq_exit+0x10/0x18 kernel/softirq.c:751)
 r5:8247ef9c r4:826c3a9c
[<8025bd38>] (irq_exit) from [<81aad164>] (generic_handle_arch_irq+0x7c/0x80 kernel/irq/handle.c:295)
[<81aad0e8>] (generic_handle_arch_irq) from [<81a7d0fc>] (call_with_stack+0x1c/0x20 arch/arm/lib/call_with_stack.S:40)
 r9:83216000 r8:83f0da88 r7:df865e3c r6:ffffffff r5:60000013 r4:809c7cb8
[<81a7d0e0>] (call_with_stack) from [<80200bec>] (__irq_svc+0x8c/0xbc arch/arm/kernel/entry-armv.S:228)
Exception stack(0xdf865e08 to 0xdf865e50)
5e00:                   e01db008 0000000d 00006cc6 00000000 e01db008 0000000d
5e20: 00000001 83f73568 83f0da88 83f73440 00000000 df865e6c df865e58 df865e58
5e40: 809c7cb4 809c7cb8 60000013 ffffffff
[<809c7c98>] (gpio_mmio_write32) from [<809c74d8>] (gpio_mmio_set+0x64/0x80 drivers/gpio/gpio-mmio.c:241)
 r5:00000008 r4:83f73440
[<809c7474>] (gpio_mmio_set) from [<809b7c74>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000001 r6:00000000 r5:00000003 r4:8409a7bc
[<809b7c58>] (gpiochip_set) from [<809ba53c>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809ba4c4>] (gpiod_set_raw_value_commit) from [<809bbddc>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:00000000 r9:00000000 r8:00000001 r7:ddde24c0 r6:838323d8 r5:00000001
 r4:8409a7bc
[<809bbd98>] (gpiod_set_value_nocheck) from [<809bbe2c>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809bbdf0>] (gpiod_set_value) from [<809cc5c8>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:000000ff r4:832f7b14
[<809cc56c>] (gpio_led_set) from [<809c9ef0>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809cc56c>] (gpio_led_set) from [<809c9ef0>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809cc56c>] (gpio_led_set) from [<809c9ef0>] (led_set_brightness_nosleep drivers/leds/led-core.c:369 [inline])
[<809cc56c>] (gpio_led_set) from [<809c9ef0>] (led_set_brightness+0x84/0x90 drivers/leds/led-core.c:328)
 r5:000000ff r4:832f7b14
[<809c9e6c>] (led_set_brightness) from [<809cba70>] (led_trigger_event drivers/leds/led-triggers.c:420 [inline])
[<809c9e6c>] (led_set_brightness) from [<809cba70>] (led_trigger_event+0x40/0x58 drivers/leds/led-triggers.c:408)
 r5:000000ff r4:832f7b14
[<809cba30>] (led_trigger_event) from [<809cd0cc>] (ledtrig_cpu+0xac/0xf4 drivers/leds/trigger/ledtrig-cpu.c:86)
 r7:ddde24c0 r6:00000002 r5:82b15cd8 r4:000001fd
[<809cd020>] (ledtrig_cpu) from [<80227a38>] (arch_cpu_idle_exit+0x14/0x18 arch/arm/kernel/process.c:98)
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

