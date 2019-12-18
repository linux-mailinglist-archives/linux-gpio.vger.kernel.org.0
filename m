Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48759124977
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfLROZD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:03 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43217 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfLROZD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:03 -0500
Received: by mail-wr1-f67.google.com with SMTP id d16so2483347wre.10
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T4e3VqnVR5IGkHwG5iWMtvRfnS4WvrAeQwRG76cQcsg=;
        b=EP6LrJAHiG/9AwO9yhHtxnzUeVfAgo0rOiP4ipb1SFnJrHDKJVnuxIyuAOrgORZ3/B
         DJp4ozaL6JSUGC04lpTbxquNvo3xRWtfUo05qx0nUDw2hu/zi5sjb+e8IkzH9FvXcWH/
         mrsM1L9YasNvn4ynAtZm3WRzJXe4vFJv0lcttPyOONt1YmOJMnrDjRsYeBGj/yrnWOnJ
         WC5nXD3EQNBzLvlpjU/qDxFWahR971Fp9wm5sEunR0S+8Yqf+PYqsWAPllytx+3sEZUh
         7R4eq620n23+8jlkFrkVAlw6/OYah/j6d1PALBlxYnLzKFp4RacDqKKUEzjRuaU5bsD6
         FLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T4e3VqnVR5IGkHwG5iWMtvRfnS4WvrAeQwRG76cQcsg=;
        b=GO3U+wz7VAEIhZziQMkzGQJfTujh4PoKiV7EKFY8KtzhhyhwlwAKRuVNkE/0w9ZdKb
         IC7PCkTYkCzYADeFj6A0jkRQwCUYRwz4tlahxLBNkrQwJTIhCf2K2idHfFP1mM5GkOo8
         a9Lhso8uZJrsEzuI7JU3EdOU3Zf9jsEBsFa7DaAAW7d0k+ewVcKWjkepxhn8PIUkxqBF
         eaKwOeBiHafp7VuIU75uo1ADyf0v2FFEcPabUxTyN483Xxfmv87wEXMCdSt+dh6ld8l8
         GKqZab2ZmL1GuTfR34EbbUghw6tuKcvQFit3zJ+WDKdwsBTa7W3tjPI5TnB7y2LREOvF
         gyzg==
X-Gm-Message-State: APjAAAUj9ppNWrXOdp9Jj+27JroiRtFkjXtnaQOPQrA5CswcBI7KzF0g
        NTwBSlz4Vlz/9YFyeYjfkce3qw==
X-Google-Smtp-Source: APXvYqwJtHYAw3FW4G85dSRRdDWYTD7RT4mqWsjd13bBzWn6E47aaLWlGAf4+URhyJJ7fvBiKPgQ6Q==
X-Received: by 2002:a05:6000:1248:: with SMTP id j8mr3123771wrx.44.1576679101544;
        Wed, 18 Dec 2019 06:25:01 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 3/7] tests: event: extend test coverage for reading multiple line events at once
Date:   Wed, 18 Dec 2019 15:24:45 +0100
Message-Id: <20191218142449.10957-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add test cases for new helpers allowing users to read multiple events
at once.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tests/tests-event.c | 83 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index d425d1a..1f4a2eb 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -552,3 +552,86 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 }
+
+GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_event events[3];
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line *line;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 4);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 0);
+
+	gpiod_test_chip_set_pull(0, 4, 1);
+	usleep(10000);
+	gpiod_test_chip_set_pull(0, 4, 0);
+	usleep(10000);
+	gpiod_test_chip_set_pull(0, 4, 1);
+	usleep(10000);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	ret = gpiod_line_event_read_multiple(line, events, 3);
+	g_assert_cmpint(ret, ==, 3);
+
+	g_assert_cmpint(events[0].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(events[1].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[2].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+}
+
+GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_event events[3];
+	struct timespec ts = { 1, 0 };
+	struct gpiod_line *line;
+	gint ret, fd;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 4);
+	g_assert_nonnull(line);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 0);
+
+	gpiod_test_chip_set_pull(0, 4, 1);
+	usleep(10000);
+	gpiod_test_chip_set_pull(0, 4, 0);
+	usleep(10000);
+	gpiod_test_chip_set_pull(0, 4, 1);
+	usleep(10000);
+
+	ret = gpiod_line_event_wait(line, &ts);
+	g_assert_cmpint(ret, ==, 1);
+
+	fd = gpiod_line_event_get_fd(line);
+	g_assert_cmpint(fd, >=, 0);
+
+	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
+	g_assert_cmpint(ret, ==, 3);
+
+	g_assert_cmpint(events[0].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(events[1].event_type, ==,
+			GPIOD_LINE_EVENT_FALLING_EDGE);
+	g_assert_cmpint(events[2].event_type, ==,
+			GPIOD_LINE_EVENT_RISING_EDGE);
+}
-- 
2.23.0

