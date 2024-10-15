Return-Path: <linux-gpio+bounces-11339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23F99E019
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F3A281828
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE871B85E3;
	Tue, 15 Oct 2024 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C8uG4Guw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B418B478
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979239; cv=none; b=Tw0Npm4Imw7ZIQWlk8MXnP4dmyy4dnhMGC92ztd7UCMRFs4+XM9ihrYgz3gpK0kqyd25b0BdD1bzR+fE4mvfK6dtf6ntfn7YJts562ISfyqr1VjNwgKa+28xn/Yk1AIXZKQ8RYIjWDA+dYICQshMkSOrSR/noqNF68AqhWO8nos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979239; c=relaxed/simple;
	bh=lShOssYYZ4xdaJbyNHqanMXvuVDf0req6t/NTfNf7nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvyeNfA6pbD1l4izTurd5EdG1HiWl6zUMPTi85Cv+bHIKWaRMl0vqNnYcVUcMLX25gbTgd0ZvQ27CBIhKTzMMn0PKn0LtFfjM1wtR/0DQZB6EgbH7ko3I81/jPloDaUPcZaB25kA3/BNQynS1CFlZ05S4IVG/HRn0bfpDD2C7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C8uG4Guw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4305413aec9so48726845e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 01:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728979235; x=1729584035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPmBnjRzQjanP1Mw6RBxSNqB3Ne/ZGQb73RhNFBuRkg=;
        b=C8uG4GuwTNHV9EqR/BtD39M2ZOVdJtXC3cEBIc3xSh2PgCa6eZNemYGcJU+JQxHISa
         UCbMvlaDDNeZjBOZ3uz4D+dREtyFMCDzF5scxcAmRXSNgDnlva72LtUOvh8vzalER6fo
         THMwEQQPTrGY/NsdGSXrG4K/SIhj8XPR6G+MNEJ7e5lPeyHTOLZ0uV3H4RfhGF32CM1a
         lST4YVtSUJY4EHBXlG+RfmXhgT8skX+y8pyjKtCSb/UZLuMgo3UEXsZHKKcghUrN8tut
         S77T4k2Uq8oXWG+xopSoHTq+wQttnBCdw5olKKnQ/9CHCTIIZ3dWBLDntpe8Wfmkf4U9
         yKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979235; x=1729584035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPmBnjRzQjanP1Mw6RBxSNqB3Ne/ZGQb73RhNFBuRkg=;
        b=axGmIPxqpq480ddm/RUhioLpd6VwKm8V2Z1jTK4S2AiKYjrIdyB8rz2aOXa/s4Ga0H
         p3S+Xllw/L0iCSlQYepmbeBkCE0351mK2cU9UN4i59Ivi84Mlqyua8tspuPAObpo2r5m
         jkOunB0lt9PMNazURYTr2mMvSpyaqSQGzAZCaBSEsO024whatqyJgnDvhGhP/Q0YM//j
         KIDCWvW10DoxDRPysac8zR53Ydwon5k3lWemwPid2tisjcJxj5D+UyqDIjNQ/ynR3+LV
         LjCoA5r+PBoFNwkQJhSpyGc0cK2HpYv9+HJLq5+iOh0NM2Lx44xo5qwk0n+GBAvddBhF
         cNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUOX60xeF0G5lw8cqGzY1pa/aVDKmNVa1Vj2OVoaRSkxhQzX9u7xOL8PUYqQmCQeqpDyBY7kdy6mXO@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGQQUx3N49Ld6ruawCh8zVXN2PNX/mGm2XO1MR53BOGbPrMhb
	cJx4brco7XNGB6KaBiKX9HIpDe212xGKUtqmfTPFCgz//ZdMMA6GH5uumDrumI0=
