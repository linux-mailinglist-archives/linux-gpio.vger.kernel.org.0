Return-Path: <linux-gpio+bounces-32360-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOH4K4DspGmnvwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32360-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD431D25B9
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57E30300D14C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 01:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EB3283FE5;
	Mon,  2 Mar 2026 01:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DzS5rec2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0F219EB;
	Mon,  2 Mar 2026 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416106; cv=none; b=dxwCGlsSRzt1+MgrbP5lyC97RzC+wN3xcncHroh7rfRAslZCqNeS9gPMz1OVaELgNk0eEcZy9JSMRP3XB3pBdXquYYJdYkG6spcj+JEnHkGKa6zR7OSi58Pkemj/ONdlX2lCACSKM/GTIoez/K22vg/2yqZu0vDK7l+Lgo9QurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416106; c=relaxed/simple;
	bh=SziAkpSHWbeImyFl0/CBZIksakQBxY9UYw+jp3aYujc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=PRxQPMOae3w/kYqCw1UvSX25thinsvOB/49rEJ+sKOYwYbwqawTuzpvtSymsjjKjJutit/hW0KAnI+bp1dosGrujTC/2JGiUkJdW+Kl9lOSMDFgo57CKxDzyxkwlh6b5Br5q/IMRzcEDCldzvxni/LiT7vHPqZF/FLZn5NelLv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DzS5rec2; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772416099; bh=KaS9w6Dn8fE+paenJpbtlBUta8kyhmLeaPAvI2MbR60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DzS5rec2J5PtTaS/tdRyVWU5v8deOFFjq7r6dMt71R+f8ZI4RMOzhYzPqEGtnCYd+
	 551dsJ8PVbghlgmd07H/1pKnpVigX12eFqZA2IHYxCSZ/ekBGC4dHv4rGNeRxhXvzL
	 WWKxqPkh98fXyW9epR20W5Ft6ARbw7xk7Hj0LquA=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C0CB9282; Mon, 02 Mar 2026 09:48:12 +0800
X-QQ-mid: xmsmtpt1772416097tw9h9uv8f
Message-ID: <tencent_F52148BE69542DF964B847D64D3DCF19AC0A@qq.com>
X-QQ-XMAILINFO: MUg1CRXVDcdjdLl5Q35RWfRnXr2WctloZqbEWvdtn82dP904jjqASu48lOJgiO
	 eZceZNztl84CCReBCccq0U/ggl9dgqYT7GnRUMjsi82Pys+Whf9nQd7Y/M8RyhaDxyyJMpP3NenH
	 orwHZ1rFY4nR2q8trgWEEcjeq+bTi6M2FPBd/rsBex8aXPg+xNkhtw+yoMdjfBBINdZQHRkq/Edm
	 osBsx79IVENlmmZz5EZ0Sj0x1HLC4lYvK7CTWLbJEiZgNpWnN28b563nyZggRlMaDwhQWFzY805g
	 E2/lwIx3pgENvP1ShAPF++bqp/Zjhno5uJ/Bf0B3OhnbIWP00liu5ahbt0oj1isJJiaGZZKYcERR
	 Ce2kDi2vnymUDDWnym5kBoBFIWvsoCUYMqYQgY6OSMac0NfUIM/LPRsn5KNzSglcmCtnYtXwlZBq
	 oO3m/CDgsp/irpypsWieomIVrahzOlRMCF2TUOY1uYF5CYmzEWl22Gqpg2VRyUr/iqCTdBHOvkgH
	 ODTJW0UXCx+zqACjwj1hfk7BLAg38TGHYwacuUbGDxbcKGLd3JMi17hK/tpjLIT3LoF3FIqWeosP
	 SN4EMXEFVq0blXLrjmOJxoMUFEXWNpHbTFu7fKnraD32BnOytXkch5UnxabeOzxBP2NuMTx6Nrg8
	 7sr1B/cusvWXtVA5GSumgv5wa38kD5HZbmkgQ9iZKPUCjmG+HeCt1ZnP8ex3g+PtUSE+s6qQiLJE
	 yaGhTEaL5kv2ZdYweXtHf2U5GfpZgjBkgOTOx3J0Qa2xIKUO3tTfnrSeZr7d3cs/rVU/d9JW1Tfy
	 uTzL+/5iRuJGX0H1NIPkGYOgGLFgSqG8RgTM5sl8FMipremCBK6GkiufU0pJthBrb41xy0gV4osE
	 /Q/JPwGutCg1Y1uTjZNBCG+jTz5cx40ws7BDo1G+WCR9sJCQToONTosPwOXD6Mksk9a1E4yzn7+H
	 E/tP70Ue+og1euIipkvL/W5B4XbO7JK0i7QN8GpLp0vjuNL8k+EMmeL51I/HfHehcwkCqjArNhMA
	 EoLNs0npy6eDtQO9f5wSifHswnK9D+R8Y3qooRyQU4sN8yna+f
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 4/4] gpio: phytium: add ACPI support for SGPIO
Date: Mon,  2 Mar 2026 09:48:12 +0800
X-OQ-MSGID: <20260302014812.9649-5-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302014812.9649-1-1536943441@qq.com>
References: <20260302014812.9649-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32360-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,phytium.com.cn,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim,qq.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CD431D25B9
X-Rspamd-Action: no action

