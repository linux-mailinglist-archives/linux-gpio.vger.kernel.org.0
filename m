Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA70414429
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 10:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhIVItm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 04:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbhIVItg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 04:49:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAA4C0613E2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:48:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u15so4498172wru.6
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMwKeDx1xIluS3Y035lgALsVGvJn3c2xJ25VMV8QOGs=;
        b=yicxBzu0JpD6+tlZQev2RSNkxpJTmT4k1cu6RBOP4i6aUD3NpcGY6A08sZeIivhehr
         IZyaytALM5RfBvrd3uHXn8hFgdhzDOl3vIzuF0oaL4driHJ+gzlR/a6HRb8qxkJe/XyI
         YaonuicHeraQT9zNmU9M3wz6EjmyCYGGVJNp2O92ngdKAgmY0kxDpTZL2oPiSPa2Uqae
         VaJMRCCGo3F7iYPHTiByg92ShL2/2dT1LvdjpJaLeeJcMSam0KyqJP2jWdxcGLbyBL7M
         j/EBf2WLYHdN7xZjnmgWqCHBwfGL5SDNtNn0s2JvSLigviKAsTPUkGawsq9TCYB2e8oD
         +5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMwKeDx1xIluS3Y035lgALsVGvJn3c2xJ25VMV8QOGs=;
        b=5iNNlcXaQqRenGI0G0J5K/z1k1IDta/uTu0lXqQMiPG4An2lFAiBBVmshdUG6xSkIz
         5KMt3oHtfRH3gYllywFMr2cJFtxW6VW4yg4FzyTK3wNcbKOEKWv9X/2RsORjWb+WD/e0
         TKfPKnlhcWUa2ybcbVSbaGGTdAxbUMCAspNcepIL8xQwuH0smmCS9V3OF1fqI0637nj/
         hihT7LQiDnM8MqH4U1WHcMqboP++8XdeDSXhaI2IhBeKEI2b+8jF7Gn5Fu1cWopkau+I
         rKrhfOJQWrPWpgMdSUnCnaVvDjMNGW1+RbwQ4UjjQt5nXNxMeXMuNanaiLBVcM+TesSK
         VPlQ==
X-Gm-Message-State: AOAM532K6NwbNH5WVTPIyp0hm6tpJWU2aeiakMbhhBQKfvBahFu4yYO1
        3S2zdx6WVk8ybWAomOveE10w8Q==
X-Google-Smtp-Source: ABdhPJxQO4T8R62NXcaNo8SVPdFD+YxglGIiwnS+w6X59LCePTPaMeR3PoxsctSuxtDscBBtZHJrfg==
X-Received: by 2002:a05:6000:160c:: with SMTP id u12mr40520241wrb.128.1632300481698;
        Wed, 22 Sep 2021 01:48:01 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:48:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 8/8] selftests: gpio: add test cases for gpio-sim
Date:   Wed, 22 Sep 2021 10:47:33 +0200
Message-Id: <20210922084733.5547-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a set of tests for the new gpio-sim module. This is a pure shell
test-suite and uses the helper programs available in the gpio selftests
directory. These test-cases only test the functionalities exposed by the
gpio-sim driver, not those handled by core gpiolib code.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tools/testing/selftests/gpio/Makefile    |   2 +-
 tools/testing/selftests/gpio/config      |   1 +
 tools/testing/selftests/gpio/gpio-sim.sh | 229 +++++++++++++++++++++++
 3 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/gpio/gpio-sim.sh

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index d7d8f1985d99..4c6df61c76a8 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-TEST_PROGS := gpio-mockup.sh
+TEST_PROGS := gpio-mockup.sh gpio-sim.sh
 TEST_FILES := gpio-mockup-sysfs.sh
 TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
 
diff --git a/tools/testing/selftests/gpio/config b/tools/testing/selftests/gpio/config
index ce100342c20b..409a8532facc 100644
--- a/tools/testing/selftests/gpio/config
+++ b/tools/testing/selftests/gpio/config
@@ -1,3 +1,4 @@
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_CDEV=y
 CONFIG_GPIO_MOCKUP=m
