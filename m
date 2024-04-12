Return-Path: <linux-gpio+bounces-5415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097058A2E2F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CFC1F23A2F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7F56B63;
	Fri, 12 Apr 2024 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Sl1/jPnS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A855E74
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924902; cv=none; b=GdGQCiJOwlx+qy6Q9YVliNPUVzXdXYUEtvzoNlcsdonm7FvgjSjy62EguxUvLukO0CkCWcCIMzYBwPGoz/cy63/tGxyKumw6uh0TUGd5ikGw8wVvqfXStq3nHsCdCa/qcncKS173HNgkpe0Kci68IMkCO5xdw7vFWS+DppGcpzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924902; c=relaxed/simple;
	bh=p7Fm4MQ2nxE0dJ/GFjgGFmpOoFCNTxCkp9IIeRYXuWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XmAy4iBqL6khie4ht4Fdk53OI43hJUY24jMrLT0/Gy822g7DdTATyxvtDWHRWVBCRArZ2rLA4XbW4TKSAIMO5hpAyHlPvCxhL9ixfMwZo2wLSgRi1mit7hWhcNAYP0PcyR2dsuvOGyi4CE5P4cBcNAT6mudKfwQ/g+7Gb+3QAhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Sl1/jPnS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41550858cabso6332825e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924897; x=1713529697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYpufjECcIr2ekV8HX1puSVX940e6wu9aknx4b2SjHw=;
        b=Sl1/jPnSgfhVlVNPDJl4+XaDw2529coje3UGjFsNZwAciAVoJsNkFVgAlx7IIDst5n
         XrGQjxjukmuqvE50qsyNDBK2ItCzqOOj+yosYRjaRv3LBYpDALdgxbrhjwZrkPWKRSGm
         zKhzhzNibi58q7vLCnCHiGuBxl3eJAnOzzMl/iyHIRFBCSkEiX7ZzQXvksS9vgsskNmE
         YSTa3Sr6JMtZRNi56aeWQDTi6DSUCuR7w0rLemacdwWh3/QJ9vp0CDbRvyvhWiCStoXb
         nNSAe3OyUxnx64h9+PTFg5x1M7OwIo/TF8lnb4ksA4n1J0PQXT4yVkx09feUFK5322Gy
         DLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924897; x=1713529697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYpufjECcIr2ekV8HX1puSVX940e6wu9aknx4b2SjHw=;
        b=G3vnwuVjvMFZBZQF3NJCqtwf0IOLLPSZzAphEz/oAy6yjxbosJvSIbKNtZDfIxHAFB
         b419NYIfnvAIcQ/aw4Q8Mq4wgPPONA12qA6OvIc8ZESsou4Pnnji76qQAzdfrTqOSpy/
         cK52/QYLtcJtUfcE7xe/5yTRSDZTl/A3rYVmEy1uN0kRB8VMNS6W40sJbCf9jpAAzL1z
         GGYGNLIZHr3KvVCdHxxsIR2EEFcpHM99AD+zLz7VReROwGX06NUGFRqprX+aWzOHtA9E
         5n81iwJodAySGdwt0Yk6IzUHMlqPDjvwHF4odteoe/xEpjx70jhQ80K74gLzDh4GR3kw
         iXoA==
X-Gm-Message-State: AOJu0YwSiJTgGTmSl1v9eYrFtmE7BVnwxynZ739+f9d5ihi5gK0Ym26k
	pVoVqQ+FAtqwdAoM3lL0iqKxvr2TvvF/nCnLKBf6lb/s/vW6bPMWcod0K+cAEW8=
X-Google-Smtp-Source: AGHT+IFIHzuPx5U94kRg/WIjkRDyRXB1QLqqkfhe939Eld4saSVZqMMe7bwosIXZ/4mCudgJKtKwww==
X-Received: by 2002:a05:600c:4510:b0:418:ef3:6cfb with SMTP id t16-20020a05600c451000b004180ef36cfbmr381794wmo.26.1712924896831;
        Fri, 12 Apr 2024 05:28:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 02/18] tests: split out the common test code for bash scripts
Date: Fri, 12 Apr 2024 14:27:48 +0200
Message-Id: <20240412122804.109323-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to allow the upcoming DBus command-line client tests to reuse the
existing bash test harness, let's put the common code into an importable
file and rename run_tool to run_prog to reflect that it now can run any
program.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac                          |   1 +
 tests/Makefile.am                     |   2 +-
 tests/bash/Makefile.am                |   4 +
 tests/bash/gpiod-bash-test-helper.inc | 328 +++++++++++++++
 tools/gpio-tools-test.bash            | 559 ++++++--------------------
 5 files changed, 452 insertions(+), 442 deletions(-)
 create mode 100644 tests/bash/Makefile.am
 create mode 100644 tests/bash/gpiod-bash-test-helper.inc

