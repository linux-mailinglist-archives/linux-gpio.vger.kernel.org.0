Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2BD3DBAF0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239097AbhG3OoI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239095AbhG3OoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:44:07 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F87C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:01 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b13so758657wrs.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sh8YoJcPc+MKGhFiCoUS4DllXMZJV0ZvokVUG/XkS18=;
        b=KOCgY6pl17Fi7Wi2ApB6Bez6MoqCFcfUYYLVFTvUWTkRhIedQEgLI+IO+iIkoPHTjy
         96w5vMUl3KPh2Ce1NKSHRBp7WavJsZd5s99N3Kkt97oSx5Hda9yxS+AOfAcnL98GFt7E
         tt0pPg5w6YB4JydNE283YVO0L5GJ90qA1Gb+vprsA9gtMg7RqXpByNX3Lbkak2rsYjps
         FAdaOkDds57OnVYb8utRMl1dX3YlDzB83TnfkC4YGt94KnB5/IyurANRRoflB+igIzUO
         HafScTFQ9toqNUC3WlK9y6TC9ArJ0QzhfsSNJ/suWuxT2E94LWSCOCdGTLFhEc5j+GNO
         t5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sh8YoJcPc+MKGhFiCoUS4DllXMZJV0ZvokVUG/XkS18=;
        b=PrjvrzW6I4oJReNQ1WmgfzI52aRiPk9n6h5myaHYRa3awoWjnYaE0O/BG95Y9KLt1A
         g1Jo2pXTIMLbOQzMPSfEgtCB8df8Dyya9JEauhzr3+AHKB8MMiMLVukv266D04DFgxDM
         0tW5UDeyObx/C7jjRJG1xaW+adMa0AuiWNOcM44AvGvPRhHzDyZl+BoJSHhap/Ad/zaV
         oi1EEBrQT4OlEXJ1xcXBpbZjGZrweXEZVKyetL6wQgs5DtrGMtMSrfSUoPX208Ga6PuM
         mOKry3aDOlhiFTnrXB9OUTVbYX7eOUj1IiZkPJdRPfnE9dnxoMpBzOjBMjAVmARwwspm
         KBHw==
X-Gm-Message-State: AOAM533kvMl1jf52h8wF8O0PNzYXYcBArkLkFe8RObBBmb4WPaFsVdPV
        eOfJi0g85tM5bDji2LmKYAQIZQ==
X-Google-Smtp-Source: ABdhPJy59XdQBWWcUvRyBtI1SG7hH8ZhCQYuQxPu97tovLfSRbmhwd8xu5g33aH0xP+FvISfyegevA==
X-Received: by 2002:a5d:4b48:: with SMTP id w8mr3417903wrs.109.1627656240377;
        Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id o29sm1825029wms.13.2021.07.30.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:44:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 3/3] treewide: unify the line settings defines
