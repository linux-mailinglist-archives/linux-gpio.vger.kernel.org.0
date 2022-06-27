Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15FA55D6D8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236205AbiF0Nq1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 09:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236198AbiF0Nq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 09:46:27 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3E260EA
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so9510779pjz.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SlxC864YjLEO+7q+J8Vszr1QsnSVh5+m7jx8BJGts7g=;
        b=RPRNrGAgHBXs6w2K1JWdoEZ+HELGsluWNCin5ikskroY4KzKz9Uv9gemmLFThziZaD
         w3n6u6gr84+OC4bboDFgtXSfsnKSGaHsWl9TiiHb88wQwClYUx+PxhFfUjkAY+YGV/RC
         xDRGNvO7K8PpDSvb1rqjJkQAyv0u6JneB7RAdlvK9XUy6Vu3/w5NYL+RfZD7wuncy3Mm
         pdWoihPEVfYxJataDxR5BeBLaXvp/v+UNVPhfuEpLlfkp/ZDQWrzFgRL4U55bSQ3HSxx
         MC5bZKuNESCb3y7FnnBsVVrX/UQGuVR9hpL6ZCWYBp6yuOvpkSIt52HXRA/ZFFdky1tT
         Au7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SlxC864YjLEO+7q+J8Vszr1QsnSVh5+m7jx8BJGts7g=;
        b=3H6Xa+Rd5D1pkfsBRTsH3f3KkCdE/EzkxKwC9ZN8+DndIlRw95gD1lXcFywCIdJG2P
         y8cB29dboFNozFadlWx8Zc3NDMxt37EE072A9ZyhV79yUp70GUEkHgrs2FLxpKEr44xl
         mzjCwISu2p1AlwzboWyXw+4pEl88usm3st1V/ZxfbDqtVXEnEyiAHlvdfinhK4YrQUrz
         yBRDjVGmNtgxJrmNkAGPeU3hLJx55eYPrBi4HCzLNl0OYaQe6AJe8Akt0umBPgT9KdlS
         7L/gITUjhYKNTKZkrRVZmXNNRTTZzxwg/Hl3Xbi0gyjfWeVHWMycK7t1lDopl3Ws/eW6
         9ChA==
X-Gm-Message-State: AJIora9phfTd7QGUOptAGK9DqQ6u23BAfu1qYBlh0CV2vJAz9HA9SMUG
        To9p9LGAKGfm4UYWKn6wv9rYxKW47T0=
X-Google-Smtp-Source: AGRyM1ta/NHSRV0F+rw8lUkJlr64W6OZzxeyfCyCYEDt9p58ua9gAl83fErh7Dw4n7qAIZV/5tK0yA==
X-Received: by 2002:a17:902:8a8b:b0:16a:52d0:72bd with SMTP id p11-20020a1709028a8b00b0016a52d072bdmr14834307plo.78.1656337581845;
        Mon, 27 Jun 2022 06:46:21 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b0016a565f3f34sm6783395plx.168.2022.06.27.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:46:21 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 2/4] tools: tests for line name focussed rework
Date:   Mon, 27 Jun 2022 21:44:45 +0800
Message-Id: <20220627134447.81927-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627134447.81927-1-warthog618@gmail.com>
References: <20220627134447.81927-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rework the tools tests and expand to cover new functionality.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test      |    3 -
 tools/gpio-tools-test.bats | 2052 ++++++++++++++++++++++++++----------
 2 files changed, 1504 insertions(+), 551 deletions(-)

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
index 69ad786..eaa814f 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -4,15 +4,16 @@
 
 # Simple test harness for the gpio-tools.
 
-# Where output from coprocesses is stored
-COPROC_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
+# Where output from the dut is stored
+DUT_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
 # Save the PID of coprocess - otherwise we won't be able to wait for it
 # once it exits as the COPROC_PID will be cleared.
-COPROC_SAVED_PID=""
+DUT_PID=""
 
 GPIOSIM_CHIPS=""
-GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim/"
+GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim"
 GPIOSIM_SYSFS="/sys/devices/platform/"
+GPIOSIM_APP_NAME="gpio-tools-test"
 
 # Run the command in $* and return 0 if the command failed. The way we do it
 # here is a workaround for the way bats handles failing processes.
