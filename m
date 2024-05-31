Return-Path: <linux-gpio+bounces-7013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F728D6363
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D6181F27F32
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06FA158DD6;
	Fri, 31 May 2024 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFXG/UbD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E80158DD3
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163220; cv=none; b=UAaX4LkctjEOqVJodjGEUXkWpKqw8ws2EZObk2R0MoVDOwIse0oITxKUUAEDg2yRuaEyXlw/B5HmHj6LRtT8B6ZLgAseAdFVZxJYMn2XAqoSho8OXRdrTpUg4Y5d3rX/A3NyNvtB7XrGBoO/4c5veGaOcZZb5uRcknMYeFOBvL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163220; c=relaxed/simple;
	bh=wBtzdqpTTozPEPEnw/wgsAFt9qLH1ilX5rgey+D3SA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CF2gM3gsO4plqbwt+4q21XGlquQFrrzN5FAICA3lyqyQCWuE7ubAS5uyhCofi6D4PqJy7q4KfAXycYny7qRrzyOBgsRfRYw1lzHGg/IFHM1LEN8pyrAEdGhLDlVH5KWDZIpuyW+yXF9dqP3gkBSyskmfPqYHoG02SIfqvpHPeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFXG/UbD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7023df18408so1150095b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163217; x=1717768017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtK+bUtW9uIGb0Hnd0PPnRpVdm3589um/xCQGtmI/k4=;
        b=MFXG/UbDV7C1YkRsfttjH32waO7VNmG0KiSrY8PBDQBPqnWLVjDDRhj/07lqD0ux8D
         HKbCOOj6XBRNRbZ57rL5Dp+fqAbE/xBCjeRsd0uMzE/pyQSbJam0tVu82UpPZRNNZTLg
         GZmx2+SbdzgvE/7k0RdDPNSprVqD0EwBFhjoQzNb6ivyesXepdufBvaDSLXbaVXU2Tgd
         vXULxBqM9sf4iyyG3e2pdlt8PFlBMdc34G0cwpQNRnYPhzfWZdQt7gwiX0lwSzigDHAh
         2A+eIrQKzXXW09MjTUZ69ZHek/4CJCX18PohIEqhqwwgBfKWRWJ78l03dIbKznrMloO5
         W1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163217; x=1717768017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtK+bUtW9uIGb0Hnd0PPnRpVdm3589um/xCQGtmI/k4=;
        b=bDLTjLaTLFcW8XtU19KK/lNfdVl5ss4KL9QYGN7nwVshx4eei7VWciBoAIYyGTQxW5
         lyVw4qm8Yj6qiF5qbjHPfYYuMjUhefcD7rDcvftqoacZZhDMtoKJC1MP3yr8Eahc4JFB
         D7DGc0bPh68aEzQb3WObeUNtY9PDamgcCgikagkU16VH+XAjmjpvei9E530FQQhOLCk0
         Mr/9LnQalZ2BgfKC6qMWHdpD1q6lzy6REbjQzzVuV0age2/sCkKFfNJDZNcK8m0f08Q8
         46yiGNnClFGGOz5aNcIPJLMiAPIAV4SGv4wQzpmlcyF7RuRhHbCwvHOZHTOU7h4ZaVPx
         SeUg==
X-Gm-Message-State: AOJu0YyycDrXb0Czi2BnTzIiKv4D1rPbCa5bR5GwJf7ozOaA8csuC8LY
	f7K20uw28lFusNyy+bE+1rGhwE89nIRwCn2ywBPrs9dhLIxcquXEOFZZzg==
X-Google-Smtp-Source: AGHT+IEw2oAQYFqLIOMFD4e1rrWgvv+/Agr/5ZkKYIMy12iDbL2SObccVPKn9zde4gCDZhEFmy7Zfw==
X-Received: by 2002:a05:6a21:6d91:b0:1af:d647:3108 with SMTP id adf61e73a8af0-1b26f0f01f9mr2183889637.2.1717163216249;
        Fri, 31 May 2024 06:46:56 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:55 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 8/8] tools: tests: avoid splitting and globbing
Date: Fri, 31 May 2024 21:45:12 +0800
Message-Id: <20240531134512.443850-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
References: <20240531134512.443850-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2046[1], SC2068[2], SC2068[3] and SC2206[4], all of
which are related to avoiding word splitting and globbing.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1]https://www.shellcheck.net/wiki/SC2046
[2]https://www.shellcheck.net/wiki/SC2068
[3]https://www.shellcheck.net/wiki/SC2086
[4]https://www.shellcheck.net/wiki/SC2206
---
 tools/gpio-tools-test.bash | 398 ++++++++++++++++++-------------------
 1 file changed, 198 insertions(+), 200 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 4551dc2..3b93388 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -14,7 +14,7 @@ DUT_OUTPUT=gpio-tools-test-output
 # once it exits as the COPROC_PID will be cleared.
 DUT_PID=""
 
-SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
+SOURCE_DIR=$(dirname "${BASH_SOURCE[0]}")
 
 # mappings from local name to system chip name, path, dev name
 declare -A GPIOSIM_CHIP_NAME
