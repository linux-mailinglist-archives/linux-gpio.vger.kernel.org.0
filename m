Return-Path: <linux-gpio+bounces-8637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163894A3D7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544C91C214DC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283F41CB318;
	Wed,  7 Aug 2024 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FT1x3U8O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480911D173B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021886; cv=none; b=UJHrwHMNDMQJa2YzEuhDjrPlQOPEPQPxp3SqAkLxfoscvTheY4uTGzELCAfVSyKVEYvW6DF7JW57ZDzBtL62/Ln5srL4MVJ+Uc1AmdwV5Goir9usKUFdBcoelfMhPBjapemxVnpDzaLDV7si3I+YtIs+X16oa22syaBE2dcaFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021886; c=relaxed/simple;
	bh=dbvjRGNmelcenKY6JKDsWpjzFkWOY/sdhX+4XylckwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXish+zhbPMaL+zycxPVvPgOU0ssaepFTw++2psk81dt1Cn/douOWGmhPFS2OvW12tDnWng8B5LYCvzLXbYDiXxVwOGqadC7wwgkcJokBTxzY9lKvNwP0uJj/eEB5/2vrL4f+qXGiHtgADpjd/ldIpKCqsHuL9XhOf9UXHIlt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FT1x3U8O; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso15883691fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021883; x=1723626683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmKu9lH9xWYQGAKSqvif1JN42oJCOxk7azckLgWclIY=;
        b=FT1x3U8OHocM3w5CNW3VO5GSncxb4UJtEvOXOO69ukrK+w0QWgWujXOaTpaxOkJb31
         O/WXQ53YJE+HkRHN5b51vEvIY4ZKUkc47PPoPyH/BqvtQySoUYZSv8LYD9ffqCN1Rdsa
         8jzaL4jghqTvTZt1kw+U6JpN1gdaTYBU4HnjoizyCvLLTsDvoMu1ihcHGo4bu55IUv3O
         z0XWEUxvDLTVHhNC1clC+o+YlXpEE+tT86Y5sCWg8EtGBlUKN1gM8w/cqslxWDAc7pAR
         Odip244uz9l4mHD7UG9aXt+Khpcw3KpPmmMkgxgmMyNDSHKDrGHrz1jhqujxooXlhpW6
         B2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021883; x=1723626683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmKu9lH9xWYQGAKSqvif1JN42oJCOxk7azckLgWclIY=;
        b=v22zdM9Jrlqa5yD+NHzfInSllF3cmTHlbSll9X2eWjeGcAqjKWOCOKUWsyy74uv6uE
         sSR2udqNTTFIolZHfooaPWJEVMWcOt9MjLk+X6S96fCo3yKGZG3/rYiLGSqX61m8ppIe
         9Zs51iAEk3cyxqav8q2pmHsTXgTqEUFHuQdgO9tb890zKptpjHxqdAZ2zroHIziPnBln
         QHmqnmYtSCSrtkNyLyTVOh7yJs47jbW/Vx9yOoOEUk3Ne4AozS09ykTrt479sjyObzUn
         fHBCSUkNXT4KrnInkfmHE21eeYj4SeWynVhrKsQN8B+3QMziDySCQ7LUoc/zCQ4qRDKH
         YPnA==
X-Gm-Message-State: AOJu0Yx3DyuSR/OD3mEI+JsKYfgF2OlYvFDcK1Eg7G5ZBJUwlKGYJJF+
	piRZVpI5bu969schVMuhK16oXD8sATaU3vIqOJ+x9NUkkZNxxjnbus3pENMteEU=
X-Google-Smtp-Source: AGHT+IGX9bAqVsKJKguRlPxnyNnkemaGaJCK+VXBTQESlX6bHuM4CF8uCTQr+YpymALroHWld5PDhg==
X-Received: by 2002:a05:651c:95:b0:2ef:1db2:c02c with SMTP id 38308e7fff4ca-2f15aa83909mr119049191fa.10.1723021883475;
        Wed, 07 Aug 2024 02:11:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:43 +0200
Subject: [PATCH libgpiod v4 12/18] dbus: add data files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-12-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5uGtKWTlFCDU1nul8eXNrce8KwG7JiRpVs1b7fBHGLc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoSw+4WBdDBLUaTb0gJwm/xTNy83BUfuRVYY
 f2r6zWNDOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EgAKCRARpy6gFHHX
 cgDvEACsj/dn+FnQ9CPkHhc03heaTWMoHDr3xRFyE5olWTG3/HgZ5syIjNRjMWhr7SsVaAHmEFp
 hn6f/vROmdRhcMqakQ3BZKJOU0bTUMQq+XgVI0Vgs+xmXAfJs2W/ZzvW742z8r8M2LSxFjUDU5m
 U9qZF990UOA3Olv7Qp+5hDzIjPkz/B8vVFEKXUIdHzrxdUAipYAzlB+x74Uvtl+bax8fkJPsPr3
 BjXr4KI//JscgsvKR1I0bJvgBt80VTeX2Gd0GmBDODDoEwV0Ho2V32XbcAvISOVBWoTF4+hK/Wo
 uuIIn+ugyJH0Q4qVhkmXyD4ePJFWDDKS0XP7ca/bmOwyZ8P0GN/CaaOdnpvlBhrAjkvxT/aygW2
 lCXnosSzioxhIihMpi/FfRKgGLKy1laBDwLjp7IPWiKjn5ya9z+mZeIj/OYKzLwb614k398dsZF
 OVOVhc+8CBEvtcLW6bjJEFZCS5tr8hz7YJk6C+xObgQK6VT5H19MddV7k180q5PDPUZzHi2KGFk
 tmnEtJxKveQv6RWuchzmkHAG7uXCP4zWcDhTUC2u57ckerhGlpOSjDyn944h1c1BbXHIuFcudVF
 LEYPlmfQy2DjMjCAonwdtzlExpNpQyd8PM2WJXrZ6D4gcUFkbVE9W4gyPdKmQWa/NGn5fv8CgcO
 PiSwPcoulU1bNdw==
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