Date:   Fri, 30 Jul 2021 16:43:56 +0200
Message-Id: <20210730144356.23079-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210730144356.23079-1-brgl@bgdev.pl>
References: <20210730144356.23079-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The definitions of line settings are mostly duplicated between the
line-info and line-config objects. Unify them by merging any differences
into common enums.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h      | 93 ++++++++++----------------------------------
 lib/line-config.c    | 38 +++++++++---------
 tools/gpioget.c      |  4 +-
 tools/gpiomon.c      |  6 +--
 tools/gpioset.c      |  7 ++--
 tools/tools-common.c |  6 +--
 6 files changed, 51 insertions(+), 103 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 4506571..85a671f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -185,21 +185,19 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 /**
  * @}
  *
- * @defgroup line_info Line info
+ * @defgroup line_settings Line settings
  * @{
  *
- * Definitions and functions for retrieving kernel information about both
- * requested and free lines.
- *
- * Line info object contains an immutable snapshot of the line's state at the
- * time when it was created.
+ * These defines are used both by gpiod_line_info and gpiod_line_config.
  */
 
 /**
  * @brief Direction settings.
  */
 enum {
-	GPIOD_LINE_DIRECTION_INPUT = 1,
+	GPIOD_LINE_DIRECTION_AS_IS = 1,
+	/**< Request the line(s), but don't change current direction. */
+	GPIOD_LINE_DIRECTION_INPUT,
 	/**< Direction is input - we're reading the state of a GPIO line. */
 	GPIOD_LINE_DIRECTION_OUTPUT
 	/**< Direction is output - we're driving the GPIO line. */
@@ -209,7 +207,9 @@ enum {
  * @brief Internal bias settings.
  */
 enum {
-	GPIOD_LINE_BIAS_UNKNOWN = 1,
+	GPIOD_LINE_BIAS_AS_IS = 1,
+	/**< Don't change the bias setting when applying line config. */
+	GPIOD_LINE_BIAS_UNKNOWN,
 	/**< The internal bias state is unknown. */
 	GPIOD_LINE_BIAS_DISABLED,
 	/**< The internal bias is disabled. */
@@ -255,6 +255,19 @@ enum {
 	/**< Line uses the realtime clock for edge event timestamps. */
 };
 
+/**
+ * @}
+ *
+ * @defgroup line_info Line info
+ * @{
+ *
+ * Functions for retrieving kernel information about both requested and free
+ * lines.
+ *
+ * Line info object contains an immutable snapshot of the line's state at the
+ * time when it was created.
+ */
+
 /**
  * @brief Free a line info object and release all associated resources.
  * @param info GPIO line info object to free.
@@ -445,70 +458,6 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
  * a single line offset or for multiple line offsets.
  */
 
-/**
- * @brief Available direction settings.
- */
-enum {
-	GPIOD_LINE_CONFIG_DIRECTION_AS_IS = 1,
-	/**< Request the line(s), but don't change current direction. */
-	GPIOD_LINE_CONFIG_DIRECTION_INPUT,
-	/**< Request the line(s) for reading the GPIO line state. */
-	GPIOD_LINE_CONFIG_DIRECTION_OUTPUT
-	/**< Request the line(s) for setting the GPIO line state. */
-};
-
-/**
- * @brief Available edge event detection settings. Only relevant for input
- *        direction.
- */
-enum {
-	GPIOD_LINE_CONFIG_EDGE_NONE = 1,
-	/**< Don't report edge events. */
-	GPIOD_LINE_CONFIG_EDGE_FALLING,
-	/**< Only watch falling edge events. */
-	GPIOD_LINE_CONFIG_EDGE_RISING,
-	/**< Only watch rising edge events. */
-	GPIOD_LINE_CONFIG_EDGE_BOTH
-	/**< Monitor both types of events. */
-};
-
-/**
- * @brief Available internal bias settings for line requests.
- */
-enum {
-	GPIOD_LINE_CONFIG_BIAS_AS_IS = 1,
-	/**< Don't change the current bias setting. */
-	GPIOD_LINE_CONFIG_BIAS_DISABLED,
-	/**< The internal bias should be disabled (the default). */
-	GPIOD_LINE_CONFIG_BIAS_PULL_UP,
-	/**< The internal pull-up bias is enabled. */
-	GPIOD_LINE_CONFIG_BIAS_PULL_DOWN
-	/**< The internal pull-down bias is enabled. */
-};
-
-/**
- * @brief Available drive settings for line requests. Only relevant for output
- *        direction.
- */
-enum {
-	GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL = 1,
-	/**< Drive setting should be set to push-pull (the default). */
-	GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN,
-	/**< Line output should be set to open-drain. */
-	GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE
-	/**< Line output should be set to open-source. */
-};
-
-/**
- * @brief Available clock types used for event timestamps.
- */
-enum {
-	GPIOD_LINE_CONFIG_EVENT_CLOCK_MONOTONIC = 1,
-	/**< Use the monotonic clock. */
-	GPIOD_LINE_CONFIG_EVENT_CLOCK_REALTIME
-	/**< Use the realtime clock. */
-};
-
 /**
  * @brief Create a new line config object.
  * @return New line config object or NULL on error.
diff --git a/lib/line-config.c b/lib/line-config.c
index 24dc5f4..6cc4676 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -435,13 +435,13 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 	*flags = 0;
 
 	switch (config->direction) {
-	case GPIOD_LINE_CONFIG_DIRECTION_INPUT:
+	case GPIOD_LINE_DIRECTION_INPUT:
 		*flags |= GPIO_V2_LINE_FLAG_INPUT;
 		break;
-	case GPIOD_LINE_CONFIG_DIRECTION_OUTPUT:
+	case GPIOD_LINE_DIRECTION_OUTPUT:
 		*flags |= GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
-	case GPIOD_LINE_CONFIG_DIRECTION_AS_IS:
+	case GPIOD_LINE_DIRECTION_AS_IS:
 	case 0:
 		break;
 	default:
@@ -449,23 +449,23 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 	}
 
 	switch (config->edge) {
-	case GPIOD_LINE_CONFIG_EDGE_FALLING:
+	case GPIOD_LINE_EDGE_FALLING:
 		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
-	case GPIOD_LINE_CONFIG_EDGE_RISING:
+	case GPIOD_LINE_EDGE_RISING:
 		*flags |= (GPIO_V2_LINE_FLAG_EDGE_RISING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
-	case GPIOD_LINE_CONFIG_EDGE_BOTH:
+	case GPIOD_LINE_EDGE_BOTH:
 		*flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			   GPIO_V2_LINE_FLAG_EDGE_RISING |
 			   GPIO_V2_LINE_FLAG_INPUT);
-		*flags &= ~GPIOD_LINE_CONFIG_DIRECTION_OUTPUT;
+		*flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
-	case GPIOD_LINE_CONFIG_EDGE_NONE:
+	case GPIOD_LINE_EDGE_NONE:
 	case 0:
 		break;
 	default:
@@ -473,13 +473,13 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 	}
 
 	switch (config->drive) {
-	case GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN:
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
 		*flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 		break;
-	case GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE:
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
 		*flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 		break;
-	case GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL:
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
 	case 0:
 		break;
 	default:
@@ -487,16 +487,16 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 	}
 
 	switch (config->bias) {
-	case GPIOD_LINE_CONFIG_BIAS_DISABLED:
+	case GPIOD_LINE_BIAS_DISABLED:
 		*flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
 		break;
-	case GPIOD_LINE_CONFIG_BIAS_PULL_UP:
+	case GPIOD_LINE_BIAS_PULL_UP:
 		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
 		break;
-	case GPIOD_LINE_CONFIG_BIAS_PULL_DOWN:
+	case GPIOD_LINE_BIAS_PULL_DOWN:
 		*flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
 		break;
-	case GPIOD_LINE_CONFIG_BIAS_AS_IS:
+	case GPIOD_LINE_BIAS_AS_IS:
 	case 0:
 		break;
 	default:
@@ -507,10 +507,10 @@ static int gpiod_make_kernel_flags(uint64_t *flags, struct base_config *config)
 		*flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
 	switch (config->clock) {
-	case GPIOD_LINE_CONFIG_EVENT_CLOCK_REALTIME:
+	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
 		*flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 		break;
-	case GPIOD_LINE_CONFIG_EVENT_CLOCK_MONOTONIC:
+	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
 	case 0:
 		break;
 	default:
diff --git a/tools/gpioget.c b/tools/gpioget.c
index afa2ccb..965af3b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -41,7 +41,7 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	int direction = GPIOD_LINE_CONFIG_DIRECTION_INPUT;
+	int direction = GPIOD_LINE_DIRECTION_INPUT;
 	int optc, opti, bias = 0, ret, *values;
 	struct gpiod_request_config *req_cfg;
 	unsigned int *offsets, i, num_lines;
@@ -67,7 +67,7 @@ int main(int argc, char **argv)
 			active_low = true;
 			break;
 		case 'n':
-			direction = GPIOD_LINE_CONFIG_DIRECTION_AS_IS;
+			direction = GPIOD_LINE_DIRECTION_AS_IS;
 			break;
 		case 'B':
 			bias = parse_bias(optarg);
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 66fbb13..740c249 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -225,11 +225,11 @@ int main(int argc, char **argv)
 	argv += optind;
 
 	if (watch_rising && !watch_falling)
-		edge = GPIOD_LINE_CONFIG_EDGE_RISING;
+		edge = GPIOD_LINE_EDGE_RISING;
 	else if (watch_falling && !watch_rising)
-		edge = GPIOD_LINE_CONFIG_EDGE_FALLING;
+		edge = GPIOD_LINE_EDGE_FALLING;
 	else
-		edge = GPIOD_LINE_CONFIG_EDGE_BOTH;
+		edge = GPIOD_LINE_EDGE_BOTH;
 
 	if (argc < 1)
 		die("gpiochip must be specified");
diff --git a/tools/gpioset.c b/tools/gpioset.c
index bf90087..55fcfe9 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -179,9 +179,9 @@ static const struct mode_mapping *parse_mode(const char *mode)
 static int parse_drive(const char *option)
 {
 	if (strcmp(option, "open-drain") == 0)
-		return GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN;
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
 	if (strcmp(option, "open-source") == 0)
-		return GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE;
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
 	if (strcmp(option, "push-pull") != 0)
 		die("invalid drive: %s", option);
 	return 0;
@@ -301,8 +301,7 @@ int main(int argc, char **argv)
 		gpiod_line_config_set_drive(line_cfg, drive);
 	if (active_low)
 		gpiod_line_config_set_active_low(line_cfg);
-	gpiod_line_config_set_direction(line_cfg,
-					GPIOD_LINE_CONFIG_DIRECTION_OUTPUT);
+	gpiod_line_config_set_direction(line_cfg, GPIOD_LINE_DIRECTION_OUTPUT);
 	gpiod_line_config_set_output_values(line_cfg, num_lines,
 					    offsets, values);
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 36724d5..f5fd50c 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -60,11 +60,11 @@ void print_version(void)
 int parse_bias(const char *option)
 {
 	if (strcmp(option, "pull-down") == 0)
-		return GPIOD_LINE_CONFIG_BIAS_PULL_DOWN;
+		return GPIOD_LINE_BIAS_PULL_DOWN;
 	if (strcmp(option, "pull-up") == 0)
-		return GPIOD_LINE_CONFIG_BIAS_PULL_UP;
+		return GPIOD_LINE_BIAS_PULL_UP;
 	if (strcmp(option, "disable") == 0)
-		return GPIOD_LINE_CONFIG_BIAS_DISABLED;
+		return GPIOD_LINE_BIAS_DISABLED;
 	if (strcmp(option, "as-is") != 0)
 		die("invalid bias: %s", option);
 	return 0;
-- 
2.30.1

