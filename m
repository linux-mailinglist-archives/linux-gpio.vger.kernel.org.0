Return-Path: <linux-gpio+bounces-11114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E69971B1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E5F281360
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9041E0DAE;
	Wed,  9 Oct 2024 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z24tBS9L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137D196C86
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491360; cv=none; b=Wktl668lNBh0T4Y9t7rK6EcOsnAv96MRnZVsBlVqNXGrODZfY3i4Ncsw1hyXlS9B42zdR40ecW/uDsVeaURUQNcs/SseBSaUwNo/8y+Bt48Dlyasqu1Q6TV2OM3cjsaKuZBB3boSEXxtRJW9FW/reT8k4CdovC+XcZcVSk/+vtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491360; c=relaxed/simple;
	bh=lW+0TCd8BxDsBBfUnaLJjsVu76qI0seb1e22Stamx08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mi1KGOjV2rB2rkZDt98fUHDgABrqHlvWhp2GE0qzEI0ROm924hs/zlf9Pf+YfvMlwcNK2Lpl4RRSmzJTr4aglEBE9ipvqEW4GWJRtBZPhBwHNZpMSXLLTfnPveYGqFMt4k/SPUQa255of3em8v0lu/pxXRJfN43rbruYh78uCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z24tBS9L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso66560615e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728491355; x=1729096155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OI78aSVS2Ev2nfIrl1yxq/QxZLHj12ZW0R68G4VF6o=;
        b=z24tBS9Lw/GFwR4m3cfddfFJCPSz4zbiJESqdLucYzSPVJuphbdPkik4IxxqWrpumo
         XVdIaiMM9RQ22vp4DudfwxLtjxCvd32FoAztGewToIQqnrpOp4MmeO2QNrpIijFukQat
         41v1TXindA0Ku3ILqwOwcOKBDVLZiGZEuT7kPUqS5mDkctehAVI7gLfcHmZX8ZH8SGoc
         nHxPaCqlO9kERKydQVYOebR3AErGoEkkWE+733ibRIO0iOXFs27Gz/AZaBvh4Q+lES/S
         +1V0PD1VrYyisIB412Minhfo982zpDFn3fw+QlbC5ko/4TJx2Duc0kciCsr2pc03h0m1
         s8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728491355; x=1729096155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OI78aSVS2Ev2nfIrl1yxq/QxZLHj12ZW0R68G4VF6o=;
        b=kcJyxBD64agMU+aMuU/8TxqNFMdDdcW7tiQ0r9JuT9SnkWeOMNF/zDpehrteK4XoL9
         ufGqOeqQGKEOZWjwDKIJ2XbuCNt/ociHGTVJTKb2PT+7nJvw4/aB6QSgVgzfJM2d4Huf
         udcN/NUl+xqoR2e70zsVaIJJdM+DHD+LdqgkwkMCspVz7Nz68Wr+SnYPj/KsBmcX6ATX
         uV3Z70qDMeZT30DBM3YHEBpoUBoYODfYR+NYBK/pcIRkaR/z4JtRVM/8yC2Mr9Moc59T
         hyQ0g0rpt2P5mwNWOXCYrWfUhqrmQ1Awd7OQDrlyTIQ3ZZmY1zqmTxcHjeT/PWdislpQ
         zfaQ==
X-Gm-Message-State: AOJu0YzoC/kHQJwO7MxdzJcEKeUnrOb2daHoTJ5L7q5Vnox4ajmhOl73
	VIkzMalrPExb2eque+3uRKxNhOD8uHTse7d0KP5Meo9Hs3xYrW4kqByXqe3fKZE=
X-Google-Smtp-Source: AGHT+IEuDllRWX3jS65oK8Zgnzeg42AiQ2261+Andt562SYs634kUVn3fhxFzLQd2znhLCCIz4tKLQ==
X-Received: by 2002:a05:600c:512a:b0:42c:b950:680a with SMTP id 5b1f17b1804b1-430ccf46d68mr23997625e9.20.1728491355331;
        Wed, 09 Oct 2024 09:29:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ff96:3068:2ae4:3fe0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45df4sm24795475e9.13.2024.10.09.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:29:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: mpc8xxx: use generic device_is_compatible()
Date: Wed,  9 Oct 2024 18:29:10 +0200
Message-ID: <20241009162910.33477-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009162910.33477-1-brgl@bgdev.pl>
References: <20241009162910.33477-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver doesn't need to include of.h and use OF-specific interfaces.
Use generic property helpers instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 30f36f94ba1b..2f66e24127f4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -15,7 +15,6 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -301,7 +300,6 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
 	const struct mpc8xxx_gpio_devtype *devtype = NULL;
-	struct device_node *np = pdev->dev.of_node;
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
 	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
@@ -368,9 +366,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 * the port value to the GPIO Data Register.
 	 */
 	fwnode = dev_fwnode(dev);
-	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
-	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
-	    of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
+	if (device_is_compatible(dev, "fsl,qoriq-gpio") ||
+	    device_is_compatible(dev, "fsl,ls1028a-gpio") ||
+	    device_is_compatible(dev, "fsl,ls1088a-gpio") ||
 	    is_acpi_node(fwnode)) {
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 		/* Also, latch state of GPIOs configured as output by bootloader. */
-- 
2.43.0