+CONFIG_GPIO_SIM=m
diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/selftests/gpio/gpio-sim.sh
new file mode 100755
index 000000000000..fcca6ec611f8
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-sim.sh
@@ -0,0 +1,229 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+BASE_DIR=`dirname $0`
+CONFIGFS_DIR="/sys/kernel/config/gpio-sim"
+PENDING_DIR=$CONFIGFS_DIR/pending
+LIVE_DIR=$CONFIGFS_DIR/live
+MODULE="gpio-sim"
+
+fail() {
+	echo "$*" >&2
+	echo "GPIO $MODULE test FAIL"
+	exit 1
+}
+
+skip() {
+	echo "$*" >&2
+	echo "GPIO $MODULE test SKIP"
+	exit 4
+}
+
+configfs_cleanup() {
+	for DIR in `ls $LIVE_DIR`; do
+		mv $LIVE_DIR/$DIR $PENDING_DIR
+	done
+
+	for DIR in `ls $PENDING_DIR`; do
+		rmdir $PENDING_DIR/$DIR
+	done
+}
+
+create_pending_chip() {
+	local NAME="$1"
+	local LABEL="$2"
+	local NUM_LINES="$3"
+	local LINE_NAMES="$4"
+	local CHIP_DIR="$PENDING_DIR/$NAME"
+
+	mkdir $CHIP_DIR
+	test -n "$LABEL" && echo $LABEL > $CHIP_DIR/label
+	test -n "$NUM_LINES" && echo $NUM_LINES > $CHIP_DIR/num_lines
+	if [ -n "$LINE_NAMES" ]; then
+		echo $LINE_NAMES 2> /dev/null > $CHIP_DIR/line_names
+		# This one can fail
+		if [ "$?" -ne "0" ]; then
+			return 1
+		fi
+	fi
+}
+
+create_live_chip() {
+	local CHIP_DIR="$PENDING_DIR/$1"
+
+	create_pending_chip "$@" || fail "unable to create the chip configfs item"
+	mv $CHIP_DIR $LIVE_DIR || fail "unable to commit the chip configfs item"
+}
+
+remove_pending_chip() {
+	local NAME="$1"
+
+	rmdir $PENDING_DIR/$NAME || fail "unable to remove the chip configfs item"
+}
+
+remove_live_chip() {
+	local NAME="$1"
+
+	mv $LIVE_DIR/$NAME $PENDING_DIR || fail "unable to uncommit the chip configfs item"
+	remove_pending_chip "$@"
+}
+
+configfs_chip_name() {
+	local CHIP="$1"
+
+	cat $LIVE_DIR/$CHIP/chip_name 2> /dev/null || return 1
+}
+
+configfs_dev_name() {
+	local CHIP="$1"
+
+	cat $LIVE_DIR/$CHIP/dev_name 2> /dev/null || return 1
+}
+
+get_chip_num_lines() {
+	local CHIP="$1"
+
+	$BASE_DIR/gpio-chip-info /dev/`configfs_chip_name $CHIP` num-lines
+}
+
+get_chip_label() {
+	local CHIP="$1"
+
+	$BASE_DIR/gpio-chip-info /dev/`configfs_chip_name $CHIP` label
+}
+
+get_line_name() {
+	local CHIP="$1"
+	local OFFSET="$2"
+
+	$BASE_DIR/gpio-line-name /dev/`configfs_chip_name $CHIP` $OFFSET
+}
+
+sysfs_set_pull() {
+	local CHIP="$1"
+	local OFFSET="$2"
+	local PULL="$3"
+	local SYSFSPATH="/sys/devices/platform/`configfs_dev_name $CHIP`/line-ctrl/gpio$OFFSET"
+
+	echo $PULL > $SYSFSPATH
+}
+
+# Load the gpio-sim module. This will pull in configfs if needed too.
+modprobe gpio-sim || skip "unable to load the gpio-sim module"
+# Make sure configfs is mounted at /sys/kernel/config. Wait a bit if needed.
+for IDX in `seq 5`; do
+	if [ "$IDX" -eq "5" ]; then
+		skip "configfs not mounted at /sys/kernel/config"
+	fi
+
+	mountpoint -q /sys/kernel/config && break
+	sleep 0.1
+done
+# If the module was already loaded: remove all previous chips
+configfs_cleanup
+
+trap "exit 1" SIGTERM SIGINT
+trap configfs_cleanup EXIT
+
+echo "1. chip_name and dev_name attributes"
+
+echo "1.1. Chip name is communicated to user"
+create_live_chip chip
+test -n `cat $LIVE_DIR/chip/chip_name` || fail "chip_name doesn't work"
+remove_live_chip chip
+
+echo "1.2. chip_name returns 'none' if the chip is still pending"
+create_pending_chip chip
+test "`cat $PENDING_DIR/chip/chip_name`" = "none" || fail "chip_name doesn't return 'none' for a pending chip"
+remove_pending_chip chip
+
+echo "1.3. Device name is communicated to user"
+create_live_chip chip
+test -n `cat $LIVE_DIR/chip/dev_name` || fail "dev_name doesn't work"
+remove_live_chip chip
+
+echo "1.4. dev_name returns 'none' if chip is still pending"
+create_pending_chip chip
+test "`cat $PENDING_DIR/chip/dev_name`" = "none" || fail "dev_name doesn't return 'none' for a pending chip"
+remove_pending_chip chip
+
+echo "2. Creating simulated chips"
+
+echo "2.1. Default number of lines is 1"
+create_live_chip chip
+test "`get_chip_num_lines chip`" = "1" || fail "default number of lines is not 1"
+remove_live_chip chip
+
+echo "2.2. Number of lines can be specified"
+create_live_chip chip test-label 16
+test "`get_chip_num_lines chip`" = "16" || fail "number of lines is not 16"
+remove_live_chip chip
+
+echo "2.3. Label can be set"
+create_live_chip chip foobar
+test "`get_chip_label chip`" = "foobar" || fail "label is incorrect"
+remove_live_chip chip
+
+echo "2.4. Label can be left empty"
+create_live_chip chip
+test -z "`cat $LIVE_DIR/chip/label`" || fail "label is not empty"
+remove_live_chip chip
+
+echo "2.5. Line names can be configured"
+create_live_chip chip test-label 16 '"foo", "", "bar"'
+test "`get_line_name chip 0`" = "foo" || fail "line name is incorrect"
+test "`get_line_name chip 2`" = "bar" || fail "line name is incorrect"
+remove_live_chip chip
+
+echo "2.6. Errors in line names are detected"
+create_pending_chip chip test-label 8 '"foo", bar' && fail "incorrect line name accepted"
+remove_pending_chip chip
+create_pending_chip chip test-label 8 '"foo" "bar"' && fail "incorrect line name accepted"
+remove_pending_chip chip
+
+echo "2.7. Multiple chips can be created"
+create_live_chip chip0
+create_live_chip chip1
+create_live_chip chip2
+remove_live_chip chip0
+remove_live_chip chip1
+remove_live_chip chip2
+
+echo "3. Controlling simulated chips"
+
+echo "3.3. Pull can be set over sysfs"
+create_live_chip chip test-label 8
+sysfs_set_pull chip 0 1
+$BASE_DIR/gpio-mockup-cdev /dev/`configfs_chip_name chip` 0
+test "$?" = "1" || fail "pull set incorrectly"
+sysfs_set_pull chip 0 0
+$BASE_DIR/gpio-mockup-cdev /dev/`configfs_chip_name chip` 1
+test "$?" = "0" || fail "pull set incorrectly"
+remove_live_chip chip
+
+echo "3.4. Incorrect input in sysfs is rejected"
+create_live_chip chip test-label 8
+SYSFS_PATH="/sys/devices/platform/`configfs_dev_name chip`/line-ctrl/gpio0"
+echo 2 > $SYSFS_PATH 2> /dev/null && fail "invalid input not detectec"
+remove_live_chip chip
+
+echo "4. Simulated GPIO chips are functional"
+
+echo "4.1. Values can be read from sysfs"
+create_live_chip chip test-label 8
+SYSFS_PATH="/sys/devices/platform/`configfs_dev_name chip`/line-ctrl/gpio0"
+test `cat $SYSFS_PATH` = "0" || fail "incorrect value read from sysfs"
+$BASE_DIR/gpio-mockup-cdev -s 1 /dev/`configfs_chip_name chip` 0 &
+sleep 0.1 # FIXME Any better way?
+test `cat $SYSFS_PATH` = "1" || fail "incorrect value read from sysfs"
+kill $!
+remove_live_chip chip
+
+echo "4.2. Bias settings work correctly"
+create_live_chip chip test-label 8
+$BASE_DIR/gpio-mockup-cdev -b pull-up /dev/`configfs_chip_name chip` 0
+test `cat $SYSFS_PATH` = "1" || fail "bias setting does not work"
+remove_live_chip chip
+
+echo "GPIO $MODULE test PASS"
-- 
2.30.1

