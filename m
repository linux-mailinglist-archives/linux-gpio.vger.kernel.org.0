Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F27C063D5CA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbiK3Mmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbiK3Mmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:49 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC0614093
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:40 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bx10so14815132wrb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuPZRbL6TujsIfJl4C3vqsa8W/NJBNpxtvK60FvX4Hg=;
        b=n5JvJKOepdnDFWmbLa7BXaO7zlX3ga5nr4dyY21mcc+7OtOUFhsvr4/LTphVRKb7d2
         fozRp2grlV3J3IplBsPu/ign1qAxokGwb9Ok/n7OQ3o6W/j7vT+XYtt11tXXmCVg+rmL
         K0PqVN6UVn69lL6behOZm8fkI7YSCljhF4P+IEmw7ONiuLuHUFDu/aJ8krSe0StpsPY2
         uwVey2T5m4ji+Q8iEuRJWTTKIqcb3qIAwi7j/71bm8WDA0GItKvDh+hePf3KKwDy86bQ
         CaTH8pkUHYGbpJuh0EqHcaQbn1hWCGZ09+Ufh0yNB88mM1ST3Eug7eeRMsL7fEYqdMH3
         htLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuPZRbL6TujsIfJl4C3vqsa8W/NJBNpxtvK60FvX4Hg=;
        b=jWEkVPeKlCBy1b+Uu5unGySHYC0KTmYQZXpq9tfm6YegNGOBmtR4TA2rd13zQBNHXc
         XI4FazHWDHQNac48QITqP6LG1zOVGqLhaxp8CQ8Yn8j8L7t5k+iiEQAOJN1bzA6iawLt
         QXet2tT8eCCJXQumrO6B0rA+6sApaEbxfx0g1IdDxLRMF3wmjm12TKTt5O/lz+005he+
         5QHnLp8mOqGGMFHWJZnuGLzaEFu+inpz7V9vZRBxo0MO4cAq70iTSogxQmf9obtRCEJm
         jU+KXDHPu7hoqUndZ1wH91AYvFeibbm/547LbG+Z/K/b4c76pVzcqkeT73WBUr0l8kjb
         8P3Q==
X-Gm-Message-State: ANoB5plCgbKXnSidgct+o7EqIlYOGl6kHVjxcWzCUIjme++NqVqJvxPo
        bodhhfOCwOw+bRVYK8tvyxZMwEXaqrXa/g==
X-Google-Smtp-Source: AA0mqf5qZHNVL+6q11wutEWbVS3hyeX3/WFmTRQQBdtG3+cWQpQ3+PWjVs+XleGkTwtbJm1LMadpiQ==
X-Received: by 2002:adf:eb05:0:b0:225:8c57:88d0 with SMTP id s5-20020adfeb05000000b002258c5788d0mr37633816wrn.625.1669812159484;
        Wed, 30 Nov 2022 04:42:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 05/11] gpiosim: rename HOG_DIR to DIRECTION
Date:   Wed, 30 Nov 2022 13:42:25 +0100
Message-Id: <20221130124231.1054001-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The enum itself should just define direction settings, it's the functions
that use it that should refer to hogging.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/gpiosim.cpp         | 12 ++++++------
 bindings/cxx/tests/gpiosim.hpp         |  4 ++--
 bindings/cxx/tests/tests-line-info.cpp |  2 +-
 bindings/python/tests/gpiosim/ext.c    |  6 +++---
 bindings/rust/gpiosim-sys/src/lib.rs   | 12 ++++++------
 tests/gpiod-test-helpers.h             |  2 +-
 tests/gpiod-test-sim.c                 | 12 ++++++------
 tests/gpiod-test-sim.h                 |  8 ++++----
 tests/gpiosim/gpiosim-selftest.c       |  2 +-
 tests/gpiosim/gpiosim.c                |  6 +++---
 tests/gpiosim/gpiosim.h                |  6 +++---
 tests/tests-line-info.c                |  4 ++--
 12 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index 281f9cc..a36c59e 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -17,10 +17,10 @@ const ::std::map<chip::pull, gpiosim_pull> pull_mapping = {
 	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
 };
 
