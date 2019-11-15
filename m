Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF7DFE069
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfKOOp0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:26 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45972 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:26 -0500
Received: by mail-pl1-f196.google.com with SMTP id w7so4791401plz.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bfofL+PiRWgUcw39HkEVa/wtJpUahJncO0e6xxYnPIQ=;
        b=YjFc3Jg32GQPpYmcifYFqg9i3ISf9OjGt4+ezZdS2/tnjUyklxqhLxxs5ee6r4U8Br
         gNpYJDFtAqZQsLzXihlUOjQ/LSshwMOqniTU3F4te19eFf1STwLFsDb+ffFzOQJ9CWVm
         pdMfTEb30pyd/XTwvTvMU/OMzWNpUxhAUgMTPT785ptnPiGe+KfreimRXQ4NxHajmDhk
         3UUBsMPN2gm3qJMRkIUy4Ivv3/OHQCgRjU7lJ3x6gpetEQiqn4NCGt2ICSQrjbtyL2/Z
         u3ywctaKoYMbvY4btVentwRNtA1xrRywiOZ/meU0yMW5Vbx3moMrWj7xUwolunzslOwc
         u8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfofL+PiRWgUcw39HkEVa/wtJpUahJncO0e6xxYnPIQ=;
        b=WJ69vjlwAOHcGUeZ9U8LYSS4cXEBe4eCPtuditOM/ajkcnlDLic3/8IejAriK1qcOg
         QTwoOGEJoxXfAsLlWGGffcHSNmh/NoOIuldaSqAIQt9Zia9YwwVGMnizhg7M4542Qo/U
         a012iLAbrJTa6ige/YQtyu3TRNTgbTVj5zIA9j9jfv6qwn00L2qDTcG5RCDb8RTHGp8u
         KFz3gWJHaIA0xMv/Vkt3Tdqu0Cq47hrF6EzI52g4/2A/9EZBDh95TAndEti5Cj91a5PW
         0XZeRr6xQJB0ATZS+wXhQnCPh5DOnRb1xiA+Xs3e7RaASt1fMjMsWB2hcJmZwTXweug0
         5XQQ==
X-Gm-Message-State: APjAAAU5oEb2qqaDE7AMZKkUuuyUdvgJMHWsKKUkABAPwpD/sV0pz3fM
        wnsOa9AI9+omcTdHNr+L/9U3Sl9MwCc=
X-Google-Smtp-Source: APXvYqwkCMqd9/iyEOgmlY+2H/71VYZiBx0n8n30N417N+mZP7dw8O+NQnO2iFREb/ZwtQSFR6DmUQ==
X-Received: by 2002:a17:902:b582:: with SMTP id a2mr15615123pls.103.1573829125479;
        Fri, 15 Nov 2019 06:45:25 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:25 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 13/19] core: allow gpiod_line_set_value_bulk to accept null values
Date:   Fri, 15 Nov 2019 22:43:49 +0800
Message-Id: <20191115144355.975-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change gpiod_line_set_value_bulk to interpret a NULL values pointer as an
array of zero, as per gpiod_line_request_bulk, gpiod_line_set_config_bulk,
and gpiod_line_set_direction_bulk_output.

The old behaviour was to segfault.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/core.c         |  5 +++--
 tests/tests-line.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index c42cda5..2e54def 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -805,8 +805,9 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 
 	memset(&data, 0, sizeof(data));
 
-	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-		data.values[i] = (uint8_t)!!values[i];
+	if (values)
+		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
+			data.values[i] = (uint8_t)!!values[i];
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 	fd = line_get_fd(line);
diff --git a/tests/tests-line.c b/tests/tests-line.c
index e74f90f..7d45603 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -277,6 +277,59 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 }
 
+GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
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
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
+
+	values[0] = 2;
+	values[1] = 1;
+	values[2] = 0;
+
+	ret = gpiod_line_set_value_bulk(&bulk, values);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+
+	ret = gpiod_line_set_value_bulk(&bulk, NULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
+	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
+}
+
 GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-- 
2.24.0