X-Google-Smtp-Source: AGHT+IEUywC+aHx8Z0+/e73fat6PMCBV3/OMS++EeHAQrljRwiBLDr/pa2onfeqqcFJG0JSYBp3U2A==
X-Received: by 2002:a05:600c:6d48:b0:431:44aa:ee2e with SMTP id 5b1f17b1804b1-43144aaeed1mr4322285e9.4.1728979235307;
        Tue, 15 Oct 2024 01:00:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f6c5531sm9962385e9.46.2024.10.15.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:00:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 10:00:23 +0200
Subject: [PATCH v2 1/2] driver core: class: expose the class kobject
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-gpio-class-mountpoint-v2-1-7709301876ef@linaro.org>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
In-Reply-To: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xdeL0K0ax/Y+4XPXJs5CzHWIMj0+eRuCDAFQgt0geww=;
 b=kA0DAAoBEacuoBRx13IByyZiAGcOISGhKwaCS/er5T4wAxp/HjzMKJo3xyuU0cEhq74QKUqYU
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJnDiEhAAoJEBGnLqAUcddy+iQP+wRm
 Q9YBOVvXAgenreppoNEPkVmNCkgnPoZep6I+RbrXKPiE3VVycvOVsVBml3QfQSKVFWIbE7wVJXM
 P0OyasicWOluUUlEn5W3juVds1FIU1ZwlzT/wl5+HUjsmAy1dqjB8bpBLLaaCbQZALwwX4th8ZV
 pY/jI1lrx6GbOdk9tir2xx+gD6gGBGOs2vEFj7tP4OFDoSVEbYiv20TbayEHC1pv9ALtqz4zMlx
 YlS84X2PGxHjSsk18rMD2JXYieczaDk6Pgw4LrIYg+QTA15IY2riKDpm21kjKdFOdYyTGtQOHf/
 nC9F0QKwgO86rw8nNkr78nG/+0c5+ZC+BW6hmzN5jDHmjsay7Ao512csecRfLrCK0l3XqUk82nU
 JHbHlL7eJzfRBRwvmztsDQ3CSykX6wkkztLcF7fWj82GVd0zh2CeB1wJT2MaheEr/xysylfiEWm
 3fXzgp/fbZt4rHk9X5SBd167WoYjt+gMSh9TbrXeRmOn7JAF0QMsmV79tPnBdz2vFbrDYvfXJjm
 xSw4e9FRpODUGp/M1h0H6j2/5EDv2WphzyIRlzwlXa7eGkVS4CJ8t1kAQjuATfI/gMkOq8lNU00
 tDWYdp9gzLkEmEU9nXo3VfbcrZjWEVQxMvb0jR7ztGy5FHe5zHQf2yED+JFG7wcmFxfWarpzhgb
 KJ+dE
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Export the address of the /sys/class kobject to users that need to
chain off of it by means other than calling register_class(). This will
be used by the GPIO subsystem to provide a backward compatibility
mount-point for the GPIO sysfs class once it's disabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/class.c         | 6 ++++++
 include/linux/device/class.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/base/class.c b/drivers/base/class.c
index cb5359235c70..68474aff53df 100644
--- a/drivers/base/class.c
+++ b/drivers/base/class.c
@@ -23,6 +23,9 @@
 /* /sys/class */
 static struct kset *class_kset;
 
+struct kobject *class_kobj;
+EXPORT_SYMBOL_GPL(class_kobj);
+
 #define to_class_attr(_attr) container_of(_attr, struct class_attribute, attr)
 
 /**
@@ -668,5 +671,8 @@ int __init classes_init(void)
 	class_kset = kset_create_and_add("class", NULL, NULL);
 	if (!class_kset)
 		return -ENOMEM;
+
+	class_kobj = &class_kset->kobj;
+
 	return 0;
 }
diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 518c9c83d64b..898f7948293d 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -69,6 +69,12 @@ struct class {
 	const struct dev_pm_ops *pm;
 };
 
+/*
+ * Global /sys/class kobject for creating sub-groups by means other than
+ * class_register().
+ */
+extern struct kobject *class_kobj;
+
 struct class_dev_iter {
 	struct klist_iter		ki;
 	const struct device_type	*type;

-- 
2.43.0