@@ -70,7 +70,7 @@ gpiosim_chip() {
 	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
 	local BANKPATH=$DEVPATH/bank0
 
-	mkdir -p $BANKPATH
+	mkdir -p "$BANKPATH"
 
 	for ARG in "$@"
 	do
@@ -80,7 +80,7 @@ gpiosim_chip() {
 
 		if [ "$KEY" = "num_lines" ]
 		then
-			echo $VAL > $BANKPATH/num_lines
+			echo "$VAL" > "$BANKPATH/num_lines"
 		elif [ "$KEY" = "line_name" ]
 		then
 			local OFFSET LINENAME
@@ -88,12 +88,12 @@ gpiosim_chip() {
 			LINENAME=$(echo "$VAL" | cut -d":" -f2)
 			local LINEPATH=$BANKPATH/line$OFFSET
 
-			mkdir -p $LINEPATH
-			echo $LINENAME > $LINEPATH/name
+			mkdir -p "$LINEPATH"
+			echo "$LINENAME" > "$LINEPATH/name"
 		fi
 	done
 
-	echo 1 > $DEVPATH/live
+	echo 1 > "$DEVPATH/live"
 
 	local CHIP_NAME
 	CHIP_NAME=$(<"$BANKPATH/chip_name")
@@ -104,12 +104,12 @@ gpiosim_chip() {
 
 gpiosim_chip_number() {
 	local NAME=${GPIOSIM_CHIP_NAME[$1]}
-	echo ${NAME#"gpiochip"}
+	echo "${NAME#gpiochip}"
 }
 
 gpiosim_chip_symlink() {
 	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
-	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
+	ln -s "${GPIOSIM_CHIP_PATH[$1]}" "$GPIOSIM_CHIP_LINK"
 }
 
 gpiosim_chip_symlink_cleanup() {
@@ -126,7 +126,7 @@ gpiosim_set_pull() {
 	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
 	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 
-	echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
+	echo "$PULL" > "$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull"
 }
 
 gpiosim_check_value() {
@@ -135,7 +135,7 @@ gpiosim_check_value() {
 	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
 	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 
-	VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
+	VAL=$(<"$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value")
 	[ "$VAL" = "$EXPECTED" ]
 }
 
@@ -147,20 +147,20 @@ gpiosim_wait_value() {
 	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
 
 	for _i in {1..30}; do
-		[ "$(<$PORT)" = "$EXPECTED" ] && return
+		[ "$(<"$PORT")" = "$EXPECTED" ] && return
 		sleep 0.01
 	done
 	return 1
 }
 
 gpiosim_cleanup() {
-	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
+	for CHIP in "${!GPIOSIM_CHIP_NAME[@]}"
 	do
 		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
 
 		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
 
-		echo 0 > $DEVPATH/live
+		echo 0 > "$DEVPATH/live"
 		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
 		find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+'
 		find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+'
@@ -202,9 +202,9 @@ dut_run_redirect() {
 }
 
 dut_read_redirect() {
-	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
+	output=$(<"$SHUNIT_TMPDIR/$DUT_OUTPUT")
 	local ORIG_IFS="$IFS"
-	IFS=$'\n' lines=($output)
+	IFS=$'\n' mapfile -t lines <<< "$output"
 	IFS="$ORIG_IFS"
 }
 
@@ -220,11 +220,11 @@ dut_read() {
 		fi
 		lines+=("$LINE")
 	done
-	output="${lines[@]}"
+	output="${lines[*]}"
 }
 
 dut_readable() {
-	read -t 0 -u ${COPROC[0]} LINE
+	read -t 0 -u "${COPROC[0]}" LINE
 }
 
 dut_flush() {
@@ -253,17 +253,15 @@ dut_regex_match() {
 }
 
 dut_write() {
-	echo "$@" >&${COPROC[1]}
+	echo "$@" >&"${COPROC[1]}"
 }
 
 dut_kill() {
-	SIGNUM=$1
-
-	kill $SIGNUM $DUT_PID
+	kill "$@" "$DUT_PID"
 }
 
 dut_wait() {
-	wait $DUT_PID
+	wait "$DUT_PID"
 	export status=$?
 	unset DUT_PID
 }
@@ -271,10 +269,10 @@ dut_wait() {
 dut_cleanup() {
 	if [ -n "$DUT_PID" ]
 	then
-		kill -SIGTERM $DUT_PID 2> /dev/null
-		wait $DUT_PID || false
+		kill -SIGTERM "$DUT_PID" 2> /dev/null
+		wait "$DUT_PID" || false
 	fi
-	rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
+	rm -f "$SHUNIT_TMPDIR/$DUT_OUTPUT"
 }
 
 tearDown() {
@@ -283,7 +281,7 @@ tearDown() {
 }
 
 request_release_line() {
-	$SOURCE_DIR/gpioget -c "$@" >/dev/null
+	"$SOURCE_DIR/gpioget" -c "$@" >/dev/null
 }
 
 #
@@ -332,21 +330,21 @@ test_gpiodetect_a_chip() {
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
 	# by name
-	run_tool gpiodetect $sim0
+	run_tool gpiodetect "$sim0"
 
 	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by path
-	run_tool gpiodetect ${GPIOSIM_CHIP_PATH[sim1]}
+	run_tool gpiodetect "${GPIOSIM_CHIP_PATH[sim1]}"
 
 	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by number
-	run_tool gpiodetect $(gpiosim_chip_number sim2)
+	run_tool gpiodetect "$(gpiosim_chip_number sim2)"
 
 	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
@@ -354,7 +352,7 @@ test_gpiodetect_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim2 .
-	run_tool gpiodetect $GPIOSIM_CHIP_LINK
+	run_tool gpiodetect "$GPIOSIM_CHIP_LINK"
 
 	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
@@ -373,7 +371,7 @@ test_gpiodetect_multiple_chips() {
 	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
-	run_tool gpiodetect $sim0 $sim1 $sim2
+	run_tool gpiodetect "$sim0" "$sim1" "$sim2"
 
 	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
@@ -441,7 +439,7 @@ test_gpioinfo_a_chip() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by name
-	run_tool gpioinfo --chip $sim1
+	run_tool gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -452,7 +450,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by path
-	run_tool gpioinfo --chip $sim1
+	run_tool gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -463,7 +461,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by number
-	run_tool gpioinfo --chip $sim1
+	run_tool gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -475,7 +473,7 @@ test_gpioinfo_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim1 .
-	run_tool gpioinfo --chip $GPIOSIM_CHIP_LINK
+	run_tool gpioinfo --chip "$GPIOSIM_CHIP_LINK"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -494,7 +492,7 @@ test_gpioinfo_a_line() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim1 2
+	run_tool gpioinfo --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+\"bar\"\\s+input"
 	num_lines_is 1
@@ -508,14 +506,14 @@ test_gpioinfo_a_line() {
 	status_is 0
 
 	# by chip and name
-	run_tool gpioinfo --chip $sim1 2
+	run_tool gpioinfo --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+\"bar\"\\s+input"
 	num_lines_is 1
 	status_is 0
 
 	# unquoted
-	run_tool gpioinfo --unquoted --chip $sim1 2
+	run_tool gpioinfo --unquoted --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+bar\\s+input"
 	num_lines_is 1
@@ -547,7 +545,7 @@ test_gpioinfo_multiple_lines() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim1 1 2
+	run_tool gpioinfo --chip "$sim1" 1 2
 
 	output_regex_match "$sim1 1\\s+unnamed\\s+input"
 	output_regex_match "$sim1 2\\s+\"baz\"\\s+input"
@@ -563,7 +561,7 @@ test_gpioinfo_multiple_lines() {
 	status_is 0
 
 	# by name and offset
-	run_tool gpioinfo --chip $sim0 bar 3
+	run_tool gpioinfo --chip "$sim0" bar 3
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	output_regex_match "$sim0 3\\s+unnamed\\s+input"
@@ -652,7 +650,7 @@ test_gpioinfo_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim0 1 1
+	run_tool gpioinfo --chip "$sim0" 1 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines '1' and '1' are the same line"
@@ -668,7 +666,7 @@ test_gpioinfo_with_same_line_twice() {
 	status_is 1
 
 	# by name and offset
-	run_tool gpioinfo --chip $sim0 foo 1
+	run_tool gpioinfo --chip "$sim0" foo 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines 'foo' and '1' are the same line"
@@ -703,7 +701,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# first by offset (to show offsets match first)
-	run_tool gpioinfo --chip $sim0 1 6
+	run_tool gpioinfo --chip "$sim0" 1 6
 
 	output_regex_match "$sim0 1\\s+\"6\"\\s+input"
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
@@ -711,7 +709,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	status_is 0
 
 	# then strictly by name
-	run_tool gpioinfo --by-name --chip $sim0 1
+	run_tool gpioinfo --by-name --chip "$sim0" 1
 
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
 	num_lines_is 1
@@ -734,7 +732,7 @@ test_gpioinfo_with_nonexistent_line() {
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
 
-	run_tool gpioinfo --chip ${GPIOSIM_CHIP_NAME[sim0]} nonexistent-line
+	run_tool gpioinfo --chip "${GPIOSIM_CHIP_NAME[sim0]}" nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -745,7 +743,7 @@ test_gpioinfo_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioinfo --chip $sim0 0 1 2 3 4 5
+	run_tool gpioinfo --chip "$sim0" 0 1 2 3 4 5
 
 	output_regex_match "$sim0 0\\s+unnamed\\s+input"
 	output_regex_match "$sim0 1\\s+unnamed\\s+input"
@@ -782,12 +780,12 @@ test_gpioget_by_offset() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
+	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
 
 	output_is "\"1\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
+	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
 
 	output_is "1=active"
 	status_is 0
@@ -799,7 +797,7 @@ test_gpioget_by_symlink() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip $GPIOSIM_CHIP_LINK 1
+	run_tool gpioget --chip "$GPIOSIM_CHIP_LINK" 1
 
 	output_is "\"1\"=active"
 	status_is 0
@@ -811,12 +809,12 @@ test_gpioget_by_chip_and_name() {
 
 	gpiosim_set_pull sim1 3 pull-up
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
+	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
 
 	output_is "\"foo\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
+	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
 
 	output_is "foo=active"
 	status_is 0
@@ -845,7 +843,7 @@ test_gpioget_multiple_lines() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1 2 3 4 5 6 7
+	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=active 3=active 4=inactive 5=active 6=inactive 7=active"
@@ -861,7 +859,7 @@ test_gpioget_multiple_lines_by_name_and_offset() {
 	gpiosim_set_pull sim0 4 pull-up
 	gpiosim_set_pull sim0 6 pull-up
 
-	run_tool gpioget --chip $sim0 0 foo 4 bar
+	run_tool gpioget --chip "$sim0" 0 foo 4 bar
 
 	output_is "\"0\"=inactive \"foo\"=active \"4\"=active \"bar\"=active"
 	status_is 0
@@ -890,7 +888,7 @@ test_gpioget_with_numeric_values() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --numeric --chip $sim0 0 1 2 3 4 5 6 7
+	run_tool gpioget --numeric --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is "0 0 1 1 0 1 0 1"
 	status_is 0
@@ -906,7 +904,7 @@ test_gpioget_with_active_low() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --active-low --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_tool gpioget --active-low --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=inactive 3=inactive 4=active 5=inactive 6=active 7=inactive"
@@ -937,7 +935,7 @@ test_gpioget_with_pull_up() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-up --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_tool gpioget --bias=pull-up --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=active 3=active 4=active 5=active 6=active 7=active"
@@ -954,7 +952,7 @@ test_gpioget_with_pull_down() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-down --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_tool gpioget --bias=pull-down --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=inactive 3=inactive 4=inactive 5=inactive 6=inactive 7=inactive"
@@ -1026,12 +1024,12 @@ test_gpioget_with_lines_by_offset() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "\"1\"=active \"6\"=inactive"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "1=active 6=inactive"
 	status_is 0
@@ -1045,12 +1043,12 @@ test_gpioget_with_lines_strictly_by_name() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_tool gpioget --by-name --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "\"1\"=inactive \"6\"=active"
 	status_is 0
 
-	run_tool gpioget --by-name --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_tool gpioget --by-name --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "1=inactive 6=active"
 	status_is 0
@@ -1066,7 +1064,7 @@ test_gpioget_with_no_arguments() {
 test_gpioget_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -1076,7 +1074,7 @@ test_gpioget_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --chip $sim0 0 1 2 3 4 5
+	run_tool gpioget --chip "$sim0" 0 1 2 3 4 5
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1095,7 +1093,7 @@ test_gpioget_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioget --chip $sim0 0 0
+	run_tool gpioget --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
@@ -1107,19 +1105,19 @@ test_gpioget_with_same_line_twice() {
 	status_is 1
 
 	# by chip and name
-	run_tool gpioget --chip $sim0 foo foo
+	run_tool gpioget --chip "$sim0" foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioget --chip $sim0 foo 1
+	run_tool gpioget --chip "$sim0" foo 1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioget --chip $sim0 1 foo
+	run_tool gpioget --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -1128,7 +1126,7 @@ test_gpioget_with_same_line_twice() {
 test_gpioget_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1
+	run_tool gpioget --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1137,7 +1135,7 @@ test_gpioget_with_invalid_bias() {
 test_gpioget_with_invalid_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --hold-period=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0
+	run_tool gpioget --hold-period=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1158,7 +1156,7 @@ test_gpioset_by_name() {
 test_gpioset_by_offset() {
 	gpiosim_chip sim0 num_lines=8
 
-	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 1=1
+	dut_run gpioset --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1=1
 
 	gpiosim_check_value sim0 1 1
 }
@@ -1167,7 +1165,7 @@ test_gpioset_by_symlink() {
 	gpiosim_chip sim0 num_lines=8
 	gpiosim_chip_symlink sim0 .
 
-	dut_run gpioset --banner --chip $GPIOSIM_CHIP_LINK 1=1
+	dut_run gpioset --banner --chip "$GPIOSIM_CHIP_LINK" 1=1
 
 	gpiosim_check_value sim0 1 1
 }
@@ -1176,7 +1174,7 @@ test_gpioset_by_chip_and_name() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 	gpiosim_chip sim1 num_lines=8 line_name=3:foo
 
-	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim1]} foo=1
+	dut_run gpioset --banner --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo=1
 
 	gpiosim_check_value sim1 3 1
 }
@@ -1198,7 +1196,7 @@ test_gpioset_multiple_lines() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpioset --banner --chip $sim0 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+	dut_run gpioset --banner --chip "$sim0" 0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
 	gpiosim_check_value sim0 1 0
@@ -1213,7 +1211,7 @@ test_gpioset_multiple_lines() {
 test_gpioset_multiple_lines_by_name_and_offset() {
 	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
 
-	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 foo=1 bar=1 3=1
+	dut_run gpioset --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 foo=1 bar=1 3=1
 
 	gpiosim_check_value sim0 0 1
 	gpiosim_check_value sim0 1 1
@@ -1238,7 +1236,7 @@ test_gpioset_with_active_low() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpioset --banner --active-low -c $sim0 \
+	dut_run gpioset --banner --active-low -c "$sim0" \
 		0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 1
@@ -1272,7 +1270,7 @@ test_gpioset_with_push_pull() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpioset --banner --drive=push-pull --chip $sim0 \
+	dut_run gpioset --banner --drive=push-pull --chip "$sim0" \
 		0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
@@ -1295,7 +1293,7 @@ test_gpioset_with_open_drain() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	dut_run gpioset --banner --drive=open-drain --chip $sim0 \
+	dut_run gpioset --banner --drive=open-drain --chip "$sim0" \
 		0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
@@ -1318,7 +1316,7 @@ test_gpioset_with_open_source() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpioset --banner --drive=open-source --chip $sim0 \
+	dut_run gpioset --banner --drive=open-source --chip "$sim0" \
 		0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
@@ -1337,7 +1335,7 @@ test_gpioset_with_pull_up() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpioset --banner --bias=pull-up --drive=open-drain \
-		--chip $sim0 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+		--chip "$sim0" 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
 	gpiosim_check_value sim0 1 0
@@ -1355,7 +1353,7 @@ test_gpioset_with_pull_down() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpioset --banner --bias=pull-down --drive=open-source \
-		--chip $sim0 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+		--chip "$sim0" 0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 0 0
 	gpiosim_check_value sim0 1 0
@@ -1381,7 +1379,7 @@ test_gpioset_with_value_variants() {
 	gpiosim_set_pull sim0 6 pull-up
 	gpiosim_set_pull sim0 7 pull-down
 
-	dut_run gpioset --banner --chip $sim0 0=0 1=1 2=active \
+	dut_run gpioset --banner --chip "$sim0" 0=0 1=1 2=active \
 		3=inactive 4=on 5=off 6=false 7=true
 
 	gpiosim_check_value sim0 0 0
@@ -1401,7 +1399,7 @@ test_gpioset_with_hold_period() {
 
 	gpiosim_set_pull sim0 5 pull-up
 
-	dut_run gpioset --banner --hold-period=1200ms -t0 --chip $sim0 0=1 5=0 7=1
+	dut_run gpioset --banner --hold-period=1200ms -t0 --chip "$sim0" 0=1 5=0 7=1
 
 	gpiosim_check_value sim0 0 1
 	gpiosim_check_value sim0 5 0
@@ -1417,7 +1415,7 @@ test_gpioset_interactive_exit() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpioset --interactive --chip $sim0 1=0 2=1 5=1 6=0 7=1
+	dut_run gpioset --interactive --chip "$sim0" 1=0 2=1 5=1 6=0 7=1
 
 	gpiosim_check_value sim0 1 0
 	gpiosim_check_value sim0 2 1
@@ -1656,7 +1654,7 @@ test_gpioset_with_lines_by_offset() {
 	gpiosim_set_pull sim0 1 pull-down
 	gpiosim_set_pull sim0 6 pull-up
 
-	dut_run gpioset --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 6=1 1=0
+	dut_run gpioset --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 6=1 1=0
 
 	gpiosim_check_value sim0 1 0
 	gpiosim_check_value sim0 6 1
@@ -1670,7 +1668,7 @@ test_gpioset_with_lines_strictly_by_name() {
 	gpiosim_set_pull sim0 1 pull-down
 	gpiosim_set_pull sim0 6 pull-up
 
-	dut_run gpioset --banner --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 6=1 1=0
+	dut_run gpioset --banner --by-name --chip "${GPIOSIM_CHIP_NAME[sim0]}" 6=1 1=0
 
 	gpiosim_check_value sim0 1 1
 	gpiosim_check_value sim0 6 0
@@ -1708,7 +1706,7 @@ test_gpioset_with_no_arguments() {
 test_gpioset_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_tool gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line value must be specified"
 	status_is 1
@@ -1719,7 +1717,7 @@ test_gpioset_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --chip $sim0 0=1 1=1 2=1 3=1 4=1 5=1
+	run_tool gpioset --chip "$sim0" 0=1 1=1 2=1 3=1 4=1 5=1
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1731,7 +1729,7 @@ test_gpioset_with_invalid_hold_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --hold-period=bad --chip $sim0 0=1
+	run_tool gpioset --hold-period=bad --chip "$sim0" 0=1
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1743,13 +1741,13 @@ test_gpioset_with_invalid_value() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by name
-	run_tool gpioset --chip $sim0 0=c
+	run_tool gpioset --chip "$sim0" 0=c
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
 
 	# by value
-	run_tool gpioset --chip $sim0 0=3
+	run_tool gpioset --chip "$sim0" 0=3
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
@@ -1758,7 +1756,7 @@ test_gpioset_with_invalid_value() {
 test_gpioset_with_invalid_offset() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]} 4000000000=0
+	run_tool gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4000000000=0
 
 	output_regex_match ".*cannot find line '4000000000'"
 	status_is 1
@@ -1767,7 +1765,7 @@ test_gpioset_with_invalid_offset() {
 test_gpioset_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+	run_tool gpioset --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1776,7 +1774,7 @@ test_gpioset_with_invalid_bias() {
 test_gpioset_with_invalid_drive() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --drive=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+	run_tool gpioset --drive=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
 
 	output_regex_match ".*invalid drive.*"
 	status_is 1
@@ -1787,7 +1785,7 @@ test_gpioset_with_interactive_and_toggle() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --interactive --toggle 1s --chip $sim0 0=1
+	run_tool gpioset --interactive --toggle 1s --chip "$sim0" 0=1
 
 	output_regex_match ".*can't combine interactive with toggle"
 	status_is 1
@@ -1806,25 +1804,25 @@ test_gpioset_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioset --chip $sim0 0=1 0=1
+	run_tool gpioset --chip "$sim0" 0=1 0=1
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpioset --chip $sim0 foo=1 foo=1
+	run_tool gpioset --chip "$sim0" foo=1 foo=1
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioset --chip $sim0 foo=1 1=1
+	run_tool gpioset --chip "$sim0" foo=1 1=1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioset --chip $sim0 1=1 foo=1
+	run_tool gpioset --chip "$sim0" 1=1 foo=1
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -1856,7 +1854,7 @@ test_gpiomon_by_offset() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpiomon --banner --edges=rising --chip $sim0 4
+	dut_run gpiomon --banner --edges=rising --chip "$sim0" 4
 	dut_regex_match "Monitoring line .*"
 
 	gpiosim_set_pull sim0 4 pull-down
@@ -1874,7 +1872,7 @@ test_gpiomon_by_symlink() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpiomon --banner --edges=rising --chip $GPIOSIM_CHIP_LINK 4
+	dut_run gpiomon --banner --edges=rising --chip "$GPIOSIM_CHIP_LINK" 4
 	dut_regex_match "Monitoring line .*"
 
 	gpiosim_set_pull sim0 4 pull-down
@@ -1893,7 +1891,7 @@ test_gpiomon_by_chip_and_name() {
 
 	gpiosim_set_pull sim1 0 pull-up
 
-	dut_run gpiomon --banner --edges=rising --chip $sim1 foo
+	dut_run gpiomon --banner --edges=rising --chip "$sim1" foo
 	dut_regex_match "Monitoring line .*"
 
 	gpiosim_set_pull sim1 2 pull-down
@@ -1925,7 +1923,7 @@ test_gpiomon_rising_edge() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpiomon --banner --edges=rising --chip $sim0 4
+	dut_run gpiomon --banner --edges=rising --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-down
@@ -1941,7 +1939,7 @@ test_gpiomon_falling_edge() {
 
 	gpiosim_set_pull sim0 4 pull-down
 
-	dut_run gpiomon --banner --edges=falling --chip $sim0 4
+	dut_run gpiomon --banner --edges=falling --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -1955,7 +1953,7 @@ test_gpiomon_both_edges() {
 	gpiosim_chip sim0 num_lines=8
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --edges=both --chip $sim0 4
+	dut_run gpiomon --banner --edges=both --chip "$sim0" 4
 	dut_regex_match "Monitoring line .*"
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -1971,7 +1969,7 @@ test_gpiomon_with_pull_up() {
 
 	gpiosim_set_pull sim0 4 pull-down
 
-	dut_run gpiomon --banner --bias=pull-up --chip $sim0 4
+	dut_run gpiomon --banner --bias=pull-up --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-down
@@ -1986,7 +1984,7 @@ test_gpiomon_with_pull_down() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpiomon --banner --bias=pull-down --chip $sim0 4
+	dut_run gpiomon --banner --bias=pull-down --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2002,7 +2000,7 @@ test_gpiomon_with_active_low() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpiomon --banner --active-low --chip $sim0 4
+	dut_run gpiomon --banner --active-low --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-down
@@ -2035,7 +2033,7 @@ test_gpiomon_with_quiet_mode() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --edges=rising --quiet --chip $sim0 4
+	dut_run gpiomon --banner --edges=rising --quiet --chip "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2063,7 +2061,7 @@ test_gpiomon_with_num_events() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# redirect, as gpiomon exits after 4 events
-	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
+	dut_run_redirect gpiomon --num-events=4 --chip "$sim0" 4
 
 	gpiosim_set_pull sim0 4 pull-up
 	sleep 0.01
@@ -2107,7 +2105,7 @@ test_gpiomon_with_idle_timeout() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# redirect, as gpiomon exits
-	dut_run_redirect gpiomon --idle-timeout 10ms --chip $sim0 4
+	dut_run_redirect gpiomon --idle-timeout 10ms --chip "$sim0" 4
 
 	dut_wait
 	status_is 0
@@ -2120,7 +2118,7 @@ test_gpiomon_multiple_lines() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --format=%o --chip $sim0 1 3 2 5 4
+	dut_run gpiomon --banner --format=%o --chip "$sim0" 1 3 2 5 4
 	dut_regex_match "Monitoring lines .*"
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -2138,7 +2136,7 @@ test_gpiomon_multiple_lines_by_name_and_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --format=%o --chip $sim0 foo bar 3
+	dut_run gpiomon --banner --format=%o --chip "$sim0" foo bar 3
 	dut_regex_match "Monitoring lines .*"
 
 	gpiosim_set_pull sim0 2 pull-up
@@ -2173,7 +2171,7 @@ test_gpiomon_exit_after_SIGINT() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --chip $sim0 4
+	dut_run gpiomon --banner --chip "$sim0" 4
 	dut_regex_match "Monitoring line .*"
 
 	dut_kill -SIGINT
@@ -2187,7 +2185,7 @@ test_gpiomon_exit_after_SIGTERM() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner --chip $sim0 4
+	dut_run gpiomon --banner --chip "$sim0" 4
 	dut_regex_match "Monitoring line .*"
 
 	dut_kill -SIGTERM
@@ -2209,7 +2207,7 @@ test_gpiomon_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpiomon --chip $sim0 0 0
+	run_tool gpiomon --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
@@ -2221,7 +2219,7 @@ test_gpiomon_with_same_line_twice() {
 	status_is 1
 
 	# by name and offset
-	run_tool gpiomon --chip $sim0 1 foo
+	run_tool gpiomon --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -2248,7 +2246,7 @@ test_gpiomon_with_lines_by_offset() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	dut_run gpiomon --banner --chip $sim0 6 1
+	dut_run gpiomon --banner --chip "$sim0" 6 1
 	dut_flush
 
 	gpiosim_set_pull sim0 1 pull-down
@@ -2275,7 +2273,7 @@ test_gpiomon_with_lines_strictly_by_name() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	dut_run gpiomon --banner --by-name --chip $sim0 42 13
+	dut_run gpiomon --banner --by-name --chip "$sim0" 42 13
 	dut_flush
 
 	gpiosim_set_pull sim0 1 pull-down
@@ -2303,7 +2301,7 @@ test_gpiomon_with_no_arguments() {
 test_gpiomon_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_tool gpiomon --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2314,7 +2312,7 @@ test_gpiomon_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --chip $sim0 5
+	run_tool gpiomon --chip "$sim0" 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2325,7 +2323,7 @@ test_gpiomon_with_invalid_bias() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --bias=bad -c $sim0 0 1
+	run_tool gpiomon --bias=bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -2336,7 +2334,7 @@ test_gpiomon_with_invalid_debounce_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --debounce-period bad -c $sim0 0 1
+	run_tool gpiomon --debounce-period bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2347,7 +2345,7 @@ test_gpiomon_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --idle-timeout bad -c $sim0 0 1
+	run_tool gpiomon --idle-timeout bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2358,7 +2356,7 @@ test_gpiomon_with_custom_format_event_type_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%e %o" -c $sim0 4
+	dut_run gpiomon --banner "--format=%e %o" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2371,7 +2369,7 @@ test_gpiomon_with_custom_format_event_type_offset_joined() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%e%o" -c $sim0 4
+	dut_run gpiomon --banner "--format=%e%o" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2384,7 +2382,7 @@ test_gpiomon_with_custom_format_edge_chip_and_line() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%e %o %E %c %l" -c $sim0 baz
+	dut_run gpiomon --banner "--format=%e %o %E %c %l" -c "$sim0" baz
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2396,7 +2394,7 @@ test_gpiomon_with_custom_format_seconds_timestamp() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%e %o %S" -c $sim0 4
+	dut_run gpiomon --banner "--format=%e %o %S" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2409,7 +2407,7 @@ test_gpiomon_with_custom_format_UTC_timestamp() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpiomon --banner "--format=%U %e %o " --event-clock=realtime \
-		-c $sim0 4
+		-c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2423,7 +2421,7 @@ test_gpiomon_with_custom_format_localtime_timestamp() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpiomon --banner "--format=%L %e %o" --event-clock=realtime \
-		-c $sim0 4
+		-c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2436,7 +2434,7 @@ test_gpiomon_with_custom_format_double_percent_sign() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=start%%end" -c $sim0 4
+	dut_run gpiomon --banner "--format=start%%end" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2449,7 +2447,7 @@ test_gpiomon_with_custom_format_double_percent_sign_event_type_specifier() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%%e" -c $sim0 4
+	dut_run gpiomon --banner "--format=%%e" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2462,7 +2460,7 @@ test_gpiomon_with_custom_format_single_percent_sign() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%" -c $sim0 4
+	dut_run gpiomon --banner "--format=%" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2475,7 +2473,7 @@ test_gpiomon_with_custom_format_single_percent_sign_between_other_characters() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=foo % bar" -c $sim0 4
+	dut_run gpiomon --banner "--format=foo % bar" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2488,7 +2486,7 @@ test_gpiomon_with_custom_format_unknown_specifier() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpiomon --banner "--format=%x" -c $sim0 4
+	dut_run gpiomon --banner "--format=%x" -c "$sim0" 4
 	dut_flush
 
 	gpiosim_set_pull sim0 4 pull-up
@@ -2508,7 +2506,7 @@ test_gpionotify_by_name() {
 	dut_run gpionotify --banner foo
 	dut_regex_match "Watching line .*"
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foo\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foo\""
@@ -2520,10 +2518,10 @@ test_gpionotify_by_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --chip $sim0 4
+	dut_run gpionotify --banner --chip "$sim0" 4
 	dut_regex_match "Watching line .*"
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
 
@@ -2536,10 +2534,10 @@ test_gpionotify_by_symlink() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --chip $GPIOSIM_CHIP_LINK 4
+	dut_run gpionotify --banner --chip "$GPIOSIM_CHIP_LINK" 4
 	dut_regex_match "Watching line .*"
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0\\s+4"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0\\s+4"
 
@@ -2552,10 +2550,10 @@ test_gpionotify_by_chip_and_name() {
 
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
-	dut_run gpionotify --banner --chip $sim1 foo
+	dut_run gpionotify --banner --chip "$sim1" foo
 	dut_regex_match "Watching line .*"
 
-	request_release_line $sim1 2
+	request_release_line "$sim1" 2
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim1 2 \"foo\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim1 2 \"foo\""
 
@@ -2572,7 +2570,7 @@ test_gpionotify_first_matching_named_line() {
 	dut_run gpionotify --banner foobar
 	dut_regex_match "Watching line .*"
 
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 3
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foobar\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foobar\""
 
@@ -2586,10 +2584,10 @@ test_gpionotify_with_requested() {
 
 	gpiosim_set_pull sim0 4 pull-up
 
-	dut_run gpionotify --banner --event=requested --chip $sim0 4
+	dut_run gpionotify --banner --event=requested --chip "$sim0" 4
 	dut_flush
 
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
 	assert_fail dut_readable
 }
@@ -2600,10 +2598,10 @@ test_gpionotify_with_released() {
 
 	gpiosim_set_pull sim0 4 pull-down
 
-	dut_run gpionotify --banner --event=released --chip $sim0 4
+	dut_run gpionotify --banner --event=released --chip "$sim0" 4
 	dut_flush
 
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
 	assert_fail dut_readable
 }
@@ -2613,10 +2611,10 @@ test_gpionotify_with_quiet_mode() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --quiet --chip $sim0 4
+	dut_run gpionotify --banner --quiet --chip "$sim0" 4
 	dut_flush
 
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 4
 	assert_fail dut_readable
 }
 
@@ -2628,7 +2626,7 @@ test_gpionotify_with_unquoted() {
 	dut_run gpionotify --banner --unquoted foo
 	dut_regex_match "Watching line .*"
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+foo"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foo"
@@ -2640,11 +2638,11 @@ test_gpionotify_with_num_events() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# redirect, as gpionotify exits after 4 events
-	dut_run_redirect gpionotify --num-events=4 --chip $sim0 3 4
+	dut_run_redirect gpionotify --num-events=4 --chip "$sim0" 3 4
 
 
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
-	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 4
+	request_release_line "${GPIOSIM_CHIP_NAME[sim0]}" 3
 
 	dut_wait
 	status_is 0
@@ -2663,7 +2661,7 @@ test_gpionotify_with_idle_timeout() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# redirect, as gpionotify exits
-	dut_run_redirect gpionotify --idle-timeout 10ms --chip $sim0 3 4
+	dut_run_redirect gpionotify --idle-timeout 10ms --chip "$sim0" 3 4
 
 	dut_wait
 	status_is 0
@@ -2677,18 +2675,18 @@ test_gpionotify_multiple_lines() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --chip $sim0 1 2 3 4 5
+	dut_run gpionotify --banner --chip "$sim0" 1 2 3 4 5
 	dut_regex_match "Watching lines .*"
 
-	request_release_line $sim0 2
+	request_release_line "$sim0" 2
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 2"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 2"
 
-	request_release_line $sim0 3
+	request_release_line "$sim0" 3
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3"
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
 
@@ -2700,18 +2698,18 @@ test_gpionotify_multiple_lines_by_name_and_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --chip $sim0 bar foo 3
+	dut_run gpionotify --banner --chip "$sim0" bar foo 3
 	dut_regex_match "Watching lines .*"
 
-	request_release_line $sim0 2
+	request_release_line "$sim0" 2
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 2\\s+\"bar\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 2\\s+\"bar\""
 
-	request_release_line $sim0 1
+	request_release_line "$sim0" 1
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 1\\s+\"foo\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 1\\s+\"foo\""
 
-	request_release_line $sim0 3
+	request_release_line "$sim0" 3
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3"
 
@@ -2728,19 +2726,19 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
 	dut_run gpionotify --banner baz bar foo xyz
 	dut_regex_match "Watching lines .*"
 
-	request_release_line $sim0 2
+	request_release_line "$sim0" 2
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"bar\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"bar\""
 
-	request_release_line $sim0 1
+	request_release_line "$sim0" 1
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foo\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foo\""
 
-	request_release_line $sim1 4
+	request_release_line "$sim1" 4
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"xyz\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"xyz\""
 
-	request_release_line $sim1 0
+	request_release_line "$sim1" 0
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"baz\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"baz\""
 
@@ -2750,7 +2748,7 @@ test_gpionotify_multiple_lines_across_multiple_chips() {
 test_gpionotify_exit_after_SIGINT() {
 	gpiosim_chip sim0 num_lines=8
 
-	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_run gpionotify --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4
 	dut_regex_match "Watching line .*"
 
 	dut_kill -SIGINT
@@ -2762,7 +2760,7 @@ test_gpionotify_exit_after_SIGINT() {
 test_gpionotify_exit_after_SIGTERM() {
 	gpiosim_chip sim0 num_lines=8
 
-	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_run gpionotify --banner --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4
 	dut_regex_match "Watching line .*"
 
 	dut_kill -SIGTERM
@@ -2784,7 +2782,7 @@ test_gpionotify_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpionotify --chip $sim0 0 0
+	run_tool gpionotify --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	num_lines_is 1
@@ -2798,7 +2796,7 @@ test_gpionotify_with_same_line_twice() {
 	status_is 1
 
 	# by name and offset
-	run_tool gpionotify --chip $sim0 1 foo
+	run_tool gpionotify --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	num_lines_is 1
@@ -2825,14 +2823,14 @@ test_gpionotify_with_lines_by_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --chip $sim0 1
+	dut_run gpionotify --banner --chip "$sim0" 1
 	dut_flush
 
-	request_release_line $sim0 1
+	request_release_line "$sim0" 1
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 1"
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 1"
 
-	request_release_line $sim0 6
+	request_release_line "$sim0" 6
 
 	assert_fail dut_readable
 }
@@ -2844,14 +2842,14 @@ test_gpionotify_with_lines_strictly_by_name() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --by-name --chip $sim0 1
+	dut_run gpionotify --banner --by-name --chip "$sim0" 1
 	dut_flush
 
-	request_release_line $sim0 6
+	request_release_line "$sim0" 6
 	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 6 \"1\""
 	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 6 \"1\""
 
-	request_release_line $sim0 1
+	request_release_line "$sim0" 1
 	assert_fail dut_readable
 }
 
@@ -2865,7 +2863,7 @@ test_gpionotify_with_no_arguments() {
 test_gpionotify_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpionotify --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_tool gpionotify --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2876,7 +2874,7 @@ test_gpionotify_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --chip $sim0 5
+	run_tool gpionotify --chip "$sim0" 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2887,7 +2885,7 @@ test_gpionotify_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --idle-timeout bad -c $sim0 0 1
+	run_tool gpionotify --idle-timeout bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2898,10 +2896,10 @@ test_gpionotify_with_custom_format_event_type_offset() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=%e %o" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=%e %o" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "1 4"
 }
@@ -2911,10 +2909,10 @@ test_gpionotify_with_custom_format_event_type_offset_joined() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=%e%o" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=%e%o" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "14"
 }
@@ -2925,10 +2923,10 @@ test_gpionotify_with_custom_format_event_chip_and_line() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpionotify --banner --event=released \
-		"--format=%e %o %E %c %l" -c $sim0 baz
+		"--format=%e %o %E %c %l" -c "$sim0" baz
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match "2 4 released $sim0 baz"
 }
 
@@ -2938,10 +2936,10 @@ test_gpionotify_with_custom_format_seconds_timestamp() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpionotify --banner --event=requested "--format=%e %o %S" \
-		-c $sim0 4
+		-c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
 }
 
@@ -2951,10 +2949,10 @@ test_gpionotify_with_custom_format_UTC_timestamp() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpionotify --banner --event=released \
-		"--format=%U %e %o" -c $sim0 4
+		"--format=%U %e %o" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match \
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 2 4"
 }
@@ -2965,10 +2963,10 @@ test_gpionotify_with_custom_format_localtime_timestamp() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpionotify --banner --event=released \
-		"--format=%L %e %o" -c $sim0 4
+		"--format=%L %e %o" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_regex_match \
 "[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 2 4"
 }
@@ -2979,10 +2977,10 @@ test_gpionotify_with_custom_format_double_percent_sign() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	dut_run gpionotify --banner --event=requested "--format=start%%end" \
-		-c $sim0 4
+		-c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "start%end"
 }
@@ -2992,10 +2990,10 @@ test_gpionotify_with_custom_format_double_percent_sign_event_type_specifier() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=%%e" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=%%e" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "%e"
 }
@@ -3005,10 +3003,10 @@ test_gpionotify_with_custom_format_single_percent_sign() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=%" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=%" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "%"
 }
@@ -3018,10 +3016,10 @@ test_gpionotify_with_custom_format_single_percent_sign_between_other_characters(
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=foo % bar" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=foo % bar" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "foo % bar"
 }
@@ -3031,10 +3029,10 @@ test_gpionotify_with_custom_format_unknown_specifier() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	dut_run gpionotify --banner --event=requested "--format=%x" -c $sim0 4
+	dut_run gpionotify --banner --event=requested "--format=%x" -c "$sim0" 4
 	dut_flush
 
-	request_release_line $sim0 4
+	request_release_line "$sim0" 4
 	dut_read
 	output_is "%x"
 }
-- 
2.39.2


