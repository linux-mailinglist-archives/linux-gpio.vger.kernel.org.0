Return-Path: <linux-gpio+bounces-14995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3094A18B0A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 05:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F9A16B847
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 04:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9997A158862;
	Wed, 22 Jan 2025 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MdpH8Tfi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA216D9C2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 04:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737520431; cv=none; b=rDpAeh2LMQ4DJqUT9gZi8bt5zOkZSR0uPrINJQshK9U6I+htOf6QZ7P07GwQcqwPCjeoiewhNUNFqjSNmfGP5jtVY0IdNozK/HfGhbJaAMUq4SayNw17soPI4KWAhFMDv6GqWczcMnWmkiCWwAm9cKTGhvdnLrJovu4ouVG05AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737520431; c=relaxed/simple;
	bh=MPtY8/DkGj4h4Oy1/raEGigIvH3lypC3H+R5+Wj8+68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiEOmdlnbAcqB9DGrTUYRzPkKtmnVsq0pFK+/e4Od2IGL9M4sPlPOb+KVZ+PS1FtdJKf2R26WWMaZLFrVjwNC9YVj1BW1j8eX9VPjI3OYs7QkpJW/EkEHWgn0awm5hV+ZG8YpWGpiUnJjD+7+AbsfpI8Gsm5kDka8v8XHjO0TJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=MdpH8Tfi; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 953343F220
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 04:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1737520419;
	bh=cs63la4N9UtLMiIbo6Y9AvTc8Y05/sJt8ipqnwTbejI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=MdpH8TfiLjOyhKwEg6WdM06TnRy15PfA0MBSpP5XzK22nmXHB9txQN/jD1r2m1G40
	 iyj6iXhdnpcI1Tcj3vwD+rHBiMaAyzubqD19sZB6IDzL/IKEw2dZ5DHk9xo2GYBgu4
	 U8vAkynN6MIOQSDmyZ2Tsex8CRxSex2QJ+xVCTkfqg0SaJK5yoglsb74Uh+AhkjsOY
	 GXnLHtKhx60wt/qynWSrwiFS4eAeIGgXxpp328p73SB6LjNBdtB3+yJghRaAJWuSeA
	 AJGk+ofgiS73JDdYt3dRVFETxF9S+48WyCPAXTvAUt4soQA1Ho3h5AaIRoagLR6+cm
	 3mtmwVfFhGpfg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so118286475ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 20:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737520418; x=1738125218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cs63la4N9UtLMiIbo6Y9AvTc8Y05/sJt8ipqnwTbejI=;
        b=fVnmkfqNBMpbWx3Zdj+AjvEPnwshAPvAe+vA2bnaRTO7fiIhiAW8S6zfgHZ/ikU8BZ
         MQA+QfQhiHAN8yGxMbKPjOrE2qdVl2fkd1zukJvmSkfW6OfvFVNc39eX/ljtGdfuYp5V
         NZ9NNETfQPy65Ioe+krwACadgLjW2w6Unv8pcDqOKlXnzhGXea6TJucjh2+uDYnN5e/N
         2RLWCSoYbN9OXiVpDHqgtSZgpJ1o1xEa6Rf+eQ62ls8fi0YmWN1DS5ulrlWOQEIp+4AH
         SGm0zxrRN/q6w9pdTu4cygCoR1AI7n2taFOFK9wM9c5iSudnVkkaZp1bFWwIk3eyz6db
         gwCw==
X-Forwarded-Encrypted: i=1; AJvYcCVDo6XW6T7iH4nT7WYpE6rJpVyrs/PysB2r5g0NQkVCRf5btEDe0qMkeP/j6DcQ09JJlJkzhSDTPlkR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr6QhdH1o6Z2wxKkgyiBYGG1FLIWxXsH2OGoDo1kV5iDfxZv3c
	Kfw91vFP6AR8H/Yv8hrDbVfAZxhGiWvNr1tQzpmqM7pH75AjJ3i/mAEffnzCcwip2/k6mh1RB1z
	n3uWlMaG7736xwknVjksG6mDf3yRF00rXYeBKlNc77AX8xZrsTYWTnwB3GMGbXNOR1zxbwpv0Y6
	Q=
X-Gm-Gg: ASbGncsQAnET5FMdGKCioPBHydAr8qJSvX2tKTd5ZEkgi8CQ9p9rljMQWdhw5cHzwqE
	GxVi8nM0rxGW7uErT4sxLvuVj29gvkPhcoKru7C1GVzXqame21IGEKgDSGs6DqtHy6OV+9sZxXq
	VQpE0viJPpalVjayLPW62N4UWZbqnwGg7JcL46H0EDN2JUaEQBbxsGEtqoiamzcGN+vzgF46p2k
	oGrE1fiHi2JJJBixy/UNoTwQ3KgWV+A3Sl2mi25lchFq6ncIpj2TuIWI54MH3sR3jvtYQ5IU+jA
	mnhQ8Rz2nxTk