-const ::std::map<chip_builder::hog_direction, gpiosim_direction> hog_dir_mapping = {
-	{ chip_builder::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
-	{ chip_builder::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
-	{ chip_builder::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
+const ::std::map<chip_builder::direction, gpiosim_direction> hog_dir_mapping = {
+	{ chip_builder::direction::INPUT,	GPIOSIM_DIRECTION_INPUT },
+	{ chip_builder::direction::OUTPUT_HIGH,	GPIOSIM_DIRECTION_OUTPUT_HIGH },
+	{ chip_builder::direction::OUTPUT_LOW,	GPIOSIM_DIRECTION_OUTPUT_LOW }
 };
 
 const ::std::map<gpiosim_value, chip::value> value_mapping = {
@@ -168,7 +168,7 @@ struct chip_builder::impl
 	::std::size_t num_lines;
 	::std::string label;
 	::std::map<unsigned int, ::std::string> line_names;
-	::std::map<unsigned int, ::std::pair<::std::string, hog_direction>> hogs;
+	::std::map<unsigned int, ::std::pair<::std::string, direction>> hogs;
 };
 
 chip_builder::chip_builder()
@@ -216,7 +216,7 @@ chip_builder& chip_builder::set_line_name(unsigned int offset, const ::std::stri
 	return *this;
 }
 
-chip_builder& chip_builder::set_hog(unsigned int offset, const ::std::string& name, hog_direction direction)
+chip_builder& chip_builder::set_hog(unsigned int offset, const ::std::string& name, direction direction)
 {
 	this->_m_priv->hogs[offset] = { name, direction };
 
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
index c9300ef..1dab191 100644
--- a/bindings/cxx/tests/gpiosim.hpp
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -51,7 +51,7 @@ private:
 class chip_builder
 {
 public:
-	enum class hog_direction {
+	enum class direction {
 		INPUT = 1,
 		OUTPUT_HIGH,
 		OUTPUT_LOW
@@ -68,7 +68,7 @@ public:
 	chip_builder& set_num_lines(::std::size_t num_lines);
 	chip_builder& set_label(const ::std::string& label);
 	chip_builder& set_line_name(unsigned int offset, const ::std::string& name);
-	chip_builder& set_hog(unsigned int offset, const ::std::string& name, hog_direction direction);
+	chip_builder& set_hog(unsigned int offset, const ::std::string& name, direction direction);
 
 	chip build();
 
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
index 1d8c293..21211f2 100644
--- a/bindings/cxx/tests/tests-line-info.cpp
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -9,7 +9,7 @@
 #include "gpiosim.hpp"
 
 using ::gpiosim::make_sim;
-using hog_dir = ::gpiosim::chip_builder::hog_direction;
+using hog_dir = ::gpiosim::chip_builder::direction;
 using direction = ::gpiod::line::direction;
 using edge = ::gpiod::line::edge;
 using bias = ::gpiod::line::bias;
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index 7846321..272e6f7 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -28,15 +28,15 @@ static const struct module_const module_constants[] = {
 	},
 	{
 		.name = "DIRECTION_INPUT",
-		.val = GPIOSIM_HOG_DIR_INPUT,
+		.val = GPIOSIM_DIRECTION_INPUT,
 	},
 	{
 		.name = "DIRECTION_OUTPUT_HIGH",
-		.val = GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+		.val = GPIOSIM_DIRECTION_OUTPUT_HIGH,
 	},
 	{
 		.name = "DIRECTION_OUTPUT_LOW",
-		.val = GPIOSIM_HOG_DIR_OUTPUT_LOW,
+		.val = GPIOSIM_DIRECTION_OUTPUT_LOW,
 	},
 	{ }
 };
diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index 420e015..55cc183 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -19,9 +19,9 @@ use crate::{
     gpiosim_value_GPIOSIM_VALUE_INACTIVE as GPIOSIM_VALUE_INACTIVE,
     gpiosim_value_GPIOSIM_VALUE_ACTIVE as GPIOSIM_VALUE_ACTIVE,	
     gpiosim_value_GPIOSIM_VALUE_ERROR as GPIOSIM_VALUE_ERROR,
-    gpiosim_direction_GPIOSIM_HOG_DIR_INPUT as GPIOSIM_HOG_DIR_INPUT,
-    gpiosim_direction_GPIOSIM_HOG_DIR_OUTPUT_HIGH as GPIOSIM_HOG_DIR_OUTPUT_HIGH,
-    gpiosim_direction_GPIOSIM_HOG_DIR_OUTPUT_LOW as GPIOSIM_HOG_DIR_OUTPUT_LOW,
+    gpiosim_direction_GPIOSIM_DIRECTION_INPUT as GPIOSIM_DIRECTION_INPUT,
+    gpiosim_direction_GPIOSIM_DIRECTION_OUTPUT_HIGH as GPIOSIM_DIRECTION_OUTPUT_HIGH,
+    gpiosim_direction_GPIOSIM_DIRECTION_OUTPUT_LOW as GPIOSIM_DIRECTION_OUTPUT_LOW,
     gpiosim_pull_GPIOSIM_PULL_UP as GPIOSIM_PULL_UP,
     gpiosim_pull_GPIOSIM_PULL_DOWN as GPIOSIM_PULL_DOWN,
 };
@@ -64,9 +64,9 @@ pub enum Direction {
 impl Direction {
     fn val(self) -> gpiosim_direction {
         match self {
-            Direction::Input => GPIOSIM_HOG_DIR_INPUT,
-            Direction::OutputHigh => GPIOSIM_HOG_DIR_OUTPUT_HIGH,
-            Direction::OutputLow => GPIOSIM_HOG_DIR_OUTPUT_LOW,
+            Direction::Input => GPIOSIM_DIRECTION_INPUT,
+            Direction::OutputHigh => GPIOSIM_DIRECTION_OUTPUT_HIGH,
+            Direction::OutputLow => GPIOSIM_DIRECTION_OUTPUT_LOW,
         }
     }
 }
diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index c3363bf..60c60b1 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -164,7 +164,7 @@ struct gpiod_test_line_name {
 struct gpiod_test_hog {
 	guint offset;
 	const gchar *name;
-	GPIOSimHogDir direction;
+	GPIOSimDirection direction;
 };
 
 GVariant *
diff --git a/tests/gpiod-test-sim.c b/tests/gpiod-test-sim.c
index fe9f822..9029382 100644
--- a/tests/gpiod-test-sim.c
+++ b/tests/gpiod-test-sim.c
@@ -127,14 +127,14 @@ static void g_gpiosim_chip_set_property(GObject *obj, guint prop_id,
 		while (g_variant_iter_loop(iter, "(usi)",
 					   &offset, &name, &vdir)) {
 			switch (vdir) {
-			case G_GPIOSIM_HOG_DIR_INPUT:
-				dir = GPIOSIM_HOG_DIR_INPUT;
+			case G_GPIOSIM_DIRECTION_INPUT:
+				dir = GPIOSIM_DIRECTION_INPUT;
 				break;
-			case G_GPIOSIM_HOG_DIR_OUTPUT_HIGH:
-				dir = GPIOSIM_HOG_DIR_OUTPUT_HIGH;
+			case G_GPIOSIM_DIRECTION_OUTPUT_HIGH:
+				dir = GPIOSIM_DIRECTION_OUTPUT_HIGH;
 				break;
-			case G_GPIOSIM_HOG_DIR_OUTPUT_LOW:
-				dir = GPIOSIM_HOG_DIR_OUTPUT_LOW;
+			case G_GPIOSIM_DIRECTION_OUTPUT_LOW:
+				dir = GPIOSIM_DIRECTION_OUTPUT_LOW;
 				break;
 			default:
 				g_error("Invalid hog direction value: %d",
diff --git a/tests/gpiod-test-sim.h b/tests/gpiod-test-sim.h
index 0cc2a0b..3012d49 100644
--- a/tests/gpiod-test-sim.h
+++ b/tests/gpiod-test-sim.h
@@ -15,10 +15,10 @@ typedef enum {
 } GPIOSimPull;
 
 typedef enum {
-	G_GPIOSIM_HOG_DIR_INPUT = 1,
-	G_GPIOSIM_HOG_DIR_OUTPUT_HIGH,
-	G_GPIOSIM_HOG_DIR_OUTPUT_LOW,
-} GPIOSimHogDir;
+	G_GPIOSIM_DIRECTION_INPUT = 1,
+	G_GPIOSIM_DIRECTION_OUTPUT_HIGH,
+	G_GPIOSIM_DIRECTION_OUTPUT_LOW,
+} GPIOSimDirection;
 
 typedef struct _GPIOSimChip GPIOSimChip;
 
diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
index b970755..ce6beee 100644
--- a/tests/gpiosim/gpiosim-selftest.c
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -92,7 +92,7 @@ int main(int argc UNUSED, char **argv UNUSED)
 	printf("Hog a line on bank #2\n");
 
 	ret = gpiosim_bank_hog_line(bank1, 3, "xyz",
-				    GPIOSIM_HOG_DIR_OUTPUT_HIGH);
+				    GPIOSIM_DIRECTION_OUTPUT_HIGH);
 	if (ret) {
 		perror("Unable to hog a line");
 		return EXIT_FAILURE;
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 9e6c635..881ecc8 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -1010,13 +1010,13 @@ GPIOSIM_API int gpiosim_bank_hog_line(struct gpiosim_bank *bank,
 	int ret, fd;
 
 	switch (direction) {
-	case GPIOSIM_HOG_DIR_INPUT:
+	case GPIOSIM_DIRECTION_INPUT:
 		dir = "input";
 		break;
-	case GPIOSIM_HOG_DIR_OUTPUT_HIGH:
+	case GPIOSIM_DIRECTION_OUTPUT_HIGH:
 		dir = "output-high";
 		break;
-	case GPIOSIM_HOG_DIR_OUTPUT_LOW:
+	case GPIOSIM_DIRECTION_OUTPUT_LOW:
 		dir = "output-low";
 		break;
 	default:
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
index ab26900..7d75852 100644
--- a/tests/gpiosim/gpiosim.h
+++ b/tests/gpiosim/gpiosim.h
@@ -28,9 +28,9 @@ enum gpiosim_pull {
 };
 
 enum gpiosim_direction {
-	GPIOSIM_HOG_DIR_INPUT = 1,
-	GPIOSIM_HOG_DIR_OUTPUT_HIGH,
-	GPIOSIM_HOG_DIR_OUTPUT_LOW,
+	GPIOSIM_DIRECTION_INPUT = 1,
+	GPIOSIM_DIRECTION_OUTPUT_HIGH,
+	GPIOSIM_DIRECTION_OUTPUT_LOW,
 };
 
 struct gpiosim_ctx *gpiosim_ctx_new(void);
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index 1627764..90c7c2f 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -51,12 +51,12 @@ GPIOD_TEST_CASE(line_info_basic_properties)
 		{
 			.offset = 3,
 			.name = "hog3",
-			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_HIGH,
 		},
 		{
 			.offset = 4,
 			.name = "hog4",
-			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_LOW,
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_LOW,
 		},
 		{ }
 	};
-- 
2.37.2

