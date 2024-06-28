Return-Path: <linux-gpio+bounces-7787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E227691C1B8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 393641F239BE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034A31C0DF1;
	Fri, 28 Jun 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYJh7bM7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A21C0DD6
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586428; cv=none; b=kUmkW9XGy9+D/4Fg6udyPsv7XULCBoV3Wlgls3PoSN2rOvNo6KQGRVWn0ccOPuh7SIOY4oMU3M7W2Yzw0umZkdM6OyLNrqoAvkyxZhzV6yXNRKLHDM1R932Xg9QUIgZJIKNcQB7mezguMGG649rVaDdnLO/7yaHEZyY5ySGs4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586428; c=relaxed/simple;
	bh=k2xbLX8kmYM7/Q/dLI4NGEd0yPQHmi443C7fSaQRRJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMZVARgeR7AOb/o4UJpNZxEgKBpwwIoPRAdxG6U3q8O4UuSjJp2hYb0fK7fu0bXjhD6bGApr7tSZulmAcrIShgmjxMgK7KNC1KejjGv/efrCNKNbj6MdzEIKk7Xdt42ojhnI5j9ddi4xC8749gBacyBGWo+V3szCMA8D6yBClBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYJh7bM7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-363bd55bcc2so408523f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586424; x=1720191224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8OAXQw9s2MrfcewrXeB2jj3VO7TisVuW3r6LI6Onag=;
        b=mYJh7bM7Juj2agKiV7oE9yeoYqqDGXRj0GIenpZiB9Lpa0DoLn9MsCPvIWqFkxbBcl
         spTFZx1Fe2C+xVa0+sytfp/yxWu01t5sC8GqC/c9srIdj0vEFqOv7Y8eeupmjYnl5lbE
         Wlz3iiYjSRojoE3YXS9QRt3cTUzHrb1emS7lsMmI05HJbl2MKKHnT2DxuDp6TAGuFAsH
         0w+wIAw7R9MY6Rwe6hS2n77vaiedeOaFej7VRyFlIDt+qp7Ayhqy5YG/VxhmuqFBSqJs
         HqB7N33NdpJI8i138chbj25p2Gc1g9C4g/yPp2dlPJ/y6WR76bTN39bnq6NcChroNEAV
         ji5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586424; x=1720191224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8OAXQw9s2MrfcewrXeB2jj3VO7TisVuW3r6LI6Onag=;
        b=CfB3qmnlcg3eYvfPtXsgUTR2gDq2WXJiGkfQHb/nffpLBYU1Toh/EWCFbBWwz/4ZiW
         HGK59C2RLIBEvhBELlOL7HqCFA0Nv/m5Wok6wsZCjToZhSY3ylfZ3GzLsU82XRD3/Orr
         Jlj0/oG6Tzlx30ZyRQPhb8rDFILpiZvZOmO8lmTCx62NUKbytsfGZwGnrFSYDTB7QhvG
         k5sUqfEMF0sK/RktX89VmmzVj19TGh/ld+BfcYwk+h+0ia/EshCVf5y8GyutUrbZbpT9
         eBFdUIyXbboEkT73cikACDg//Y5FmLEf1j2YEOCwstp9Q55N0XU8xvOMJzY0iRtgdS1j
         BM5A==
X-Forwarded-Encrypted: i=1; AJvYcCV9/wAIkCY9VnxNTpZa8CIjdni7//hyOrlmDXLISjXaajdzGTjlruYvUP2wi0yfZBl4qmpHXqx8tGJ+9RJLYZIvdt/bsXwie9U+uw==
X-Gm-Message-State: AOJu0YzSjoLZOAR3MfWMeaZrXhfd/LG+Ypyl+PmTv8biWQoKDqtZYyMy
	yKwWI68Ijiy2iZbWBOYWMy1el/0fsvEc26iiTgKpcyAiC6TdY5pSoSMGQNkwxhg=
X-Google-Smtp-Source: AGHT+IEIMLQ09ulyzCHP3BOM1Ye/FLtmeuH1KX/omXXeBsKSxduo2thGmgf4PzvMvrKaNSSXSs/TEg==
X-Received: by 2002:a5d:4944:0:b0:360:7506:2b8 with SMTP id ffacd0b85a97d-366e95db295mr11952807f8f.52.1719586423364;
        Fri, 28 Jun 2024 07:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:18 +0200
Subject: [PATCH libgpiod v2 02/18] tests: split out the common test code
 for bash scripts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-2-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=49419;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=474QOSsO92ZhWiUzyCtU/8aEDAzo7Vj87W4OmVWhYnM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5w2Lzu4bH5Xe2D/QGreDVKrpQ8mazWiOV0x
 XrFbCyAZgaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcAAKCRARpy6gFHHX
 cl56D/9QzeS19ad+Ek2HzSfy7utYNLTUY7paVYCU8MmfOJ8aQAAvP9+WVpicUSTLUsUC7DXpBhE
 +GfAz1lKHPAfME56wKlf2eVVkt0WqNfDLAf8p6LCQKowjPhoIVudlD7K8KFvHk8Au/LlNCCI1vp
 /dq9pseZlPIO+/5TAuJxrOIiyNQKxPWBvfkQcueySmVutBOwUAJkzyW63ctgLBQ8H6PMEAU3JeL
 ksj2h3YIKawWAInTGVkaNF3063pwzXXs+Idwb9FI0hXekUA4WKGl/wEnk5p1Niqdy1wavRpsixU
 9gbmiweTLSiMwfLUGjnHiWch2XrMCB4vZixquPprXzpykQ8cxfVJ+REXY9n0jYGV2zrAll2QtqY
 06hGqvbSwvQFS+/LcvMOI7t3Fo/fAddJGY67RunNHPHuochvAs8qPUJs2OZzup5L27kahm+YlTD
 A5sUxJLW+RyLM1UyhM9JqUquDUi8KpkJC9YGiBuF9Zdy/6CEQiFuX0O0K5jqEPJrp00g9HNsbLG
 0DDf66OCXmxghugOu1prufz56dNuupHfcu8N4r0J59fu/af1jyGghi61/2aOguf6TZwV481O7/0
 SawrC98mmNnRw8WNnudAU8n68LO8OzDSA+vl5TsBZRXIB52jGfrd1iH4Gdhm23zc4Ct8tb2S5e4
 r9GnLH9EXetpFEQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to allow the upcoming DBus command-line client tests to reuse the