@@ -23,10 +24,7 @@ assert_fail() {
 
 # Check if the string in $2 matches against the pattern in $1.
 regex_matches() {
-	local PATTERN=$1
-	local STRING=$2
-
-	[[ $STRING =~ $PATTERN ]]
+	[[ $2 =~ $1 ]] || (echo "Mismatched: \"$2\"" && false)
 }
 
 # Iterate over all lines in the output of the last command invoked with bats'
@@ -38,31 +36,39 @@ output_contains_line() {
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
+	test ${#lines[@]} -eq $1 || (echo "Num lines is : ${#lines[@]}" && false)
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
 
@@ -87,36 +93,24 @@ gpiosim_chip() {
 
 	echo 1 > $DEVPATH/live
 
-	GPIOSIM_CHIPS="$VAR:$NAME $GPIOSIM_CHIPS"
+	GPIOSIM_CHIPS="$VAR $GPIOSIM_CHIPS"
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
+gpiosim_chip_name() {
+	echo $(<$GPIOSIM_CONFIGFS/${GPIOSIM_APP_NAME}-$$-$1/bank0/chip_name)
 }
 
-gpiosim_chip_name() {
-	local VAR=$1
-	local NAME=$(gpiosim_chip_map_name $VAR)
+gpiosim_chip_path() {
+	echo "/dev/$(<$GPIOSIM_CONFIGFS/${GPIOSIM_APP_NAME}-$$-$1/bank0/chip_name)"
+}
 
-	cat $GPIOSIM_CONFIGFS/$NAME/$NAME/chip_name
+gpiosim_chip_number() {
+	local NAME=$(<$GPIOSIM_CONFIGFS/${GPIOSIM_APP_NAME}-$$-$1/bank0/chip_name)
+	echo ${NAME#"gpiochip"}
 }
 
 gpiosim_dev_name() {
-	local VAR=$1
-	local NAME=$(gpiosim_chip_map_name $VAR)
-
-	cat $GPIOSIM_CONFIGFS/$NAME/dev_name
+	echo $(<$GPIOSIM_CONFIGFS/${GPIOSIM_APP_NAME}-$$-$1/dev_name)
 }
 
 gpiosim_set_pull() {
@@ -136,26 +130,21 @@ gpiosim_check_value() {
 	local DEVNAME=$(gpiosim_dev_name $VAR)
 	local CHIPNAME=$(gpiosim_chip_name $VAR)
 
-	VAL=$(cat $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
-	if [ "$VAL" = "$EXPECTED" ]
-	then
-		return 0
-	fi
-
-	return 1
+	VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
+	[ "$VAL" = "$EXPECTED" ]
 }
 
 gpiosim_cleanup() {
 	for CHIP in $GPIOSIM_CHIPS
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
@@ -178,178 +167,626 @@ run_tool() {
 	run timeout 10s $BATS_TEST_DIRNAME/"$@"
 }
 
-coproc_run_tool() {
-	rm -f $BR_PROC_OUTPUT
-	coproc timeout 10s $BATS_TEST_DIRNAME/"$@" > $COPROC_OUTPUT 2> $COPROC_OUTPUT
-	COPROC_SAVED_PID=$COPROC_PID
-	# FIXME We're giving the background process some time to get up, but really this
-	# should be more reliable...
+dut_run() {
+	coproc timeout 10s stdbuf -oL $BATS_TEST_DIRNAME/"$@" 2>&1
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
 #
 # gpiodetect test cases
 #
 
-@test "gpiodetect: list chips" {
+@test "gpiodetect: all chips" {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 	gpiosim_chip sim2 num_lines=16
 
 	run_tool gpiodetect
 
-	test "$status" -eq 0
+	status_is 0
 	output_contains_line "$(gpiosim_chip_name sim0) [$(gpiosim_dev_name sim0)-node0] (4 lines)"
 	output_contains_line "$(gpiosim_chip_name sim1) [$(gpiosim_dev_name sim1)-node0] (8 lines)"
 	output_contains_line "$(gpiosim_chip_name sim2) [$(gpiosim_dev_name sim2)-node0] (16 lines)"
 }
 
-@test "gpiodetect: invalid args" {
-	run_tool gpiodetect unimplemented-arg
-	test "$status" -eq 1
+@test "gpiodetect: a chip" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
+
+	# by name
+	run_tool gpiodetect $(gpiosim_chip_name sim0)
+
+	status_is 0
+	num_lines_is 1
+	output_contains_line "$(gpiosim_chip_name sim0) [$(gpiosim_dev_name sim0)-node0] (4 lines)"
+
+	# by path
+	run_tool gpiodetect $(gpiosim_chip_path sim1)
+
+	status_is 0
+	num_lines_is 1
+	output_contains_line "$(gpiosim_chip_name sim1) [$(gpiosim_dev_name sim1)-node0] (8 lines)"
+
+	# by number
+	run_tool gpiodetect $(gpiosim_chip_number sim2)
+
+	status_is 0
+	num_lines_is 1
+	output_contains_line "$(gpiosim_chip_name sim2) [$(gpiosim_dev_name sim2)-node0] (16 lines)"
+}
+
+@test "gpiodetect: multiple chips" {
+	gpiosim_chip sim0 num_lines=4
+	gpiosim_chip sim1 num_lines=8
+	gpiosim_chip sim2 num_lines=16
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
+	local sim2=$(gpiosim_chip_name sim2)
+
+	run_tool gpiodetect $sim0 $sim1 $sim2
+
+	status_is 0
+	num_lines_is 3
+	output_contains_line "$sim0 [$(gpiosim_dev_name sim0)-node0] (4 lines)"
+	output_contains_line "$sim1 [$(gpiosim_dev_name sim1)-node0] (8 lines)"
+	output_contains_line "$sim2 [$(gpiosim_dev_name sim2)-node0] (16 lines)"
+}
+
+@test "gpiodetect: with nonexistent chip" {
+	run_tool gpiodetect nonexistent-chip
+
+	status_is 1
+	output_regex_match \
+".*cannot find a GPIO chip character device corresponding to nonexistent-chip"
 }
 
 #
 # gpioinfo test cases
 #
 
-@test "gpioinfo: dump all chips" {
+@test "gpioinfo: all chips" {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 
 	run_tool gpioinfo
 
-	test "$status" -eq 0
+	status_is 0
 	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
 	output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
-
-	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
-	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+\\[input\\]"
 }
 
-@test "gpioinfo: dump all chips with one line exported" {
-	gpiosim_chip sim0 num_lines=4
-	gpiosim_chip sim1 num_lines=8
+@test "gpioinfo: all chips with some used lines" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
 
-	coproc_run_tool gpioset --mode=signal --active-low "$(gpiosim_chip_name sim1)" 7=1
+	dut_run gpioset -i --active-low foo=1 baz=0
 
 	run_tool gpioinfo
 
-	test "$status" -eq 0
+	status_is 0
 	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
 	output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
-	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
-	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+\\\"gpioset\\\"\\s+output\\s+active-low"
-
-	coproc_tool_kill
-	coproc_tool_wait
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+1:\\s+foo\\s+gpioset\\s+\\[output\\s+active-low\\s+used\\]"
+	output_regex_match "\\s+line\\s+3:\\s+baz\\s+gpioset\\s+\\[output\\s+active-low\\s+used\\]"
 }
 
-@test "gpioinfo: dump one chip" {
+@test "gpioinfo: a chip" {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip sim1 num_lines=4
+	local sim1=$(gpiosim_chip_name sim1)
+
+	# by name
+	run_tool gpioinfo --chip $sim1
+
+	status_is 0
+	num_lines_is 5
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+unused\\s+\\[input\\]"
+
+	# by path
+	run_tool gpioinfo --chip $sim1
+
+	status_is 0
+	num_lines_is 5
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+unused\\s+\\[input\\]"
+
+	# by number
+	run_tool gpioinfo --chip $sim1
+
+	status_is 0
+	num_lines_is 5
+	output_contains_line "$sim1 - 4 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+1:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "\\s+line\\s+3:\\s+unnamed\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioinfo: a line" {
+	gpiosim_chip sim0 num_lines=8 line_name=5:bar
+	gpiosim_chip sim1 num_lines=4 line_name=2:bar
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
+
+	# by offset
+	run_tool gpioinfo --chip $sim1 2
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim1\\s+2\\s+bar\\s+unused\\s+\\[input\\]"
+
+	# by name
+	run_tool gpioinfo bar
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+5\\s+bar\\s+unused\\s+\\[input\\]"
+
+	# by chip and name
+	run_tool gpioinfo --chip $sim1 2
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim1\\s+2\\s+bar\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioinfo: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpioinfo "$(gpiosim_chip_name sim1)"
+	run_tool gpioinfo foobar
 
-	test "$status" -eq 0
-	assert_fail output_contains_line "$(gpiosim_chip_name sim0) - 8 lines:"
-	output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
-	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
-	assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$(gpiosim_chip_name sim0)\\s+3\\s+foobar\\s+unused\\s+\\[input\\]"
 }
 
-@test "gpioinfo: dump all but one chip" {
-	gpiosim_chip sim0 num_lines=4
-	gpiosim_chip sim1 num_lines=4
-	gpiosim_chip sim2 num_lines=8
-	gpiosim_chip sim3 num_lines=4
+@test "gpioinfo: multiple lines" {
+	gpiosim_chip sim0 num_lines=8 line_name=5:bar
+	gpiosim_chip sim1 num_lines=4 line_name=2:baz
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
 
-	run_tool gpioinfo "$(gpiosim_chip_name sim0)" \
-			"$(gpiosim_chip_name sim1)" "$(gpiosim_chip_name sim3)"
+	# by offset
+	run_tool gpioinfo --chip $sim1 1 2
 
-	test "$status" -eq 0
-	output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
-	output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
-	assert_fail output_contains_line "$(gpiosim_chip_name sim2) - 8 lines:"
-	output_contains_line "$(gpiosim_chip_name sim3) - 4 lines:"
-	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
-	assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
+	status_is 0
+	num_lines_is 2
+	output_regex_match "$(gpiosim_chip_name sim1)\\s+1\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "$(gpiosim_chip_name sim1)\\s+2\\s+baz\\s+unused\\s+\\[input\\]"
+
+	# by name
+	run_tool gpioinfo bar baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match "$(gpiosim_chip_name sim0)\\s+5\\s+bar\\s+unused\\s+\\[input\\]"
+	output_regex_match "$(gpiosim_chip_name sim1)\\s+2\\s+baz\\s+unused\\s+\\[input\\]"
+
+	# by name and offset
+	run_tool gpioinfo --chip $(gpiosim_chip_name sim0) bar 3
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match "$(gpiosim_chip_name sim0)\\s+5\\s+bar\\s+unused\\s+\\[input\\]"
+	output_regex_match "$(gpiosim_chip_name sim0)\\s+3\\s+unnamed\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioinfo: line attribute menagerie" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
+
+	dut_run gpioset -i --active-low --bias=pull-up --drive=open-source foo=1 baz=0
+
+	run_tool gpioinfo foo baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match \
+"$sim0\\s+1\\s+foo\\s+gpioset\\s+\\[output\\s+active-low\\s+used\\s+open-source\\s+pull-up\\]"
+	output_regex_match \
+"$sim1\\s+3\\s+baz\\s+gpioset\\s+\\[output\\s+active-low\\s+used\\s+open-source\\s+pull-up\\]"
+
+	dut_kill
+	dut_wait
+
+	dut_run gpioset -i --bias=pull-down --drive=open-drain foo=1 baz=0
+
+	run_tool gpioinfo foo baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match \
+"$sim0\\s+1\\s+foo\\s+gpioset\\s+\\[output\\s+used\\s+open-drain\\s+pull-down\\]"
+	output_regex_match \
+"$sim1\\s+3\\s+baz\\s+gpioset\\s+\\[output\\s+used\\s+open-drain\\s+pull-down\\]"
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --bias=disabled --utc --debounce-period=10ms foo baz
+
+	run_tool gpioinfo foo baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match \
+"$sim0\\s+1\\s+foo\\s+gpiomon\\s+\\[input\\s+used\\s+bias-disabled\\s+both-edges\\s+event-clock-realtime\\s+debounce_period=10000us\\]"
+	output_regex_match \
+"$sim1\\s+3\\s+baz\\s+gpiomon\\s+\\[input\\s+used\\s+bias-disabled\\s+both-edges\\s+event-clock-realtime\\s+debounce_period=10000us\\]"
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --edge=rising --localtime foo baz
+
+	run_tool gpioinfo foo baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match \
+"$sim0\\s+1\\s+foo\\s+gpiomon\\s+\\[input\\s+used\\s+rising-edges\\s+event-clock-realtime\\]"
+	output_regex_match \
+"$sim1\\s+3\\s+baz\\s+gpiomon\\s+\\[input\\s+used\\s+rising-edges\\s+event-clock-realtime\\]"
+
+	dut_kill
+	dut_wait
+
+	dut_run gpiomon --banner --edge=falling foo baz
+
+	run_tool gpioinfo foo baz
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match "$sim0\\s+1\\s+foo\\s+gpiomon\\s+\\[input\\s+used\\s+falling-edges\\]"
+	output_regex_match "$sim1\\s+3\\s+baz\\s+gpiomon\\s+\\[input\\s+used\\s+falling-edges\\]"
+}
+
+@test "gpioinfo: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=$(gpiosim_chip_name sim0)
+
+	# by offset
+	run_tool gpioinfo --chip $sim0 1 1
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[input\\]"
+
+	# by name
+	run_tool gpioinfo foo foo
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[input\\]"
+
+	# by name and offset
+	run_tool gpioinfo --chip $sim0 foo 1
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioinfo: all lines matching name" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
+
+	run_tool gpioinfo --strict foobar
+
+	status_is 1
+	num_lines_is 3
+	output_regex_match "$sim0\\s+3\\s+foobar\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim1\\s+2\\s+foobar\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim1\\s+7\\s+foobar\\s+unused\\s+\\[input\\]"
 }
 
-@test "gpioinfo: inexistent chip" {
-	run_tool gpioinfo "inexistent"
+@test "gpioinfo: with lines strictly by name" {
+	# not suggesting this setup makes sense - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+	local sim0=$(gpiosim_chip_name sim0)
 
-	test "$status" -eq 1
+	run_tool gpioinfo --by-name --chip $sim0 42 13
+
+	status_is 0
+	num_lines_is 2
+	output_regex_match "$sim0\\s+1\\s+42\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim0\\s+6\\s+13\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioinfo: with nonexistent chip" {
+	run_tool gpioinfo --chip nonexistent-chip
+
+	status_is 1
+	output_regex_match \
+".*cannot find a GPIO chip character device corresponding to nonexistent-chip"
+}
+
+@test "gpioinfo: with nonexistent line" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioinfo nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
+
+	run_tool gpioinfo --chip $(gpiosim_chip_name sim0) nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
+}
+
+@test "gpioinfo: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+	local sim0=$(gpiosim_chip_name sim0)
+
+	run_tool gpioinfo --chip $sim0 0 1 2 3 4 5
+
+	status_is 1
+	num_lines_is 6
+	output_regex_match "$sim0\\s+0\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim0\\s+1\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim0\\s+2\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match "$sim0\\s+3\\s+unnamed\\s+unused\\s+\\[input\\]"
+	output_regex_match ".*offset 4 is out of range on chip $sim0"
+	output_regex_match ".*offset 5 is out of range on chip $sim0"
 }
 
 #
 # gpiofind test cases
 #
 
-@test "gpiofind: line found" {
+@test "gpiofind: by name" {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
 	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
 	run_tool gpiofind foobar
 
-	test "$status" -eq "0"
-	test "$output" = "$(gpiosim_chip_name sim1) 7"
+	status_is 0
+	output_is "$(gpiosim_chip_name sim1) 7"
+}
+
+@test "gpiofind: by chip and name" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+	local sim1=$(gpiosim_chip_name sim1)
+
+	run_tool gpiofind --chip $sim1 foobar
+
+	status_is 0
+	output_is "$sim1 2"
+}
+
+@test "gpiofind: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpiofind foobar
+
+	status_is 0
+	output_is "$(gpiosim_chip_name sim0) 3"
+}
+
+@test "gpiofind: with info" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpiofind --info baz
+
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$(gpiosim_chip_name sim1)\\s+0\\s+baz\\s+unused\\s+\\[input\\]"
 }
 
-@test "gpiofind: line not found" {
+@test "gpiofind: all lines matching name" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
+
+	run_tool gpiofind --strict foobar
+
+	status_is 1
+	num_lines_is 3
+	output_regex_match "$sim0\\s+3"
+	output_regex_match "$sim1\\s+2"
+	output_regex_match "$sim1\\s+7"
+}
+
+@test "gpiofind: with nonexistent chip" {
+	run_tool gpiofind --chip nonexistant-chip 0
+
+	status_is 1
+	output_regex_match \
+".*cannot find a GPIO chip character device corresponding to nonexistant-chip"
+}
+
+@test "gpiofind: with nonexistent line" {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 	gpiosim_chip sim2 num_lines=16
 
 	run_tool gpiofind nonexistent-line
 
-	test "$status" -eq "1"
-}
-
-@test "gpiofind: invalid args" {
-	run_tool gpiodetect unimplemented-arg
-	test "$status" -eq 1
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
 }
 
 #
 # gpioget test cases
 #
 
-@test "gpioget: read all lines" {
+@test "gpioget: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_tool gpioget foo
+
+	status_is 0
+	output_is "foo=active"
+}
+
+@test "gpioget: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_tool gpioget --chip $(gpiosim_chip_name sim0) 1
+
+	status_is 0
+	output_is "1=active"
+}
+
+@test "gpioget: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:foo
+
+	gpiosim_set_pull sim1 3 pull-up
+
+	run_tool gpioget --chip $(gpiosim_chip_name sim1) foo
+
+	status_is 0
+	output_is "foo=active"
+}
+
+@test "gpioget: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar line_name=7:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar line_name=4:xyz
+	gpiosim_chip sim2 num_lines=16
+
+	gpiosim_set_pull sim0 3 pull-up
+
+	run_tool gpioget foobar
+
+	status_is 0
+	output_is "foobar=active"
+}
+
+@test "gpioget: multiple lines" {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -357,13 +794,41 @@ teardown() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --chip $(gpiosim_chip_name sim0) 0 1 2 3 4 5 6 7
 
-	test "$status" -eq "0"
-	test "$output" = "0 0 1 1 0 1 0 1"
+	status_is 0
+	output_is "0=inactive 1=inactive 2=active 3=active 4=inactive 5=active 6=inactive 7=active"
 }
 
-@test "gpioget: read all lines (active-low)" {
+@test "gpioget: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=6:bar
+	gpiosim_chip sim1 num_lines=8 line_name=1:baz line_name=3:bar
+	local sim0=$(gpiosim_chip_name sim0)
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 6 pull-up
+
+	run_tool gpioget --chip $sim0 0 foo 4 bar
+
+	status_is 0
+	output_is "0=inactive foo=active 4=active bar=active"
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
+	status_is 0
+	output_is "baz=inactive bar=inactive foo=active xyz=active"
+}
+
+@test "gpioget: with numeric values" {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -371,13 +836,13 @@ teardown() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --active-low "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --numeric --chip $(gpiosim_chip_name sim0) 0 1 2 3 4 5 6 7
 
-	test "$status" -eq "0"
-	test "$output" = "1 1 0 0 1 0 1 0"
+	status_is 0
+	output_is "0 0 1 1 0 1 0 1"
 }
 
-@test "gpioget: read all lines (pull-up)" {
+@test "gpioget: with active-low" {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -385,13 +850,13 @@ teardown() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --bias=pull-up "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --active-low --chip $(gpiosim_chip_name sim0) 0 1 2 3 4 5 6 7
 
-	test "$status" -eq "0"
-	test "$output" = "1 1 1 1 1 1 1 1"
+	status_is 0
+	output_is "0=active 1=active 2=inactive 3=inactive 4=active 5=inactive 6=active 7=inactive"
 }
 
-@test "gpioget: read all lines (pull-down)" {
+@test "gpioget: with pull-up" {
 	gpiosim_chip sim0 num_lines=8
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -399,717 +864,1208 @@ teardown() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --bias=pull-down "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
+	run_tool gpioget --bias=pull-up --chip $(gpiosim_chip_name sim0) 0 1 2 3 4 5 6 7
 
-	test "$status" -eq "0"
-	test "$output" = "0 0 0 0 0 0 0 0"
+	status_is 0
+	output_is "0=active 1=active 2=active 3=active 4=active 5=active 6=active 7=active"
 }
 
-@test "gpioget: read some lines" {
+@test "gpioget: with pull-down" {
 	gpiosim_chip sim0 num_lines=8
 
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	run_tool gpioget --bias=pull-down --chip $(gpiosim_chip_name sim0) 0 1 2 3 4 5 6 7
+
+	status_is 0
+	output_is \
+"0=inactive 1=inactive 2=inactive 3=inactive 4=inactive 5=inactive 6=inactive 7=inactive"
+}
+
+@test "gpioget: with direction as-is" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=$(gpiosim_chip_name sim0)
+
+	# flip to output
+	run_tool gpioset foo=1
+
+	status_is 0
+
+	run_tool gpioinfo foo
+	status_is 0
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[output\\]"
+
+	run_tool gpioget --as-is foo
+	status_is 0
+	# note gpio-sim reverts line to its pull when released
+	output_is "foo=inactive"
+
+	run_tool gpioinfo foo
+	status_is 0
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[output\\]"
+
+	# whereas the default behaviour forces to input
+	run_tool gpioget foo
+	status_is 0
+	# note gpio-sim reverts line to its pull when released (defaults to pull-down)
+	output_is "foo=inactive"
+
+	run_tool gpioinfo foo
+	status_is 0
+	output_regex_match "$sim0\\s+1\\s+foo\\s+unused\\s+\\[input\\]"
+}
+
+@test "gpioget: with hold-period" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	# only test parsing - testing the hold-period itself is tricky
+	run_tool gpioget --hold-period=100ms foo
+	status_is 0
+	output_is "foo=inactive"
+}
+
+@test "gpioget: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpioget --strict foobar
+
+	status_is 1
+	output_regex_match ".*line foobar is not unique"
+}
+
+@test "gpioget: with lines strictly by name" {
+	# not suggesting this setup makes sense - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+
 	gpiosim_set_pull sim0 1 pull-up
-	gpiosim_set_pull sim0 4 pull-up
-	gpiosim_set_pull sim0 6 pull-up
+	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 4 6
+	run_tool gpioget --by-name --chip $(gpiosim_chip_name sim0) 42 13
 
-	test "$status" -eq "0"
-	test "$output" = "0 1 1 1"
+	status_is 0
+	output_is "42=active 13=inactive"
 }
 
-@test "gpioget: no arguments" {
+@test "gpioget: with no arguments" {
 	run_tool gpioget
 
-	test "$status" -eq "1"
-	output_regex_match ".*gpiochip must be specified"
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
+}
+
+@test "gpioget: with chip but no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --chip $(gpiosim_chip_name sim0)
+
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
+}
+
+@test "gpioget: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+	local sim0=$(gpiosim_chip_name sim0)
+
+	run_tool gpioget --chip $sim0 0 1 2 3 4 5
+
+	status_is 1
+	output_regex_match ".*offset 4 is out of range on chip $sim0"
+	output_regex_match ".*offset 5 is out of range on chip $sim0"
+}
+
+@test "gpioget: with nonexistent line" {
+	run_tool gpioget nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
+}
+
+@test "gpioget: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=$(gpiosim_chip_name sim0)
+
+	# by offset
+	run_tool gpioget --chip $sim0 0 0
+
+	status_is 1
+	output_regex_match ".*lines 0 and 0 are the same"
+
+	# by name
+	run_tool gpioget foo foo
+
+	status_is 1
+	output_regex_match ".*lines foo and foo are the same"
+
+	# by chip and name
+	run_tool gpioget --chip $sim0 foo foo
+
+	status_is 1
+	output_regex_match ".*lines foo and foo are the same"
+}
+
+@test "gpioget: with invalid bias" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --bias=bad --chip $(gpiosim_chip_name sim0) 0 1
+
+	status_is 1
+	output_regex_match ".*invalid bias.*"
+}
+
+@test "gpioget: with invalid hold-period" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpioget --hold-period=bad --chip $(gpiosim_chip_name sim0) 0
+
+	status_is 1
+	output_regex_match ".*invalid period.*"
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
+	dut_run gpioset -i --chip $(gpiosim_chip_name sim0) 1=1
+
+	gpiosim_check_value sim0 1 1
+}
+
+@test "gpioset: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	gpiosim_chip sim1 num_lines=8 line_name=3:foo
+
+	dut_run gpioset -i --chip $(gpiosim_chip_name sim1) foo=1
+
+	gpiosim_check_value sim1 3 1
+}
+
+@test "gpioset: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
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
+	dut_run gpioset -i --chip $(gpiosim_chip_name sim0) 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
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
+	dut_run gpioset -i --chip $(gpiosim_chip_name sim0) 0=1 foo=1 bar=1 3=1
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
+	local sim0=$(gpiosim_chip_name sim0)
+
+	dut_run gpioset -i --active-low --chip $sim0 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
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
+	dut_run gpioset -i --drive=push-pull --chip $(gpiosim_chip_name sim0) \
+					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
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
+	local sim0=$(gpiosim_chip_name sim0)
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	dut_run gpioset -i --drive=open-drain --chip $sim0 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
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
+	dut_run gpioset -i --drive=open-source --chip $(gpiosim_chip_name sim0) \
+					0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
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
+	dut_run gpioset -i --bias=pull-up --drive=open-drain \
+			--chip $(gpiosim_chip_name sim0) 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+
+	gpiosim_check_value sim0 0 0
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 2 1
+	gpiosim_check_value sim0 3 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 5 1
+	gpiosim_check_value sim0 6 0
+	gpiosim_check_value sim0 7 1
 }
 
-@test "gpioget: no lines specified" {
+@test "gpioset: with pull-down" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget "$(gpiosim_chip_name sim0)"
+	dut_run gpioset -i --bias=pull-down --drive=open-source \
+			--chip $(gpiosim_chip_name sim0) 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*at least one GPIO line offset must be specified"
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+	dut_run gpioset -i --chip $sim0	0=0 1=1 2=active 3=inactive 4=on 5=off 6=false 7=true
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
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
+	output_regex_match ".*get \[line\] \.\.\..*"
+	output_regex_match ".*set <line=value> \.\.\..*"
+	output_regex_match ".*toggle \[line\] \.\.\..*"
+	output_regex_match ".*sleep <period>.*"
+}
+
+@test "gpioset: interactive get" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
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
+	output_regex_match "\\s*foo=active\\s+bar=inactive\\s+baz=inactive\\s*"
+
+	dut_write "get bar"
+
+	dut_read
+	output_regex_match "\\s*bar=inactive\\s*"
+}
+
+@test "gpioset: interactive set" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
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
+	output_regex_match "\\s*foo=active\\s+bar=active\\s+baz=inactive\\s*"
 }
 
-@test "gpioget: too many lines specified" {
-	gpiosim_chip sim0 num_lines=4
-
-	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4
+@test "gpioset: interactive toggle" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines.*"
-}
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 7 pull-up
 
-@test "gpioget: same line twice" {
-	gpiosim_chip sim0 num_lines=8
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
 
-	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 0
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
-}
+	dut_write "toggle"
 
-@test "gpioget: invalid bias" {
-	gpiosim_chip sim0 num_lines=8
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 1
+	dut_write "get"
+	dut_read
+	output_regex_match "\\s*foo=inactive\\s+bar=active\\s+baz=active\\s*"
 
-	run_tool gpioget --bias=bad "$(gpiosim_chip_name sim0)" 0 1
+	dut_write "toggle baz"
 
-	test "$status" -eq "1"
-	output_regex_match ".*invalid bias.*"
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 0
+	dut_write "get"
+	dut_read
+	output_regex_match "\\s*foo=inactive\\s+bar=active\\s+baz=inactive\\s*"
 }
 
-#
-# gpioset test cases
-#
+@test "gpioset: interactive sleep" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
 
-@test "gpioset: set lines and wait for SIGTERM" {
-	gpiosim_chip sim0 num_lines=8
+	dut_run gpioset --interactive foo=1 bar=0 baz=0
 
-	coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" \
-					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+	dut_write "sleep 500ms"
+	dut_flush
 
-	gpiosim_check_value sim0 0 0
-	gpiosim_check_value sim0 1 0
-	gpiosim_check_value sim0 2 1
-	gpiosim_check_value sim0 3 1
-	gpiosim_check_value sim0 4 1
-	gpiosim_check_value sim0 5 1
-	gpiosim_check_value sim0 6 0
-	gpiosim_check_value sim0 7 1
+	assert_fail dut_readable
 
-	coproc_tool_kill
-	coproc_tool_wait
+	sleep 1
 
-	test "$status" -eq "0"
+	# prompt, but not a full line...
+	dut_readable
 }
 
-@test "gpioset: set lines and wait for SIGTERM (active-low)" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpioset: toggle (continuous)" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
 
-	coproc_run_tool gpioset --active-low --mode=signal "$(gpiosim_chip_name sim0)" \
-					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	# redirect as gpioset has no banner
+	dut_run_redirect gpioset --toggle 1s foo=1 bar=0 baz=0
 
-	gpiosim_check_value sim0 0 1
 	gpiosim_check_value sim0 1 1
-	gpiosim_check_value sim0 2 0
-	gpiosim_check_value sim0 3 0
 	gpiosim_check_value sim0 4 0
-	gpiosim_check_value sim0 5 0
-	gpiosim_check_value sim0 6 1
 	gpiosim_check_value sim0 7 0
 
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-}
-
-@test "gpioset: set lines and wait for SIGTERM (push-pull)" {
-	gpiosim_chip sim0 num_lines=8
-
-	coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpiosim_chip_name sim0)" \
-					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+	sleep 1
 
