Return-Path: <linux-gpio+bounces-28493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6EC5D5AB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069A23B7CD7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A5E316182;
	Fri, 14 Nov 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YxNBG5/a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2E215F42
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127003; cv=none; b=aZ1sfLmnJtiCsBYYkdhIlKCULx8L9wFG7+wbNcEqQPKDHXcc6roea9uNRQjZBh7ECAvZRHQGMPvdhIfucARR7CmHTzitsbgnBJMaRHAIwe7f/eY3kPdsI3aD/3oA0fYm8C+ecKT8koZ0uGmcUASsSg2a2GoNST6Gc2eDvFZrz8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127003; c=relaxed/simple;
	bh=Y1IvkL6CGMMu4H6T5XudMk3Hk56gDwx/nP6+8ka4w/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epwwxBzE4DZ8c+1p33x24KE7YXa4wpS5YYNnV3OQ3hH3zU7xLCeChKVni+LF7VAuct5UlMSHmOjqeFfgiKzAJCsbaOzMfBFTXcufMO/KkB0IHm0IoXwNnd5XLlIDAODrecIppwK+4zK1ab0QDs7tTmpe+qXeYt1t0nzSB7torgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YxNBG5/a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1165918f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 05:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763127000; x=1763731800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVZW+zsgpFYHvEazeWBX40ma7At/VrFq8uK2QoqE/ms=;
        b=YxNBG5/aeysnvZX/ltrCTtAhDiu6XhQAZiR3x1QbG8Ex92wOIKkDzbjzvNG+chT1lX
         3vxMnEzDplTW1zrzH5geTecbrpXZD910VAchmPcuNebMGYg4d3JOFa/LsN21aEWuV5Jb
         8VgMPw05VCdFXb39ebK3+mRYoTjOPPnYE6Waui38xKjv3VGCdAvzOMYug75kTVt/s9gm
         sL3LWz3sd9fHdHPMgK7pK7YdFnvEloGwkpGjjSXSjIQZe9nSatjksQnssDwBU/CCK/T0
         i/hEQYgqWRlh/TiTcVCCswpDkLi15XF02LeKU3anCJjstNOY0ux8M/mwq56/36V9qWPh
         tAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127000; x=1763731800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVZW+zsgpFYHvEazeWBX40ma7At/VrFq8uK2QoqE/ms=;
        b=jKaVh2kwqXC/s/e21NuUwgoiQRh12e9kyOkyfn1wxE1XmkQOHR97KEGdDOrW5LVM7a
         fWX5dpQRMjU78ffnklKxYM3m8lCZpY2JPGJkOjnD/cDsLVPFS3nAzYsS6Vlv5UAgDxml
         S3+WtUAIrb6f2X3yU8z4VSElHPQ+4zCObeqAfCvot3nZyAIcgm2X7tsCl3xfLzPjl89X
         R65dT+qCiXhGwCi52WhL+IPIUOW7/t2l3pgRDNIzRITvVllqWGFFWfXmDbgXNw1rQuTi
         y9HEdgHqEkjApwUvbJq+v/f86hN0nmiK7/wZ12FZhH3eL/WdLov1tNHZ5w5EOGvzdTgc
         dNvw==
X-Gm-Message-State: AOJu0YzmeemOaOjR+eL+zz9Ax7kINmake96RoSjHPUiAfB82U3kqz5wL
	w7gZ4e/4U6teLS68mqbbD45wIjKm4ZhKrp8ZemijhKxvf0MeObBq8jtYtLPk0GeoKNo=
X-Gm-Gg: ASbGnctZFqrafEgtVVCLaWVaQPYkygv+4pHi84AdKAi1lLi+zJSbhZjInhUbu9ZsdjO
	yB8QHT7+k5mf/qKG/KasPCE685kDVzvp0u/1MVNdx0TNZj3M7gyj5Ob0MeyLMHeEgCd4v9iFucE
	2VEjPewE0gZjpoLS3Fh/OTTyXJ+PxQBuJPf6Sa4PFPUMN2hAO+F0fJGaQ9f9hLIfZ4jBTnc8X6e
	R5lfZs2arIZ8mQUChiexho3E4Oie/GtN3n/AquMlVoE4YCXONs14SfLujL54lbnYcfp24pEG9sE
	4uQGtMNBubVb5gdMRp4WkhGtN6uoY10pabCcN+PSl4kpYHxglekx8B/jkxg4nDnwoCGHubePtrK
	hNKoUxn2p+lUrYLiwlvvUo0cUiNhQhGHx9ofm986kEH8yFTiDZMFhxOM7YXbv2LE+F2uSB9d/I4
	/9AausXUabLjwD+JA=
X-Google-Smtp-Source: AGHT+IHef9QY6Uc/HlhwSo5SzpG9TyTL1TGekaGGBeQUPHgm0HE4tinJLztkxK8GieVoyB9zyHjs/A==
X-Received: by 2002:a05:6000:2210:b0:42b:394a:9de with SMTP id ffacd0b85a97d-42b595adf93mr2770098f8f.49.1763126999833;
        Fri, 14 Nov 2025 05:29:59 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:326d:9344:48bd:e2fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e845bdsm9592980f8f.12.2025.11.14.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:29:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH libgpiod] dbus: manager: don't try to export the same chip twice
Date: Fri, 14 Nov 2025 14:29:57 +0100
Message-ID: <20251114132957.33750-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's possible to get a second bind event from udevd (for instance:
manually triggered with `udevadm trigger -c bind`) on the same GPIO
chip so it already existing in the hashmap may actually happen unlike
what the comment in daemon.c states. We must not try to export the same
chip twice as it will crash the gpio-manager on the subsequent
assertion.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Reported-by: Sverdlin, Alexander <alexander.sverdlin@siemens.com>
Closes: https://github.com/brgl/libgpiod/issues/161
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/manager/daemon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
index 8e1de8a..4627e8c 100644
--- a/dbus/manager/daemon.c
+++ b/dbus/manager/daemon.c
@@ -688,6 +688,12 @@ static void gpiodbus_daemon_export_chip(GpiodbusDaemon *self, GUdevDevice *dev)
 	gboolean ret;
 
 	devname = g_udev_device_get_name(dev);
+
+	if (g_hash_table_contains(self->chips, devname)) {
+		g_debug("chip %s is already exported", devname);
+		return;
+	}
+
 	devpath = g_udev_device_get_device_file(dev);
 	obj_prefix = g_dbus_object_manager_get_object_path(
 				G_DBUS_OBJECT_MANAGER(self->chip_manager));
@@ -740,7 +746,6 @@ static void gpiodbus_daemon_export_chip(GpiodbusDaemon *self, GUdevDevice *dev)
 
 	ret = g_hash_table_insert(self->chips, g_strdup(devname),
 				  g_steal_pointer(&chip_data));
-	/* It's a programming bug if the chip is already in the hashmap. */
 	g_assert(ret);
 }
 
-- 
2.51.0


