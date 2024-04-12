Return-Path: <linux-gpio+bounces-5428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090CF8A2E3D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3F81F23607
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A2C56B68;
	Fri, 12 Apr 2024 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2lzKhdqk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0456B63
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924916; cv=none; b=Rd+17Ive8mLJpxjyrlrCutbXuFTU1ANCWWHtoHxyyFlUM9+N69sOlRjlQGuqSv7eDtaXz2R0BxYQF2F7lxNPKJ2dFHzejs2aQvIXanTdvRaacMA/SSLdnMuQbbc6TficIdEAZ5EBvsBqTkhTuTD2xm0VR6QysutHPwe4T5VkjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924916; c=relaxed/simple;
	bh=+Q2B7X2nTn5O/bz79cTEwLCluIDE12+PINUk7zRwakg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTFD4Jy0AliY7WYMpFMiwSzwxBqYiczUe+Uuw2mszi+QbAEx2x3ITbkCFuPZyVB5VbadHxFyY3Xxteb7Izma6na0LWF3xAc5Gck9lZFUSGM1XCbP7P2y2ZOJTaKkXgKKQ0Kr2qjzpKXYTemj+EKtEn4N1FjIzliTNNgf4Lrl/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2lzKhdqk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41802e8daafso2626445e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924911; x=1713529711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZPleC2CSr4RYi9uS2aTwDw9TfJ2xWSKujC0AisKXDA=;
        b=2lzKhdqkTUfvGJV58TjZkp84N2xuLCOODlOVZMl3FsPAjNdWwCx1bsR58VUcTvI7O9
         yvXxbSxsAeHyTP9TEPt6Hswp03HXMvUdpblg4ddIdNw8Q8OsfOhC8NHMFd1l1KVcLwdB
         y3EavmA/01AXEuNR+lNsPmdjaQoRgtsrmsPD6Q9K4spBspKXAbRbr3nEG3YRqFtx9i7+
         m+vhuXOS+FiojLM8oiEUO+57eeD5CR5m0sK0fpvUnmfurayvTTi8Z1UYVKqaOTuUDx0C
         PlgVlAYJwd48pzI7IrxAF7cI5CzasYNZoQq/S8UEv/hQ/WrCogI5PxvXC9YgWxTVS8i+
         MJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924911; x=1713529711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZPleC2CSr4RYi9uS2aTwDw9TfJ2xWSKujC0AisKXDA=;
        b=DYXQVFTKWWkbHPsChXC09KRqa3fe96IKTqp0uV5aBLEksvP5A2IbgsCxMoBKmtmG/B
         fIhttxVY6Umbw6RYJJPqOMavwmTJ2D9aO2vzjndQqA1Ao9nPz39Rak2otxIe29KdqE79
         Kq5FzdtZ9p+BOYg4PBc6rCGEPv+weaFLNh6iM5++lJpyNfu4/9pvFm80s68MVNJ673NP
         s4pApMarCMnmMk+SG8dnLYN0seODZTictIwIp1eZ2zspfz3LBG7LX0G+1LsPZjidO8L8
         fET9n2T+MYuxuj+4NThYX0JCk0uEtaIY2Xbxdl2Uo62uhjiHaND0m2iWLQR8L/sC0Hjk
         U1ZQ==
X-Gm-Message-State: AOJu0YzknEqmw9ML44wzY6G/TuYJLoc6XvjI3pVn19t1teuziiBfRS05
	YnbX+c1YqIr50oua0H80v3xW/aDnhXz1VndBNh/+ihlmoo11M/5edvIfv8gC3vs=
X-Google-Smtp-Source: AGHT+IHDaNZ2QLZFTNGX9vZSnaEsyj3Wu1Kg/zP2BWoHE76ZGZ3/ap2r6ng636FCpn+IbFBMniaN/Q==
X-Received: by 2002:a05:600c:560f:b0:416:a014:f1b9 with SMTP id jr15-20020a05600c560f00b00416a014f1b9mr1910156wmb.20.1712924911379;
        Fri, 12 Apr 2024 05:28:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 16/18] dbus: client: add tests
Date: Fri, 12 Apr 2024 14:28:02 +0200
Message-Id: <20240412122804.109323-17-brgl@bgdev.pl>
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

