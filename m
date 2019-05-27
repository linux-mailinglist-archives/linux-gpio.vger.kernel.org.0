Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E02E2B337
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 13:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfE0L1b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 07:27:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33644 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfE0L1b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 07:27:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so16591283wrx.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2019 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9EPMw9ZDt6r9OnVuoXUM9uuIE5EfX0cbi1r9IY8+97M=;
        b=QwirmDGBiji1JuzbW6wei+YUkJRNV7UyseHQtII77EPKytrbdGHXVZVF5OqKoqqXR8
         FcunUebz7zm7cad7SWqWjao8rKXcRbRL7lLb0YymFhJBvdwHRuEz6MNcp3/sFDchwtdX
         b3hzKBrBeeqH1cSC39RhONf4Jo+xAIJXEnDVVuE/W6Vmjnm2NISvQ2K04Yk1uws/O/CA
         a9MYK4Rvj2o/EYDvY/Usu2nn7U7SjpMVON931OxVcB1kfM/Zrt08+liOEFb3qPupgU7X
         0HuIbbM4c08DaOq09GcdTASL6t1b8uoVK7uYJcTA3lDW4e9cG2M/y2iNDXNY4Sgq8mCs
         G5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EPMw9ZDt6r9OnVuoXUM9uuIE5EfX0cbi1r9IY8+97M=;
        b=AlHTzr1vcuqEyGcKV9zWGZE8sl14YfTbVAPM3esK3undn4XJAHT7rQIMe/GX5PLyro
         UGGhQhl1nl/DAJ1Ub/2lYE/YoBNMvb3/WGwyXJcq5YsRrmcKeTKodsu46bb1jZgNrqoe
         Wk6RYrUUHXTlX3EHCAqqXHxPA9BOmxq1C9EvAPGYQpIxNfFI1FjvjKyDtqcUcMWBhPki
         zVrgC2ATlBAk2qT1sUX4sHrLXO9F/opHZlv237lBLVEdj/dEV5A7HcteTygM1cD1ZucW
         e51zAuz1UCDIZeQW+fVDrbEN/ZVC81OPqt+aZuyWVgI3cg6BwgCXN0i1XCcSXH9pAQ4c
         pJmg==
X-Gm-Message-State: APjAAAXGpZ+rkoAQmmKS9hlzYr618wucQduWZcgrmfUv5z54g2Br8RFN
        pXeHTdLnuoZP7dKxf4JoPCbEXA==
X-Google-Smtp-Source: APXvYqzTfClU/CiJaI98gbBQk9qFq+qk2vEqBO1yGu7b5coS9RX+IzQBWrCPVrrfSDCMo91F/Ygomg==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr7222991wru.336.1558956449254;
        Mon, 27 May 2019 04:27:29 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:ccdd:dadc:1517:f416])
        by smtp.gmail.com with ESMTPSA id l6sm9677747wmi.24.2019.05.27.04.27.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 04:27:28 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Graeme Gregory <graeme.gregory@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>
Subject: [PATCH v3 3/4] irqchip/exiu: implement ACPI support
Date:   Mon, 27 May 2019 13:27:19 +0200
Message-Id: <20190527112720.2266-4-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Expose the existing EXIU hierarchical irqchip domain code to permit
the interrupt controller to be used as the irqchip component of a
GPIO controller on ACPI systems, or as the target of ordinary
interrupt resources.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/irqchip/irq-sni-exiu.c | 76 +++++++++++++++++---
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index fef7c2437dfb..30a323a2b332 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -134,9 +135,13 @@ static int exiu_domain_translate(struct irq_domain *domain,
 
 		*hwirq = fwspec->param[1] - info->spi_base;
 		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
-		return 0;
+	} else {
+		if (fwspec->param_count != 2)
+			return -EINVAL;
+		*hwirq = fwspec->param[0];
+		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
 	}
-	return -EINVAL;
+	return 0;
 }
 
 static int exiu_domain_alloc(struct irq_domain *dom, unsigned int virq,
@@ -147,16 +152,21 @@ static int exiu_domain_alloc(struct irq_domain *dom, unsigned int virq,
 	struct exiu_irq_data *info = dom->host_data;
 	irq_hw_number_t hwirq;
 
-	if (fwspec->param_count != 3)
-		return -EINVAL;	/* Not GIC compliant */
-	if (fwspec->param[0] != GIC_SPI)
-		return -EINVAL;	/* No PPI should point to this domain */
+	parent_fwspec = *fwspec;
+	if (is_of_node(dom->parent->fwnode)) {
+		if (fwspec->param_count != 3)
+			return -EINVAL;	/* Not GIC compliant */
+		if (fwspec->param[0] != GIC_SPI)
+			return -EINVAL;	/* No PPI should point to this domain */
 
+		hwirq = fwspec->param[1] - info->spi_base;
+	} else {
+		hwirq = fwspec->param[0];
+		parent_fwspec.param[0] = hwirq + info->spi_base + 32;
+	}
 	WARN_ON(nr_irqs != 1);
-	hwirq = fwspec->param[1] - info->spi_base;
 	irq_domain_set_hwirq_and_chip(dom, virq, hwirq, &exiu_irq_chip, info);
 
-	parent_fwspec = *fwspec;
 	parent_fwspec.fwnode = dom->parent->fwnode;
 	return irq_domain_alloc_irqs_parent(dom, virq, nr_irqs, &parent_fwspec);
 }
@@ -245,3 +255,53 @@ static int __init exiu_dt_init(struct device_node *node,
 	return -ENOMEM;
 }
 IRQCHIP_DECLARE(exiu, "socionext,synquacer-exiu", exiu_dt_init);
+
+#ifdef CONFIG_ACPI
+static int exiu_acpi_probe(struct platform_device *pdev)
+{
+	struct irq_domain *domain;
+	struct exiu_irq_data *data;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to parse memory resource\n");
+		return -ENXIO;
+	}
+
+	data = exiu_init(dev_fwnode(&pdev->dev), res);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	domain = acpi_irq_create_hierarchy(0, NUM_IRQS, dev_fwnode(&pdev->dev),
+					   &exiu_domain_ops, data);
+	if (!domain) {
+		dev_err(&pdev->dev, "failed to create IRQ domain\n");
+		goto out_unmap;
+	}
+
+	dev_info(&pdev->dev, "%d interrupts forwarded\n", NUM_IRQS);
+
+	return 0;
+
+out_unmap:
+	iounmap(data->base);
+	kfree(data);
+	return -ENOMEM;
+}
+
+static const struct acpi_device_id exiu_acpi_ids[] = {
+	{ "SCX0008" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, exiu_acpi_ids);
+
+static struct platform_driver exiu_driver = {
+	.driver = {
+		.name = "exiu",
+		.acpi_match_table = exiu_acpi_ids,
+	},
+	.probe = exiu_acpi_probe,
+};
+builtin_platform_driver(exiu_driver);
+#endif
-- 
2.20.1

