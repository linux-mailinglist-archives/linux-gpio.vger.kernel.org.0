Return-Path: <linux-gpio+bounces-13109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC89D286B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB50D1F22D7F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A301CF7BF;
	Tue, 19 Nov 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3GQ/aO3B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FCD1CEAC4
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027373; cv=none; b=GAbmzwEhT/dLGGSqEpH4hFqmXKKC9zUFLVWuc4Ef2duKoMQWqd/95GUaYc6YnloAPcZq3VjcLDPLfIR0/6/PlLn3Nwlb8aCncRYf5rwP9lEwRM7wQ0okFppNmzV7w489Cr50Sc8TD6eSd1EdGzk+prClwCSSH5Pt2Gk2JkN8WyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027373; c=relaxed/simple;
	bh=oiBa7HsYQ6s9Puk3XXSlELPUrDSV0T9OEwklqGP054M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSRGLoplUufH0+rm0Czv7awWm4n8wQsIrHNQX7FPmzPyGTxL+gThNoAy9cnJ73zK3Hl0Tm1iF4T/rakmW315bGAyfQm7pLxdBQIy67Yk+HFGIUqPuuMrytO7OkeQ3m0nLiFoz0oPfaDVLBenQz1jRN8DXexiYE03iv4BOwu72m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3GQ/aO3B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43163667f0eso28867875e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732027370; x=1732632170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPJWl3h3xYoBGJ32Gk1qsvmXE1Xz8Xbv4wnoXTCgRbA=;
        b=3GQ/aO3BpsKZxW20e0xFuo8CafU7YqgK95Uhr0y+N4t30hkeaUcmy/aAUyTNvfyMRY
         nQdLEZVjtBuo2g+n/TZ3MWZsDNHrDntILc2sKc6OVWUbcIuXbHnNkE+J51Qy8mmsQJkd
         hA00CJWsLw/pub94lKPjJDCfutTF5HBAawvU3Qvtf076qoTQ45hFPUPLB82/sm9y2rn9
         o3gVaqPVxsdJbbuy5kQXm73CGa4Z/Zowo31Yn6f5kUjCJpIT6dHpSVZ4rmJsHDMNWxnH
         hCBo+xIp4yQddM0hpml1s0UcqmT0cb8MOhyKb/2uzS1yetkGnWq6IoBgGNABcYajh2ty
         FLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027370; x=1732632170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPJWl3h3xYoBGJ32Gk1qsvmXE1Xz8Xbv4wnoXTCgRbA=;
        b=urFr3RCicsoqH0s6AwkbXyeu+NYcRN0hXd1ilhtiHIbo4deEARPH4A4ir4fEMRyUFq
         hGtCT90WqxCNZUDBO8BfJQe4b3v69XHRqaGdmqnH5fjSgzfnSvqxBIEchCnA613mISse
         ZfuQ0dbZU97M7a//tfLytFpEl3igBhFBK1VDr6URCgB4+SGLyrODWg1vPpsa3aa0+aTH
         bbgQSWQGnZZHcHATy9PDte02S9qBtaJpHzDYYmcHRKk3rdirsArgXz4Su0RiLpXi2cfw
         t7yxQezsDmT3q8guSKAUthd4my+WiIQlRcaW3lvkBCOP/oiPNe/UNxPCoDHHVxs/T5x7
         /keA==
X-Gm-Message-State: AOJu0YxTMK28/dcyEFfcwMvRcXeh19C1N/S29EXeN5vBXa+IDKbxDCOa
	dn3qDujeva6naBydXxVfe+wH0aCOxCF5LCpWVrhTz0K7mRq6q7Mu5UsNGjOki1I=
X-Google-Smtp-Source: AGHT+IF0skJnzrFGdSGg9iEhC26wmE+D7tbmbKzvgFib6hpq0LygaQEmfkwnnXY8RFAlXU4K8bby1A==
X-Received: by 2002:a05:600c:1f96:b0:431:58c4:2eb9 with SMTP id 5b1f17b1804b1-432df71b177mr156846855e9.3.1732027369843;
        Tue, 19 Nov 2024 06:42:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ced5:6c04:b538:be0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac21b24sm193681975e9.40.2024.11.19.06.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 06:42:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: tests: replace LooseVersion with packaging.version.Version
Date: Tue, 19 Nov 2024 15:42:42 +0100
Message-ID: <20241119144242.118764-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Distutils are deprecated. Use the Version class from packaging.version
instead of LooseVersion from distutils.version.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/__init__.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
index a0f22ae..d6275bb 100644
--- a/bindings/python/tests/__init__.py
+++ b/bindings/python/tests/__init__.py
@@ -2,10 +2,11 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 import os
-from distutils.version import LooseVersion
 
-required_kernel_version = LooseVersion("5.19.0")
-current_version = LooseVersion(os.uname().release.split("-")[0])
+from packaging.version import Version
+
+required_kernel_version = Version("5.19.0")
+current_version = Version(os.uname().release.split("-")[0])
 
 if current_version < required_kernel_version:
     raise NotImplementedError(
-- 
2.45.2