Add a set of bash tests of the command-line DBus client.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli-test.bash | 1439 +++++++++++++++++++++++++++++++++
 1 file changed, 1439 insertions(+)
 create mode 100755 dbus/client/gpiocli-test.bash

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
new file mode 100755
index 0000000..9bad8f2
--- /dev/null
+++ b/dbus/client/gpiocli-test.bash
@@ -0,0 +1,1439 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#
+# Test cases for gpiocli utility. This test-suite assumes that gpio-manager
+# is already running.
+#
+
+SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
+
+wait_for_sim() {
+	COUNTER=100
+
+	while true
+	do
+		gdbus call --system --dest io.gpiod1 \
+			--object-path /io/gpiod1/chips/$1 \
+			--method org.freedesktop.DBus.Peer.Ping > /dev/null 2>&1 && break
+		sleep 0.01
+		COUNTER=$(expr $COUNTER - 1)
+		if [ $COUNTER -eq 0 ]
+		then
+			fail "error waiting for the GPIO sim chip to be exported on the bus"
+			return 1
+		fi
+	done
+}
+
+# Create a simulated GPIO chip and wait until it's exported by the gpio-manager.
+gpiosim_chip_dbus() {
+	gpiosim_chip $*
+	wait_for_sim ${GPIOSIM_CHIP_NAME[$1]}
+}
+
+gpiodbus_release_request() {
+	run_prog gpiocli release $1
+	status_is 0
+}
+
+gpiodbus_check_request() {
+	run_prog gpiocli requests
+	status_is 0
+	num_lines_is 1
+	output_regex_match $1
+}
+
+#
+# gpiocli wait test cases
+#
+
+test_wait_for_manager() {
+	run_prog gpiocli wait
+	status_is 0
+	num_lines_is 0
+}
+
+test_wait_for_chip() {
+	dut_run gpiocli wait --chip=foobar
+	sleep 0.01
+
+	gpiosim_chip_dbus sim0 label=foobar
+	dut_flush
+	dut_read
+
+	status_is 0
+	num_lines_is 0
+}
+
+test_wait_timeout() {
+	run_prog gpiocli wait --chip=foobar --timeout=100ms
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: wait timed out!"
+}
+
+#
+# gpiocli detect test cases
+#
+
+test_detect_all_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_prog gpiocli detect
+
+	status_is 0
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+
+	# ignoring symlinks
+	local initial_output=$output
+	gpiosim_chip_symlink sim1 /dev
+
+	run_prog gpiocli detect
+
+	status_is 0
+	output_is "$initial_output"
+}
+
+test_detect_one_chip() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	# by name
+	run_prog gpiocli detect $sim0
+
+	status_is 0
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	num_lines_is 1
+
+	# by number
+	run_prog gpiocli detect $(gpiosim_chip_number sim2)
+
+	status_is 0
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	num_lines_is 1
+}
+
+test_detect_multiple_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=16
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+	local sim2=${GPIOSIM_CHIP_NAME[sim2]}
+	local sim0dev=${GPIOSIM_DEV_NAME[sim0]}
+	local sim1dev=${GPIOSIM_DEV_NAME[sim1]}
+	local sim2dev=${GPIOSIM_DEV_NAME[sim2]}
+
+	run_prog gpiocli detect $sim0 $sim1 $sim2
+
+	status_is 0
+	output_contains_line "$sim0 [${sim0dev}-node0] (4 lines)"
+	output_contains_line "$sim1 [${sim1dev}-node0] (8 lines)"
+	output_contains_line "$sim2 [${sim2dev}-node0] (16 lines)"
+	num_lines_is 3
+}
+
+test_detect_with_nonexistent_chip() {
+	run_prog gpiocli detect nonexistent_chip
+
+	status_is 1
+	output_regex_match ".*: No such chip: 'nonexistent_chip'"
+}
+
+#
+# gpiocli info test cases
+#
+
+test_info_all_chips() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+
+	run_prog gpiocli info
+
+	status_is 0
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
+	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+\[input\]"
+	output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+\[input\]"
+}
+
+test_info_one_chip() {
+	gpiosim_chip_dbus sim0 num_lines=4
+	gpiosim_chip_dbus sim1 num_lines=8
+	gpiosim_chip_dbus sim2 num_lines=12
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	# by name
+	run_prog gpiocli info -c $sim1
+
+	status_is 0
+	output_contains_line "$sim1 - 8 lines:"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+\[input\]"
+	num_lines_is 9
+
+	# by number
+	run_prog gpiocli info -c $(gpiosim_chip_number sim1)
+
+	status_is 0
+	output_contains_line "$sim1 - 8 lines:"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+\[input\]"
+	num_lines_is 9
+}
+
+test_info_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info bar
+
+	status_is 0
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	num_lines_is 1
+}
+
+test_info_one_line_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=8
+	gpiosim_chip_dbus sim1 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info -c $sim0 3
+
+	status_is 0
+	output_regex_match "$sim0\\s+3:\\s+unnamed\\s+\[input\]"
+	num_lines_is 1
+}
+
+test_info_two_lines_by_chip_offset_and_name() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli info -c $sim0 3 bar
+
+	status_is 0
+	output_regex_match "$sim0\\s+3:\\s+\"foo\"\\s+\[input\]"
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	num_lines_is 2
+}
+
+test_info_two_lines() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_prog gpiocli info bar baz
+
+	status_is 0
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	num_lines_is 2
+}
+
+test_info_repeating_lines() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=8 line_name=2:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	run_prog gpiocli info baz bar baz
+
+	status_is 0
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	output_regex_match "$sim0\\s+5:\\s+\"bar\"\\s+\[input\]"
+	output_regex_match "$sim1\\s+2:\\s+\"baz\"\\s+\[input\]"
+	num_lines_is 3
+}
+
+#
+# gpiocli find test cases
+#
+
+test_map_existing_line() {
+	gpiosim_chip_dbus sim0 num_lines=4 line_name=3:baz
+	gpiosim_chip_dbus sim1 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli find bar
+
+	status_is 0
+	num_lines_is 1
+	output_is "${GPIOSIM_CHIP_NAME[sim1]} 5"
+}
+
+test_map_nonexistent_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli find foobar
+
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: line 'foobar' not found"
+}
+
+#
+# gpiocli request test cases
+#
+
+test_request_invalid_arguments() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=3:foo
+
+	run_prog gpiocli request --input --output foo
+	status_is 1
+	output_regex_match ".*: --input and --output are mutually exclusive"
+
+	run_prog gpiocli request --output --both-edges foo
+	status_is 1
+	output_regex_match ".*: monitoring edges is only possible in input mode"
+
+	run_prog gpiocli request --output --open-source --open-drain foo
+	status_is 1
+	output_regex_match ".*: --push-pull, --open-drain and --open-source are mutually exclusive"
+
+	run_prog gpiocli request --input --open-source foo
+	status_is 1
+	output_regex_match ".*: --push-pull, --open-drain and --open-source are only available in output mode"
+
+	run_prog gpiocli request --input --bias-disabled --pull-down foo
+	status_is 1
+	output_regex_match ".*: --pull-up, --pull-down and --bias-disabled are mutually exclusive"
+
+	run_prog gpiocli request --input --debounce-period=3000 foo
+	status_is 1
+	output_regex_match ".*: --debounce-period can only be used with edge-detection enabled"
+
+	run_prog gpiocli request --input --clock-monotonic foo
+	status_is 1
+	output_regex_match ".*: --clock-monotonic, --clock-realtime and --clock-hte can only be used with edge detection enabled"
+
+	run_prog gpiocli request --input --clock-monotonic --clock-realtime foo
+	status_is 1
+	output_regex_match ".*: --clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive"
+}
+
+test_request_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[5\]"
+	gpiodbus_release_request $request
+}
+
+test_request_one_line_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --chip=$sim0 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[4\]"
+	gpiodbus_release_request $request
+}
+
+test_request_from_different_chips() {
+	gpiosim_chip_dbus sim0 num_lines=8 line_name=1:foo line_name=5:bar
+	gpiosim_chip_dbus sim1 num_lines=4 line_name=1:xyz
+
+	run_prog gpiocli request --input foo xyz
+	status_is 1
+	output_regex_match ".*: all requested lines must belong to the same chip"
+}
+
+test_multiple_requests() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --chip=$sim0 0
+	status_is 0
+	num_lines_is 1
+	local request0=$output
+
+	run_prog gpiocli request --output --chip=$sim0 1 2
+	status_is 0
+	num_lines_is 1
+	local request1=$output
+
+	run_prog gpiocli request --chip=$sim0 5
+	status_is 0
+	num_lines_is 1
+	local request2=$output
+
+	run_prog gpiocli requests
+	status_is 0
+	num_lines_is 3
+	output_contains_line "$request0 ($sim0) Offsets: [0]"
+	output_contains_line "$request1 ($sim0) Offsets: [1, 2]"
+	output_contains_line "$request2 ($sim0) Offsets: [5]"
+
+	gpiodbus_release_request $request0
+	gpiodbus_release_request $request1
+	gpiodbus_release_request $request2
+}
+
+test_request_multiple_lines_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo xyz bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[1, 11, 5\]"
+	gpiodbus_release_request $request
+}
+
+test_request_multiple_lines_by_chip_number_by_name_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input -c $(gpiosim_chip_number sim0) xyz 0 foo 15
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[11, 0, 1, 15\]"
+	gpiodbus_release_request $request
+}
+
+test_request_with_consumer_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --consumer='foobar' foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "gpiochip1\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foobar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_with_consumer_name_with_whitespaces() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --consumer='foo bar' foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "gpiochip1\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foo bar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_active_low() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --active-low foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",active-low,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_request_pull_up() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --pull-up foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=pull-up,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_request_pull_down() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --pull-down foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=pull-down,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_request_pull_bias_disabled() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --bias-disabled foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",bias=disabled,input\]"
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_request_drive_push_pull() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --push-pull foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_drive_open_drain() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,open-drain\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_drive_open_source() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-source foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,open-source\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_falling() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=falling,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_rising() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --rising-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=rising,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_both() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_falling_and_rising() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_with_debounce_period() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge --debounce-period=4000 foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=monotonic,debounce-period=4000,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_edge_with_realtime_clock() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --falling-edge --rising-edge --clock-realtime foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",edges=both,event-clock=realtime,input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_request_with_output_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz line_name=9:abc
+
+	run_prog gpiocli request --output foo=active bar=inactive xyz=1
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get -r $request
+	status_is 0
+	num_lines_is 1
+	output_regex_match "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_request_output_values_input_mode() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo=active bar=inactive xyz=1
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: Output values can only be set in output mode"
+}
+
+test_request_output_values_invalid_format() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo=active bar=foobar xyz=1
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: 'foobar'"
+}
+
+#
+# gpiocli reconfigure test cases
+#
+
+test_reconfigure_from_output_to_input() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo=active bar=inactive xyz=1
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	run_prog gpiocli reconfigure --input $request
+	status_is 0
+	num_lines_is 1
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	gpiodbus_release_request $request
+}
+
+test_reconfigure_from_input_to_output_with_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	run_prog gpiocli reconfigure --output $request 1 0 active
+	status_is 0
+	num_lines_is 1
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",output,push-pull\]"
+
+	run_prog gpiocli get foo bar xyz
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active \"bar\"=inactive \"xyz\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_reconfigure_fails_with_wrong_number_of_output_values() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	run_prog gpiocli reconfigure --output $request 1 0
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: The number of output values must correspond to the number of lines in the request"
+
+	run_prog gpiocli reconfigure --output $request 1 0 1 0
+	status_is 1
+	num_lines_is 3
+
+	gpiodbus_release_request $request
+}
+
+#
+# gpiocli release test cases
+#
+
+test_release_nonexistent_request() {
+	run_prog gpiocli release request0
+	status_is 1
+	output_regex_match ".*: No such request: 'request0'"
+}
+
+#
+# gpiocli get test cases
+#
+
+test_get_value_for_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli get foo
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: Line 'foo' not managed by gpio-manager, must be requested first"
+}
+
+test_get_one_value_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_prog gpiocli get foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"foo\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_get_multiple_values_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo xyz bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 11 pull-down
+
+	run_prog gpiocli get xyz bar foo
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=inactive \"bar\"=active \"foo\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_get_one_value_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input xyz foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	run_prog gpiocli get --request=$request 1
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_get_multiple_values_by_request_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request=$request 11 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"11\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_get_multiple_values_by_request_names_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request=$request xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_get_all_values_for_request() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_get_unquoted_output() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --unquoted --request=$request xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "xyz=active 1=active 5=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_get_numeric_output() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --input foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-down
+	gpiosim_set_pull sim0 11 pull-up
+
+	run_prog gpiocli get --numeric --request=$request xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=1 \"1\"=1 \"5\"=0"
+
+	gpiodbus_release_request $request
+}
+
+#
+# gpiocli set test cases
+#
+
+test_set_value_for_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli set foo=active
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*: Line 'foo' not managed by gpio-manager, must be requested first"
+}
+
+test_set_one_value_with_invalid_arguments() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli set bar=wrong
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: 'wrong'"
+
+	run_prog gpiocli set bar=
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: invalid output value: ''"
+
+	run_prog gpiocli set bar
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: line must have a single value assigned"
+
+	gpiodbus_release_request $request
+}
+
+test_set_one_value_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active
+	status_is 0
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_set_multiple_values_by_names() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active foo=active xyz=0
+	status_is 0
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_set_one_value_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set -r $request 5=1
+	status_is 0
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request $request
+}
+
+test_set_multiple_values_by_request_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request=$request 11=active 5=1 1=0
+	status_is 0
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request $request
+}
+
+test_set_multiple_values_by_request_names_and_offsets() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	run_prog gpiocli request --output foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request=$request xyz=active 5=1 foo=0
+	status_is 0
+
+	run_prog gpiocli get --request=$request
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request $request
+}
+
+#
+# gpiocli notify test cases
+#
+
+test_notify_print_initial_info_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges --clock-realtime --debounce-period=5000 foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify foo
+	dut_read
+
+	output_is "$sim0 - 1 (\"foo\"): [input,used,consumer=\"gpio-manager\",both-edges,realtime-clockdebounced,debounce-period=5000,managed,request=\"request0\"]"
+
+	gpiodbus_release_request $request
+}
+
+test_notify_print_initial_info_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify --chip=$sim0 5
+	dut_read
+
+	output_is "$sim0 - 5 (\"bar\"): [output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"]"
+
+	gpiodbus_release_request $request
+}
+
+test_notify_print_initial_info_by_chip_name_and_offset_for_multiple_lines() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli notify --chip=$sim0 5 foo 11
+
+	dut_read
+	output_regex_match ".*$sim0 - 5 \(\"bar\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 1 \(\"foo\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 11 \(\"xyz\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+
+	gpiodbus_release_request $request
+}
+
+test_notify_request_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+	dut_flush
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>True\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>open-drain\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[direction=>output\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[consumer=>\"gpio-manager\"\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[used=>True\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[request=>request0\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[managed=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[request=>request0\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[managed=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>True\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>open-drain\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[direction=>output\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[consumer=>\"gpio-manager\"\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[used=>True\]"
+
+	gpiodbus_release_request $request
+}
+
+test_notify_release_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_flush
+
+	gpiodbus_release_request $request
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[consumer=>\"unused\"\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[used=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[request=>N/A\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[managed=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[request=>N/A\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[managed=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[consumer=>\"unused\"\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[used=>False\]"
+}
+
+test_notify_reconfigure_event() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiocli notify foo bar
+
+	run_prog gpiocli request --output --open-drain --active-low foo bar
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_flush
+
+	run_prog gpiocli reconfigure --input --pull-up --rising-edge $request
+	status_is 0
+
+	dut_read
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[bias=>pull-up\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[edge=>rising\]"
+	output_regex_match "$sim0 - 1 \(\"foo\"\): \[direction=>input\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[active-low=>False\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[drive=>push-pull\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[bias=>pull-up\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[edge=>rising\]"
+	output_regex_match "$sim0 - 5 \(\"bar\"\): \[direction=>input\]"
+
+	gpiodbus_release_request $request
+}
+
+#
+# gpiocli monitor test cases
+#
+
+test_monitor_unmanaged_line() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli monitor foo
+
+	output_regex_match ".*: Line must be managed by gpio-manager in order to be monitored"
+}
+
+test_monitor_one_line_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor foo
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+
+	gpiodbus_release_request $request
+}
+
+test_monitor_multiple_lines_by_name() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo bar xyz
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor foo xyz
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 5 pull-up # This should be ignored
+	gpiosim_set_pull sim0 11 pull-up
+	gpiosim_set_pull sim0 1 pull-down
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+	output_regex_match "[0-9]+ rising\\s+\"xyz\""
+	output_regex_match "[0-9]+ falling\\s+\"foo\""
+
+	gpiodbus_release_request $request
+}
+
+test_monitor_one_line_by_request_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges foo
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor --request=$request 1
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+
+	gpiodbus_release_request $request
+}
+
+test_monitor_all_lines_on_request() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges --chip=$sim0 foo bar xyz 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor -r $request
+
+	gpiosim_set_pull sim0 1 pull-up
+	gpiosim_set_pull sim0 4 pull-up
+	gpiosim_set_pull sim0 1 pull-down
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+	output_regex_match "[0-9]+ rising\\s+4"
+	output_regex_match "[0-9]+ falling\\s+\"foo\""
+
+	gpiodbus_release_request $request
+}
+
+. gpiod-bash-test-helper.inc
+check_prog gdbus
+. shunit2
-- 
2.40.1