-	gpiosim_check_value sim0 0 0
 	gpiosim_check_value sim0 1 0
-	gpiosim_check_value sim0 2 1
-	gpiosim_check_value sim0 3 1
 	gpiosim_check_value sim0 4 1
-	gpiosim_check_value sim0 5 1
-	gpiosim_check_value sim0 6 0
 	gpiosim_check_value sim0 7 1
 
-	coproc_tool_kill
-	coproc_tool_wait
+	sleep 1
 
-	test "$status" -eq "0"
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 4 0
+	gpiosim_check_value sim0 7 0
 }
 
-@test "gpioset: set lines and wait for SIGTERM (open-drain)" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpioset: toggle (terminated)" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
 
-	gpiosim_set_pull sim0 2 pull-up
-	gpiosim_set_pull sim0 3 pull-up
-	gpiosim_set_pull sim0 5 pull-up
-	gpiosim_set_pull sim0 7 pull-up
+	gpiosim_set_pull sim0 4 pull-up
 
-	coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpiosim_chip_name sim0)" \
-					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+	# redirect as gpioset has no banner
+	# hold-period to allow test to sample before gpioset exits
+	dut_run_redirect gpioset --toggle 1s,0 -p 600ms foo=1 bar=0 baz=1
 
-	gpiosim_check_value sim0 0 0
-	gpiosim_check_value sim0 1 0
-	gpiosim_check_value sim0 2 1
-	gpiosim_check_value sim0 3 1
+	gpiosim_check_value sim0 1 1
 	gpiosim_check_value sim0 4 0
