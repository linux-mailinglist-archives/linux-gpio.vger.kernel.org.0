Return-Path: <linux-gpio+bounces-7796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF991C1C1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 038891F24D14
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB051C0DF1;
	Fri, 28 Jun 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gr2hJraY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB41BF31A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586439; cv=none; b=nw6mjv8fKFJIMj97FD6U/3xCNJijgR3QVxPIhVFGHWeulK6I5F8xUe30IzDIzMd7WQRCaNivm0M61sIXJDESClie4SUQyic5VPlgIYVa5LaHbvHSkOXRZk3C9shBNsLagBKkZlu3oTCLSRe7QlUoRT+XG8pcRR414VBpXtSO0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586439; c=relaxed/simple;
	bh=DdvrNh9CUM8EGByowb0nAfUbRPX0ZycLnwii9270CsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJo7L8NnglYji2xiYb91kVDFDXbqkeP8QAzZx6IvNM+Xo5+vBJjpsiGj9UsEoAEgv9xH0ICs3ATB70mtNnv9+2Sgh/fTyeo4ZUPIfvyBgSLwcomJ+QujvwrijKxeyfV2ojthPmGhrn4ulaCvfZcyLTakQ0m0LlahCJ0BNfrR8oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gr2hJraY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36742cc9c12so456538f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586437; x=1720191237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUcuuGRbJ56dacHqrtu+36kwpTXuoyZIlL4CYBgLiFs=;
        b=gr2hJraY8yxKCGuQAvPxzd7ziKD1gAA8C8TueO78S/mXXmyLmqxMMGsaqzWil+Ta90
         yOrALMvNbhPemNOBL1tm3cp6l99ru5FiSxfE/h58sMbDGWOyiL89hopcHaKiStNlfXfq
         VRq5i233eYtQypeMdZ6Ne2WYkTrJkU2SUyO0YgzaZDTALDt51vXg+PuN2Qd5aOy0gN9X
         9rfgQJH99ZlfmqDJ9TS1hPTbM8wKABJ3slEpdjzJ3BN0x480hstTzlBL7oGb/BPB6WGH
         948x19QFiYtCYyJe/0lypmpVSXhzl91E+rMYWFY/phXO86MvWhRo54WgIHKvn2NI97Kq
         wFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586437; x=1720191237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUcuuGRbJ56dacHqrtu+36kwpTXuoyZIlL4CYBgLiFs=;
        b=W4gOEt+Gm1d1H2X7G/5UmUCjkJ5HtSss4PWGDo4WHaQVKFuCg5kCz+oEsv/7niHMvz
         S8dKsJxCZQj8JjNQSniq0NyY9VBvn4Vlzd60UYm7kpCkytIxLRbsYUTbCBMqmzGX62+H
         D7S4lEcw60HNpHV6FodrreHEPZC9CX/rnXmSBRw/CLLOvOhepHN662a3yJtpKT9vieKL
         Mob2iDoKtwsW+2KRCSGeQpZmEnzxFahEFHPueauGw3MhqDcPeLH0ic+MhJrMa5terot3
         z0oDeeDrgYfVLlgB1yj52mGJgapmnsgDztZnsA+RhNZq5o3m/7CJD7wdv+2jgbXkT7lD
         QgpA==
X-Forwarded-Encrypted: i=1; AJvYcCWjFNYfUx0Q0s3zE52GMxxr3ZGHJR2y+k+dQTLOjbl/0wDuSHdhwR0P4Qu58iiBM1iu01x7B4XHQ600tInh+DLYOmuVsCN1lTzWVQ==
X-Gm-Message-State: AOJu0Yy25fWPc7O7PnG39cAgDYo0BAlW7CsjiSj+rSQ+TYQrzfbd2I+m
	JsfkEitxCslMxUm4GullMIpWaU8Ny+rSJFKqBiYjg+XPrPkiPPqkq6Na/gB/NCk=
X-Google-Smtp-Source: AGHT+IEzz1rDJislOrMPi7BhfaYEv+oIANDAmY7Tb/oH0LmXhxi+raBPp40ud/nkQdmr9OXR0S6URA==
X-Received: by 2002:a05:6000:4006:b0:366:f3b8:14e with SMTP id ffacd0b85a97d-366f3b80284mr12824331f8f.11.1719586436876;
        Fri, 28 Jun 2024 07:53:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:28 +0200
Subject: [PATCH libgpiod v2 12/18] dbus: add data files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-12-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
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
 b=kA0DAAoBEacuoBRx13IByyZiAGZ+znOj82T/r6uHLnc1xq+jbcVFUsJZI1ca2c+c6Z1qvN698
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJmfs5zAAoJEBGnLqAUcddyHrgQAKSV
 Tbz7bEyJ43nZXFzGujkbHJ1yDZ15fsSqBRHmWT9u+obIlOYJoCcWVa1rIqEqgFx80x99bIVwP3/
 7PpgtC+ksbAU6p2yRXBCcsp4qUa7I7UjisJ7P4iC1Ngb9pvMzNwLVNi3qtoT7T19fGMT05VL05K
 23PZVMR9jV5yFD8G5LU4m46XENQT/ULJIkSP/+IE3SGLBQUbUvZqTaf3vkDbayYJTDIRQg6Z1hp
 XJ2BgceyN8BTCqZHl0jg7RXJkYofU70Qkk7qi39SQfyufiko/JMel7boYC5piiJkLX1ARPV8q/K
 wGwmqHhKCiijwPZShMEthek71V1uZ7pN3xw/ra19wwj9EaZuwK7TtXvWZc3qjhIJSiF6dErrQQ6
 M5ldwdOhZ6jBCZaGpHfO5p1lm6iiWXd12K1PqVL0mFTtlFQwu24FWPF/VVi2UOiTbd7AUZOuw0p
 uEBrEyKvwDgyrRZOQRSk201qePd8OtbCEyt9rmqp1/Zo3o6mhC5RHOf6G6kppIME5hPP6f62zze
 Vt5LK3h11yx9rb22WLHs2IAndrjVTjkma6wURbEqlaxR80i44FCkcSjvnUq9eaiWa4UR+CSC8e+
 h/+oMgq5lJTaiMKlX+U9BMN9f4Sa1t50c25pX+Mv+caKoNyANex8GTBu+ca+37Nxd1Wa6xECmMu
 Xo7Zo
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


