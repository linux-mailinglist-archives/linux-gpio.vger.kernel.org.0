Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3173C2C1E37
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgKXG1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:27:39 -0500
Received: from ozlabs.ru ([107.174.27.60]:51294 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgKXG1i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:27:38 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id E89CEAE8024C;
        Tue, 24 Nov 2020 01:17:51 -0500 (EST)
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
Subject: [PATCH kernel v4 3/8] genirq/irqdomain: Drop unused realloc parameter from __irq_domain_alloc_irqs
Date:   Tue, 24 Nov 2020 17:17:15 +1100
Message-Id: <20201124061720.86766-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The two previous patches made @realloc obsolete. This finishes removing it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/linux/irqdomain.h           | 4 +---
 arch/x86/kernel/apic/io_apic.c      | 2 +-
 drivers/gpio/gpiolib.c              | 1 -
 drivers/irqchip/irq-armada-370-xp.c | 2 +-
 drivers/irqchip/irq-bcm2836.c       | 3 +--
 drivers/irqchip/irq-gic-v3.c        | 3 +--
 drivers/irqchip/irq-gic-v4.c        | 6 ++----
 drivers/irqchip/irq-gic.c           | 3 +--
 drivers/irqchip/irq-ixp4xx.c        | 1 -
 kernel/irq/ipi.c                    | 2 +-
 kernel/irq/irqdomain.c              | 4 +---
 kernel/irq/msi.c                    | 2 +-
 12 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 6cc37bba9951..a353b93ddf9e 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -475,7 +475,6 @@ extern int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
 					const struct irq_affinity_desc *affinity);
 extern int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 				   unsigned int nr_irqs, int node, void *arg,
-				   bool realloc,
 				   const struct irq_affinity_desc *affinity);
 extern void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs);
 extern int irq_domain_activate_irq(struct irq_data *irq_data, bool early);
@@ -484,8 +483,7 @@ extern void irq_domain_deactivate_irq(struct irq_data *irq_data);
 static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
 			unsigned int nr_irqs, int node, void *arg)
 {
-	return __irq_domain_alloc_irqs(domain, -1, nr_irqs, node, arg, false,
-				       NULL);
+	return __irq_domain_alloc_irqs(domain, -1, nr_irqs, node, arg, NULL);
 }
 
 extern int irq_domain_alloc_irqs_hierarchy(struct irq_domain *domain,
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index df9c0ab3a119..5b45f0874571 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -973,7 +973,7 @@ static int alloc_irq_from_domain(struct irq_domain *domain, int ioapic, u32 gsi,
 	if (irq == -1 || !legacy)
 		return __irq_domain_alloc_irqs(domain, irq, 1,
 					       ioapic_alloc_attr_node(info),
-					       info, false, NULL);
+					       info, NULL);
 
 	return __irq_domain_alloc_irqs_data(domain, irq, 1,
 					    ioapic_alloc_attr_node(info),
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 089ddcaa9bc6..b7cfecb5c701 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1059,7 +1059,6 @@ static void gpiochip_set_hierarchical_irqchip(struct gpio_chip *gc,
 						      1,
 						      NUMA_NO_NODE,
 						      &fwspec,
-						      false,
 						      NULL);
 			if (ret < 0) {
 				chip_err(gc,
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index d7eb2e93db8f..bf17eb312669 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -431,7 +431,7 @@ static __init void armada_xp_ipi_init(struct device_node *node)
 
 	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
 	base_ipi = __irq_domain_alloc_irqs(ipi_domain, -1, IPI_DOORBELL_END,
-					   NUMA_NO_NODE, NULL, false, NULL);
+					   NUMA_NO_NODE, NULL, NULL);
 	if (WARN_ON(!base_ipi))
 		return;
 
diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index cbc7c740e4dc..fe9ff90940d3 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -269,8 +269,7 @@ static void __init bcm2836_arm_irqchip_smp_init(void)
 	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
 
 	base_ipi = __irq_domain_alloc_irqs(ipi_domain, -1, BITS_PER_MBOX,
-					   NUMA_NO_NODE, NULL,
-					   false, NULL);
+					   NUMA_NO_NODE, NULL, NULL);
 
 	if (WARN_ON(!base_ipi))
 		return;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 16fecc0febe8..ff20fd54921f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1163,8 +1163,7 @@ static void __init gic_smp_init(void)
 
 	/* Register all 8 non-secure SGIs */
 	base_sgi = __irq_domain_alloc_irqs(gic_data.domain, -1, 8,
-					   NUMA_NO_NODE, &sgi_fwspec,
-					   false, NULL);
+					   NUMA_NO_NODE, &sgi_fwspec, NULL);
 	if (WARN_ON(base_sgi <= 0))
 		return;
 
diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 0c18714ae13e..dd64dc50610c 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -117,8 +117,7 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 		goto err;
 
 	sgi_base = __irq_domain_alloc_irqs(vpe->sgi_domain, -1, 16,
-					       NUMA_NO_NODE, vpe,
-					       false, NULL);
+					       NUMA_NO_NODE, vpe, NULL);
 	if (sgi_base <= 0)
 		goto err;
 
