Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE7B2E8833
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Jan 2021 19:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbhABSSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Jan 2021 13:18:34 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:44574 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbhABSSd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jan 2021 13:18:33 -0500
X-Greylist: delayed 1117 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Jan 2021 13:18:33 EST
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
        by os.inf.tu-dresden.de with esmtp (Exim 4.94)
        id 1kvlB9-0007bz-Co; Sat, 02 Jan 2021 18:59:03 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: [PATCH 1/6] irqchip/bcm2836: Fix return check in IPI alloc
Date:   Sat,  2 Jan 2021 18:58:54 +0100
Message-Id: <20210102175859.335447-1-adam@l4re.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

__irq_domain_alloc_irqs returns a negative error
code upon failure, not only 0. Also use irq_domain_alloc_irqs
to require less default arguments.

Signed-off-by: Adam Lackorzynski <adam@l4re.org>
---
 drivers/irqchip/irq-bcm2836.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index 5f5eb8877c41..e5878eadf90b 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -268,11 +268,10 @@ static void __init bcm2836_arm_irqchip_smp_init(void)
 	ipi_domain->flags |= IRQ_DOMAIN_FLAG_IPI_SINGLE;
 	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
 
-	base_ipi = __irq_domain_alloc_irqs(ipi_domain, -1, BITS_PER_MBOX,
-					   NUMA_NO_NODE, NULL,
-					   false, NULL);
+	base_ipi = irq_domain_alloc_irqs(ipi_domain, BITS_PER_MBOX,
+					 NUMA_NO_NODE, NULL);
 
-	if (WARN_ON(!base_ipi))
+	if (WARN_ON(base_ipi <= 0))
 		return;
 
 	set_smp_ipi_range(base_ipi, BITS_PER_MBOX);
-- 
2.30.0.rc2