X-Received: by 2002:a17:903:124e:b0:215:83e1:99ff with SMTP id d9443c01a7336-21c355521c3mr268012875ad.27.1737520417929;
        Tue, 21 Jan 2025 20:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoZqw73h/OD02NsSO4OdRgAS/rC31kUMC28hMXe6VP4+hvqirzPVPjfZUb9pB10TkME816TA==
X-Received: by 2002:a17:903:124e:b0:215:83e1:99ff with SMTP id d9443c01a7336-21c355521c3mr268012545ad.27.1737520417397;
        Tue, 21 Jan 2025 20:33:37 -0800 (PST)
Received: from localhost.localdomain ([240f:74:7be:1:fb61:6b2a:19fc:e745])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e90aesm86861615ad.198.2025.01.21.20.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 20:33:37 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-kselftest@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: bamv2005@gmail.com,
	shuah@kernel.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: gpio: gpio-sim: Fix missing chip disablements
Date: Wed, 22 Jan 2025 13:33:09 +0900
Message-ID: <20250122043309.304621-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since upstream commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on"), rmdir for an active virtual devices
been prohibited.

Update gpio-sim selftest to align with the change.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202501221006.a1ca5dfa-lkp@intel.com
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 tools/testing/selftests/gpio/gpio-sim.sh | 31 +++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/selftests/gpio/gpio-sim.sh
index 6fb66a687f17..bbc29ed9c60a 100755
--- a/tools/testing/selftests/gpio/gpio-sim.sh
+++ b/tools/testing/selftests/gpio/gpio-sim.sh
@@ -46,12 +46,6 @@ remove_chip() {
 	rmdir $CONFIGFS_DIR/$CHIP || fail "Unable to remove the chip"
 }
 
