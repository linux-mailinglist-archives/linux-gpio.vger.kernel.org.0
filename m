Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767C84B8C03
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Feb 2022 16:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235327AbiBPPFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Feb 2022 10:05:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbiBPPFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Feb 2022 10:05:30 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA5128D3AD
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 07:05:16 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d27so3962688wrb.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YSvQ2Sbvf+F092T88IJUc4Qe8J5nG4NUJ1CICofSguo=;
        b=RfV34ozUIClin2ejgXIRlGfhq7s2Kpzdp9+6Ew1uCepAa3KQeuWVYXVyEvjrWXKnGX
         R41G4jM/RlfopiEzZJ2cN2CDCeo0iG98mj5+ogu9abiPy4u1DrWrpqW6QqN2yEw68efw
         EDRB+Vf6ih/nyCaevB0XLCI1CI7RU5C+70MP/Vxk7SANWLCqaoTV3XIABQZlEYzxQ2UX
         Gdjgdg0Y0GYnnvxsDrgNrEHRpA4ZHMgnd2AzVWlUnx+amUk77gDOo94hcRhc/Yomh0qW
         U0SXCi725mbhx7R8q56xb1DLgkQ/55K8KxRrcsQaVaIXHLBWu9yqfrbr9dooJJ+lmwOi
         xqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YSvQ2Sbvf+F092T88IJUc4Qe8J5nG4NUJ1CICofSguo=;
        b=uO1LA+fS+/0WzY235po/rPqRTdkoWAUB3dfnqa4fxvWH7KIzStSNm4hjrL40dMC2Ma
         SjolZ5bqrQG4k9u6+JQM5q8HggLKX8hZtmpwbT3aBoBWpqyvXNj49y5hS6+uswShNf4o
         QOMUbaErUpSxNur0IS3psM3HcA4py2CB44QbLDj1wTtbPdHrPIErwXuRzoMKD4FgJFs+
         E5OODV5kOVbK3fBBejyRNGk/yWcBSDD/3+dZS2yI0Zze8QCPdNXc4CbmfiFNEqKwZudK
         b4UsaZPFYokFbG2P5ZO2ijMxaGAZxbXuEeMtM//02wfRK4H6dc8Nc1zp5spF0X8GaG0R
         6Qcg==
X-Gm-Message-State: AOAM532rm7LB9Onvx31B5zyWTFtzSVXRTP2KgaOc3HU/e7QKXtYd65ne
        CNQf3r/q/UeQ4QCMjJOW2QIhBw==
X-Google-Smtp-Source: ABdhPJymSPe0VOjYTlk8j9NELJU6GlDiOsMtD1iJ5mDUpdE0+0COKk2f+VC4I3/pSqFA8EbHpdKJpg==
X-Received: by 2002:a5d:50c5:0:b0:1e6:dbc0:69a4 with SMTP id f5-20020a5d50c5000000b001e6dbc069a4mr2693417wrt.665.1645023914495;
        Wed, 16 Feb 2022 07:05:14 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f18sm10736487wmg.21.2022.02.16.07.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 07:05:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH] tools: port the test-suite to using gpio-sim
Date:   Wed, 16 Feb 2022 16:05:12 +0100
Message-Id: <20220216150512.863462-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the gpio-tools tests use the gpio-sim kernel module instead
of the old gpio-mockup.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tools/gpio-tools-test      |   7 +-
 tools/gpio-tools-test.bats | 626 +++++++++++++++++++++----------------
 2 files changed, 354 insertions(+), 279 deletions(-)

diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 9517974..234f9bd 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -2,7 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
-MIN_KERNEL_VERSION="5.5.0"
+# Switch to v5.17.0 once released
+MIN_KERNEL_VERSION="5.16.0"
 BATS_SCRIPT="gpio-tools-test.bats"
 SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
 
@@ -51,4 +52,8 @@ fi
 
 BATS_PATH=$(which bats)
 
+modprobe gpio-sim || die "unable to load the gpio-sim module"
+mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
+	die "configfs not mounted at /sys/kernel/config/"
+
 exec $BATS_PATH $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a5b97e1..68da3f2 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -10,6 +10,10 @@ COPROC_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
 # once it exits as the COPROC_PID will be cleared.
 COPROC_SAVED_PID=""
 
