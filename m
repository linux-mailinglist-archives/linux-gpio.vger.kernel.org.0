Return-Path: <linux-gpio+bounces-37410-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN4GN7fnEWpFrwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37410-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:45:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED65C0192
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4824630166F8
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 17:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00A5326D4A;
	Sat, 23 May 2026 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE2vYkqP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656930BF4E
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779558322; cv=none; b=mMDn/YdFNLLrbbJoZ4FH3VJCt4e0BR2zpXEwkrHrf9c63z4DiNydusuEaKn65EoWjdnrwR42Pcunc5gWruT0T8qdz+UflEX2Jk2YNM/g1/kWIucxuef11qV8mNBhi0skdKXWCI0l1FOwuF/Fsztm47+gXlNp+41VFFgG+I2ZdlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779558322; c=relaxed/simple;
	bh=U+5vCKqyIckZlH0kgbI/uv6uNwr6fLXXR3ZmeXOw+60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdZ83B/mbZ4T6OxPq7Hqn1HHof0IhP1rwgu0kPsjDR077JYz1V+EOGpfM1zDC1Df1drtSgHIgvzozJ/aHUA8oTkyDlXZXldwzTPZ9slnLRdRDQB0MQ3Y+85NfAg9m5IBeVNh7WXXnkcjXSBYdTY3Q6z+gVoYZtWbqNXcUS4QNTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE2vYkqP; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3698e34a567so7557333a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 10:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779558320; x=1780163120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaCDSTZKkQ9+zQXiJKKfMsq7ZcmXLMVrknxtIyNSzsE=;
        b=VE2vYkqPRPJbZRlgth21EJkD72RxNoy3OLN9JuW/3+5qzrj3DckUpNrXdkVbGZXJGX
         tc2edSx8d1ccBAl3UnZoxZB9pOh+WE3eB0cgvdc16jvnc/QBRYot82U3wEMiY5BdlB88
         6gLFLqbKhMYz96y7tVsuUdGZ5IbdPA9w9uCKrhtUNsnR/qHpXbEJEOsH0SbxcBq7JTX8
         z6sl4HHaCP1sShzZaf2NWzlo8BB3hBeAwEoPrUlY6A6gARnKK0f6YwPJU2c2m7210HI9
         2I3dYcju0o1OyN4K/6UWCDMCjaANedWUJYONX6+qte82iEAetalaMfNthl/XKefZnwON
         pOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779558320; x=1780163120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DaCDSTZKkQ9+zQXiJKKfMsq7ZcmXLMVrknxtIyNSzsE=;
        b=NgPkKtZBzzEWJ6bEPw00yQIlRLncSNpn9eLomi0rlFoUL3RKerfvbiycmv5rAGAZ0N
         JN2G5fELXamtbM8ONHw89JQfl3MBEaD9Hoc9JHmbtl7k/YQM13H1GAo3WEfYcAV7Arh6
         TcIk3rTmL/HJs6gpsUmjXeQPu9CBusgn6iK87z4SHIfvhUvEMQIAGtTaNefhjWEX/HJz
         R/3I2pN7yN7XEAaSnB+3/8V1GelIfiwvhk+jJSJuHGaFT+KlW1bRt/VMb8NibRmVdKZr
         Dsr8veqnv5ptDACddZKOIIGzBt6G79jYBkTmc0E9wEyH6JX7LNQUJkWOCKZ20IcgcFAs
         8oiQ==
X-Gm-Message-State: AOJu0YyNZBIv1BfDzr6CalUyzzKUlXm0j197oZlSK88s3ojDeTfllnnB
	w6po1T+gbUQ2JfX8xlRLmHdI8zlOL9MVRR44n2PUUgMb8Fn12focykLwWPuDBxbu
X-Gm-Gg: Acq92OEZPxzLtRQiViPxNRPi2E6UTDxNkccHh8RKe3rZI5+huTvBJ9mUiQ+wdpgQIff
	cP+wYTszIJBPbenbomKLmsd0lvFRPUzF0K/LgfXBY4ZcYPNhzWfyefDeNkoguRHQLz20vo57xO6
	Ke12YP0oEDuxlLsQZpIv9Ba87PteleD3jwNe6sJapKkH6qG5J5h1MRtg9O7YeWlFb2f3DGdK2tD
	EJhzF4Lf2fcVWMGD9aQqyJegsg3Bndtt8fhK1aEtjMbaILYgpGq6jPzGHoubAvTQ/GLSsYGV1mx
	j1x2tcPf0vPfvmOtfhJvL8S49k7/+ORsWlm+x8nMnwsqGrl+jeikVlbq3OhgSJ0fXkpYz1HbB8t
	nIz3g7POaLxCVEQLbuzWrmRWuWuxwEue5oGFxnvWpISaYAd0Wt7JW6xqEE7xyNZDRikaR3kxnTY
	FxmLyqW4HKOuckt0nqTKkzEA95LQ2iF6lnBoscny1sMfhpqUX0CR+44SFzSHQhCIJO9weowWDDc
	5aeUyANDdWyRVmvUnahaoTmpM03RQ6UsfBJelqFhXUmY9810wurWZt+6LOCg2Of+Zwb2Y72IVbA
	ttBm+CnWEetq
X-Received: by 2002:a17:90b:564f:b0:368:ed92:6f3 with SMTP id 98e67ed59e1d1-36a677ce506mr6735004a91.18.1779558320292;
        Sat, 23 May 2026 10:45:20 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c23:1260:c040:19f4:9706:1050])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71dbc38fsm5127139a91.5.2026.05.23.10.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:45:19 -0700 (PDT)
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
Subject: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Sat, 23 May 2026 23:14:40 +0530
Message-ID: <20260523174440.9629-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260523174440.9629-1-hardikprakash.official@gmail.com>
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37410-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: 87ED65C0192
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
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT-Codex:gpt-5.2-codex
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=221494
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 157 ++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef11..a789c54de433 100644
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
@@ -130,6 +132,153 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
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
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+
+	ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
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
@@ -138,6 +287,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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


