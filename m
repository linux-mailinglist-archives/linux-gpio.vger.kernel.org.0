Return-Path: <linux-gpio+bounces-31730-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMMrCfKMk2mK6QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31730-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:32:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB32147BD4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 22:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 132B8301CF9A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 21:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BE61FDE14;
	Mon, 16 Feb 2026 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dBtpiI0v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A66946C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771277551; cv=none; b=jpqzswDuiP4Xm9TietNZhGDGgYGr16d1p5u09kjENfCUrvXT28I1zRZBYEbVEY7K/g6YP4KO39NM9S0Qs8jKuz3e4K/waEFbV63oTNvBxgFovc5fcCCEO76Jdc+EIkK3EXpZkGnk9ranZxWVurft6iHwW2WZhZ9Yf4O89LO96sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771277551; c=relaxed/simple;
	bh=lcuxvZqEEGSeY/Dl8OTDX3hSUxmdlaFclXh7Mg4h5KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfPDd3nhVD100fRmb6qobnqNSOumOs5An3xgFPTgG/qs9yNLuKYT1kVB0cR+c+jllKZYk9MKGidEhoU1hsshoR832XeUSYhnThoesCzgpWRcguFypDr6dyuNhNmVoLQS4PWZsVdima9GuQyn0xxxj2Wo9oPRU5qnY8gEom07fjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dBtpiI0v; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-46392972257so2405224b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771277548; x=1771882348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj+HAg3jozC3YBKX+d+Ru2M2CkEERrjBRV7v2yZznso=;
        b=dBtpiI0vam+THtjXXI0I0c9FkeXIY8L/th9BIAXv9w3A2og4OusahTTFlkf+bUhJIV
         hzBEUmgQ3Nd/2G9SuIRVKY042cXF3S7jqUtKtsckD3P+L4TPkTZ7cG2uOmOKEFgjxmXQ
         1w8eD1+/pisSi0/WZhdD29oiv/hGEhdhwlKc8o9DaCfsQaxWbAGlBDZSSdsoheeBIeQ+
         vUlwL+lvpNPvLtcu40VRjoyxDjLlgXvRpHWOgkBxt4SkmwH57U1Xc0cJM5JoPoWjJtyC
         OGn5wjIKIifgWxXqtnw6O9ft3cHyjd2f3guevK7gEXlmK/Uyxo5Tmb6FydWOAMknZxTo
         BLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771277548; x=1771882348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj+HAg3jozC3YBKX+d+Ru2M2CkEERrjBRV7v2yZznso=;
        b=ny/eQ8HZE4rQ84jWLlm8Rh6QnC/Zic56//ANskarl+Qr5V2/KnoxIe+1i2DqnKxVg+
         lonS4dzHSc/R8+c920Pq0sHapET25oBSoo6ftKCWIKx2ivr/dZ7tHrnqU966VWlsDQb0
         9esQBL4pKIkMspHs9ctiLW8QW01GvzI55VQ6cGvn86IOM298P4qVEGCZur6ODfNxFSmm
         jgxMViSlZBvClN1ZUOjTAEO4X+lYtPS9CZjLsggmW02/nua8tiDvLTNsDQXyNntB5pGP
         xSovRoE0YTPK18sZYZ/q8YWST5XmiPIW7E/BxiMHBMBn9szc4Aji+GfgTyhNQUCELoSf
         nuMQ==
X-Gm-Message-State: AOJu0Yzt7ZAnbeLkzqBmR9pDQqqDwhBarnHv30q6Uy9FKlWxOr42nF1W
	EerhJgqDtQ+lc92cPWTfuMNNKdca3I7k3gJUCOV6pxVTT7LdR5cAIReuuwzSautk5rbDv0TVt+O
	YeBs+
