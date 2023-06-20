Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5897736C1C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 14:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjFTMlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 08:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjFTMll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 08:41:41 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C14A3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 05:41:36 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-311167ba376so4459145f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687264895; x=1689856895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju5+eSpw5N+5PUeByZ5UDXSva4DQbrCLgATdfUcZ0mM=;
        b=VZ1/BmAgfTqkMTnMsvq52ovL3WGfeax/9h4QCGCx6FlQYlwlL7cqgZqeQ+ldgRIzL5
         o8xdEWRzQ7bFfPzpMfM3W1flVDCim16Ks2Rg5SEmIdIWaV+LyusoEvPprPczVgcmKgjh
         vLUb+wIMtFHJEsv2YikbJkCqvPLFA2uOXEzzE/ulzJkSFncCd5cHLia46HMyg6WNfsHI
         2IYGpTSw0M1PuMrQWbJLjKnsxUt+/PkUGvMtT8QMWgFaBtRx16tz/5dVh7Ft80My+GuC
         Mzktz7H91YBK7AHXKSkdyFKclH6o8s9H/AqEqWZDwQmExLbqO+8NKzFLDdPBimqgM8dO
         uUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687264895; x=1689856895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ju5+eSpw5N+5PUeByZ5UDXSva4DQbrCLgATdfUcZ0mM=;
        b=R1Dma0/ktzpNKUkpPrGmMFAqC+eOxT8uz8FGTfMVX2QoEZJtYijoze0A8Z1OjzJt//
         REteDPbJmxK8+qQk98/yBh8HvUsiFn6x0+WfwStr35fhEJozXF2U1RcSFN8/T8X767Qg
         YkLJ0zE4gP+BQh2vycaJK21H4RGPaXSiPxXdD8Hy9C98PsQg6HZGLw1pHn1bAajLm9sX
         r4lw7A9LybfOfpfrgqvCYe2qZUAnQt29CxHAfS9zdR3VxEaGQwAhYju9Jy4PtJWLo5RU
         A3A6kKvKNgb7DexM/SwWi6pX+asbyWswLpcSjHHje6pmH3NqzsqJw2/UlGu8zCs6rfsP
         AeTg==
X-Gm-Message-State: AC+VfDw0BTn+i8VXUrOxPjaWMe+hBPYc2/JktHmJrTJVNkdTT32Suli/
        gIO1eDvR6qMbzJIOBZ58FENpLg==
X-Google-Smtp-Source: ACHHUZ4nSVXTYlq124hiYOcqNYoz+KtO7s+UqvKuOESGoo/kQ+nqe3A1fluTnFi+dNuYat57OT/CGw==
X-Received: by 2002:a5d:4e8f:0:b0:30f:c703:8be3 with SMTP id e15-20020a5d4e8f000000b0030fc7038be3mr8951699wru.42.1687264894474;
        Tue, 20 Jun 2023 05:41:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a02a:73e0:977c:af4f])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6545000000b003113bd9ecaesm1882176wrv.116.2023.06.20.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 05:41:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: tests: port tests to shunit2
Date:   Tue, 20 Jun 2023 14:41:30 +0200
Message-Id: <20230620124130.303427-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

BATS has been confirmed to run much more slowly that shunit2. This is
most likely caused by the way BATS evaluates each test file n+1 times
where n is the number of tests[1].

Port tests to using shunit2 which executes as a regular shell script
which, in addition to higher speed, allows for easier debugging as
standard shell flags like -x now work.

[1] https://bats-core.readthedocs.io/en/stable/writing-tests.html

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes since RFC:
- remove all references to bats
- check for shunit2 in configure
- update docs
- remove all bats-specific workarounds

 README                                        |   6 +-
 TODO                                          |   2 +-
 configure.ac                                  |   6 +-
 tools/Makefile.am                             |   4 +-
 tools/gpio-tools-test                         |  57 ---
 ...o-tools-test.bats => gpio-tools-test.bash} | 451 ++++++++++--------
 6 files changed, 250 insertions(+), 276 deletions(-)
 delete mode 100755 tools/gpio-tools-test
 rename tools/{gpio-tools-test.bats => gpio-tools-test.bash} (88%)

diff --git a/README b/README
index 5764eee..962dc06 100644
--- a/README
+++ b/README
@@ -247,8 +247,8 @@ superuser privileges.
 The testing framework uses the GLib unit testing library so development package
 for GLib must be installed.
 
-The gpio-tools programs can be tested separately using the gpio-tools-test.bats
-script. It requires bats[1] to run and assumes that the tested executables are
+The gpio-tools programs can be tested separately using the gpio-tools-test.bash
+script. It requires shunit2[1] to run and assumes that the tested executables are
 in the same directory as the script.
 
 C++, Rust and Python bindings also include their own test-suites. All three
@@ -294,7 +294,7 @@ Those also provide examples of the expected formatting.
 Allow some time for your e-mail to propagate to the list before retrying,
 particularly if there are no e-mails in the list more recent than yours.
 
-[1] https://github.com/bats-core/bats-core
+[1] https://github.com/kward/shunit2
 [2] http://vger.kernel.org/vger-lists.html#linux-gpio
 [3] https://docs.kernel.org/process/email-clients.html
 [4] https://docs.kernel.org/process/coding-style.html
