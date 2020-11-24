Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5F52C1E35
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgKXG1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:27:38 -0500
Received: from ozlabs.ru ([107.174.27.60]:51270 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgKXG1i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:27:38 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 28792AE80001;
        Tue, 24 Nov 2020 01:17:29 -0500 (EST)
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
To:     linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH kernel v4 0/8] genirq/irqdomain: Add reference counting to IRQs
Date:   Tue, 24 Nov 2020 17:17:12 +1100
Message-Id: <20201124061720.86766-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is another attempt to add reference counting to IRQ
descriptors; or - more to the point - reuse already existing
kobj from irq_desc. This allows the same IRQ to be used several
times (such as legacy PCI INTx) and when disposing those, only
the last reference drop clears the hardware mappings.
Domains do not add references to irq_desc as the whole point of
this exercise is to move actual cleanup in hardware to
the last reference drop. This only changes sparse interrupts
(no idea about the other case yet).

No changelog as it is all completely rewritten. I am still running
tests but I hope this demonstrates the idea.

Some context from Cedric:
The background context for such a need is that the POWER9 and POWER10
processors have a new XIVE interrupt controller which uses MMIO pages
for interrupt management. Each interrupt has a pair of pages which are
required to be unmapped in some environment, like PHB removal. And so,
all interrupts need to be unmmaped.

1/8 .. 3/8 are removing confusing "realloc" which not strictly required
but I was touching this anyway and legacy interrupts should probably use
the new counting anyway;

4/8 .. 6/8 is reordering irq_desc disposal;

7/8 adds extra references (probably missed other places);

8/8 is the fix for the original XIVE bug; it is here for demonstration.

I am cc'ing ppc list so people can pull the patches from that patchworks.

This is based on sha1
418baf2c28f3 Linus Torvalds "Linux 5.10-rc5".

and pushed out to
https://github.com/aik/linux/commits/irqs
sha1 3955f97c448242f6a

Please comment. Thanks.


Alexey Kardashevskiy (7):
  genirq/ipi:  Simplify irq_reserve_ipi
  genirq/irqdomain: Clean legacy IRQ allocation
  genirq/irqdomain: Drop unused realloc parameter from
    __irq_domain_alloc_irqs
  genirq: Free IRQ descriptor via embedded kobject
  genirq: Add free_irq hook for IRQ descriptor and use for mapping
    disposal
  genirq/irqdomain: Move hierarchical IRQ cleanup to kobject_release
  genirq/irqdomain: Reference irq_desc for already mapped irqs

Oliver O'Halloran (1):
  powerpc/pci: Remove LSI mappings on device teardown

 include/linux/irqdesc.h             |   1 +
 include/linux/irqdomain.h           |   9 +-
 include/linux/irqhandler.h          |   1 +
 arch/powerpc/kernel/pci-common.c    |  21 ++++
 arch/x86/kernel/apic/io_apic.c      |  13 ++-
 drivers/gpio/gpiolib.c              |   1 -
 drivers/irqchip/irq-armada-370-xp.c |   2 +-
 drivers/irqchip/irq-bcm2836.c       |   3 +-
 drivers/irqchip/irq-gic-v3.c        |   3 +-
 drivers/irqchip/irq-gic-v4.c        |   6 +-
 drivers/irqchip/irq-gic.c           |   3 +-
 drivers/irqchip/irq-ixp4xx.c        |   1 -
 kernel/irq/ipi.c                    |  16 +--
 kernel/irq/irqdesc.c                |  45 +++-----
 kernel/irq/irqdomain.c              | 160 +++++++++++++++++-----------
 kernel/irq/msi.c                    |   2 +-
 16 files changed, 158 insertions(+), 129 deletions(-)

-- 
2.17.1

