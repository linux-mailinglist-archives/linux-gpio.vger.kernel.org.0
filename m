Return-Path: <linux-gpio+bounces-36705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDS2DskWBGpLDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A752DFDC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F10AF304D27B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 06:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C06B3D34AD;
	Wed, 13 May 2026 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrmFiv3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1103D333D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652868; cv=none; b=T7iTycl/nlBtCs0f7Ec+9RRLovbusJaOP/Jpi3/S/xVDm1rcuXyfgwStTVkvWccDYJ+Cyw3HVK6MwGeKmLqNz9XFtYc4m+mDxMYAViYOd6he5vKKCGrt50P1jNQBj46QRHrcQevIusqHpMCID5PHAy2lfllq6AEQekL0Jq1+iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652868; c=relaxed/simple;
	bh=WXpOlephWbdONJJApjAJQhKnhGSv2ntb8lLbb12ioZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiI6HA4pqzAm5gXy09necWDHD3PCTuAxKmEgWJWd3Hdu77GkuEo2fs2XJ09tpJtIEERVXn8fhLLGG6/hjaEv1vqAWTrfBrKYmIPZ8A4VhIz57CoUqsc43SeVwVBdUVNQmar/Ybqg78iR41yNed23aVt/aY26dLznEcSan1tONQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrmFiv3G; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c822652f82aso4552569a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778652866; x=1779257666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyjHk1Sfn2/DlBLKAWJUgj9QQZN9N3eP8M75DdhK7S0=;
        b=CrmFiv3GEaBGWa20h61zur0kq907TbF7Xh6h8W7WjXF3uWI3rxyb9UzoTAXdjMPuQd
         N1P/1VRAUvqgyTqCAG9e7jpikFeOaBJFlctwzVVd7q7MK6JpDVKvAtOCnkmGbqg0BcO0
         BT133nLoKRF+zVCCauhpMsYa2zcBLEukEd2B5Lwttr6QD2Unvq8k8b4eHMnhI5gTOYj5
         LCjDBdaGsM1JoNMWJMlEPhrJGZYlvpM35UCM9edeLy+2pGgZ7IuC2FRM7AtlYkwDci16
         ISxWNR9Yk4aTwTuDdxGRqOqoz2GUPdZ6w3w05s9JtAr7I+5xAXkVosMCSOazEDE/VOnb
         30pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652866; x=1779257666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MyjHk1Sfn2/DlBLKAWJUgj9QQZN9N3eP8M75DdhK7S0=;
        b=H85xxng5kPB50LiBThhsqT0NCJm1UpZ4yTuCOG3Z1jBe1Wlj33NxhnzjjcsXtVc+sD
         041tea69IWNtdME9SzXDDIeBd/4btqQC16pk1dqm/BXJF7MnsPPe1yElfg7aowP7cgR6
         NQ9Pp96xzB90CuztlQMus2N2OzPk0PhF6k53PafxoYJLZjnCYa9LoQJin48C0ubgcGxX
         06wFHHpaPiWwM0M/yipE9vSNP0mBWntlMZpSXzfn4MDuVBGXt2C5rQ6BiRu2fCZSJPO7
         e3nNZm1T+fgYlQMRYzkcBAC3NuqHHByW/XaHuoeNOb/sWSFD3gV7x1aXIXxJaUOugSiY
         p/yA==
X-Gm-Message-State: AOJu0Yxz2npMAvtSKeI7KIiJNUw/lBnvjavr5ePqZZyXL0L6SfvxOZ3T
	fyMKGoxbznOzxhTQttr6k30BDueczQEo6GiUuEBc74oT1qz4hZ+GwjV/Cs73I3ib
