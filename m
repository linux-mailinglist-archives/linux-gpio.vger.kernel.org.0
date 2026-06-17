Return-Path: <linux-gpio+bounces-38622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+0NJgtGMmpaxwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:00:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C45B697023
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:00:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bM5xrbTI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38622-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38622-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A9DC302AC0C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 06:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF273B9937;
	Wed, 17 Jun 2026 06:59:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE9303CAE
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 06:59:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679594; cv=none; b=VRQnkS2gIlbXAu+s+qYyAACRCpFAdTa+pVuDXN5teanUOXU686OmShv7usapbWVpNjEKlSG0Mz10lM+be20pWoDf0Swrl25lu/OlV/SpFb3KzF+RS18xIMLSHs/Gx0XpghDFmKnDAc67DlPKXje/lDrY6tnROSVOTCGzEwsrslE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679594; c=relaxed/simple;
	bh=bRnss1KOVWUXgDXAJVzVsvJ3vRsXXIkGIhUVaOcNJx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRKbfG4LGXO/o1RhsCOkDGqeMME7xfn0saSQRz6Y14qA8Hf0INyZOJdAR8xcvchoWqAAdF7wb2Oj8rfdqg/MikQ5c1M70OkNOaJOUxWqNRhvVMPYaTJSjJMgHcb2Y0hlvziMdkFqVO3uNa51f4p/3hLxXv11XzlmQlktFHgFt3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bM5xrbTI; arc=none smtp.client-ip=74.125.82.43
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1397e093f90so7343059c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781679592; x=1782284392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IxSyLpBjOeBaJJmK/OyiKtaPoo7G3CXXKgAk95fwJM=;
        b=bM5xrbTInSY7UcY7iVbrnkcZ0ADqQ8IQCqcfQhZqb3biaj1Xio9NXEsx1oD0n4qgHd
         gXl4gbpY6xx8QrLhnfyVUEfg8NB/nbLK5sKBs6sVAlg0cq4PJtthU5rJXV8hUryiwAPZ
         Mb4h5cZ/IrfNB14p5NS7j/RnA6Ofe/eoLdNPaHLlNysOW0nxeXHtYZav1u3xSxskHWQz
         YotlOk1qYsbJ4gezhrIkKw7IrRuXluF0hxd0+Sa6e/cRLNbbSiKqdL9TEKA8NP9w/BNV
         W8XkmjfanYdJidkXoDxVO7M/34l4FxGPSXKV1jlFtIuwns3u/LqKdE+sQ25Sb50kTQkX
         PopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781679592; x=1782284392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IxSyLpBjOeBaJJmK/OyiKtaPoo7G3CXXKgAk95fwJM=;
        b=R05Idtt+/KPQf0I3ZA6kprJr4aWOso68kIimJJ/tGCIwJl1HkXMVh8jBzvWkrl+t/H
         ldrGEHRg7dtoZ7lIRt/M+C9otslAF8BJpWaxrl9L2CqiRH0HmxYshBfnw9cWApfhXarw
         i6mOSx0VWNryJF12MimSQ4A+HnWqHQr7oW6xddI6/hHhZc31mEwuvtjMy1+xC+BT9Skr
         374mzomuJaBASdF2Rg1z9RsDyG5cv6fYBRk31wG+67SPYNIZId11I7a3BsJzthGN70Dg
         h2dJvyfcE/mq4KMkkfAacQTmRCCJtpNetKi8gnn4QJhqJt3KULiAEi8RXBF9Q5RwJR88
         S0IQ==
X-Gm-Message-State: AOJu0Yz1tq3sRkZbWUgQZXtjD2BPQFC32jiKwB200EGhUoSWb7IhbsyH
	Nv9b9Tx36txLPZjjtNE6DfluTQb8Ow6UA9Wqy9zDlOA5J9XOfGC9H4WFWaqbOycD
X-Gm-Gg: Acq92OEPObFvAuBeHZY4iXuy+KFYoIibNfXTDFh5SXafPzezlYURT6MM/S0UgfXx2Wg
	07oGTnfSXnXZZu5W2jTvZy9Knok5YYtUyS0AyvGvC1pvhSeCG+RYfaLqC/zBljDeBm+8cp5zgbE
	wEeEd3z/Rr0i6GCZpTiDwhPR9DE42vsf3sGe/q8zRw6S40fn/8R3pi6DFTknUJ+Fag541U3+TQy
	tBYb3jv5rrfzwMYs9OoGZGGoNAFFnH5WVCfI1BE+648OUT1Y/gL0pvUpHioVnMNRmdQKYixzV1C
	+1sC5xti3lZcYdg7o+EEzQMr3QxbwuSCFInF2NpYggJY7CulK63CRLPwXAVHj2mxfPzrNJqwLK7
	3SgV5bCsB7pCUbxDQ7gTWvxO6DbYkkmhu1W3mDU6z+1L7IFnfXkOpDWQe3fx0lLu4yA5aH9bqqo
	7+HyQtReEd07b9DO9UKd/c87XM7P2ucARFPBac9mKti2H06qOUlkdu2JEbSu+r4WJWoZdydMphy
	ub12Rkn98ptjPEB8xkfWdVwkv+goz/e7dn9inw9sF3koVU1ONjBE4d6blXY70NgfR6VwSKm2j0t
