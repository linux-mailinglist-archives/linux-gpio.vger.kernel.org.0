Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AC933AE5C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCOJOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhCOJOX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:23 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E48C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:22 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j7so5281105wrd.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w8ZvtWniN1Nax9s0y7bdXk3w3tCDYUtn2uEyXco2kqg=;
        b=t1M4wHTo6/S/yxEaon3crnkzqI3HKG/T+x4IFGoYM4b0uPBnbxVfDx1hlIDcu/K4D9
         x2ruQq3uUNY7zkHmcq9hfVUWpZB82407wrKBy7+lNwh86mOhONdr4g/Rmc6N3iPedeoc
         ghkfHOy1th82rc+683I6RPeETMnt3r276II3qQDRB4nssavPAV+jAQZirPhkTPJ4RECj
         j8jpoD8CxCSJ7vWrH5ktj8P2vHzaQhyUXpSzcKuNkifqN09KWbzgzNv2x0Lb4WMKwwp3
         TbCx6CBptPi1apgO3evC8XXvahNdR9o1P1+G6RIWOkfy6PkdB3pQq7VPFK7gsHaNx7K+
         eL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w8ZvtWniN1Nax9s0y7bdXk3w3tCDYUtn2uEyXco2kqg=;
        b=eySAWluhjhVlhuoDImShtNbS5OZhwR81zx9WAZj4F5rg5sOdiOtdNP8POgI8DkpfiH
         i1is//NOVBL5vmsCCSWMoN+A8g1OnYfPOjHMlrcQpoiKqnkUt5GKeKZtEbpg+v6BRAkV
         igv+LPil9hWBWFdi2kIZ+OBn5YZl5JWCpc3msc9MuFKAJJU7Zu8Wh5vxsfZbBHA6N3JY
         GHw9+4lzm91pxlWWNvSSUJfOSf4h3WFddD7x8W2hkLZXc7OWpV338CFkdzFKhiB9rB7m
         1pOX0TrahvqcftqA3ObCk8CqQZTC3NmOQKCWnvnrTRaV5qK9oCg5o5Cb8eM6ml3NO9+u
         YQ2w==
X-Gm-Message-State: AOAM531YHl1siEUJOwqwLDLmpZurRFwA5UrACokeuQRQfIPqlMvRloEe
        sp+U7s+rP46zgvUWMyPn2Cww7Q==
X-Google-Smtp-Source: ABdhPJypT5bzuaMfwXmJenwdZAqXfmmqbNAgeb08ODGFapUiqH+Jb1Ku3UyWgR/+jayNhAv2GE9KVA==
X-Received: by 2002:a05:6000:18ac:: with SMTP id b12mr26543856wri.77.1615799661584;
        Mon, 15 Mar 2021 02:14:21 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:21 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 11/11] selftests: gpio: add test cases for gpio-sim
Date:   Mon, 15 Mar 2021 10:14:00 +0100
Message-Id: <20210315091400.13772-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a set of tests for the new gpio-sim module. This is a pure shell
test-suite and uses the helper programs available in the gpio selftests
directory. These test-cases only test the functionalities exposed by the
gpio-sim driver, not those handled by core gpiolib code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

