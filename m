Return-Path: <linux-gpio+bounces-39303-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yIQNJOTpRGog3AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39303-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:20:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF06EC0E8
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:20:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Igkif34J;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39303-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39303-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47303155E41
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034113FAE0C;
	Wed,  1 Jul 2026 10:12:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636403FBB6D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 10:12:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900772; cv=none; b=JANud1XZ7wpWNtNei8GS658bXugCTPVHPlfDIyO2RSKsuxFdRYEf3ngZ+/QGWT6/jIB0vLLdijqJRlhVKeiHWxFxfbMj6tYj76ueV8QgdBBL0fE+rHobwdUCMsDVae3hsvllFSKUrr8bFoD2hVv/EFDpE+Fntr7BirGUYYEV/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900772; c=relaxed/simple;
	bh=hKZQkFUlZRkJ4dkfQ7XCvFwhZ/U5i9bJe+6uKHcZVlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6uepIMoE/Nf4vz37kx8S60xYQW2CG3ns3YtMx4ftWeS3LCjk4fDHLhXoyvfsSPxWXMrfhepj9nF1R0TCDToAZcLab+KafwzQ2kcK/KSkEoWGqkTRZ8/Zx8CCitCP6Qc/ySqXp7GIt3Lr40AhshqkhAYrpbaJTlmnoWm1gYO158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Igkif34J; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso290862eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900770; x=1783505570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JnbZMh/VMIPXgvmmZVZQ54fXfz7U5FC3rNj6e+Tek2E=;
        b=Igkif34JLzRRhajlzP4lrQT5H6wHRUu3bdPkDkbwnIF1dnhfFSwufW6aGqY1h3q5zu
         thz7e+ls1yUMzpdOE8IZXb/2jHFeTmMImrFec97i3AFseka/wfT91/S8+iO7wCBXxDkC
         6TR2xHyl/KDp3sNtGPrJXF7D5bb1FZJB0T+3rwzL7D5SinyituTFAaCHCb3G6i9kxTWW
         8VfLeF0iRVATBlnSadij2MOAZdo/4hbjo/0U1wIFkh0II5A+DU+QwOdKeIjL8txeTVwJ
         WJBuAgvNErgB4LYgzZ4MRC9Sd9Du30dq31IEuEgKCzX5cJ9ouzRg4MUjYRoaIIH63SN2
         Kzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900770; x=1783505570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnbZMh/VMIPXgvmmZVZQ54fXfz7U5FC3rNj6e+Tek2E=;
        b=iR2lMPJYRRuG0Iz6sFy3AolLzeaJo9WTR3/8BJvP+yNNckD55R3lPc/QNcX3jAy6j8
         PSh+RtmcgXLjryYpNnqYp3r2iJVE40RquRMhSU2dqbL0XEH8/amsE4/dtdX030cxvu42
         GJKR35Q08t3BJPk4wp2gN1QYscwgYjnKVh5fRtSDwpruutyc2OZ0LKpNzn8RhaZJEhfN
         8M67EPLPS0iAytkjbsLgxC7EfxHJTndMBR5qY6sysKPa8MDCA8O7rz10BR4I3saBXptE
         0LSejfW+A9lGxb7RJzvfU/E5F4BvFqQmEW8KnBd1CS5PKaqHV4LjuIcnfBQjKj0nWQZg
         DWtQ==
X-Gm-Message-State: AOJu0Yw3oAs6GWshLK8Lshw9uHNgtGKSgp0Wd793T96hZ+ms0LtMqYR5
	ZnC0R6thtafyGjcr/UCwBLwlzG8nl0FXhulK/fBRE6BvuSEjoy2pz83m
X-Gm-Gg: AfdE7cnQYkNWxc1ZSQvOQ8tiDIfgEIKOPxV0V4Zs0lSfMhoAb59ZGYcICU/b3T9uWv9
	heCFRrQpLbDURSIWVH9QUVuaGs5qjVHGnsG3fC0PVsd9IJOyxU8l+jV64SjRtGhJpMVv/b5Qhrs
	4FzjjwOFVPGq8b6P1HRr+ojq91Cjkf3G0cnEtBFaL9p2z3OgcyuI8ExXez0U4DlaolrfGRAwDTe
	kx8NcwOGrAdnUhmdxAMKJW0zDIJ+5Uf9ylCAM/ROB31UFYZ6EgtPYX30PQLRwS8rbOtCNdAWCve
	NVySsXggDbEt/hSdY9ZDd3lzmm7p30TUvN8R2zkiVNmG53each9ebeZCTQ7da/7VBQwYZ3JtH7P
	m0t3fkbSsCAe3IUVkKwKECzGvl1rWFYO0NyYEBr8awODbfWSr8kP+apJTs9WiSl0B+4cgKDbVGe
	CwM8k4YMOEgl11/MhZrCpL34dkMbszpjpPYDXLxZcLIkLUAMxX71RiZ4aFxXVokVE5xCfn02iT3
	sNpvbqCWNI67Gnips+hXrXPVAhRnw8MRLBRVE5S8RS1eVhIkVy6K4X1UzHSlv1N344TKojksifU
	5g==
X-Received: by 2002:a05:7300:7312:b0:304:e865:f7d1 with SMTP id 5a478bee46e88-30f053f3845mr122579eec.25.1782900770320;
        Wed, 01 Jul 2026 03:12:50 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:a137:d795:30b1:c22:58a1:6ebc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2ffdbfesm18720743eec.11.2026.07.01.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:12:49 -0700 (PDT)
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
Subject: [PATCH v10] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Wed,  1 Jul 2026 15:42:18 +0530
Message-ID: <20260701101218.42529-1-hardikprakash.official@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39303-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,m:hardikprakash.official@gmail.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25AF06EC0E8

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
 drivers/i2c/busses/i2c-designware-platdrv.c | 132 ++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 6d6e81242f74..d8331d1dead8 100644
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
@@ -130,6 +132,132 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
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
+	if (!agpio->resource_source.string_length)
+		return 1;
+
+	/* Skip if we've already tracked this GPIO controller */
+	list_for_each_entry(ref, gpio_controllers, node) {
+		if (!strncmp(ref->path, agpio->resource_source.string_ptr,
+			     agpio->resource_source.string_length))
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
+	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, data);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&res_list);
+	return 0;
+}
+
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	struct gpio_controller_ref *ref;
+	LIST_HEAD(gpio_controllers);
+	struct acpi_device *adev;
+	int ret;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return 0;
+
+	/* Walk all child devices and collect GpioInt controller references */
+	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &gpio_controllers);
+	if (ret < 0)
+		goto cleanup;
+
+	/* For each GPIO controller, check if its platform device is bound */
+	list_for_each_entry(ref, &gpio_controllers, node) {
+		struct acpi_device *gpio_adev;
+		struct device *gpio_dev;
+		acpi_status status;
+		acpi_handle handle;
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
+		if (gpio_dev) {
+			guard(device)(gpio_dev);
+			bound = device_is_bound(gpio_dev);
+		} else {
+			bound = false;
+		}
+		/*
+		 * Defer probe until the GPIO controller is fully bound,
+		 * ensuring its IRQ setup is complete before we enumerate
+		 * I2C child devices.
+		 */
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
@@ -138,6 +266,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = i2c_dw_check_gpio_dependencies(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;

base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
-- 
2.54.0


