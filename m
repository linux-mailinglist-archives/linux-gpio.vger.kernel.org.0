Return-Path: <linux-gpio+bounces-29411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF7CB00BD
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 14:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CF4D301C902
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB248288525;
	Tue,  9 Dec 2025 13:22:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE119005E
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765286545; cv=none; b=kJQ7EsdgbFPXgquqdo2UjoigRM+JU0uEnrQpYGBXKkcAijB0prQu5ZWkQhEAkgAeTHHseQ3zVepzu8cR1haDJRwvFg7QjeoVgasgBoSNAUeFUupTN5YK/U4KlFcne+LCYmmFzSqHn+kg4+ibrWHD2hXANl68OWCj2FLhT18+7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765286545; c=relaxed/simple;
	bh=9FPUFEFgA2vs2X+2ZS02wChco9CzEfEBeyR4XGTxGaE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sxRCrY5fEAIuefFxhGxcyVOGhARr6kumFG0rKS2lFZCCNS9wH085RGRHh/X+ujXPQytmZNzpxi3QPvfEzK4Zl7R3aHOsBn+tM/ye2fyExZml9wub+MzkySNG4CHYndzanXKTQNZ5CvdqgVoXJ7h6J6AJ4g80tR5gEPgnMX3t0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7c705ffd76fso5695571a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Dec 2025 05:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765286543; x=1765891343;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFU5J4q0/YtyzJ/YQGCdl0+QYXmVTgCFTjCKoospQus=;
        b=R2iywosfcePb51o2VUSFTLsS7TtjVMUvwKoWbjytGVgDLBmJ+WWdle22cAVX99zW9H
         gIjSPX+vVIGr4/t7Y5GRok8P+ohKHfGndQjVoPfk/yuMcMTvLMgi3IQMCYhMj1GAxykJ
         Ri5oIpRHjTU8PlC1CeOE36JVWGC0ToEnWlHHZM1/KgdAqMqR8fx9SX9SStk1xTGOZOTz
         PwIm3+B4btBon+GTr8nVy5695O3XF6g+Q/XpfnlmK3dxtQZSWLlm/cJrfEcmZTvnvH3e
         xE1HZJ0XXDlIyMb4kx96ebvxaH0BmxYHYIA9CNkv3VqMO+akvDDxXdxlHZAdtxyzM5Rc
         VUYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhYJr4B+OBmvEaxqNrOorwOq+DGgyzYSMoLngqMf8U+eUU2J71b93GJFd1gvhk88haxHqi2E3BU95Z@vger.kernel.org
X-Gm-Message-State: AOJu0YykJi2ky/mVJhVksLEz9WeacseA4AxpZxjwB+Yh8GHD6SJGtrCU
	u668Hw2q8SI+/ha0Uo07QAyVL09nGzeJUNSeA7pGO/nO5S4//SolxAV7pK5Z59QI7u5NqbOXJZi
	bxV4EC5M9eY0mRRFs+Bx5Axk8Oe+/w+eimjwcpHz29cH1a97hLQWzSb5bNBk=
X-Google-Smtp-Source: AGHT+IHQ8kV4jS6CSSGly/F5WuB3zVitnCu5bhFhJ3WQt/YVnRPuq61hYeH6qn6AXUvHZ7t+ZVUwdFZkSdLyHB3fO0DoTKMV2EsP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1504:b0:659:9a49:8de5 with SMTP id
 006d021491bc7-6599a95bb5cmr4489042eaf.39.1765286543012; Tue, 09 Dec 2025
 05:22:23 -0800 (PST)