diff --git a/TODO b/TODO
index cbd6dbd..79a6246 100644
--- a/TODO
+++ b/TODO
@@ -47,7 +47,7 @@ standardized protocol, it will take much more effort to implement it correctly.
 The existing tab completion uses libedit's readline emulation layer which
 has a few limitations, including not being able to correctly handle quoted
 line names and being disabled when stdin/stdout are not a tty (which makes
-testing with gpio-tools-test.bats using coproc problematic).
+testing with gpio-tools-test.bash using coproc problematic).
 
 One approach that could address both these problems is to bypass the readline
 emulation and use the libedit API (histedit.h) directly.
diff --git a/configure.ac b/configure.ac
index dde2fa5..4f120e5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -176,10 +176,10 @@ then
 
 	if test "x$with_tools" = xtrue
 	then
-		AC_CHECK_PROG([has_bats], [bats], [true], [false])
-		if test "x$has_bats" = "xfalse"
+		AC_CHECK_PROG([has_shunit2], [shunit2], [true], [false])
+		if test "x$has_shunit2" = "xfalse"
 		then
-			AC_MSG_NOTICE([bats not found - gpio-tools tests cannot be run])
+			AC_MSG_NOTICE([shunit2 not found - gpio-tools tests cannot be run])
 		fi
 	fi
 fi
diff --git a/tools/Makefile.am b/tools/Makefile.am
index bdad8f7..92a819f 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -30,10 +30,8 @@ gpiomon_SOURCES = gpiomon.c
 
 gpionotify_SOURCES = gpionotify.c
 
-EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
-
 if WITH_TESTS
 
-noinst_SCRIPTS = gpio-tools-test gpio-tools-test.bats
+noinst_SCRIPTS = gpio-tools-test.bash
 
 endif
diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
deleted file mode 100755
index 441ec66..0000000
--- a/tools/gpio-tools-test
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/usr/bin/env bash
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-MIN_KERNEL_VERSION="5.17.4"
-BATS_SCRIPT="gpio-tools-test.bats"
-SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
-
-die() {
-	echo "$@" 1>&2
-	exit 1
-}
-
-check_kernel() {
-	local REQUIRED=$1
-	local CURRENT=$(uname -r)
-
-	SORTED=$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
-
-	if [ "$SORTED" != "$REQUIRED" ]
-	then
-		die "linux kernel version must be at least: v$REQUIRED - got: v$CURRENT"
-	fi
-}
-
-check_prog() {
-	local PROG=$1
-
-	which "$PROG" > /dev/null
-	if [ "$?" -ne "0" ]
-	then
-		die "$PROG not found - needed to run the tests"
-	fi
-}
-
-# Check all required non-coreutils tools
-check_prog bats
-check_prog modprobe
-check_prog timeout
-check_prog grep
-
-# Check if we're running a kernel at the required version or later
-check_kernel $MIN_KERNEL_VERSION
-
-# The bats script must be in the same directory.
-if [ ! -e "$SOURCE_DIR/$BATS_SCRIPT" ]
-then
-	die "testing script not found"
-fi
-
-BATS_PATH=$(which bats)
-
-modprobe gpio-sim || die "unable to load the gpio-sim module"
-mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
-	die "configfs not mounted at /sys/kernel/config/"
-
-exec $BATS_PATH -F tap $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bash
similarity index 88%
rename from tools/gpio-tools-test.bats
rename to tools/gpio-tools-test.bash
index cc28f1b..07252fc 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bash
@@ -1,18 +1,21 @@
-#!/usr/bin/env bats
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 # Simple test harness for the gpio-tools.
 
 # Where output from the dut is stored
-DUT_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
+DUT_OUTPUT=/tmp/gpio-tools-test-output
 # Save the PID of coprocess - otherwise we won't be able to wait for it
 # once it exits as the COPROC_PID will be cleared.
 DUT_PID=""
 
+SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
+
 # mappings from local name to system chip name, path, dev name
-# -g required for the associative arrays, cos BATS...
+# -g required for the associative arrays.
 declare -g -A GPIOSIM_CHIP_NAME
 declare -g -A GPIOSIM_CHIP_PATH
 declare -g -A GPIOSIM_DEV_NAME
@@ -20,53 +23,41 @@ GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim"
 GPIOSIM_SYSFS="/sys/devices/platform/"
 GPIOSIM_APP_NAME="gpio-tools-test"
 
-# Run the command in $* and return 0 if the command failed. The way we do it
-# here is a workaround for the way bats handles failing processes.
+MIN_KERNEL_VERSION="5.17.4"
+
+# Run the command in $* and fail the test if the command succeeds.
 assert_fail() {
 	$* || return 0
-	return 1
+	fail " '$*': command did not fail as expected"
 }
 
 # Check if the string in $2 matches against the pattern in $1.
 regex_matches() {
-	[[ $2 =~ $1 ]] || (echo "Mismatched: \"$2\"" && false)
+	[[ $2 =~ $1 ]]
+	assertEquals " '$2' did not match '$1':" "0" "$?"
 }
 
