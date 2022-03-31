Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5DD94ED139
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 03:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352367AbiCaBOp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 21:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352316AbiCaBOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 21:14:22 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068A566FB2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:31 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id j8so11855652pll.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uJeaChm6PkPCsmLkHBJJfG3eD3SiBAc7Q5XyPGm7aOc=;
        b=BNpAjIZa3cNBQedz83DwBLBCWdw8TsW4VblZRoiBJAZq7cpoNoLYSRPM3vxBBjAp/3
         nDmMLlXQ0HyN2WInpjrqIwkXYIcQKNlAcIm984fdUaM2alPG7Ladjes+GS1NNn42JUME
         4YLbfoRatJ7y11Xi8kW4sxID4NKN1dmmYDV+IWbnCuS5pEzHQLlrbU7G1UXD6QL4bLWd
         LGtFRtT/3VXfbiqN3453qfswvaSL5jXTCxdyaKsybtIShEkCf773jRP7e+BsX3iedTrV
         PEfTz4fKSCny0Fqe6O6iN8Rb5Y1TwJdZbNaHKd5xwzJdTTJNaZelMNtMLJqZ83Cqfjg0
         DqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJeaChm6PkPCsmLkHBJJfG3eD3SiBAc7Q5XyPGm7aOc=;
        b=prtV/UKwxNdQjy+DH/cwsWZOkR6CXF1f7pGJ+IyjaZOjg0mrqwggzK9hFXCGiU7502
         qgZoKvSzG6HPK4DvJKckcX0XwAZEIGLOovGPFVGsC+Z3y7mQxEY7ueeLstBWsLdXcbsq
         FOA/PuT9gidpBX6Dd50M58ykcfpQ/4kj4HbGn7RGh/6tkRNXDCVb+4k+k+cJSMvwj9sx
         xpRQwyZgIxkK2Cv8PIwXBdOc3m5+6QWbzi0a3a1Iia6KMT6cmJvmlpvzqcS/3wTl0HsR
         +JA8N/u6ubgkBEVbyhZIANW4l6A2xZ16yhpVodjcxi73CsyDoIl3zrwoQH6dCIQY9Xov
         m1Bg==
X-Gm-Message-State: AOAM531FScCI3eNpc9I1BaMza5ZuhcOswLPZFPuApVl1+GSiTRtqmnHv
        TFSPJg0PBJv9j5++m9jRaX04q9C0YdHJNQ==
X-Google-Smtp-Source: ABdhPJwPt1v1LnsM2qTYfRHBHz3aN1ET4ojsDWiasSeuhYfSqUkxA/jviA3NQppRVg4MiSEOBOfzZQ==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id bi4-20020a170902bf0400b00149c5a55323mr2437799plb.97.1648689150933;
        Wed, 30 Mar 2022 18:12:30 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e6-20020a63aa06000000b00380c8bed5a6sm21232176pgf.46.2022.03.30.18.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:12:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 3/4] tools: migrate to gpiod_request_lines
Date:   Thu, 31 Mar 2022 09:11:40 +0800
Message-Id: <20220331011141.53489-4-warthog618@gmail.com>
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

Switch to gpiod_request_lines() for tools that only use the chip to
request lines.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpiodetect.c   |  2 +-
 tools/gpiofind.c     |  2 +-
 tools/gpioget.c      | 11 +++++-----
 tools/gpioinfo.c     |  4 ++--
 tools/gpiomon.c      | 11 +++++-----
 tools/gpioset.c      | 11 +++++-----
 tools/tools-common.c | 50 +++++++++++++++++---------------------------
 tools/tools-common.h |  5 +++--
 8 files changed, 41 insertions(+), 55 deletions(-)

diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 8f6e8b3..2fada05 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -67,7 +67,7 @@ int main(int argc, char **argv)
 		die_perror("unable to scan /dev");
 
 	for (i = 0; i < num_chips; i++) {
-		chip = chip_open_by_name(entries[i]->d_name);
+		chip = chip_open(chip_path_from_name(entries[i]->d_name));
 		if (!chip)
 			die_perror("unable to open %s", entries[i]->d_name);
 
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 36eba86..17e1702 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -67,7 +67,7 @@ int main(int argc, char **argv)
 		die_perror("unable to scan /dev");
 
 	for (i = 0; i < num_chips; i++) {
-		chip = chip_open_by_name(entries[i]->d_name);
+		chip = chip_open(chip_path_from_name(entries[i]->d_name));
 		if (!chip) {
 			if (errno == EACCES)
 				continue;
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 2cf5eae..f4c5d46 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -46,11 +46,10 @@ int main(int argc, char **argv)
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
-	struct gpiod_chip *chip;
 	bool active_low = false;
 	unsigned int *offsets, *values;
 	size_t i, num_lines;
-	char *device, *end;
+	char *device, *end, *path;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -103,8 +102,8 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
+	path = chip_path_lookup(device);
+	if (!path)
 		die_perror("unable to open %s", device);
 
 	line_cfg = gpiod_line_config_new();
@@ -126,7 +125,7 @@ int main(int argc, char **argv)
 	gpiod_request_config_set_consumer(req_cfg, "gpioget");
 	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	request = gpiod_request_lines(path, req_cfg, line_cfg);
 	if (!request)
 		die_perror("unable to request lines");
 
@@ -144,7 +143,7 @@ int main(int argc, char **argv)
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
+	free(path);
 	free(offsets);
 	free(values);
 
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index fbe2a13..f0f9926 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -227,7 +227,7 @@ int main(int argc, char **argv)
 			die_perror("unable to scan /dev");
 
 		for (i = 0; i < num_chips; i++) {
-			chip = chip_open_by_name(entries[i]->d_name);
+			chip = chip_open(chip_path_from_name(entries[i]->d_name));
 			if (!chip)
 				die_perror("unable to open %s",
 					   entries[i]->d_name);
@@ -240,7 +240,7 @@ int main(int argc, char **argv)
 		free(entries);
 	} else {
 		for (i = 0; i < argc; i++) {
-			chip = chip_open_lookup(argv[i]);
+			chip = chip_open(chip_path_lookup(argv[i]));
 			if (!chip)
 				die_perror("looking up chip %s", argv[i]);
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index f6a0dba..e461458 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -164,9 +164,8 @@ int main(int argc, char **argv)
 	struct gpiod_line_config *line_cfg;
 	unsigned int offsets[64], offset;
 	struct gpiod_edge_event *event;
-	struct gpiod_chip *chip;
 	struct mon_ctx ctx;
-	char *end;
+	char *end, *path;
 
 	/*
 	 * FIXME: use signalfd once the API has been converted to using a single file
@@ -250,8 +249,8 @@ int main(int argc, char **argv)
 		num_lines++;
 	}
 
-	chip = chip_open_lookup(argv[0]);
-	if (!chip)
+	path = chip_path_lookup(argv[0]);
+	if (!path)
 		die_perror("unable to open %s", argv[0]);
 
 	line_cfg = gpiod_line_config_new();
@@ -271,7 +270,7 @@ int main(int argc, char **argv)
 	gpiod_request_config_set_consumer(req_cfg, "gpiomon");
 	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	request = gpiod_request_lines(path, req_cfg, line_cfg);
 	if (!request)
 		die_perror("unable to request lines");
 
@@ -314,7 +313,7 @@ done:
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
+	free(path);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 1c11470..7497eab 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -195,11 +195,10 @@ int main(int argc, char **argv)
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
 	struct callback_data cbdata;
-	struct gpiod_chip *chip;
 	bool active_low = false;
 	unsigned int *offsets, *values;
 	size_t i, num_lines;
-	char *device, *end;
+	char *device, *end, *path;
 
 	memset(&cbdata, 0, sizeof(cbdata));
 
@@ -288,8 +287,8 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
+	path = chip_path_lookup(device);
+	if (!path)
 		die_perror("unable to open %s", device);
 
 	line_cfg = gpiod_line_config_new();
@@ -314,7 +313,7 @@ int main(int argc, char **argv)
 	gpiod_request_config_set_consumer(req_cfg, "gpioset");
 	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	request = gpiod_request_lines(path, req_cfg, line_cfg);
 	if (!request)
 		die_perror("unable to request lines");
 
@@ -324,7 +323,7 @@ int main(int argc, char **argv)
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
-	gpiod_chip_close(chip);
+	free(path);
 	free(offsets);
 
 	return EXIT_SUCCESS;
diff --git a/tools/tools-common.c b/tools/tools-common.c
index f5fd50c..8d4ca12 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -114,36 +114,24 @@ int chip_dir_filter(const struct dirent *entry)
 	return !!is_chip;
 }
 
-struct gpiod_chip *chip_open_by_name(const char *name)
+char *chip_path_from_name(const char *name)
 {
-	struct gpiod_chip *chip;
 	char *path;
-	int ret;
 
-	ret = asprintf(&path, "/dev/%s", name);
-	if (ret < 0)
+	if (asprintf(&path, "/dev/%s", name) < 0)
 		return NULL;
 
-	chip = gpiod_chip_open(path);
-	free(path);
-
-	return chip;
+	return path;
 }
 
-static struct gpiod_chip *chip_open_by_number(unsigned int num)
+static char *chip_path_from_number(unsigned int num)
 {
-	struct gpiod_chip *chip;
 	char *path;
-	int ret;
 
-	ret = asprintf(&path, "/dev/gpiochip%u", num);
-	if (!ret)
+	if (asprintf(&path, "/dev/gpiochip%u", num) < 0)
 		return NULL;
 
-	chip = gpiod_chip_open(path);
-	free(path);
-
-	return chip;
+	return path;
 }
 
 static bool isuint(const char *str)
@@ -154,18 +142,18 @@ static bool isuint(const char *str)
 	return *str == '\0';
 }
 
-struct gpiod_chip *chip_open_lookup(const char *device)
+char *chip_path_lookup(const char *device)
 {
-	struct gpiod_chip *chip;
-
-	if (isuint(device)) {
-		chip = chip_open_by_number(strtoul(device, NULL, 10));
-	} else {
-		if (strncmp(device, "/dev/", 5))
-			chip = chip_open_by_name(device);
-		else
-			chip = gpiod_chip_open(device);
-	}
-
-	return chip;
+	if (isuint(device))
+		return chip_path_from_number(strtoul(device, NULL, 10));
+	if (strncmp(device, "/dev/", 5))
+		return chip_path_from_name(device);
+	return strdup(device);
+}
+
+struct gpiod_chip *chip_open(const char *path)
+{
+	if (path == NULL)
+		return NULL;
+	return gpiod_chip_open(path);
 }
diff --git a/tools/tools-common.h b/tools/tools-common.h
index f059440..d0b3a83 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -29,7 +29,8 @@ int parse_bias(const char *option);
 void print_bias_help(void);
 int make_signalfd(void);
 int chip_dir_filter(const struct dirent *entry);
-struct gpiod_chip *chip_open_by_name(const char *name);
-struct gpiod_chip *chip_open_lookup(const char *device);
+struct gpiod_chip *chip_open(const char *path);
+char *chip_path_from_name(const char *name);
+char *chip_path_lookup(const char *device);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.35.1

