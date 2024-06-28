Return-Path: <linux-gpio+bounces-7824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4A491C640
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406A9286600
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4F15FBBA;
	Fri, 28 Jun 2024 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z//Nbzug"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA895558B7
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601161; cv=none; b=pqFlkMI9+tmk3zEc2HwKw9nk059DzWQUdX79BrJzNMO7nLaKXNMChcx9GxOs2YPHALSPLXMawalvZ9TKF/MKnCAlVMLEINAu9XtqbUCKQiZU+cD5oi1PKH6Kaul1mJF28I9Q5GSKJ9vz1V15JYoBmNf6v05GN1Upcy+6mv5lgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601161; c=relaxed/simple;
	bh=dKdAknRu561wxHu0DFMdGa81st129dU/Qi/a/zbHCwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxAHywfCEBtR2lehgaEIaLvvHmMN7F/6QynHWkqj9OEpQVlVLZI3aCFRT9i0GqE7uO0L5Hnbf3YsFRNxnuoK3FUCszy0cVzYXXAkMU12h/7s9kcPdKXxzdw78H8WIiUHOUBONkB/M5pTcQSnTKLL2uOuK2b7F3hUEDbfDjxXQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z//Nbzug; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367601ca463so561023f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601157; x=1720205957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2CdkHHQeS6ZYq46bmamzaG4cQ0med+7M8+gsC9yLVs=;
        b=Z//NbzugAqFPEplfvZSz8lNoLTynxn6KYrum2994c1HjVes1X0O3sNEfaoXOXsuDJu
         sm46V3/P6uirOOA0ExM9joTRd8i51XWfJlAvAuqwfaEVeB1zBj11kSR+LWWCVWzPKlY9
         D5jZ2HZHRDoW7EnUvlIRo42duc4187CxZGVpP9LCT2nvDLPbU67HZJrOj4aeARJqOaqb
         nXhUsQA9ihEBcpJE0EhV5u+XWcB2oT7BNwRIC50zXeleKx8GwOlZrR4pv0ymY6yaT8GM
         EZ4jcx0hsR591pZ8siAydiqKUESe+J0Q1Yrdl+JU55XDEx1pOAd7hg4lik2lAIwCteHx
         MYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601157; x=1720205957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2CdkHHQeS6ZYq46bmamzaG4cQ0med+7M8+gsC9yLVs=;
        b=jyx1K67Z6n7HZNe/LEFkehmL14oOdMabF8/TjfbswrbVxM2gn23c4Klz1PbARpxcnM
         toeQLybvrhAgbSejFIISMeFGXym15IyGk8WWQyQ6sXWnwIGN6fDQ0TPDLSBof2O/JVB4
         +8jgFQooAdAENosdn10SplgDEXtInfByppnqk3OMr9RnGWP5A1lFYsD+dj0C+p4glrPK
         YY0ibAJPaVP6LEz3cfxo02qZnnWNs7ailetIqHAJJNjEhuSRwn+C66QknaIgE4+iuexh
         S2Nz8YBG9brXFQQS5LF3gkv2d5lWgV3yhp+fKmRBe9gSuXYDALWaIrcthw3OMxT8M2nR
         R/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXbqHG1zE2BXY64Fbk3hN5ZOEHwy68JNH85Wd8R8MYgav7XUdBd4WemYzE5hNVDNwJquBIL0AQKclBKJj3Su+QtnetIzb5CPQwwIQ==
X-Gm-Message-State: AOJu0YxmvOre0itb4kOcuIYMmAjlbNH0JROW9sgJp2neXNJ2czJSHmbh
	SsO+CLwAsuVN8fb3EmJ8fysv8PyLoNcSWm5fvenVpd/HyhZ7ALQ2cWXRUTdh5RA=
X-Google-Smtp-Source: AGHT+IEkK4rEVPrUrZKXpL2PMEui61nkovWZxgm/omQV9yk2FvliBNy5ckAVj99IbWDKVM9W5O+2RA==
X-Received: by 2002:a05:6000:188e:b0:366:e801:3177 with SMTP id ffacd0b85a97d-366e80132a3mr17070042f8f.13.1719601157152;
        Fri, 28 Jun 2024 11:59:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:35 +0200
