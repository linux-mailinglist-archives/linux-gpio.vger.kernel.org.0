Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418A32C9021
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 22:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgK3VmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 16:42:05 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:51120 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgK3VmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 16:42:05 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606772483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NgAh9VYwDOpjvKBpD2kOK9tCCluKx8G046lvyTTuLAM=;
        b=flvGJ0pXm8+KoywzWh7TI7hPa+f4S8bNnctn1hTerxfblVkBvWtRmRzFNNnl1uYEtTMDWo
        BuDjZHkzhZgd8BRQ0Bga1Iskh5D+8Lmp/HSqtifCMCC9/Qi0mCjBhcqbV9zhiFZ0liDp3x
        BWh1TiP8AZgth915d7oNFSy0NLQabOvU2wVh8ZGg6i7tAccHC7PJiumKbQB6nlHCaWV+RC
        6sN9e2/MIzIZFprcTm/MGYaSqKQJYnhEk2Imc58ZIXS85u08a9rZ2ICEqadK4zuCmA+iQ2
        s5FsCttc46/wlZnNc/E4z6svCCRjJJLS0CfosU4U3hm++PkKrT05dSDeNGNsBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606772483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NgAh9VYwDOpjvKBpD2kOK9tCCluKx8G046lvyTTuLAM=;
        b=1fSliX71lIiev+tFc4Vm9I65X+STSs/VhekX/6qU2C94l/LibCpwQml9cMFLGz5A8OkzIe
        8lcnZgcqy03lmJBA==
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Cc:     =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Oliver O'Halloran <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ allocation
In-Reply-To: <20201124061720.86766-3-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru> <20201124061720.86766-3-aik@ozlabs.ru>
Date:   Mon, 30 Nov 2020 22:41:22 +0100
Message-ID: <87blfeiku5.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Alexey,

On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
> passes realloc==true. There is no obvious reason for handling this
> specific case in the generic code.

There is also no obvious reason for _NOT_ handling it at the core code.

> This splits out __irq_domain_alloc_irqs_data() to make it clear what
> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.

That's your interpretation of cleaner.

You need to expose __irq_domain_alloc_irqs_data() for that which is a
core only functionality, so it's not cleaner. It's exposing internals
which are not to be exposed.

The right thing to do is to get rid of the legacy allocation of x86
during early_irq_init() which is possible with the recent restructuring
of the interrupt initialization code in x86. That's a cleanup which will
actually remove code and not expose internals just because.

> This should cause no behavioral change.

Should not cause is a pretty weak statement.

You're missing a nasty detail here. Contrary to the normal irqdomain
rules virq 0 _IS_ valid on x86 for historical reasons and that's not
trivial to change.

Thanks,

        tglx