Date: Tue, 09 Dec 2025 05:22:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6938228e.050a0220.1ff09b.0006.GAE@google.com>
Subject: [syzbot] [gpio?] upstream test error: INFO: rcu detected stall in corrupted
From: syzbot <syzbot+679cc73dffca3a48f686@syzkaller.appspotmail.com>
To: brgl@kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2061f18ad76e Merge tag 'caps-pr-20251204' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134e7192580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5bd9df300b8b7003
dashboard link: https://syzkaller.appspot.com/bug?extid=679cc73dffca3a48f686
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-2061f18a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f39bb0832dc9/vmlinux-2061f18a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/65ec7675c322/zImage-2061f18a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+679cc73dffca3a48f686@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	(detected by 1, t=30002 jiffies, g=5437, q=32 ncpus=2)
rcu: All QSes seen, last rcu_preempt kthread activity 30002 (8935--21067), jiffies_till_next_fqs=1, root ->qsmask 0x0
rcu: rcu_preempt kthread starved for 30002 jiffies! g5437 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00000000
Call trace: 
[<81a7c8e4>] (__schedule) from [<81a7db90>] (__schedule_loop kernel/sched/core.c:6945 [inline])
[<81a7c8e4>] (__schedule) from [<81a7db90>] (schedule+0x2c/0x130 kernel/sched/core.c:6960)
 r10:00000001 r9:828efccc r8:828efcd8 r7:83213000 r6:83213000 r5:82804d80
 r4:83213000
[<81a7db64>] (schedule) from [<81a86308>] (schedule_timeout+0x8c/0x114 kernel/time/sleep_timeout.c:99)
 r5:82804d80 r4:ffffadb6
[<81a8627c>] (schedule_timeout) from [<803038f4>] (rcu_gp_fqs_loop+0x150/0x4cc kernel/rcu/tree.c:2083)
 r6:82804d80 r5:828efb00 r4:00000000
[<803037a4>] (rcu_gp_fqs_loop) from [<803085a0>] (rcu_gp_kthread+0xec/0x18c kernel/rcu/tree.c:2285)
 r10:df855f4c r9:82804d80 r8:828efb00 r7:828efcda r6:828efccc r5:828efcd8
 r4:83213000
[<803084b4>] (rcu_gp_kthread) from [<8027f49c>] (kthread+0x12c/0x280 kernel/kthread.c:463)
 r7:830bf080
