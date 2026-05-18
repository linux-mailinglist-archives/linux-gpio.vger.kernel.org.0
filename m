Return-Path: <linux-gpio+bounces-37015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD/FIda+CmpX7QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:25:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B456776C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB50C304DFEB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CD43B9608;
	Mon, 18 May 2026 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9fvI+Om"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233437EFE3
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088754; cv=none; b=qG8AnOF+EBfotbYa5z1QwMdqcBvEAJJd4tDwS7QzKa1hg0vQNU9lrF1zljdM3iWvsNsk4IzdITNKcJgbDFKvxH/H0YaM6OcKI6qp/jj2ocXBtD7dqs8XViDyaFb2XTFvm5qBPSzDfBJpumkl6XkqZxpoNzWAGH/+JR02okX7q8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088754; c=relaxed/simple;
	bh=egpSBSiiVF81IZfyLqS6u/B6Mtzw5dC3K/sD5zzWGsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYNjfDNwtWktmrcN/WikFQ5k0MrVUQ9A1TAviQS/O6XgWD9AdBjnzyM3xfFxCdbMuh8MbC5q+56WqLDwuVwTrqOgluQl7iEYe+f1/IWiXFjAVPKk0zEfsMvS/CwgPi68ZH4LDUpw3yG6pbwAcOvswEQ8sIz+ToKCiC9xipQUi5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9fvI+Om; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2babfd18435so7402685ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779088752; x=1779693552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Ygl8nWXtwJ478R08EPxLQYgb2RjIx4YLds39Mkiug=;
        b=j9fvI+OmSRkQNLX+EGixpJ5QuXjyDuVdEMWQEnV+e8SllBTuqQNPFR691tbjWVjKfn
         ysr9Z3gzqP/QaVCFK9rcWIwsrZpI0yrUQxf1X+RkdARN+lKAv8y1g3TuMjsbE9PyWDPq
         4XmvxrHZPY/XuO5wFJzyMvh7JA4jdtZQBj/ydAiQ2NqhsNW8JeU3vmIioMkVFRqr15IE
         a3sXSNpgxpp4k3gIhPrsfc2I2wday9C9OQrtFssBiJIArLzQ4B3IfdOs6TZpRF2EjeRj
         C9NCx1S4dDuxNOMAeQayDcNu/ZfC2kLEiXV/CHS/LP9w3s4OxbW8uG9ued8IBCCb4V7M
         nsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088752; x=1779693552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9Ygl8nWXtwJ478R08EPxLQYgb2RjIx4YLds39Mkiug=;
        b=Lh1LMJV3T4if+IZGW3oDmG4dm0iqI3OhIdA/s8xL9KvHo5gUebzKSmryTdxVfIXYBK
         /GUzuEnJ4qPNBAiLRGBZlpTO5n/22JUeAjCA7g6SkWheJ+Iv4mPPAu/9UjpykcGBYpx9
         WijCMaAmbs0rGcKjEIwpKTm/oa3+HUlSUaOayw24/b0xgilBJRDvnaMeZIRX5PQypKSL
         YG8Enxr0e7cC1B5PGwZpEg1hcszmEi8bKJQCVwIREH4UXfQRsoOy+rkRGBJAGf4gUsHl
         4xCkODjshVva4HPntzZiZAfR/OPbd6f4jdk3L7Jh1j1R40Jg2XHjfKUa2laXNXyDrChf
         k74Q==
X-Gm-Message-State: AOJu0YzjukqL0MPgLcSfm3JLBZ/dXGjIxzEGJCnTqxo6SD+OQCLh2mJC
	HhE0kzRk+gdLPwWMQAJMFU9FOH8Mz7GgxAYv3ermfkEGOgO6mPk3UY/vr+Q0FlnJ
X-Gm-Gg: Acq92OEPnPFbXrlrWyZLiew2wC8xp+QRiB35M2jho8zl80Ymha+Ayf+Y9nIjfQ7OABS
	VoOnkEi1w+YKpYzvoes8j2zW+Izxrieeu0QzEz3k54Hsunc+08pSd3lAd79Fo5/ueKT/M0bVZFT
	NTqMPX+/A/sU+nSZ6kvi4WBYXRAStPaFVjAoqcG1WNu8Z7AS6z/6mAao4O9URsE4hCbzYIf6ADA
	m/Ka6KM0xML58a2KDJLv8yi1+y9YEzmW6oSwjntn7TRMF2/JEZ2y+P4luernfCYRgY18ujRUOPM
	AcO9b7CuyqjSGgPALXxN8uj4IvPKNyaArLiw282BcNiaaB/iyTL2graSjMxILoZ6pKBPw3z+BXc
	k+c9eH7KYxV/wfOL3nejWRj5h9cmMgUdqTd0R29Sd18sDUUzsW44qVqShb4f4c+plE+eCArxQyd
	/owtEP/0OoOBO3JSVB5BK3h112DXHbq+l56K3072+Q93nNgM34e82ngaaMkTYp8y/E3LzsSyBSo
	n5ATizgRCc2lK6ArvSQmz3dL2lKkA/oFZO+Nr/LW4hXNYwU5f2zKpLNrS9kLL7g
X-Received: by 2002:a17:903:11c4:b0:2bd:9766:bd2b with SMTP id d9443c01a7336-2bd9766be37mr109767385ad.19.1779088751915;
        Mon, 18 May 2026 00:19:11 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c65:166e:af67:d4b8:e4e0:1695])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc4c2cd64sm62276215ad.78.2026.05.18.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:19:11 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linus.walleij@linaro.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v4 1/1] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Mon, 18 May 2026 12:47:57 +0530
Message-ID: <20260518071816.26629-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518071816.26629-1-hardikprakash.official@gmail.com>
References: <20260518071816.26629-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 010B456776C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37015-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
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
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 77 +++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef118..3ffc3d757fbd1 100644
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
@@ -86,6 +87,78 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
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
+	struct acpi_device *adev;
+
+	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
+		return false;
+
+	adev = ACPI_COMPANION(device);
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
@@ -138,6 +211,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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


