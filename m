Return-Path: <linux-gpio+bounces-38229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igFJEQ4kKWqaRQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:45:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F76675AF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eFgucHH4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38229-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38229-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B74E300F51B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646E53AE1A3;
	Wed, 10 Jun 2026 08:37:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007E3A8721
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 08:37:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080646; cv=none; b=aY+6xZ77z+n2m0LPWaR1tGrXMtpC0Ri7PXzzU7vSTFGPOkIMnRRqcQlqA7GaaT/ARS1lcuhlbz87Lzxykvq0xmOUBSraok+/x6I94sqj+qoHWTHEVYGxbA4gb5Vg2QxcdQo1HeDAqBliONxVpbmY8mH283pX0gpYOx7jGzlr5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080646; c=relaxed/simple;
	bh=kaishit0l3D7M91kmsDJgwCJTTWfCGNoHd3rbC0bz6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fyXo3yPq1xP+kkx48a2CFe73tu1DvOvJgbxorBnmGntpfxlz0hod8EzQjcrpChNqaiFztZOMI4Hl7lhkx2MkqL4VgXV1qxd0aj3pzWOm5zVqroBSWRBXm/rm3tTxjyN07Er+7ddAbn63cAo4RTRCG4i7NTHIiekN3NDToIVW/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFgucHH4; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62664835ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781080644; x=1781685444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTlLTPLQVob07Monee3VTFRy46RFeGt5gASHP+XGMa0=;
        b=eFgucHH4rRV+EM+SxB/B2YstHpe456xR5jOE0L6Syj36WHkQTPiSzbPvkJqSBm2jWk
         hdj5GMo2VqZgEU7YEKy4KOPFW2rQM4CnUyrEm0vEQ1ZYBdgKHfHpsyuF5/ZNptbjYWax
         v8KdYXKn91Fgg19uygQT3MJG7mLLNpzt+hx6SlbvH30KboUOAHHfFt9IZFO1uz1z/s4t
         wU3idruIMuS1J+CrNidgFvfPP1GDAX0YwrnzVbWidXWqAoRGzQi/69EFUOxNfjm94dEI
         i36DkXkRucrT8dl3QSs/BG+vWaJBkmsjAinhO/ckqKNA9r+nVI9Ya9Ab6ouUjUvlX1gS
         BGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080644; x=1781685444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTlLTPLQVob07Monee3VTFRy46RFeGt5gASHP+XGMa0=;
        b=VsmoGn985elF167NqTh1c4mxJ/38ZgKHoGHa1HjIfgH66vI3IHmu6Ahyx9IlqnwJbd
         6d/5zpcuWUT0qPoDfY4bj6P55BhWsSHSNWVToqUYPM64YZ0EPxRP8rDRywtU2hWGTXCB
         pZCVHVwgVloX5EPCCJi4ZzopkZLTihbe9Awfotg2M+bMvQ9c7Al4L1A8E5YDZBhom7mz
         vcb8KBSCAurl5/WFZdAnqRrlRYExHz33iOwMhGzIXiYOMqxkroTqqDYP1egBziUxQ5LO
         rlTrY5T4M4fb+o5yGNhirRbIWcnsyvQgK0bwJ0t/c/uBXaIkuqdH2vavrADYDuINJ4rc
         wa7g==
X-Gm-Message-State: AOJu0Yz1W2ZbaHgXU5R27B51wwwtgKJtSA9TFAoJJQXfUiOI53Z5gLfH
	oSOEMHi1KT98pD0k2GcvmqemCJK2aGTUVCoPPNvgsOO9R9PPq+neCmkZ
X-Gm-Gg: Acq92OGssgIlxFGpLcGd760+DDlk97SsQy9A3VunhLYX9SzmD0TVv8rCm/Fzx4wOCqq
	/5jCWvKb1V0G3KVtyTiE2xnkOylnUB1gNOBgX62jV614WJr5EmWJ0KMPaIuAmDmkMObd8V5ktGf
	oF1edU0874UlkjZmILNGWdoABpXvowNN4IrWYoM06H5Fr4HUvHoZ58pktTfhNelkmQrB4OFw7Nn
	BSzk62ZgS5VQfeZchNTYXC52bVduOmpkSqppdd338qPYyN1Q9dn3b42Q76nYMQ+7KgPHNasSOsL
	fJmia4OjrCPZH+uyzWEvw4nkSaY8z9hlr1OiyT2aHysXDzV87giEssSiwcmFpTA0Zbr1oFKmUIL
	FATHH7U+jWN4dwyrRFiFtFYlrYCcWz3VD//KbjJNqZ64diM3fEibwhfS8xx9i+Vwq8xem+2q/Og
	97lMWpkGptaGW/358nz6wRTj0TuQgoH3KjT4rJAnAfaZlEOK2ngLkviSGGscmxaaKHW8qxYTcIM
	WnlVMuG6EwIIAwbj3GuVAF62pYLNWbhMXB0xHdp9Nykluqqc7VrE08jSQhn6C02Conrfif+CaAh
	NBmeG9ZtoEQDkiRnaR8=
X-Received: by 2002:a17:903:90c:b0:2c0:b7e1:7f08 with SMTP id d9443c01a7336-2c1e859fc13mr290306175ad.28.1781080643939;
        Wed, 10 Jun 2026 01:37:23 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([103.52.208.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm291897375ad.18.2026.06.10.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:37:23 -0700 (PDT)
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
Subject: [PATCH] Revert "i2c: designware: defer probe if child GpioInt controllers are not bound"
Date: Wed, 10 Jun 2026 14:07:01 +0530
Message-ID: <20260610083701.18663-1-hardikprakash.official@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38229-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 988F76675AF

This reverts commit ef76a3a28c79b628890431aa344af633e892035b.

The patch causes boot regressions on multiple machines. A NULL pointer
dereference occurs when agpio->resource_source.string_ptr is NULL (i.e.
when string_length is 0), and a probe deferral loop causes CPU starvation
leading to kernel panic on Intel CI machines.

The patch needs a proper rewrite addressing these issues before resubmission.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
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

base-commit: 3f786abd23951f3f600a62fef42469d9200d5f52
prerequisite-patch-id: 22fa9ba20fa28cf94185281704c51feef7abc701
-- 
2.54.0