X-Received: by 2002:a05:7022:406:b0:138:407c:1d20 with SMTP id a92af1059eb24-1398f6fe79amr966296c88.35.1781679592370;
        Tue, 16 Jun 2026 23:59:52 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c62:151d:8407:852b:5db:1408])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1386f20ad25sm14118376c88.0.2026.06.16.23.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:59:51 -0700 (PDT)
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
Subject: [PATCH v9 1/2] Revert "i2c: designware: defer probe if child GpioInt controllers are not bound"
Date: Wed, 17 Jun 2026 12:29:21 +0530
Message-ID: <20260617065922.26004-2-hardikprakash.official@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38622-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C45B697023

This reverts commit ef76a3a28c79b628890431aa344af633e892035b.

The patch causes boot regressions on multiple machines. A NULL pointer
dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
when string_length is 0), and a probe deferral loop causes CPU starvation
leading to kernel panic on Intel CI machines.

The patch needs a proper rewrite addressing these issues before resubmission.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/linux-i2c/90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com/
Closes: https://lore.kernel.org/20260602185339.GA404948@ax162/
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 156 --------------------
 1 file changed, 156 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 1c01b0460385..3351c4a9ef11 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,8 +8,6 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
-
-#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -132,152 +130,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-struct gpio_dep_ctx {
-	struct list_head gpio_controllers;
-	int ret;
-};
-
-struct gpio_controller_ref {
-	struct list_head node;
-	char *path;
-};
-
-static int check_gpioint_resource(struct acpi_resource *ares, void *data)
-{
-	struct gpio_dep_ctx *ctx = data;
-	struct acpi_resource_gpio *agpio;
-	struct gpio_controller_ref *ref, *tmp;
-	bool found = false;
-
-	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
-		return 1;
-
-	agpio = &ares->data.gpio;
-	if (agpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_INT)
-		return 1;
-
-	/* Check if we've already tracked this GPIO controller */
-	list_for_each_entry(tmp, &ctx->gpio_controllers, node) {
-		if (!strcmp(tmp->path, agpio->resource_source.string_ptr)) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		ref = kzalloc(sizeof(*ref), GFP_KERNEL);
-		if (!ref) {
-			ctx->ret = -ENOMEM;
-			return 0;
-		}
-
-		ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
-		if (!ref->path) {
-			kfree(ref);
-			ctx->ret = -ENOMEM;
-			return 0;
-		}
-
-		list_add_tail(&ref->node, &ctx->gpio_controllers);
-	}
-
-	return 1;
-}
-
-static int check_child_gpioint(struct acpi_device *adev, void *data)
-{
-	struct gpio_dep_ctx *ctx = data;
-	struct list_head res_list;
-
-	INIT_LIST_HEAD(&res_list);
-
-	acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
-	acpi_dev_free_resource_list(&res_list);
-
-	if (ctx->ret < 0)
-		return ctx->ret;
-
-	return 0;
-}
-
-static int i2c_dw_check_gpio_dependencies(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-	struct gpio_dep_ctx ctx = { .ret = 0 };
-	struct gpio_controller_ref *ref, *tmp;
-	int ret = 0;
-
-	if (!adev)
-		return 0;
-
-	INIT_LIST_HEAD(&ctx.gpio_controllers);
-
-	/* Walk all child devices and collect GpioInt controller references */
-	ret = acpi_dev_for_each_child(adev, check_child_gpioint, &ctx);
-	if (ret < 0 || ctx.ret < 0) {
-		ret = ctx.ret ?: ret;
-		goto cleanup;
-	}
-
-	/* For each GPIO controller, check if its parent device is bound */
-	list_for_each_entry(ref, &ctx.gpio_controllers, node) {
-		acpi_handle handle;
-		acpi_status status;
-		struct acpi_device *gpio_adev;
-		struct device *gpio_dev;
-		bool bound;
-
-		status = acpi_get_handle(NULL, ref->path, &handle);
-		if (ACPI_FAILURE(status))
-			continue;
-
-		gpio_adev = acpi_fetch_acpi_dev(handle);
-		if (!gpio_adev)
-			continue;
-
-		gpio_dev = acpi_get_first_physical_node(gpio_adev);
-		acpi_dev_put(gpio_adev);
-
-		if (!gpio_dev) {
-			ret = -EPROBE_DEFER;
-			goto cleanup;
-		}
-
-		/*
-		 * Check if the GPIO controller's device is bound. If not,
-		 * defer probe to ensure GPIO initialization (including IRQ
-		 * setup and quirks) is complete before we enumerate I2C
-		 * child devices.
-		 */
-		scoped_guard(device, gpio_dev) {
-			bound = device_is_bound(gpio_dev);
-		}
-		if (!bound) {
-			put_device(gpio_dev);
-			ret = -EPROBE_DEFER;
-			goto cleanup;
-		}
-
-		put_device(gpio_dev);
-	}
-
-cleanup:
-	list_for_each_entry_safe(ref, tmp, &ctx.gpio_controllers, node) {
-		list_del(&ref->node);
-		kfree(ref->path);
-		kfree(ref);
-	}
-
-	return ret;
-}
-#else
-static int i2c_dw_check_gpio_dependencies(struct device *dev)
-{
-	return 0;
-}
-#endif /* CONFIG_ACPI */
-
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
@@ -286,14 +138,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
-	/*
-	 * Check if any child devices have GpioInt resources, and if so,
-	 * defer probe until those GPIO controllers are fully bound.
-	 */
-	ret = i2c_dw_check_gpio_dependencies(device);
-	if (ret)
-		return ret;
-
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0


