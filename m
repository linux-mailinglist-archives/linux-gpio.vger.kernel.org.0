Return-Path: <linux-gpio+bounces-38623-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n+uNAi5GMmpgxwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38623-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:01:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572369702D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:01:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="YoKICBh/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38623-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38623-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36FB03014DA2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6653B9943;
	Wed, 17 Jun 2026 07:00:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670043BB12F
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 07:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679615; cv=none; b=WfBcYb8oF9sR028VI0z9Ttv7H7BcyJu0DShGSwTztOQEx/DB0Q1Wjg8ERQoLAlfo1M8zJm7vkbqg77RDcd+j5/2wqjr83NtzBsDoVGzdnx99kZjjY5sI1/D11D39duXW/QTUzzGt3MzuGQ6u910vyK++IU8MZPZgZ8zSpYxwd0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679615; c=relaxed/simple;
	bh=aBrYT4DVJx6FYZ1EOU4w1/KBdIVmZ7ko2jVTs3nEJj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bU6Zp8VmRQWg4ScmtThl+V+FbXBUvaC0QFe2UlzJ22AtaG/Ut3u3v9v5Zco6XuJtttuKLDF++J5XvMXJ8NwSa/IAFGXSrsg3fwHOFPezD8TyPf/0tC7NIKx8f9JtSz6b7i1zkG6Oi269MPqsoQX/1WelX+j41bweAlnJLCTLIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoKICBh/; arc=none smtp.client-ip=74.125.82.53
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1390f75d8bbso938144c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679612; x=1782284412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgUZ5MdWHk1It7dPuCiGJcxyI3aHoyg6M40ZkX/AvJU=;
        b=YoKICBh/FTXUBkMSdD21Scu3YpWjO9FixLcEK+2S6uObfd52iFHSaaebeUa/FBw6u4
         1RgWAHOkQxsm1yeqOgghz9Z3CVZvTrXyUNx/72C0nYh0XT8MSbXYl4/6flP3nxTCbtvc
         JAeUaSe7qun0irXCT88NsWVv9nPwkzVMO2aKpF+ZbBT7ne5neCgcN3xaLZZu/+8hfQxz
         0XpYnXU3ySC51RCZnEDIZ98/1jqMQ95hvDUOUWZrUkdgCNcfOyE7kUho0JO/5CgPkSSO
         Rznrh4rcrdaYj9PznqUOr7xS69f0mK6H1UlWku0t2EK+5FD6irz7hNOTvb0vpd/u3HKf
         CoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679612; x=1782284412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgUZ5MdWHk1It7dPuCiGJcxyI3aHoyg6M40ZkX/AvJU=;
        b=o7ykgr1ZYKEP2MnFGTp5CiIB2iwOdUm9JojTZWhM9oxQhwsAZbN8jijOpg39v+36jz
         SgKIdT/8njSihMvRL3YaV1CZhtgri3x8ZkzcDmWX5THmcXuAue0kWQey0lM2ZsDYfVcL
         MMZjmwP5PcHE4CX3pwF7lOyKiO/RHKhQAUmxtOYXJhK+wwW+is0hv/O2M3Mp0ffRVnBL
         l3NNCLwDZh6oHMzQfuBSsgEMzCgQD24nQBdRh6E3bTFiU06gkKzlMGrcog/mYTBm1WXT
         m+BCRlCc+9FMPgE3HJ/mXmMVfMgRT4yjyGGc6JFCXrSBCaKk6lmJfhp3PANI7L9injI9
         SqhQ==
X-Gm-Message-State: AOJu0Yzor/Cz5ovJ8GLOCWiWxYZCKouHHtDbn2BX4Z8QplPFaYCalt8h
	rcmzTAZYr2fqHde4fRd3KpzsGSRt57OSU9ngvwErLV3c3Zz8WY7b+6CW
X-Gm-Gg: Acq92OENxhN4fOcY4yB4J2TD6rO6yCzbbc/pS6/riXxviQDhpUp102Qsdq2d179iXnD
	ycK6+sjURhBKyRRo9WattFFBRBjjCzaUZUC5weMRSwEm6FKJw2qvcubz1h+ebYK9dUigfaiq8ER
	7q0BaaKPHiDoWKJe97H3eQWUYjeAth2Eqt/6dslp7+0n9qJrretBHchndmVJHyxYDImtceUqq+Q
	zj3QrzVIX7r0neXNrEJMQRdaUUkW9d0/yDwIoQomMta+m7JGHwG3GP/LOUN15nh55T5C4VPTcrf
	bkxElBhczJCVUg1Bazdha7lHataliWtl6P6MBzEk+zlH2JTVb6mgTZO5WiZJ4hc+vM08oOA0hVC
	xB3CDbNGnxbvTt4bQYWTwgHeXZYewk/g4xUkjRLTUF6iL5Bi0zqgC8klGMWy7TKCnef5zX4qprV
	oDFJLlEUMrUV2Y67fxB3iI7GDLeYlokMZzrPZElWE4aL8aWnXSnVEM58emH+nUhQgHWy2JUiQeJ
	6ceuquVLm7a5+8ICmfGdquGVvXVmt9PvLH6m8f7WymjHBhW/GdxPHhY2cPJ2VkcegRVjRu4sXPv
