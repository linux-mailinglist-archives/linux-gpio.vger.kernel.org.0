Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C442C1E3B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgKXG2J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:28:09 -0500
Received: from ozlabs.ru ([107.174.27.60]:51422 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729552AbgKXG2I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:28:08 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 2A578AE80251;
        Tue, 24 Nov 2020 01:18:02 -0500 (EST)
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
Subject: [PATCH kernel v4 5/8] genirq: Add free_irq hook for IRQ descriptor and use for mapping disposal
Date:   Tue, 24 Nov 2020 17:17:17 +1100
Message-Id: <20201124061720.86766-6-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We want to make the irq_desc.kobj's release hook free associated resources
but we do not want to pollute the irqdesc code with domains.

This adds a free_irq hook which is called when the last reference to
the descriptor is dropped.

The first user is mapped irqs. This potentially can break the existing
users; however they seem to do the right thing and call dispose once
per mapping.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/linux/irqdesc.h    |  1 +
 include/linux/irqdomain.h  |  2 --
 include/linux/irqhandler.h |  1 +
 kernel/irq/irqdesc.c       |  3 +++
 kernel/irq/irqdomain.c     | 14 ++++++++++++--
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 5745491303e0..6d44cb6a20ad 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -57,6 +57,7 @@ struct irq_desc {
 	struct irq_data		irq_data;
 	unsigned int __percpu	*kstat_irqs;
 	irq_flow_handler_t	handle_irq;
+	irq_free_handler_t	free_irq;
 	struct irqaction	*action;	/* IRQ action list */
 	unsigned int		status_use_accessors;
 	unsigned int		core_internal_state__do_not_mess_with_it;
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index a353b93ddf9e..ccca87cd3d15 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -381,8 +381,6 @@ extern int irq_domain_associate(struct irq_domain *domain, unsigned int irq,
 extern void irq_domain_associate_many(struct irq_domain *domain,
 				      unsigned int irq_base,
 				      irq_hw_number_t hwirq_base, int count);
-extern void irq_domain_disassociate(struct irq_domain *domain,
-				    unsigned int irq);
 
 extern unsigned int irq_create_mapping(struct irq_domain *host,
 				       irq_hw_number_t hwirq);
diff --git a/include/linux/irqhandler.h b/include/linux/irqhandler.h
index c30f454a9518..3dbc2bb764f3 100644
--- a/include/linux/irqhandler.h
+++ b/include/linux/irqhandler.h
@@ -10,5 +10,6 @@
 struct irq_desc;
 struct irq_data;
 typedef	void (*irq_flow_handler_t)(struct irq_desc *desc);
+typedef	void (*irq_free_handler_t)(struct irq_desc *desc);
 
 #endif
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 75374b7944b5..071363da8688 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -427,6 +427,9 @@ static void irq_kobj_release(struct kobject *kobj)
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
 	unsigned int irq = desc->irq_data.irq;
 
+	if (desc->free_irq)
+		desc->free_irq(desc);
+
 	irq_remove_debugfs_entry(desc);
 	unregister_irq_proc(irq, desc);
 
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 805478f81d96..4779d912bb86 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -485,7 +485,7 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
 	}
 }
 
-void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
+static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 {
 	struct irq_data *irq_data = irq_get_irq_data(irq);
 	irq_hw_number_t hwirq;
@@ -582,6 +582,13 @@ void irq_domain_associate_many(struct irq_domain *domain, unsigned int irq_base,
 }
 EXPORT_SYMBOL_GPL(irq_domain_associate_many);
 
+static void irq_mapped_free_desc(struct irq_desc *desc)
+{
+	unsigned int virq = desc->irq_data.irq;
+
+	irq_domain_disassociate(desc->irq_data.domain, virq);
+}
+
 /**
  * irq_create_direct_mapping() - Allocate an irq for direct mapping
  * @domain: domain to allocate the irq for or NULL for default domain
@@ -638,6 +645,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 {
 	struct device_node *of_node;
 	int virq;
+	struct irq_desc *desc;
 
 	pr_debug("irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
 
@@ -674,6 +682,9 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	pr_debug("irq %lu on domain %s mapped to virtual irq %u\n",
 		hwirq, of_node_full_name(of_node), virq);
 
+	desc = irq_to_desc(virq);
+	desc->free_irq = irq_mapped_free_desc;
+
 	return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping);
@@ -865,7 +876,6 @@ void irq_dispose_mapping(unsigned int virq)
 	if (irq_domain_is_hierarchy(domain)) {
 		irq_domain_free_irqs(virq, 1);
 	} else {
-		irq_domain_disassociate(domain, virq);
 		irq_free_desc(virq);
 	}
 }
-- 
2.17.1

