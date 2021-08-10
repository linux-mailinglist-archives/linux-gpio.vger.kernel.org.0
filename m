Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656AE3E8466
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 22:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhHJUd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 16:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhHJUd2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 16:33:28 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1821AC0613C1;
        Tue, 10 Aug 2021 13:33:06 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1628627582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VmNO/6PZX/ukpmKUxgFb784BLjZWMf0I28FYYc/qH+Q=;
        b=geT0QKa+FGH9C4lt7qI+awsmOAPGEPnuKNhteiIPNmgcQaziJdqJBjQY00zPcEFuZmuBmB
        oOh5oInajQrBVbX67j2q2iD9BWXDlbwu+g8lE5rVLGMCIErd9No4tCqHdEseYSHugHI1zg
        zHWyd3cFWnmyd3BVs5lJX5LyVJozvZFjkzQaV/wHC6r+3d7TYpJlg2oG+v1mmVFYWDsD/m
        yJWjYV/irDIoGlQPhZaJOQK49VMOnb5dU12SyIIcmXk83MxnTdGzx+YuXNArtOFDUHB7qb
        PYtamAOAZKRt461Vh7cGXI2uzw3URsGPaKwXtzw2i4OBmySXjMRNqhkygKAVAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1628627582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VmNO/6PZX/ukpmKUxgFb784BLjZWMf0I28FYYc/qH+Q=;
        b=9RUz3+Q/kDOp5LEbghaANWydLhI9VhI74udmE/onDz0uMdyQg6tGx5YzKhMZhoGJCeflAI
        3S/vPf9bzVldkWCw==
To:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Mel Gorman <mgorman@techsingularity.net>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [SPLAT 3/3] gpio: dwapb: Sleeping spinlocks down IRQ mapping
In-Reply-To: <20210810134127.1394269-4-valentin.schneider@arm.com>
References: <20210810134127.1394269-1-valentin.schneider@arm.com>
 <20210810134127.1394269-4-valentin.schneider@arm.com>
Date:   Tue, 10 Aug 2021 22:33:01 +0200
Message-ID: <87v94doxaa.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10 2021 at 14:41, Valentin Schneider wrote:
> [   11.549824] rt_spin_lock (kernel/locking/rtmutex.c:1641 (discriminator 4) kernel/locking/spinlock_rt.c:30 (discriminator 4) kernel/locking/spinlock_rt.c:36 (discriminator 4) kernel/locking/spinlock_rt.c:44 (discriminator 4)) 
> [   11.549827] dwapb_irq_ack (drivers/gpio/gpio-dwapb.c:151 drivers/gpio/gpio-dwapb.c:233) gpio_dwapb
> [   11.549831] __irq_do_set_handler (kernel/irq/chip.c:414 kernel/irq/chip.c:406 kernel/irq/chip.c:1009) 
> [   11.549833] __irq_set_handler (kernel/irq/internals.h:178 kernel/irq/chip.c:1053) 

This is gpio_chip->bgpio_lock which is a regular spinlock. AFAICT this
lock should merely serializing access to MMIO registers, so it should
not be a problem to make this lock raw.

Except for the obligatory exception:

 grgpio_irq_handler() holds that lock from the demultiplexing
 handler and invokes all handlers for the individual GPIOs which have
 interrupts enabled without ever consulting a pending register.

 That drivers usage of that lock is interesting in general, see
 grgpio_map_irq() for illustration. Quality stuff for mission critical
 systems...

 But nevertheless it should just work with a raw lock on RT AFACIT.

Thanks,

        tglx
