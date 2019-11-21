Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4791047A0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfKUAgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:40 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43416 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:40 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so604036pju.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2pAz6eMeJITc9sbIWBHWbXUDXwONZa8aHcBLP/Zicyk=;
        b=Y6ljofZ/JC54aKWq7o7JMuwO170LMBeIeSmztcf5+A3rZi4bKWJApP1iK0+wMmXVVc
         2sAdSob12AUUwxuHsMYSpx6PTpJYX0jZc46J2u7vILmv1txBDJaiOqiUAlwX/cmGV8um
         IUoGwygZWMhCOfuU1e7Bn3qYA56R9daQOEXXunzcBo6I2Hh1KkZ85ELFDZMenajIwORy
         TyIUUc4rBJ5njCujG0uBVqwo6SBWUrzctJtiMBStGJHjStOPu6+V/TNpRFal385WmoFQ
         10O7ZDxjw1zaZb31aooaa9HYFkzdOe8/Gi/SE04Qrp5UAVcI04IzltK/0rMTWMrrHk5+
         FRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2pAz6eMeJITc9sbIWBHWbXUDXwONZa8aHcBLP/Zicyk=;
        b=XZB/kIc4vczUh4SG4oM9wChFzL27pDZGMEs8+PtDdSiI7AuuAdK0VrV3i4lsavwxsj
         IGkbBs3NY++sTVA9IG9LG1aRILqAkCaSZpE0S1WqJ36wo88WsFeJbPywn2mUG1uUsu3X
         8CADgKUP40BtvAw/RcYNp+CXN8G4OUaYMiKCf0n+iPD9ZpZKZ4lnlUDABE9BgQ1pVVXr
         mczoa53YjhbWzOfiwujnD0vlK2PHkkupitNbra/bxHuJaptGF7brMeWwKnRADJb2Amo1
         Eg6i400K3pkUMBWIqggWREUOLxtZ3v+eW3NqLGmy8cLBqHNvifEsyfcmFcuui0BAJTbR
         8IyA==
X-Gm-Message-State: APjAAAXOxXz2wqnN7lhwpgns6P2majw7KKfFm0Xmzira1UWxn5MfKY+n
        0uFL6EBAv/BSzWGPefv+V4P1ycuDh20=
X-Google-Smtp-Source: APXvYqw0dicO135Ri9WPUvh1m8aZuz4U/rKdwFgALq0Mw+pp/sdPflfiL+INubiZft26yZucTuouqw==
X-Received: by 2002:a17:90a:b385:: with SMTP id e5mr7734388pjr.115.1574296597904;
        Wed, 20 Nov 2019 16:36:37 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:37 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 08/14] tests: add tests for SET_CONFIG
Date:   Thu, 21 Nov 2019 08:35:50 +0800
Message-Id: <20191121003556.9020-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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
index b453dad..251904c 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -267,6 +267,7 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_value(line, 1);
 	g_assert_cmpint(ret, ==, 0);
@@ -329,6 +330,351 @@ GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
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
@@ -443,10 +789,11 @@ GPIOD_TEST_CASE(direction, 0, { 8 })
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
+	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
 
 	gpiod_line_release(line);
 
@@ -484,6 +831,27 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 
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

