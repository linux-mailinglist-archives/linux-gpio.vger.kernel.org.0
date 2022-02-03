Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBA04A7E9D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349285AbiBCEW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:22:57 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE04C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:22:57 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso8866426pjv.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WtaAuNcUopoXBRdxvTZnjT3vtlEQbvUUGCW1xR+yS2o=;
        b=B90XMvr0DtNnqk/V7XkGXlRd3comtBJfKavES2DBwMG/aB3Qknk6rO9oQ/mL4+d0o5
         fQB1eM1XPApumU1/LEG+Q8V7UtwWp3aFCtwpd1+0xw/Zn3Tx1+cVtpzTccfnR/C/X7ZR
         Z3bgO88LLIObp/Kon9vL1OkauKJ/sOUEYzrosSLXQU8TBiFoN1179meDBoyloQ5ELvE5
         WJtq3mEWbRh5IuGC0552Jxq6SjxSN27RDcJ19EjBxWuKKWdz4qcMpwhaWlK/2mhXiiUC
         WFIFqC//Zm460Nj2ZaSST/yU0WM0DGeqtvUg0NCjbXf9x6Q7WdgeJe4U5NU9TXMYJVVA
         /YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WtaAuNcUopoXBRdxvTZnjT3vtlEQbvUUGCW1xR+yS2o=;
        b=abP3+Fu41b5ZKd3evBF2XdQU5UuMXR1g4xjtavFxuUWpikl5v8yBb3z+ykKZwiO98V
         qFaY6WAKBewwapqL3CNwAQv5vSuLVcv+A78DlseXsuHumD8mxlHr3BQxXRFGjJ00bYrc
         okewVUpthS6PBVGK14i5AIxVF8FsYoDGtyezV1q1y3xYiMuORLdhLBXVbzm2crhe0/kG
         eIOjfkuPXJZVbsYangr8yBELcThO0PgKlA7+NDGrXkmdWnrXSSG9p9bwmhRaZkFfUCko
         iKS8SV3J5O+eYbeZTGdnkA1Cpylnco5lSKfZAki3r/MVyPK5/7WYTvPWuLYRCtN3o9m3
         XrKQ==
X-Gm-Message-State: AOAM533WLKvC0lazXBQ0QyPttHU2Yct3o3fZC/ASEdDEP68Aa6K3IlIR
        TELFvk2pEtdtoYTeMGr/93c=
X-Google-Smtp-Source: ABdhPJyokYw2y2eVbQCJXQygo7XRqXrFFte1IP83fHh69z7HweMZUNAD5mbq3Ga7SQWljoZYaPNpeA==
X-Received: by 2002:a17:902:6942:: with SMTP id k2mr33125240plt.133.1643862177366;
        Wed, 02 Feb 2022 20:22:57 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:56 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 4/7] tools: gpioget: Add by-name support
Date:   Thu,  3 Feb 2022 14:51:31 +1030
Message-Id: <20220203042134.68425-5-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow users to get the values of gpios by passing the gpio name. The
gpipchip is not specified, instead it is discovered using the same
method as gpiofind.

 $ gpioget --by-name switch-state
 1

 $ gpioget --by-name led-fault led-identify led-attention
 1 0 1

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpioget.c | 57 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 16 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 51cecb6a18a9..9d2c82b0d64b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -15,15 +15,18 @@ static const struct option longopts[] = {
 	{ "active-low",	no_argument,		NULL,	'l' },
 	{ "dir-as-is",	no_argument,		NULL,	'n' },
 	{ "bias",	required_argument,	NULL,	'B' },
+	{ "by-name",	no_argument,		NULL,	'N' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlnB:";
+static const char *const shortopts = "+hvlnB:N";
 
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...\n",
 	       get_progname());
+	printf("       %s [OPTIONS] -L <line name1> <line name2> ...\n",
+	       get_progname());
 	printf("\n");
 	printf("Read line value(s) from a GPIO chip\n");
 	printf("\n");
@@ -34,6 +37,7 @@ static void print_help(void)
 	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
+	printf("  -N, --by-name:\tget line by name. All lines must be from the same gpiochip\n");
 	printf("\n");
 	print_bias_help();
 }
@@ -46,7 +50,8 @@ int main(int argc, char **argv)
 	unsigned int *offsets, i, num_lines;
 	struct gpiod_line_bulk *lines;
 	struct gpiod_chip *chip;
-	char *device, *end;
+	bool by_name = false;
+	char *end;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -69,6 +74,9 @@ int main(int argc, char **argv)
 		case 'B':
 			flags |= bias_flags(optarg);
 			break;
+		case 'N':
+			by_name = true;
+			break;
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -79,30 +87,47 @@ int main(int argc, char **argv)
 	argc -= optind;
 	argv += optind;
 
-	if (argc < 1)
-		die("gpiochip must be specified");
+	if (by_name) {
+		if (argc < 1)
+			die("at least one line name must be specified");
+
+		/* line0 line1 ... lineN */
+		num_lines = argc;
 
-	if (argc < 2)
-		die("at least one GPIO line offset must be specified");
+		chip = chip_by_line_name(argv[0]);
+		if (!chip)
+			die("unable to find gpiochip");
+	} else {
+		/* gpiochip offset0 offset1 ... offsetN */
+		if (argc < 1)
+			die("gpiochip must be specified");
 
-	device = argv[0];
-	num_lines = argc - 1;
+		if (argc < 2)
+			die("at least one GPIO line offset must be specified");
+
+		chip = chip_open_lookup(argv[0]);
+		if (!chip)
+			die_perror("unable to open %s", argv[0]);
+
+		argv++;
+		num_lines = argc - 1;
+	}
 
 	values = malloc(sizeof(*values) * num_lines);
 	offsets = malloc(sizeof(*offsets) * num_lines);
 	if (!values || !offsets)
 		die("out of memory");
 
-	for (i = 0; i < num_lines; i++) {
-		offsets[i] = strtoul(argv[i + 1], &end, 10);
-		if (*end != '\0' || offsets[i] > INT_MAX)
-			die("invalid GPIO offset: %s", argv[i + 1]);
+	if (by_name) {
+		line_names_to_offsets(chip, argv, offsets, NULL, num_lines);
+	} else {
+		for (i = 0; i < num_lines; i++) {
+			offsets[i] = strtoul(argv[i], &end, 10);
+			if (*end != '\0' || offsets[i] > INT_MAX)
+				die("invalid GPIO offset: %s", argv[i]);
+		}
 	}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
-		die_perror("unable to open %s", device);
-
 	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
 	if (!lines)
 		die_perror("unable to retrieve GPIO lines from chip");
-- 
2.34.1

