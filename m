Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17365FA94B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 02:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiJKA37 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 20:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiJKA36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 20:29:58 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57387BCAC
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:29:54 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c24so11769217plo.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FtI0vczcK+VAyPoucrCWMhk76wMtsH9s7c7c+qK8q8=;
        b=SdupSRStbe53qNosEpCf7VBT7xQeC2a2RWsSqiXycYaiMHalbvKMDXCCys86enIJSU
         /btrQ6+yPNZXNfBLXVdeplcEEDv4sfTD+VdxFjgMvlU8hcomv5hgQHSD+AbaphON8IzU
         K1yaNXmZqXPGog5XHGKvglsTj+G80MFdWgUQr/v5980eNuzdYkIXq39CzbqdNURi3zXr
         MLdUXQ1tV80DSY7KLB92ToaraSbzc+UP2etZGEjwYx4j0dnxZCSUaovRMG3cdoNsmsJk
         FrH4wjmluFyTXG/sAqcukeit6llHmaiBU6cpTZEEceVixgPgMIp1+xtDPbJgqbq0wl9I
         RM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FtI0vczcK+VAyPoucrCWMhk76wMtsH9s7c7c+qK8q8=;
        b=nal1efnpBtFWG4fUYWWADRaiimUssxNjDMjeGgdSEy6FlgGrqneSRHLo1LKjlHQCbE
         SoMs2I09IW8U9QcU8cavFjNMJBnl+8BFZxFOdxv+l3bMjq0JqcoWUbI+x+syvQaNXLPf
         4+jT5KXl1NCEchRFcoNEjMFtj6W3COUCj8jyddqvy1cBl501c8IG5bGFI+x96gzuKcKq
         zlkRX/iRPr8M06q34sHunjni42pECJbJnleY4wGFn877Bh9aC6P2UtNb5wg1gcVoGMNm
         +8MzjrjVu5EFOdosvM0fQ1M6lAulhDXNxHzAceM+5h6v/+Z74X9kB4g+QeuXUcqI1z/4
         MI+Q==
X-Gm-Message-State: ACrzQf3SShL7EKvRcjB90vtwezATlVoZEn0siO0sHuGP2pEM7UgewjZB
        jsjDoB0nzbwOX+/RQ4gpUZ6FF0tbDTI=
X-Google-Smtp-Source: AMsMyM6sM4YvuNm+qIKmL+E3VOWQ6BGH4i3iPA90vbF27hCRnwDOoMbtSTQt9ZhTdsfnX2m5WktAIA==
X-Received: by 2002:a17:902:7404:b0:17f:7fe6:7197 with SMTP id g4-20020a170902740400b0017f7fe67197mr21315634pll.94.1665448192688;
        Mon, 10 Oct 2022 17:29:52 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b005377c74c409sm7541351pfg.4.2022.10.10.17.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 17:29:52 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v3 3/5] tools: tests for line name focussed rework
Date:   Tue, 11 Oct 2022 08:29:07 +0800
Message-Id: <20221011002909.26987-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221011002909.26987-1-warthog618@gmail.com>
References: <20221011002909.26987-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rework the tools tests and expand to cover new functionality.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 2268 ++++++++++++++++++++++++++++++++++--
 2 files changed, 2183 insertions(+), 88 deletions(-)

diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 234f9bd..1a012dc 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -37,9 +37,6 @@ check_prog() {
 # Check all required non-coreutils tools
 check_prog bats
 check_prog modprobe
-check_prog rmmod
-check_prog udevadm
-check_prog timeout
 
 # Check if we're running a kernel at the required version or later
 check_kernel $MIN_KERNEL_VERSION
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index d200df1..6c12ffc 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -1,18 +1,24 @@
 #!/usr/bin/env bats
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 
 # Simple test harness for the gpio-tools.
 
-# Where output from coprocesses is stored
-COPROC_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
+# Where output from the dut is stored
+DUT_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
 # Save the PID of coprocess - otherwise we won't be able to wait for it
 # once it exits as the COPROC_PID will be cleared.
-COPROC_SAVED_PID=""
+DUT_PID=""
 
-GPIOSIM_CHIPS=""
-GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim/"
+# mappings from local name to system chip name, path, dev name
+# -g required for the associative arrays, cos BATS...
+declare -g -A GPIOSIM_CHIP_NAME
+declare -g -A GPIOSIM_CHIP_PATH
+declare -g -A GPIOSIM_DEV_NAME
+GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim"
 GPIOSIM_SYSFS="/sys/devices/platform/"
+GPIOSIM_APP_NAME="gpio-tools-test"
 
 # Run the command in $* and return 0 if the command failed. The way we do it
 # here is a workaround for the way bats handles failing processes.
@@ -23,10 +29,7 @@ assert_fail() {
 
 # Check if the string in $2 matches against the pattern in $1.
 regex_matches() {
-	local PATTERN=$1
-	local STRING=$2
-
-	[[ $STRING =~ $PATTERN ]]
+	[[ $2 =~ $1 ]] || (echo "Mismatched: \"$2\"" && false)
 }
 
 # Iterate over all lines in the output of the last command invoked with bats'
@@ -38,31 +41,39 @@ output_contains_line() {
 	do
 		test "$line" = "$LINE" && return 0
 	done
-
+	echo "Mismatched:"
+	echo "$output"
 	return 1
 }
 
+output_is() {
+	test "$output" = "$1" || (echo "Mismatched: \"$output\"" && false)
+}
+
+num_lines_is() {
+	test ${#lines[@]} -eq $1 || (echo "Num lines is: ${#lines[@]}" && false)
+}
+
+status_is() {
+	test "$status" -eq "$1"
+}
+
 # Same as above but match against the regex pattern in $1.
 output_regex_match() {
-	local PATTERN=$1
-
 	for line in "${lines[@]}"
 	do
-		regex_matches "$PATTERN" "$line" && return 0
+		[[ "$line" =~ $1 ]] && return 0
 	done
-
+	echo "Mismatched:"
+	echo "$output"
 	return 1
 }
 
-random_name() {
-	cat /proc/sys/kernel/random/uuid
-}
-
 gpiosim_chip() {
 	local VAR=$1
-	local NAME=$(random_name)
+	local NAME=${GPIOSIM_APP_NAME}-$$-${VAR}
 	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-	local BANKPATH=$DEVPATH/$NAME
+	local BANKPATH=$DEVPATH/bank0
 
 	mkdir -p $BANKPATH
 
@@ -87,75 +98,60 @@ gpiosim_chip() {
 
 	echo 1 > $DEVPATH/live
 
-	GPIOSIM_CHIPS="$VAR:$NAME $GPIOSIM_CHIPS"
+	local chip_name=$(<$BANKPATH/chip_name)
+	GPIOSIM_CHIP_NAME[$1]=$chip_name
+	GPIOSIM_CHIP_PATH[$1]="/dev/$chip_name"
+	GPIOSIM_DEV_NAME[$1]=$(<$DEVPATH/dev_name)
 }
 
-gpiosim_chip_map_name() {
-	local VAR=$1
-
-	for CHIP in $GPIOSIM_CHIPS
-	do
-		KEY=$(echo $CHIP | cut -d":" -f1)
-		VAL=$(echo $CHIP | cut -d":" -f2)
-
-		if [ "$KEY" = "$VAR" ]
-		then
-			echo $VAL
-		fi
-	done
+gpiosim_chip_number() {
+	local NAME=${GPIOSIM_CHIP_NAME[$1]}
+	echo ${NAME#"gpiochip"}
 }
 
-gpiosim_chip_name() {
-	local VAR=$1
-	local NAME=$(gpiosim_chip_map_name $VAR)
-
-	cat $GPIOSIM_CONFIGFS/$NAME/$NAME/chip_name
+gpiosim_chip_symlink() {
+	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
+	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
 }
 
-gpiosim_dev_name() {
-	local VAR=$1
-	local NAME=$(gpiosim_chip_map_name $VAR)
-
-	cat $GPIOSIM_CONFIGFS/$NAME/dev_name
+gpiosim_chip_symlink_cleanup() {
+	if [ -n "$GPIOSIM_CHIP_LINK" ]
+	then
+		rm "$GPIOSIM_CHIP_LINK"
+	fi
+	unset GPIOSIM_CHIP_LINK
 }
 
 gpiosim_set_pull() {
-	local VAR=$1
 	local OFFSET=$2
 	local PULL=$3
-	local DEVNAME=$(gpiosim_dev_name $VAR)
-	local CHIPNAME=$(gpiosim_chip_name $VAR)
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 
 	echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
 }
 
 gpiosim_check_value() {
-	local VAR=$1
 	local OFFSET=$2
 	local EXPECTED=$3
-	local DEVNAME=$(gpiosim_dev_name $VAR)
-	local CHIPNAME=$(gpiosim_chip_name $VAR)
-
-	VAL=$(cat $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
-	if [ "$VAL" = "$EXPECTED" ]
-	then
-		return 0
-	fi
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 
-	return 1
+	VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
+	[ "$VAL" = "$EXPECTED" ]
 }
 
 gpiosim_cleanup() {
-	for CHIP in $GPIOSIM_CHIPS
+	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
 	do
-		local NAME=$(echo $CHIP | cut -d":" -f2)
+		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
 
 		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-		local BANKPATH=$DEVPATH/$NAME
+		local BANKPATH=$DEVPATH/bank0
 
 		echo 0 > $DEVPATH/live
 
-		ls $BANKPATH/line* 2> /dev/null
+		ls $BANKPATH/line* > /dev/null 2>&1
 		if [ "$?" = "0" ]
 		then
 			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
@@ -169,7 +165,11 @@ gpiosim_cleanup() {
 		rmdir $DEVPATH
 	done
 
-	GPIOSIM_CHIPS=""
+	gpiosim_chip_symlink_cleanup
+
+	GPIOSIM_CHIP_NAME=()
+	GPIOSIM_CHIP_PATH=()
+	GPIOSIM_DEV_NAME=()
 }
 
 run_tool() {
@@ -178,45 +178,2143 @@ run_tool() {
 	run timeout 10s $BATS_TEST_DIRNAME/"$@"
 }
 
-coproc_run_tool() {
-	rm -f $BR_PROC_OUTPUT
-	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" > $COPROC_OUTPUT 2> $COPROC_OUTPUT
-	COPROC_SAVED_PID=$COPROC_PID
-	# FIXME We're giving the background process some time to get up, but really this
-	# should be more reliable...
+dut_run() {
+	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" 2>&1
+	DUT_PID=$COPROC_PID
+	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
+}
+
+dut_run_redirect() {
+	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" > $DUT_OUTPUT 2>&1
+	DUT_PID=$COPROC_PID
+	# give the process time to spin up
+	# FIXME - find a better solution
 	sleep 0.2
 }
 
-coproc_tool_stdin_write() {
+dut_read_redirect() {
+	output=$(<$DUT_OUTPUT)
+        local ORIG_IFS="$IFS"
+        IFS=$'\n' lines=($output)
+        IFS="$ORIG_IFS"
+}
+
+dut_read() {
+	local LINE
+	lines=()
+	while read -t 0.2 -u ${COPROC[0]} LINE;
+	do
+		if [ -n "$DUT_FIRST_CHAR" ]
+		then
+			LINE=${DUT_FIRST_CHAR}${LINE}
+			unset DUT_FIRST_CHAR
+		fi
+		lines+=("$LINE")
+	done
+	output="${lines[@]}"
+}
+
+dut_readable() {
+	read -t 0 -u ${COPROC[0]} LINE
+}
+
+dut_flush() {
+	local JUNK
+	lines=()
+	output=
+	unset DUT_FIRST_CHAR
+	while read -t 0 -u ${COPROC[0]} JUNK;
+	do
+		read -t 0.1 -u ${COPROC[0]} JUNK || true
+	done
+}
+
+# check the next line of output matches the regex
+dut_regex_match() {
+	PATTERN=$1
+
+	read -t 0.2 -u ${COPROC[0]} LINE || (echo Timeout && false)
+	if [ -n "$DUT_FIRST_CHAR" ]
+	then
+		LINE=${DUT_FIRST_CHAR}${LINE}
+		unset DUT_FIRST_CHAR
+	fi
+	[[ $LINE =~ $PATTERN ]] || (echo "Mismatched: \"$LINE\"" && false)
+}
+
+dut_write() {
 	echo $* >&${COPROC[1]}
 }
 
-coproc_tool_kill() {
+dut_kill() {
 	SIGNUM=$1
 
-	kill $SIGNUM $COPROC_SAVED_PID
+	kill $SIGNUM $DUT_PID
 }
 
-coproc_tool_wait() {
+dut_wait() {
 	status="0"
 	# A workaround for the way bats handles command failures.
-	wait $COPROC_SAVED_PID || export status=$?
+	wait $DUT_PID || export status=$?
 	test "$status" -ne 0 || export status="0"
-	output=$(cat $COPROC_OUTPUT)
-	local ORIG_IFS="$IFS"
-	IFS=$'\n' lines=($output)
-	IFS="$ORIG_IFS"
-	rm -f $COPROC_OUTPUT
+	unset DUT_PID
 }
 
-teardown() {
-	if [ -n "$BG_PROC_PID" ]
-	then
-		kill -9 $BG_PROC_PID
-		run wait $BG_PROC_PID
-		BG_PROC_PID=""
-	fi
+dut_cleanup() {
+        if [ -n "$DUT_PID" ]
+        then
+		kill -SIGTERM $DUT_PID
+		wait $DUT_PID || false
+        fi
+        rm -f $DUT_OUTPUT
+}
 
+teardown() {
+	dut_cleanup
 	gpiosim_cleanup
 }
 
+request_release_line() {
+	$BATS_TEST_DIRNAME/gpioget -c $* >/dev/null
+}
+
+#
+# gpiodetect test cases
+#
+
+@test "gpiodetect: all chips" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_tool gpiodetect
+
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	status_is 0
+
+	# ignoring symlinks
+	local initial_output=$output
+	gpiosim_chip_symlink sim1 /dev
+
+	run_tool gpiodetect
+
+	output_is "$initial_output"
+	status_is 0
+}
+
+@test "gpiodetect: a chip" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	# by name
+	run_tool gpiodetect $sim0
+
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	num_lines_is 1
+	status_is 0
+
+	# by path
+	run_tool gpiodetect ${GPIOSIM_CHIP_PATH[sim1]}
+
+	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	num_lines_is 1
+	status_is 0
+
+	# by number
+	run_tool gpiodetect $(gpiosim_chip_number sim2)
+
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	num_lines_is 1
+	status_is 0
+
+	# by symlink
+	gpiosim_chip_symlink sim2 .
+	run_tool gpiodetect $GPIOSIM_CHIP_LINK
+
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	num_lines_is 1
+	status_is 0
+}
+
+@test "gpiodetect: multiple chips" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_tool gpiodetect $sim0 $sim1 $sim2
+
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	num_lines_is 3
+	status_is 0
+}
+
+@test "gpiodetect: with nonexistent chip" {
+	run_tool gpiodetect nonexistent-chip
+
+	status_is 1
+	output_regex_match \
+".*cannot find GPIO chip character device 'nonexistent-chip'"
+}
+
+#
+# gpioinfo test cases
+#
+
+@test "gpioinfo: all chips" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+
+	run_tool gpioinfo
+
+    echo "$output"
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+input"
+	status_is 0
+
+	# ignoring symlinks
+	local initial_output=$output
+	gpiosim_chip_symlink sim1 /dev
+
+	run_tool gpioinfo
+
+	output_is "$initial_output"
+	status_is 0
+}
+
+@test "gpioinfo: all chips with some used lines" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
+
+	dut_run gpioset -i --active-low foo=1 baz=0
+
+	run_tool gpioinfo
+
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match \
+"\\s+line\\s+1:\\s+foo\\s+output active-low consumer=gpioset"
+	output_regex_match \
+"\\s+line\\s+3:\\s+baz\\s+output active-low consumer=gpioset"
+	status_is 0
+}
+
+@test "gpioinfo: a chip" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip sim1 num_lines=4
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# by name
+	run_tool gpioinfo --chip $sim1
+
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+input"
+	num_lines_is 5
+	status_is 0
+
+	# by path
+	run_tool gpioinfo --chip $sim1
+
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+input"
+	num_lines_is 5
+	status_is 0
+
+	# by number
+	run_tool gpioinfo --chip $sim1
+
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+input"
+	num_lines_is 5
+	status_is 0
+
+	# by symlink
+	gpiosim_chip_symlink sim1 .
+	run_tool gpioinfo --chip $GPIOSIM_CHIP_LINK
+
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+input"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+input"
+	num_lines_is 5
+	status_is 0
+}
+
+@test "gpioinfo: a line" {
+	gpiosim_chip sim0 num_lines=8 line_name=5:bar
+	gpiosim_chip sim1 num_lines=4 line_name=2:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# by offset
+	run_tool gpioinfo --chip $sim1 2
+
+	output_regex_match "$sim1 2\\s+bar\\s+input"
+	num_lines_is 1
+	status_is 0
+
+	# by name
+	run_tool gpioinfo bar
+
+	output_regex_match "$sim0 5\\s+bar\\s+input"
+	num_lines_is 1
+	status_is 0
+
+	# by chip and name
+	run_tool gpioinfo --chip $sim1 2
+
+	output_regex_match "$sim1 2\\s+bar\\s+input"
+	num_lines_is 1
+	status_is 0
+}
+
+@test "gpioinfo: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioinfo foobar
+
+	output_regex_match "$sim0 3\\s+foobar\\s+input"
+	num_lines_is 1
+	status_is 0
+}
+
+@test "gpioinfo: multiple lines" {
+	gpiosim_chip sim0 num_lines=8 line_name=5:bar
+	gpiosim_chip sim1 num_lines=4 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# by offset
+	run_tool gpioinfo --chip $sim1 1 2
+
+	output_regex_match "$sim1 1\\s+unnamed\\s+input"
+	output_regex_match "$sim1 2\\s+baz\\s+input"
+	num_lines_is 2
+	status_is 0
+
+	# by name
+	run_tool gpioinfo bar baz
+
+	output_regex_match "$sim0 5\\s+bar\\s+input"
+	output_regex_match "$sim1 2\\s+baz\\s+input"
+	num_lines_is 2
+	status_is 0
+
+	# by name and offset
+	run_tool gpioinfo --chip $sim0 bar 3
+
+	output_regex_match "$sim0 5\\s+bar\\s+input"
+	output_regex_match "$sim0 3\\s+unnamed\\s+input"
+	num_lines_is 2
+	status_is 0
+}
+
+@test "gpioinfo: line attribute menagerie" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpioset -i --active-low --bias=pull-up --drive=open-source foo=1 baz=0
+
+	run_tool gpioinfo foo baz
+
+	output_regex_match \
+"$sim0 1\\s+foo\\s+output active-low drive=open-source bias=pull-up consumer=gpioset"
+	output_regex_match \
+"$sim1 3\\s+baz\\s+output active-low drive=open-source bias=pull-up consumer=gpioset"
+	num_lines_is 2
+	status_is 0
+
+	dut_kill
+	dut_wait
+
+	dut_run gpioset -i --bias=pull-down --drive=open-drain foo=1 baz=0
+
+	run_tool gpioinfo foo baz
+
+	output_regex_match \
+"$sim0 1\\s+foo\\s+output drive=open-drain bias=pull-down consumer=gpioset"
+	output_regex_match \
+"$sim1 3\\s+baz\\s+output drive=open-drain bias=pull-down consumer=gpioset"
+	num_lines_is 2
+	status_is 0
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --bias=disabled --utc -p 10ms foo baz
+
+	run_tool gpioinfo foo baz
+
+	output_regex_match \
+"$sim0 1\\s+foo\\s+input bias=disabled edges=both event-clock=realtime debounce-period=10ms consumer=gpiomon"
+	output_regex_match \
+"$sim1 3\\s+baz\\s+input bias=disabled edges=both event-clock=realtime debounce-period=10ms consumer=gpiomon"
+	num_lines_is 2
+	status_is 0
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --edges=rising --localtime foo baz
+
+	run_tool gpioinfo foo baz
+
+	output_regex_match \
+"$sim0 1\\s+foo\\s+input edges=rising event-clock=realtime consumer=gpiomon"
+	output_regex_match \
+"$sim1 3\\s+baz\\s+input edges=rising event-clock=realtime consumer=gpiomon"
+	num_lines_is 2
+	status_is 0
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --edges=falling foo baz
+
+	run_tool gpioinfo foo baz
+
+	output_regex_match \
+"$sim0 1\\s+foo\\s+input edges=falling consumer=gpiomon"
+	output_regex_match \
+"$sim1 3\\s+baz\\s+input edges=falling consumer=gpiomon"
+	num_lines_is 2
+	status_is 0
+}
+
+@test "gpioinfo: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpioinfo --chip $sim0 1 1
+
+	output_regex_match "$sim0 1\\s+foo\\s+input"
+	output_regex_match ".*lines '1' and '1' are the same line"
+	num_lines_is 2
+	status_is 1
+
+	# by name
+	run_tool gpioinfo foo foo
+
+	output_regex_match "$sim0 1\\s+foo\\s+input"
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	num_lines_is 2
+	status_is 1
+
+	# by name and offset
+	run_tool gpioinfo --chip $sim0 foo 1
+
+	output_regex_match "$sim0 1\\s+foo\\s+input"
+	output_regex_match ".*lines 'foo' and '1' are the same line"
+	num_lines_is 2
+	status_is 1
+}
+
+@test "gpioinfo: all lines matching name" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_tool gpioinfo --strict foobar
+
+	output_regex_match "$sim0 3\\s+foobar\\s+input"
+	output_regex_match "$sim1 2\\s+foobar\\s+input"
+	output_regex_match "$sim1 7\\s+foobar\\s+input"
+	num_lines_is 3
+	status_is 1
+}
+
+@test "gpioinfo: with lines strictly by name" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# first by offset (to show offsets match first)
+	run_tool gpioinfo --chip $sim0 1 6
+
+	output_regex_match "$sim0 1\\s+6\\s+input"
+	output_regex_match "$sim0 6\\s+1\\s+input"
+	num_lines_is 2
+	status_is 0
+
+	# then strictly by name
+	run_tool gpioinfo --by-name --chip $sim0 1
+
+	output_regex_match "$sim0 6\\s+1\\s+input"
+	num_lines_is 1
+	status_is 0
+}
+
+@test "gpioinfo: with nonexistent chip" {
+	run_tool gpioinfo --chip nonexistent-chip
+
+	output_regex_match \
+".*cannot find GPIO chip character device 'nonexistent-chip'"
+	status_is 1
+}
+
+@test "gpioinfo: with nonexistent line" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioinfo nonexistent-line
+
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+	status_is 1
+
+	run_tool gpioinfo --chip ${GPIOSIM_CHIP_NAME[sim0]} nonexistent-line
+
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+	status_is 1
+}
+
+@test "gpioinfo: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioinfo --chip $sim0 0 1 2 3 4 5
+
+	output_regex_match "$sim0 0\\s+unnamed\\s+input"
+	output_regex_match "$sim0 1\\s+unnamed\\s+input"
+	output_regex_match "$sim0 2\\s+unnamed\\s+input"
+	output_regex_match "$sim0 3\\s+unnamed\\s+input"
+	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	num_lines_is 6
+	status_is 1
+}
+
+#
+# gpioget test cases
+#
+
+@test "gpioget: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_tool gpioget foo
+
+	output_is "foo=active"
+	status_is 0
+}
+
+@test "gpioget: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
+
+	output_is "1=active"
+	status_is 0
+}
+
+@test "gpioget: by symlink" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip_symlink sim0 .
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_tool gpioget --chip $GPIOSIM_CHIP_LINK 1
+
+	output_is "1=active"
+	status_is 0
+}
+
+@test "gpioget: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:foo
+
+	gpiosim_set_pull sim1 3 pull-up
+
+	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
+
+	output_is "foo=active"
+	status_is 0
+}
+
+@test "gpioget: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar line_name=7:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz
+	gpiosim_chip sim2 num_lines=16
+
+	gpiosim_set_pull sim0 3 pull-up
+
+	run_tool gpioget foobar
+
+	output_is "foobar=active"
+	status_is 0
+}
+
+@test "gpioget: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1 2 3 4 5 6 7
+
+	output_is \
+"0=inactive 1=inactive 2=active 3=active 4=inactive 5=active 6=inactive 7=active"
+	status_is 0
+}
+
+@test "gpioget: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=6:bar
+	gpiosim_chip sim1 num_lines=8 line_name=1:baz line_name=3:bar
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 6 pull-up
+
+	run_tool gpioget --chip $sim0 0 foo 4 bar
+
+	output_is "0=inactive foo=active 4=active bar=active"
+	status_is 0
+}
+
+@test "gpioget: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim1 4 pull-up
+
+	run_tool gpioget baz bar foo xyz
+
+	output_is "baz=inactive bar=inactive foo=active xyz=active"
+	status_is 0
+}
+
+@test "gpioget: with numeric values" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioget --numeric --chip $sim0 0 1 2 3 4 5 6 7
+
+	output_is "0 0 1 1 0 1 0 1"
+	status_is 0
+}
+
+@test "gpioget: with active-low" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioget --active-low --chip $sim0 0 1 2 3 4 5 6 7
+
+	output_is \
+"0=active 1=active 2=inactive 3=inactive 4=active 5=inactive 6=active 7=inactive"
+	status_is 0
+}
+
+@test "gpioget: with pull-up" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioget --bias=pull-up --chip $sim0 0 1 2 3 4 5 6 7
+
+	output_is \
+"0=active 1=active 2=active 3=active 4=active 5=active 6=active 7=active"
+	status_is 0
+}
+
+@test "gpioget: with pull-down" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioget --bias=pull-down --chip $sim0 0 1 2 3 4 5 6 7
+
+	output_is \
+"0=inactive 1=inactive 2=inactive 3=inactive 4=inactive 5=inactive 6=inactive 7=inactive"
+	status_is 0
+}
+
+@test "gpioget: with direction as-is" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# flip to output
+	run_tool gpioset foo=1
+
+	status_is 0
+
+	run_tool gpioinfo foo
+	output_regex_match "$sim0 1\\s+foo\\s+output"
+	status_is 0
+
+	run_tool gpioget --as-is foo
+	# note gpio-sim reverts line to its pull when released
+	output_is "foo=inactive"
+	status_is 0
+
+	run_tool gpioinfo foo
+	output_regex_match "$sim0 1\\s+foo\\s+output"
+	status_is 0
+
+	# whereas the default behaviour forces to input
+	run_tool gpioget foo
+	# note gpio-sim reverts line to its pull when released
+	# (defaults to pull-down)
+	output_is "foo=inactive"
+	status_is 0
+
+	run_tool gpioinfo foo
+	output_regex_match "$sim0 1\\s+foo\\s+input"
+	status_is 0
+}
+
+@test "gpioget: with hold-period" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	# only test parsing - testing the hold-period itself is tricky
+	run_tool gpioget --hold-period=100ms foo
+	output_is "foo=inactive"
+	status_is 0
+}
+
+@test "gpioget: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpioget --strict foobar
+
+	output_regex_match ".*line 'foobar' is not unique"
+	status_is 1
+}
+
+@test "gpioget: with lines by offset" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 6 pull-down
+
+	# first by offset
+	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+
+	output_is "1=active 6=inactive"
+	status_is 0
+}
+
+@test "gpioget: with lines strictly by name" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 6 pull-down
+
+	run_tool gpioget --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+
+	output_is "1=inactive 6=active"
+	status_is 0
+}
+
+@test "gpioget: with no arguments" {
+	run_tool gpioget
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpioget: with chip but no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpioget: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioget --chip $sim0 0 1 2 3 4 5
+
+	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	status_is 1
+}
+
+@test "gpioget: with nonexistent line" {
+	run_tool gpioget nonexistent-line
+
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+	status_is 1
+}
+
+@test "gpioget: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpioget --chip $sim0 0 0
+
+	output_regex_match ".*lines '0' and '0' are the same line"
+	status_is 1
+
+	# by name
+	run_tool gpioget foo foo
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	status_is 1
+
+	# by chip and name
+	run_tool gpioget --chip $sim0 foo foo
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	status_is 1
+
+	# by name and offset
+	run_tool gpioget --chip $sim0 foo 1
+
+	output_regex_match ".*lines 'foo' and '1' are the same line"
+	status_is 1
+
+	# by offset and name
+	run_tool gpioget --chip $sim0 1 foo
+
+	output_regex_match ".*lines '1' and 'foo' are the same line"
+	status_is 1
+}
+
+@test "gpioget: with invalid bias" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1
+
+	output_regex_match ".*invalid bias.*"
+	status_is 1
+}
+
+@test "gpioget: with invalid hold-period" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --hold-period=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0
+
+	output_regex_match ".*invalid period.*"
+	status_is 1
+}
+
+#
+# gpioset test cases
+#
+
+@test "gpioset: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	dut_run gpioset -i foo=1
+
+	gpiosim_check_value sim0 1 1
+}
+
+@test "gpioset: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	dut_run gpioset -i --chip ${GPIOSIM_CHIP_NAME[sim0]} 1=1
+
+	gpiosim_check_value sim0 1 1
+}
+
+@test "gpioset: by symlink" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip_symlink sim0 .
+
+	dut_run gpioset -i --chip $GPIOSIM_CHIP_LINK 1=1
+
+	gpiosim_check_value sim0 1 1
+}
+
+@test "gpioset: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:foo
+
+	dut_run gpioset -i --chip ${GPIOSIM_CHIP_NAME[sim1]} foo=1
+
+	gpiosim_check_value sim1 3 1
+}
+
+@test "gpioset: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpioset -i foobar=1
+
+	gpiosim_check_value sim0 3 1
+}
+
+@test "gpioset: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --chip $sim0 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	dut_run gpioset -i --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 foo=1 bar=1 3=1
+
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+}
+
+
+@test "gpioset: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+
+	dut_run gpioset -i foo=1 bar=1 baz=1 xyz=1
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim1 0 1
+	gpiosim_check_value sim1 4 1
+}
+
+@test "gpioset: with active-low" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --active-low -c $sim0 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 0
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 5 0
+	gpiosim_check_value sim0 6 1
+	gpiosim_check_value sim0 7 0
+}
+
+@test "gpioset: with push-pull" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --drive=push-pull --chip $sim0 \
+		0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with open-drain" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	dut_run gpioset -i --drive=open-drain --chip $sim0 \
+		0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with open-source" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --drive=open-source --chip $sim0 \
+		0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with pull-up" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --bias=pull-up --drive=open-drain \
+		--chip $sim0 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with pull-down" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset -i --bias=pull-down --drive=open-source \
+		--chip $sim0 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with value variants" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 0 pull-up
+	gpiosim_set_pull sim0 1 pull-down
+	gpiosim_set_pull sim0 2 pull-down
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 6 pull-up
+	gpiosim_set_pull sim0 7 pull-down
+
+	dut_run gpioset -i --chip $sim0	0=0 1=1 2=active \
+		3=inactive 4=on 5=off 6=false 7=true
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 0
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+}
+
+@test "gpioset: with hold-period" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 5 pull-up
+
+	# redirect as no startup output for dut_run
+	dut_run_redirect gpioset --hold-period=1200ms --chip $sim0 0=1 5=0 7=1
+
+	gpiosim_check_value sim0 0 1
+	gpiosim_check_value sim0 5 0
+	gpiosim_check_value sim0 7 1
+
+	dut_wait
+
+	status_is 0
+}
+
+@test "gpioset: interactive exit" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpioset --interactive --chip $sim0 1=0 2=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
+
+	dut_write "exit"
+	dut_wait
+
+	status_is 0
+}
+
+@test "gpioset: interactive help" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+
+	dut_write "help"
+
+	dut_read
+	output_regex_match "COMMANDS:.*"
+	output_regex_match ".*get \[line\]\.\.\..*"
+	output_regex_match ".*set <line=value>\.\.\..*"
+	output_regex_match ".*toggle \[line\]\.\.\..*"
+	output_regex_match ".*sleep <period>.*"
+}
+
+@test "gpioset: interactive get" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+
+	dut_write "get"
+
+	dut_read
+	output_regex_match "foo=active bar=inactive baz=inactive"
+
+	dut_write "get bar"
+
+	dut_read
+	output_regex_match "bar=inactive"
+}
+
+@test "gpioset: interactive set" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+
+	dut_write "set bar=active"
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 0
+	dut_write "get"
+	dut_read
+	output_regex_match "foo=active bar=active baz=inactive"
+}
+
+@test "gpioset: interactive toggle" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+
+	dut_write "toggle"
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 1
+	dut_write "get"
+	dut_read
+	output_regex_match "foo=inactive\\s+bar=active\\s+baz=active\\s*"
+
+	dut_write "toggle baz"
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 0
+	dut_write "get"
+	dut_read
+	output_regex_match "foo=inactive\\s+bar=active\\s+baz=inactive\\s*"
+}
+
+@test "gpioset: interactive sleep" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
+
+	dut_write "sleep 500ms"
+	dut_flush
+
+	assert_fail dut_readable
+
+	sleep 1
+
+	# prompt, but not a full line...
+	dut_readable
+}
+
+@test "gpioset: toggle (continuous)" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	# redirect as gpioset has no banner
+	dut_run_redirect gpioset --toggle 1s foo=1 bar=0 baz=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+
+	sleep 1
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 1
+
+	sleep 1
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
+}
+
+@test "gpioset: toggle (terminated)" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	# redirect as gpioset has no banner
+	# hold-period to allow test to sample before gpioset exits
+	dut_run_redirect gpioset --toggle 1s,0 -p 600ms foo=1 bar=0 baz=1
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 1
+
+	sleep 1
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 0
+
+	dut_wait
+
+	status_is 0
+}
+
+@test "gpioset: with invalid toggle period" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
+				      line_name=7:baz
+
+	run_tool gpioset --toggle 1ns foo=1 bar=0 baz=0
+
+	output_regex_match ".*invalid period.*"
+	status_is 1
+}
+
+@test "gpioset: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpioset --strict foobar=active
+
+	output_regex_match ".*line 'foobar' is not unique"
+	status_is 1
+}
+
+@test "gpioset: with lines by offset" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	gpiosim_set_pull sim0 1 pull-down
+	gpiosim_set_pull sim0 6 pull-up
+
+	dut_run gpioset -i --chip ${GPIOSIM_CHIP_NAME[sim0]} 6=1 1=0
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 6 1
+}
+
+@test "gpioset: with lines strictly by name" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	gpiosim_set_pull sim0 1 pull-down
+	gpiosim_set_pull sim0 6 pull-up
+
+	dut_run gpioset -i --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 6=1 1=0
+
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 6 0
+}
+
+@test "gpioset: interactive after SIGINT" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	dut_run gpioset -i foo=1
+
+	dut_kill -SIGINT
+	dut_wait
+
+	status_is 130
+}
+
+@test "gpioset: interactive after SIGTERM" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	dut_run gpioset -i foo=1
+
+	dut_kill -SIGTERM
+	dut_wait
+
+	status_is 143
+}
+
+@test "gpioset: with no arguments" {
+	run_tool gpioset
+
+	status_is 1
+	output_regex_match ".*at least one GPIO line value must be specified"
+}
+
+@test "gpioset: with chip but no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	output_regex_match ".*at least one GPIO line value must be specified"
+	status_is 1
+}
+
+@test "gpioset: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioset --chip $sim0 0=1 1=1 2=1 3=1 4=1 5=1
+
+	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	status_is 1
+}
+
+@test "gpioset: with invalid hold-period" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioset --hold-period=bad --chip $sim0 0=1
+
+	output_regex_match ".*invalid period.*"
+	status_is 1
+}
+
+@test "gpioset: with invalid value" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by name
+	run_tool gpioset --chip $sim0 0=c
+
+	output_regex_match ".*invalid line value.*"
+	status_is 1
+
+	# by value
+	run_tool gpioset --chip $sim0 0=3
+
+	output_regex_match ".*invalid line value.*"
+	status_is 1
+}
+
+@test "gpioset: with invalid offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]} 4000000000=0
+
+	output_regex_match ".*cannot find line '4000000000'"
+	status_is 1
+}
+
+@test "gpioset: with invalid bias" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioset --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+
+	output_regex_match ".*invalid bias.*"
+	status_is 1
+}
+
+@test "gpioset: with invalid drive" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioset --drive=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+
+	output_regex_match ".*invalid drive.*"
+	status_is 1
+}
+
+@test "gpioset: with daemonize and interactive" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioset --interactive --daemonize --chip $sim0 0=1
+
+	output_regex_match ".*can't combine daemonize with interactive"
+	status_is 1
+}
+
+@test "gpioset: with interactive and toggle" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpioset --interactive --toggle 1s --chip $sim0 0=1
+
+	output_regex_match ".*can't combine interactive with toggle"
+	status_is 1
+}
+
+@test "gpioset: with nonexistent line" {
+	run_tool gpioset nonexistent-line=0
+
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+	status_is 1
+}
+
+@test "gpioset: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpioset --chip $sim0 0=1 0=1
+
+	output_regex_match ".*lines '0' and '0' are the same line"
+	status_is 1
+
+	# by name
+	run_tool gpioset --chip $sim0 foo=1 foo=1
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	status_is 1
+
+	# by name and offset
+	run_tool gpioset --chip $sim0 foo=1 1=1
+
+	output_regex_match ".*lines 'foo' and '1' are the same line"
+	status_is 1
+
+	# by offset and name
+	run_tool gpioset --chip $sim0 1=1 foo=1
+
+	output_regex_match ".*lines '1' and 'foo' are the same line"
+	status_is 1
+}
+
+#
+# gpiomon test cases
+#
+
+@test "gpiomon: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --edges=rising foo
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+foo"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --edges=rising --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: by symlink" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip_symlink sim0 .
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --edges=rising --chip $GPIOSIM_CHIP_LINK 4
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0\\s+4"
+	assert_fail dut_readable
+}
+
+
+@test "gpiomon: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=0:foo
+	gpiosim_chip sim1 num_lines=8 line_name=2:foo
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	gpiosim_set_pull sim1 0 pull-up
+
+	dut_run gpiomon --banner --edges=rising --chip $sim1 foo
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim1 2 pull-down
+	gpiosim_set_pull sim1 2 pull-up
+	gpiosim_set_pull sim1 2 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim1 2 foo"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpiomon --banner foobar
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+foobar"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: rising edge" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --edges=rising --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: falling edge" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-down
+
+	dut_run gpiomon --banner --edges=falling --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: both edges" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --edges=both --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4"
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4"
+}
+
+@test "gpiomon: with pull-up" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-down
+
+	dut_run gpiomon --banner --bias=pull-up --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with pull-down" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --bias=pull-down --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with active-low" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --active-low --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4"
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with quiet mode" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --edges=rising --quiet --chip $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with num-events" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# redirect, as gpiomon exits after 4 events
+	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
+
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+
+	dut_wait
+	status_is 0
+	dut_read_redirect
+
+	regex_matches "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4" "${lines[0]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4" "${lines[1]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 4" "${lines[2]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 4" "${lines[3]}"
+	num_lines_is 4
+}
+
+@test "gpiomon: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --format=%o --chip $sim0 1 3 2 5 4
+	dut_regex_match "Monitoring lines .*"
+
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "2"
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "3"
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "4"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --format=%o --chip $sim0 foo bar 3
+	dut_regex_match "Monitoring lines .*"
+
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "2"
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "3"
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "1"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+
+	dut_run gpiomon --banner --format=%l foo bar baz
+	dut_regex_match "Monitoring lines .*"
+
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "bar"
+	gpiosim_set_pull sim1 0 pull-up
+	dut_regex_match "baz"
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "foo"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: exit after SIGINT" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
+
+	dut_kill -SIGINT
+	dut_wait
+
+	status_is 130
+}
+
+@test "gpiomon: exit after SIGTERM" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
+
+	dut_kill -SIGTERM
+	dut_wait
+
+	status_is 143
+}
+
+@test "gpiomon: with nonexistent line" {
+	run_tool gpiomon nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+}
+
+@test "gpiomon: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpiomon --chip $sim0 0 0
+
+	output_regex_match ".*lines '0' and '0' are the same line"
+	status_is 1
+
+	# by name
+	run_tool gpiomon foo foo
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	status_is 1
+
+	# by name and offset
+	run_tool gpiomon --chip $sim0 1 foo
+
+	output_regex_match ".*lines '1' and 'foo' are the same line"
+	status_is 1
+}
+
+@test "gpiomon: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpiomon --strict foobar
+
+	output_regex_match ".*line 'foobar' is not unique"
+	status_is 1
+}
+@test "gpiomon: with lines by offset" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_run gpiomon --banner --chip $sim0 6 1
+	dut_flush
+
+	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 1"
+
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 1"
+
+	gpiosim_set_pull sim0 6 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 6"
+
+	gpiosim_set_pull sim0 6 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 6"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with lines strictly by name" {
+	# not suggesting this setup makes sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_run gpiomon --banner --by-name --chip $sim0 42 13
+	dut_flush
+
+	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 1"
+
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 1"
+
+	gpiosim_set_pull sim0 6 pull-up
+	dut_regex_match "[0-9]+\.[0-9]+\\s+rising\\s+$sim0 6"
+
+	gpiosim_set_pull sim0 6 pull-down
+	dut_regex_match "[0-9]+\.[0-9]+\\s+falling\\s+$sim0 6"
+
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with no arguments" {
+	run_tool gpiomon
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpiomon: with no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpiomon --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpiomon: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiomon --chip $sim0 5
+
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	status_is 1
+}
+
+@test "gpiomon: with invalid bias" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiomon --bias=bad -c $sim0 0 1
+
+	output_regex_match ".*invalid bias.*"
+	status_is 1
+}
+
+@test "gpiomon: with custom format (event type + offset)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%e %o" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "1 4"
+}
+
+@test "gpiomon: with custom format (event type + offset joined)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%e%o" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "14"
+}
+
+@test "gpiomon: with custom format (edge, chip and line)" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%e %o %E %c %l" -c $sim0 baz
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "1 4 rising $sim0 baz"
+}
+
+@test "gpiomon: with custom format (seconds timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%e %o %S" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
+}
+
+@test "gpiomon: with custom format (UTC timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%U %e %o " --event-clock=realtime \
+		-c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 1 4"
+}
+
+@test "gpiomon: with custom format (localtime timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%L %e %o" --event-clock=realtime \
+		-c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 1 4"
+}
+
+@test "gpiomon: with custom format (double percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=start%%end" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "start%end"
+}
+
+@test "gpiomon: with custom format (double percent sign + event type specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%%e" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "%e"
+}
+
+@test "gpiomon: with custom format (single percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "%"
+}
+
+@test "gpiomon: with custom format (single percent sign between other characters)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=foo % bar" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "foo % bar"
+}
+
+@test "gpiomon: with custom format (unknown specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --banner "--format=%x" -c $sim0 4
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_read
+	output_is "%x"
+}
-- 
2.38.0

