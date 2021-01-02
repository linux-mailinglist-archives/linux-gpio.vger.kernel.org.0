Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD332E8834
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Jan 2021 19:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbhABSTR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Jan 2021 13:19:17 -0500
Received: from os.inf.tu-dresden.de ([141.76.48.99]:44610 "EHLO
        os.inf.tu-dresden.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbhABSTQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Jan 2021 13:19:16 -0500
Received: from erwin.inf.tu-dresden.de ([141.76.48.80] helo=l4re.org)
        by os.inf.tu-dresden.de with esmtp (Exim 4.94)
        id 1kvlB9-0007bz-TE; Sat, 02 Jan 2021 18:59:03 +0100
From:   Adam Lackorzynski <adam@l4re.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, linusw@kernel.org,
        kaloz@openwrt.org, khalasa@piap.pl, andrew@lunn.ch,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: [PATCH 2/6] irqchip/armada-370-xp: Fix return check in IPI alloc
Date:   Sat,  2 Jan 2021 18:58:55 +0100
Message-Id: <20210102175859.335447-2-adam@l4re.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210102175859.335447-1-adam@l4re.org>
References: <20210102175859.335447-1-adam@l4re.org>
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
 drivers/irqchip/irq-armada-370-xp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 32938dfc0e46..b5e3aacdc2d1 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -430,9 +430,9 @@ static __init void armada_xp_ipi_init(struct device_node *node)
 		return;
 
 	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
-	base_ipi = __irq_domain_alloc_irqs(ipi_domain, -1, IPI_DOORBELL_END,
-					   NUMA_NO_NODE, NULL, false, NULL);
-	if (WARN_ON(!base_ipi))
+	base_ipi = irq_domain_alloc_irqs(ipi_domain, IPI_DOORBELL_END,
+					 NUMA_NO_NODE, NULL);
+	if (WARN_ON(base_ipi <= 0))
 		return;
 
 	set_smp_ipi_range(base_ipi, IPI_DOORBELL_END);
-- 
2.30.0.rc2

