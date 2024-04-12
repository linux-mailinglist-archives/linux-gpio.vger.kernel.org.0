Return-Path: <linux-gpio+bounces-5424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7B8A2E39
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2437B1C22758
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208AC5676A;
	Fri, 12 Apr 2024 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2GfeNood"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC3556B63
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924910; cv=none; b=VAWM31X3mfO2gWb7L5ys1ExCSm2KNqbNnXFPoQptGwYPNC07c9wBqI3++C1adqpbsECluWGJrRfu8c265XG16v5ReDPS64QusM6vRfmViB23r++QrT5nsHeDA+jQEtmoeNHeqymDK+HxVYqNi+lns5SkRYL3S+jfzyQzLa26L3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924910; c=relaxed/simple;
	bh=lDogvy1NmDeYmYacGtTx7rTFT3x4N+rmebbzA9zNKPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SOCE/f7JFdw4CKBZggRUGxdxiLcCMXqI77Sqx94+YZdVkWtlMLglPo/HLQkBLLzAkyKg1tcAkQ+hEBsTw9CMHwAuu/iyVizUCNUYArxNrjdcXVTjpqugmOGSDd20DkXLl7dH+ZPLwzixYQ5eCZPadbCuPdWDvq++PNqjvc8ZkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2GfeNood; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d536f6f2so961055e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924907; x=1713529707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i21RQif0H5YGKg6EV+vl6C+GSQnwH3qhYS7OSCEzfkE=;
        b=2GfeNoodwG9ipf1vBvEh+7cWCXFDJpPQOeDhZiIK9RzFk91r7oMuDSJEk/aJV8c6io
         AYgAZNEcm1GO5NCaRvlyZfQ/m6X8hhF2k1S487tMAB4ftnNvcOkhad7956FK1XXAm/BC
         rvLKpdz8WUaU2owIjOCHHXs5yuSFvZgOjv8s9NcNo9amoLYvtjzSsSTYzNWxj8TangfS
         Zy8dk1LP5bFViM8p4w1jgtfecrr0B6y0FaxifhNqlC0ve0O7QmDR9Yc8pD1eh9KhmA1j
         Br2fM38BcxuqYOHu/Nn7oZa2KIHUMWSNc6EuihqSROxCLulDYuaCf+8fpEt1+7Qh+xDH
         +zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924907; x=1713529707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i21RQif0H5YGKg6EV+vl6C+GSQnwH3qhYS7OSCEzfkE=;
        b=ZiyQwxQGwQvrOwA4gBRwjzSjBga6bi640r7oha3MDgwV5xxCzM6nLKjezU8uv1tECt
         mqocRNbB5bNCQLKn7ZXVJzxJ82hDEo1gumNxacW741kUKC6PU5qUhYvFjO5QPj/7lg87
         i1Fxm5bdbrNopqLsGvfFKX+jaU9zvumWHWTmpQNL03mcseMEG0eZDmB7j7qXWT2OxeXL
         YG6lL3vhKScJarJ7c59MsyP42rKnyOjc4VXEyxqGsAhnb6ekdeCu9iN7/8DdGGcFQtkG
         9yFDPLcJ7NsSuNDIUusLB1Oj6QHcOqW7iXPGMOK+QaVzVh7+GtDAbmKhS3YRxdH1pUHi
         oC5w==
X-Gm-Message-State: AOJu0YwmEelkKUeWmKhUazl1rHs2JHZ4LQHTg1lXdTaFbhQP1UGMx/dG
	xmZJ9JmTAA3f4mJzODCXFeTGTSbzdxoCAw4Ba2Q5ayvtFKsjhhx9DS17tvFO/ag=
X-Google-Smtp-Source: AGHT+IFGDKIWOfCH368IPVV0c3BexX2vk8T87AV4xdgO1FEJAfzfSqZsGKZQcN2FPt9IZWnSXGxzCw==
X-Received: by 2002:a05:6512:3e0e:b0:513:c95c:4dc4 with SMTP id i14-20020a0565123e0e00b00513c95c4dc4mr2586955lfv.7.1712924907371;
        Fri, 12 Apr 2024 05:28:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 12/18] dbus: add data files
Date: Fri, 12 Apr 2024 14:27:58 +0200
Message-Id: <20240412122804.109323-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the default service configuration file for the DBus GPIO API and
a systemd unit file that allows to start up the gpio-manager.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/data/gpio-manager.service | 14 ++++++++++++++
 dbus/data/io.gpiod1.conf       | 29 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 dbus/data/gpio-manager.service
 create mode 100644 dbus/data/io.gpiod1.conf

diff --git a/dbus/data/gpio-manager.service b/dbus/data/gpio-manager.service
new file mode 100644
index 0000000..f84f8cc
--- /dev/null
+++ b/dbus/data/gpio-manager.service
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=Centralized GPIO manager daemon
+
+[Service]
+Type=dbus
+BusName=io.gpiod1
+ExecStart=/usr/bin/gpio-manager
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/dbus/data/io.gpiod1.conf b/dbus/data/io.gpiod1.conf
new file mode 100644
index 0000000..339a382
--- /dev/null
+++ b/dbus/data/io.gpiod1.conf
@@ -0,0 +1,29 @@
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0.txt -->
+<!-- SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+
+<!-- This configuration file specifies the required security policies
+     for the gpio-dbus daemon to work. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+
+<busconfig>
+
+  <policy context="default">
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Peer"
+           send_member="Ping"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Introspectable"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.Properties"/>
+    <allow send_destination="io.gpiod1"
+           send_interface="org.freedesktop.DBus.ObjectManager"/>
+  </policy>
+
+  <policy user="root">
+    <allow own="io.gpiod1"/>
+    <allow send_destination="io.gpiod1"/>
+  </policy>
+
+</busconfig>
-- 
2.40.1


