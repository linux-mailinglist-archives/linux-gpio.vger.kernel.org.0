Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3625D312665
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Feb 2021 18:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhBGRcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Feb 2021 12:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBGRcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2021 12:32:09 -0500
Received: from iam.tj (soggy.cloud [IPv6:2a01:7e00:e000:151::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A88C06174A
        for <linux-gpio@vger.kernel.org>; Sun,  7 Feb 2021 09:31:24 -0800 (PST)
Received: from [IPv6:2a02:8011:2007:0:4e8f:8e4c:119:9fc0] (unknown [IPv6:2a02:8011:2007:0:4e8f:8e4c:119:9fc0])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 7B232340F6
        for <linux-gpio@vger.kernel.org>; Sun,  7 Feb 2021 17:31:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1612719082; bh=BAmseRFvSkThPirqOmWpY1zYxK4YVrmsMdIcbGtrmw4=;
        h=To:From:Subject:Date:From;
        b=p2ybKjNPBe3JbeoqjaszdH6Jq0FUJpZ3mVMzOFxExNtDBgQB62L2Ghem69LO3i3QQ
         S1z5yIomJB8vQE2DYUb6b0ixZYjx/Kk+pNtirz03dFnO6JMKhH1f8DNMCoTTjZuoyc
         WVTU6fHRrZoVJbgXtsq9WiPiNmH1CO+0BivuUDbgKP6q8/cUH0uaecRVuj3YxkZaIL
         I6VTfsL9X5vcB+vpBZpQQxFePfxjdVidEqpxQBk2+J1wbJZ3/mK6uy+/uzjno4Sal3
         3awUIlx7lM9cI/JLSDCUIFyEmPMsnbcYO1T+8QPJdluBdoR4OeGdy4mRPPfz3zRTL2
         U2xdQgC1yNL4A==
To:     linux-gpio@vger.kernel.org
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Subject: amd_gpio_irq_handler: irq 7: nobody cared
Organization: Elloe CIC
Message-ID: <1d3e7009-1b6b-33dc-d6ab-29dd42c5a9a9@elloe.vision>
Date:   Sun, 7 Feb 2021 17:31:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On recent 5.19.* and the latest 5.11-rc6 at commit 825b5991a46e on a
Lenovo E495 I'm seeing:

kernel: Linux version 5.11.0-rc6+ (tj@elloe000) (gcc (Ubuntu
9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #18
SMP PREEMPT Sun Feb 7 15:58:14 GMT 2021
kernel: Command line: BOOT_IMAGE=/vmlinuz-5.11.0-rc6+
root=/dev/mapper/ELLOE000-rootfs ro acpi_osi=! "acpi_osi=Windows 2016"
systemd.unified_cgroup_hierarchy=1 nosplash
...
kernel: DMI: LENOVO 20NECTO1WW/20NECTO1WW, BIOS R11ET32W (1.12 ) 12/23/2019
...
smpboot: CPU0: AMD Ryzen 7 3700U with Radeon Vega Mobile Gfx (family:
0x17, model: 0x18, stepping: 0x1)
...
kernel: irq 7: nobody cared (try booting with the "irqpoll" option)
kernel: CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.11.0-rc6+ #18
kernel: Hardware name: LENOVO 20NECTO1WW/20NECTO1WW, BIOS R11ET32W (1.12
) 12/23/2019
kernel: Call Trace:
kernel: <IRQ>
kernel: dump_stack+0x74/0x92
kernel: __report_bad_irq+0x3a/0xaf
kernel: note_interrupt.cold+0xb/0x60
kernel: handle_irq_event_percpu+0x73/0x80
kernel: handle_irq_event+0x39/0x60
kernel: handle_fasteoi_irq+0x9c/0x150
kernel: common_interrupt+0x68/0x140
kernel: asm_common_interrupt+0x1e/0x40
kernel: RIP: 0010:__do_softirq+0x73/0x2cd
kernel: Code: 7b 81 52 00 01 00 00 89 75 ac c7 45 c8 0a 00 00 00 48 89
45 c0 48 89 45 b0 65 66 c7 05 d4 b9 82 52 00 00 fb 66 0f 1f 44 00 00
<bb> ff ff ff ff 49 c7 c3 c0 60 00 ae 41 0f bc df 83 c3 01 89 5d d4
kernel: RSP: 0018:ffffa71540280f90 EFLAGS: 00000282
kernel: RAX: ffff8acd80920000 RBX: 0000000000000000 RCX: 0000000000000020
kernel: RDX: 0000000000000000 RSI: 0000000000200042 RDI: 0000000000000000
kernel: RBP: ffffa71540280fe8 R08: 0000000000000000 R09: 000000004e2727f7
kernel: R10: 000000004e170080 R11: 000000000000371b R12: ffffa7154017fe08
kernel: R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000080
kernel: asm_call_irq_on_stack+0x12/0x20
kernel: </IRQ>
kernel: do_softirq_own_stack+0x3d/0x50
kernel: irq_exit_rcu+0xa4/0xb0
kernel: sysvec_apic_timer_interrupt+0x35/0x90
kernel: asm_sysvec_apic_timer_interrupt+0x12/0x20
kernel: RIP: 0010:tick_nohz_idle_enter+0x47/0x50
kernel: Code: 4e 4c 53 48 83 bb b0 00 00 00 00 75 20 80 4b 4c 01 e8 ed
12 ff ff 80 4b 4c 04 48 89 43 78 e8 c0 20 f9 ff fb 66 0f 1f 44 00 00
<5b> 5d c3 0f 0b eb dc 66 90 0f 1f 44 00 00 55 48 89 e5 53 48 c7 c3
kernel: RSP: 0018:ffffa7154017feb0 EFLAGS: 00000282
kernel: RAX: 000000004dff0c6a RBX: ffff8ad4108df8c0 RCX: 000000004dfea97a
kernel: RDX: 000000004e0da480 RSI: 000000004dfea97a RDI: fffffffffff104fa
kernel: RBP: ffffa7154017feb8 R08: 000000004dff0c6a R09: ffff8acd80a12840
kernel: R10: 000000000000037f R11: 0000000000000000 R12: 0000000000000091
kernel: R13: ffff8acd80920000 R14: 0000000000000000 R15: 0000000000000000
kernel: do_idle+0x40/0x260
kernel: cpu_startup_entry+0x20/0x30
kernel: start_secondary+0x126/0x160
kernel: secondary_startup_64_no_verify+0xc2/0xcb
kernel: handlers:
kernel: [<00000000b9a06805>] amd_gpio_irq_handler
kernel: Disabling IRQ #7
