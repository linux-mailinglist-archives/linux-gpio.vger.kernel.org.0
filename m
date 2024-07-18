Return-Path: <linux-gpio+bounces-8274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4867934AEF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA3B281E37
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5882494;
	Thu, 18 Jul 2024 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a1M0BaBx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD068175F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294945; cv=none; b=L5s2p0YTeYAHMtKOSin9m9OfdrYo5iy63gjWAjHr0P1nJ1uNCEVDA9via1OdBvbHLnr6XvMIWWC5N0j1LKoGtShs8rz+1JGsPfl+vfHe/mJ9C6513gN53OBxzFgZit8zKepJtvEDd2iuqGmxSpgQ80NGa15C9T+b/D57Dkp4KKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294945; c=relaxed/simple;
	bh=dbvjRGNmelcenKY6JKDsWpjzFkWOY/sdhX+4XylckwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrRVdH5iA8DLuaRXjeMvASbkdJw0MKPJBmcCLSaFe+R2TI1sA+AezIvreE94gnrmbSWAiAu75usOw5/a6ETJW9A705NPtzAoCKqf2g4yerQSHBLHm7brSujUtc9ySudeifit8aWhBLEA2gRs8F1ktOKEODbGeeUCzNwySmIE8V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a1M0BaBx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367963ea053so445101f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294943; x=1721899743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmKu9lH9xWYQGAKSqvif1JN42oJCOxk7azckLgWclIY=;
        b=a1M0BaBxIOTcTSpq7g1P0rEUFBc3uil1+Ff4Wsd9ZZk8k8nsiZtlTTOWkhDlKoFLu3
         XpyMysSet4NCBJHPROVH4kOB/3uk0OwkAaFeRTsEzSgOpq+T587MCal0RRY2b8TIw8zi
         4bVcfzwOZNvr3uFiORkpoUZVk+E2+Qsj7s6rYCRaq6jL4yZmECD9EwU0ZLvyKjKYLwCG
         TR33+HJ5vJkFadpVaONwRlj5EOcdfR5d4RZxFvSJm9ThvLmaP84LA/HKUlff9Z/WkXmy
         Ucn2Us3PgtMu0o1MF/V2LgT48c4wlXQmw76fyjPTtEvbuBvecCW/RJPNzyarsdB+Ph8o
         lpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294943; x=1721899743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmKu9lH9xWYQGAKSqvif1JN42oJCOxk7azckLgWclIY=;
        b=O/J8Q5ip5FwGOp+Oi73GXb6FhxQDSm65DEPU/LAOkFugoRscgle4HsuMkX4W8XZt7c
         geld4mdvjs3ej9uBhlxy9pn4TCEtdJaioYB3gBg143j6pqVEysbOyvn25ktugEB/9OfD
         jVRfcLf42LX/x1HfTrCYSAsSdHItpPUmAvylccxZE5xSR5dm0/Oq7ZNIQT8YqRlyvf8a
         MC80p2fIU1MfLll7355tyIoRJr1917WhTwK2hHbHkpur6pZKgwe0S09t9cqbJKbsIlrz
         88Y0kKKcWYS/P1IKsSHycSsQBxVJqaE6mKhcCO8rkvQ+ExsKmDAOpxw4hZyhO+1LxNnY
         kA/A==
X-Gm-Message-State: AOJu0YymE6juu6FE/g8s+5qdfEKZA1ctCfKAe+EdiBb69Edl4cjjj15G
	AuerxOvZUZxMyrZiGEWswk04Zf/o/qKQOJkMWJUJaeDkZ16biVCMADQI7sqncj8=
X-Google-Smtp-Source: AGHT+IG6YAA3+cbMDAfS69gjwGHCQ7izEJhrt3A45ZoM4skvoL89xrxkyhZ9G0SGlOHQXxPcYe9j8g==
X-Received: by 2002:a05:6000:2c8:b0:367:9c46:198 with SMTP id ffacd0b85a97d-368315f1ef5mr3842329f8f.1.1721294942798;
        Thu, 18 Jul 2024 02:29:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:29:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:06 +0200
