Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1F432D5E6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbhCDPEw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:04:52 -0500
Received: from mga05.intel.com ([192.55.52.43]:45937 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233141AbhCDPET (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 10:04:19 -0500
IronPort-SDR: rO/34UFRJeFSZwvOXCfTbTIHxqQ968WuvbVUJ6rvRa53uqQZFqt9UPeD3jrKXfxfeu1C9DQxuJ
 Q5fxgnmFwASg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="272434319"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="272434319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 07:02:33 -0800
IronPort-SDR: ejtO0G/+NyBvXAUeE8vde46ZcFOhKk+mp0N4WyWzegdTbAMObUkQ4aAwsxj26DFzjxfrrYto3P
 1ZI99toT5DQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445758478"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 04 Mar 2021 07:02:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8370E29E; Thu,  4 Mar 2021 17:02:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 1/5] irqdomain: Introduce irq_domain_create_simple() API
Date:   Thu,  4 Mar 2021 17:02:11 +0200
Message-Id: <20210304150215.80652-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304150215.80652-1-andriy.shevchenko@linux.intel.com>
References: <20210304150215.80652-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus Walleij pointed out that ird_domain_add_simple() gained
additional functionality and can't be anymore replaced with
a simple conditional. In preparation to upgrade GPIO library
to use fwnode, introduce irq_domain_create_simple() API which is
functional equivalent to the existing irq_domain_add_simple(),
but takes a pointer to the struct fwnode_handle as a parameter.

While at it, amend documentation to mention irq_domain_create_*()
functions where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/irq/irq-domain.rst | 22 ++++++++++++----------
 include/linux/irqdomain.h                 |  5 +++++
 kernel/irq/irqdomain.c                    | 16 +++++++++++++---
 3 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index a77c24c27f7b..8214e215a8bf 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -42,10 +42,10 @@ irq_domain usage
 ================
 
 An interrupt controller driver creates and registers an irq_domain by
-calling one of the irq_domain_add_*() functions (each mapping method
-has a different allocator function, more on that later).  The function
-will return a pointer to the irq_domain on success.  The caller must
-provide the allocator function with an irq_domain_ops structure.
+calling one of the irq_domain_add_*() or irq_domain_create_*() functions
+(each mapping method has a different allocator function, more on that later).
+The function will return a pointer to the irq_domain on success. The caller
+must provide the allocator function with an irq_domain_ops structure.
 
 In most cases, the irq_domain will begin empty without any mappings
 between hwirq and IRQ numbers.  Mappings are added to the irq_domain
@@ -147,6 +147,7 @@ Legacy
 	irq_domain_add_simple()
 	irq_domain_add_legacy()
 	irq_domain_add_legacy_isa()
+	irq_domain_create_simple()
 	irq_domain_create_legacy()
 
 The Legacy mapping is a special case for drivers that already have a
@@ -169,13 +170,13 @@ supported.  For example, ISA controllers would use the legacy map for
 mapping Linux IRQs 0-15 so that existing ISA drivers get the correct IRQ
 numbers.
 
-Most users of legacy mappings should use irq_domain_add_simple() which
-will use a legacy domain only if an IRQ range is supplied by the
-system and will otherwise use a linear domain mapping. The semantics
-of this call are such that if an IRQ range is specified then
+Most users of legacy mappings should use irq_domain_add_simple() or
+irq_domain_create_simple() which will use a legacy domain only if an IRQ range
+is supplied by the system and will otherwise use a linear domain mapping.
+The semantics of this call are such that if an IRQ range is specified then
 descriptors will be allocated on-the-fly for it, and if no range is
-specified it will fall through to irq_domain_add_linear() which means
-*no* irq descriptors will be allocated.
+specified it will fall through to irq_domain_add_linear() or
+irq_domain_create_linear() which means *no* irq descriptors will be allocated.
 
 A typical use case for simple domains is where an irqchip provider
 is supporting both dynamic and static IRQ assignments.
@@ -186,6 +187,7 @@ that the driver using the simple domain call irq_create_mapping()
 before any irq_find_mapping() since the latter will actually work
 for the static IRQ assignment case.
 
+irq_domain_add_simple() and irq_domain_create_simple() as well as
 irq_domain_add_legacy() and irq_domain_create_legacy() are functionally
 equivalent, except for the first argument is different - the former
 accepts an Open Firmware specific 'struct device_node', while the latter
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 42d196805f58..1d4a8e7c5d5f 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -265,6 +265,11 @@ struct irq_domain *irq_domain_add_simple(struct device_node *of_node,
 					 unsigned int first_irq,
 					 const struct irq_domain_ops *ops,
 					 void *host_data);
+struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
+					    unsigned int size,
+					    unsigned int first_irq,
+					    const struct irq_domain_ops *ops,
+					    void *host_data);
 struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
 					 unsigned int size,
 					 unsigned int first_irq,
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 288151393a06..418548ea13cf 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -317,10 +317,20 @@ struct irq_domain *irq_domain_add_simple(struct device_node *of_node,
 					 unsigned int first_irq,
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
+{
+	return irq_domain_create_simple(of_node_to_fwnode(of_node), size, first_irq, ops, host_data);
+}
+EXPORT_SYMBOL_GPL(irq_domain_add_simple);
+
+struct irq_domain *irq_domain_create_simple(struct fwnode_handle *fwnode,
+					    unsigned int size,
+					    unsigned int first_irq,
+					    const struct irq_domain_ops *ops,
+					    void *host_data)
 {
 	struct irq_domain *domain;
 
-	domain = __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, host_data);
+	domain = __irq_domain_add(fwnode, size, size, 0, ops, host_data);
 	if (!domain)
 		return NULL;
 
@@ -328,7 +338,7 @@ struct irq_domain *irq_domain_add_simple(struct device_node *of_node,
 		if (IS_ENABLED(CONFIG_SPARSE_IRQ)) {
 			/* attempt to allocated irq_descs */
 			int rc = irq_alloc_descs(first_irq, first_irq, size,
-						 of_node_to_nid(of_node));
+						 of_node_to_nid(to_of_node(fwnode)));
 			if (rc < 0)
 				pr_info("Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n",
 					first_irq);
@@ -338,7 +348,7 @@ struct irq_domain *irq_domain_add_simple(struct device_node *of_node,
 
 	return domain;
 }
-EXPORT_SYMBOL_GPL(irq_domain_add_simple);
+EXPORT_SYMBOL_GPL(irq_domain_create_simple);
 
 /**
  * irq_domain_add_legacy() - Allocate and register a legacy revmap irq_domain.
-- 
2.30.1

