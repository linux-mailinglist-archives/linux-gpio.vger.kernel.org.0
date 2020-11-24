Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1805A2C1E39
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgKXG2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:28:08 -0500
Received: from ozlabs.ru ([107.174.27.60]:51418 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729188AbgKXG2H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:28:07 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id D511EAE80253;
        Tue, 24 Nov 2020 01:18:08 -0500 (EST)
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
Subject: [PATCH kernel v4 6/8] genirq/irqdomain: Move hierarchical IRQ cleanup to kobject_release
Date:   Tue, 24 Nov 2020 17:17:18 +1100
Message-Id: <20201124061720.86766-7-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This moves hierarchical domain's irqs cleanup into the kobject release
hook to make irq_domain_free_irqs() as simple as kobject_put.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/irqdomain.c | 43 +++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4779d912bb86..a0a81cc6c524 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -863,21 +863,9 @@ EXPORT_SYMBOL_GPL(irq_create_of_mapping);
  */
 void irq_dispose_mapping(unsigned int virq)
 {
-	struct irq_data *irq_data = irq_get_irq_data(virq);
-	struct irq_domain *domain;
+	struct irq_desc *desc = irq_to_desc(virq);
 
-	if (!virq || !irq_data)
-		return;
-
-	domain = irq_data->domain;
-	if (WARN_ON(domain == NULL))
-		return;
-
-	if (irq_domain_is_hierarchy(domain)) {
-		irq_domain_free_irqs(virq, 1);
-	} else {
-		irq_free_desc(virq);
-	}
+	kobject_put(&desc->kobj);
 }
 EXPORT_SYMBOL_GPL(irq_dispose_mapping);
 
@@ -1396,6 +1384,19 @@ int irq_domain_alloc_irqs_hierarchy(struct irq_domain *domain,
 	return domain->ops->alloc(domain, irq_base, nr_irqs, arg);
 }
 
+static void irq_domain_hierarchy_free_desc(struct irq_desc *desc)
+{
+	unsigned int virq = desc->irq_data.irq;
+	struct irq_data *data = irq_get_irq_data(virq);
+
+	mutex_lock(&irq_domain_mutex);
+	irq_domain_remove_irq(virq);
+	irq_domain_free_irqs_hierarchy(data->domain, virq, 1);
+	mutex_unlock(&irq_domain_mutex);
+
+	irq_domain_free_irq_data(virq, 1);
+}
+
 int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
 				 unsigned int nr_irqs, int node, void *arg,
 				 const struct irq_affinity_desc *affinity)
@@ -1430,7 +1431,10 @@ int __irq_domain_alloc_irqs_data(struct irq_domain *domain, int virq,
 	}
 
 	for (i = 0; i < nr_irqs; i++) {
+		struct irq_desc *desc = irq_to_desc(virq + i);
+
 		irq_domain_insert_irq(virq + i);
+		desc->free_irq = irq_domain_hierarchy_free_desc;
 	}
 	mutex_unlock(&irq_domain_mutex);
 
@@ -1675,14 +1679,11 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
 		 "NULL pointer, cannot free irq\n"))
 		return;
 
-	mutex_lock(&irq_domain_mutex);
-	for (i = 0; i < nr_irqs; i++)
-		irq_domain_remove_irq(virq + i);
-	irq_domain_free_irqs_hierarchy(data->domain, virq, nr_irqs);
-	mutex_unlock(&irq_domain_mutex);
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_desc *desc = irq_to_desc(virq + i);
 
-	irq_domain_free_irq_data(virq, nr_irqs);
-	irq_free_descs(virq, nr_irqs);
+		kobject_put(&desc->kobj);
+	}
 }
 
 /**
-- 
2.17.1