@@ -154,8 +153,7 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 	}
 
 	vpe_base_irq = __irq_domain_alloc_irqs(vm->domain, -1, vm->nr_vpes,
-					       NUMA_NO_NODE, vm,
-					       false, NULL);
+					       NUMA_NO_NODE, vm, NULL);
 	if (vpe_base_irq <= 0)
 		goto err;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 6053245a4754..28e5e5e4836a 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -846,8 +846,7 @@ static __init void gic_smp_init(void)
 				  gic_starting_cpu, NULL);
 
 	base_sgi = __irq_domain_alloc_irqs(gic_data[0].domain, -1, 8,
-					   NUMA_NO_NODE, &sgi_fwspec,
-					   false, NULL);
+					   NUMA_NO_NODE, &sgi_fwspec, NULL);
 	if (WARN_ON(base_sgi <= 0))
 		return;
 
diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index 37e0749215c7..9dafcc22b592 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -353,7 +353,6 @@ void __init ixp4xx_irq_init(resource_size_t irqbase,
 					      chunk->nr_irqs,
 					      NUMA_NO_NODE,
 					      &fwspec,
-					      false,
 					      NULL);
 		if (ret < 0) {
 			pr_crit("IXP4XX: can not allocate irqs in hierarchy %d\n",
diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 1b2807318ea9..fc20adf7ee0d 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -76,7 +76,7 @@ int irq_reserve_ipi(struct irq_domain *domain,
 	}
 
 	virq = __irq_domain_alloc_irqs(domain, -1, nr_irqs, NUMA_NO_NODE,
-				       (void *) dest, false, NULL);
+				       (void *) dest, NULL);
 
 	if (virq <= 0) {
 		pr_warn("Can't reserve IPI, failed to alloc hw irqs\n");
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ca5c78366c85..805478f81d96 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1438,12 +1438,10 @@ int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
  * @nr_irqs:	number of IRQs to allocate
  * @node:	NUMA node id for memory allocation
  * @arg:	domain specific argument
- * @realloc:	IRQ descriptors have already been allocated if true
  * @affinity:	Optional irq affinity mask for multiqueue devices
  *
  * Allocate IRQ numbers and initialized all data structures to support
  * hierarchy IRQ domains.
- * Parameter @realloc is mainly to support legacy IRQs.
  * Returns error code or allocated IRQ number
  *
  * The whole process to setup an IRQ has been split into two steps.
@@ -1455,7 +1453,7 @@ int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
  */
 int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 			    unsigned int nr_irqs, int node, void *arg,
-			    bool realloc, const struct irq_affinity_desc *affinity)
+			    const struct irq_affinity_desc *affinity)
 {
 	int ret, virq;
 
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 2c0c4d6d0f83..b1898514d9dc 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -414,7 +414,7 @@ int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 		ops->set_desc(&arg, desc);
 
 		virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
-					       dev_to_node(dev), &arg, false,
+					       dev_to_node(dev), &arg,
 					       desc->affinity);
 		if (virq < 0) {
 			ret = -ENOSPC;
-- 
2.17.1

