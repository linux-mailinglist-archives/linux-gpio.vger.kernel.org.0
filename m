Return-Path: <linux-gpio+bounces-37672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H1iHcFmGWrZwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E46008AE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB1F93126AE8
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4AD35DA79;
	Fri, 29 May 2026 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRT98WSV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44235E1B2
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049359; cv=none; b=iwgVhaMHMrAjLavcHNHTlbAWg4NT+wNTuTN55k1C5ifyATrHOkAt/xhTyOY16aqRLpykEM3Obm4mhut1XQ673977n+BfGUwgRdSEj7CcjVgEJ8ngZPxSLz8MwMx21HFtlpu20r/Y83FLjfUWuJNciJ2hvUKUge2Nf8yJvclae6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049359; c=relaxed/simple;
	bh=l9Ex1FNwwaHGC5QWfXsAWNwYQPMBie2vXLBEMIGp/uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+0ZHqtKG6DV+gHv7kJn0rj2QR/1/QudhJOw8JRgASlNcEhVwgu4xtfMexyqkJHfmzkqRUjm8KpCXq2FeM2/DwKaZsqTd41+u3JVbyxZyFsbeRYr+GGNbqPmAobMhzAMSKZx47Z62ZlpQwpEvL99XdTfq0Un0l/hC+xSCCDYy/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRT98WSV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf1cda2b17so5784645ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049355; x=1780654155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPaCnnP1+4ska0qPOYVJBMJOBmGpE7wwQFomGj95sKY=;
        b=SRT98WSVczaiukuYn4NO+Jf7sb/FSq+xF3ITYo10wCWmOojlJ5xlMSjkUCYri2m13A
         IEkWHfd3P0PPTPchEFwsvZgRdbBuTdnw+NGCnI1107ofT0Sn5db69mMD68BxFYhGWhqn
         h6uGVUnuMevYkZ3syMMIKnpExFL+5bavx4zNZaVu+v37ocldAbPOi3CsFS5mDsLZq7b9
         jaTMjG6f8JAjaIcm5OVS1GMXlAZk+29c/Ky7pWIJ5D/s2AGksIhfnszE61DJ7JYZYMcG
         +/lb/5w9vd7cAMls3LZAulxJ7y/DEl0Tpe+yFGtaCxDGxsmelcVRJuzzRo4KbnS98asA
         vHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049355; x=1780654155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPaCnnP1+4ska0qPOYVJBMJOBmGpE7wwQFomGj95sKY=;
        b=ShG3G4iRphb+UqRyIV2ZniZNn34r6NwVWKYmey0OOjCdjpJi/PMT2WAAgBPI4gD6O9
         Ymu3b+hoN+baRQOJhciJ+flzanwqDouJCG/iGNyKv7/Ol4oNAeRA73NEduZ6V2+ole3o
         S0xsMO/ca2Fuq0jhommVDHHyByBjC83P5QLxKiZ9RUyhF+5Chx4tfHQC+kJQUUFd+kJ8
         Bot2JjWLIUrvLCBo6Izi+wNWz6rFl9e6bY2jcEtWwTx6/fYk4gvSjhjDHunofDtIVxcP
         z0YC98ELrazo16hfXBknysSxQ+t5nzBn9XskoaD7jNO8HvLIDZ38T2pvnQUidRdNdmBF
         +s/g==
X-Gm-Message-State: AOJu0YwIyoZEKTEWvdD4sdricsziAHdg7PjHf6F7vCyAWzG9JlD5UrOk
	ify3nYHuJSXnQbWsmY1TcSelptxPqNipkgD2nhz/6jvgu/mumWfxFu4T
X-Gm-Gg: Acq92OFro/yMz1xd2V/3nQL9Qd+gzW475g4c0RfliRq5OZSbYr3vPnxKNdm+ToPgrIN
	JYLQHPzp4ijku22VHoFHu++TbRNIUH1iPMHkXGNlic7zu0JjjAy4aO5VcPTqTz/XXAjlTHNQwaB
	Krj7Tqab1rCBeF0CFkIZIip0qnPcaUmpS3PVejU+rhZb9K7s99Xvcg9bWztz1LtLgdAT+Lu2yX8
	QjXSi9R+ks7QxWBBvEq/PpO/fbsqqaKVM+SVG0+z7dgPnAUcgv8Zoubhuf7QFz0x8RIfi6Yxm4y
	1PlgbOC75cMt5gSyvx1W+uYYQkD/I3QwIOBJHOzghnIle4AkrAlh3FlH0RkXpqtEeJi13kiDMqt
	Y7aov4cBbUrariYtfUaaz5GwXLwojZY1ODsu07ErZwBU25RV5QFsd3DndYS5yMVJp+0W5ev+B8f
	wp15uUWiWx9Jr3oIF0m/9s48HgRbW3eLsf55I/2HAWa8eL3JaeuUaj2txsTtHuOimWhkwSF1d4u
	eocTJVS0F/nnhMFoj7/6GAIZIyD1Q8uF7uOQZogvmkY8k3HIsV9sc7FQJJRrLA/lplvjed6tVY2
	wloo+NBvuXLS4fR+0rLfZDo=