Subject: [PATCH libgpiod v3 12/18] dbus: add data files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-12-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5uGtKWTlFCDU1nul8eXNrce8KwG7JiRpVs1b7fBHGLc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBAm7X+wx06Zb7CTqbESPqsevr2v2BzQX8rW
 /YFdDVAVcyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQAAKCRARpy6gFHHX
 ch1FEADQt4jyMJc1+t2tyfHAEVgcK9sU6tePSj+w3fxR2Xs++IoYOH6bV0XYXL+heMne9Ts76Aa
 V60oSujfhAK8/7f29vanonnqBx63nVAYS2aFd2gwAgNzxda46GN8dF1FKxwfPxXRoCV4fED64zM
 0lDcZTw3G2tmKyWLE3xR1aw5mvVjDLJ8Oi/EmKpGU/yS3NbyNeZN5osaq5PSfrh/wvVimJAydzo
 G7E3XEjxbKfQpPsKYyMp6TLOJIDx4DUY3ZaHAO/NxJNJ0GcCbKhyUYpdUlchlmM5w+XBlmsN89D
 TbAJvnUksJ0uicWx+UOfTRdqfcPNZbiQBXyzTvE/QlZkY12hpEARNinnO7W78+BXFlm7N/o8dR4
 IJJw95OVbkGoch9vSaWYdFTP3jp+Py55k4tl5RD9YGrPO6yI6e9LdQEE6K8CCAAwVY2xqpR5ouV
 MlR/GHhyrnIZ6ccTnzhqaMLnHYIsXm6fRJ7cFdyPjuWwgq8aMrrNPGKfs3lxIlpjEL2543ueIqK
 6okC3WwcWYvw8GDji+2xrzIUNf1C9yn2JILPJX84Y15KbWNxUX40cSRXic7TDAL505311dMhEyw
 Z9bNlD03h5zjO0SgZiwjCdC9C3T8ZhqMmMsBQW7N5LLNi2z1a2PztNVs109K5WFuaGAKecp2zF5
 g4W/J1OViXlbzHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the default service configuration file for the DBus GPIO API and
a systemd unit file that allows to start up the gpio-manager.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/data/90-gpio.rules        |  4 ++++
 dbus/data/gpio-manager.service | 50 ++++++++++++++++++++++++++++++++++++++++++
 dbus/data/io.gpiod1.conf       | 41 ++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/dbus/data/90-gpio.rules b/dbus/data/90-gpio.rules
new file mode 100644
index 0000000..ef27949
--- /dev/null
+++ b/dbus/data/90-gpio.rules
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+SUBSYSTEM=="gpio", KERNEL=="gpiochip[0-9]*", GROUP="gpio", MODE="0660"
diff --git a/dbus/data/gpio-manager.service b/dbus/data/gpio-manager.service
new file mode 100644
index 0000000..f93a6fa
--- /dev/null
+++ b/dbus/data/gpio-manager.service
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=Centralized GPIO manager daemon
+
+[Service]
+Type=dbus
+BusName=io.gpiod1
+ExecStart=/usr/bin/gpio-manager
+Restart=always
+User=gpio-manager
+
+CapabilityBoundingSet=
+ReadOnlyDirectories=/
+NoNewPrivileges=yes
+RemoveIPC=yes
+PrivateTmp=yes
+PrivateUsers=yes
+ProtectControlGroups=yes
+ProtectHome=yes
+ProtectKernelModules=yes
+ProtectKernelTunables=yes
+ProtectSystem=strict
+ProtectClock=yes
+Delegate=no
+IPAddressDeny=any
+KeyringMode=private
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NotifyAccess=main
+PrivateMounts=no
+PrivateNetwork=no
+ProtectHostname=yes
+RestrictNamespaces=yes
+RestrictRealtime=yes
+RestrictSUIDSGID=yes
+SystemCallFilter=~@clock
+SystemCallFilter=~@cpu-emulation
+SystemCallFilter=~@debug
+SystemCallFilter=~@module
+SystemCallFilter=~@mount
+SystemCallFilter=~@obsolete
+SystemCallFilter=~@privileged
+SystemCallFilter=~@raw-io
+SystemCallFilter=~@reboot
+SystemCallFilter=~@swap
+
+[Install]
+WantedBy=multi-user.target
diff --git a/dbus/data/io.gpiod1.conf b/dbus/data/io.gpiod1.conf
new file mode 100644
index 0000000..99b470f
--- /dev/null
+++ b/dbus/data/io.gpiod1.conf
@@ -0,0 +1,41 @@
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
+  <!-- Everyone can list GPIO devices and see their properties. -->
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
+  <!-- Daemon must run as the `gpio-manager` user. -->
+  <policy user="gpio-manager">
+    <allow own="io.gpiod1"/>
+  </policy>
+
+  <!-- Members of the `gpio` group can request and manipulate GPIO lines. -->
+  <policy group="gpio">
+    <allow send_destination="io.gpiod1"/>
+  </policy>
+
+  <!-- Root can do anything. -->
+  <policy user="root">
+    <allow own="io.gpiod1"/>
+    <allow send_destination="io.gpiod1"/>
+  </policy>
+
+</busconfig>

-- 
2.43.0


