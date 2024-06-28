Return-Path: <linux-gpio+bounces-7821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678B91C63B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0BA28698D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0496026A;
	Fri, 28 Jun 2024 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qn0Qzlfq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D457888
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601155; cv=none; b=qmegqVH8cjRs2LGP292NPwKQlLn1X/fOx7TpPUQRbzlZixqUuxZOxygejdzvelS+FTLhDAF4K4r0glIr8ktpEfYva2cnF3gvUDSnEhjz5OAs7OnWyWRWmyse9sT0nDdDA+gq8JR2CfE9stMvkQ3/8HuZz2nh+aB2fDYfT3NMM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601155; c=relaxed/simple;
	bh=DdvrNh9CUM8EGByowb0nAfUbRPX0ZycLnwii9270CsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3RIQKXjFhf3lr51N4CnvlbVCIo61htbFqxeMPJQBe19wF7bAjej8+jEUOsq9+WN/mueZfcSL/04UGwDG6rEfvdOs+FQTDEDeRnWgHuD4wquUuaPbV02oIU2fQ7bL6025M403MWa8B+MBZ7nQ9WmuiUzsYwK34RTuruLo5yvuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qn0Qzlfq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3658197cdbbso517933f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601153; x=1720205953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUcuuGRbJ56dacHqrtu+36kwpTXuoyZIlL4CYBgLiFs=;
        b=qn0Qzlfqxl0PVHEqYv9uxiIprWsnA2KPK7lwoLTDj/to/DOt3iCriwCVd5TsWVa+kQ
         LiwAp4kMYswDAvGsuIGVU94Qe6EIHDasrBKjFNJ2P9Qs7hHWdYckI97Cbj8SnCkeSBpB
         AWt6waDsHBDKNz9s/74Y/RByRua4k/bUfXddkFPLJ1YR5TWWliLXKHHaOjL49UToyM3A
         BhhZbBi1OwlzNmpvbusBpDzfIN3T4SnNI8THvRoodH9K8/HjhUnaXf1QbV8nPrv4vPkZ
         J5PhiJ7zmSYYxMOy1/BDp5RYREpjoXK10GJCo+8UnNNyNUlv/QsooBS3rs7LevJSUJ0Z
         rBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601153; x=1720205953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUcuuGRbJ56dacHqrtu+36kwpTXuoyZIlL4CYBgLiFs=;
        b=dQGCmushxLxwU2aNFVNFoUDYXSwnS3Hn+snolOjoaYxP/1R/9EOlJw36bFhfnhLVeR
         BiruDpnQ2TmSIGubS99rGqNJ4WWeXrf2sLxP2N8r4oGmbUDxUSGhzzItY0fV4g7OThHz
         TXwFdo0kjOQR1BMj0Xtpm1l8Z5FFpP5aa/H9T09f3+RrhuHwxblRi+AzQ8y3te6JyDdW
         9K+97HuXMMawrF4udPvPTgoymRTyCvrV2iBtJ+KcVemVgYSzTBBKqqyWoid03Vjw6aP1
         xkDJaOwMbwo3+umMHzX6xd0hWYEQFx5cgmd4m+v0+uuPwbVos+AxRCYst/NLICBDj4eV
         4OsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ln1QOmGgug6IJmUqw9AZCRv3o/mqzYKsBECiqgngPEJcY/buzt9POld7GlaiKVSNz1JZ9NshrspfBS5nakp5CTfPbsXnjBX3YQ==
X-Gm-Message-State: AOJu0YxVLFRoN9TZEoJzZvHaUfiZOK1GjbZP7fNJmRONeQ2ZZ2VCEcxu
	nsFmg7Hqe4677b9tZXFb+Wn8WwmOhyOMGQxhYLFSJOwEV37WuxoPVC8UgkRJD8s=
X-Google-Smtp-Source: AGHT+IGEaINwVQllqqQOOhJvcWwv73G1fV7OaEx9Ge5/pesRC8C4X4DcICMAnxJ1toFOWtjv7OMpgg==
X-Received: by 2002:a5d:6681:0:b0:362:7c2e:e9f7 with SMTP id ffacd0b85a97d-366e94cbbe3mr11372485f8f.32.1719601152799;
        Fri, 28 Jun 2024 11:59:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:31 +0200
Subject: [PATCH RESEND libgpiod v2 12/18] dbus: add data files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-12-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C9K7A3TozwJBiuPu+rWOYmEK2blsjQR/Lw7cpTrkuIE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwftxhrh6QQt6bR3/zHKlMeF3MGf6TEsTnjh2
 6WTxv5zPkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7QAKCRARpy6gFHHX
 cop/D/0UuyFWjkY8YhFpdIza95rLKKxFb4Z6YQdoNntNSsO9jf0WqVeLqk53pPILYGZUAFXunY5
 L6nh/309Pwbfr6kRVudjPvMvP5x2Ncs8EzyD/bs8TDqIZRzZDf+9wT9dmC9rwLPfcvWITFszhSy
 oZJDsYJQleg3v//jx/pHeInn8gmisLc1fLMLcwFNj0HZOpO2qVy/jjAWm/ctcj5+QuoKqWns1wn
 IOVY0nJzXb4ctERKnEIUEqbR21UJagwab96JW/jI2JDpODvdXAUUJY3tyA8ui3EoE6IPKk4UrE4
 pnoXMxG7Z7qDKP/hts6ukJdAVvCQ+iV3xFLAp0oxYUmw29kCGEANcdi/TscnDM3/hqbMShbHRgI
 wjGQdgwjkXa5A8UyNnazmm8TmFJUc6tF+Fd7m2tUfLMoVZBCdwudLc/hA+kH/k/Exbccvwa9evA
 HUTL6dx24VQJqxU8fzKQDdHDx8KpOaL2u8hiJMmEfXszsCf991WhfxgA8CUxF1nbo21sZqb/rG/
 xEsiV2nwHiFKVQWq+3oSItf6jwHpMhYUzt+iHMquCYqb8tGxJEIfNbIdG9nNhz23PhFVwJGJPvF
 DX7yViiCZ7E6z14qlPDUHm724C8XEmyxpuDkv0BVuDgkgcwoOvXM3vZDI0BvJD54hoEquLGZzEM
 q4go44I8iyVLMaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the default service configuration file for the DBus GPIO API and
a systemd unit file that allows to start up the gpio-manager.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/data/gpio-manager.service | 14 ++++++++++++++
 dbus/data/io.gpiod1.conf       | 29 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

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
2.43.0