diff --git a/configure.ac b/configure.ac
index b711501..3595071 100644
--- a/configure.ac
+++ b/configure.ac
@@ -274,6 +274,7 @@ AC_CONFIG_FILES([Makefile
 		 tests/gpiosim/Makefile
 		 tests/gpiosim-glib/Makefile
 		 tests/harness/Makefile
+		 tests/bash/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 13d7c5d..0ccf921 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = gpiosim gpiosim-glib harness
+SUBDIRS = gpiosim gpiosim-glib harness bash
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim-glib/
 AM_CFLAGS += -I$(top_srcdir)/tests/harness/
diff --git a/tests/bash/Makefile.am b/tests/bash/Makefile.am
new file mode 100644
index 0000000..5766593
--- /dev/null
+++ b/tests/bash/Makefile.am
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = gpiod-bash-test-helper.inc
diff --git a/tests/bash/gpiod-bash-test-helper.inc b/tests/bash/gpiod-bash-test-helper.inc
new file mode 100644
index 0000000..832c09a
--- /dev/null
+++ b/tests/bash/gpiod-bash-test-helper.inc
@@ -0,0 +1,328 @@
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
+MIN_SHUNIT_VERSION="2.1.8"
+MIN_KERNEL_VERSION="5.17.4"
+
+# Run the command in $* and fail the test if the command succeeds.
+assert_fail() {
+	$* || return 0
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
+	local NUM_LINES=$(echo "$output" | wc -l)
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
+	assertEquals "'$output' did not match '$1'" "0" "$?"
+}
+
+gpiosim_chip() {
+	local VAR=$1
+	local NAME=${GPIOSIM_APP_NAME}-$$-${VAR}
+	local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+	local BANKPATH=$DEVPATH/bank0
+
+	mkdir -p $BANKPATH
+
+	for ARG in $*
+	do
+		local KEY=$(echo $ARG | cut -d"=" -f1)
+		local VAL=$(echo $ARG | cut -d"=" -f2)
+
+		if [ "$KEY" = "num_lines" ]
+		then
+			echo $VAL > $BANKPATH/num_lines
+		elif [ "$KEY" = "line_name" ]
+		then
+			local OFFSET=$(echo $VAL | cut -d":" -f1)
+			local LINENAME=$(echo $VAL | cut -d":" -f2)
+			local LINEPATH=$BANKPATH/line$OFFSET
+
+			mkdir -p $LINEPATH
+			echo $LINENAME > $LINEPATH/name
+		fi
+	done
+
+	echo 1 > $DEVPATH/live
+
+	local chip_name=$(<$BANKPATH/chip_name)
+	GPIOSIM_CHIP_NAME[$1]=$chip_name
+	GPIOSIM_CHIP_PATH[$1]="/dev/$chip_name"
+	GPIOSIM_DEV_NAME[$1]=$(<$DEVPATH/dev_name)
+}
+
+gpiosim_chip_number() {
+	local NAME=${GPIOSIM_CHIP_NAME[$1]}
+	echo ${NAME#"gpiochip"}
+}
+
+gpiosim_chip_symlink() {
+	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
+	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
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
+	echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
+}
+
+gpiosim_check_value() {
+	local OFFSET=$2
+	local EXPECTED=$3
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
+
+	VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
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
+	for i in {1..30}; do
+		[ "$(<$PORT)" = "$EXPECTED" ] && return
+		sleep 0.01
+	done
+	return 1
+}
+
+gpiosim_cleanup() {
+	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
+	do
+		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
+
+		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
+		local BANKPATH=$DEVPATH/bank0
+
+		echo 0 > $DEVPATH/live
+
+		ls $BANKPATH/line* > /dev/null 2>&1
+		if [ "$?" = "0" ]
+		then
+			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
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
+	output=$(timeout 10s $SOURCE_DIR/"$@" 2>&1)
+	status=$?
+}
+
+dut_run() {
+	coproc timeout 10s $SOURCE_DIR/"$@" 2>&1
+	DUT_PID=$COPROC_PID
+	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
+}
+
+dut_run_redirect() {
+	coproc timeout 10s $SOURCE_DIR/"$@" > $SHUNIT_TMPDIR/$DUT_OUTPUT 2>&1
+	DUT_PID=$COPROC_PID
+	# give the process time to spin up
+	# FIXME - find a better solution
+	sleep 0.2
+}
+
+dut_read_redirect() {
+	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
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
+	[[ $LINE =~ $PATTERN ]]
+	assertEquals "'$LINE' did not match '$PATTERN'" "0" "$?"
+}
+
+dut_write() {
+	echo $* >&${COPROC[1]}
+}
+
+dut_kill() {
+	SIGNUM=$1
+
+	kill $SIGNUM $DUT_PID
+}
+
+dut_wait() {
+	wait $DUT_PID
+	export status=$?
+	unset DUT_PID
+}
+
+dut_cleanup() {
+        if [ -n "$DUT_PID" ]
+        then
+		kill -SIGTERM $DUT_PID 2> /dev/null
+		wait $DUT_PID || false
+        fi
+        rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
+}
+
+tearDown() {
+	dut_cleanup
+	gpiosim_cleanup
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
+	local FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)
+	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
+		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
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
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 5ef4ef6..40cb99a 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -4,284 +4,8 @@
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
 SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
 
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
-# Run the command in $* and fail the test if the command succeeds.
-assert_fail() {
-	$* || return 0
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
-	local NUM_LINES=$(echo "$output" | wc -l)
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
-	mkdir -p $BANKPATH
-
-	for ARG in $*
-	do
-		local KEY=$(echo $ARG | cut -d"=" -f1)
-		local VAL=$(echo $ARG | cut -d"=" -f2)
-
-		if [ "$KEY" = "num_lines" ]
-		then
-			echo $VAL > $BANKPATH/num_lines
-		elif [ "$KEY" = "line_name" ]
-		then
-			local OFFSET=$(echo $VAL | cut -d":" -f1)
-			local LINENAME=$(echo $VAL | cut -d":" -f2)
-			local LINEPATH=$BANKPATH/line$OFFSET
-
-			mkdir -p $LINEPATH
-			echo $LINENAME > $LINEPATH/name
-		fi
-	done
-
-	echo 1 > $DEVPATH/live
-
-	local chip_name=$(<$BANKPATH/chip_name)
-	GPIOSIM_CHIP_NAME[$1]=$chip_name
-	GPIOSIM_CHIP_PATH[$1]="/dev/$chip_name"
-	GPIOSIM_DEV_NAME[$1]=$(<$DEVPATH/dev_name)
-}
-
-gpiosim_chip_number() {
-	local NAME=${GPIOSIM_CHIP_NAME[$1]}
-	echo ${NAME#"gpiochip"}
-}
-
-gpiosim_chip_symlink() {
-	GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
-	ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
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
-	echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
-}
-
-gpiosim_check_value() {
-	local OFFSET=$2
-	local EXPECTED=$3
-	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
-	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
-
-	VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
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
-	for i in {1..30}; do
-		[ "$(<$PORT)" = "$EXPECTED" ] && return
-		sleep 0.01
-	done
-	return 1
-}
-
-gpiosim_cleanup() {
-	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
-	do
-		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
-
-		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-		local BANKPATH=$DEVPATH/bank0
-
-		echo 0 > $DEVPATH/live
-
-		ls $BANKPATH/line* > /dev/null 2>&1
-		if [ "$?" = "0" ]
-		then
-			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
-			do
-				test -e $LINE/hog && rmdir $LINE/hog
-				rmdir $LINE
-			done
-		fi
-
-		rmdir $BANKPATH
-		rmdir $DEVPATH
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
-	output=$(timeout 10s $SOURCE_DIR/"$@" 2>&1)
-	status=$?
-}
-
-dut_run() {
-	coproc timeout 10s $SOURCE_DIR/"$@" 2>&1
-	DUT_PID=$COPROC_PID
-	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
-}
-
-dut_run_redirect() {
-	coproc timeout 10s $SOURCE_DIR/"$@" > $SHUNIT_TMPDIR/$DUT_OUTPUT 2>&1
-	DUT_PID=$COPROC_PID
-	# give the process time to spin up
-	# FIXME - find a better solution
-	sleep 0.2
-}
-
-dut_read_redirect() {
-	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
-        local ORIG_IFS="$IFS"
-        IFS=$'\n' lines=($output)
-        IFS="$ORIG_IFS"
-}
-
-dut_read() {
-	local LINE
-	lines=()
-	while read -t 0.2 -u ${COPROC[0]} LINE;
-	do
-		if [ -n "$DUT_FIRST_CHAR" ]
-		then
-			LINE=${DUT_FIRST_CHAR}${LINE}
-			unset DUT_FIRST_CHAR
-		fi
-		lines+=("$LINE")
-	done
-	output="${lines[@]}"
-}
-
-dut_readable() {
-	read -t 0 -u ${COPROC[0]} LINE
-}
-
-dut_flush() {
-	local JUNK
-	lines=()
-	output=
-	unset DUT_FIRST_CHAR
-	while read -t 0 -u ${COPROC[0]} JUNK;
-	do
-		read -t 0.1 -u ${COPROC[0]} JUNK || true
-	done
-}
-
-# check the next line of output matches the regex
-dut_regex_match() {
-	PATTERN=$1
-
-	read -t 0.2 -u ${COPROC[0]} LINE || (echo Timeout && false)
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
-	echo $* >&${COPROC[1]}
-}
-
-dut_kill() {
-	SIGNUM=$1
-
-	kill $SIGNUM $DUT_PID
-}
-
-dut_wait() {
-	wait $DUT_PID
-	export status=$?
-	unset DUT_PID
-}
-
-dut_cleanup() {
-        if [ -n "$DUT_PID" ]
-        then
-		kill -SIGTERM $DUT_PID 2> /dev/null
-		wait $DUT_PID || false
-        fi
-        rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
-}
-
-tearDown() {
-	dut_cleanup
-	gpiosim_cleanup
-}
-
 request_release_line() {
 	$SOURCE_DIR/gpioget -c $* >/dev/null
 }
@@ -302,7 +26,7 @@ test_gpiodetect_all_chips() {
 	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
-	run_tool gpiodetect
+	run_prog gpiodetect
 
 	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
 	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
@@ -313,7 +37,7 @@ test_gpiodetect_all_chips() {
 	local initial_output=$output
 	gpiosim_chip_symlink sim1 /dev
 
-	run_tool gpiodetect
+	run_prog gpiodetect
 
 	output_is "$initial_output"
 	status_is 0
@@ -332,21 +56,21 @@ test_gpiodetect_a_chip() {
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
 	# by name
-	run_tool gpiodetect $sim0
+	run_prog gpiodetect $sim0
 
 	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
 	num_lines_is 1
 	status_is 0
 
 	# by path
-	run_tool gpiodetect ${GPIOSIM_CHIP_PATH[sim1]}
+	run_prog gpiodetect ${GPIOSIM_CHIP_PATH[sim1]}
 
 	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
 	num_lines_is 1
 	status_is 0
 
 	# by number
-	run_tool gpiodetect $(gpiosim_chip_number sim2)
+	run_prog gpiodetect $(gpiosim_chip_number sim2)
 
 	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
 	num_lines_is 1
@@ -354,7 +78,7 @@ test_gpiodetect_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim2 .
-	run_tool gpiodetect $GPIOSIM_CHIP_LINK
+	run_prog gpiodetect $GPIOSIM_CHIP_LINK
 
 	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
 	num_lines_is 1
@@ -373,7 +97,7 @@ test_gpiodetect_multiple_chips() {
 	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
 	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
 
-	run_tool gpiodetect $sim0 $sim1 $sim2
+	run_prog gpiodetect $sim0 $sim1 $sim2
 
 	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
 	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
@@ -383,7 +107,7 @@ test_gpiodetect_multiple_chips() {
 }
 
 test_gpiodetect_with_nonexistent_chip() {
-	run_tool gpiodetect nonexistent-chip
+	run_prog gpiodetect nonexistent-chip
 
 	status_is 1
 	output_regex_match \
@@ -398,7 +122,7 @@ test_gpioinfo_all_chips() {
 	gpiosim_chip sim0 num_lines=4
 	gpiosim_chip sim1 num_lines=8
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
@@ -410,7 +134,7 @@ test_gpioinfo_all_chips() {
 	local initial_output=$output
 	gpiosim_chip_symlink sim1 /dev
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_is "$initial_output"
 	status_is 0
@@ -422,7 +146,7 @@ test_gpioinfo_all_chips_with_some_used_lines() {
 
 	dut_run gpioset --banner --active-low foo=1 baz=0
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
@@ -441,7 +165,7 @@ test_gpioinfo_a_chip() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by name
-	run_tool gpioinfo --chip $sim1
+	run_prog gpioinfo --chip $sim1
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -452,7 +176,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by path
-	run_tool gpioinfo --chip $sim1
+	run_prog gpioinfo --chip $sim1
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -463,7 +187,7 @@ test_gpioinfo_a_chip() {
 	status_is 0
 
 	# by number
-	run_tool gpioinfo --chip $sim1
+	run_prog gpioinfo --chip $sim1
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -475,7 +199,7 @@ test_gpioinfo_a_chip() {
 
 	# by symlink
 	gpiosim_chip_symlink sim1 .
-	run_tool gpioinfo --chip $GPIOSIM_CHIP_LINK
+	run_prog gpioinfo --chip $GPIOSIM_CHIP_LINK
 
 	output_contains_line "$sim1 - 4 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
@@ -494,28 +218,28 @@ test_gpioinfo_a_line() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim1 2
+	run_prog gpioinfo --chip $sim1 2
 
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
-	run_tool gpioinfo --chip $sim1 2
+	run_prog gpioinfo --chip $sim1 2
 
 	output_regex_match "$sim1 2\\s+\"bar\"\\s+input"
 	num_lines_is 1
 	status_is 0
 
 	# unquoted
-	run_tool gpioinfo --unquoted --chip $sim1 2
+	run_prog gpioinfo --unquoted --chip $sim1 2
 
 	output_regex_match "$sim1 2\\s+bar\\s+input"
 	num_lines_is 1
@@ -532,7 +256,7 @@ test_gpioinfo_first_matching_named_line() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioinfo foobar
+	run_prog gpioinfo foobar
 
 	output_regex_match "$sim0 3\\s+\"foobar\"\\s+input"
 	num_lines_is 1
@@ -547,7 +271,7 @@ test_gpioinfo_multiple_lines() {
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim1 1 2
+	run_prog gpioinfo --chip $sim1 1 2
 
 	output_regex_match "$sim1 1\\s+unnamed\\s+input"
 	output_regex_match "$sim1 2\\s+\"baz\"\\s+input"
@@ -555,7 +279,7 @@ test_gpioinfo_multiple_lines() {
 	status_is 0
 
 	# by name
-	run_tool gpioinfo bar baz
+	run_prog gpioinfo bar baz
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	output_regex_match "$sim1 2\\s+\"baz\"\\s+input"
@@ -563,7 +287,7 @@ test_gpioinfo_multiple_lines() {
 	status_is 0
 
 	# by name and offset
-	run_tool gpioinfo --chip $sim0 bar 3
+	run_prog gpioinfo --chip $sim0 bar 3
 
 	output_regex_match "$sim0 5\\s+\"bar\"\\s+input"
 	output_regex_match "$sim0 3\\s+unnamed\\s+input"
@@ -580,7 +304,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpioset --banner --active-low --bias=pull-up --drive=open-source foo=1 baz=0
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+output active-low drive=open-source bias=pull-up consumer=\"gpioset\""
@@ -594,7 +318,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpioset --banner --bias=pull-down --drive=open-drain foo=1 baz=0
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+output drive=open-drain bias=pull-down consumer=\"gpioset\""
@@ -608,7 +332,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --bias=disabled --utc -p 10ms foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input bias=disabled edges=both event-clock=realtime debounce-period=10ms consumer=\"gpiomon\""
@@ -622,7 +346,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --edges=rising --localtime foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input edges=rising event-clock=realtime consumer=\"gpiomon\""
@@ -636,7 +360,7 @@ test_gpioinfo_line_attribute_menagerie() {
 
 	dut_run gpiomon --banner --edges=falling foo baz
 
-	run_tool gpioinfo foo baz
+	run_prog gpioinfo foo baz
 
 	output_regex_match \
 "$sim0 1\\s+\"foo\"\\s+input edges=falling consumer=\"gpiomon\""
@@ -652,7 +376,7 @@ test_gpioinfo_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioinfo --chip $sim0 1 1
+	run_prog gpioinfo --chip $sim0 1 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines '1' and '1' are the same line"
@@ -660,7 +384,7 @@ test_gpioinfo_with_same_line_twice() {
 	status_is 1
 
 	# by name
-	run_tool gpioinfo foo foo
+	run_prog gpioinfo foo foo
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
@@ -668,7 +392,7 @@ test_gpioinfo_with_same_line_twice() {
 	status_is 1
 
 	# by name and offset
-	run_tool gpioinfo --chip $sim0 foo 1
+	run_prog gpioinfo --chip $sim0 foo 1
 
 	output_regex_match "$sim0 1\\s+\"foo\"\\s+input"
 	output_regex_match ".*lines 'foo' and '1' are the same line"
@@ -686,7 +410,7 @@ test_gpioinfo_all_lines_matching_name() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
 
-	run_tool gpioinfo --strict foobar
+	run_prog gpioinfo --strict foobar
 
 	output_regex_match "$sim0 3\\s+\"foobar\"\\s+input"
 	output_regex_match "$sim1 2\\s+\"foobar\"\\s+input"
@@ -703,7 +427,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# first by offset (to show offsets match first)
-	run_tool gpioinfo --chip $sim0 1 6
+	run_prog gpioinfo --chip $sim0 1 6
 
 	output_regex_match "$sim0 1\\s+\"6\"\\s+input"
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
@@ -711,7 +435,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 	status_is 0
 
 	# then strictly by name
-	run_tool gpioinfo --by-name --chip $sim0 1
+	run_prog gpioinfo --by-name --chip $sim0 1
 
 	output_regex_match "$sim0 6\\s+\"1\"\\s+input"
 	num_lines_is 1
@@ -719,7 +443,7 @@ test_gpioinfo_with_lines_strictly_by_name() {
 }
 
 test_gpioinfo_with_nonexistent_chip() {
-	run_tool gpioinfo --chip nonexistent-chip
+	run_prog gpioinfo --chip nonexistent-chip
 
 	output_regex_match \
 ".*cannot find GPIO chip character device 'nonexistent-chip'"
@@ -729,12 +453,12 @@ test_gpioinfo_with_nonexistent_chip() {
 test_gpioinfo_with_nonexistent_line() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioinfo nonexistent-line
+	run_prog gpioinfo nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
 
-	run_tool gpioinfo --chip ${GPIOSIM_CHIP_NAME[sim0]} nonexistent-line
+	run_prog gpioinfo --chip ${GPIOSIM_CHIP_NAME[sim0]} nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -745,7 +469,7 @@ test_gpioinfo_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioinfo --chip $sim0 0 1 2 3 4 5
+	run_prog gpioinfo --chip $sim0 0 1 2 3 4 5
 
 	output_regex_match "$sim0 0\\s+unnamed\\s+input"
 	output_regex_match "$sim0 1\\s+unnamed\\s+input"
@@ -766,12 +490,12 @@ test_gpioget_by_name() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget foo
+	run_prog gpioget foo
 
 	output_is "\"foo\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted foo
+	run_prog gpioget --unquoted foo
 
 	output_is "foo=active"
 	status_is 0
@@ -782,12 +506,12 @@ test_gpioget_by_offset() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
+	run_prog gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
 
 	output_is "\"1\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
+	run_prog gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1
 
 	output_is "1=active"
 	status_is 0
@@ -799,7 +523,7 @@ test_gpioget_by_symlink() {
 
 	gpiosim_set_pull sim0 1 pull-up
 
-	run_tool gpioget --chip $GPIOSIM_CHIP_LINK 1
+	run_prog gpioget --chip $GPIOSIM_CHIP_LINK 1
 
 	output_is "\"1\"=active"
 	status_is 0
@@ -811,12 +535,12 @@ test_gpioget_by_chip_and_name() {
 
 	gpiosim_set_pull sim1 3 pull-up
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
+	run_prog gpioget --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
 
 	output_is "\"foo\"=active"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
+	run_prog gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim1]} foo
 
 	output_is "foo=active"
 	status_is 0
@@ -831,7 +555,7 @@ test_gpioget_first_matching_named_line() {
 
 	gpiosim_set_pull sim0 3 pull-up
 
-	run_tool gpioget foobar
+	run_prog gpioget foobar
 
 	output_is "\"foobar\"=active"
 	status_is 0
@@ -845,7 +569,7 @@ test_gpioget_multiple_lines() {
 	gpiosim_set_pull sim0 5 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1 2 3 4 5 6 7
+	run_prog gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=active 3=active 4=inactive 5=active 6=inactive 7=active"
@@ -861,7 +585,7 @@ test_gpioget_multiple_lines_by_name_and_offset() {
 	gpiosim_set_pull sim0 4 pull-up
 	gpiosim_set_pull sim0 6 pull-up
 
-	run_tool gpioget --chip $sim0 0 foo 4 bar
+	run_prog gpioget --chip $sim0 0 foo 4 bar
 
 	output_is "\"0\"=inactive \"foo\"=active \"4\"=active \"bar\"=active"
 	status_is 0
@@ -874,7 +598,7 @@ test_gpioget_multiple_lines_across_multiple_chips() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim1 4 pull-up
 
-	run_tool gpioget baz bar foo xyz
+	run_prog gpioget baz bar foo xyz
 
 	output_is "\"baz\"=inactive \"bar\"=inactive \"foo\"=active \"xyz\"=active"
 	status_is 0
@@ -890,7 +614,7 @@ test_gpioget_with_numeric_values() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --numeric --chip $sim0 0 1 2 3 4 5 6 7
+	run_prog gpioget --numeric --chip $sim0 0 1 2 3 4 5 6 7
 
 	output_is "0 0 1 1 0 1 0 1"
 	status_is 0
@@ -906,7 +630,7 @@ test_gpioget_with_active_low() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --active-low --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_prog gpioget --active-low --unquoted --chip $sim0 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=inactive 3=inactive 4=active 5=inactive 6=active 7=inactive"
@@ -919,7 +643,7 @@ test_gpioget_with_consumer() {
 
 	dut_run gpionotify --banner -F "%l %E %C" foo baz
 
-	run_tool gpioget --consumer gpio-tools-tests foo baz
+	run_prog gpioget --consumer gpio-tools-tests foo baz
 	status_is 0
 
 	dut_read
@@ -937,7 +661,7 @@ test_gpioget_with_pull_up() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-up --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_prog gpioget --bias=pull-up --unquoted --chip $sim0 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=active 1=active 2=active 3=active 4=active 5=active 6=active 7=active"
@@ -954,7 +678,7 @@ test_gpioget_with_pull_down() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --bias=pull-down --unquoted --chip $sim0 0 1 2 3 4 5 6 7
+	run_prog gpioget --bias=pull-down --unquoted --chip $sim0 0 1 2 3 4 5 6 7
 
 	output_is \
 "0=inactive 1=inactive 2=inactive 3=inactive 4=inactive 5=inactive 6=inactive 7=inactive"
@@ -967,31 +691,31 @@ test_gpioget_with_direction_as_is() {
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
@@ -1000,7 +724,7 @@ test_gpioget_with_hold_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo
 
 	# only test parsing - testing the hold-period itself is tricky
-	run_tool gpioget --hold-period=100ms foo
+	run_prog gpioget --hold-period=100ms foo
 	output_is "\"foo\"=inactive"
 	status_is 0
 }
@@ -1012,7 +736,7 @@ test_gpioget_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpioget --strict foobar
+	run_prog gpioget --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -1026,12 +750,12 @@ test_gpioget_with_lines_by_offset() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_prog gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
 
 	output_is "\"1\"=active \"6\"=inactive"
 	status_is 0
 
-	run_tool gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_prog gpioget --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
 
 	output_is "1=active 6=inactive"
 	status_is 0
@@ -1045,19 +769,19 @@ test_gpioget_with_lines_strictly_by_name() {
 	gpiosim_set_pull sim0 1 pull-up
 	gpiosim_set_pull sim0 6 pull-down
 
-	run_tool gpioget --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_prog gpioget --by-name --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
 
 	output_is "\"1\"=inactive \"6\"=active"
 	status_is 0
 
-	run_tool gpioget --by-name --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
+	run_prog gpioget --by-name --unquoted --chip ${GPIOSIM_CHIP_NAME[sim0]} 1 6
 
 	output_is "1=inactive 6=active"
 	status_is 0
 }
 
 test_gpioget_with_no_arguments() {
-	run_tool gpioget
+	run_prog gpioget
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -1066,7 +790,7 @@ test_gpioget_with_no_arguments() {
 test_gpioget_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_prog gpioget --chip ${GPIOSIM_CHIP_NAME[sim0]}
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -1076,7 +800,7 @@ test_gpioget_with_offset_out_of_range() {
 	gpiosim_chip sim0 num_lines=4
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioget --chip $sim0 0 1 2 3 4 5
+	run_prog gpioget --chip $sim0 0 1 2 3 4 5
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1084,7 +808,7 @@ test_gpioget_with_offset_out_of_range() {
 }
 
 test_gpioget_with_nonexistent_line() {
-	run_tool gpioget nonexistent-line
+	run_prog gpioget nonexistent-line
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -1095,31 +819,31 @@ test_gpioget_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioget --chip $sim0 0 0
+	run_prog gpioget --chip $sim0 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpioget foo foo
+	run_prog gpioget foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by chip and name
-	run_tool gpioget --chip $sim0 foo foo
+	run_prog gpioget --chip $sim0 foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioget --chip $sim0 foo 1
+	run_prog gpioget --chip $sim0 foo 1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioget --chip $sim0 1 foo
+	run_prog gpioget --chip $sim0 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -1128,7 +852,7 @@ test_gpioget_with_same_line_twice() {
 test_gpioget_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1
+	run_prog gpioget --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1137,7 +861,7 @@ test_gpioget_with_invalid_bias() {
 test_gpioget_with_invalid_hold_period() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioget --hold-period=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0
+	run_prog gpioget --hold-period=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1257,7 +981,7 @@ test_gpioset_with_consumer() {
 
 	dut_run gpioset --banner --consumer gpio-tools-tests foo=1 baz=0
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -1629,7 +1353,7 @@ test_gpioset_with_invalid_toggle_period() {
 	gpiosim_chip sim0 num_lines=8 line_name=1:foo line_name=4:bar \
 				      line_name=7:baz
 
-	run_tool gpioset --toggle 1ns foo=1 bar=0 baz=0
+	run_prog gpioset --toggle 1ns foo=1 bar=0 baz=0
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1642,7 +1366,7 @@ test_gpioset_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpioset --strict foobar=active
+	run_prog gpioset --strict foobar=active
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -1699,7 +1423,7 @@ test_gpioset_interactive_after_SIGTERM() {
 }
 
 test_gpioset_with_no_arguments() {
-	run_tool gpioset
+	run_prog gpioset
 
 	status_is 1
 	output_regex_match ".*at least one GPIO line value must be specified"
@@ -1708,7 +1432,7 @@ test_gpioset_with_no_arguments() {
 test_gpioset_with_chip_but_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_prog gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]}
 
 	output_regex_match ".*at least one GPIO line value must be specified"
 	status_is 1
@@ -1719,7 +1443,7 @@ test_gpioset_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --chip $sim0 0=1 1=1 2=1 3=1 4=1 5=1
+	run_prog gpioset --chip $sim0 0=1 1=1 2=1 3=1 4=1 5=1
 
 	output_regex_match ".*offset 4 is out of range on chip '$sim0'"
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
@@ -1731,7 +1455,7 @@ test_gpioset_with_invalid_hold_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --hold-period=bad --chip $sim0 0=1
+	run_prog gpioset --hold-period=bad --chip $sim0 0=1
 
 	output_regex_match ".*invalid period.*"
 	status_is 1
@@ -1743,13 +1467,13 @@ test_gpioset_with_invalid_value() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by name
-	run_tool gpioset --chip $sim0 0=c
+	run_prog gpioset --chip $sim0 0=c
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
 
 	# by value
-	run_tool gpioset --chip $sim0 0=3
+	run_prog gpioset --chip $sim0 0=3
 
 	output_regex_match ".*invalid line value.*"
 	status_is 1
@@ -1758,7 +1482,7 @@ test_gpioset_with_invalid_value() {
 test_gpioset_with_invalid_offset() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]} 4000000000=0
+	run_prog gpioset --chip ${GPIOSIM_CHIP_NAME[sim0]} 4000000000=0
 
 	output_regex_match ".*cannot find line '4000000000'"
 	status_is 1
@@ -1767,7 +1491,7 @@ test_gpioset_with_invalid_offset() {
 test_gpioset_with_invalid_bias() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+	run_prog gpioset --bias=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -1776,7 +1500,7 @@ test_gpioset_with_invalid_bias() {
 test_gpioset_with_invalid_drive() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpioset --drive=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
+	run_prog gpioset --drive=bad --chip ${GPIOSIM_CHIP_NAME[sim0]} 0=1 1=1
 
 	output_regex_match ".*invalid drive.*"
 	status_is 1
@@ -1787,14 +1511,14 @@ test_gpioset_with_interactive_and_toggle() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpioset --interactive --toggle 1s --chip $sim0 0=1
+	run_prog gpioset --interactive --toggle 1s --chip $sim0 0=1
 
 	output_regex_match ".*can't combine interactive with toggle"
 	status_is 1
 }
 
 test_gpioset_with_nonexistent_line() {
-	run_tool gpioset nonexistent-line=0
+	run_prog gpioset nonexistent-line=0
 
 	output_regex_match ".*cannot find line 'nonexistent-line'"
 	status_is 1
@@ -1806,25 +1530,25 @@ test_gpioset_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpioset --chip $sim0 0=1 0=1
+	run_prog gpioset --chip $sim0 0=1 0=1
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpioset --chip $sim0 foo=1 foo=1
+	run_prog gpioset --chip $sim0 foo=1 foo=1
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpioset --chip $sim0 foo=1 1=1
+	run_prog gpioset --chip $sim0 foo=1 1=1
 
 	output_regex_match ".*lines 'foo' and '1' are the same line"
 	status_is 1
 
 	# by offset and name
-	run_tool gpioset --chip $sim0 1=1 foo=1
+	run_prog gpioset --chip $sim0 1=1 foo=1
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -2020,7 +1744,7 @@ test_gpiomon_with_consumer() {
 
 	dut_run gpiomon --banner --consumer gpio-tools-tests foo baz
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -2091,7 +1815,7 @@ test_gpiomon_with_debounce_period() {
 
 	dut_run gpiomon --banner --debounce-period 123us foo baz
 
-	run_tool gpioinfo
+	run_prog gpioinfo
 
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
 	output_regex_match \
@@ -2197,7 +1921,7 @@ test_gpiomon_exit_after_SIGTERM() {
 }
 
 test_gpiomon_with_nonexistent_line() {
-	run_tool gpiomon nonexistent-line
+	run_prog gpiomon nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
@@ -2209,19 +1933,19 @@ test_gpiomon_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpiomon --chip $sim0 0 0
+	run_prog gpiomon --chip $sim0 0 0
 
 	output_regex_match ".*lines '0' and '0' are the same line"
 	status_is 1
 
 	# by name
-	run_tool gpiomon foo foo
+	run_prog gpiomon foo foo
 
 	output_regex_match ".*lines 'foo' and 'foo' are the same line"
 	status_is 1
 
 	# by name and offset
-	run_tool gpiomon --chip $sim0 1 foo
+	run_prog gpiomon --chip $sim0 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	status_is 1
@@ -2234,7 +1958,7 @@ test_gpiomon_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpiomon --strict foobar
+	run_prog gpiomon --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -2294,7 +2018,7 @@ test_gpiomon_with_lines_strictly_by_name() {
 }
 
 test_gpiomon_with_no_arguments() {
-	run_tool gpiomon
+	run_prog gpiomon
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2303,7 +2027,7 @@ test_gpiomon_with_no_arguments() {
 test_gpiomon_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpiomon --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_prog gpiomon --chip ${GPIOSIM_CHIP_NAME[sim0]}
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2314,7 +2038,7 @@ test_gpiomon_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --chip $sim0 5
+	run_prog gpiomon --chip $sim0 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2325,7 +2049,7 @@ test_gpiomon_with_invalid_bias() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --bias=bad -c $sim0 0 1
+	run_prog gpiomon --bias=bad -c $sim0 0 1
 
 	output_regex_match ".*invalid bias.*"
 	status_is 1
@@ -2336,7 +2060,7 @@ test_gpiomon_with_invalid_debounce_period() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --debounce-period bad -c $sim0 0 1
+	run_prog gpiomon --debounce-period bad -c $sim0 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2347,7 +2071,7 @@ test_gpiomon_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpiomon --idle-timeout bad -c $sim0 0 1
+	run_prog gpiomon --idle-timeout bad -c $sim0 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -2772,7 +2496,7 @@ test_gpionotify_exit_after_SIGTERM() {
 }
 
 test_gpionotify_with_nonexistent_line() {
-	run_tool gpionotify nonexistent-line
+	run_prog gpionotify nonexistent-line
 
 	status_is 1
 	output_regex_match ".*cannot find line 'nonexistent-line'"
@@ -2784,21 +2508,21 @@ test_gpionotify_with_same_line_twice() {
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
 	# by offset
-	run_tool gpionotify --chip $sim0 0 0
+	run_prog gpionotify --chip $sim0 0 0
 
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
-	run_tool gpionotify --chip $sim0 1 foo
+	run_prog gpionotify --chip $sim0 1 foo
 
 	output_regex_match ".*lines '1' and 'foo' are the same line"
 	num_lines_is 1
@@ -2812,7 +2536,7 @@ test_gpionotify_with_strict_named_line_check() {
 				      line_name=4:xyz line_name=7:foobar
 	gpiosim_chip sim2 num_lines=16
 
-	run_tool gpionotify --strict foobar
+	run_prog gpionotify --strict foobar
 
 	output_regex_match ".*line 'foobar' is not unique"
 	status_is 1
@@ -2856,7 +2580,7 @@ test_gpionotify_with_lines_strictly_by_name() {
 }
 
 test_gpionotify_with_no_arguments() {
-	run_tool gpionotify
+	run_prog gpionotify
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2865,7 +2589,7 @@ test_gpionotify_with_no_arguments() {
 test_gpionotify_with_no_line_specified() {
 	gpiosim_chip sim0 num_lines=8
 
-	run_tool gpionotify --chip ${GPIOSIM_CHIP_NAME[sim0]}
+	run_prog gpionotify --chip ${GPIOSIM_CHIP_NAME[sim0]}
 
 	output_regex_match ".*at least one GPIO line must be specified"
 	status_is 1
@@ -2876,7 +2600,7 @@ test_gpionotify_with_offset_out_of_range() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --chip $sim0 5
+	run_prog gpionotify --chip $sim0 5
 
 	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
 	status_is 1
@@ -2887,7 +2611,7 @@ test_gpionotify_with_invalid_idle_timeout() {
 
 	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
 
-	run_tool gpionotify --idle-timeout bad -c $sim0 0 1
+	run_prog gpionotify --idle-timeout bad -c $sim0 0 1
 
 	output_regex_match ".*invalid period: bad"
 	status_is 1
@@ -3039,52 +2763,5 @@ test_gpionotify_with_custom_format_unknown_specifier() {
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
-	local FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)
-	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
-		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
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
-check_prog shunit2
-check_prog modprobe
-check_prog timeout
-check_prog grep
-
-# Check if we're running a kernel at the required version or later
-check_kernel $MIN_KERNEL_VERSION
-
-modprobe gpio-sim || die "unable to load the gpio-sim module"
-mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
-	die "configfs not mounted at /sys/kernel/config/"
-
+. gpiod-bash-test-helper.inc
 . shunit2
-- 
2.40.1


