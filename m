Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868AE2C1E3A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 07:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgKXG2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 01:28:08 -0500
Received: from ozlabs.ru ([107.174.27.60]:51420 "EHLO ozlabs.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729552AbgKXG2H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 01:28:07 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
        by ozlabs.ru (Postfix) with ESMTP id 894A2AE8024F;
        Tue, 24 Nov 2020 01:17:57 -0500 (EST)
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
Subject: [PATCH kernel v4 4/8] genirq: Free IRQ descriptor via embedded kobject
Date:   Tue, 24 Nov 2020 17:17:16 +1100
Message-Id: <20201124061720.86766-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124061720.86766-1-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At the moment the IRQ descriptor is freed via the free_desc() helper.
We want to add reference counting to IRQ descriptors and there is already
kobj embedded into irq_desc which we want to reuse.

This shuffles free_desc()/etc to make it simply call kobject_put() and
moves all the cleanup into the kobject_release hook.

As a bonus, we do not need irq_sysfs_del() as kobj removes itself from
sysfs if it knows that it was added.

This should cause no behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 kernel/irq/irqdesc.c | 42 ++++++++++++------------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 1a7723604399..75374b7944b5 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -295,18 +295,6 @@ static void irq_sysfs_add(int irq, struct irq_desc *desc)
 	}
 }
 
-static void irq_sysfs_del(struct irq_desc *desc)
-{
-	/*
-	 * If irq_sysfs_init() has not yet been invoked (early boot), then
-	 * irq_kobj_base is NULL and the descriptor was never added.
-	 * kobject_del() complains about a object with no parent, so make
-	 * it conditional.
-	 */
-	if (irq_kobj_base)
-		kobject_del(&desc->kobj);
-}
-
 static int __init irq_sysfs_init(void)
 {
 	struct irq_desc *desc;
@@ -337,7 +325,6 @@ static struct kobj_type irq_kobj_type = {
 };
 
 static void irq_sysfs_add(int irq, struct irq_desc *desc) {}
-static void irq_sysfs_del(struct irq_desc *desc) {}
 
 #endif /* CONFIG_SYSFS */
 
@@ -419,39 +406,34 @@ static struct irq_desc *alloc_desc(int irq, int node, unsigned int flags,
 	return NULL;
 }
 
-static void irq_kobj_release(struct kobject *kobj)
-{
-	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-
-	free_masks(desc);
-	free_percpu(desc->kstat_irqs);
-	kfree(desc);
-}
-
 static void delayed_free_desc(struct rcu_head *rhp)
 {
 	struct irq_desc *desc = container_of(rhp, struct irq_desc, rcu);
 
+	free_masks(desc);
+	free_percpu(desc->kstat_irqs);
+	kfree(desc);
+}
+
+static void free_desc(unsigned int irq)
+{
+	struct irq_desc *desc = irq_to_desc(irq);
+
 	kobject_put(&desc->kobj);
 }
 
-static void free_desc(unsigned int irq)
+static void irq_kobj_release(struct kobject *kobj)
 {
-	struct irq_desc *desc = irq_to_desc(irq);
+	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
+	unsigned int irq = desc->irq_data.irq;
 
 	irq_remove_debugfs_entry(desc);
 	unregister_irq_proc(irq, desc);
 
 	/*
-	 * sparse_irq_lock protects also show_interrupts() and
-	 * kstat_irq_usr(). Once we deleted the descriptor from the
-	 * sparse tree we can free it. Access in proc will fail to
-	 * lookup the descriptor.
-	 *
 	 * The sysfs entry must be serialized against a concurrent
 	 * irq_sysfs_init() as well.
 	 */
-	irq_sysfs_del(desc);
 	delete_irq_desc(irq);
 
 	/*
-- 
2.17.1

