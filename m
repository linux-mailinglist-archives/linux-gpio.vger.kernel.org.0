Return-Path: <linux-gpio+bounces-16874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C8A4AE4D
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 00:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A343B46DB
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9371E8335;
	Sat,  1 Mar 2025 23:16:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBEE1E832A;
	Sat,  1 Mar 2025 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740870965; cv=none; b=pAnJbylBqrgsQ+ugMau5EnAmLkBe5Qqh5sCBfAAnUNb1CyPvu5VgKEGTo4MlRuNIKLafb81qMNZ4FUOL+s3AprLH/vaj/zR1t4lNWSrWMgKyxL0QESnRTeM4NQ0u7T//CQaCmspCxWxlSu9MR5RJX70AuSByy5B0VMhFuWDKrjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740870965; c=relaxed/simple;
	bh=zxeDZ3m8ghHRYMlv6C610F+PSK9l52UHp2Zz1E/BhGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onCa3cp9EuFkHBSLRp5uh25jQlzbpkLILDHvHWV3F2s2XiyoKesFkKcCoT7sHnOvV3fWJM2xxb4tNMsRJhYn5xxOfOvDQqPGIQzILMbKjPHYsgZOvcGMViYlDMblZC3gz97rNmtRGkjx8lhUq0Bth3i6f2ONc0oe+HWYWppH7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3D68D342FDA;
	Sat, 01 Mar 2025 23:15:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 02 Mar 2025 07:15:32 +0800
Subject: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5234; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=zxeDZ3m8ghHRYMlv6C610F+PSK9l52UHp2Zz1E/BhGA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5Uk+AzYi+BPwfo0u0Stqep6nxdIVjnSsf4k4
 ToTybOqLRCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVJF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VLRD/4gh4ycgW6fd+rGgF
 lC8dthgXYX//WESxt06UX5ixqiZJrwbu67k5AxYnfffv9c900EnHx5kNLXRkK5lSMOVnSgRbmYb
 vZNpd5dgbrInfKaULXXlcCGDAk+xeWzUOpF0Sld5t15FFO7A3AnWLAwcOelYOM7r7lWkcuaxoHv
 Qo4e07SkxGBBMBn3PrkSuPj7NFXziJ3Lw7/sD1J2N6d9pUfk5IjSE1UQpaQDNKyHFhGjbPRGA1Y
 ttKAxiWA4gk6EIbWDPw7XOjCrOUPR29RK9OqEiPKRUgLpcydEmC+9RDtoeGVh64acmC47gu0/G8
 DPdZrKSJx+JwP+k7UyaYSoRawmyJgR58q67aNaycDJphS9x8ebBFYyAoH1+VL6FQqD2mBFeOsNm
 nd2ArA9SNkMoVa01d1/2LbqUab0ayo0eyyGJmdMEof97QCsnruA6Z2irAZlg3hxDxzcgqcvjM8h
 4wGVg1se7Kut7d3GRBGmiX4w2wk9PS/XI1GeqAq3XYHwwrjSEHuC9K14GBuqRlSTXDgXHbeo9RF
 C/WI9Wai3fuyoReF6ipNlLU5yCobNx8L28UVDnIM1PM0iRCj64UJ2KPkdpx8zr1gQ5XpOKrzOU5
 OHnpZmgikaVq5ADZgbZ/+wU1nwLANhu8MNwbOipW/Vl1KqZxYKUvrgy9i84yxY6353Kw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The is a prerequisite patch to support parsing three-cell
interrupts which encoded as <instance hwirq irqflag>,
the translate function will always retrieve irq number and
flag from last two cells.

In this patch, we introduce a generic interrupt cells translation
function, others functions will be inline version.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/linux/irqdomain.h | 37 +++++++++++++++++++++++--------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++----------------------------
 2 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index e432b6a12a32f9f16ec1ea2fa8e24a649d55caae..d96796263a2e177140f928cb369656a44dd45dda 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -572,15 +572,34 @@ int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
 
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+int irq_domain_translate_cells(struct irq_domain *d,
+			       struct irq_fwspec *fwspec,
+			       unsigned long *out_hwirq,
+			       unsigned int *out_type);
+
+static inline int irq_domain_translate_onecell(struct irq_domain *d,
+					       struct irq_fwspec *fwspec,
+					       unsigned long *out_hwirq,
+					       unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
+
+static inline int irq_domain_translate_twocell(struct irq_domain *d,
+					       struct irq_fwspec *fwspec,
+					       unsigned long *out_hwirq,
+					       unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
+
+static inline int irq_domain_translate_threecell(struct irq_domain *d,
+						 struct irq_fwspec *fwspec,
+						 unsigned long *out_hwirq,
+						 unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
 
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..8d3b357b7dedbb2c274d4761c315e430b1d35610 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1171,50 +1171,38 @@ const struct irq_domain_ops irq_domain_simple_ops = {
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
 
 /**
- * irq_domain_translate_onecell() - Generic translate for direct one cell
+ * irq_domain_translate_cells() - Generic translate for up to three cells
  * bindings
  * @d:		Interrupt domain involved in the translation
  * @fwspec:	The firmware interrupt specifier to translate
  * @out_hwirq:	Pointer to storage for the hardware interrupt number
  * @out_type:	Pointer to storage for the interrupt type
  */
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type)
+int irq_domain_translate_cells(struct irq_domain *d,
+			       struct irq_fwspec *fwspec,
+			       unsigned long *out_hwirq,
+			       unsigned int *out_type)
 {
-	if (WARN_ON(fwspec->param_count < 1))
-		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = IRQ_TYPE_NONE;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
+	unsigned int cells = fwspec->param_count;
 
-/**
- * irq_domain_translate_twocell() - Generic translate for direct two cell
- * bindings
- * @d:		Interrupt domain involved in the translation
- * @fwspec:	The firmware interrupt specifier to translate
- * @out_hwirq:	Pointer to storage for the hardware interrupt number
- * @out_type:	Pointer to storage for the interrupt type
- *
- * Device Tree IRQ specifier translation function which works with two cell
- * bindings where the cell values map directly to the hwirq number
- * and linux irq flags.
- */
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type)
-{
-	if (WARN_ON(fwspec->param_count < 2))
+	switch (cells) {
+	case 1:
+		*out_hwirq = fwspec->param[0];
+		*out_type = IRQ_TYPE_NONE;
+		return 0;
+	case 2 ... 3:
+		/*
+		 * For multi cell translations the hardware interrupt number
+		 * and type are in the last two cells.
+		 */
+		*out_hwirq = fwspec->param[cells - 2];
+		*out_type = fwspec->param[cells - 1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	default:
 		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
-	return 0;
+	}
 }
-EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
+EXPORT_SYMBOL_GPL(irq_domain_translate_cells);
 
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)

-- 
2.48.1