-	gpiosim_check_value sim0 5 1
-	gpiosim_check_value sim0 6 0
 	gpiosim_check_value sim0 7 1
 
-	coproc_tool_kill
-	coproc_tool_wait
+	sleep 1
+
+	gpiosim_check_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 0
+
+	dut_wait
 
-	test "$status" -eq "0"
+	status_is 0
 }
 
-@test "gpioset: set lines and wait for SIGTERM (open-source)" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpioset: with invalid toggle period" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar line_name=7:baz
 
-	gpiosim_set_pull sim0 2 pull-up
-	gpiosim_set_pull sim0 3 pull-up
-	gpiosim_set_pull sim0 5 pull-up
-	gpiosim_set_pull sim0 7 pull-up
+	run_tool gpioset --toggle 1ns foo=1 bar=0 baz=0
 
-	coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpiosim_chip_name sim0)" \
-					0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+	status_is 1
+	output_regex_match ".*invalid period.*"
+}
 
-	gpiosim_check_value sim0 0 0
-	gpiosim_check_value sim0 1 0
-	gpiosim_check_value sim0 2 1
-	gpiosim_check_value sim0 3 1
-	gpiosim_check_value sim0 4 1
-	gpiosim_check_value sim0 5 1
-	gpiosim_check_value sim0 6 0
-	gpiosim_check_value sim0 7 1
+@test "gpioset: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
 