[<8027f370>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xdf855fb0 to 0xdf855ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:8027f370
 r4:830b7c00
rcu: Stack dump where RCU GP kthread last ran:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
PC is at arch_spin_lock arch/arm/include/asm/spinlock.h:74 [inline]
PC is at do_raw_spin_lock include/linux/spinlock.h:187 [inline]
PC is at __raw_spin_lock include/linux/spinlock_api_smp.h:134 [inline]
PC is at _raw_spin_lock+0x40/0x58 kernel/locking/spinlock.c:154
LR is at __raw_spin_lock include/linux/spinlock_api_smp.h:132 [inline]
LR is at _raw_spin_lock+0x18/0x58 kernel/locking/spinlock.c:154
pc : [<81a8769c>]    lr : [<81a87674>]    psr: 80000113
sp : df805d68  ip : df805d68  fp : df805d7c
r10: 81c05430  r9 : 8440b440  r8 : 83ff2a88
r7 : 8440b568  r6 : 00000001  r5 : 00000001  r4 : 8440b568
r3 : 000039b3  r2 : 000039b4  r1 : 00000000  r0 : 00000001
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 30c5387d  Table: 84f22200  DAC: 00000000
Call trace: frame pointer underflow
[<81a8765c>] (_raw_spin_lock) from [<809c0e70>] (class_raw_spinlock_constructor include/linux/spinlock.h:535 [inline])
[<81a8765c>] (_raw_spin_lock) from [<809c0e70>] (gpio_mmio_set+0x44/0x80 drivers/gpio/gpio-mmio.c:234)
 r5:00000001 r4:8440b440
[<809c0e2c>] (gpio_mmio_set) from [<809b17fc>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000001 r6:00000000 r5:00000000 r4:838b1c00
[<809b17e0>] (gpiochip_set) from [<809b4014>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809b3f9c>] (gpiod_set_raw_value_commit) from [<809b58b4>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:81c05430 r9:df805ebc r8:00000102 r7:ffffadb7 r6:00000007 r5:00000001
 r4:838b1c00
[<809b5870>] (gpiod_set_value_nocheck) from [<809b5904>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809b58c8>] (gpiod_set_value) from [<809c5f6c>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:832fd844 r4:832fd844
[<809c5f10>] (gpio_led_set) from [<809c3818>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809c5f10>] (gpio_led_set) from [<809c3818>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809c5f10>] (gpio_led_set) from [<809c3818>] (led_set_brightness_nosleep+0x38/0x44 drivers/leds/led-core.c:369)
 r5:832fd844 r4:838c6c8c
[<809c37e0>] (led_set_brightness_nosleep) from [<809c6868>] (led_heartbeat_function+0x84/0x144 drivers/leds/trigger/ledtrig-heartbeat.c:90)
[<809c67e4>] (led_heartbeat_function) from [<803267d8>] (call_timer_fn+0x30/0x220 kernel/time/timer.c:1748)
 r7:ffffadb7 r6:809c67e4 r5:838c6c8c r4:83216000
[<803267a8>] (call_timer_fn) from [<80326c8c>] (expire_timers kernel/time/timer.c:1799 [inline])
[<803267a8>] (call_timer_fn) from [<80326c8c>] (__run_timers+0x2c4/0x3f8 kernel/time/timer.c:2373)
 r9:df805ebc r8:ffffadb7 r7:00000000 r6:809c67e4 r5:dddd9f00 r4:838c6c8c
[<803269c8>] (__run_timers) from [<80326e28>] (__run_timer_base kernel/time/timer.c:2385 [inline])
[<803269c8>] (__run_timers) from [<80326e28>] (__run_timer_base kernel/time/timer.c:2377 [inline])
[<803269c8>] (__run_timers) from [<80326e28>] (run_timer_base+0x68/0x78 kernel/time/timer.c:2394)
 r10:83216000 r9:82804d80 r8:00000102 r7:00000001 r6:00000082 r5:00000002
 r4:dddd9f00
[<80326dc0>] (run_timer_base) from [<80326e54>] (run_timer_softirq+0x1c/0x34 kernel/time/timer.c:2404)
 r4:82804084
[<80326e38>] (run_timer_softirq) from [<8025af68>] (handle_softirqs+0x140/0x458 kernel/softirq.c:622)
[<8025ae28>] (handle_softirqs) from [<8025b3dc>] (__do_softirq kernel/softirq.c:656 [inline])
[<8025ae28>] (handle_softirqs) from [<8025b3dc>] (invoke_softirq kernel/softirq.c:496 [inline])
[<8025ae28>] (handle_softirqs) from [<8025b3dc>] (__irq_exit_rcu+0x110/0x1d0 kernel/softirq.c:723)
 r10:00000000 r9:83216000 r8:00000000 r7:df865e08 r6:82440c98 r5:8247bebc
 r4:83216000
[<8025b2cc>] (__irq_exit_rcu) from [<8025b754>] (irq_exit+0x10/0x18 kernel/softirq.c:751)
 r5:8247bebc r4:826c2a9c
[<8025b744>] (irq_exit) from [<81a79118>] (generic_handle_arch_irq+0x7c/0x80 kernel/irq/handle.c:295)
[<81a7909c>] (generic_handle_arch_irq) from [<81a49200>] (call_with_stack+0x1c/0x20 arch/arm/lib/call_with_stack.S:40)
 r9:83216000 r8:83ff2a88 r7:df865e3c r6:ffffffff r5:60000013 r4:809c1670
[<81a491e4>] (call_with_stack) from [<80200bec>] (__irq_svc+0x8c/0xbc arch/arm/kernel/entry-armv.S:228)
Exception stack(0xdf865e08 to 0xdf865e50)
5e00:                   e02a7008 0000000c 000039b3 00000000 e02a7008 0000000c
5e20: 00000001 8440b568 83ff2a88 8440b440 00000000 df865e6c df865e58 df865e58
5e40: 809c166c 809c1670 60000013 ffffffff
[<809c1650>] (gpio_mmio_write32) from [<809c0e90>] (gpio_mmio_set+0x64/0x80 drivers/gpio/gpio-mmio.c:241)
 r5:00000008 r4:8440b440
[<809c0e2c>] (gpio_mmio_set) from [<809b17fc>] (gpiochip_set+0x1c/0x44 drivers/gpio/gpiolib.c:2919)
 r7:00000001 r6:00000000 r5:00000003 r4:838b1c3c
[<809b17e0>] (gpiochip_set) from [<809b4014>] (gpiod_set_raw_value_commit+0x78/0x218 drivers/gpio/gpiolib.c:3662)
[<809b3f9c>] (gpiod_set_raw_value_commit) from [<809b58b4>] (gpiod_set_value_nocheck+0x44/0x58 drivers/gpio/gpiolib.c:3881)
 r10:00000000 r9:00000000 r8:00000001 r7:ddde24c0 r6:833fa798 r5:00000001
 r4:838b1c3c
[<809b5870>] (gpiod_set_value_nocheck) from [<809b5904>] (gpiod_set_value+0x3c/0x88 drivers/gpio/gpiolib.c:3903)
[<809b58c8>] (gpiod_set_value) from [<809c5f6c>] (gpio_led_set+0x5c/0x60 drivers/leds/leds-gpio.c:57)
 r5:000000ff r4:832fdb14
[<809c5f10>] (gpio_led_set) from [<809c38a8>] (__led_set_brightness drivers/leds/led-core.c:52 [inline])
[<809c5f10>] (gpio_led_set) from [<809c38a8>] (led_set_brightness_nopm drivers/leds/led-core.c:335 [inline])
[<809c5f10>] (gpio_led_set) from [<809c38a8>] (led_set_brightness_nosleep drivers/leds/led-core.c:369 [inline])
[<809c5f10>] (gpio_led_set) from [<809c38a8>] (led_set_brightness+0x84/0x90 drivers/leds/led-core.c:328)
 r5:000000ff r4:832fdb14
[<809c3824>] (led_set_brightness) from [<809c5414>] (led_trigger_event drivers/leds/led-triggers.c:420 [inline])
[<809c3824>] (led_set_brightness) from [<809c5414>] (led_trigger_event+0x40/0x58 drivers/leds/led-triggers.c:408)
 r5:000000ff r4:832fdb14
[<809c53d4>] (led_trigger_event) from [<809c6a70>] (ledtrig_cpu+0xac/0xf4 drivers/leds/trigger/ledtrig-cpu.c:86)
 r7:ddde24c0 r6:00000002 r5:82b15bd8 r4:000001fd
[<809c69c4>] (ledtrig_cpu) from [<80227758>] (arch_cpu_idle_exit+0x14/0x18 arch/arm/kernel/process.c:98)
 r9:00000000 r8:00000001 r7:8280c710 r6:83216000 r5:8280c6d0 r4:00000001
[<80227744>] (arch_cpu_idle_exit) from [<802b13cc>] (do_idle+0x5c/0x2d8 kernel/sched/idle.c:334)
[<802b1370>] (do_idle) from [<802b1978>] (cpu_startup_entry+0x30/0x34 kernel/sched/idle.c:430)
 r10:00000000 r9:414fc0f0 r8:80003000 r7:82a7b4a4 r6:83216000 r5:00000001
 r4:00000092
[<802b1948>] (cpu_startup_entry) from [<8022f04c>] (secondary_start_kernel+0x128/0x180 arch/arm/kernel/smp.c:478)
[<8022ef24>] (secondary_start_kernel) from [<80220094>] (__enable_mmu+0x0/0xc arch/arm/kernel/head.S:446)
 r7:82a7b4a4 r6:30c0387d r5:00000000 r4:830b7b80


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

