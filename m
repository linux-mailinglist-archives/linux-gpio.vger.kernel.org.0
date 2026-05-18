Return-Path: <linux-gpio+bounces-37058-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHW+M7oIC2r4/QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37058-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:40:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC156CDA6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31BB530AF1F6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A676409DFC;
	Mon, 18 May 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeNiEOKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD4409E05
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107323; cv=none; b=N0TP/7oDlueRZ1iQhMip7LkXF91IYhNXh1T7eGWyul5Jdf9wCiU3V6ODac+jv+G8yeRv/LqZuJbnT7RYBE59sdUVQf0vWUpREVojbDIachVbtbFBx083KsYptPULIcJcUjCqM54OnNfufhnvkofakNDIndeDFwFYvr5Q27paxZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107323; c=relaxed/simple;
	bh=QPxh7Z6D0iaVS4xsx1EOOOTAteeoVyAQeoFXqCX9Gbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbcgCSe3EsRABB0MVcfRpF6ofnhm3dvEHvqokErzxaLRIn/tW50odcgi/CExN+j3Bzy4LqjoOxvRzezyDXNJ6X9HNMngiNkOJd4wiXp3ths09QDXKcgppdphsw0tz+rSqmH6iaZpubaXS3SK6a331TWYh1D1hvJjl1b0kaZqFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeNiEOKp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8383fb7143aso938121b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779107321; x=1779712121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l7aqY3zITH/9bIv1x9E0Nee1ItCtMDSnbAcjovxwCg=;
        b=OeNiEOKpWkig5yq0RXvCox4XolnV4aNfm2q6zrpelIR88fxRYocGOb8UzxZBfKtLWK
         PcSq7mqGW0q04GRzYVZQ86KBWgE8uOOlRO4uoUxDcVEL+gF77voKTa82gzHfuPvT8Vyo
         6qoWWUrs7N5u7T3O4pINSlRc1NvJ/0OU4ZupTfgjd8Uy7+95PubvqJDd/PyoYyTOfCCw
         7P61xGQTNj2JXbBY/3+pZxuKXHjabKopJXJtglDScO5Up956p1z2/qdfDeW2aWecLPG4
         e3DzVOVvcwXSZh7of3lKhAUShofIVCp3QL5vGHnnYW+W4kEnxTy3BIYStdEVnnRqaOra
         Nvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107321; x=1779712121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5l7aqY3zITH/9bIv1x9E0Nee1ItCtMDSnbAcjovxwCg=;
        b=IBAKcEsg72yD1/fj+b7Micf6ozOr1j34SvyllOVv2lTp06tL2vIn3J151/zkDkS7Wx
         2bkhYpVkTi0To8+gBtk2qH4WdHs1mbXZo9rE17yvDnHjkW/7GnbQfR50DkYoRXZ9vMPa
         yMsQCvf27LLv9zE97Y7zFyUQ+utZWgBrpZBrxiTKZz4qxmKcaEo7qtQJv3NraeyGCasr
         w5krIUXFRET5f3yliKmUgTB3Tj/7ZNGMW47xYug8jIcwSydpW2Ekq+6fFL84SXWU/HWF
         749oYnP9FIuP9Z0K3WpwPhRsMMAvuecKhvE2zesnDwwGi0Y7HhufEZJ47MEljRjTViMa
         j/7A==
X-Gm-Message-State: AOJu0YwzUcK0psO9MGMLZhbVPlhtpX+KqbcP5GNI+AXTLv4ckHclb4kK
	iKlLQ4mMq01fEl6vls4yguas5iWVOsBPWooAQbF1Rwp4/YsXObk6V+3Z
X-Gm-Gg: Acq92OEmrVUs93sbkBH7Wk2wZtH3bhYVdPL3HeaFD2s+Cb997GTPd8XQlSiDWD0/8Yg
	ym5LK0fxHb6RJKu7PzaNbns6VXQZobmi2A1XGufvlxlVAAdLaJHgdDxha8ah0BwFdfHVXumLHBt
	a9m8/M6Kcw5bL2t00GLQR4/sjExJybZMnMpQN5G/wh1uebtbYlNhNRtrbNwZyvT3bb6TdnFxops
	t7GSIx0/jJs7P552vQVOheS/y5SX2jDVrGiO+FHhlOoozFGdMS1U/8s66SmW+HxmEWS6EF8DuA8
	XrN5jSxJ64sc4dEo5PQmSGfGKyVwILwWfcZvtwDwCkGKMQebZMa+TmdSp2qLfyOmNMdwJ9P4RhG
	+v1Ompq4k6zsW4PEcYYSJznO9d2c+OdYvLfMxdmigMQBd14GcgWOC8BrTVgKZfFyhb5kbQE9BwT
	QVM4k3oIWpmpqjiDORayQ7YuRA4p5a07nuaPweYyjAvQcUn840xgynj7vHJbchqQez82VTyE2O0
	HVMLLKt2T5euOCvdwWRvDLLL2JEk6Ima2FwP+w3iYllRsl2IbemWWjOoMj4yjMY
X-Received: by 2002:a05:6a00:2793:b0:837:40f6:cb88 with SMTP id d2e1a72fcca58-83f33d39d8cmr14641673b3a.26.1779107320864;
        Mon, 18 May 2026 05:28:40 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c65:166e:af67:d4b8:e4e0:1695])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm14650472b3a.1.2026.05.18.05.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:28:40 -0700 (PDT)
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
Subject: [PATCH v5 1/1] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Mon, 18 May 2026 17:58:13 +0530
Message-ID: <20260518122814.8975-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518122814.8975-1-hardikprakash.official@gmail.com>
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41CC156CDA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37058-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
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
 drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef118..d09cd47bf4b9b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+
+#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -86,6 +88,76 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
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
+	scoped_guard(device, gpio_dev) {
+		if (!device_is_bound(gpio_dev))
+			return -EPROBE_DEFER;
+	}
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
@@ -138,6 +210,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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