-	coproc_tool_kill
-	coproc_tool_wait
+	run_tool gpioset --strict foobar=active
 
-	test "$status" -eq "0"
+	status_is 1
+	output_regex_match ".*line foobar is not unique"
 }
 
-@test "gpioset: set some lines and wait for ENTER" {
-	gpiosim_chip sim0 num_lines=8
-
-	coproc_run_tool gpioset --mode=wait "$(gpiosim_chip_name sim0)" \
-					1=0 2=1 5=1 6=0 7=1
+@test "gpioset: with lines strictly by name" {
+	# not suggesting this setup makes sense - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
 
-	gpiosim_check_value sim0 1 0
-	gpiosim_check_value sim0 2 1
-	gpiosim_check_value sim0 5 1
-	gpiosim_check_value sim0 6 0
-	gpiosim_check_value sim0 7 1
+	gpiosim_set_pull sim0 6 pull-up
 
-	coproc_tool_stdin_write ""
-	coproc_tool_wait
+	dut_run gpioset -i --by-name --chip $(gpiosim_chip_name sim0) 42=1 13=0
 
-	test "$status" -eq "0"
+	gpiosim_check_value sim0 1 1
+	gpiosim_check_value sim0 6 0
 }
 
-@test "gpioset: set some lines and wait for SIGINT" {
-	gpiosim_chip sim0 num_lines=4
-
-	coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" 0=1
+@test "gpioset: interactive after SIGINT" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
-	gpiosim_check_value sim0 0 1
+	dut_run gpioset -i foo=1
 
-	coproc_tool_kill -SIGINT
-	coproc_tool_wait
+	dut_kill -SIGINT
+	dut_wait
 
-	test "$status" -eq "0"
+	status_is 130
 }
 
-@test "gpioset: set some lines and wait with --mode=time" {
-	gpiosim_chip sim0 num_lines=8
-
-	coproc_run_tool gpioset --mode=time --sec=1 --usec=200000 \
-				"$(gpiosim_chip_name sim0)" 0=1 5=0 7=1
+@test "gpioset: interactive after SIGTERM" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
-	gpiosim_check_value sim0 0 1
-	gpiosim_check_value sim0 5 0
-	gpiosim_check_value sim0 7 1
+	dut_run gpioset -i foo=1
 
-	coproc_tool_wait
+	dut_kill -SIGTERM
+	dut_wait
 
-	test "$status" -eq "0"
+	status_is 143
 }
 
-@test "gpioset: no arguments" {
+@test "gpioset: with no arguments" {
 	run_tool gpioset
 
-	test "$status" -eq "1"
-	output_regex_match ".*gpiochip must be specified"
+	status_is 1
+	output_regex_match ".*at least one GPIO line value must be specified"
 }
 
-@test "gpioset: no lines specified" {
+@test "gpioset: with chip but no line specified" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpiosim_chip_name sim1)"
+	run_tool gpioset --chip $(gpiosim_chip_name sim0)
 
-	test "$status" -eq "1"
-	output_regex_match ".*at least one GPIO line offset to value mapping must be specified"
+	status_is 1
+	output_regex_match ".*at least one GPIO line value must be specified"
 }
 
-@test "gpioset: too many lines specified" {
+@test "gpioset: with offset out of range" {
 	gpiosim_chip sim0 num_lines=4
+	local sim0=$(gpiosim_chip_name sim0)
 
-	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 1=1 2=1 3=1 4=1 5=1
+	run_tool gpioset --chip $sim0 0=1 1=1 2=1 3=1 4=1 5=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines.*"
+	status_is 1
+	output_regex_match ".*offset 4 is out of range on chip $sim0"
+	output_regex_match ".*offset 5 is out of range on chip $sim0"
 }
 
-@test "gpioset: use --sec without --mode=time" {
+@test "gpioset: with invalid hold-period" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --mode=exit --sec=1 "$(gpiosim_chip_name sim0)" 0=1
+	run_tool gpioset --hold-period=bad --chip $(gpiosim_chip_name sim0) 0=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*can't specify wait time in this mode"
+	status_is 1
+	output_regex_match ".*invalid period.*"
 }
 
-@test "gpioset: use --usec without --mode=time" {
+@test "gpioset: with invalid value" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
-	run_tool gpioset --mode=exit --usec=1 "$(gpiosim_chip_name sim1)" 0=1
+	# by name
+	run_tool gpioset --chip $sim0 0=c
 
-	test "$status" -eq "1"
-	output_regex_match ".*can't specify wait time in this mode"
+	status_is 1
+	output_regex_match ".*invalid line value.*"
+
+	# by value
+	run_tool gpioset --chip $sim0 0=3
+
+	status_is 1
+	output_regex_match ".*invalid line value.*"
 }
 
-@test "gpioset: default mode" {
+@test "gpioset: with invalid offset" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1
+	run_tool gpioset --chip $(gpiosim_chip_name sim0) 4000000000=0
 
-	test "$status" -eq "0"
+	status_is 1
+	output_regex_match ".*cannot find line 4000000000"
 }
 
-@test "gpioset: invalid mapping" {
+@test "gpioset: with invalid bias" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpiosim_chip_name sim1)" 0=c
+	run_tool gpioset --bias=bad --chip $(gpiosim_chip_name sim0) 0=1 1=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*invalid offset<->value mapping"
+	status_is 1
+	output_regex_match ".*invalid bias.*"
 }
 
-@test "gpioset: invalid value" {
+@test "gpioset: with invalid drive" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpiosim_chip_name sim1)" 0=3
+	run_tool gpioset --drive=bad --chip $(gpiosim_chip_name sim0) 0=1 1=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*value must be 0 or 1"
+	status_is 1
+	output_regex_match ".*invalid drive.*"
 }
 
