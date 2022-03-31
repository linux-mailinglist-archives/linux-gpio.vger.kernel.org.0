Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD844ED13B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 03:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352235AbiCaBOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 21:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352244AbiCaBOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 21:14:00 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D67466600
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:13 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id a16so5126056plh.13
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zGj/WGDVyhyJE2QGKE7k5onT9lcIVUucYPJ4LgmEC74=;
        b=MmZ2ffWylJ6/vndlcW68jlGi9pnjwkpDkhAEJy23RSwVvWj6zF7ZI23Qxz0uIWcHZ8
         Tdx6zvYqGo3vUL8sMctymRTmQklXzJZkLOW9HSvmW4YqGVrE7DlkMqCQOzi2kg6xM1zf
         jd6MBsRp1Jwhrfy7S6GvempPrPoWLWq/DWus+2/rDMPKvhJhemPMOjeSjf2CsxjfWjP0
         gAX9bZnjlu5uC9gEljmYr5reTGZjDpIk5h31qnd/POydlGil426iQqbstlgaSjI9jjnn
         r1BXxcHO9KE8z1vtM88ACP6eVmQ/tsmdKtiks/R1kZyI7nrKpky2ErKxLt95eKuT7CIC
         Q6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zGj/WGDVyhyJE2QGKE7k5onT9lcIVUucYPJ4LgmEC74=;
        b=Q9oS65PuOUPJ/e85X0dqMMxzzfnOm/MhCTxD3tYcy4UxtQV9joHmJ2oYH+Wx/u8raD
         vUz8vksQ1jxjfMiwu4ELj/TYkprVc4RmtlI3hrVHtBIj5Il6uad4zzddTDJ7/4MyxBH5
         ZCIKPLX719m30zpkrFZS3d3YOuE10PBTFGNCc3Mti6Krl/MvGLaQsT/zHQiXLQn5T0ha
         FpaWC5V2I5LghrUBGoQM5NLkUtqCZy05bjT3aRhFJVkU9v6hRhLZNVaJn7ExhSthxnoB
         jFwWzkv42RjeKgGv9ZNpF9SdxysjUorQYUe89z24qNjSqxXB89munhNP0wQ2Ayxmgg3e
         2JWg==
X-Gm-Message-State: AOAM530gSveAtrbOi6CM1NBOVM35uQ10oKkun00aps4hXWJeOVsjTRPm
        0pGrTtPxBF84aS90lONapz/VADSnWWidLg==
X-Google-Smtp-Source: ABdhPJzSf6CAOt3uyE57ZIP90PBERDhwDgWpCc7L9qa1+cbyH7lSU0kd1ZBJoignifQYuAGTUwmtFQ==
X-Received: by 2002:a17:90b:4ac9:b0:1c9:a345:6b9a with SMTP id mh9-20020a17090b4ac900b001c9a3456b9amr3008465pjb.118.1648689132773;
        Wed, 30 Mar 2022 18:12:12 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e6-20020a63aa06000000b00380c8bed5a6sm21232176pgf.46.2022.03.30.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:12:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 1/4] core: add gpiod_request_lines
Date:   Thu, 31 Mar 2022 09:11:38 +0800
Message-Id: <20220331011141.53489-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331011141.53489-1-warthog618@gmail.com>
References: <20220331011141.53489-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a wrapper around gpiod_chip_open() and gpiod_chip_request_lines()
for the common use case of only requesting a single set of lines from a
chip.  The chip itself is only required for the request so hide it from
the user.

Signed-off-by: Kent Gibson<warthog618@gmail.com>
---
 include/gpiod.h            | 15 ++++++++
 lib/line-request.c         | 17 +++++++++
 tests/tests-line-request.c | 73 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/include/gpiod.h b/include/gpiod.h
index 456c2b8..8f64d7f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -50,6 +50,21 @@ struct gpiod_info_event;
 struct gpiod_edge_event;
 struct gpiod_edge_event_buffer;
 
+/**
+ * @brief Request a set of lines for exclusive usage.
+ * @param path GPIO chip path.
+ * @param req_cfg Request config object.
+ * @param line_cfg Line config object.
+ * @return New line request object or NULL if an error occurred. The request
+ *	   must be released by the caller using ::gpiod_line_request_release.
+ * @note Line configuration overrides for lines that are not requested are
+ *	 silently ignored.
+ */
+struct gpiod_line_request *
+gpiod_request_lines(const char *path,
+		    struct gpiod_request_config *req_cfg,
+		    struct gpiod_line_config *line_cfg);
+
 /**
  * @defgroup chips GPIO chips
  * @{
diff --git a/lib/line-request.c b/lib/line-request.c
index d578a9e..639a66f 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -16,6 +16,23 @@ struct gpiod_line_request {
 	int fd;
 };
 
+GPIOD_API struct gpiod_line_request *
+gpiod_request_lines(const char *path,
+		    struct gpiod_request_config *req_cfg,
+		    struct gpiod_line_config *line_cfg)
+{
+	struct gpiod_chip *chip;
+	struct gpiod_line_request *request;
+
+	chip = gpiod_chip_open(path);
+	if (chip == NULL)
+		return NULL;
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	gpiod_chip_close(chip);
+	return request;
+}
+
 struct gpiod_line_request *
 gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
 {
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 531e466..bf7ebb1 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -332,6 +332,79 @@ GPIOD_TEST_CASE(request_survives_parent_chip)
 	gpiod_test_return_if_failed();
 }
 
+GPIOD_TEST_CASE(request_chipless)
+{
+	static const guint offset = 0;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_value_default(line_cfg,
+						   GPIOD_LINE_VALUE_ACTIVE);
+
+	request = gpiod_request_lines(g_gpiosim_chip_get_dev_path(sim),
+				      req_cfg, line_cfg);
+	g_assert_nonnull(request);
+
+	g_assert_cmpint(gpiod_line_request_get_value(request, offset), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
+
+	ret = gpiod_line_request_set_value(request, offset,
+					   GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_set_value(request, offset,
+					   GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+}
+
+GPIOD_TEST_CASE(request_chipless_bad_device)
+{
+	static const guint offset = 0;
+
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_value_default(line_cfg,
+						   GPIOD_LINE_VALUE_ACTIVE);
+
+	request = gpiod_request_lines("/dev/nonexistent",
+				      req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(ENOENT);
+
+	request = gpiod_request_lines("/tmp",
+				      req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(ENOTTY);
+
+
+	request = gpiod_request_lines("/dev/null",
+				      req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(ENODEV);
+}
+
+
 GPIOD_TEST_CASE(request_with_overridden_direction)
 {
 	static const guint offsets[] = { 0, 1, 2, 3 };
-- 
2.35.1