Add ACPI match support for the Phytium SGPIO controller and allow
fetching the APB clock frequency from firmware properties when running
under ACPI.

Keep the device-tree clock path intact for non-ACPI systems.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/gpio/gpio-phytium-sgpio.c | 44 +++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-phytium-sgpio.c b/drivers/gpio/gpio-phytium-sgpio.c
index 397244bbf..b52531f3c 100644
--- a/drivers/gpio/gpio-phytium-sgpio.c
+++ b/drivers/gpio/gpio-phytium-sgpio.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
+#include <linux/acpi.h>
 
 #define SGPIO_CTL0_REG			0x00
 #define  SGPIO_CTL0_REG_ENABLE		BIT(0)
@@ -42,17 +43,21 @@
 #define SGPIO_RDATA_REG(x)		(SGPIO_RDATA0_REG + (x) * 4)
 
 #define DEFAULT_L3_L0 0
+#define DEFAULT_CLK 50000000
 
 #define GPIO_GROUP(x)	((x) >> 6)
 #define GPIO_OFFSET(x)	((x) & GENMASK(5, 0))
 #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x) >> 1)
 
+#define GPIO_SGPIO_DRIVER_VERSION "1.1.0"
+
 struct phytium_sgpio {
 	struct gpio_chip gc;
 	void __iomem *regs;
 	unsigned int ngpios;
 	struct clk *pclk;
 
+	/* Serialize value access with IRQ completion flow. */
 	struct mutex lock;
 	struct completion completion;
 };
@@ -154,7 +159,7 @@ static int phytium_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 	rc = !!(val & GPIO_BIT(offset));
 
 err:
-	/* Disalbe Rx to hold the value */
+	/* Disable Rx to hold the value */
 	writel(ctl0 | SGPIO_CTL0_REG_RX_DISABLE, gpio->regs + SGPIO_CTL0_REG);
 	mutex_unlock(&gpio->lock);
 
@@ -229,17 +234,26 @@ static int phytium_sgpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	gpio->pclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(gpio->pclk)) {
-		dev_err(dev, "Could not get the APB clock property\n");
-		return PTR_ERR(gpio->pclk);
-	}
-	rc = clk_prepare_enable(gpio->pclk);
-	if (rc) {
-		dev_err(dev, "failed to enable pclk: %d\n", rc);
-		return rc;
+	if (has_acpi_companion(dev)) {
+		device_property_read_u32(dev, "pclk_freq", &pclk_freq);
+		if (!pclk_freq || pclk_freq != 50000000) {
+			dev_err(dev, "Could not get APB clock property from acpi, use default clk!\n");
+			pclk_freq = DEFAULT_CLK;
+		}
+
+	} else {
+		gpio->pclk = devm_clk_get(dev, NULL);
+		if (IS_ERR(gpio->pclk)) {
+			dev_err(dev, "Could not get the APB clock property\n");
+			return PTR_ERR(gpio->pclk);
+		}
+		rc = clk_prepare_enable(gpio->pclk);
+		if (rc) {
+			dev_err(dev, "failed to enable pclk: %d\n", rc);
+			return rc;
+		}
+		pclk_freq = clk_get_rate(gpio->pclk);
 	}
-	pclk_freq = clk_get_rate(gpio->pclk);
 
 	/*
 	 * From the datasheet:
@@ -287,10 +301,17 @@ static const struct of_device_id phytium_sgpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, phytium_sgpio_of_match);
 
+static const struct acpi_device_id phytium_sgpio_acpi_match[] = {
+	{ "PHYT0031", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, phytium_sgpio_acpi_match);
+
 static struct platform_driver phytium_sgpio_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = of_match_ptr(phytium_sgpio_of_match),
+		.acpi_match_table = ACPI_PTR(phytium_sgpio_acpi_match),
 	},
 	.probe = phytium_sgpio_probe,
 };
@@ -299,3 +320,4 @@ module_platform_driver(phytium_sgpio_driver);
 MODULE_AUTHOR("Chen Baozi <chenbaozi@phytium.com.cn>");
 MODULE_DESCRIPTION("Phytium SGPIO driver");
 MODULE_LICENSE("GPL");
+MODULE_VERSION(GPIO_SGPIO_DRIVER_VERSION);
-- 
2.34.1


