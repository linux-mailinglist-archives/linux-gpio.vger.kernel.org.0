Return-Path: <linux-gpio+bounces-30744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8ED3B7E2
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 21:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F17A30422B5
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 20:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6C296BC1;
	Mon, 19 Jan 2026 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvePOcfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040A323EA8A
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852870; cv=none; b=ZVWYmTClx8NwSUnyX8jxfxgB3yLDqCr0syAI7NIWoyWqv1X6lPjX0/mbNYNEbhaOm29eXNXOPRextQYEc+gYUXSg3jbeNkzlOI5boFucitme3n7DlIKgl02g4PWbgTSo74oTdL2rtpsKP+Q3zqJA2RWhMUJBXJh2hKe2YqD5Nqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852870; c=relaxed/simple;
	bh=bIhnPC/k2I6/TRFTSKPpGCzwhq2a8Luo9y5G/EnHLkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImJTFKl8Yp+OzwoC5qq/O7KeseuyP02FQpDUgRCd1891/KmcjDqfCtp6NMgrYDoG4bGpGGHPqax9Apf+l0aXRiSHW/RdFF2ceYKPW//3amAjuZ+LcjvZRz/rTeSPFwEQcNeyfe/a2V05UqRqETSPqSyP+ekHZkilWhyzMja3VSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvePOcfh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso2385963b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 12:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768852868; x=1769457668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MoIABgXLESa/xl6gqMDYP7bJlt4badYSuAiVY+PADtU=;
        b=FvePOcfhgAdGRHJkoTAPfdPHxX3bCxDIeI+r9DJi1xIz7FRAbg2uPcqQQiRGRXaVA6
         Z5MtAK5O6UQsl6JNS61xWZSF9IPGlbLDyv75XotqfIjNjR5j09DT++Al+Xn0mhfruLNB
         yVXCXN6nl87ytaMRT0NuD84fge1plrC8TXM/lmZnEyR4YS6hi0x0mYw5pNg0uJ+PvPyf
         cv16bZYCkpEN3LGFwLlnbpngY9a+VkZmwh7tNXuUkMenLKSiY7cSANmWsjTzRNDSc9BN
         AYYOwIBxRpIQrV2uBkBXjZQSEeBxxjPBAw8fHqpd0Hraa8UMCGr63E51vHr4y9oPsxpT
         stQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852868; x=1769457668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoIABgXLESa/xl6gqMDYP7bJlt4badYSuAiVY+PADtU=;
        b=wohzh6loaxy83QcxxK6s8l2Lu9mpDtqxC29vHkEMiMCJAa0bIamgFsmlUDCbJfibVa
         oFZBLF8WktfHIFDvzpdWPfkU+HmgVvL5CZxVyA96+HSixX4ytJ+igYnE3gRefFxB1tpc
         eZPWLzFGins7llBZadWvbX+Q3PSBKf3XvTOxAMFuKy3Prtn1gZhsej/8S3sVGD+PBGqu
         6icYk5LV2XnDQdDjNfaRhV+H0HQYIewKKvhvBl5ChSAgI4uFZ5/HpmsLUS8sNajJLJJ/
         YPLd01WkmrmXZkjj6bX0IsLXdKY97NzB35nqCxgebH9VjwYw0KazV0BBzMCfqf/AnfR6
         ErlQ==
X-Gm-Message-State: AOJu0YwEdTBowpDtrIMZk8m8pGpWtoEONRzyMjgGIgCmoElIHga4rmbC
	1TZJKmg9o7fOdwxy5wNAvoD2hTkavFVzYjJ5Siri7i6KJKyxV8dFvKIJ4RGdRw==
X-Gm-Gg: AY/fxX5DXxB5lkIhXAoi/G0ICGTIDRWXQpr1YGtez6Ol58Tst1Nxza/MiUXjfIP0YMA
	NFs8OVqioLJJd64Fy3UknBgtQ55dDOxL0ZA+tQGB6JcH1bxdXhxK3GTAaQR+kg/eenMdCtJsMlF
	UZ2JNILVR+hfhvoo/fXdOJi3Mz+huFAvX6r6IoGqZCMQKTTT3OGsp1yMmOj8ouYeOEgFlt503n1
	U2m6QpE5Sp+/WYZ9xN573C0zcS04l298i65kUrFHNBlKANpRcCe1t6veK3Hk+e079/5e71Z2VBj
	O0AiLRNtJX6U8iWoZ6unxhflEfPG2FaRNfvaFygACslw4CFtj904sxhPFLL8wi2+ftODx/WQoro
	SPAiVbSpLusngjZwtZPrMgtUSPJg7IO3HTL4tEIXEl8SRXBRPWnYkwNARgL0eHuC696GI6em8B5
	UdP6Pzzcc3jyRRkfWWSms+9Kp7xcEl
