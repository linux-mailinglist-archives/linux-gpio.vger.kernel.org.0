Return-Path: <linux-gpio+bounces-12312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8B9B6986
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CF0B1F222CD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52A4215012;
	Wed, 30 Oct 2024 16:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/FmFIfk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DF2144A4
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306974; cv=none; b=NucMNh18TtKoqdsqwLpfJmiVBjHj3AhaoKuKfEswojiglbuM7G9A4oqXXDcSe8nKv4lCY116I0vU/kKgyjOjuzsrhMm3uoAhhVwC1SHjfdNJtoFSO/R/Jmtmdl7vsQyUQ+Cbf280iRXXB11Lkbmr0j3J9jYplhkuBvSRRpeYucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306974; c=relaxed/simple;
	bh=8jQFo69VBlGTDc+YMPtCkLby0c84xib07X9ivFIomXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rdev0W2KpQF5QoD8AG9vH8nTT67rMALXv4ihmw2CwcCon5FzaU5DYNTw61C2u4Ds8S8GHEoqZHtvn5/TSMgSweaTDvyjTa7F+lq+OEkAyUreQoQ1IVT6bJU3C5UvC7NN6WMqYzza7u5KeAd0PPduvs8/MY/dhpxtxUN18fDXd1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/FmFIfk; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a3a4fac259so33585ab.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730306971; x=1730911771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUIicwNTG/4sfDeDKkYodlYco68hhBknyOhi/EbY298=;
        b=F/FmFIfkF3f5uSGBvXW67cnZnik4WzstU4Q5VtrVvoAlGR2O9WR9un+zZZFyAL+9Vm
         R+MlLMqzJU4ontQ6MbXtl6GWHRVIeen6Jax0p2GDbXjth8MKwZ+lpYs6Q2r6a5ppujt4
         e47VrM2y59ANsHkgp/hy2z0CYdPbmS8ULPCRc/OwHHrbEmuBW037OSMttAoztMK75y6f
         d3TBm8i3NrRA8yJm7QhlAh30/Q3YUbpLe21oYweo8SqtFeuxc+ti8hnBKqQdagUZVOfj
         6EE7JUPgqg07EcSyydhxhVccguUwevvE4UtBjySH9c2n+UyEaSQkxgwL2NsisCmjC1cT
         QzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306971; x=1730911771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUIicwNTG/4sfDeDKkYodlYco68hhBknyOhi/EbY298=;
        b=nEIUXula3MhiiSYSlHJzyYH6Bmlm6eKCgjRhTaqhBF0olLesOU7SS0siTqaYUrf2RI
         b+OPud3vJufWCvSccg9bSkyB/n02kE2pCPtJZWpbNUtMCMlLPqcUvjuvNLLN7Ptik5V/
         NopHQ5xlHmII3Jk0ORQyVIFT5Eew4gRr27CR/xc2IAgPt7j2JBiVBKpspwkpDOLfnVzu
         plfRiz0ps8agIg3rG6cDd2MR6wFjUXIyW88QlQWaWEnQWO+Fz21MUs7BAXlWL2VFLe/F
         Mkx4yvtaB9uJX4T4DGrSIK6GrEZ48Y+hzLOezZCvYLBBGs6E7IBPcRYnyvbPMKF2XsKr
         Z4hw==
X-Gm-Message-State: AOJu0Yw73swwA93s+XZjOYEkK/lYMiquw5wcnzZvAYgMZyGGo4clevWJ
	UDdEtIDzKGazqpDeYIIfAn8t0MOhMerSOEvpQdwVKRtgJrNYzIayEZdqxV9X
X-Google-Smtp-Source: AGHT+IHb2utuTxlHz8C0CvjRR7eowF+JO9I+GuUuOYCAKEE0aKRjyFByc2APmMSQDYsVL6OED37l6w==
X-Received: by 2002:a05:6e02:2196:b0:3a1:a163:ba6b with SMTP id e9e14a558f8ab-3a4ed311a2cmr36803415ab.7.1730306971534;
        Wed, 30 Oct 2024 09:49:31 -0700 (PDT)
Received: from wslxew228.. (p200300c78705c3002dd64bc4281b95e2.dip0.t-ipconnect.de. [2003:c7:8705:c300:2dd6:4bc4:281b:95e2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72751298sm2947472173.91.2024.10.30.09.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:49:31 -0700 (PDT)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
To: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Boerge Struempfel <bstruempfel@ultratronik.de>,
	Boerge Struempfel <boerge.struempfel@gmail.com>
Subject: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
Date: Wed, 30 Oct 2024 17:49:24 +0100
Message-ID: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When crosscompiling, the linker isn't finding libpgiod.so while linking
the manager to libgpiod-glib.so.

In order to fix this issue, we manually force the linker to look in
the corresponding folder for needed shared libraries, when building the
manager.

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
---
 dbus/manager/Makefile.am | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
index d1cef8e..32c9e30 100644
--- a/dbus/manager/Makefile.am
+++ b/dbus/manager/Makefile.am
@@ -9,6 +9,7 @@ AM_CFLAGS += -DG_LOG_DOMAIN=\"gpio-manager\"
 AM_CFLAGS += $(PROFILING_CFLAGS)
 AM_LDFLAGS = $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIBS)
 AM_LDFLAGS += $(PROFILING_LDFLAGS)
+AM_LDFLAGS += -Wl,-rpath,$(top_builddir)/lib/.libs
 LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
 LDADD += $(top_builddir)/dbus/lib/libgpiodbus.la
 
-- 
2.43.0