X-Received: by 2002:a17:903:8cb:b0:2b4:64cf:e8f8 with SMTP id d9443c01a7336-2bf204672e8mr28889585ad.2.1780049354558;
        Fri, 29 May 2026 03:09:14 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c22:2195:3f68:8568:1e68:2087])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0122asm16051225ad.46.2026.05.29.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:09:14 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Fri, 29 May 2026 15:38:37 +0530
Message-ID: <20260529100838.8896-3-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529100838.8896-1-hardikprakash.official@gmail.com>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37672-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E38E46008AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I2C controllers may have child devices with GpioInt resources that
depend on GPIO controllers to be fully initialized. If the I2C
controller probes and enumerates children before the referenced GPIO
controller has completed probe, GPIO interrupts may not be properly
configured, leading to device failures.

On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
occur before the GPIO IRQ quirk in amd_gpio_probe() has run, causing:

  i2c_designware AMDI0010:02: i2c_dw_handle_tx_abort: lost arbitration

Add a generic dependency check in i2c-designware that walks ACPI child
devices, identifies any GpioInt resources, resolves the referenced GPIO
controllers, and defers probe if those controllers are not yet bound.

This ensures GPIO controllers complete initialization (including IRQ
setup and quirks) before I2C child enumeration begins, fixing the race
without device-specific quirks or DMI matching.

The probe ordering race was confirmed via dynamic debug tracing:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT-Codex:gpt-5.2-codex
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605240959.Kcf1lIg4-lkp@intel.com/
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef11..1c01b0460385 100644
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
@@ -130,6 +132,152 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
+struct gpio_dep_ctx {
+	struct list_head gpio_controllers;
+	int ret;
+};
+
+struct gpio_controller_ref {
+	struct list_head node;
+	char *path;
+};
+
+static int check_gpioint_resource(struct acpi_resource *ares, void *data)
+{
+	struct gpio_dep_ctx *ctx = data;
+	struct acpi_resource_gpio *agpio;
+	struct gpio_controller_ref *ref, *tmp;
+	bool found = false;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
+		return 1;
+
+	agpio = &ares->data.gpio;
+	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
+		return 1;
+
+	/* Check if we've already tracked this GPIO controller */
+	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
+		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+		if (!ref) {
+			ctx->ret = -ENOMEM;
+			return 0;
+		}
+
+		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
+		if (!ref->path) {
+			kfree(ref);
+			ctx->ret = -ENOMEM;
+			return 0;
+		}
+
+		list_add_tail(&ref->node, &ctx->gpio_controllers);
+	}
+
+	return 1;
+}
+
+static int check_child_gpioint(struct acpi_device *adev, void *data)
+{
+	struct gpio_dep_ctx *ctx = data;
+	struct list_head res_list;
+
+	INIT_LIST_HEAD(&res_list);
+
+	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
+	acpi_dev_free_resource_list(&res_list);
+
+	if (ctx->ret < 0)
+		return ctx->ret;
+
+	return 0;
+}
+
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct gpio_dep_ctx ctx = { .ret = 0 };
+	struct gpio_controller_ref *ref, *tmp;
+	int ret = 0;
+
+	if (!adev)
+		return 0;
+
+	INIT_LIST_HEAD(&ctx.gpio_controllers);
+
+	/* Walk all child devices and collect GpioInt controller references */
+	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
+	if (ret < 0 || ctx.ret < 0) {
+		ret = ctx.ret ?: ret;
+		goto cleanup;
+	}
+
+	/* For each GPIO controller, check if its parent device is bound */
+	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
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
+
+		if (!gpio_dev) {
+			ret = -EPROBE_DEFER;
+			goto cleanup;
+		}
+
+		/*
+		 * Check if the GPIO controller's device is bound. If not,
+		 * defer probe to ensure GPIO initialization (including IRQ
+		 * setup and quirks) is complete before we enumerate I2C
+		 * child devices.
+		 */
+		scoped_guard(device, gpio_dev) {
+			bound = device_is_bound(gpio_dev);
+		}
+		if (!bound) {
+			put_device(gpio_dev);
+			ret = -EPROBE_DEFER;
+			goto cleanup;
+		}
+
+		put_device(gpio_dev);
+	}
+
+cleanup:
+	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
+		list_del(&ref->node);
+		kfree(ref->path);
+		kfree(ref);
+	}
+
+	return ret;
+}
+#else
+static int i2c_dw_check_gpio_dependencies(struct device *dev)
+{
+	return 0;
+}
+#endif /* CONFIG_ACPI */
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
@@ -138,6 +286,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	/*
+	 * Check if any child devices have GpioInt resources, and if so,
+	 * defer probe until those GPIO controllers are fully bound.
+	 */
+	ret = i2c_dw_check_gpio_dependencies(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0


