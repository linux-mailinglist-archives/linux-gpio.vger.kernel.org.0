Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B874A2C1E36
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgKXG1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:27:38 -0500
Received: from ozlabs.ru ([107.174.27.60]:51272 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727731AbgKXG1i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:27:38 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 55E0EAE80241;
        Tue, 24 Nov 2020 01:17:45 -0500 (EST)
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
Subject: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ allocation
Date:   Tue, 24 Nov 2020 17:17:14 +1100
Message-Id: <20201124061720.86766-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
passes realloc==true. There is no obvious reason for handling this
specific case in the generic code.

This splits out __irq_domain_alloc_irqs_data() to make it clear what
IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.

This should cause no behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/linux/irqdomain.h      |  3 ++
 arch/x86/kernel/apic/io_apic.c | 13 +++--
 kernel/irq/irqdomain.c         | 89 ++++++++++++++++++++--------------
 3 files changed, 65 insertions(+), 40 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 71535e87109f..6cc37bba9951 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -470,6 +470,9 @@ static inline struct irq_domain *irq_domain_add_hierarchy(struct irq_domain *par
 					   ops, host_data);
 }
 
+extern int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
+					unsigned int nr_irqs, int node, void *arg,
+					const struct irq_affinity_desc *affinity);
 extern int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 				   unsigned int nr_irqs, int node, void *arg,
 				   bool realloc,
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 7b3c7e0d4a09..df9c0ab3a119 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -970,9 +970,14 @@ static int alloc_irq_from_domain(struct irq_domain *domain, int ioapic, u32 gsi,
 		return -1;
 	}
 
-	return __irq_domain_alloc_irqs(domain, irq, 1,
-				       ioapic_alloc_attr_node(info),
-				       info, legacy, NULL);
+	if (irq == -1 || !legacy)
+		return __irq_domain_alloc_irqs(domain, irq, 1,
+					       ioapic_alloc_attr_node(info),
+					       info, false, NULL);
+
+	return __irq_domain_alloc_irqs_data(domain, irq, 1,
+					    ioapic_alloc_attr_node(info),
+					    info, NULL);
 }
 
 /*
@@ -1006,7 +1011,7 @@ static int alloc_isa_irq_from_domain(struct irq_domain *domain,
 			return -ENOMEM;
 	} else {
 		info->flags |= X86_IRQ_ALLOC_LEGACY;
-		irq = __irq_domain_alloc_irqs(domain, irq, 1, node, info, true,
+		irq = __irq_domain_alloc_irqs_data(domain, irq, 1, node, info,
 					      NULL);
 		if (irq >= 0) {
 			irq_data = irq_domain_get_irq_data(domain, irq);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cf8b374b892d..ca5c78366c85 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1386,6 +1386,51 @@ int irq_domain_alloc_irqs_hierarchy(struct irq_domain *domain,
 	return domain->ops->alloc(domain, irq_base, nr_irqs, arg);
 }
 
+int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
+				 unsigned int nr_irqs, int node, void *arg,
+				 const struct irq_affinity_desc *affinity)
+{
+	int i, ret;
+
+	if (domain == NULL) {
+		domain = irq_default_domain;
+		if (WARN(!domain, "domain is NULL; cannot allocate IRQ\n"))
+			return -EINVAL;
+	}
+
+	if (irq_domain_alloc_irq_data(domain, virq, nr_irqs)) {
+		pr_debug("cannot allocate memory for IRQ%d\n", virq);
+		ret = -ENOMEM;
+		goto out_free_irq_data;
+	}
+
+	mutex_lock(&irq_domain_mutex);
+	ret = irq_domain_alloc_irqs_hierarchy(domain, virq, nr_irqs, arg);
+	if (ret < 0) {
+		mutex_unlock(&irq_domain_mutex);
+		goto out_free_irq_data;
+	}
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = irq_domain_trim_hierarchy(virq + i);
+		if (ret) {
+			mutex_unlock(&irq_domain_mutex);
+			goto out_free_irq_data;
+		}
+	}
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_insert_irq(virq + i);
+	}
+	mutex_unlock(&irq_domain_mutex);
+
+	return virq;
+
+out_free_irq_data:
+	irq_domain_free_irq_data(virq, nr_irqs);
+	return ret;
+}
+
 /**
  * __irq_domain_alloc_irqs - Allocate IRQs from domain
  * @domain:	domain to allocate from
@@ -1412,7 +1457,7 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 			    unsigned int nr_irqs, int node, void *arg,
 			    bool realloc, const struct irq_affinity_desc *affinity)
 {
-	int i, ret, virq;
+	int ret, virq;
 
 	if (domain == NULL) {
 		domain = irq_default_domain;
@@ -1420,47 +1465,19 @@ int __irq_domain_alloc_irqs(struct irq_domain *domain, int irq_base,
 			return -EINVAL;
 	}
 
-	if (realloc && irq_base >= 0) {
-		virq = irq_base;
-	} else {
-		virq = irq_domain_alloc_descs(irq_base, nr_irqs, 0, node,
-					      affinity);
-		if (virq < 0) {
-			pr_debug("cannot allocate IRQ(base %d, count %d)\n",
-				 irq_base, nr_irqs);
-			return virq;
-		}
+	virq = irq_domain_alloc_descs(irq_base, nr_irqs, 0, node, affinity);
+	if (virq < 0) {
+		pr_debug("cannot allocate IRQ(base %d, count %d)\n",
+			 irq_base, nr_irqs);
+		return virq;
 	}
 
-	if (irq_domain_alloc_irq_data(domain, virq, nr_irqs)) {
-		pr_debug("cannot allocate memory for IRQ%d\n", virq);
-		ret = -ENOMEM;
+	ret = __irq_domain_alloc_irqs_data(domain, virq, nr_irqs, node, arg, affinity);
+	if (ret <= 0)
 		goto out_free_desc;
-	}
-
-	mutex_lock(&irq_domain_mutex);
-	ret = irq_domain_alloc_irqs_hierarchy(domain, virq, nr_irqs, arg);
-	if (ret < 0) {
-		mutex_unlock(&irq_domain_mutex);
-		goto out_free_irq_data;
-	}
-
-	for (i = 0; i < nr_irqs; i++) {
-		ret = irq_domain_trim_hierarchy(virq + i);
-		if (ret) {
-			mutex_unlock(&irq_domain_mutex);
-			goto out_free_irq_data;
-		}
-	}
-	
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_insert_irq(virq + i);
-	mutex_unlock(&irq_domain_mutex);
 
 	return virq;
 
-out_free_irq_data:
-	irq_domain_free_irq_data(virq, nr_irqs);
 out_free_desc:
 	irq_free_descs(virq, nr_irqs);
 	return ret;
-- 
2.17.1