-# Iterate over all lines in the output of the last command invoked with bats'
-# 'run' or the coproc helper and check if at least one is equal to $1.
 output_contains_line() {
-	local LINE=$1
-
-	for line in "${lines[@]}"
-	do
-		test "$line" = "$LINE" && return 0
-	done
-	echo "Mismatched:"
-	echo "$output"
-	return 1
+	assertContains "$1" "$output"
 }
 
 output_is() {
-	test "$output" = "$1" || (echo "Mismatched: \"$output\"" && false)
+	assertEquals " output:" "$1" "$output"
 }
 
 num_lines_is() {
-	test ${#lines[@]} -eq $1 || (echo "Num lines is: ${#lines[@]}" && false)
+	local NUM_LINES=$(echo "$output" | wc -l)
+	assertEquals " number of lines:" "$1" "$NUM_LINES"
 }
 
 status_is() {
-	test "$status" -eq "$1"
+	assertEquals " status:" "$1" "$status"
 }
 
 # Same as above but match against the regex pattern in $1.
 output_regex_match() {
-	for line in "${lines[@]}"
-	do
-		[[ "$line" =~ $1 ]] && return 0
-	done
-	echo "Mismatched:"
-	echo "$output"
-	return 1
+	[[ "$output" =~ $1 ]]
+	assertEquals "0" "$?"
 }
 
 gpiosim_chip() {
@@ -110,7 +101,7 @@ gpiosim_chip_number() {
 }
 
 gpiosim_chip_symlink() {
-	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
+	GPIOSIM_CHIP_LINK="/tmp/${GPIOSIM_APP_NAME}-$$-lnk"
 	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
 }
 
@@ -189,17 +180,18 @@ gpiosim_cleanup() {
 run_tool() {
 	# Executables to test are expected to be in the same directory as the
 	# testing script.
-	run timeout 10s $BATS_TEST_DIRNAME/"$@"
+	output=$(timeout 10s $SOURCE_DIR/"$@" 2>&1)
+	status=$?
 }
 
 dut_run() {
-	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" 2>&1
+	coproc timeout 10s $SOURCE_DIR/"$@" 2>&1
 	DUT_PID=$COPROC_PID
 	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
 }
 
 dut_run_redirect() {
-	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" > $DUT_OUTPUT 2>&1
+	coproc timeout 10s $SOURCE_DIR/"$@" > $DUT_OUTPUT 2>&1
 	DUT_PID=$COPROC_PID
 	# give the process time to spin up
 	# FIXME - find a better solution
@@ -253,7 +245,8 @@ dut_regex_match() {
 		LINE=${DUT_FIRST_CHAR}${LINE}
 		unset DUT_FIRST_CHAR
 	fi
-	[[ $LINE =~ $PATTERN ]] || (echo "Mismatched: \"$LINE\"" && false)
+	[[ $LINE =~ $PATTERN ]]
+	assertEquals "0" "$?"
 }
 
 dut_write() {
@@ -267,36 +260,34 @@ dut_kill() {
 }
 
 dut_wait() {
-	status="0"
-	# A workaround for the way bats handles command failures.
-	wait $DUT_PID || export status=$?
-	test "$status" -ne 0 || export status="0"
+	wait $DUT_PID
+	export status=$?
 	unset DUT_PID
 }
 
 dut_cleanup() {
         if [ -n "$DUT_PID" ]
         then
-		kill -SIGTERM $DUT_PID
+		kill -SIGTERM $DUT_PID 2> /dev/null
 		wait $DUT_PID || false
         fi
         rm -f $DUT_OUTPUT
 }
 
-teardown() {
+tearDown() {
 	dut_cleanup
 	gpiosim_cleanup
 }
 
 request_release_line() {
-	$BATS_TEST_DIRNAME/gpioget -c $* >/dev/null
+	$SOURCE_DIR/gpioget -c $* >/dev/null
 }
 
 #
 # gpiodetect test cases
 #
 
-@test "gpiodetect: all chips" {
+test_gpiodetect_all_chips() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 	gpiosim_chip sim2 num_lines=16
@@ -325,7 +316,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpiodetect: a chip" {
+test_gpiodetect_a_chip() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 	gpiosim_chip sim2 num_lines=16
@@ -367,7 +358,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpiodetect: multiple chips" {
+test_gpiodetect_multiple_chips() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 	gpiosim_chip sim2 num_lines=16
@@ -388,7 +379,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpiodetect: with nonexistent chip" {
+test_gpiodetect_with_nonexistent_chip() {
 	run_tool gpiodetect nonexistent-chip
 
 	status_is 1
@@ -400,7 +391,7 @@ request_release_line() {
 # gpioinfo test cases
 #
 
-@test "gpioinfo: all chips" {
+test_gpioinfo_all_chips() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 
@@ -422,7 +413,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: all chips with some used lines" {
+test_gpioinfo_all_chips_with_some_used_lines() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
@@ -440,7 +431,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: a chip" {
+test_gpioinfo_a_chip() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip sim1 num_lines=4
 
@@ -492,7 +483,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: a line" {
+test_gpioinfo_a_line() {
 	gpiosim_chip sim0 num_lines=8 line_name=5:bar
 	gpiosim_chip sim1 num_lines=4 line_name=2:bar
 
@@ -529,7 +520,7 @@ request_release_line() {
 
 }
 
-@test "gpioinfo: first matching named line" {
+test_gpioinfo_first_matching_named_line() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -545,7 +536,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: multiple lines" {
+test_gpioinfo_multiple_lines() {
 	gpiosim_chip sim0 num_lines=8 line_name=5:bar
 	gpiosim_chip sim1 num_lines=4 line_name=2:baz
 
@@ -577,7 +568,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: line attribute menagerie" {
+test_gpioinfo_line_attribute_menagerie() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz
 
@@ -652,7 +643,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: with same line twice" {
+test_gpioinfo_with_same_line_twice() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -682,7 +673,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioinfo: all lines matching name" {
+test_gpioinfo_all_lines_matching_name() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -701,7 +692,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioinfo: with lines strictly by name" {
+test_gpioinfo_with_lines_strictly_by_name() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -724,7 +715,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioinfo: with nonexistent chip" {
+test_gpioinfo_with_nonexistent_chip() {
 	run_tool gpioinfo --chip nonexistent-chip
 
 	output_regex_match \
@@ -732,7 +723,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioinfo: with nonexistent line" {
+test_gpioinfo_with_nonexistent_line() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioinfo nonexistent-line
@@ -746,7 +737,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioinfo: with offset out of range" {
+test_gpioinfo_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -767,7 +758,7 @@ request_release_line() {
 # gpioget test cases
 #
 
-@test "gpioget: by name" {
+test_gpioget_by_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	gpiosim_set_pull sim0 1 pull-up
@@ -783,7 +774,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: by offset" {
+test_gpioget_by_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 1 pull-up
@@ -799,7 +790,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: by symlink" {
+test_gpioget_by_symlink() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip_symlink sim0 .
 
@@ -811,7 +802,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: by chip and name" {
+test_gpioget_by_chip_and_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 	gpiosim_chip sim1 num_lines=8 line_name=3:foo
 
@@ -828,7 +819,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: first matching named line" {
+test_gpioget_first_matching_named_line() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar line_name=7:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -843,7 +834,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: multiple lines" {
+test_gpioget_multiple_lines() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -858,7 +849,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: multiple lines by name and offset" {
+test_gpioget_multiple_lines_by_name_and_offset() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=6:bar
 	gpiosim_chip sim1 num_lines=8 line_name=1:baz line_name=3:bar
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -873,7 +864,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: multiple lines across multiple chips" {
+test_gpioget_multiple_lines_across_multiple_chips() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
 
@@ -886,7 +877,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with numeric values" {
+test_gpioget_with_numeric_values() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -902,7 +893,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with active-low" {
+test_gpioget_with_active_low() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -919,7 +910,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with consumer" {
+test_gpioget_with_consumer() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
@@ -933,7 +924,7 @@ request_release_line() {
 	output_regex_match "baz requested gpio-tools-tests"
 }
 
-@test "gpioget: with pull-up" {
+test_gpioget_with_pull_up() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -950,7 +941,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with pull-down" {
+test_gpioget_with_pull_down() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -967,7 +958,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with direction as-is" {
+test_gpioget_with_direction_as_is() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1002,7 +993,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with hold-period" {
+test_gpioget_with_hold_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	# only test parsing - testing the hold-period itself is tricky
@@ -1011,7 +1002,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with strict named line check" {
+test_gpioget_with_strict_named_line_check() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -1024,7 +1015,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioget: with lines by offset" {
+test_gpioget_with_lines_by_offset() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -1043,7 +1034,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with lines strictly by name" {
+test_gpioget_with_lines_strictly_by_name() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -1062,14 +1053,14 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioget: with no arguments" {
+test_gpioget_with_no_arguments() {
 	run_tool gpioget
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
 }
 
-@test "gpioget: with chip but no line specified" {
+test_gpioget_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]}
@@ -1078,7 +1069,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioget: with offset out of range" {
+test_gpioget_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1089,14 +1080,14 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioget: with nonexistent line" {
+test_gpioget_with_nonexistent_line() {
 	run_tool gpioget nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
 }
 
-@test "gpioget: with same line twice" {
+test_gpioget_with_same_line_twice() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1131,7 +1122,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioget: with invalid bias" {
+test_gpioget_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioget --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1
@@ -1140,7 +1131,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioget: with invalid hold-period" {
+test_gpioget_with_invalid_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioget --hold-period=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0
@@ -1153,7 +1144,7 @@ request_release_line() {
 # gpioset test cases
 #
 
-@test "gpioset: by name" {
+test_gpioset_by_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	dut_run gpioset --banner foo=1
@@ -1161,7 +1152,7 @@ request_release_line() {
 	gpiosim_check_value sim0 1 1
 }
 
-@test "gpioset: by offset" {
+test_gpioset_by_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 1=1
@@ -1169,7 +1160,7 @@ request_release_line() {
 	gpiosim_check_value sim0 1 1
 }
 
-@test "gpioset: by symlink" {
+test_gpioset_by_symlink() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip_symlink sim0 .
 
@@ -1178,7 +1169,7 @@ request_release_line() {
 	gpiosim_check_value sim0 1 1
 }
 
-@test "gpioset: by chip and name" {
+test_gpioset_by_chip_and_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 	gpiosim_chip sim1 num_lines=8 line_name=3:foo
 
@@ -1187,7 +1178,7 @@ request_release_line() {
 	gpiosim_check_value sim1 3 1
 }
 
-@test "gpioset: first matching named line" {
+test_gpioset_first_matching_named_line() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -1199,7 +1190,7 @@ request_release_line() {
 	gpiosim_check_value sim0 3 1
 }
 
-@test "gpioset: multiple lines" {
+test_gpioset_multiple_lines() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1216,7 +1207,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: multiple lines by name and offset" {
+test_gpioset_multiple_lines_by_name_and_offset() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 
 	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 foo=1 bar=1 3=1
@@ -1228,7 +1219,7 @@ request_release_line() {
 }
 
 
-@test "gpioset: multiple lines across multiple chips" {
+test_gpioset_multiple_lines_across_multiple_chips() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
 
@@ -1240,7 +1231,7 @@ request_release_line() {
 	gpiosim_check_value sim1 4 1
 }
 
-@test "gpioset: with active-low" {
+test_gpioset_with_active_low() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1257,7 +1248,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 0
 }
 
-@test "gpioset: with consumer" {
+test_gpioset_with_consumer() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
@@ -1273,7 +1264,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioset: with push-pull" {
+test_gpioset_with_push_pull() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1291,7 +1282,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with open-drain" {
+test_gpioset_with_open_drain() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1314,7 +1305,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with open-source" {
+test_gpioset_with_open_source() {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -1337,7 +1328,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with pull-up" {
+test_gpioset_with_pull_up() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1355,7 +1346,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with pull-down" {
+test_gpioset_with_pull_down() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1373,7 +1364,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with value variants" {
+test_gpioset_with_value_variants() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1400,7 +1391,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: with hold-period" {
+test_gpioset_with_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1418,7 +1409,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioset: interactive exit" {
+test_gpioset_interactive_exit() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1437,7 +1428,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioset: interactive help" {
+test_gpioset_interactive_help() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1457,7 +1448,7 @@ request_release_line() {
 	output_regex_match ".*sleep <period>.*"
 }
 
-@test "gpioset: interactive get" {
+test_gpioset_interactive_get() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1478,7 +1469,7 @@ request_release_line() {
 	output_regex_match "\"bar\"=inactive"
 }
 
-@test "gpioset: interactive get unquoted" {
+test_gpioset_interactive_get_unquoted() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1499,7 +1490,7 @@ request_release_line() {
 	output_regex_match "bar=inactive"
 }
 
-@test "gpioset: interactive set" {
+test_gpioset_interactive_set() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1519,7 +1510,7 @@ request_release_line() {
 	output_regex_match "\"foo\"=active \"bar\"=active \"baz\"=inactive"
 }
 
-@test "gpioset: interactive toggle" {
+test_gpioset_interactive_toggle() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1551,7 +1542,7 @@ request_release_line() {
 	output_regex_match "\"foo\"=inactive\\s+\"bar\"=active\\s+\"baz\"=inactive\\s*"
 }
 
-@test "gpioset: interactive sleep" {
+test_gpioset_interactive_sleep() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1568,7 +1559,7 @@ request_release_line() {
 	dut_readable
 }
 
-@test "gpioset: toggle (continuous)" {
+test_gpioset_toggle_continuous() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1595,7 +1586,7 @@ request_release_line() {
 	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioset: toggle (terminated)" {
+test_gpioset_toggle_terminated() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1631,7 +1622,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpioset: with invalid toggle period" {
+test_gpioset_with_invalid_toggle_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
@@ -1641,7 +1632,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with strict named line check" {
+test_gpioset_with_strict_named_line_check() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -1654,7 +1645,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with lines by offset" {
+test_gpioset_with_lines_by_offset() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -1668,7 +1659,7 @@ request_release_line() {
 	gpiosim_check_value sim0 6 1
 }
 
-@test "gpioset: with lines strictly by name" {
+test_gpioset_with_lines_strictly_by_name() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -1682,7 +1673,7 @@ request_release_line() {
 	gpiosim_check_value sim0 6 0
 }
 
-@test "gpioset: interactive after SIGINT" {
+test_gpioset_interactive_after_SIGINT() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	dut_run gpioset -i foo=1
@@ -1693,7 +1684,7 @@ request_release_line() {
 	status_is 130
 }
 
-@test "gpioset: interactive after SIGTERM" {
+test_gpioset_interactive_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	dut_run gpioset -i foo=1
@@ -1704,14 +1695,14 @@ request_release_line() {
 	status_is 143
 }
 
-@test "gpioset: with no arguments" {
+test_gpioset_with_no_arguments() {
 	run_tool gpioset
 
 	status_is 1
 	output_regex_match ".*at least one GPIO line value must be specified"
 }
 
-@test "gpioset: with chip but no line specified" {
+test_gpioset_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]}
@@ -1720,7 +1711,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with offset out of range" {
+test_gpioset_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1732,7 +1723,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with invalid hold-period" {
+test_gpioset_with_invalid_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1743,7 +1734,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with invalid value" {
+test_gpioset_with_invalid_value() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1761,7 +1752,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with invalid offset" {
+test_gpioset_with_invalid_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]} 4000000000=0
@@ -1770,7 +1761,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with invalid bias" {
+test_gpioset_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioset --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
@@ -1779,7 +1770,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with invalid drive" {
+test_gpioset_with_invalid_drive() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpioset --drive=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
@@ -1788,7 +1779,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with interactive and toggle" {
+test_gpioset_with_interactive_and_toggle() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1799,14 +1790,14 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpioset: with nonexistent line" {
+test_gpioset_with_nonexistent_line() {
 	run_tool gpioset nonexistent-line=0
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
 }
 
-@test "gpioset: with same line twice" {
+test_gpioset_with_same_line_twice() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1840,7 +1831,7 @@ request_release_line() {
 # gpiomon test cases
 #
 
-@test "gpiomon: by name" {
+test_gpiomon_by_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:foo
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -1855,7 +1846,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: by offset" {
+test_gpiomon_by_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1872,7 +1863,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: by symlink" {
+test_gpiomon_by_symlink() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip_symlink sim0 .
 
@@ -1891,7 +1882,7 @@ request_release_line() {
 }
 
 
-@test "gpiomon: by chip and name" {
+test_gpiomon_by_chip_and_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=0:foo
 	gpiosim_chip sim1 num_lines=8 line_name=2:foo
 
@@ -1909,7 +1900,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: first matching named line" {
+test_gpiomon_first_matching_named_line() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -1924,7 +1915,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: rising edge" {
+test_gpiomon_rising_edge() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -1941,7 +1932,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: falling edge" {
+test_gpiomon_falling_edge() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1957,7 +1948,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: both edges" {
+test_gpiomon_both_edges() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1971,7 +1962,7 @@ request_release_line() {
 	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4"
 }
 
-@test "gpiomon: with pull-up" {
+test_gpiomon_with_pull_up() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -1986,7 +1977,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with pull-down" {
+test_gpiomon_with_pull_down() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -2002,7 +1993,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with active-low" {
+test_gpiomon_with_active_low() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -2020,7 +2011,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with consumer" {
+test_gpiomon_with_consumer() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
@@ -2036,7 +2027,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpiomon: with quiet mode" {
+test_gpiomon_with_quiet_mode() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2048,7 +2039,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with unquoted" {
+test_gpiomon_with_unquoted() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:foo
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2063,7 +2054,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with num-events" {
+test_gpiomon_with_num_events() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2072,9 +2063,13 @@ request_release_line() {
 	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
 
 	gpiosim_set_pull sim0 4 pull-up
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-down
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-up
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-down
+	sleep 0.01
 
 	dut_wait
 	status_is 0
@@ -2087,7 +2082,7 @@ request_release_line() {
 	num_lines_is 4
 }
 
-@test "gpiomon: with debounce-period" {
+test_gpiomon_with_debounce_period() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
@@ -2103,7 +2098,7 @@ request_release_line() {
 	status_is 0
 }
 
-@test "gpiomon: with idle-timeout" {
+test_gpiomon_with_idle_timeout() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2114,10 +2109,9 @@ request_release_line() {
 	dut_wait
 	status_is 0
 	dut_read_redirect
-	num_lines_is 0
 }
 
-@test "gpiomon: multiple lines" {
+test_gpiomon_multiple_lines() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2135,7 +2129,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: multiple lines by name and offset" {
+test_gpiomon_multiple_lines_by_name_and_offset() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2153,7 +2147,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: multiple lines across multiple chips" {
+test_gpiomon_multiple_lines_across_multiple_chips() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
 
@@ -2170,7 +2164,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: exit after SIGINT" {
+test_gpiomon_exit_after_SIGINT() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2184,7 +2178,7 @@ request_release_line() {
 	status_is 130
 }
 
-@test "gpiomon: exit after SIGTERM" {
+test_gpiomon_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2198,14 +2192,14 @@ request_release_line() {
 	status_is 143
 }
 
-@test "gpiomon: with nonexistent line" {
+test_gpiomon_with_nonexistent_line() {
 	run_tool gpiomon nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 }
 
-@test "gpiomon: with same line twice" {
+test_gpiomon_with_same_line_twice() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2229,7 +2223,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with strict named line check" {
+test_gpiomon_with_strict_named_line_check() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -2241,7 +2235,7 @@ request_release_line() {
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
 }
-@test "gpiomon: with lines by offset" {
+test_gpiomon_with_lines_by_offset() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -2268,7 +2262,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with lines strictly by name" {
+test_gpiomon_with_lines_strictly_by_name() {
 	# not suggesting this setup makes sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
@@ -2295,14 +2289,14 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpiomon: with no arguments" {
+test_gpiomon_with_no_arguments() {
 	run_tool gpiomon
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
 }
 
-@test "gpiomon: with no line specified" {
+test_gpiomon_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpiomon --chip ${GPIOSIM_CHIP_NAME[sim0]}
@@ -2311,7 +2305,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with offset out of range" {
+test_gpiomon_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2322,7 +2316,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with invalid bias" {
+test_gpiomon_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2333,7 +2327,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with invalid debounce-period" {
+test_gpiomon_with_invalid_debounce_period() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2344,7 +2338,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with invalid idle-timeout" {
+test_gpiomon_with_invalid_idle_timeout() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2355,7 +2349,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpiomon: with custom format (event type + offset)" {
+test_gpiomon_with_custom_format_event_type_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2368,7 +2362,7 @@ request_release_line() {
 	output_is "1 4"
 }
 
-@test "gpiomon: with custom format (event type + offset joined)" {
+test_gpiomon_with_custom_format_event_type_offset_joined() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2381,7 +2375,7 @@ request_release_line() {
 	output_is "14"
 }
 
-@test "gpiomon: with custom format (edge, chip and line)" {
+test_gpiomon_with_custom_format_edge_chip_and_line() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:baz
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2393,7 +2387,7 @@ request_release_line() {
 	dut_regex_match "1 4 rising $sim0 baz"
 }
 
-@test "gpiomon: with custom format (seconds timestamp)" {
+test_gpiomon_with_custom_format_seconds_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2405,7 +2399,7 @@ request_release_line() {
 	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
 }
 
-@test "gpiomon: with custom format (UTC timestamp)" {
+test_gpiomon_with_custom_format_UTC_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2419,7 +2413,7 @@ request_release_line() {
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 1 4"
 }
 
-@test "gpiomon: with custom format (localtime timestamp)" {
+test_gpiomon_with_custom_format_localtime_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2433,7 +2427,7 @@ request_release_line() {
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 1 4"
 }
 
-@test "gpiomon: with custom format (double percent sign)" {
+test_gpiomon_with_custom_format_double_percent_sign() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2446,7 +2440,7 @@ request_release_line() {
 	output_is "start%end"
 }
 
-@test "gpiomon: with custom format (double percent sign + event type specifier)" {
+test_gpiomon_with_custom_format_double_percent_sign_event_type_specifier() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2459,7 +2453,7 @@ request_release_line() {
 	output_is "%e"
 }
 
-@test "gpiomon: with custom format (single percent sign)" {
+test_gpiomon_with_custom_format_single_percent_sign() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2472,7 +2466,7 @@ request_release_line() {
 	output_is "%"
 }
 
-@test "gpiomon: with custom format (single percent sign between other characters)" {
+test_gpiomon_with_custom_format_single_percent_sign_between_other_characters() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2485,7 +2479,7 @@ request_release_line() {
 	output_is "foo % bar"
 }
 
-@test "gpiomon: with custom format (unknown specifier)" {
+test_gpiomon_with_custom_format_unknown_specifier() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2502,7 +2496,7 @@ request_release_line() {
 # gpionotify test cases
 #
 
-@test "gpionotify: by name" {
+test_gpionotify_by_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2517,7 +2511,7 @@ request_release_line() {
 	# tools currently have no way to generate a reconfig event
 }
 
-@test "gpionotify: by offset" {
+test_gpionotify_by_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2532,7 +2526,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: by symlink" {
+test_gpionotify_by_symlink() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip_symlink sim0 .
 
@@ -2548,7 +2542,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: by chip and name" {
+test_gpionotify_by_chip_and_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:foo
 	gpiosim_chip sim1 num_lines=8 line_name=2:foo
 
@@ -2564,7 +2558,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: first matching named line" {
+test_gpionotify_first_matching_named_line() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -2581,7 +2575,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with requested" {
+test_gpionotify_with_requested() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2596,7 +2590,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with released" {
+test_gpionotify_with_released() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
@@ -2610,7 +2604,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with quiet mode" {
+test_gpionotify_with_quiet_mode() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2622,7 +2616,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with unquoted" {
+test_gpionotify_with_unquoted() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2636,7 +2630,7 @@ request_release_line() {
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foo"
 }
 
-@test "gpionotify: with num-events" {
+test_gpionotify_with_num_events() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2644,7 +2638,6 @@ request_release_line() {
 	# redirect, as gpionotify exits after 4 events
 	dut_run_redirect gpionotify --num-events=4 --chip $sim0 3 4
 
-
 	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
 	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
 
@@ -2659,7 +2652,7 @@ request_release_line() {
 	num_lines_is 4
 }
 
-@test "gpionotify: with idle-timeout" {
+test_gpionotify_with_idle_timeout() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2671,11 +2664,9 @@ request_release_line() {
 	dut_wait
 	status_is 0
 	dut_read_redirect
-
-	num_lines_is 0
 }
 
-@test "gpionotify: multiple lines" {
+test_gpionotify_multiple_lines() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2698,7 +2689,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: multiple lines by name and offset" {
+test_gpionotify_multiple_lines_by_name_and_offset() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2721,7 +2712,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: multiple lines across multiple chips" {
+test_gpionotify_multiple_lines_across_multiple_chips() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
 
@@ -2750,7 +2741,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: exit after SIGINT" {
+test_gpionotify_exit_after_SIGINT() {
 	gpiosim_chip sim0 num_lines=8
 
 	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
@@ -2762,7 +2753,7 @@ request_release_line() {
 	status_is 130
 }
 
-@test "gpionotify: exit after SIGTERM" {
+test_gpionotify_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
 	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
@@ -2774,14 +2765,14 @@ request_release_line() {
 	status_is 143
 }
 
-@test "gpionotify: with nonexistent line" {
+test_gpionotify_with_nonexistent_line() {
 	run_tool gpionotify nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 }
 
-@test "gpionotify: with same line twice" {
+test_gpionotify_with_same_line_twice() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2808,7 +2799,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpionotify: with strict named line check" {
+test_gpionotify_with_strict_named_line_check() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
 				      line_name=3:foobar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
@@ -2821,7 +2812,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpionotify: with lines by offset" {
+test_gpionotify_with_lines_by_offset() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -2840,7 +2831,7 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with lines strictly by name" {
+test_gpionotify_with_lines_strictly_by_name() {
 	# not suggesting this setup makes any sense
 	# - just test that we can deal with it
 	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
@@ -2858,14 +2849,14 @@ request_release_line() {
 	assert_fail dut_readable
 }
 
-@test "gpionotify: with no arguments" {
+test_gpionotify_with_no_arguments() {
 	run_tool gpionotify
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
 }
 
-@test "gpionotify: with no line specified" {
+test_gpionotify_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
 	run_tool gpionotify --chip ${GPIOSIM_CHIP_NAME[sim0]}
@@ -2874,7 +2865,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpionotify: with offset out of range" {
+test_gpionotify_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2885,7 +2876,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpionotify: with invalid idle-timeout" {
+test_gpionotify_with_invalid_idle_timeout() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2896,7 +2887,7 @@ request_release_line() {
 	status_is 1
 }
 
-@test "gpionotify: with custom format (event type + offset)" {
+test_gpionotify_with_custom_format_event_type_offset() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2909,7 +2900,7 @@ request_release_line() {
 	output_is "1 4"
 }
 
-@test "gpionotify: with custom format (event type + offset joined)" {
+test_gpionotify_with_custom_format_event_type_offset_joined() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2922,7 +2913,7 @@ request_release_line() {
 	output_is "14"
 }
 
-@test "gpionotify: with custom format (event, chip and line)" {
+test_gpionotify_with_custom_format_event_chip_and_line() {
 	gpiosim_chip sim0 num_lines=8 line_name=4:baz
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2935,7 +2926,7 @@ request_release_line() {
 	dut_regex_match "2 4 released $sim0 baz"
 }
 
-@test "gpionotify: with custom format (seconds timestamp)" {
+test_gpionotify_with_custom_format_seconds_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2948,7 +2939,7 @@ request_release_line() {
 	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
 }
 
-@test "gpionotify: with custom format (UTC timestamp)" {
+test_gpionotify_with_custom_format_UTC_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2962,7 +2953,7 @@ request_release_line() {
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 2 4"
 }
 
-@test "gpionotify: with custom format (localtime timestamp)" {
+test_gpionotify_with_custom_format_localtime_timestamp() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2976,7 +2967,7 @@ request_release_line() {
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 2 4"
 }
 
-@test "gpionotify: with custom format (double percent sign)" {
+test_gpionotify_with_custom_format_double_percent_sign() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -2990,7 +2981,7 @@ request_release_line() {
 	output_is "start%end"
 }
 
-@test "gpionotify: with custom format (double percent sign + event type specifier)" {
+test_gpionotify_with_custom_format_double_percent_sign_event_type_specifier() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -3003,7 +2994,7 @@ request_release_line() {
 	output_is "%e"
 }
 
-@test "gpionotify: with custom format (single percent sign)" {
+test_gpionotify_with_custom_format_single_percent_sign() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -3016,7 +3007,7 @@ request_release_line() {
 	output_is "%"
 }
 
-@test "gpionotify: with custom format (single percent sign between other characters)" {
+test_gpionotify_with_custom_format_single_percent_sign_between_other_characters() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -3029,7 +3020,7 @@ request_release_line() {
 	output_is "foo % bar"
 }
 
-@test "gpionotify: with custom format (unknown specifier)" {
+test_gpionotify_with_custom_format_unknown_specifier() {
 	gpiosim_chip sim0 num_lines=8
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
@@ -3041,3 +3032,45 @@ request_release_line() {
 	dut_read
 	output_is "%x"
 }
+
+die() {
+	echo "$@" 1>&2
+	exit 1
+}
+
+check_kernel() {
+	local REQUIRED=$1
+	local CURRENT=$(uname -r)
+
+	SORTED=$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
+
+	if [ "$SORTED" != "$REQUIRED" ]
+	then
+		die "linux kernel version must be at least: v$REQUIRED - got: v$CURRENT"
+	fi
+}
+
+check_prog() {
+	local PROG=$1
+
+	which "$PROG" > /dev/null
+	if [ "$?" -ne "0" ]
+	then
+		die "$PROG not found - needed to run the tests"
+	fi
+}
+
+# Check all required non-coreutils tools
+check_prog shunit2
+check_prog modprobe
+check_prog timeout
+check_prog grep
+
+# Check if we're running a kernel at the required version or later
+check_kernel $MIN_KERNEL_VERSION
+
+modprobe gpio-sim || die "unable to load the gpio-sim module"
+mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
+	die "configfs not mounted at /sys/kernel/config/"
+
+. shunit2
-- 
2.39.2