X-Gm-Gg: Acq92OE5e4RaR9oZ+XWle45HDHP7lp/n/35LFfttNIyx8l2omGwIVfZBRwrvz+9eeKW
	4Ndyq0ck9rvn4hnL4Ly5YOA9BGagmIVqNQQHHZ5+J/EU4ljLjwB3Xb+R868nLdmJbTXZXTUskzH
	vYf0i5Pegkn/t6pnIyFmA1eX7bEZf/a1qJn32jPHGCoeqH4v+KFuHvRj01KU/f7hMsCgOrNOEsW
	gGDbP4KCbYrMEnazcYX3R73575Zh1pcpRS6sbcIoTYMMlohwRBsMZljCLNeAsn/yHr5v/JwMm0z
	ltuKgJz15OvYwm6U0TphuXe/qLvy6YoL436A5l2n9yd453SJbrDBU+VzPoR9kNJDqapRKWI6zwt
	zn8UIFlvBuy9erSE9nIrR1aCOyV1G565igd0RRNHGRE7+LL+XOOnQgcmyE0hdSUy0xpEsZx6BJv
	PDG5/+8xGlwPRNFOeOLyjjTuvjtL3ex4Te7Nkj4IgmXwwdz1F19xNDzdC07S1seJUQ9tKkSTLLx
	1SnarLUAXQQW11QqL6Muf4g3hnUX7lfLfMJFlR9T7hlOKNQF55TuMvLA/klmIlO
X-Received: by 2002:a05:6a20:3d90:b0:398:919a:ddf5 with SMTP id adf61e73a8af0-3af8137c3f6mr2143737637.24.1778652866100;
        Tue, 12 May 2026 23:14:26 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c64:ff18:3fa8:7855:804e:9f49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm13470874a12.24.2026.05.12.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:14:25 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Wed, 13 May 2026 11:43:38 +0530
Message-ID: <20260513061338.9348-3-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513061338.9348-1-hardikprakash.official@gmail.com>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F6A752DFDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36705-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen fails with
lost arbitration errors on AMDI0010:02 at boot. The root cause is a
probe ordering issue: i2c_designware probes AMDI0010:02 before
pinctrl-amd has finished initialising, so the GPIO 157 interrupt
needed by the touchscreen is not yet enabled.

Add a DMI-matched deferral in dw_i2c_plat_probe() that uses
device_is_bound() under device_lock() to correctly wait until
pinctrl-amd's probe has fully completed. Use acpi_dev_get_first_match_dev()
for robust HID/UID-based GPIO controller lookup instead of string
name matching.

Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT-Codex:gpt-5.2-codex
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef118..35fa4bcafc7ad 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -86,6 +87,76 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
 	{ } /* terminate list */
 };
 
+static const struct dmi_system_id dw_i2c_amd_gpio_defer_dmi[] = {
+	{
+		.ident = "Lenovo Yoga 7 14AGP11",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
+			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+		},
+	},
+	{ } /* terminate list */
+};
+
+static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
+{
+	struct acpi_device *adev = ACPI_COMPANION(device);
+
+	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
+		return false;
+	if (!adev)
+		return false;
+
+	return acpi_dev_hid_uid_match(adev, "AMDI0010", "2");
+}
+
+static int dw_i2c_defer_for_amd_gpio(struct device *device)
+{
+	struct acpi_device *gpio_adev;
+	struct device *gpio_dev;
+
+	if (!dw_i2c_needs_amd_gpio_dep(device))
+		return 0;
+
+	/*
+	 * Find the AMD GPIO controller by HID/UID and get its physical
+	 * platform device. We need the platform device (not the ACPI device)
+	 * because that is what gets bound by the amd_gpio driver.
+	 */
+	gpio_adev = acpi_dev_get_first_match_dev("AMDI0030", "0", -1);
+	if (!gpio_adev)
+		return -EPROBE_DEFER;
+
+	gpio_dev = acpi_get_first_physical_node(gpio_adev);
+	acpi_dev_put(gpio_adev);
+	if (!gpio_dev)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Check that amd_gpio probe has fully completed, not just that the
+	 * driver pointer is set. The driver pointer is assigned before probe
+	 * finishes, so checking it would allow i2c_designware to probe before
+	 * the GPIO IRQ quirk in amd_gpio_probe() has run.
+	 */
+	device_lock(gpio_dev);
+	if (!device_is_bound(gpio_dev)) {
+		device_unlock(gpio_dev);
+		return -EPROBE_DEFER;
+	}
+	device_unlock(gpio_dev);
+
+	/*
+	 * Create a device link so the driver core enforces probe/remove
+	 * ordering between this I2C controller and the GPIO controller.
+	 */
+	if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUMER))
+		dev_warn(device, "failed to add device link to %s\n",
+			 dev_name(gpio_dev));
+
+	return 0;
+}
+
 static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 #ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
 	{
@@ -138,6 +209,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = dw_i2c_defer_for_amd_gpio(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0