-configfs_cleanup() {
-	for CHIP in `ls $CONFIGFS_DIR/`; do
-		remove_chip $CHIP
-	done
-}
-
 create_chip() {
 	local CHIP=$1
 
@@ -105,6 +99,13 @@ disable_chip() {
 	echo 0 > $CONFIGFS_DIR/$CHIP/live || fail "Unable to disable the chip"
 }
 
+configfs_cleanup() {
+	for CHIP in `ls $CONFIGFS_DIR/`; do
+		disable_chip $CHIP
+		remove_chip $CHIP
+	done
+}
+
 configfs_chip_name() {
 	local CHIP=$1
 	local BANK=$2
@@ -181,6 +182,7 @@ create_chip chip
 create_bank chip bank
 enable_chip chip
 test -n `cat $CONFIGFS_DIR/chip/bank/chip_name` || fail "chip_name doesn't work"
+disable_chip chip
 remove_chip chip
 
 echo "1.2. chip_name returns 'none' if the chip is still pending"
@@ -195,6 +197,7 @@ create_chip chip
 create_bank chip bank
 enable_chip chip
 test -n `cat $CONFIGFS_DIR/chip/dev_name` || fail "dev_name doesn't work"
+disable_chip chip
 remove_chip chip
 
 echo "2. Creating and configuring simulated chips"
@@ -204,6 +207,7 @@ create_chip chip
 create_bank chip bank
 enable_chip chip
 test "`get_chip_num_lines chip bank`" = "1" || fail "default number of lines is not 1"
+disable_chip chip
 remove_chip chip
 
 echo "2.2. Number of lines can be specified"
@@ -212,6 +216,7 @@ create_bank chip bank
 set_num_lines chip bank 16
 enable_chip chip
 test "`get_chip_num_lines chip bank`" = "16" || fail "number of lines is not 16"
+disable_chip chip
 remove_chip chip
 
 echo "2.3. Label can be set"
@@ -220,6 +225,7 @@ create_bank chip bank
 set_label chip bank foobar
 enable_chip chip
 test "`get_chip_label chip bank`" = "foobar" || fail "label is incorrect"
+disable_chip chip
 remove_chip chip
 
 echo "2.4. Label can be left empty"
@@ -227,6 +233,7 @@ create_chip chip
 create_bank chip bank
 enable_chip chip
 test -z "`cat $CONFIGFS_DIR/chip/bank/label`" || fail "label is not empty"
+disable_chip chip
 remove_chip chip
 
 echo "2.5. Line names can be configured"
@@ -238,6 +245,7 @@ set_line_name chip bank 2 bar
 enable_chip chip
 test "`get_line_name chip bank 0`" = "foo" || fail "line name is incorrect"
 test "`get_line_name chip bank 2`" = "bar" || fail "line name is incorrect"
+disable_chip chip
 remove_chip chip
 
 echo "2.6. Line config can remain unused if offset is greater than number of lines"
@@ -248,6 +256,7 @@ set_line_name chip bank 5 foobar
 enable_chip chip
 test "`get_line_name chip bank 0`" = "" || fail "line name is incorrect"
 test "`get_line_name chip bank 1`" = "" || fail "line name is incorrect"
+disable_chip chip
 remove_chip chip
 
 echo "2.7. Line configfs directory names are sanitized"
@@ -267,6 +276,7 @@ for CHIP in $CHIPS; do
 	enable_chip $CHIP
 done
 for CHIP in $CHIPS; do
+  disable_chip $CHIP
 	remove_chip $CHIP
 done
 
@@ -278,6 +288,7 @@ echo foobar > $CONFIGFS_DIR/chip/bank/label 2> /dev/null && \
 	fail "Setting label of a live chip should fail"
 echo 8 > $CONFIGFS_DIR/chip/bank/num_lines 2> /dev/null && \
 	fail "Setting number of lines of a live chip should fail"
+disable_chip chip
 remove_chip chip
 
 echo "2.10. Can't create line items when chip is live"
@@ -285,6 +296,7 @@ create_chip chip
 create_bank chip bank
 enable_chip chip
 mkdir $CONFIGFS_DIR/chip/bank/line0 2> /dev/null && fail "Creating line item should fail"
+disable_chip chip
 remove_chip chip
 
 echo "2.11. Probe errors are propagated to user-space"
@@ -316,6 +328,7 @@ mkdir -p $CONFIGFS_DIR/chip/bank/line4/hog
 enable_chip chip
 $BASE_DIR/gpio-mockup-cdev -s 1 /dev/`configfs_chip_name chip bank` 4 2> /dev/null && \
 	fail "Setting the value of a hogged line shouldn't succeed"
+disable_chip chip
 remove_chip chip
 
 echo "3. Controlling simulated chips"
@@ -331,6 +344,7 @@ test "$?" = "1" || fail "pull set incorrectly"
 sysfs_set_pull chip bank 0 pull-down
 $BASE_DIR/gpio-mockup-cdev /dev/`configfs_chip_name chip bank` 1
 test "$?" = "0" || fail "pull set incorrectly"
+disable_chip chip
 remove_chip chip
 
 echo "3.2. Pull can be read from sysfs"
@@ -344,6 +358,7 @@ SYSFS_PATH=/sys/devices/platform/$DEVNAME/$CHIPNAME/sim_gpio0/pull
 test `cat $SYSFS_PATH` = "pull-down" || fail "reading the pull failed"
 sysfs_set_pull chip bank 0 pull-up
 test `cat $SYSFS_PATH` = "pull-up" || fail "reading the pull failed"
+disable_chip chip
 remove_chip chip
 
 echo "3.3. Incorrect input in sysfs is rejected"
@@ -355,6 +370,7 @@ DEVNAME=`configfs_dev_name chip`
 CHIPNAME=`configfs_chip_name chip bank`
 SYSFS_PATH="/sys/devices/platform/$DEVNAME/$CHIPNAME/sim_gpio0/pull"
 echo foobar > $SYSFS_PATH 2> /dev/null && fail "invalid input not detected"
+disable_chip chip
 remove_chip chip
 
 echo "3.4. Can't write to value"
@@ -365,6 +381,7 @@ DEVNAME=`configfs_dev_name chip`
 CHIPNAME=`configfs_chip_name chip bank`
 SYSFS_PATH="/sys/devices/platform/$DEVNAME/$CHIPNAME/sim_gpio0/value"
 echo 1 > $SYSFS_PATH 2> /dev/null && fail "writing to 'value' succeeded unexpectedly"
+disable_chip chip
 remove_chip chip
 
 echo "4. Simulated GPIO chips are functional"
@@ -382,6 +399,7 @@ $BASE_DIR/gpio-mockup-cdev -s 1 /dev/`configfs_chip_name chip bank` 0 &
 sleep 0.1 # FIXME Any better way?
 test `cat $SYSFS_PATH` = "1" || fail "incorrect value read from sysfs"
 kill $!
+disable_chip chip
 remove_chip chip
 
 echo "4.2. Bias settings work correctly"
@@ -394,6 +412,7 @@ CHIPNAME=`configfs_chip_name chip bank`
 SYSFS_PATH="/sys/devices/platform/$DEVNAME/$CHIPNAME/sim_gpio0/value"
 $BASE_DIR/gpio-mockup-cdev -b pull-up /dev/`configfs_chip_name chip bank` 0
 test `cat $SYSFS_PATH` = "1" || fail "bias setting does not work"
+disable_chip chip
 remove_chip chip
 
 echo "GPIO $MODULE test PASS"
-- 
2.45.2


