Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDBDFE067
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfKOOpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:23 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34352 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:23 -0500
Received: by mail-pl1-f193.google.com with SMTP id h13so4821996plr.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dKqw8AqnZ4FydRAWSePLwNJGTiQsNXmFDlHLyyMMgLc=;
        b=MzBKtwR9R815dUOK4WK0FH3rn9NEgUpiLbiZQxmY0joFlbfkIQUcu4X+IEXhV9Km+Y
         1p/sMtONzY3ZW4SyI7bDjNpCIErqUAmkGhifrlLNqwxgbHgQUKJ2HBljZajcwmdTv4ig
         IK2EoqJy8OiD3S4M1yMXXsAoaY0TqyoQCz6cgE6YnClrf/Bu8RihXIKZNMeaiJ2NIDSx
         vnSRvQnwUoL+GClGOlOnhc52NFXCbzWkcf67rJ9xGmT/nbQHYb9Jb1sbsTESW4bcYjX3
         ApmdNTRaByV3BYPZhO8yAGm3MKzPkrGD5pcs5KGc1LvPb78k374DkPhu2e94HOII/DTt
         Ij6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKqw8AqnZ4FydRAWSePLwNJGTiQsNXmFDlHLyyMMgLc=;
        b=d/jtT/QoBsLgGlQ2wtkUMGCfQuh7klvFOxcfxr9ihg05edM5yVBlVsx7/oNBz7PfRR
         cfxVLOYU9Fn3vQq2ZO+4rYzlKNxngZKkSBJ2+P5o0XILgmaiWPRoxgjnqFkzVDLJTGX/
         ABDWl/suItOg9IjunDOY5mEss4JtIvbqf48I8srhNIAvrHTXhVFfgFNh7wQ9IB+0emqC
         R+qKM+qQ9fPOTcm/Sw5AynF/FXf3AXzQfkys5Af+q/hUryPEvav3nu/aHFlZ/7wVoLJ6
         bzxCczl/2N8Pn9XflJMPsf0Qn1OgazpzmVirnj+YbdnR6YP+cJkShmOGNgARCz+Hb/uo
         0ctA==
X-Gm-Message-State: APjAAAW7I5cItXOJ+RVhduKl/nu4ZumnMM7/icKePejP/1/9IhdceVHd
        8riZYzNnLiwZTSjMe2PrcIj/LyT47LU=
X-Google-Smtp-Source: APXvYqxnAZo28UNF2yl6mOdhbBZQdVH9iMvnupyrL1i9uZmqPtNcuFgbkF2pkbuCjxdaqyxl4YSmtQ==
X-Received: by 2002:a17:90a:2385:: with SMTP id g5mr20271571pje.117.1573829121403;
        Fri, 15 Nov 2019 06:45:21 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:20 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 12/19] tests: add tests for SET_CONFIG
Date:   Fri, 15 Nov 2019 22:43:48 +0800
Message-Id: <20191115144355.975-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over the SET_CONFIG functions.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/tests-line.c | 371 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 370 insertions(+), 1 deletion(-)

diff --git a/tests/tests-line.c b/tests/tests-line.c
index b4bef1a..e74f90f 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -267,6 +267,7 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_value(line, 1);
 	g_assert_cmpint(ret, ==, 0);
@@ -276,6 +277,352 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
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
+	ret = gpiod_line_set_direction_bulk_input(&bulk);
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
+	ret = gpiod_line_set_direction_bulk_output(&bulk, values);
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
+	ret = gpiod_line_set_direction_bulk_output(&bulk, NULL);
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
+	// check cached by request...
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	// ...by checking cached value applied by set_flags
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	// check cached by set_value
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
+	// check cached by set_config
+	ret = gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
+				    0, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_flags(line, 0);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	// check cached by set_value_bulk default
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
+
 GPIOD_TEST_CASE(get_value_different_chips, 0, { 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chipA = NULL;
@@ -390,10 +737,11 @@ GPIOD_TEST_CASE(direction, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
 
 	gpiod_line_release(line);
 
@@ -431,6 +779,27 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 
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

