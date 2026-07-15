Return-Path: <linux-gpio+bounces-40108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6bMBh10V2ptOQEAu9opvQ
	(envelope-from <linux-gpio+bounces-40108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:50:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C886975DC34
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:50:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B59ZtDRV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40108-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40108-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C05C304D11D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005EF448D18;
	Wed, 15 Jul 2026 11:47:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C040D587
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 11:47:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116068; cv=none; b=ar288a55Czl651XUlSHdrGU4aM2y1bSCPuKDXSh6p4Nz5wbvbxcG7UDf/Vdik3hMgx004CSNqFYSp0QpVJRo2FwrfPS5jQYYrWYRsd+xl3I7se3et4gc6lSWdxYdCn5HgQXnGdEShgQqDpNFcOdqmEDbxeKcU8U1PCGqJIZDuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116068; c=relaxed/simple;
	bh=L6vK6QEmjEwQifC9Kb/8JGs8ImSZPhdSqTFrXpwe7NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BPG2E13qI6JhaRVZ+Sqxmd2UzpaZS71I8JOyv1oOYlR1hY1Zrx85Od9cHNLhhZpLtSKhVdJYPccHMQXCd9jHiN4XRGiLHSjZDSRavNowzCuJiAqHmNSToT9/4v/IkXuETKqgDbmEmiXlg1xS+AkeLL3nMhhZfj4SwgzwpDQAxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B59ZtDRV; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceaf8a1265so45154165ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784116067; x=1784720867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+qUyXycD6EN07yp82nhtEu4h23ddYrmOdc1hJNeRQs=;
        b=B59ZtDRVH77gO0gHI3o4m7Pse42rks9wG4gA6TLsfcIH40/SRqZ4wJtHqc5k/GhPOC
         RXUTAwbq1OgJmGQ/EruHPEPtvXdDoCc7PzMRBLHQgbtzDq+l1YoUV3dJ/KuVl6+dzKvS
         N+ys58cvWrCrchWmWJvKMYpaKfRnBHbFHnEQdbvIq4M848BEyS50j8owIhil4f75aELs
         hm+2SugCdyvRvCXkJEjZQP1hLCW7TBsM80NmgiZ45CYIhoroxvtzADL3Fxs57qPDFW8m
         BpUl8yeqx8t4a8Q7fllhEFDQ9qzp7sKT9V+y0Q+qGGWFVA3FQpEVc4l55kO70Ti1AcZq
         0SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116067; x=1784720867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+qUyXycD6EN07yp82nhtEu4h23ddYrmOdc1hJNeRQs=;
        b=HP9qSpwe5jlqTpUkKEI1FIAjHltQHzPcSPJMc/jlOIYTIrGmGYeNQCo8joCpH0Clp/
         uPaHX1FV2/fWnI9vWGd5wmgjPVclK8EIA+6oI3vcaqjgi1ffrCGAXd3JQlrU48C3pUN7
         dZCJS3G+SVCwYMXLmrZCk8B20d6R3wL1Lh4UjxeaNu4rmbXt1GMqcXdi9TWBg0c6KtqH
         sppd7d1jdECRan26yYXJkAEO4Aw+e0DD57yXtZykdjQrh23dlcLOYpUkKnf1KLohsd6f
         SD/LehddNF9yITH6kix79FILhQ6RuZdKAw8SvLBaC3vcl4pbEm0QWaJQUH8ooSm/lsXk
         L6Wg==
X-Gm-Message-State: AOJu0Yz7sa/BEftiPmUEZmVsAYaqZW4l5PwGw0WockRwyTUa2Hz6Wt+B
	NxU7la8Rm7yYfWvrFivSB7MHD/dbEjHphJ67T9AnCKWiJ1RtT2JQVyRt
X-Gm-Gg: AfdE7clen9seloRgyVHqVNNUntfH6Ft5cjdn1z2u3WPaejPg4ltnlc/4rgGZlwr4HMA
	po9Dn1Nr5J4eRDZexgj6cWpYCdHaV3ekYUgQQog3uBbR2Hfwfh5wc5lD8Z8WKnC0eTqCKupB2Iy
	zHpLt+LM6ChOepr/8ObJH41nR21qEAgvxLjvMwCI9IX/5Cy9EtDrgo01CVN5pCW/xjKuvKEh8DM
	uYhH9Ws8d0VxNxQbScn6EFXGq4hcM2G6zx/kAoVgRgMX4lQlJ8ZajXFBHykRVGGl/YozqM60f55
	NvbF/SQg7njNhh7x9x8GAGRynzX3MawAXYhwQapw7nqGVL4/mZTOGQvCx+7YlptiFtV1ME/7PMr
	eAIRcxciegCM3MhKYyXM/Wi+PeZ06nIarDxXxiaMpnIXRlnbea0d9HUtVhTugCFhJBRfTN1elIP
	qOWIb69gxOu6em+PMES+acs0MCNHywvCfZZhCK3VstfHSXqCt+lg+1v1NcdVT2UqrfqWhmu/5iJ
	7D0HWvKkaqSWZA5YFHr/dETCHo1J7ndGBwf1h1j6bSBdRNBDNK9L/dN9mpcQfgg8WLiLyCFbtpI
	tQ==
X-Received: by 2002:a05:6a20:a126:b0:3b3:f46:1ef3 with SMTP id adf61e73a8af0-3c357553e67mr7499920637.41.1784116066508;
        Wed, 15 Jul 2026 04:47:46 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c62:68f6:6523:490f:51d2:57b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4344b8bsm649012c88.13.2026.07.15.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:47:46 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	nathan@kernel.org,
	chaitanya.kumar.borah@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v11] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Wed, 15 Jul 2026 17:17:01 +0530
