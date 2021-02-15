Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E50931B9EA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 14:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhBONC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 08:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBONC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 08:02:27 -0500
Received: from iam.tj (soggy.cloud [IPv6:2a01:7e00:e000:151::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7021C061756
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 05:01:46 -0800 (PST)
Received: from [IPv6:2a02:8011:2007:0:359b:3382:7483:4e67] (unknown [IPv6:2a02:8011:2007:0:359b:3382:7483:4e67])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id C1470340F6
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 13:01:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1613394103; bh=aD3WZGjvXXaegAbsD6FYrcfQwo+GyDHJU2mRlg9CqUQ=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=fH4Sz+FBwvdYJWmxqNWdHlNINT+rmMZULSR2jLGQ9kYncEGL6m6Da5EAcf1us4SX2
         8ALsI/kgCoGU5XwuwOKB8nkJ0tuj1QfeV4ZNDG9uoeKMcQyixZHPDzv3keRCv3bDz9
         fyK+dqAZIxaNpcRN/EsXYakObmDQJZl3o+1lQCtH+qV34nqahu1NHIZR9cVBz5WRUI
         xf2+itvb9o6p2RZMSdq6oldZpFwttKGQYwMMBfYJRgXfQ1GBiAHPEpG2zGNkuwGE0w
         +DLbtSl1Wuud+Vvb5LYAh5w7I9B6H2PjY0J8XfH0LomUTFG06dsEgXkx/hCI5kC6b7
         KzaFUpMoSz3Rw==
Subject: Re: amd_gpio_irq_handler: irq 7: nobody cared
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
To:     linux-gpio@vger.kernel.org
References: <1d3e7009-1b6b-33dc-d6ab-29dd42c5a9a9@elloe.vision>
Organization: Elloe CIC
Message-ID: <c95cfd80-4cf4-f721-f9c0-7a686fffa7b2@elloe.vision>
Date:   Mon, 15 Feb 2021 13:01:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1d3e7009-1b6b-33dc-d6ab-29dd42c5a9a9@elloe.vision>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/02/2021 17:31, Tj (Elloe Linux) wrote:
> On recent 5.19.* and the latest 5.11-rc6 at commit 825b5991a46e on a
> Lenovo E495 I'm seeing:

I'm still seeing this with 5.11.0


kernel: irq 7: nobody cared (try booting with the "irqpoll" option)
kernel: CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.11.0+ #21
kernel: Hardware name: LENOVO 20NECTO1WW/20NECTO1WW, BIOS R11ET32W (1.12
) 12/23/2019
kernel: Call Trace:
kernel:  <IRQ>
kernel:  dump_stack+0x74/0x92
kernel:  __report_bad_irq+0x3a/0xaf
kernel:  note_interrupt.cold+0xb/0x60
kernel:  handle_irq_event_percpu+0x73/0x80
kernel:  handle_irq_event+0x39/0x60
kernel:  handle_fasteoi_irq+0x9c/0x150
kernel:  common_interrupt+0x70/0x150
kernel:  asm_common_interrupt+0x1e/0x40
kernel: RIP: 0010:__do_softirq+0x73/0x2cd
kernel: Code: 7b 41 6a 00 01 00 00 89 75 ac c7 45 c8 0a 00 00 00 48 89
45 c0 48 89 45 b0 65 66 c7 05 94 bb 42 6a 00 00 fb 66 0f 1f 44 00 00
<bb> ff ff ff ff 49 c7 c3 c0 60 40 96 41 0f bc df 83 c3 01 89 5d d4
kernel: RSP: 0018:ffffa5b240280f90 EFLAGS: 00000282
kernel: RAX: ffff892fc0940000 RBX: 0000000000000000 RCX: 0000000000000020
kernel: RDX: 0000000000000000 RSI: 0000000000200042 RDI: 0000000000000000
kernel: RBP: ffffa5b240280fe8 R08: 0000000000000000 R09: 00000000796118c7
kernel: R10: 0000000079510080 R11: 000000000000287d R12: ffffa5b24017fe08
kernel: R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000080
kernel:  asm_call_irq_on_stack+0x12/0x20
kernel:  </IRQ>
kernel:  do_softirq_own_stack+0x3d/0x50
kernel:  irq_exit_rcu+0xa4/0xb0
kernel:  sysvec_apic_timer_interrupt+0x3d/0x90
kernel:  asm_sysvec_apic_timer_interrupt+0x12/0x20
kernel: RIP: 0010:tick_nohz_idle_enter+0x47/0x50
kernel: Code: 12 0c 6b 48 83 bb b0 00 00 00 00 75 20 80 4b 4c 01 e8 ed
12 ff ff 80 4b 4c 04 48 89 43 78 e8 10 14 f9 ff fb 66 0f 1f 44 00 00
<5b> 5d c3 0f 0b eb dc 66 90 0f 1f 44 00 00 55 48 89 e5 53 48 c7 c3
kernel: RSP: 0018:ffffa5b24017feb0 EFLAGS: 00000282
kernel: RAX: 00000000793900a1 RBX: ffff893660adf8c0 RCX: 000000007938cb8e
kernel: RDX: 000000007947b5d2 RSI: 000000007938cb8e RDI: fffffffffff115bc
kernel: RBP: ffffa5b24017feb8 R08: 00000000793900a1 R09: 0000000000000000
kernel: R10: 0000000000000014 R11: 0000000000000579 R12: 0000000000000091
kernel: R13: ffff892fc0940000 R14: 0000000000000000 R15: 0000000000000000
kernel:  do_idle+0x40/0x260
kernel:  cpu_startup_entry+0x20/0x30
kernel:  start_secondary+0x126/0x160
kernel:  secondary_startup_64_no_verify+0xc2/0xcb
kernel: handlers:
kernel: [<000000003466154b>] amd_gpio_irq_handler
kernel: Disabling IRQ #7