X-Received: by 2002:a05:6a21:6f07:b0:389:8e23:f43a with SMTP id adf61e73a8af0-38e00da79e1mr11211216637.73.1768852867391;
        Mon, 19 Jan 2026 12:01:07 -0800 (PST)
Received: from shaarang-desktop.. ([2402:e280:222f:73c:44fb:8dba:5a41:90ab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf249bdcsm9819496a12.8.2026.01.19.12.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 12:01:06 -0800 (PST)
From: shaarang.tyagi@gmail.com
To: linux-gpio@vger.kernel.org
Cc: shaarang.tyagi@gmail.com
Subject: [libgpiod][PATCH v2] tools: gpiomon: add initial-state option
Date: Tue, 20 Jan 2026 01:30:31 +0530
Message-ID: <20260119200031.5832-1-shaarang.tyagi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaarang Tyagi <shaarang.tyagi@gmail.com>

Add a gpiomon initial-state command line option to display
initial line states, this is diplayed before waiting for events.

Closes: https://github.com/brgl/libgpiod/issues/159
Signed-off-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
---
Changes in v2:
- allocation of "values" moved to if block.
- existing variable pollfds was freed.
- option -S changed to -I.
- Added to the unit test.
---
 tests/scripts/gpiod-bash-test-helper.inc |  0
 tools/gpio-tools-test.bash               | 16 +++++++++++++++
 tools/gpioget.c                          | 18 +----------------
 tools/gpiomon.c                          | 25 +++++++++++++++++++++++-
 tools/tools-common.c                     | 21 ++++++++++++++++++++
 tools/tools-common.h                     |  2 ++
 6 files changed, 64 insertions(+), 18 deletions(-)
 mode change 100644 => 100755 tests/scripts/gpiod-bash-test-helper.inc

diff --git a/tests/scripts/gpiod-bash-test-helper.inc b/tests/scripts/gpiod-bash-test-helper.inc
old mode 100644
new mode 100755
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 898b348..9ed88ac 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -2235,6 +2235,22 @@ test_gpiomon_with_custom_format_unknown_specifier() {
 	output_is "%x"
 }
 
+test_gpiomon_with_initial_state() {
+	gpiosim_chip sim0 num_lines=8
+
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_prog gpiomon --initial-state --chip "$sim0" 0 1 2 3 4 5 6 7
+
+	output_is \
+"Initial line state(s): \"0\"=inactive \"1\"=inactive \"2\"=active \"3\"=active \"4\"=inactive \"5\"=active \"6\"=inactive \"7\"=active"
+	status_is 124
+}
 #
 # gpionotify test cases
 #
diff --git a/tools/gpioget.c b/tools/gpioget.c
index bad7667..de1dbdf 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -139,12 +139,10 @@ int main(int argc, char **argv)
 	struct gpiod_line_config *line_cfg;
 	struct line_resolver *resolver;
 	enum gpiod_line_value *values;
-	struct resolved_line *line;
 	struct gpiod_chip *chip;
 	unsigned int *offsets;
 	int i, num_lines, ret;
 	struct config cfg;
-	const char *fmt;
 
 	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
@@ -216,21 +214,7 @@ int main(int argc, char **argv)
 		gpiod_line_request_release(request);
 		gpiod_chip_close(chip);
 	}
-
-	fmt = cfg.unquoted ? "%s=%s" : "\"%s\"=%s";
-
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		if (cfg.numeric)
-			printf("%d", line->value);
-		else
-			printf(fmt, line->id,
-			       line->value ? "active" : "inactive");
-
-		if (i != resolver->num_lines - 1)
-			printf(" ");
-	}
-	printf("\n");
+	print_line_vals(resolver, cfg.unquoted, cfg.numeric);
 
 	free_line_resolver(resolver);
 	gpiod_request_config_free(req_cfg);
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 88b5ccf..79aefaf 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -32,6 +32,7 @@ struct config {
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
 	long long idle_timeout;
+	bool initial_state;
 };
 
 static void print_help(void)