Message-ID: <20260715114701.7713-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-40108-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakash.official@gmail.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C886975DC34

I2C controllers may have child devices with GpioInt resources that
depend on GPIO controllers being fully initialized. If the I2C
controller probes and enumerates children before the referenced GPIO
controller has completed probe, GPIO interrupts may not be properly
configured, leading to device failures.

On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
fail with lost arbitration errors:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Add a dependency check that walks ACPI child devices and defers probe
until any referenced GPIO controller is bound.

Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-5
Assisted-by: DeepSeek:deepseek-v4-pro
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 80 +++++++++++++++++++++
 1 file changed, 80 insertions(+)
v10 -> v11:
- Replaced custom gpio_controller_ref list with gpio_device_find_by_fwnode(),
  as suggested by Andy, dropping the linked list and dedup logic (~60 lines)
- Moved resource-skip explanation from commit message into a code comment
- Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
  rather than the gpio_device's own internal class device, which never
  has a driver bound to it


diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 6d6e81242f74..597aa9706364 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,12 +8,14 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -130,6 +132,80 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
+/*
+ * Check whether an ACPI GpioInt resource's referenced GPIO controller
+ * has finished probing. Resources with no named controller (resource
+ * source string) are skipped, since they can't be resolved to a
+ * struct device.
+ */
+static int check_gpioint_resource(struct acpi_resource *ares, void *data)
+{
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+	struct acpi_resource_gpio *agpio;
+	struct acpi_device *gpio_adev;
+	struct device *gpio_dev;
+	acpi_handle handle;
+
+	if (!acpi_gpio_get_irq_resource(ares, &agpio))
+		return 1; /* not a GpioInt resource, skip */
+
+	if (!agpio->resource_source.string_length)
+		return 1; /* no named controller, skip */
+
+	if (ACPI_FAILURE(acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle)))
+		return 1;
+
+	gpio_adev = acpi_fetch_acpi_dev(handle);
+	if (!gpio_adev)
+		return 1;
+
+	gdev = gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
+	if (!gdev)
+		return -EPROBE_DEFER; /* controller not registered yet: abort walk */
+
+	gpio_dev = gpio_device_to_device(gdev)->parent;
+	scoped_guard(device, gpio_dev) {
+		if (!device_is_bound(gpio_dev))
+			return -EPROBE_DEFER; /* controller not bound yet: abort walk */
+	}
+
+	return 1; /* bound, skip adding to resource list, continue walk */
+}
+
+static int check_child_gpioint(struct acpi_device *adev, void *data)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
+	acpi_dev_free_resource_list(&res_list);
+
+	/*
+	 * ret is a nonnegative resource count on success, which must not
+	 * be mistaken for a nonzero "stop iteration" signal by
+	 * acpi_dev_for_each_child(); only forward genuine errors.
+	 */
+	return ret < 0 ? ret : 0;
+}
+
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (!adev)
+		return 0;
+
+	return acpi_dev_for_each_child(adev, check_child_gpioint, NULL);
+}
+#else
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	return 0;
+}
+#endif /* CONFIG_ACPI && CONFIG_GPIOLIB */
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
@@ -138,6 +214,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = i2c_dw_check_gpio_dependencies(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;

base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
-- 
2.54.0


