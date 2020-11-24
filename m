Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0682C1E38
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgKXG2H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:28:07 -0500
Received: from ozlabs.ru ([107.174.27.60]:51416 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgKXG2H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:28:07 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 75863AE80257;
        Tue, 24 Nov 2020 01:18:20 -0500 (EST)
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
Subject: [PATCH kernel v4 8/8] powerpc/pci: Remove LSI mappings on device teardown
Date:   Tue, 24 Nov 2020 17:17:20 +1100
Message-Id: <20201124061720.86766-9-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Oliver O'Halloran <oohall@gmail.com>

When a passthrough IO adapter is removed from a pseries machine using hash
MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
to clear all page table entries related to the adapter. If some are still
present, the RTAS call which isolates the PCI slot returns error 9001
"valid outstanding translations" and the removal of the IO adapter fails.
This is because when the PHBs are scanned, Linux maps automatically the
INTx interrupts in the Linux interrupt number space but these are never
removed.

This problem can be fixed by adding the corresponding unmap operation when
the device is removed. There's no pcibios_* hook for the remove case, but
the same effect can be achieved using a bus notifier.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/pci-common.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..95f4e173368a 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -404,6 +404,27 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
 	return 0;
 }
 
+static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(data);
+
+	if (action == BUS_NOTIFY_DEL_DEVICE)
+		irq_dispose_mapping(pdev->irq);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ppc_pci_unmap_irq_notifier = {
+	.notifier_call = ppc_pci_unmap_irq_line,
+};
+
+static int ppc_pci_register_irq_notifier(void)
+{
+	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
+}
+arch_initcall(ppc_pci_register_irq_notifier);
+
 /*
  * Platform support for /proc/bus/pci/X/Y mmap()s.
  *  -- paulus.
-- 
2.17.1

