Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596D210900C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbfKYOdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:01 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43423 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:00 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so6683234pju.10
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mG768MWmqjKNRckkf2HeDPNccDhDcXV8ey4go2iJ3xg=;
        b=SgOMUTW/HlSrToMaSGzNUKSO3UFLbgqbjPR0/IvlFNR73XrYa4fgd1DCSAheUvxNAk
         ZhIYvBbKqvFh4btg6mT1a06kqHIlZjmZ3beCmsXYRAJ6fqGOn5It7J/9cfsWLD+wODSe
         I2F2WOLsXN7cNX0sR2kOipfncneRbf7CteOJ5KotRdDA7DUPlXTi8ODG02T83ovk/yEB
         b4tQGeUAbTileUKidz0/t4LhoWztzTk4utmBU44rSCKyCybCxSTA4MJRoDRrNx8mKA8b
         eah6EeDR+vFKEJX8aRfwI5+q1gKAQjxyUJqNGX8cWq6+n26IH+C/fvQeUykd6mQe+uQj
         9p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mG768MWmqjKNRckkf2HeDPNccDhDcXV8ey4go2iJ3xg=;
        b=TMK8bWoXfo8MXU+S7hr3DJKjw4Xr1L0pUN8Th1q+XTGYp8GlB1rPo5jA6RBrZReKel
         IIbccAdhHnr4PZHWgZoI0czLuiLQkajt6NGxB7yEGV9b+WrrS2J9kT7RffLvlXZJWm1Y
         MIw9ImdpmKcrF68ANFCpufZLQbnrgM1LlZgdp+7fQqKYO5Fi+dZnc+EyCD4SpXyfBqZs
         Qz3cPGAasz9w9FI/yXZb1JG81kSJKM4Ua9+4WHGRyFGjqKP5bUs9lhi3HfB7YEK/GHnP
         DrJBwoGUMPUA5Ui53LQubBOqQmjB61byqnbuU2dbHUphZLYyVbQrJe9xhyiHyQWRQrBe
         wrUQ==
X-Gm-Message-State: APjAAAX9Nh/E7Npn7+thWLVW/ooFYyFMfuuycwJKD7P9UM4YQYdBGYNv
        Q6oTiD0Dv83xcW0UPyWwPAyz5q9MhzSiVg==
X-Google-Smtp-Source: APXvYqxjfnPiZ10D+aXCyvXv4aECSr5C5+TWoHUYNViGkbuTkvZoTF8FFXIopC8mDFDrWARsdjmnUw==
X-Received: by 2002:a17:90a:1a52:: with SMTP id 18mr37747372pjl.26.1574692377788;
        Mon, 25 Nov 2019 06:32:57 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:57 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 08/14] tests: add tests for SET_CONFIG
Date:   Mon, 25 Nov 2019 22:31:51 +0800
Message-Id: <20191125143157.26154-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over the SET_CONFIG functions.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/tests-line.c | 370 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 369 insertions(+), 1 deletion(-)

diff --git a/tests/tests-line.c b/tests/tests-line.c
index 4bf7c02..97b7df9 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -265,6 +265,7 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_value(line, 1);
 	g_assert_cmpint(ret, ==, 0);
@@ -327,6 +328,351 @@ GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 }
 
+GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
+	struct gpiod_line *line0, *line1, *line2;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line0 = gpiod_chip_get_line(chip, 0);
+	line1 = gpiod_chip_get_line(chip, 1);
+	line2 = gpiod_chip_get_line(chip, 2);
+
+	g_assert_nonnull(line0);
+	g_assert_nonnull(line1);
+	g_assert_nonnull(line2);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add(&bulk, line0);
+	gpiod_line_bulk_add(&bulk, line1);
+	gpiod_line_bulk_add(&bulk, line2);
+
+	ret = gpiod_line_request_bulk_output(&bulk, GPIOD_TEST_CONSUMER, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line0), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_line_active_state(line1), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_line_active_state(line2), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_config_bulk(&bulk,
+			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, NULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line0), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_line_active_state(line1), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_line_active_state(line2), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	ret = gpiod_line_set_config_bulk(&bulk,
+			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, 0, NULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line0), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_line_active_state(line1), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_line_active_state(line2), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+}
+
+GPIOD_TEST_CASE(set_flags_active_state, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	ret = gpiod_line_set_flags(line, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line), ==,
+			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_active_state(line), ==,
+			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+}
+
+GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+
+	ret = gpiod_line_set_flags(line,
+		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_DISABLE);
+
+	ret = gpiod_line_set_flags(line,
+		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	ret = gpiod_line_set_flags(line,
+		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+}
+
+GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, false);
+	g_assert_cmpint(gpiod_line_is_open_source(line), ==, false);
+
+	ret = gpiod_line_set_flags(line,
+		GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, true);
+	g_assert_cmpint(gpiod_line_is_open_source(line), ==, false);
+
+	ret = gpiod_line_set_flags(line,
+		GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, false);
+	g_assert_cmpint(gpiod_line_is_open_source(line), ==, true);
+}
+
+GPIOD_TEST_CASE(set_direction, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_direction_input(line);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	ret = gpiod_line_set_direction_output(line, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+}
+
+GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
+	struct gpiod_line *line0, *line1, *line2;
+	int values[3];
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line0 = gpiod_chip_get_line(chip, 0);
+	line1 = gpiod_chip_get_line(chip, 1);
+	line2 = gpiod_chip_get_line(chip, 2);
+
+	g_assert_nonnull(line0);
+	g_assert_nonnull(line1);
+	g_assert_nonnull(line2);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add(&bulk, line0);
+	gpiod_line_bulk_add(&bulk, line1);
+	gpiod_line_bulk_add(&bulk, line2);
+
+	values[0] = 0;
+	values[1] = 1;
+	values[2] = 2;
+
+	ret = gpiod_line_request_bulk_output(&bulk,
+			GPIOD_TEST_CONSUMER, values);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line1), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line2), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	ret = gpiod_line_set_direction_input_bulk(&bulk);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line0), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_direction(line1), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_direction(line2), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	values[0] = 2;
+	values[1] = 1;
+	values[2] = 0;
+
+	ret = gpiod_line_set_direction_output_bulk(&bulk, values);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line1), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line2), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_direction_output_bulk(&bulk, NULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_direction(line0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line1), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_direction(line2), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+}
+
+GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	struct gpiod_line_bulk bulk;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	/* check cached by request... */
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	/* ...by checking cached value applied by set_flags */
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	/* check cached by set_value */
+	ret = gpiod_line_set_value(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_value(line, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	/* check cached by set_config */
+	ret = gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+				    0, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	/* check cached by set_value_bulk default */
+	ret = gpiod_line_set_value(line, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	gpiod_line_bulk_init(&bulk);
+	gpiod_line_bulk_add(&bulk, line);
+	ret = gpiod_line_set_value_bulk(&bulk, NULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+}
+
 GPIOD_TEST_CASE(get_value_different_chips, 0, { 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chipA = NULL;
@@ -441,10 +787,11 @@ GPIOD_TEST_CASE(direction, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
 
 	gpiod_line_release(line);
 
@@ -482,6 +829,27 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
+
+	gpiod_line_release(line);
+
+	ret = gpiod_line_request_output_flags(line, GPIOD_TEST_CONSUMER,
+			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, 0);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
+
+	gpiod_line_release(line);
+
+	ret = gpiod_line_request_output_flags(line,
+			GPIOD_TEST_CONSUMER, 0, 0);
+	g_assert_cmpint(ret, ==, 0);
+
+	g_assert_cmpint(gpiod_line_direction(line), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 0);
+
 }
 
 GPIOD_TEST_CASE(misc_flags, 0, { 8 })
-- 
2.24.0