X-Received: by 2002:a05:7022:6ba8:b0:136:ac69:b0f7 with SMTP id a92af1059eb24-1398f680985mr1117104c88.16.1781679612236;
        Wed, 17 Jun 2026 00:00:12 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c62:151d:8407:852b:5db:1408])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1386f20ad25sm14118376c88.0.2026.06.17.00.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:00:11 -0700 (PDT)
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
Subject: [PATCH v9 2/2] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Wed, 17 Jun 2026 12:29:22 +0530
Message-ID: <20260617065922.26004-3-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617065922.26004-1-hardikprakash.official@gmail.com>
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38623-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakash.official@gmail.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6572369702D

I2C controllers may have child devices with GpioInt resources that
depend on GPIO controllers to be fully initialized. If the I2C
controller probes and enumerates children before the referenced GPIO
controller has completed probe, GPIO interrupts may not be properly
configured, leading to device failures.

On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
fail with lost arbitration errors.

Add a generic dependency check in i2c-designware that walks ACPI child
devices, identifies any GpioInt resources, resolves the referenced GPIO
controllers, and defers probe if those controllers are not yet bound.
Uses acpi_gpio_get_irq_resource() to avoid duplicating GPIO resource
parsing logic from gpiolib-acpi. Skips resources with no resource
source string (string_length == 0 or string_ptr == NULL) to avoid
crashes on hardware where GPIO resources have no named controller.

The probe ordering race was confirmed via dynamic debug tracing:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT:gpt-5.4-mini
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 133 ++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef11..51172fffa2b8 100644
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
@@ -130,6 +132,133 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
+struct gpio_controller_ref {
+	struct list_head node;
+	const char *path;
+};
+
+static void free_gpio_controller_list(struct list_head *gpio_controllers)
+{
+	struct gpio_controller_ref *ref, *tmp;
+
+	list_for_each_entry_safe(ref, tmp, gpio_controllers, node) {
+		list_del(&ref->node);
+		kfree(ref->path);
+		kfree(ref);
+	}
+}
+
+static int check_gpioint_resource(struct acpi_resource *ares, void *data)
+{
+	struct list_head *gpio_controllers = data;
+	struct acpi_resource_gpio *agpio;
+	struct gpio_controller_ref *ref;
+
+	if (!acpi_gpio_get_irq_resource(ares, &agpio))
+		return 1;
+
+	if (!agpio->resource_source.string_length ||
+	    !agpio->resource_source.string_ptr)
+		return 1;
+
+	/* Skip if we've already tracked this GPIO controller */
+	list_for_each_entry(ref, gpio_controllers, node) {
+		if (!strcmp(ref->path, agpio->resource_source.string_ptr))
+			return 1;
+	}
+
+	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref)
+		return -ENOMEM;
+
+	ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
+	if (!ref->path) {
+		kfree(ref);
+		return -ENOMEM;
+	}
+
+	list_add_tail(&ref->node, gpio_controllers);
+	return 1;
+}
+
+static int check_child_gpioint(struct acpi_device *adev, void *data)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	ret = acpi_dev_get_resources(adev, &res_list,
+				     check_gpioint_resource, data);
+	acpi_dev_free_resource_list(&res_list);
+	return ret < 0 ? ret : 0;
+}
+
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	struct acpi_device *adev;
+	LIST_HEAD(gpio_controllers);
+	struct gpio_controller_ref *ref;
+	int ret = 0;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return 0;
+
+	/* Walk all child devices and collect GpioInt controller references */
+	ret = acpi_dev_for_each_child(adev, check_child_gpioint,
+				      &gpio_controllers);
+	if (ret < 0)
+		goto cleanup;
+
+	/* For each GPIO controller, check if its platform device is bound */
+	list_for_each_entry(ref, &gpio_controllers, node) {
+		acpi_handle handle;
+		acpi_status status;
+		struct acpi_device *gpio_adev;
+		struct device *gpio_dev;
+		bool bound;
+
+		status = acpi_get_handle(NULL, ref->path, &handle);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		gpio_adev = acpi_fetch_acpi_dev(handle);
+		if (!gpio_adev)
+			continue;
+
+		gpio_dev = acpi_get_first_physical_node(gpio_adev);
+		acpi_dev_put(gpio_adev);
+		if (!gpio_dev) {
+			ret = -EPROBE_DEFER;
+			goto cleanup;
+		}
+
+		/*
+		 * Defer probe until the GPIO controller is fully bound,
+		 * ensuring its IRQ setup is complete before we enumerate
+		 * I2C child devices.
+		 */
+		scoped_guard(device, gpio_dev)
+			bound = device_is_bound(gpio_dev);
+
+		if (!bound) {
+			ret = -EPROBE_DEFER;
+			goto cleanup;
+		}
+	}
+
+cleanup:
+	free_gpio_controller_list(&gpio_controllers);
+	return ret;
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
@@ -138,6 +267,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = i2c_dw_check_gpio_dependencies(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0


