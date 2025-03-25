Return-Path: <linux-gpio+bounces-17986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40FA70C89
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 23:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC453B0DF8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 22:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAB2269B1B;
	Tue, 25 Mar 2025 22:08:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A58253B5D;
	Tue, 25 Mar 2025 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742940480; cv=none; b=JRcjE8zm66ps4b8yUSbYuBafY2HUBoepwBQyIr4r8nhzC7KpZYbuGOEo5ddOsurSrHwVxLT0XKxZjpyoNwX4J3yeYZZZ4e9Cirz6uwYVOHNIqUVs5vNXIa0mnCy8yJPf9WnJtEFhPjshLNjdwGH9zh+MYf6tOl+2Tab5qUpimSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742940480; c=relaxed/simple;
	bh=uP0LpVK1GZOT36IlyoC1Qcu+yKmI81ZTBqINksfQZkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3IqTKLWTN09cYMWkiADHNYbzt+/xrnXawN9RSgH7+CvWOoVQAx0vzoCrpbqHofw2M5vfROQN0lsM0WSN7zmARm6J8zZXG3PkAImqO86Ue+FaPJ9zU6dT0aITv2CSpSZuzbC8VGTnYXdkz/fVHA4R76VeAbTu08fT/AB/vY1JHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 354BB3432CC;
	Tue, 25 Mar 2025 22:07:54 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Mar 2025 06:06:19 +0800
Subject: [PATCH v3 1/2] irqdomain: support three-cell scheme interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-04-gpio-irq-threecell-v3-1-aab006ab0e00@gentoo.org>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uP0LpVK1GZOT36IlyoC1Qcu+yKmI81ZTBqINksfQZkA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn4ykwWkBNYSDwpUk3cXnMXY9v3hh7E8IGbP/2w
 Yq21KgOsW6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ+MpMF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aRlD/4xH46DheyWQknACf
 fYhVEkHGZXD9DMjSNMoXrHEyBTFIko/ZhrQl6VuTY30UiqNiYouf3OiQEe6GZAGnafqIhtcoafK
 kvy6zyuVMB31DDSSxVONd+19RH8i/SLe5zjqZ/EfJ9pzSlmVSoFZWS/BWSKpGFlxHFFIxCUN18X
 Xy0W0rWun/3fI6u0zgXMH/qLauKMr/q/nkn9eLlZZxvM2tEhZ4ANyScJgM8TcSGUZsKRgFD+whB
 cSO58asNaduw8YqU+SFFot3a0MOvX9tACyvJL61AyOTvL4cWEMrDX7t0DlZk3wDggtYiR94Uroy
 W6BB3vLerZ6VMhEBbMBFcMv9HfXlgtmidZJsSwNoplXrjZynNHBwUEktzb4e2cjmmbLRq+fM2KD
 eYJGVG7JxSDK5z4i/TUNO98df/nNU88ePejT4py3+tw2IGMLh3IOv0mkREPpm/9GD7jRxzW/g6/
 sXD5Nm7LYeJ9PGcHChKGCnQvFnqQfZb1sNf/ecXaHpxMeR08CeUvtZpyx5SX5w+j5+bmx2fbZyi
 wt9fsz5dfKi/dX9lauQnN1GLKSw3KckxJSl6rCeGAZKfZWN8I/UHvY16vUYTpZEsVkb477iRg/k
 YOExL3fcDoNBxyC6JD5CnL5/VcZeXQ/MIMEuxrdi06qvFtRjHWsdkPQRST+cp6aRZpGQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new function *_twothreecell() to extend support to parse three-cell
interrupts which encoded as <instance hwirq irqflag>, the translate
function will retrieve irq number and flag from last two cells.

This API will be used in gpio irq driver which need to work with
two or three cells cases.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
I've also adjusted function irq_domain_translate_{two,three}cell param in
file include/linux/irqdomain.h, to make it fit with 100 column style,
also sort them in one to three cells logical order.
---
 include/linux/irqdomain.h | 20 ++++++++---------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index e432b6a12a32f9f16ec1ea2fa8e24a649d55caae..ce77d1bf79b2931c28dee7456013d82b6552cb5e 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -571,16 +571,16 @@ int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
 int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
-
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type);
+
+int irq_domain_translate_onecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twocell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type);
 
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..1c26ee119914dbd113b10f6d968e036ca887c793 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1132,6 +1132,31 @@ int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
 }
 EXPORT_SYMBOL_GPL(irq_domain_xlate_twocell);
 
+/**
+ * irq_domain_xlate_twothreecell() - Generic xlate for direct two or three cell bindings
+ * @d:		Interrupt domain involved in the translation
+ * @ctrlr:	The device tree node for the device whose interrupt is translated
+ * @intspec:	The interrupt specifier data from the device tree
+ * @intsize:	The number of entries in @intspec
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree IRQ specifier translation function which works with two or three cell
+ * bindings where the cell values map directly to the hwirq number
+ * and linux irq flags.
+ */
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type)
+{
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+
+	return irq_domain_translate_twothreecell(d, &fwspec, out_hwirq, out_type);
+}
+EXPORT_SYMBOL_GPL(irq_domain_xlate_twothreecell);
+
 /**
  * irq_domain_xlate_onetwocell() - Generic xlate for one or two cell bindings
  * @d:		Interrupt domain involved in the translation
@@ -1216,6 +1241,37 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
 
+/**
+ * irq_domain_translate_twothreecell() - Generic translate for direct two or three cell
+ * bindings
+ * @d:		Interrupt domain involved in the translation
+ * @fwspec:	The firmware interrupt specifier to translate
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree IRQ specifier translation function which works with two or three cell
+ * bindings where the cell values map directly to the hwirq number
+ * and linux irq flags.
+ */
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (fwspec->param_count == 2) {
+		*out_hwirq = fwspec->param[0];
+		*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	if (fwspec->param_count == 3) {
+		*out_hwirq = fwspec->param[1];
+		*out_type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_twothreecell);
+
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)
 {

-- 
2.48.1


