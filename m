Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57EBB4A7E9E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349286AbiBCEXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:23:01 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55127C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:23:01 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d187so1151784pfa.10
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pph8jDBQpM0nxeaoZ8APOI6SBLcJBTZ+vZr5mm8mwYw=;
        b=dy4/IL2fmcddqVj+HMDh28HQGkNx+1YYb+3yfo5caI1eM879OYAGX6t+xtDgAz4QGy
         qd8kr12ecwrgKAHICYYdfUow15HSFP10vrHimb+68E0EMr/KNRO8/PS36xRBWQ1Tkyer
         jKAy/UAngweagi1Bm3bCtJPwb+vW2tl6JkSPC3uMF2yflZYZgFKhfrlLNaKVGIkc6XpD
         t6K0b9C9n4i049e0/op1ZG7bXqjLvpjniHs3/oS692DrvzhQjKeCA4zmRsgDZiRdIFQZ
         ax6gqPE/KqCyIiGkQyOpsObHdzZdSihj8jQGOljogyJLZiMzgWyIvfagcPubjOP3iE/+
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pph8jDBQpM0nxeaoZ8APOI6SBLcJBTZ+vZr5mm8mwYw=;
        b=Da3CaoUxp5eB5aZKCHkxQ1df0vXOWLYvntd54zpSC8jLDLsY0/GFy7sIhSyYpckHLv
         OPtZpGIpjoi5V+CphwTzU+VzGHFe5G88qLMDheQ02wDQk6Y6RyjUATC+wJxPeRHltBs2
         0rQX1deBrpQ4dtlvnjcjw8Hcf+4qmmvWhVtSPsj6xIc1bDw70uLy6oW4ATPR8nbpaT3b
         Ig0mVgeOwysCb+4vKcZj8Fbf6bPAusIV4gNn+JB9Aj/P3vHPvcanx7p3IDQ9uu9kwfxt
         Al1xldCIaSX6VsGpmbFhnQKYvUesbIUXUGiwK9nj3xUpIjOl7tPSSP4YBFDyF6OkkcLP
         8b8A==
X-Gm-Message-State: AOAM533RDCTIJC0TozwxrJVGAmh3K6IgLNxcm4mzkb8v9PQxoDzKvd1w
        qWp9KAUUENbXUpZHd3mZCqY=
X-Google-Smtp-Source: ABdhPJwE91EI5exa8JWlsP2lShtbaHr73UJJKci59z7TjJ8EcfGXt+YaUmcUDFmquhY7aKQXCGhYsw==
X-Received: by 2002:a05:6a00:1891:: with SMTP id x17mr32728622pfh.73.1643862180769;
        Wed, 02 Feb 2022 20:23:00 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:59 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 5/7] tools: gpioset: Add by-name support
Date:   Thu,  3 Feb 2022 14:51:32 +1030
Message-Id: <20220203042134.68425-6-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow users to set the values of gpios by passing the gpio name. The
gpipchip is not specified, instead it is discovered using the same
method as gpiofind.

 $ gpioset  --mode=wait --by-name cfam-reset=1

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpioset.c | 68 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7882b53bab41..fe3e1c246c89 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -23,15 +23,18 @@ static const struct option longopts[] = {
 	{ "sec",		required_argument,	NULL,	's' },
 	{ "usec",		required_argument,	NULL,	'u' },
 	{ "background",		no_argument,		NULL,	'b' },
+	{ "by-name",		no_argument,		NULL,	'N' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:D:m:s:u:b";
+static const char *const shortopts = "+hvlB:D:m:s:u:bN";
 
 static void print_help(void)
 {
 	printf("Usage: %s [OPTIONS] <chip name/number> <offset1>=<value1> <offset2>=<value2> ...\n",
 	       get_progname());
+	printf("       %s [OPTIONS] -L <line name1> <line name2> ...\n",
+	       get_progname());
 	printf("\n");
 	printf("Set GPIO line values of a GPIO chip and maintain the state until the process exits\n");
 	printf("\n");
@@ -48,6 +51,7 @@ static void print_help(void)
 	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
 	printf("  -u, --usec=USEC:\tspecify the number of microseconds to wait (only valid for --mode=time)\n");
 	printf("  -b, --background:\tafter setting values: detach from the controlling terminal\n");
+	printf("  -N, --by-name:\tset line by name. All lines must be from the same gpiochip\n");
 	printf("\n");
 	print_bias_help();
 	printf("\n");
@@ -195,7 +199,8 @@ int main(int argc, char **argv)
 	struct gpiod_line_bulk *lines;
 	struct callback_data cbdata;
 	struct gpiod_chip *chip;
-	char *device, *end;
+	bool by_name = false;
+	char *end;
 
 	memset(&cbdata, 0, sizeof(cbdata));
 
@@ -239,6 +244,9 @@ int main(int argc, char **argv)
 		case 'b':
 			cbdata.daemonize = true;
 			break;
+		case 'N':
+			by_name = true;
+			break;
 		case '?':
 			die("try %s --help", get_progname());
 		default:
@@ -257,37 +265,57 @@ int main(int argc, char **argv)
 	    cbdata.daemonize)
 		die("can't daemonize in this mode");
 
-	if (argc < 1)
-		die("gpiochip must be specified");
+	if (by_name) {
+		char *line_name;
+
+		if (argc < 1)
+			die("at least one line name must be specified");
+
+		line_name = split_line(argv[0]);
+		chip = chip_by_line_name(line_name);
+		if (!chip)
+			die("unable to find '%s' on a gpiochip", line_name);
+
+		free(line_name);
 
-	if (argc < 2)
-		die("at least one GPIO line offset to value mapping must be specified");
+		num_lines = argc;
+	} else {
+		if (argc < 1)
+			die("gpiochip must be specified");
 
-	device = argv[0];
+		if (argc < 2)
+			die("at least one GPIO line offset to value mapping must be specified");
 
-	num_lines = argc - 1;
+
+		chip = chip_open_lookup(argv[0]);
+		if (!chip)
+			die_perror("unable to open %s", argv[0]);
+
+		num_lines = argc - 1;
+		argv++;
+	}
 
 	offsets = malloc(sizeof(*offsets) * num_lines);
 	values = malloc(sizeof(*values) * num_lines);
 	if (!values || !offsets)
 		die("out of memory");
 
-	for (i = 0; i < num_lines; i++) {
-		rv = sscanf(argv[i + 1], "%u=%d", &offsets[i], &values[i]);
-		if (rv != 2)
-			die("invalid offset<->value mapping: %s", argv[i + 1]);
+	if (by_name) {
+		line_names_to_offsets(chip, argv, offsets, values, num_lines);
+	} else {
+		for (i = 0; i < num_lines; i++) {
+			rv = sscanf(argv[i], "%u=%d", &offsets[i], &values[i]);
+			if (rv != 2)
+				die("invalid offset<->value mapping: %s", argv[i + 1]);
 
-		if (values[i] != 0 && values[i] != 1)
-			die("value must be 0 or 1: %s", argv[i + 1]);
+			if (values[i] != 0 && values[i] != 1)
+				die("value must be 0 or 1: %s", argv[i]);
 
-		if (offsets[i] > INT_MAX)
-			die("invalid offset: %s", argv[i + 1]);
+			if (offsets[i] > INT_MAX)
+				die("invalid offset: %s", argv[i]);
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