X-Gm-Gg: AZuq6aLaHyZYjwxTd62elkNptcRZ7kc46XWtXQF3pLNCrnXBcUiLqSZV3q63ydewj9L
	Ga349WR6DI7JEg2iV5QuIIUikmcwkFP0OlyxJYrdxPOsLpJf3RXbqh2t78MoFsMOsqzBbYtrvzg
	v4Y1vaidK89OC8ZFJ7PjTFHdYb6M7F8SPhY/8op7UUDwNvhXgt2feEkuhrrH/99pz1XcjRwA08r
	gfMc7SKJUJADL+bmbYeRjUbMBZzT206bJdDJbLOus1hCHtRMZQIEjqVVlreYLEK7RDLGR3/psHF
	ZZz00u0V5xqaDQeZ5xtziPDrt9rfdghcj+2M8g9Fx/vo3vxzf2LUYRqzz9OgHAdDlJ/aEb7vd1Z
	ZgOEeMBqZ9ETeb4CCW3627WSQzyB7y7aTTZ8RGi4mrEsuxtIIrqqu6ExqenKXajEA7wCsFq58cL
	ZZYde3AvY6RW4pyIrzLAIa/dVXTbW9US3/FasH0O9glDx13/JPUg==
X-Received: by 2002:a05:6808:f8f:b0:45e:a4c0:93b1 with SMTP id 5614622812f47-4639f191ab1mr5893058b6e.31.1771277548016;
        Mon, 16 Feb 2026 13:32:28 -0800 (PST)
Received: from freyr.tailscale.baylibre.com ([2600:8803:e7e4:500:2d75:8cf2:6289:6a96])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b0ccfe6sm10857151b6e.20.2026.02.16.13.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 13:32:27 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: linux-gpio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>
Subject: [libgpiod][PATCH] dbus/data: use prefix in gpio-manager.service
Date: Mon, 16 Feb 2026 15:32:21 -0600
Message-ID: <20260216213223.984050-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31730-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,configure.ac:url,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 6BB32147BD4
X-Rspamd-Action: no action

Change the gpio-manager.service file to gpio-manager.service.in template
and use @prefix@ in the ExecStart line. This way, when `make install` is
used to install the service file, it points to the same path where the
binary is actually installed.

Closes: https://github.com/brgl/libgpiod/issues/173
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 configure.ac                                                | 1 +
 dbus/data/.gitignore                                        | 4 ++++
 dbus/data/{gpio-manager.service => gpio-manager.service.in} | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 dbus/data/.gitignore
 rename dbus/data/{gpio-manager.service => gpio-manager.service.in} (96%)

diff --git a/configure.ac b/configure.ac
index ffa712e..61a010f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -325,6 +325,7 @@ if test "x$with_systemd" = xtrue
 then
 	PKG_CHECK_VAR([systemdsystemunitdir], [systemd], [systemdsystemunitdir], [],
 		      AC_MSG_ERROR([systemdsystemunitdir not found - needed to enable systemd support]))
+	AC_CONFIG_FILES([dbus/data/gpio-manager.service])
 fi
 
 if test "x$cross_compiling" = xno
diff --git a/dbus/data/.gitignore b/dbus/data/.gitignore
new file mode 100644
index 0000000..94e73a8
--- /dev/null
+++ b/dbus/data/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2026 David Lechner <dlechner@baylibre.com>
+
+gpio-manager.service
diff --git a/dbus/data/gpio-manager.service b/dbus/data/gpio-manager.service.in
similarity index 96%
rename from dbus/data/gpio-manager.service
rename to dbus/data/gpio-manager.service.in
index f93a6fa..f4270e1 100644
--- a/dbus/data/gpio-manager.service
+++ b/dbus/data/gpio-manager.service.in
@@ -7,7 +7,7 @@ Description=Centralized GPIO manager daemon
 [Service]
 Type=dbus
 BusName=io.gpiod1
-ExecStart=/usr/bin/gpio-manager
+ExecStart=@prefix@/bin/gpio-manager
 Restart=always
 User=gpio-manager
 
-- 
2.43.0


