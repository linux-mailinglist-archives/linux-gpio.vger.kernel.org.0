Return-Path: <linux-gpio+bounces-6156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7C8BD2BD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2027E1C226EE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 16:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DDB156657;
	Mon,  6 May 2024 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X6DZz6yK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC915575A
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012716; cv=none; b=krXzB8O0QT3gn1nPC/SFHy1i0znqThZkBhHPfjW1tfYldh8//vhzTVPvpRzs7SOEUWiWAVxEwDCDmYakexOlUtTDOYw+xfN7GOw3uyZyg6tpGbueyRZFb7S/o+HWzRYxBNmRGWK2uyfMVvA3dN2AkdZnM/aBFBIwFtuYqymnvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012716; c=relaxed/simple;
	bh=+ecDTxC6zl5De9WPHdEQDdHOQcjhZOTbbXuKy/CJoJc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A9ExwgsigSGhCaAjjFVMQ7kAmKoDhs4ZakdqdLC5YZBaDNtIpqh3bObNXvUW15cwIdxuBAXdMi4PgdVURGB+d2kUBc1IwTlQcG5ZuF74rU03HTsbsHFq3X82ifqU8kPMVuRk7nCZrb8Y+NkA61N34D6Ls7Zny4f0vtVc2kDVWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X6DZz6yK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41bca450fa3so13069605e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715012712; x=1715617512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF2Vi7zRASToS4K2Wyv3k3eXsAcfdfOypn7+axqv6bg=;
        b=X6DZz6yK8YKxf2HGqPCn+sF/wKpmpbsvEPLvNDwvITiuUsXvpOPsVd3LjGIbACJzSq
         32S/mYB1WhYbhBwbY8nSD3sLLB1DTAPLuSBX1E6K828BZgyisBGo5XY4fMuiKfmpQofK
         ZNmKn8RN0CFM/ZwD7mofTDRjequMZgF1RjDCnn1mRsR+dWRlHQBGXef2YBerOU3EWb3n
         GF/sOH4Sgt38y13HPOqvKLziFCB+92oCqmTWO7O2iPaRrjb82k2IqEVakVZQB6fGH42/
         ozNu5n2JuAVcSCvevFGnDxSw+Kqvloo+A/qAPPyJ0D2VlPuaqTnwwPdsNVfMvqtWLbA4
         lOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715012712; x=1715617512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF2Vi7zRASToS4K2Wyv3k3eXsAcfdfOypn7+axqv6bg=;
        b=li13SQuavyJYFHev/Yob+CmeXv1ni9MBRGIMtE3imZlPFMjVxK+01xb2HwXqfuLGdC
         5iSdp//TriBlaXC3jhs+rZiZHCxsGJ5/ylabyEoYWv0UylPkQJu5aHroPwvxIByTa12F
         it9Tl68n5i+eVBWH21PtkJsQXxJgmY5dO5ashnBqHoeal6MswP9joUW9nqh5rU1Su4jG
         mRlwnfwiql78s/NBhPnFwBOBqDMTazpYvnV9tagesN3u+nH9nTEeVx+sBcDV0cfZrTbq
         uAC9bHjoXN8wminxov/AI7YKw1+1cWqTB4RSFhYNlRQmvjYOU7YWS35uYyjPNgydWMbd
         ffAw==
X-Gm-Message-State: AOJu0YzksIIKtZQHZ/vMRRBkazoMULcCZnX66A57AQ/MUhc2LzgJAB+D
	8o2At+F4WAKhOlnUu5CSPsLF+hlifcPnH59VL8hWyrulittz3I7YlEg5oa7E6Dw=
X-Google-Smtp-Source: AGHT+IE1qbAScllsRJH8MxLBDLapFGeR2ZP2aNbcIMrJf+pzKjDAxusKvSUdawjfEM5lOwnpDvB35g==
X-Received: by 2002:a05:600c:8506:b0:41c:11b:b36e with SMTP id gw6-20020a05600c850600b0041c011bb36emr8178524wmb.16.1715012712277;
        Mon, 06 May 2024 09:25:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:273f:28c1:d72a:96a])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c1c0300b004186f979543sm20479542wms.33.2024.05.06.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 09:25:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: tests: accept the new gpio-sim label format in test cases
Date: Mon,  6 May 2024 18:25:06 +0200
Message-Id: <20240506162506.176935-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since kernel commit 840a97e2fbaf ("gpio: sim: delimit the fwnode name
with a ":" when generating labels") the gpio-sim automatic labels are
generated by delimiting the device name and the fwnode name with ':'
instead of '-' for better readability. This will break the tests once
linux v6.9 is out. Act in advance and accept both forms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 5ef4ef6..b55c5eb 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -304,9 +304,9 @@ test_gpiodetect_all_chips() {
 
 	run_tool gpiodetect
 
-	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
-	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
-	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	status_is 0
 
 	# ignoring symlinks
@@ -334,21 +334,21 @@ test_gpiodetect_a_chip() {
 	# by name
 	run_tool gpiodetect $sim0
 
-	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by path
 	run_tool gpiodetect ${GPIOSIM_CHIP_PATH[sim1]}
 
-	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by number
 	run_tool gpiodetect $(gpiosim_chip_number sim2)
 
-	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
 	status_is 0
 
@@ -356,7 +356,7 @@ test_gpiodetect_a_chip() {
 	gpiosim_chip_symlink sim2 .
 	run_tool gpiodetect $GPIOSIM_CHIP_LINK
 
-	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
 	status_is 0
 }
@@ -375,9 +375,9 @@ test_gpiodetect_multiple_chips() {
 
 	run_tool gpiodetect $sim0 $sim1 $sim2
 
-	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
-	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
-	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 3
 	status_is 0
 }
-- 
2.40.1