existing bash test harness, let's put the common code into an importable
file and rename run_tool to run_prog to reflect that it now can run any
program.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac                             |   1 +
 tests/Makefile.am                        |   2 +-
 tests/scripts/Makefile.am                |   4 +
 tests/scripts/gpiod-bash-test-helper.inc | 330 ++++++++++++++++++
 tools/gpio-tools-test.bash               | 566 +++++++------------------------
 5 files changed, 458 insertions(+), 445 deletions(-)

diff --git a/configure.ac b/configure.ac
index d1f49ac..93d9d75 100644
--- a/configure.ac
+++ b/configure.ac
@@ -277,6 +277,7 @@ AC_CONFIG_FILES([Makefile
 		 tests/gpiosim/Makefile
 		 tests/gpiosim-glib/Makefile
 		 tests/harness/Makefile
+		 tests/scripts/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index c89fd8d..7049d21 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = gpiosim gpiosim-glib harness
+SUBDIRS = gpiosim gpiosim-glib harness scripts
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim-glib/
 AM_CFLAGS += -I$(top_srcdir)/tests/harness/
diff --git a/tests/scripts/Makefile.am b/tests/scripts/Makefile.am
new file mode 100644
index 0000000..5766593
--- /dev/null
+++ b/tests/scripts/Makefile.am
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = gpiod-bash-test-helper.inc
diff --git a/tests/scripts/gpiod-bash-test-helper.inc b/tests/scripts/gpiod-bash-test-helper.inc
new file mode 100644
index 0000000..d0f8a6d
--- /dev/null
+++ b/tests/scripts/gpiod-bash-test-helper.inc
@@ -0,0 +1,330 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+# Simple test harness for the gpio-tools.
+
+# Where output from the dut is stored (must be used together
+# with SHUNIT_TMPDIR).
+DUT_OUTPUT=gpio-tools-test-output
+
+# Save the PID of coprocess - otherwise we won't be able to wait for it
+# once it exits as the COPROC_PID will be cleared.
+DUT_PID=""
+
+# mappings from local name to system chip name, path, dev name
+declare -A GPIOSIM_CHIP_NAME
+declare -A GPIOSIM_CHIP_PATH
+declare -A GPIOSIM_DEV_NAME
+GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim"
+GPIOSIM_SYSFS="/sys/devices/platform/"
+GPIOSIM_APP_NAME="gpio-tools-test"
+
+MIN_KERNEL_VERSION="5.17.4"
+MIN_SHUNIT_VERSION="2.1.8"
+
+# Run the command in $@ and fail the test if the command succeeds.
+assert_fail() {
+	"$@" || return 0
+	fail " '$*': command did not fail as expected"
+}
+
+# Check if the string in $2 matches against the pattern in $1.
+regex_matches() {
+	[[ $2 =~ $1 ]]
+	assertEquals " '$2' did not match '$1':" "0" "$?"
+}
+
+output_contains_line() {
+	assertContains "$1" "$output"
+}
+
+output_is() {
+	assertEquals " output:" "$1" "$output"
+}
+
+num_lines_is() {
+	[ "$1" -eq "0" ] || [ -z "$output" ] && return 0
+	local NUM_LINES
+	NUM_LINES=$(echo "$output" | wc -l)
+	assertEquals " number of lines:" "$1" "$NUM_LINES"
+}
+
+status_is() {
+	assertEquals " status:" "$1" "$status"
+}
+
+# Same as above but match against the regex pattern in $1.
+output_regex_match() {
+	[[ "$output" =~ $1 ]]
+	assertEquals " '$output' did not match '$1'" "0" "$?"
+}
+
+gpiosim_chip() {
+	local VAR=$1
+	local NAME=${GPIOSIM_APP_NAME}-$$-${VAR}
+	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+	local BANKPATH=$DEVPATH/bank0
+
+	mkdir -p "$BANKPATH"
+
+	for ARG in "$@"
+	do
+		local KEY VAL
+		KEY=$(echo "$ARG" | cut -d"=" -f1)
+		VAL=$(echo "$ARG" | cut -d"=" -f2)
+
+		if [ "$KEY" = "num_lines" ]
+		then
+			echo "$VAL" > "$BANKPATH/num_lines"
+		elif [ "$KEY" = "line_name" ]
+		then
+			local OFFSET LINENAME
+			OFFSET=$(echo "$VAL" | cut -d":" -f1)
+			LINENAME=$(echo "$VAL" | cut -d":" -f2)
+			local LINEPATH=$BANKPATH/line$OFFSET
+
+			mkdir -p "$LINEPATH"
+			echo "$LINENAME" > "$LINEPATH/name"
+		fi
+	done
+
+	echo 1 > "$DEVPATH/live"
+
+	local CHIP_NAME
+	CHIP_NAME=$(<"$BANKPATH/chip_name")
+	GPIOSIM_CHIP_NAME[$1]=$CHIP_NAME
+	GPIOSIM_CHIP_PATH[$1]="/dev/$CHIP_NAME"
+	GPIOSIM_DEV_NAME[$1]=$(<"$DEVPATH/dev_name")
+}
+
+gpiosim_chip_number() {
+	local NAME=${GPIOSIM_CHIP_NAME[$1]}
+	echo "${NAME#gpiochip}"
+}
+
+gpiosim_chip_symlink() {
+	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
+	ln -s "${GPIOSIM_CHIP_PATH[$1]}" "$GPIOSIM_CHIP_LINK"
+}
+
+gpiosim_chip_symlink_cleanup() {
+	if [ -n "$GPIOSIM_CHIP_LINK" ]
+	then
+		rm "$GPIOSIM_CHIP_LINK"
+	fi
+	unset GPIOSIM_CHIP_LINK
+}
+
+gpiosim_set_pull() {
+	local OFFSET=$2
+	local PULL=$3
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
+
+	echo "$PULL" > "$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull"
+}
+
+gpiosim_check_value() {
+	local OFFSET=$2
+	local EXPECTED=$3
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
+
+	VAL=$(<"$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value")
+	[ "$VAL" = "$EXPECTED" ]
+}
+
+gpiosim_wait_value() {
+	local OFFSET=$2
+	local EXPECTED=$3
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
+	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
+
+	for _i in {1..30}; do
+		[ "$(<"$PORT")" = "$EXPECTED" ] && return
+		sleep 0.01
+	done
+	return 1
+}
+
+gpiosim_cleanup() {
+	for CHIP in "${!GPIOSIM_CHIP_NAME[@]}"
+	do
+		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
+
+		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+
+		echo 0 > "$DEVPATH/live"
+		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
+		find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+'
+		find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+'
+		rmdir "$DEVPATH"
+	done
+
+	gpiosim_chip_symlink_cleanup
+
+	GPIOSIM_CHIP_NAME=()
+	GPIOSIM_CHIP_PATH=()
+	GPIOSIM_DEV_NAME=()
+}
+
+run_prog() {
+	# Executables to test are expected to be in the same directory as the
+	# testing script.
+	cmd=$1
+	shift
+	output=$(timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1)
+	status=$?
+}
+
+dut_run() {
+	cmd=$1
+	shift
+	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1
+	DUT_PID=$COPROC_PID
+	read -r -t1 -n1 -u "${COPROC[0]}" DUT_FIRST_CHAR
+}
+
+dut_run_redirect() {
+	cmd=$1
+	shift
+	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" > "$SHUNIT_TMPDIR/$DUT_OUTPUT" 2>&1
+	DUT_PID=$COPROC_PID
+	# give the process time to spin up
+	# FIXME - find a better solution
+	sleep 0.2
+}
+
+dut_read_redirect() {
+	output=$(<"$SHUNIT_TMPDIR/$DUT_OUTPUT")
+	local ORIG_IFS="$IFS"
+	IFS=$'\n' mapfile -t lines <<< "$output"
+	IFS="$ORIG_IFS"
+}
+
+dut_read() {
+	local LINE
+	lines=()
+	while read -r -t 0.2 -u "${COPROC[0]}" LINE
+	do
+		if [ -n "$DUT_FIRST_CHAR" ]
+		then
+			LINE=${DUT_FIRST_CHAR}${LINE}
+			unset DUT_FIRST_CHAR
+		fi
+		lines+=("$LINE")
+	done
+	output="${lines[*]}"
+}
+
+dut_readable() {
+	read -t 0 -u "${COPROC[0]}" LINE
+}
+
+dut_flush() {
+	local _JUNK
+	lines=()
+	output=
+	unset DUT_FIRST_CHAR
+	while read -t 0 -u "${COPROC[0]}" _JUNK
+	do
+		read -r -t 0.1 -u "${COPROC[0]}" _JUNK || true
+	done
+}
+
+# check the next line of output matches the regex
+dut_regex_match() {
+	PATTERN=$1
+
+	read -r -t 0.2 -u "${COPROC[0]}" LINE || (echo Timeout && false)
+	if [ -n "$DUT_FIRST_CHAR" ]
+	then
+		LINE=${DUT_FIRST_CHAR}${LINE}
+		unset DUT_FIRST_CHAR
+	fi
+	[[ $LINE =~ $PATTERN ]]
+	assertEquals "'$LINE' did not match '$PATTERN'" "0" "$?"
+}
+
+dut_write() {
+	echo "$@" >&"${COPROC[1]}"
+}
+
+dut_kill() {
+	kill "$@" "$DUT_PID"
+}
+
+dut_wait() {
+	wait "$DUT_PID"
+	export status=$?
+	unset DUT_PID
+}
+
+dut_cleanup() {
+	if [ -n "$DUT_PID" ]
+	then
+		kill -SIGTERM "$DUT_PID" 2> /dev/null
+		wait "$DUT_PID" || false
+	fi
+	rm -f "$SHUNIT_TMPDIR/$DUT_OUTPUT"
+}
+
+tearDown() {
+	dut_cleanup
+	gpiosim_cleanup
+}
+
+request_release_line() {
+	"$SOURCE_DIR/gpioget" -c "$@" >/dev/null
+}
+
+die() {
+	echo "$@" 1>&2
+	exit 1
+}
+
+# Must be done after we sources shunit2 as we need SHUNIT_VERSION to be set.
+oneTimeSetUp() {
+	test "$SHUNIT_VERSION" = "$MIN_SHUNIT_VERSION" && return 0
+	local FIRST
+	FIRST=$(printf "%s\n%s\n" "$SHUNIT_VERSION" "$MIN_SHUNIT_VERSION" | sort -Vr | head -1)
+	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
+		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
+}
+
+check_kernel() {
+	local REQUIRED=$1
+	local CURRENT
+	CURRENT=$(uname -r)
+
+	SORTED=$(printf "%s\n%s" "$REQUIRED" "$CURRENT" | sort -V | head -n 1)
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
+	if ! which "$PROG" > /dev/null
+	then
+		die "$PROG not found - needed to run the tests"
+	fi
+}
+
+# Check all required non-coreutils tools
+check_prog shunit2
+check_prog modprobe
+check_prog timeout
+
+# Check if we're running a kernel at the required version or later
+check_kernel $MIN_KERNEL_VERSION
+
+modprobe gpio-sim || die "unable to load the gpio-sim module"
+mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
+	die "configfs not mounted at /sys/kernel/config/"
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 3b93388..359960a 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -4,285 +4,8 @@
 # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
 # SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-# Simple test harness for the gpio-tools.
-
-# Where output from the dut is stored (must be used together
-# with SHUNIT_TMPDIR).
-DUT_OUTPUT=gpio-tools-test-output
-
-# Save the PID of coprocess - otherwise we won't be able to wait for it
-# once it exits as the COPROC_PID will be cleared.
-DUT_PID=""
-
-SOURCE_DIR=$(dirname "${BASH_SOURCE[0]}")
-
-# mappings from local name to system chip name, path, dev name
-declare -A GPIOSIM_CHIP_NAME
-declare -A GPIOSIM_CHIP_PATH
-declare -A GPIOSIM_DEV_NAME
-GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim"
-GPIOSIM_SYSFS="/sys/devices/platform/"
-GPIOSIM_APP_NAME="gpio-tools-test"
-
-MIN_KERNEL_VERSION="5.17.4"
-MIN_SHUNIT_VERSION="2.1.8"
-
-# Run the command in $@ and fail the test if the command succeeds.
-assert_fail() {
-	"$@" || return 0
-	fail " '$*': command did not fail as expected"
-}
-
-# Check if the string in $2 matches against the pattern in $1.
-regex_matches() {
-	[[ $2 =~ $1 ]]
-	assertEquals " '$2' did not match '$1':" "0" "$?"
-}
-
-output_contains_line() {
-	assertContains "$1" "$output"
-}
-
-output_is() {
-	assertEquals " output:" "$1" "$output"
-}
-
-num_lines_is() {
-	[ "$1" -eq "0" ] || [ -z "$output" ] && return 0
-	local NUM_LINES
-	NUM_LINES=$(echo "$output" | wc -l)
-	assertEquals " number of lines:" "$1" "$NUM_LINES"
-}
-
-status_is() {
-	assertEquals " status:" "$1" "$status"
-}
-
-# Same as above but match against the regex pattern in $1.
-output_regex_match() {
-	[[ "$output" =~ $1 ]]
-	assertEquals " '$output' did not match '$1'" "0" "$?"
-}
-
-gpiosim_chip() {
-	local VAR=$1
-	local NAME=${GPIOSIM_APP_NAME}-$$-${VAR}
-	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-	local BANKPATH=$DEVPATH/bank0
-
-	mkdir -p "$BANKPATH"
-
-	for ARG in "$@"
-	do
-		local KEY VAL
-		KEY=$(echo "$ARG" | cut -d"=" -f1)
-		VAL=$(echo "$ARG" | cut -d"=" -f2)
-
-		if [ "$KEY" = "num_lines" ]
-		then
-			echo "$VAL" > "$BANKPATH/num_lines"
-		elif [ "$KEY" = "line_name" ]
-		then
-			local OFFSET LINENAME
-			OFFSET=$(echo "$VAL" | cut -d":" -f1)
-			LINENAME=$(echo "$VAL" | cut -d":" -f2)
-			local LINEPATH=$BANKPATH/line$OFFSET
-
-			mkdir -p "$LINEPATH"
-			echo "$LINENAME" > "$LINEPATH/name"
-		fi
-	done
-
-	echo 1 > "$DEVPATH/live"
-
-	local CHIP_NAME
-	CHIP_NAME=$(<"$BANKPATH/chip_name")
-	GPIOSIM_CHIP_NAME[$1]=$CHIP_NAME
-	GPIOSIM_CHIP_PATH[$1]="/dev/$CHIP_NAME"
-	GPIOSIM_DEV_NAME[$1]=$(<"$DEVPATH/dev_name")
-}
-
-gpiosim_chip_number() {
-	local NAME=${GPIOSIM_CHIP_NAME[$1]}
-	echo "${NAME#gpiochip}"
-}
-
-gpiosim_chip_symlink() {
-	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
-	ln -s "${GPIOSIM_CHIP_PATH[$1]}" "$GPIOSIM_CHIP_LINK"
-}
-
-gpiosim_chip_symlink_cleanup() {
-	if [ -n "$GPIOSIM_CHIP_LINK" ]
-	then
-		rm "$GPIOSIM_CHIP_LINK"
-	fi
-	unset GPIOSIM_CHIP_LINK
-}
-
-gpiosim_set_pull() {
-	local OFFSET=$2
-	local PULL=$3
-	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
-	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
-
-	echo "$PULL" > "$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull"
-}
-
-gpiosim_check_value() {
-	local OFFSET=$2
-	local EXPECTED=$3
-	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
-	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
-
-	VAL=$(<"$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value")
-	[ "$VAL" = "$EXPECTED" ]
-}
-
-gpiosim_wait_value() {
-	local OFFSET=$2
-	local EXPECTED=$3
-	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
-	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
-	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
-
-	for _i in {1..30}; do
-		[ "$(<"$PORT")" = "$EXPECTED" ] && return
-		sleep 0.01
-	done
-	return 1
-}
-
-gpiosim_cleanup() {
-	for CHIP in "${!GPIOSIM_CHIP_NAME[@]}"
-	do
-		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
-
-		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-
-		echo 0 > "$DEVPATH/live"
-		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
-		find "$DEVPATH" -type d -name "line*" -exec rmdir '{}' '+'
-		find "$DEVPATH" -type d -name "bank*" -exec rmdir '{}' '+'
-		rmdir "$DEVPATH"
-	done
-
-	gpiosim_chip_symlink_cleanup
-
-	GPIOSIM_CHIP_NAME=()
-	GPIOSIM_CHIP_PATH=()
-	GPIOSIM_DEV_NAME=()
-}
-
-run_tool() {
-	# Executables to test are expected to be in the same directory as the
-	# testing script.
-	cmd=$1
-	shift
-	output=$(timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1)
-	status=$?
-}
-
-dut_run() {
-	cmd=$1
-	shift
-	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1
-	DUT_PID=$COPROC_PID
-	read -r -t1 -n1 -u "${COPROC[0]}" DUT_FIRST_CHAR
-}
-
-dut_run_redirect() {
-	cmd=$1
-	shift
-	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" > "$SHUNIT_TMPDIR/$DUT_OUTPUT" 2>&1
-	DUT_PID=$COPROC_PID
-	# give the process time to spin up
-	# FIXME - find a better solution
-	sleep 0.2
-}
-
-dut_read_redirect() {
-	output=$(<"$SHUNIT_TMPDIR/$DUT_OUTPUT")
-	local ORIG_IFS="$IFS"
-	IFS=$'\n' mapfile -t lines <<< "$output"
-	IFS="$ORIG_IFS"
-}
-
-dut_read() {
-	local LINE
-	lines=()
-	while read -r -t 0.2 -u "${COPROC[0]}" LINE
-	do
-		if [ -n "$DUT_FIRST_CHAR" ]
-		then
-			LINE=${DUT_FIRST_CHAR}${LINE}
-			unset DUT_FIRST_CHAR
-		fi
-		lines+=("$LINE")
-	done
-	output="${lines[*]}"
-}
-
-dut_readable() {
-	read -t 0 -u "${COPROC[0]}" LINE
-}
-
-dut_flush() {
-	local _JUNK
-	lines=()
-	output=
-	unset DUT_FIRST_CHAR
-	while read -t 0 -u "${COPROC[0]}" _JUNK
-	do
-		read -r -t 0.1 -u "${COPROC[0]}" _JUNK || true
-	done
-}
-
-# check the next line of output matches the regex
-dut_regex_match() {
-	PATTERN=$1
-
-	read -r -t 0.2 -u "${COPROC[0]}" LINE || (echo Timeout && false)
-	if [ -n "$DUT_FIRST_CHAR" ]
-	then
-		LINE=${DUT_FIRST_CHAR}${LINE}
-		unset DUT_FIRST_CHAR
-	fi
-	[[ $LINE =~ $PATTERN ]]
-	assertEquals "'$LINE' did not match '$PATTERN'" "0" "$?"
-}
-
-dut_write() {
-	echo "$@" >&"${COPROC[1]}"
-}
-
-dut_kill() {
-	kill "$@" "$DUT_PID"
-}
-
-dut_wait() {
-	wait "$DUT_PID"
-	export status=$?
-	unset DUT_PID
-}
-
-dut_cleanup() {
-	if [ -n "$DUT_PID" ]
-	then
-		kill -SIGTERM "$DUT_PID" 2> /dev/null
-		wait "$DUT_PID" || false
-	fi
-	rm -f "$SHUNIT_TMPDIR/$DUT_OUTPUT"
-}
-
-tearDown() {
-	dut_cleanup
-	gpiosim_cleanup
-}
-
-request_release_line() {
-	"$SOURCE_DIR/gpioget" -c "$@" >/dev/null
-}
+export SOURCE_DIR
+SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"
 
 #
 # gpiodetect test cases
@@ -300,7 +23,7 @@ test_gpiodetect_all_chips() {
 	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
-	run_tool gpiodetect
+	run_prog gpiodetect
 
 	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
@@ -311,7 +34,7 @@ test_gpiodetect_all_chips() {
 	local initial_output=$output
 	gpiosim_chip_symlink sim1 /dev
 
-	run_tool gpiodetect
+	run_prog gpiodetect
 
 	output_is "$initial_output"
 	status_is 0
@@ -330,21 +53,21 @@ test_gpiodetect_a_chip() {
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
 	# by name
-	run_tool gpiodetect "$sim0"
+	run_prog gpiodetect "$sim0"
 
 	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by path
-	run_tool gpiodetect "${GPIOSIM_CHIP_PATH[sim1]}"
+	run_prog gpiodetect "${GPIOSIM_CHIP_PATH[sim1]}"
 
 	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
 	num_lines_is 1
 	status_is 0
 
 	# by number
-	run_tool gpiodetect "$(gpiosim_chip_number sim2)"
+	run_prog gpiodetect "$(gpiosim_chip_number sim2)"
 
 	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
@@ -352,7 +75,7 @@ test_gpiodetect_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim2 .
-	run_tool gpiodetect "$GPIOSIM_CHIP_LINK"
+	run_prog gpiodetect "$GPIOSIM_CHIP_LINK"
 
 	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
 	num_lines_is 1
@@ -371,7 +94,7 @@ test_gpiodetect_multiple_chips() {
 	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
-	run_tool gpiodetect "$sim0" "$sim1" "$sim2"
+	run_prog gpiodetect "$sim0" "$sim1" "$sim2"
 
 	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
 	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
@@ -381,7 +104,7 @@ test_gpiodetect_multiple_chips() {
 }
 
 test_gpiodetect_with_nonexistent_chip() {
-	run_tool gpiodetect nonexistent-chip
+	run_prog gpiodetect nonexistent-chip
 
 	status_is 1
 	output_regex_match \
@@ -396,7 +119,7 @@ test_gpioinfo_all_chips() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
@@ -408,7 +131,7 @@ test_gpioinfo_all_chips() {
 	local initial_output=$output
 	gpiosim_chip_symlink sim1 /dev
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_is "$initial_output"
 	status_is 0
@@ -420,7 +143,7 @@ test_gpioinfo_all_chips_with_some_used_lines() {
 
 	dut_run gpioset --banner --active-low foo=1 baz=0
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
@@ -439,7 +162,7 @@ test_gpioinfo_a_chip() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by name
-	run_tool gpioinfo --chip "$sim1"
+	run_prog gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -450,7 +173,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by path
-	run_tool gpioinfo --chip "$sim1"
+	run_prog gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -461,7 +184,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by number
-	run_tool gpioinfo --chip "$sim1"
+	run_prog gpioinfo --chip "$sim1"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -473,7 +196,7 @@ test_gpioinfo_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim1 .
-	run_tool gpioinfo --chip "$GPIOSIM_CHIP_LINK"
+	run_prog gpioinfo --chip "$GPIOSIM_CHIP_LINK"
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -492,28 +215,28 @@ test_gpioinfo_a_line() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip "$sim1" 2
+	run_prog gpioinfo --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+\"bar\"\\s+input"
 	num_lines_is 1
 	status_is 0
 
 	# by name
-	run_tool gpioinfo bar
+	run_prog gpioinfo bar
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	num_lines_is 1
 	status_is 0
 
 	# by chip and name
-	run_tool gpioinfo --chip "$sim1" 2
+	run_prog gpioinfo --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+\"bar\"\\s+input"
 	num_lines_is 1
 	status_is 0
 
 	# unquoted
-	run_tool gpioinfo --unquoted --chip "$sim1" 2
+	run_prog gpioinfo --unquoted --chip "$sim1" 2
 
 	output_regex_match "$sim1 2\\s+bar\\s+input"
 	num_lines_is 1
@@ -530,7 +253,7 @@ test_gpioinfo_first_matching_named_line() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioinfo foobar
+	run_prog gpioinfo foobar
 
 	output_regex_match "$sim0 3\\s+\"foobar\"\\s+input"
 	num_lines_is 1
@@ -545,7 +268,7 @@ test_gpioinfo_multiple_lines() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip "$sim1" 1 2
+	run_prog gpioinfo --chip "$sim1" 1 2
 
 	output_regex_match "$sim1 1\\s+unnamed\\s+input"
 	output_regex_match "$sim1 2\\s+\"baz\"\\s+input"
@@ -553,7 +276,7 @@ test_gpioinfo_multiple_lines() {
 	status_is 0
 
 	# by name
-	run_tool gpioinfo bar baz
+	run_prog gpioinfo bar baz
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	output_regex_match "$sim1 2\\s+\"baz\"\\s+input"
@@ -561,7 +284,7 @@ test_gpioinfo_multiple_lines() {
 	status_is 0
 
 	# by name and offset
-	run_tool gpioinfo --chip "$sim0" bar 3
+	run_prog gpioinfo --chip "$sim0" bar 3
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	output_regex_match "$sim0 3\\s+unnamed\\s+input"
@@ -578,7 +301,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpioset --banner --active-low --bias=pull-up --drive=open-source foo=1 baz=0
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+output active-low drive=open-source bias=pull-up consumer=\"gpioset\""
@@ -592,7 +315,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpioset --banner --bias=pull-down --drive=open-drain foo=1 baz=0
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+output drive=open-drain bias=pull-down consumer=\"gpioset\""
@@ -606,7 +329,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --bias=disabled --utc -p 10ms foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input bias=disabled edges=both event-clock=realtime debounce-period=10ms consumer=\"gpiomon\""
@@ -620,7 +343,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --edges=rising --localtime foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input edges=rising event-clock=realtime consumer=\"gpiomon\""
@@ -634,7 +357,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --edges=falling foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input edges=falling consumer=\"gpiomon\""
@@ -650,7 +373,7 @@ test_gpioinfo_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioinfo --chip "$sim0" 1 1
+	run_prog gpioinfo --chip "$sim0" 1 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines '1' and '1' are the same line"
@@ -658,7 +381,7 @@ test_gpioinfo_with_same_line_twice() {
 	status_is 1
 
 	# by name
-	run_tool gpioinfo foo foo
+	run_prog gpioinfo foo foo
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
@@ -666,7 +389,7 @@ test_gpioinfo_with_same_line_twice() {
 	status_is 1
 
 	# by name and offset
-	run_tool gpioinfo --chip "$sim0" foo 1
+	run_prog gpioinfo --chip "$sim0" foo 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines 'foo' and '1' are the same line"
@@ -684,7 +407,7 @@ test_gpioinfo_all_lines_matching_name() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
-	run_tool gpioinfo --strict foobar
+	run_prog gpioinfo --strict foobar
 
 	output_regex_match "$sim0 3\\s+\"foobar\"\\s+input"
 	output_regex_match "$sim1 2\\s+\"foobar\"\\s+input"
@@ -701,7 +424,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# first by offset (to show offsets match first)
-	run_tool gpioinfo --chip "$sim0" 1 6
+	run_prog gpioinfo --chip "$sim0" 1 6
 
 	output_regex_match "$sim0 1\\s+\"6\"\\s+input"
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
@@ -709,7 +432,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	status_is 0
 
 	# then strictly by name
-	run_tool gpioinfo --by-name --chip "$sim0" 1
+	run_prog gpioinfo --by-name --chip "$sim0" 1
 
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
 	num_lines_is 1
@@ -717,7 +440,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 }
 
 test_gpioinfo_with_nonexistent_chip() {
-	run_tool gpioinfo --chip nonexistent-chip
+	run_prog gpioinfo --chip nonexistent-chip
 
 	output_regex_match \
 ".*cannot find GPIO chip character device 'nonexistent-chip'"
@@ -727,12 +450,12 @@ test_gpioinfo_with_nonexistent_chip() {
 test_gpioinfo_with_nonexistent_line() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioinfo nonexistent-line
+	run_prog gpioinfo nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
 
-	run_tool gpioinfo --chip "${GPIOSIM_CHIP_NAME[sim0]}" nonexistent-line
+	run_prog gpioinfo --chip "${GPIOSIM_CHIP_NAME[sim0]}" nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -743,7 +466,7 @@ test_gpioinfo_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioinfo --chip "$sim0" 0 1 2 3 4 5
+	run_prog gpioinfo --chip "$sim0" 0 1 2 3 4 5
 
 	output_regex_match "$sim0 0\\s+unnamed\\s+input"
 	output_regex_match "$sim0 1\\s+unnamed\\s+input"
@@ -764,12 +487,12 @@ test_gpioget_by_name() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget foo
+	run_prog gpioget foo
 
 	output_is "\"foo\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted foo
+	run_prog gpioget --unquoted foo
 
 	output_is "foo=active"
 	status_is 0
@@ -780,12 +503,12 @@ test_gpioget_by_offset() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
+	run_prog gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
 
 	output_is "\"1\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
+	run_prog gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1
 
 	output_is "1=active"
 	status_is 0
@@ -797,7 +520,7 @@ test_gpioget_by_symlink() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip "$GPIOSIM_CHIP_LINK" 1
+	run_prog gpioget --chip "$GPIOSIM_CHIP_LINK" 1
 
 	output_is "\"1\"=active"
 	status_is 0
@@ -809,12 +532,12 @@ test_gpioget_by_chip_and_name() {
 
 	gpiosim_set_pull sim1 3 pull-up
 
-	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
+	run_prog gpioget --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
 
 	output_is "\"foo\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
+	run_prog gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim1]}" foo
 
 	output_is "foo=active"
 	status_is 0
@@ -829,7 +552,7 @@ test_gpioget_first_matching_named_line() {
 
 	gpiosim_set_pull sim0 3 pull-up
 
-	run_tool gpioget foobar
+	run_prog gpioget foobar
 
 	output_is "\"foobar\"=active"
 	status_is 0
@@ -843,7 +566,7 @@ test_gpioget_multiple_lines() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1 2 3 4 5 6 7
+	run_prog gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=active 3=active 4=inactive 5=active 6=inactive 7=active"
@@ -859,7 +582,7 @@ test_gpioget_multiple_lines_by_name_and_offset() {
 	gpiosim_set_pull sim0 4 pull-up
 	gpiosim_set_pull sim0 6 pull-up
 
-	run_tool gpioget --chip "$sim0" 0 foo 4 bar
+	run_prog gpioget --chip "$sim0" 0 foo 4 bar
 
 	output_is "\"0\"=inactive \"foo\"=active \"4\"=active \"bar\"=active"
 	status_is 0
@@ -872,7 +595,7 @@ test_gpioget_multiple_lines_across_multiple_chips() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim1 4 pull-up
 
-	run_tool gpioget baz bar foo xyz
+	run_prog gpioget baz bar foo xyz
 
 	output_is "\"baz\"=inactive \"bar\"=inactive \"foo\"=active \"xyz\"=active"
 	status_is 0
@@ -888,7 +611,7 @@ test_gpioget_with_numeric_values() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --numeric --chip "$sim0" 0 1 2 3 4 5 6 7
+	run_prog gpioget --numeric --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is "0 0 1 1 0 1 0 1"
 	status_is 0
@@ -904,7 +627,7 @@ test_gpioget_with_active_low() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --active-low --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
+	run_prog gpioget --active-low --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=inactive 3=inactive 4=active 5=inactive 6=active 7=inactive"
@@ -917,7 +640,7 @@ test_gpioget_with_consumer() {
 
 	dut_run gpionotify --banner -F "%l %E %C" foo baz
 
-	run_tool gpioget --consumer gpio-tools-tests foo baz
+	run_prog gpioget --consumer gpio-tools-tests foo baz
 	status_is 0
 
 	dut_read
@@ -935,7 +658,7 @@ test_gpioget_with_pull_up() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-up --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
+	run_prog gpioget --bias=pull-up --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=active 3=active 4=active 5=active 6=active 7=active"
@@ -952,7 +675,7 @@ test_gpioget_with_pull_down() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-down --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
+	run_prog gpioget --bias=pull-down --unquoted --chip "$sim0" 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=inactive 3=inactive 4=inactive 5=inactive 6=inactive 7=inactive"
@@ -965,31 +688,31 @@ test_gpioget_with_direction_as_is() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# flip to output
-	run_tool gpioset -t0 foo=1
+	run_prog gpioset -t0 foo=1
 
 	status_is 0
 
-	run_tool gpioinfo foo
+	run_prog gpioinfo foo
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+output"
 	status_is 0
 
-	run_tool gpioget --as-is foo
+	run_prog gpioget --as-is foo
 	# note gpio-sim reverts line to its pull when released
 	output_is "\"foo\"=inactive"
 	status_is 0
 
-	run_tool gpioinfo foo
+	run_prog gpioinfo foo
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+output"
 	status_is 0
 
 	# whereas the default behaviour forces to input
-	run_tool gpioget foo
+	run_prog gpioget foo
 	# note gpio-sim reverts line to its pull when released
 	# (defaults to pull-down)
 	output_is "\"foo\"=inactive"
 	status_is 0
 
-	run_tool gpioinfo foo
+	run_prog gpioinfo foo
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	status_is 0
 }
@@ -998,7 +721,7 @@ test_gpioget_with_hold_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	# only test parsing - testing the hold-period itself is tricky
-	run_tool gpioget --hold-period=100ms foo
+	run_prog gpioget --hold-period=100ms foo
 	output_is "\"foo\"=inactive"
 	status_is 0
 }
@@ -1010,7 +733,7 @@ test_gpioget_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpioget --strict foobar
+	run_prog gpioget --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -1024,12 +747,12 @@ test_gpioget_with_lines_by_offset() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
+	run_prog gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "\"1\"=active \"6\"=inactive"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
+	run_prog gpioget --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "1=active 6=inactive"
 	status_is 0
@@ -1043,19 +766,19 @@ test_gpioget_with_lines_strictly_by_name() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --by-name --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
+	run_prog gpioget --by-name --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "\"1\"=inactive \"6\"=active"
 	status_is 0
 
-	run_tool gpioget --by-name --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
+	run_prog gpioget --by-name --unquoted --chip "${GPIOSIM_CHIP_NAME[sim0]}" 1 6
 
 	output_is "1=inactive 6=active"
 	status_is 0
 }
 
 test_gpioget_with_no_arguments() {
-	run_tool gpioget
+	run_prog gpioget
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -1064,7 +787,7 @@ test_gpioget_with_no_arguments() {
 test_gpioget_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}"
+	run_prog gpioget --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -1074,7 +797,7 @@ test_gpioget_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --chip "$sim0" 0 1 2 3 4 5
+	run_prog gpioget --chip "$sim0" 0 1 2 3 4 5
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1082,7 +805,7 @@ test_gpioget_with_offset_out_of_range() {
 }
 
 test_gpioget_with_nonexistent_line() {
-	run_tool gpioget nonexistent-line
+	run_prog gpioget nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -1093,31 +816,31 @@ test_gpioget_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioget --chip "$sim0" 0 0
+	run_prog gpioget --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpioget foo foo
+	run_prog gpioget foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by chip and name
-	run_tool gpioget --chip "$sim0" foo foo
+	run_prog gpioget --chip "$sim0" foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioget --chip "$sim0" foo 1
+	run_prog gpioget --chip "$sim0" foo 1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioget --chip "$sim0" 1 foo
+	run_prog gpioget --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -1126,7 +849,7 @@ test_gpioget_with_same_line_twice() {
 test_gpioget_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1
+	run_prog gpioget --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1135,7 +858,7 @@ test_gpioget_with_invalid_bias() {
 test_gpioget_with_invalid_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --hold-period=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0
+	run_prog gpioget --hold-period=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1255,7 +978,7 @@ test_gpioset_with_consumer() {
 
 	dut_run gpioset --banner --consumer gpio-tools-tests foo=1 baz=0
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -1627,7 +1350,7 @@ test_gpioset_with_invalid_toggle_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
-	run_tool gpioset --toggle 1ns foo=1 bar=0 baz=0
+	run_prog gpioset --toggle 1ns foo=1 bar=0 baz=0
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1640,7 +1363,7 @@ test_gpioset_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpioset --strict foobar=active
+	run_prog gpioset --strict foobar=active
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -1697,7 +1420,7 @@ test_gpioset_interactive_after_SIGTERM() {
 }
 
 test_gpioset_with_no_arguments() {
-	run_tool gpioset
+	run_prog gpioset
 
 	status_is 1
 	output_regex_match ".*at least one GPIO line value must be specified"
@@ -1706,7 +1429,7 @@ test_gpioset_with_no_arguments() {
 test_gpioset_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}"
+	run_prog gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line value must be specified"
 	status_is 1
@@ -1717,7 +1440,7 @@ test_gpioset_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --chip "$sim0" 0=1 1=1 2=1 3=1 4=1 5=1
+	run_prog gpioset --chip "$sim0" 0=1 1=1 2=1 3=1 4=1 5=1
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1729,7 +1452,7 @@ test_gpioset_with_invalid_hold_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --hold-period=bad --chip "$sim0" 0=1
+	run_prog gpioset --hold-period=bad --chip "$sim0" 0=1
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1741,13 +1464,13 @@ test_gpioset_with_invalid_value() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by name
-	run_tool gpioset --chip "$sim0" 0=c
+	run_prog gpioset --chip "$sim0" 0=c
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
 
 	# by value
-	run_tool gpioset --chip "$sim0" 0=3
+	run_prog gpioset --chip "$sim0" 0=3
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
@@ -1756,7 +1479,7 @@ test_gpioset_with_invalid_value() {
 test_gpioset_with_invalid_offset() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4000000000=0
+	run_prog gpioset --chip "${GPIOSIM_CHIP_NAME[sim0]}" 4000000000=0
 
 	output_regex_match ".*cannot find line '4000000000'"
 	status_is 1
@@ -1765,7 +1488,7 @@ test_gpioset_with_invalid_offset() {
 test_gpioset_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
+	run_prog gpioset --bias=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1774,7 +1497,7 @@ test_gpioset_with_invalid_bias() {
 test_gpioset_with_invalid_drive() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --drive=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
+	run_prog gpioset --drive=bad --chip "${GPIOSIM_CHIP_NAME[sim0]}" 0=1 1=1
 
 	output_regex_match ".*invalid drive.*"
 	status_is 1
@@ -1785,14 +1508,14 @@ test_gpioset_with_interactive_and_toggle() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --interactive --toggle 1s --chip "$sim0" 0=1
+	run_prog gpioset --interactive --toggle 1s --chip "$sim0" 0=1
 
 	output_regex_match ".*can't combine interactive with toggle"
 	status_is 1
 }
 
 test_gpioset_with_nonexistent_line() {
-	run_tool gpioset nonexistent-line=0
+	run_prog gpioset nonexistent-line=0
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -1804,25 +1527,25 @@ test_gpioset_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioset --chip "$sim0" 0=1 0=1
+	run_prog gpioset --chip "$sim0" 0=1 0=1
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpioset --chip "$sim0" foo=1 foo=1
+	run_prog gpioset --chip "$sim0" foo=1 foo=1
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioset --chip "$sim0" foo=1 1=1
+	run_prog gpioset --chip "$sim0" foo=1 1=1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioset --chip "$sim0" 1=1 foo=1
+	run_prog gpioset --chip "$sim0" 1=1 foo=1
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -2018,7 +1741,7 @@ test_gpiomon_with_consumer() {
 
 	dut_run gpiomon --banner --consumer gpio-tools-tests foo baz
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -2089,7 +1812,7 @@ test_gpiomon_with_debounce_period() {
 
 	dut_run gpiomon --banner --debounce-period 123us foo baz
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -2195,7 +1918,7 @@ test_gpiomon_exit_after_SIGTERM() {
 }
 
 test_gpiomon_with_nonexistent_line() {
-	run_tool gpiomon nonexistent-line
+	run_prog gpiomon nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
@@ -2207,19 +1930,19 @@ test_gpiomon_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpiomon --chip "$sim0" 0 0
+	run_prog gpiomon --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpiomon foo foo
+	run_prog gpiomon foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpiomon --chip "$sim0" 1 foo
+	run_prog gpiomon --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -2232,7 +1955,7 @@ test_gpiomon_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpiomon --strict foobar
+	run_prog gpiomon --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -2292,7 +2015,7 @@ test_gpiomon_with_lines_strictly_by_name() {
 }
 
 test_gpiomon_with_no_arguments() {
-	run_tool gpiomon
+	run_prog gpiomon
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2301,7 +2024,7 @@ test_gpiomon_with_no_arguments() {
 test_gpiomon_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon --chip "${GPIOSIM_CHIP_NAME[sim0]}"
+	run_prog gpiomon --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2312,7 +2035,7 @@ test_gpiomon_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --chip "$sim0" 5
+	run_prog gpiomon --chip "$sim0" 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2323,7 +2046,7 @@ test_gpiomon_with_invalid_bias() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --bias=bad -c "$sim0" 0 1
+	run_prog gpiomon --bias=bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -2334,7 +2057,7 @@ test_gpiomon_with_invalid_debounce_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --debounce-period bad -c "$sim0" 0 1
+	run_prog gpiomon --debounce-period bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2345,7 +2068,7 @@ test_gpiomon_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --idle-timeout bad -c "$sim0" 0 1
+	run_prog gpiomon --idle-timeout bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2770,7 +2493,7 @@ test_gpionotify_exit_after_SIGTERM() {
 }
 
 test_gpionotify_with_nonexistent_line() {
-	run_tool gpionotify nonexistent-line
+	run_prog gpionotify nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
@@ -2782,21 +2505,21 @@ test_gpionotify_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpionotify --chip "$sim0" 0 0
+	run_prog gpionotify --chip "$sim0" 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	num_lines_is 1
 	status_is 1
 
 	# by name
-	run_tool gpionotify foo foo
+	run_prog gpionotify foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	num_lines_is 1
 	status_is 1
 
 	# by name and offset
-	run_tool gpionotify --chip "$sim0" 1 foo
+	run_prog gpionotify --chip "$sim0" 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	num_lines_is 1
@@ -2810,7 +2533,7 @@ test_gpionotify_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpionotify --strict foobar
+	run_prog gpionotify --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -2854,7 +2577,7 @@ test_gpionotify_with_lines_strictly_by_name() {
 }
 
 test_gpionotify_with_no_arguments() {
-	run_tool gpionotify
+	run_prog gpionotify
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2863,7 +2586,7 @@ test_gpionotify_with_no_arguments() {
 test_gpionotify_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpionotify --chip "${GPIOSIM_CHIP_NAME[sim0]}"
+	run_prog gpionotify --chip "${GPIOSIM_CHIP_NAME[sim0]}"
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2874,7 +2597,7 @@ test_gpionotify_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --chip "$sim0" 5
+	run_prog gpionotify --chip "$sim0" 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2885,7 +2608,7 @@ test_gpionotify_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --idle-timeout bad -c "$sim0" 0 1
+	run_prog gpionotify --idle-timeout bad -c "$sim0" 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -3037,53 +2760,8 @@ test_gpionotify_with_custom_format_unknown_specifier() {
 	output_is "%x"
 }
 
-die() {
-	echo "$@" 1>&2
-	exit 1
-}
-
-# Must be done after we sources shunit2 as we need SHUNIT_VERSION to be set.
-oneTimeSetUp() {
-	test "$SHUNIT_VERSION" = "$MIN_SHUNIT_VERSION" && return 0
-	local FIRST
-	FIRST=$(printf "%s\n%s\n" "$SHUNIT_VERSION" "$MIN_SHUNIT_VERSION" | sort -Vr | head -1)
-	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
-		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
-}
-
-check_kernel() {
-	local REQUIRED=$1
-	local CURRENT
-	CURRENT=$(uname -r)
-
-	SORTED=$(printf "%s\n%s" "$REQUIRED" "$CURRENT" | sort -V | head -n 1)
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
-	if ! which "$PROG" > /dev/null
-	then
-		die "$PROG not found - needed to run the tests"
-	fi
-}
-
-# Check all required non-coreutils tools
-check_prog shunit2
-check_prog modprobe
-check_prog timeout
-
-# Check if we're running a kernel at the required version or later
-check_kernel $MIN_KERNEL_VERSION
-
-modprobe gpio-sim || die "unable to load the gpio-sim module"
-mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
-	die "configfs not mounted at /sys/kernel/config/"
+# shellcheck source=tests/scripts/gpiod-bash-test-helper.inc
+source gpiod-bash-test-helper.inc
 
 # shellcheck source=/dev/null
-. shunit2
+source shunit2

-- 
2.43.0