+GPIOSIM_CHIPS=""
+GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim/"
+GPIOSIM_SYSFS="/sys/devices/platform/"
+
 # Run the command in $* and return 0 if the command failed. The way we do it
 # here is a workaround for the way bats handles failing processes.
 assert_fail() {
@@ -50,64 +54,122 @@ output_regex_match() {
 	return 1
 }
 
-# Probe the gpio-mockup kernel module. The routine expects a list of chip
-# sizes and optionally the 'named-lines' flag.
-gpio_mockup_probe() {
-	local CMDLINE="gpio_mockup_ranges="
+random_name() {
+	cat /proc/sys/kernel/random/uuid
+}
+
+gpiosim_chip() {
+	local VAR=$1
+	local NAME=$(random_name)
+	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+	local BANKPATH=$DEVPATH/$NAME
+
+	mkdir -p $BANKPATH
 
 	for ARG in $*
 	do
-		if [ $ARG = "named-lines" ]
+		local KEY=$(echo $ARG | cut -d"=" -f1)
+		local VAL=$(echo $ARG | cut -d"=" -f2)
+
+		if [ "$KEY" = "num_lines" ]
 		then
-			CMDLINE="gpio_mockup_named_lines $CMDLINE"
-			continue
+			echo $VAL > $BANKPATH/num_lines
+		elif [ "$KEY" = "line_name" ]
+		then
+			local OFFSET=$(echo $VAL | cut -d":" -f1)
+			local LINENAME=$(echo $VAL | cut -d":" -f2)
+			local LINEPATH=$BANKPATH/line$OFFSET
+
+			mkdir -p $LINEPATH
+			echo $LINENAME > $LINEPATH/name
 		fi
+	done
 
-		regex_matches "[0-9]+" "$ARG"
+	echo 1 > $DEVPATH/live
 
-		CMDLINE="$CMDLINE-1,$ARG,"
-	done
+	GPIOSIM_CHIPS="$VAR:$NAME $GPIOSIM_CHIPS"
+}
+
+gpiosim_chip_map_name() {
+	local VAR=$1
 
-	CMDLINE=${CMDLINE%?}
+	for CHIP in $GPIOSIM_CHIPS
+	do
+		KEY=$(echo $CHIP | cut -d":" -f1)
+		VAL=$(echo $CHIP | cut -d":" -f2)
 
-	modprobe gpio-mockup $CMDLINE
-	udevadm settle
+		if [ "$KEY" = "$VAR" ]
+		then
+			echo $VAL
+		fi
+	done
 }
 
-gpio_mockup_remove() {
-	if [ -d /sys/module/gpio_mockup ]
-	then
-		rmmod gpio-mockup
-	fi
+gpiosim_chip_name() {
+	local VAR=$1
+	local NAME=$(gpiosim_chip_map_name $VAR)
+
+	cat $GPIOSIM_CONFIGFS/$NAME/$NAME/chip_name
 }
 
-gpio_mockup_chip_name() {
-	local CHIPNUM=$1
+gpiosim_dev_name() {
+	local VAR=$1
+	local NAME=$(gpiosim_chip_map_name $VAR)
 
-	test -d /sys/devices/platform/gpio-mockup.$CHIPNUM/ || return 1
-	echo $(ls /sys/devices/platform/gpio-mockup.$CHIPNUM/ | grep gpiochip)
+	cat $GPIOSIM_CONFIGFS/$NAME/dev_name
 }
 
-gpio_mockup_set_pull() {
-	local CHIPNUM=$1
-	local LINE=$2
+gpiosim_set_pull() {
+	local VAR=$1
+	local OFFSET=$2
 	local PULL=$3
+	local DEVNAME=$(gpiosim_dev_name $VAR)
+	local CHIPNAME=$(gpiosim_chip_name $VAR)
 
-	FILE="/sys/kernel/debug/gpio-mockup/$(gpio_mockup_chip_name $CHIPNUM)/$LINE"
-	test -f $FILE || return 1
-	echo "$PULL" > $FILE
+	echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
 }
 
-gpio_mockup_check_value() {
-	local CHIPNUM=$1
-	local LINE=$2
+gpiosim_check_value() {
+	local VAR=$1
+	local OFFSET=$2
 	local EXPECTED=$3
+	local DEVNAME=$(gpiosim_dev_name $VAR)
+	local CHIPNAME=$(gpiosim_chip_name $VAR)
 
-	FILE="/sys/kernel/debug/gpio-mockup/$(gpio_mockup_chip_name $CHIPNUM)/$LINE"
-	test -f $FILE || return 1
+	VAL=$(cat $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
+	if [ "$VAL" = "$EXPECTED" ]
+	then
+		return 0
+	fi
 
-	VAL=$(cat $FILE)
-	test $VAL -eq $EXPECTED || return 1
+	return 1
+}
+
+gpiosim_cleanup() {
+	for CHIP in $GPIOSIM_CHIPS
+	do
+		local NAME=$(echo $CHIP | cut -d":" -f2)
+
+		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+		local BANKPATH=$DEVPATH/$NAME
+
+		echo 0 > $DEVPATH/live
+
+		ls $BANKPATH/line* 2> /dev/null
+		if [ "$?" = "0" ]
+		then
+			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
+			do
+				test -e $LINE/hog && rmdir $LINE/hog
+				rmdir $LINE
+			done
+		fi
+
+		rmdir $BANKPATH
+		rmdir $DEVPATH
+	done
+
+	GPIOSIM_CHIPS=""
 }
 
 run_tool() {
@@ -147,10 +209,6 @@ coproc_tool_wait() {
 	rm -f $COPROC_OUTPUT
 }
 
-setup() {
-	gpio_mockup_remove
-}
-
 teardown() {
 	if [ -n "$BG_PROC_PID" ]
 	then
@@ -159,7 +217,7 @@ teardown() {
 		BG_PROC_PID=""
 	fi
 
-	gpio_mockup_remove
+	gpiosim_cleanup
 }
 
 #
@@ -167,14 +225,16 @@ teardown() {
 #
 
 @test "gpiodetect: list chips" {
-	gpio_mockup_probe 4 8 16
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
 
 	run_tool gpiodetect
 
 	test "$status" -eq 0
-	output_contains_line "$(gpio_mockup_chip_name 0) [gpio-mockup-A] (4 lines)"
-	output_contains_line "$(gpio_mockup_chip_name 1) [gpio-mockup-B] (8 lines)"
-	output_contains_line "$(gpio_mockup_chip_name 2) [gpio-mockup-C] (16 lines)"
+	output_contains_line "$(gpiosim_chip_name sim0) [$(gpiosim_dev_name sim0)-node0] (4 lines)"
+	output_contains_line "$(gpiosim_chip_name sim1) [$(gpiosim_dev_name sim1)-node0] (8 lines)"
+	output_contains_line "$(gpiosim_chip_name sim2) [$(gpiosim_dev_name sim2)-node0] (16 lines)"
 }
 
 @test "gpiodetect: invalid args" {
@@ -187,28 +247,30 @@ teardown() {
 #
 
 @test "gpioinfo: dump all chips" {
-	gpio_mockup_probe 4 8
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
 
 	run_tool gpioinfo
 
 	test "$status" -eq 0
-	output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
-	output_contains_line "$(gpio_mockup_chip_name 1) - 8 lines:"
+	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
+	output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 }
 
 @test "gpioinfo: dump all chips with one line exported" {
-	gpio_mockup_probe 4 8
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
 
-	coproc_run_tool gpioset --mode=signal --active-low "$(gpio_mockup_chip_name 1)" 7=1
+	coproc_run_tool gpioset --mode=signal --active-low "$(gpiosim_chip_name sim1)" 7=1
 
 	run_tool gpioinfo
 
 	test "$status" -eq 0
-	output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
-	output_contains_line "$(gpio_mockup_chip_name 1) - 8 lines:"
+	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
+	output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+\\\"gpioset\\\"\\s+output\\s+active-low"
 
@@ -217,28 +279,32 @@ teardown() {
 }
 
 @test "gpioinfo: dump one chip" {
-	gpio_mockup_probe 8 4
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip sim1 num_lines=4
 
-	run_tool gpioinfo "$(gpio_mockup_chip_name 1)"
+	run_tool gpioinfo "$(gpiosim_chip_name sim1)"
 
 	test "$status" -eq 0
-	assert_fail output_contains_line "$(gpio_mockup_chip_name 0) - 8 lines:"
-	output_contains_line "$(gpio_mockup_chip_name 1) - 4 lines:"
+	assert_fail output_contains_line "$(gpiosim_chip_name sim0) - 8 lines:"
+	output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 	assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 }
 
 @test "gpioinfo: dump all but one chip" {
-	gpio_mockup_probe 4 4 8 4
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=4
+	gpiosim_chip sim2 num_lines=8
+	gpiosim_chip sim3 num_lines=4
 
-	run_tool gpioinfo "$(gpio_mockup_chip_name 0)" \
-			"$(gpio_mockup_chip_name 1)" "$(gpio_mockup_chip_name 3)"
+	run_tool gpioinfo "$(gpiosim_chip_name sim0)" \
+			"$(gpiosim_chip_name sim1)" "$(gpiosim_chip_name sim3)"
 
 	test "$status" -eq 0
-	output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
-	output_contains_line "$(gpio_mockup_chip_name 1) - 4 lines:"
-	assert_fail output_contains_line "$(gpio_mockup_chip_name 2) - 8 lines:"
-	output_contains_line "$(gpio_mockup_chip_name 3) - 4 lines:"
+	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
+	output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
+	assert_fail output_contains_line "$(gpiosim_chip_name sim2) - 8 lines:"
+	output_contains_line "$(gpiosim_chip_name sim3) - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 	assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 }
@@ -254,16 +320,20 @@ teardown() {
 #
 
 @test "gpiofind: line found" {
-	gpio_mockup_probe named-lines 4 8 16
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpiofind gpio-mockup-B-7
+	run_tool gpiofind foobar
 
 	test "$status" -eq "0"
-	test "$output" = "$(gpio_mockup_chip_name 1) 7"
+	test "$output" = "$(gpiosim_chip_name sim1) 7"
 }
 
 @test "gpiofind: line not found" {
-	gpio_mockup_probe named-lines 4 8 16
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
 
 	run_tool gpiofind nonexistent-line
 
@@ -280,69 +350,69 @@ teardown() {
 #
 
 @test "gpioget: read all lines" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 3 1
-	gpio_mockup_set_pull 1 5 1
-	gpio_mockup_set_pull 1 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
 
 	test "$status" -eq "0"
 	test "$output" = "0 0 1 1 0 1 0 1"
 }
 
 @test "gpioget: read all lines (active-low)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 3 1
-	gpio_mockup_set_pull 1 5 1
-	gpio_mockup_set_pull 1 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --active-low "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --active-low "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
 
 	test "$status" -eq "0"
 	test "$output" = "1 1 0 0 1 0 1 0"
 }
 
 @test "gpioget: read all lines (pull-up)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 3 1
-	gpio_mockup_set_pull 1 5 1
-	gpio_mockup_set_pull 1 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --bias=pull-up "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --bias=pull-up "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
 
 	test "$status" -eq "0"
 	test "$output" = "1 1 1 1 1 1 1 1"
 }
 
 @test "gpioget: read all lines (pull-down)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 3 1
-	gpio_mockup_set_pull 1 5 1
-	gpio_mockup_set_pull 1 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --bias=pull-down "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --bias=pull-down "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
 
 	test "$status" -eq "0"
 	test "$output" = "0 0 0 0 0 0 0 0"
 }
 
 @test "gpioget: read some lines" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 1 1
-	gpio_mockup_set_pull 1 4 1
-	gpio_mockup_set_pull 1 6 1
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 6 pull-up
 
-	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 4 6
+	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 4 6
 
 	test "$status" -eq "0"
 	test "$output" = "0 1 1 1"
@@ -356,36 +426,36 @@ teardown() {
 }
 
 @test "gpioget: no lines specified" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget "$(gpio_mockup_chip_name 1)"
+	run_tool gpioget "$(gpiosim_chip_name sim0)"
 
 	test "$status" -eq "1"
 	output_regex_match ".*at least one GPIO line offset must be specified"
 }
 
 @test "gpioget: too many lines specified" {
-	gpio_mockup_probe 4
+	gpiosim_chip sim0 num_lines=4
 
-	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4
+	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpioget: same line twice" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 0
+	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 0
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to request lines.*"
 }
 
 @test "gpioget: invalid bias" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
+	run_tool gpioget --bias=bad "$(gpiosim_chip_name sim0)" 0 1
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid bias.*"
@@ -396,19 +466,19 @@ teardown() {
 #
 
 @test "gpioset: set lines and wait for SIGTERM" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpioset --mode=signal "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" \
 					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 0 0
-	gpio_mockup_check_value 2 1 0
-	gpio_mockup_check_value 2 2 1
-	gpio_mockup_check_value 2 3 1
-	gpio_mockup_check_value 2 4 1
-	gpio_mockup_check_value 2 5 1
-	gpio_mockup_check_value 2 6 0
-	gpio_mockup_check_value 2 7 1
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_kill
 	coproc_tool_wait
@@ -417,19 +487,19 @@ teardown() {
 }
 
 @test "gpioset: set lines and wait for SIGTERM (active-low)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpioset --active-low --mode=signal "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --active-low --mode=signal "$(gpiosim_chip_name sim0)" \
 					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 0 1
-	gpio_mockup_check_value 2 1 1
-	gpio_mockup_check_value 2 2 0
-	gpio_mockup_check_value 2 3 0
-	gpio_mockup_check_value 2 4 0
-	gpio_mockup_check_value 2 5 0
-	gpio_mockup_check_value 2 6 1
-	gpio_mockup_check_value 2 7 0
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 5 0
+	gpiosim_check_value sim0 6 1
+	gpiosim_check_value sim0 7 0
 
 	coproc_tool_kill
 	coproc_tool_wait
@@ -438,19 +508,19 @@ teardown() {
 }
 
 @test "gpioset: set lines and wait for SIGTERM (push-pull)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpiosim_chip_name sim0)" \
 					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 0 0
-	gpio_mockup_check_value 2 1 0
-	gpio_mockup_check_value 2 2 1
-	gpio_mockup_check_value 2 3 1
-	gpio_mockup_check_value 2 4 1
-	gpio_mockup_check_value 2 5 1
-	gpio_mockup_check_value 2 6 0
-	gpio_mockup_check_value 2 7 1
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_kill
 	coproc_tool_wait
@@ -459,24 +529,24 @@ teardown() {
 }
 
 @test "gpioset: set lines and wait for SIGTERM (open-drain)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 2 2 1
-	gpio_mockup_set_pull 2 3 1
-	gpio_mockup_set_pull 2 5 1
-	gpio_mockup_set_pull 2 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpiosim_chip_name sim0)" \
 					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 0 0
-	gpio_mockup_check_value 2 1 0
-	gpio_mockup_check_value 2 2 1
-	gpio_mockup_check_value 2 3 1
-	gpio_mockup_check_value 2 4 0
-	gpio_mockup_check_value 2 5 1
-	gpio_mockup_check_value 2 6 0
-	gpio_mockup_check_value 2 7 1
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_kill
 	coproc_tool_wait
@@ -485,24 +555,24 @@ teardown() {
 }
 
 @test "gpioset: set lines and wait for SIGTERM (open-source)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 2 2 1
-	gpio_mockup_set_pull 2 3 1
-	gpio_mockup_set_pull 2 5 1
-	gpio_mockup_set_pull 2 7 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-	coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpiosim_chip_name sim0)" \
 					0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 0 0
-	gpio_mockup_check_value 2 1 0
-	gpio_mockup_check_value 2 2 1
-	gpio_mockup_check_value 2 3 1
-	gpio_mockup_check_value 2 4 1
-	gpio_mockup_check_value 2 5 1
-	gpio_mockup_check_value 2 6 0
-	gpio_mockup_check_value 2 7 1
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_kill
 	coproc_tool_wait
@@ -511,16 +581,16 @@ teardown() {
 }
 
 @test "gpioset: set some lines and wait for ENTER" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpioset --mode=wait "$(gpio_mockup_chip_name 2)" \
+	coproc_run_tool gpioset --mode=wait "$(gpiosim_chip_name sim0)" \
 					1=0 2=1 5=1 6=0 7=1
 
-	gpio_mockup_check_value 2 1 0
-	gpio_mockup_check_value 2 2 1
-	gpio_mockup_check_value 2 5 1
-	gpio_mockup_check_value 2 6 0
-	gpio_mockup_check_value 2 7 1
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_stdin_write ""
 	coproc_tool_wait
@@ -529,11 +599,11 @@ teardown() {
 }
 
 @test "gpioset: set some lines and wait for SIGINT" {
-	gpio_mockup_probe 8
+	gpiosim_chip sim0 num_lines=4
 
-	coproc_run_tool gpioset --mode=signal "$(gpio_mockup_chip_name 0)" 0=1
+	coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" 0=1
 
-	gpio_mockup_check_value 0 0 1
+	gpiosim_check_value sim0 0 1
 
 	coproc_tool_kill -SIGINT
 	coproc_tool_wait
@@ -542,14 +612,14 @@ teardown() {
 }
 
 @test "gpioset: set some lines and wait with --mode=time" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
 	coproc_run_tool gpioset --mode=time --sec=1 --usec=200000 \
-				"$(gpio_mockup_chip_name 1)" 0=1 5=0 7=1
+				"$(gpiosim_chip_name sim0)" 0=1 5=0 7=1
 
-	gpio_mockup_check_value 1 0 1
-	gpio_mockup_check_value 1 5 0
-	gpio_mockup_check_value 1 7 1
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 5 0
+	gpiosim_check_value sim0 7 1
 
 	coproc_tool_wait
 
@@ -564,107 +634,107 @@ teardown() {
 }
 
 @test "gpioset: no lines specified" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)"
+	run_tool gpioset "$(gpiosim_chip_name sim1)"
 
 	test "$status" -eq "1"
 	output_regex_match ".*at least one GPIO line offset to value mapping must be specified"
 }
 
 @test "gpioset: too many lines specified" {
-	gpio_mockup_probe 4
+	gpiosim_chip sim0 num_lines=4
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 1=1 2=1 3=1 4=1 5=1
+	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 1=1 2=1 3=1 4=1 5=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpioset: use --sec without --mode=time" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --mode=exit --sec=1 "$(gpio_mockup_chip_name 1)" 0=1
+	run_tool gpioset --mode=exit --sec=1 "$(gpiosim_chip_name sim0)" 0=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*can't specify wait time in this mode"
 }
 
 @test "gpioset: use --usec without --mode=time" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --mode=exit --usec=1 "$(gpio_mockup_chip_name 1)" 0=1
+	run_tool gpioset --mode=exit --usec=1 "$(gpiosim_chip_name sim1)" 0=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*can't specify wait time in this mode"
 }
 
 @test "gpioset: default mode" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1
+	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1
 
 	test "$status" -eq "0"
 }
 
 @test "gpioset: invalid mapping" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=c
+	run_tool gpioset "$(gpiosim_chip_name sim1)" 0=c
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid offset<->value mapping"
 }
 
 @test "gpioset: invalid value" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=3
+	run_tool gpioset "$(gpiosim_chip_name sim1)" 0=3
 
 	test "$status" -eq "1"
 	output_regex_match ".*value must be 0 or 1"
 }
 
 @test "gpioset: invalid offset" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 4000000000=0
+	run_tool gpioset "$(gpiosim_chip_name sim1)" 4000000000=0
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid offset"
 }
 
 @test "gpioset: invalid bias" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --bias=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
+	run_tool gpioset --bias=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid bias.*"
 }
 
 @test "gpioset: invalid drive" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --drive=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
+	run_tool gpioset --drive=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid drive.*"
 }
 
 @test "gpioset: daemonize in invalid mode" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --background "$(gpio_mockup_chip_name 1)" 0=1
+	run_tool gpioset --background "$(gpiosim_chip_name sim1)" 0=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*can't daemonize in this mode"
 }
 
 @test "gpioset: same line twice" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 0=1
+	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 0=1
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to request lines.*"
@@ -675,11 +745,11 @@ teardown() {
 #
 
 @test "gpiomon: single rising edge event" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --rising-edge "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --rising-edge "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -691,12 +761,12 @@ teardown() {
 }
 
 @test "gpiomon: single falling edge event" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --falling-edge "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --falling-edge "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
 
 	coproc_tool_kill
@@ -708,13 +778,13 @@ teardown() {
 }
 
 @test "gpiomon: single falling edge event (pull-up)" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 
-	coproc_run_tool gpiomon --bias=pull-up "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --bias=pull-up "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
 
 	coproc_tool_kill
@@ -726,13 +796,13 @@ teardown() {
 }
 
 @test "gpiomon: single rising edge event (pull-down)" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 
-	coproc_run_tool gpiomon --bias=pull-down "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --bias=pull-down "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -744,13 +814,13 @@ teardown() {
 }
 
 @test "gpiomon: single rising edge event (active-low)" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 
-	coproc_run_tool gpiomon --rising-edge --active-low "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --rising-edge --active-low "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
 
 	coproc_tool_kill
@@ -762,11 +832,11 @@ teardown() {
 }
 
 @test "gpiomon: single rising edge event (silent mode)" {
-	gpio_mockup_probe 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --rising-edge --silent "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --rising-edge --silent "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -777,17 +847,17 @@ teardown() {
 }
 
 @test "gpiomon: four alternating events" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --num-events=4 "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --num-events=4 "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
 
 	coproc_tool_wait
@@ -800,9 +870,9 @@ teardown() {
 }
 
 @test "gpiomon: exit after SIGINT" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
 
 	coproc_tool_kill -SIGINT
 	coproc_tool_wait
@@ -812,9 +882,9 @@ teardown() {
 }
 
 @test "gpiomon: exit after SIGTERM" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
 
 	coproc_tool_kill -SIGTERM
 	coproc_tool_wait
@@ -824,13 +894,13 @@ teardown() {
 }
 
 @test "gpiomon: both event flags" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --falling-edge --rising-edge "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon --falling-edge --rising-edge "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
-	gpio_mockup_set_pull 1 4 0
+	gpiosim_set_pull sim0 4 pull-down
 	sleep 0.2
 
 	coproc_tool_kill
@@ -844,13 +914,13 @@ teardown() {
 }
 
 @test "gpiomon: watch multiple lines" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --format=%o "$(gpio_mockup_chip_name 1)" 1 2 3 4 5
+	coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 1 2 3 4 5
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 3 1
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -863,13 +933,13 @@ teardown() {
 }
 
 @test "gpiomon: watch multiple lines (lines in mixed-up order)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --format=%o "$(gpio_mockup_chip_name 1)" 5 2 7 1 6
+	coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 5 2 7 1 6
 
-	gpio_mockup_set_pull 1 2 1
-	gpio_mockup_set_pull 1 1 1
-	gpio_mockup_set_pull 1 6 1
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 6 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -882,9 +952,9 @@ teardown() {
 }
 
 @test "gpiomon: same line twice" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon "$(gpio_mockup_chip_name 1)" 0 0
+	run_tool gpiomon "$(gpiosim_chip_name sim0)" 0 0
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to request GPIO lines for events"
@@ -898,38 +968,38 @@ teardown() {
 }
 
 @test "gpiomon: line not specified" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon "$(gpio_mockup_chip_name 1)"
+	run_tool gpiomon "$(gpiosim_chip_name sim0)"
 
 	test "$status" -eq "1"
 	output_regex_match ".*GPIO line offset must be specified"
 }
 
 @test "gpiomon: line out of range" {
-	gpio_mockup_probe 4
+	gpiosim_chip sim0 num_lines=4
 
-	run_tool gpiomon "$(gpio_mockup_chip_name 0)" 5
+	run_tool gpiomon "$(gpiosim_chip_name sim0)" 5
 
 	test "$status" -eq "1"
 	output_regex_match ".*unable to retrieve GPIO lines from chip"
 }
 
 @test "gpiomon: invalid bias" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
+	run_tool gpiomon --bias=bad "$(gpiosim_chip_name sim0)" 0 1
 
 	test "$status" -eq "1"
 	output_regex_match ".*invalid bias.*"
 }
 
 @test "gpiomon: custom format (event type + offset)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e %o" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%e %o" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -940,11 +1010,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (event type + offset joined)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e%o" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%e%o" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -955,11 +1025,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (timestamp)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e %o %s.%n" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%e %o %s.%n" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -970,11 +1040,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (double percent sign)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%%" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%%" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -985,11 +1055,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (double percent sign + event type specifier)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%%e" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%%e" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -1000,11 +1070,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (single percent sign)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -1015,11 +1085,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (single percent sign between other characters)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=foo % bar" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=foo % bar" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
@@ -1030,11 +1100,11 @@ teardown() {
 }
 
 @test "gpiomon: custom format (unknown specifier)" {
-	gpio_mockup_probe 8 8 8
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%x" "$(gpio_mockup_chip_name 1)" 4
+	coproc_run_tool gpiomon "--format=%x" "$(gpiosim_chip_name sim0)" 4
 
-	gpio_mockup_set_pull 1 4 1
+	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.2
 
 	coproc_tool_kill
-- 
2.30.1