Subject: [PATCH RESEND libgpiod v2 16/18] dbus: client: add tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-16-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=42036;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HkAZpzesD/wMvEc/rNs8rEQZR8hl9zXJWhnmtXOPr1I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfuUhVkJJptkCWkiFJY2WpMTQBRL55r2vT5H
 +99Tp8sBH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7gAKCRARpy6gFHHX
 cmBUEAC8F1ozIj/yQhmgiqPwGHduhFG7SpzQwZi1iFr/3b+HWEXCC8z338jgUlGHD6OB56oBt0H
 t0yrFY8sWGQBIi5MGcGCCKv8Lv5i02rz3Pl4+7xm0bmTZJPl8iKp6EeuPjn1VEiGXPEjtQE4BqD
 bR7suAs+4L61s2GXMvLlURyyDcANmV+RMG9N4Vv8wgH912LWfjOtS01WWG4HNk4ZZg56+psmQls
 B75k+ueYS1YwPSBCHp1ac18F9CVJoAyyXkbae6ePO1ehVn+POrbky1DexyCzb329go4SeE1feb+
 lRyV7gKnQNRywNCjnBZ6+IrSCiQtj+bdsGMkDtiyayXBxASjrz10foi810vhjjL28t7m8nQ3Z/V
 fG3ybughPi8xzzOHRWEQKPL7OuIzoiS2WcPViemUXKereEs2V6o+D1snCF/B5KsBtC1dQrDiU4R
 wgPaT8w9+Wedeoo2ZrUxViMMAj/u59Znt5kE/6a//o50RVjsP6Bfxgcivy79499sIh2FrnBnMAx
 LhHVjC9/OzjAksfnVWeIy2jIJ1oDtzDBHovpZVVuOHRi/cCSBD9P50bmKzo+y+z88ZbVXZ5wAnK
 AfIXZXjXQtDHoV+cTt2BbbKX5oX7EYhgYt/I8PEqqIXo095w5RnwIVWq4B3f9qMUjUX94oFSaZc
 zhElqMBLZDOfAAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a set of bash tests of the command-line DBus client.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/gpiocli-test.bash | 1443 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1443 insertions(+)

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
new file mode 100755
index 0000000..f210183
--- /dev/null
+++ b/dbus/client/gpiocli-test.bash
@@ -0,0 +1,1443 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#
+# Test cases for gpiocli utility. This test-suite assumes that gpio-manager
+# is already running.
+#
+
+SOURCE_DIR="$(dirname "${BASH_SOURCE[0]}")"
+
+wait_for_sim() {
+	COUNTER=100
+
+	while true
+	do
+		gdbus call --system --dest io.gpiod1 \
+			--object-path /io/gpiod1/chips/"$1" \
+			--method org.freedesktop.DBus.Peer.Ping > /dev/null 2>&1 && break
+		sleep 0.01
+		COUNTER=$($COUNTER - 1)
+		if [ "$COUNTER" -eq 0 ]
+		then
+			fail "error waiting for the GPIO sim chip to be exported on the bus"
+			return 1
+		fi
+	done
+}
+
+# Create a simulated GPIO chip and wait until it's exported by the gpio-manager.
+gpiosim_chip_dbus() {
+	gpiosim_chip "$@"
+	wait_for_sim "${GPIOSIM_CHIP_NAME[$1]}"
+}
+
+gpiodbus_release_request() {
+	run_prog gpiocli release "$1"
+	status_is 0
+}
+
+gpiodbus_check_request() {
+	run_prog gpiocli requests
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$1"
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
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
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
+	run_prog gpiocli detect "$sim0"
+
+	status_is 0
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	num_lines_is 1
+
+	# by number
+	run_prog gpiocli detect "$(gpiosim_chip_number sim2)"
+
+	status_is 0
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
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
+	run_prog gpiocli detect "$sim0" "$sim1" "$sim2"
+
+	status_is 0
+	output_regex_match "$sim0 \[${sim0dev}[-:]node0\] \(4 lines\)"
+	output_regex_match "$sim1 \[${sim1dev}[-:]node0\] \(8 lines\)"
+	output_regex_match "$sim2 \[${sim2dev}[-:]node0\] \(16 lines\)"
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
+	run_prog gpiocli info -c "$sim1"
+
+	status_is 0
+	output_contains_line "$sim1 - 8 lines:"
+	output_regex_match "\\s+line\\s+2:\\s+unnamed\\s+\[input\]"
+	num_lines_is 9
+
+	# by number
+	run_prog gpiocli info -c "$(gpiosim_chip_number sim1)"
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
+	run_prog gpiocli info -c "$sim0" 3
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
+	run_prog gpiocli info -c "$sim0" 3 bar
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
+	gpiodbus_release_request "$request"
+}
+
+test_request_one_line_by_chip_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --chip="$sim0" 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[4\]"
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli request --input --chip="$sim0" 0
+	status_is 0
+	num_lines_is 1
+	local request0=$output
+
+	run_prog gpiocli request --output --chip="$sim0" 1 2
+	status_is 0
+	num_lines_is 1
+	local request1=$output
+
+	run_prog gpiocli request --chip="$sim0" 5
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
+	gpiodbus_release_request "$request"0
+	gpiodbus_release_request "$request"1
+	gpiodbus_release_request "$request"2
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
+	gpiodbus_release_request "$request"
+}
+
+test_request_multiple_lines_by_chip_number_by_name_and_offset() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input -c "$(gpiosim_chip_number sim0)" xyz 0 foo 15
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	gpiodbus_check_request "$request\\s+\(${GPIOSIM_CHIP_NAME[sim0]}\)\\s+Offsets:\\s+\[11, 0, 1, 15\]"
+	gpiodbus_release_request "$request"
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
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foobar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request "$request"
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
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"foo bar\",managed=\"request0\",input\]"
+
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get -r "$request"
+	status_is 0
+	num_lines_is 1
+	output_regex_match "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli reconfigure --input "$request"
+	status_is 0
+	num_lines_is 1
+
+	run_prog gpiocli info foo
+	status_is 0
+	num_lines_is 1
+	output_regex_match "$sim0\\s+1:\\s+\"foo\"\\s+\[used,consumer=\"gpio-manager\",managed=\"$request\",input\]"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli reconfigure --output "$request" 1 0 active
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
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli reconfigure --output "$request" 1 0
+	status_is 1
+	num_lines_is 3
+	output_regex_match ".*: The number of output values must correspond to the number of lines in the request"
+
+	run_prog gpiocli reconfigure --output "$request" 1 0 1 0
+	status_is 1
+	num_lines_is 3
+
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request" 1
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request" 11 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"11\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=active \"1\"=active \"5\"=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=inactive \"11\"=active"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --unquoted --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "xyz=active 1=active 5=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --numeric --request="$request" xyz 1 5
+	status_is 0
+	num_lines_is 1
+	output_is "\"xyz\"=1 \"1\"=1 \"5\"=0"
+
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set bar=active foo=active xyz=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=active \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set -r "$request" 5=1
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=inactive"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request="$request" 11=active 5=1 1=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=inactive \"11\"=inactive"
+
+	run_prog gpiocli set --request="$request" xyz=active 5=1 foo=0
+	status_is 0
+
+	run_prog gpiocli get --request="$request"
+	status_is 0
+	num_lines_is 1
+	output_is "\"1\"=inactive \"5\"=active \"11\"=active"
+
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	dut_run gpiocli notify --chip="$sim0" 5
+	dut_read
+
+	output_is "$sim0 - 5 (\"bar\"): [output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"]"
+
+	gpiodbus_release_request "$request"
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
+	dut_run gpiocli notify --chip="$sim0" 5 foo 11
+
+	dut_read
+	output_regex_match ".*$sim0 - 5 \(\"bar\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 1 \(\"foo\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+	output_regex_match ".*$sim0 - 11 \(\"xyz\"\): \[output,used,consumer=\"gpio-manager\",open-drain,active-low,managed,request=\"request0\"\].*"
+
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	run_prog gpiocli reconfigure --input --pull-up --rising-edge "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	gpiodbus_release_request "$request"
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
+	dut_run gpiocli monitor --request="$request" 1
+
+	gpiosim_set_pull sim0 1 pull-up
+
+	dut_read
+	output_regex_match "[0-9]+ rising\\s+\"foo\""
+
+	gpiodbus_release_request "$request"
+}
+
+test_monitor_all_lines_on_request() {
+	gpiosim_chip_dbus sim0 num_lines=16 line_name=1:foo line_name=5:bar line_name=11:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiocli request --input --both-edges --chip="$sim0" foo bar xyz 4
+	status_is 0
+	num_lines_is 1
+	local request=$output
+
+	dut_run gpiocli monitor -r "$request"
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
+	gpiodbus_release_request "$request"
+}
+
+# shellcheck source=tests/scripts/gpiod-bash-test-helper.inc
+source gpiod-bash-test-helper.inc
+
+check_prog gdbus
+
+# shellcheck source=/dev/null
+source shunit2

-- 
2.43.0