@@ -69,6 +70,7 @@ static void print_help(void)
 	printf("  -p, --debounce-period <period>\n");
 	printf("\t\t\tdebounce the line(s) with the specified period\n");
 	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -I, --initial-state\t\tprint initial states of the lines\n");
 	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
 	printf("      --unquoted\tdon't quote line or consumer names\n");
 	printf("      --utc\t\tformat event timestamps as UTC (default for 'realtime')\n");
@@ -113,7 +115,7 @@ static int parse_event_clock_or_die(const char *option)
 
 static int parse_config(int argc, char **argv, struct config *cfg)
 {
-	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshv";
+	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshvI";
 
 	const struct option longopts[] = {
 		{ "active-low",	no_argument,	NULL,		'l' },
@@ -136,6 +138,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		{ "unquoted",	no_argument,	NULL,		'Q' },
 		{ "utc",	no_argument,	&cfg->timestamp_fmt,	1 },
 		{ "version",	no_argument,	NULL,		'v' },
+		{ "initial-state",	no_argument,	NULL,		'I' },
 		{ GETOPT_NULL_LONGOPT },
 	};
 
@@ -197,6 +200,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		case 's':
 			cfg->strict = true;
 			break;
+		case 'I':
+			cfg->initial_state = true;
+			break;
 		case 'h':
 			print_help();
 			exit(EXIT_SUCCESS);
@@ -363,6 +369,7 @@ int main(int argc, char **argv)
 	int num_lines, events_done = 0;
 	struct gpiod_edge_event *event;
 	struct line_resolver *resolver;
+	enum gpiod_line_value *values;
 	struct timespec idle_timeout;
 	struct gpiod_chip *chip;
 	struct pollfd *pollfds;
@@ -423,6 +430,7 @@ int main(int argc, char **argv)
 	requests = calloc(resolver->num_chips, sizeof(*requests));
 	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
 	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+
 	if (!requests || !pollfds || !offsets)
 		die("out of memory");
 
@@ -445,6 +453,20 @@ int main(int argc, char **argv)
 			die_perror("unable to request lines on chip %s",
 				   resolver->chips[i].path);
 
+		if (cfg.initial_state) {
+			values = calloc(resolver->num_lines, sizeof(*values));
+			if (!values)
+				die("out of memory");
+			ret = gpiod_line_request_get_values(requests[i], values);
+			if (ret)
+				die_perror("unable to read GPIO line values");
+
+			set_line_values(resolver, i, values);
+			printf("Initial line state(s): ");
+			print_line_vals(resolver, cfg.unquoted, false);
+			free(values);
+		}
+
 		pollfds[i].fd = gpiod_line_request_get_fd(requests[i]);
 		pollfds[i].events = POLLIN;
 		gpiod_chip_close(chip);
@@ -508,6 +530,7 @@ done:
 	free_line_resolver(resolver);
 	gpiod_edge_event_buffer_free(event_buffer);
 	free(offsets);
+	free(pollfds);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 8c2d5bc..b8d821a 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -402,6 +402,27 @@ void print_line_id(struct line_resolver *resolver, int chip_num,
 	printf(fmt, lname);
 }
 
+void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
+			bool is_numeric)
+{
+	int i;
+	const char *fmt = is_unquoted ? "%s=%s" : "\"%s\"=%s";
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		struct resolved_line *line = &resolver->lines[i];
+
+		if (is_numeric)
+			printf("%d", line->value);
+		else
+			printf(fmt, line->id,
+			       line->value ? "active" : "inactive");
+
+		if (i != resolver->num_lines - 1)
+			printf(" ");
+	}
+	printf("\n");
+}
+
 static int chip_dir_filter(const struct dirent *entry)
 {
 	struct stat sb;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index bc63080..479373a 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -99,6 +99,8 @@ void print_event_time(uint64_t evtime, int format);
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings);
 void print_line_id(struct line_resolver *resolver, int chip_num,
 		   unsigned int offset, const char *chip_id, bool unquoted);
+void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
+			bool is_numeric);
 bool chip_path_lookup(const char *id, char **path_ptr);
 int chip_paths(const char *id, char ***paths_ptr);
 int all_chip_paths(char ***paths_ptr);

