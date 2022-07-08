Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D77156B957
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 14:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiGHMIT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 08:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238030AbiGHMIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 08:08:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A519A9B1AE
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 05:08:15 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b9so7345934pfp.10
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ih0f80xdltbpdBppc/pv1XymP3WYlduWwkJPxzgFPQ8=;
        b=iLoKOQVARyiz3unBMcp+HjbDBT1Mriv92gd9+DpZx3XSaNdM8uvhkNlnRT1q2r5J5b
         GECKNROaF+ycjeoUJfVtomSGyMV586weoQByECDpWxBn/CFvDbjkcf0UQlP+JQLrjfkk
         5rF/9IPYs2K48qKbP4OlhVfS4ko8srSWDhzZwXDUkGl0CHse158IKynnBNW0z+wu88kJ
         miBDUvneU40ls5GbDX+7jabXwd+QQ3uCG3yZeJ7MHTkLagkDm+0Fw2RBnh1Ed9O1yH48
         TGZ1THfMJCEun6+VsDUdByj4M7/EkN0fmguUNvLDGGjv+GfsjAcbglVeJPABjwULEfWW
         /DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ih0f80xdltbpdBppc/pv1XymP3WYlduWwkJPxzgFPQ8=;
        b=b2yiaGihm6dlCfYt6thxSd3eOXwa9Ai9JrLz2e9i35YgxbG4olF8H4dF6q/9TwlGKW
         BJ4mz6tj8PTYA6OkyYpAX2rnwtRMfpp7tG8sBmJy37SJu6xswxosisc0oVzDlvRx2wQN
         NNS3tF3HV6ATJW+EWQW7pY1a0cZ+1fmjJXSRs7Y3YZuM9sXUTyiis6IMXQoyenRNjfKU
         SIe4AH+MLCmWTS9SzH2VSVmZ5lSE5iTwLsBtI4lnwgQsm0nFZ/3s+RE+PG52Ue2/kfx4
         W9vOuKrZF7A2Bk2j4Rb6EuXow8qmrvT3xGraGGY8T+p/GOJbANLPp85vmqnrY8qkmN1s
         mlsw==
X-Gm-Message-State: AJIora+oxQUE9Qkv7TSOmvT4udlXJN/gqXhHgT3STCTGSyWH3swuav93
        ks5CwG5tKtJudSjHLE8XusvTDAbVtuM=
X-Google-Smtp-Source: AGRyM1un+tq3XApAL/aQHXp0PcvUzvSlTzzmft/NIYtkhYn3xKPDPN1k6fLZQruQ+6ehQ5cmH/doAA==
X-Received: by 2002:a63:b105:0:b0:3fd:a875:d16 with SMTP id r5-20020a63b105000000b003fda8750d16mr2992029pgf.209.1657282094685;
        Fri, 08 Jul 2022 05:08:14 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b0016bfafffa0esm6490312plq.227.2022.07.08.05.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:08:14 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v2 6/6] tools: remove gpiofind
Date:   Fri,  8 Jul 2022 20:06:26 +0800
Message-Id: <20220708120626.89844-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708120626.89844-1-warthog618@gmail.com>
References: <20220708120626.89844-1-warthog618@gmail.com>
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

Remove the gpiofind tool as its functionality has been absorbed into
the other tools.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 man/Makefile.am            |   2 +-
 tools/Makefile.am          |   4 +-
 tools/gpio-tools-test.bats |  97 ----------------------
 tools/gpiofind.c           | 163 -------------------------------------
 4 files changed, 2 insertions(+), 264 deletions(-)
 delete mode 100644 tools/gpiofind.c

diff --git a/man/Makefile.am b/man/Makefile.am
index 3badd3b..032ed4e 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -3,7 +3,7 @@
 
 if WITH_MANPAGES
 
-dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiofind.man gpiomon.man gpiowatch.man
+dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiomon.man gpiowatch.man
 
 %.man: $(top_builddir)/tools/$(*F)
 	help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 31b7cc9..1097fea 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -9,7 +9,7 @@ libtools_common_la_SOURCES = tools-common.c tools-common.h
 
 LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la $(LIBEDIT_LIBS)
 
-bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiofind gpiowatch
+bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpiowatch
 
 gpiodetect_SOURCES = gpiodetect.c
 
@@ -21,8 +21,6 @@ gpioset_SOURCES = gpioset.c
 
 gpiomon_SOURCES = gpiomon.c
 
-gpiofind_SOURCES = gpiofind.c
-
 gpiowatch_SOURCES = gpiowatch.c
 
 EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a9161e3..6316bb6 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -731,103 +731,6 @@ request_release_line() {
 	output_regex_match ".*offset 5 is out of range on chip $sim0"
 }
 
-#
-# gpiofind test cases
-#
-
-@test "gpiofind: by name" {
-	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
-	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz \
-				      line_name=7:foobar
-	gpiosim_chip sim2 num_lines=16
-
-	run_tool gpiofind foobar
-
-	status_is 0
-	output_is "${GPIOSIM_CHIP_NAME[sim1]} 7"
-}
-
-@test "gpiofind: by chip and name" {
-	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
-				      line_name=3:foobar
-	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
-				      line_name=4:xyz line_name=7:foobar
-	gpiosim_chip sim2 num_lines=16
-
-	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
-
-	run_tool gpiofind --chip $sim1 foobar
-
-	status_is 0
-	output_is "$sim1 2"
-}
-
-@test "gpiofind: first matching named line" {
-	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
-				      line_name=3:foobar
-	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
-				      line_name=4:xyz line_name=7:foobar
-	gpiosim_chip sim2 num_lines=16
-
-	run_tool gpiofind foobar
-
-	status_is 0
-	output_is "${GPIOSIM_CHIP_NAME[sim0]} 3"
-}
-
-@test "gpiofind: with info" {
-	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
-	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz \
-				      line_name=7:foobar
-	gpiosim_chip sim2 num_lines=16
-
-	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
-
-	run_tool gpiofind --info baz
-
-	status_is 0
-	num_lines_is 1
-	output_regex_match "${sim1}\\s+0\\s+baz\\s+unused\\s+\\[input\\]"
-}
-
-@test "gpiofind: all lines matching name" {
-	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
-				      line_name=3:foobar
-	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
-				      line_name=4:xyz line_name=7:foobar
-	gpiosim_chip sim2 num_lines=16
-
-	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
-	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
-
-	run_tool gpiofind --strict foobar
-
-	status_is 1
-	num_lines_is 3
-	output_regex_match "$sim0\\s+3"
-	output_regex_match "$sim1\\s+2"
-	output_regex_match "$sim1\\s+7"
-}
-
-@test "gpiofind: with nonexistent chip" {
-	run_tool gpiofind --chip nonexistant-chip 0
-
-	status_is 1
-	output_regex_match \
-".*cannot find a GPIO chip character device corresponding to nonexistant-chip"
-}
-
-@test "gpiofind: with nonexistent line" {
-	gpiosim_chip sim0 num_lines=4
-	gpiosim_chip sim1 num_lines=8
-	gpiosim_chip sim2 num_lines=16
-
-	run_tool gpiofind nonexistent-line
-
-	status_is 1
-	output_regex_match ".*cannot find line nonexistent-line"
-}
-
 #
 # gpioget test cases
 #
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
deleted file mode 100644
index 51e6db3..0000000
--- a/tools/gpiofind.c
+++ /dev/null
@@ -1,163 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-// SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
-
-#include <errno.h>
-#include <getopt.h>
-#include <gpiod.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include "tools-common.h"
-
-static void print_help(void)
-{
-	printf("Usage: %s [OPTIONS] <name>\n", get_progname());
-	printf("\n");
-	printf("Find a GPIO line by name.\n");
-	printf("\n");
-	printf("The output of this command can be used as input for gpioget/set.\n");
-	printf("\n");
-	printf("Options:\n");
-	printf("  -c, --chip <chip>\trestrict scope to a particular chip\n");
-	printf("  -h, --help\t\tdisplay this help and exit\n");
-	printf("  -i, --info\t\tdisplay info for found lines\n");
-	printf("  -s, --strict\t\tcheck all lines - don't assume line names are unique\n");
-	printf("  -v, --version\t\toutput version information and exit\n");
-	print_chip_help();
-}
-
-struct config {
-	bool strict;
-	bool display_info;
-	const char *chip_id;
-};
-
-int parse_config(int argc, char **argv, struct config *cfg)
-{
-	int opti, optc;
-	const char *const shortopts = "+c:hisv";
-	const struct option longopts[] = {
-		{ "chip",	required_argument,	NULL,	'c' },
-		{ "help",	no_argument,		NULL,	'h' },
-		{ "info",	no_argument,		NULL,	'i' },
-		{ "strict",	no_argument,		NULL,	's' },
-		{ "version",	no_argument,		NULL,	'v' },
-		{ GETOPT_NULL_LONGOPT },
-	};
-
-	memset(cfg, 0, sizeof(*cfg));
-
-	for (;;) {
-		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
-		if (optc < 0)
-			break;
-
-		switch (optc) {
-		case 'c':
-			cfg->chip_id = optarg;
-			break;
-		case 'i':
-			cfg->display_info = true;
-			break;
-		case 's':
-			cfg->strict = true;
-			break;
-		case 'h':
-			print_help();
-			exit(EXIT_SUCCESS);
-		case 'v':
-			print_version();
-			exit(EXIT_SUCCESS);
-		case '?':
-			die("try %s --help", get_progname());
-		default:
-			abort();
-		}
-	}
-
-	return optind;
-}
-
-int main(int argc, char **argv)
-{
-	int i, num_chips, num_lines, offset, num_found = 0, ret = EXIT_FAILURE;
-	struct gpiod_chip *chip;
-	struct gpiod_chip_info *chip_info;
-	char **paths;
-	const char *name;
-	struct gpiod_line_info *line_info;
-	struct config cfg;
-
-	i = parse_config(argc, argv, &cfg);
-	argc -= optind;
-	argv += optind;
-
-	if (argc != 1)
-		die("exactly one GPIO line name must be specified");
-
-	num_chips = chip_paths(cfg.chip_id, &paths);
-	if ((cfg.chip_id != NULL)  && (num_chips == 0))
-		die("cannot find a GPIO chip character device corresponding to %s",
-			cfg.chip_id);
-
-	for (i = 0; i < num_chips; i++) {
-		chip = gpiod_chip_open(paths[i]);
-		if (!chip) {
-			if ((errno == EACCES) && (!cfg.chip_id))
-				continue;
-
-			die_perror("unable to open %s", paths[i]);
-		}
-
-		chip_info = gpiod_chip_get_info(chip);
-		if (!chip_info)
-			die_perror("unable to get info for %s", paths[i]);
-
-		num_lines = gpiod_chip_info_get_num_lines(chip_info);
-		for (offset = 0; offset < num_lines; offset++) {
-			line_info = gpiod_chip_get_line_info(chip, offset);
-
-			if (!line_info)
-				die_perror("unable to retrieve the line info from chip %s",
-					   gpiod_chip_get_path(chip));
-
-			name = gpiod_line_info_get_name(line_info);
-			if (name &&	strcmp(argv[0], name) == 0) {
-				num_found++;
-
-				printf("%s %u",
-				       gpiod_chip_info_get_name(chip_info),
-				       offset);
-
-				if (cfg.display_info)
-					print_line_info(line_info);
-
-				printf("\n");
-
-				if (!cfg.strict) {
-					gpiod_chip_info_free(chip_info);
-					gpiod_chip_close(chip);
-					goto exit_paths;
-				}
-			}
-		}
-		gpiod_chip_info_free(chip_info);
-		gpiod_chip_close(chip);
-	}
-
-	if (!num_found)
-		print_error("cannot find line %s", argv[0]);
-
-exit_paths:
-	if (num_found == 1)
-		ret = EXIT_SUCCESS;
-
-	for (i = 0; i < num_chips; i++)
-		free(paths[i]);
-
-	free(paths);
-
-	return ret;
-}
-- 
2.37.0