-@test "gpioset: invalid offset" {
+@test "gpioset: with daemonize and interactive" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset "$(gpiosim_chip_name sim1)" 4000000000=0
+	run_tool gpioset --interactive --daemonize --chip $(gpiosim_chip_name sim1) 0=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*invalid offset"
+	status_is 1
+	output_regex_match ".*can't combine daemonize with interactive"
 }
 
-@test "gpioset: invalid bias" {
+@test "gpioset: with interactive and toggle" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --bias=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
+	run_tool gpioset --interactive --toggle 1s --chip $(gpiosim_chip_name sim1) 0=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*invalid bias.*"
+	status_is 1
+	output_regex_match ".*can't combine interactive with toggle"
 }
 
-@test "gpioset: invalid drive" {
-	gpiosim_chip sim0 num_lines=8
-
-	run_tool gpioset --drive=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
+@test "gpioset: with nonexistent line" {
+	run_tool gpioset nonexistent-line=0
 
-	test "$status" -eq "1"
-	output_regex_match ".*invalid drive.*"
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
 }
 
-@test "gpioset: daemonize in invalid mode" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpioset: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=$(gpiosim_chip_name sim0)
 
-	run_tool gpioset --background "$(gpiosim_chip_name sim1)" 0=1
+	# by offset
+	run_tool gpioset --chip $sim0 0=1 0=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*can't daemonize in this mode"
-}
+	status_is 1
+	output_regex_match ".*lines 0 and 0 are the same"
 
-@test "gpioset: same line twice" {
-	gpiosim_chip sim0 num_lines=8
+	# by name
+	run_tool gpioset --chip $sim0 foo=1 foo=1
+
+	status_is 1
+	output_regex_match ".*lines foo and foo are the same"
 
-	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 0=1
+	# by name and offset
+	run_tool gpioset --chip $sim0 foo=1 1=1
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	status_is 1
+	output_regex_match ".*lines foo and 1 are the same"
 }
 
 #
 # gpiomon test cases
 #
 
-@test "gpiomon: single rising edge event" {
+@test "gpiomon: by offset" {
 	gpiosim_chip sim0 num_lines=8
-
-	coproc_run_tool gpiomon --rising-edge "$(gpiosim_chip_name sim0)" 4
+	local sim0=$(gpiosim_chip_name sim0)
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
 
-	coproc_tool_kill
-	coproc_tool_wait
+	dut_run gpiomon --banner --edge=rising --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event:\\s+RISING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[\s*[0-9]+\.[0-9]+\]"
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: single falling edge event" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpiomon: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+
+	gpiosim_set_pull sim0 4 pull-up
 
-	coproc_run_tool gpiomon --falling-edge "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner --edge=rising foo
+	dut_flush
 
+	gpiosim_set_pull sim0 4 pull-down
 	gpiosim_set_pull sim0 4 pull-up
 	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+foo"
+	assert_fail dut_readable
+}
 
-	coproc_tool_kill
-	coproc_tool_wait
+@test "gpiomon: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=0:foo
+	gpiosim_chip sim1 num_lines=8 line_name=2:foo
+	local sim1=$(gpiosim_chip_name sim1)
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event:\\s+FALLING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[\s*[0-9]+\.[0-9]+\]"
+	gpiosim_set_pull sim1 0 pull-up
+
+	dut_run gpiomon --banner --edge=rising --chip $sim1 foo
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim1 2 pull-down
+	gpiosim_set_pull sim1 2 pull-up
+	gpiosim_set_pull sim1 2 pull-down
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim1\\s+offset:\\s+2\\s+name:\\s+foo"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpiomon --banner foobar
+	dut_regex_match "Monitoring line .*"
+
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+foobar"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: single falling edge event (pull-up)" {
+@test "gpiomon: rising edge" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --edge=rising --chip $sim0 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
+}
 
-	coproc_run_tool gpiomon --bias=pull-up "$(gpiosim_chip_name sim0)" 4
+@test "gpiomon: falling edge" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
 	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
 
-	coproc_tool_kill
-	coproc_tool_wait
+	dut_run gpiomon --banner --edge=falling --chip $sim0 4
+	dut_flush
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event:\\s+FALLING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[\s*[0-9]+\.[0-9]+\]"
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 4 pull-down
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: single rising edge event (pull-down)" {
+@test "gpiomon: both edges" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
+
+	dut_run gpiomon --banner --edge=both --chip $sim0 4
+	dut_regex_match "Monitoring line .*"
 
 	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+4"
+
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+4"
+}
 
-	coproc_run_tool gpiomon --bias=pull-down "$(gpiosim_chip_name sim0)" 4
+@test "gpiomon: with pull-up" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
-	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
+	gpiosim_set_pull sim0 4 pull-down
 
-	coproc_tool_kill
-	coproc_tool_wait
+	dut_run gpiomon --banner --bias=pull-up --chip $sim0 4
+	dut_flush
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event:\\s+RISING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[\s*[0-9]+\.[0-9]+\]"
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: single rising edge event (active-low)" {
+@test "gpiomon: with pull-down" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	coproc_run_tool gpiomon --rising-edge --active-low "$(gpiosim_chip_name sim0)" 4
-
-	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
+	dut_run gpiomon --banner --bias=pull-down --chip $sim0 4
+	dut_flush
 
-	coproc_tool_kill
-	coproc_tool_wait
+	gpiosim_set_pull sim0 4 pull-up
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event:\\s+RISING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[\s*[0-9]+\.[0-9]+\]"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: single rising edge event (silent mode)" {
+@test "gpiomon: with active-low" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
-	coproc_run_tool gpiomon --rising-edge --silent "$(gpiosim_chip_name sim0)" 4
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiomon --banner --active-low --chip $sim0 4
+	dut_flush
 
+	gpiosim_set_pull sim0 4 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+4"
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+4"
+	assert_fail dut_readable
+}
+
+@test "gpiomon: with quiet mode" {
+	gpiosim_chip sim0 num_lines=8
 
-	coproc_tool_kill
-	coproc_tool_wait
+	dut_run gpiomon --banner --edge=rising --quiet --chip $(gpiosim_chip_name sim0) 4
+	dut_flush
 
-	test "$status" -eq "0"
-	test -z "$output"
+	gpiosim_set_pull sim0 4 pull-up
+	assert_fail dut_readable
 }
 
-@test "gpiomon: four alternating events" {
+@test "gpiomon: with num-events" {
 	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
 
-	coproc_run_tool gpiomon --num-events=4 "$(gpiosim_chip_name sim0)" 4
+	# redirect, as gpiomon exits after 4 events
+	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
 	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
 	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
 
-	coproc_tool_wait
+	dut_wait
+	dut_read_redirect
 
-	test "$status" -eq "0"
-	output_regex_match \
-"event\\:\\s+FALLING\\s+EDGE\\s+offset\\:\\s+4\\s+timestamp:\\s+\\[\s*[0-9]+\\.[0-9]+\\]"
-	output_regex_match \
-"event\\:\\s+RISING\\s+EDGE\\s+offset\\:\\s+4\\s+timestamp:\\s+\\[\s*[0-9]+\\.[0-9]+\\]"
+	num_lines_is 4
+
+	regex_matches "[0-9]+\.[0-9]+\\s+RISING\\s+chip:\\s+$sim0\\s+offset:\\s+4" "${lines[0]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+FALLING\\s+chip:\\s+$sim0\\s+offset:\\s+4" "${lines[1]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+RISING\\s+chip:\\s+$sim0\\s+offset:\\s+4" "${lines[2]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+FALLING\\s+chip:\\s+$sim0\\s+offset:\\s+4" "${lines[3]}"
 }
 
-@test "gpiomon: exit after SIGINT" {
+@test "gpiomon: multiple lines" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner --format=%o --chip $(gpiosim_chip_name sim0) 1 3 2 5 4
+	dut_regex_match "Monitoring lines .*"
 
-	coproc_tool_kill -SIGINT
-	coproc_tool_wait
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "2"
+	gpiosim_set_pull sim0 3 pull-up
+	dut_regex_match "3"
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match "4"
 
-	test "$status" -eq "0"
-	test -z "$output"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: exit after SIGTERM" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpiomon: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	dut_run gpiomon --banner --format=%o --chip $(gpiosim_chip_name sim0) foo bar 3
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
 
-	coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
+@test "gpiomon: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
 
-	coproc_tool_kill -SIGTERM
-	coproc_tool_wait
+	dut_run gpiomon --banner --format=%l foo bar baz
+	dut_regex_match "Monitoring lines .*"
 
-	test "$status" -eq "0"
-	test -z "$output"
+	gpiosim_set_pull sim0 2 pull-up
+	dut_regex_match "bar"
+	gpiosim_set_pull sim1 0 pull-up
+	dut_regex_match "baz"
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "foo"
+
+	assert_fail dut_readable
 }
 
-@test "gpiomon: both event flags" {
+@test "gpiomon: exit after SIGINT" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --falling-edge --rising-edge "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner --chip $(gpiosim_chip_name sim0) 4
+	dut_regex_match "Monitoring line .*"
 
-	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-	gpiosim_set_pull sim0 4 pull-down
-	sleep 0.2
+	dut_kill -SIGINT
+	dut_wait
 
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	output_regex_match \
-"event\\:\\s+FALLING\\s+EDGE\\s+offset\\:\\s+4\\s+timestamp:\\s+\\[\s*[0-9]+\\.[0-9]+\\]"
-	output_regex_match \
-"event\\:\\s+RISING\\s+EDGE\\s+offset\\:\\s+4\\s+timestamp:\\s+\\[\s*[0-9]+\\.[0-9]+\\]"
+	status_is 130
 }
 
-@test "gpiomon: watch multiple lines" {
+@test "gpiomon: exit after SIGTERM" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 1 2 3 4 5
+	dut_run gpiomon --banner --chip $(gpiosim_chip_name sim0) 4
+	dut_regex_match "Monitoring line .*"
 
-	gpiosim_set_pull sim0 2 pull-up
-	gpiosim_set_pull sim0 3 pull-up
-	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
+	dut_kill -SIGTERM
+	dut_wait
 
-	coproc_tool_kill
-	coproc_tool_wait
+	status_is 143
+}
+
+@test "gpiomon: with nonexistent line" {
+	run_tool gpiomon nonexistent-line
 
-	test "$status" -eq "0"
-	test "${lines[0]}" = "2"
-	test "${lines[1]}" = "3"
-	test "${lines[2]}" = "4"
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
 }
 
-@test "gpiomon: watch multiple lines (lines in mixed-up order)" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpiomon: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+	local sim0=$(gpiosim_chip_name sim0)
 
-	coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 5 2 7 1 6
+	# by offset
+	run_tool gpiomon --chip $sim0 0 0
 
-	gpiosim_set_pull sim0 2 pull-up
-	gpiosim_set_pull sim0 1 pull-up
-	gpiosim_set_pull sim0 6 pull-up
-	sleep 0.2
+	status_is 1
+	output_regex_match ".*lines 0 and 0 are the same"
+
+	# by name
+	run_tool gpiomon foo foo
 
-	coproc_tool_kill
-	coproc_tool_wait
+	status_is 1
+	output_regex_match ".*lines foo and foo are the same"
 
-	test "$status" -eq "0"
-	test "${lines[0]}" = "2"
-	test "${lines[1]}" = "1"
-	test "${lines[2]}" = "6"
+	# by name and offset
+	run_tool gpiomon --chip $sim0 1 foo
+
+	status_is 1
+	output_regex_match ".*lines 1 and foo are the same"
 }
 
-@test "gpiomon: same line twice" {
-	gpiosim_chip sim0 num_lines=8
+@test "gpiomon: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpiomon --strict foobar
 
-	run_tool gpiomon "$(gpiosim_chip_name sim0)" 0 0
+	status_is 1
+	output_regex_match ".*line foobar is not unique"
+}
+
+@test "gpiomon: with lines strictly by name" {
+	# not suggesting this setup makes sense - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+	local sim0=$(gpiosim_chip_name sim0)
+
+	gpiosim_set_pull sim0 1 pull-up
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	dut_run gpiomon --banner --by-name --chip $sim0 42 13
+	dut_flush
+
+	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+1"
+	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+1"
+	gpiosim_set_pull sim0 6 pull-up
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RISING\\s+chip: $sim0\\s+offset:\\s+6"
+	gpiosim_set_pull sim0 6 pull-down
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+FALLING\\s+chip: $sim0\\s+offset:\\s+6"
+	assert_fail dut_readable
 }
 
-@test "gpiomon: no arguments" {
+@test "gpiomon: with no arguments" {
 	run_tool gpiomon
 
-	test "$status" -eq "1"
-	output_regex_match ".*gpiochip must be specified"
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
 }
 
-@test "gpiomon: line not specified" {
+@test "gpiomon: with no line specified" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon "$(gpiosim_chip_name sim0)"
+	run_tool gpiomon --chip $(gpiosim_chip_name sim0)
 
-	test "$status" -eq "1"
-	output_regex_match ".*GPIO line offset must be specified"
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
 }
 
-@test "gpiomon: line out of range" {
+@test "gpiomon: with offset out of range" {
 	gpiosim_chip sim0 num_lines=4
 
-	run_tool gpiomon "$(gpiosim_chip_name sim0)" 5
+	run_tool gpiomon --chip $(gpiosim_chip_name sim0) 5
 
-	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	status_is 1
+	output_regex_match ".*offset 5 is out of range on chip $(gpiosim_chip_name sim0)"
 }
 
-@test "gpiomon: invalid bias" {
+@test "gpiomon: with invalid bias" {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon --bias=bad "$(gpiosim_chip_name sim0)" 0 1
+	run_tool gpiomon --bias=bad -c $(gpiosim_chip_name sim0) 0 1
 
-	test "$status" -eq "1"
+	status_is 1
 	output_regex_match ".*invalid bias.*"
 }
 
-@test "gpiomon: custom format (event type + offset)" {
+@test "gpiomon: with custom format (event type + offset)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e %o" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%e %o" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "1 4"
+	dut_read
+	output_is "1 4"
 }
 
-@test "gpiomon: custom format (event type + offset joined)" {
+@test "gpiomon: with custom format (event type + offset joined)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e%o" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%e%o" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
+	dut_read
+	output_is "14"
+}
 
-	coproc_tool_kill
-	coproc_tool_wait
+@test "gpiomon: with custom format (format menagerie)" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:baz
 
-	test "$status" -eq "0"
-	test "$output" = "14"
+	dut_run gpiomon --banner "--format=%e %o %E %l %c %T" --utc -c $(gpiosim_chip_name sim0) baz
+	dut_flush
+
+	gpiosim_set_pull sim0 4 pull-up
+	dut_regex_match \
+"1 4 rising baz /dev/gpiochip[0-9]+ [0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-1][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z"
 }
 
-@test "gpiomon: custom format (timestamp)" {
+@test "gpiomon: with custom format (timestamp)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%e %o %s.%n" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%e %o %s.%n" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	output_regex_match "1 4 [0-9]+\\.[0-9]+"
+	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
 }
 
-@test "gpiomon: custom format (double percent sign)" {
+@test "gpiomon: with custom format (double percent sign)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%%" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=start%%end" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "%"
+	dut_read
+	output_is "start%end"
 }
 
-@test "gpiomon: custom format (double percent sign + event type specifier)" {
+@test "gpiomon: with custom format (double percent sign + event type specifier)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%%e" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%%e" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "%e"
+	dut_read
+	output_is "%e"
 }
 
-@test "gpiomon: custom format (single percent sign)" {
+@test "gpiomon: with custom format (single percent sign)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "%"
+	dut_read
+	output_is "%"
 }
 
-@test "gpiomon: custom format (single percent sign between other characters)" {
+@test "gpiomon: with custom format (single percent sign between other characters)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=foo % bar" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=foo % bar" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "foo % bar"
+	dut_read
+	output_is "foo % bar"
 }
 
-@test "gpiomon: custom format (unknown specifier)" {
+@test "gpiomon: with custom format (unknown specifier)" {
 	gpiosim_chip sim0 num_lines=8
 
-	coproc_run_tool gpiomon "--format=%x" "$(gpiosim_chip_name sim0)" 4
+	dut_run gpiomon --banner "--format=%x" -c $(gpiosim_chip_name sim0) 4
+	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
-	sleep 0.2
-
-	coproc_tool_kill
-	coproc_tool_wait
-
-	test "$status" -eq "0"
-	test "$output" = "%x"
+	dut_read
+	output_is "%x"
 }
-- 
2.36.1

