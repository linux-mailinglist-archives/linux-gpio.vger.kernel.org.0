Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0C646485A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 08:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhLAHcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 02:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhLAHcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 02:32:42 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8390AC061574
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 23:29:22 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id m24so16982719pls.10
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 23:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34CQrpmObFWgYWG5f2qri0mSsV2E0kD3uAVNw6BDqHQ=;
        b=pW1e1atCcxz9t1vXRi5evKKKpGBg0v3+T63VK75k1RlczsnhiC65dWQoJRomhwR0UO
         eCTw425CD4zvMBDwFORqxowYtzVB5smpvxO9QVRhz+P/ODSdhvPBRhcQeBBxLta6Ei31
         c+ZiLt5ZOP1p97Lx6rjkFl8sqTopDgUnFQhtNckAa0XH+AsrUbk4fmV+ohsn8ucl1/qz
         MG4bzTw73SC/Gp+U6iuJR7/y6CmKEmDAwq2QCXLn3ls1ImliSs17GhiO1IXhftyM+0f8
         yC5ig/ox79ESxEXvR1oiOgrrP2xlyFXXvp71tWgMOwnBv4RGlwkdwrBsqv/oTzZ2VYeZ
         mx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=34CQrpmObFWgYWG5f2qri0mSsV2E0kD3uAVNw6BDqHQ=;
        b=ABknuMAbVo6ly5Klu3C8b1mM1+RyLoBJ9dmvpFBJAPZwgvBaP6qZhlCaRAoALwxVXW
         dXkyHKGTi4JHDCtoB3cIw8GaWe68cexiWmimIOjJ7qYPtLseim6dt6+O+fdb8Evo5GeP
         lEaYiPm8PGAqrACSth5WXHSItjwElSkwJbWwdvjHmjr/y1KuBVYjz5f20k5fqsQhAgWf
         m9ASGX/h9WxOEeqw4ZJG2oPcf2HBOCN0Qh81WiXUM5X7HnaS8BYyX2Hsi+h+DA8Yjtc+
         inMCXSciz3mngScGgR5APILhS3pxeWAPNdNNXS16jxi0PxejISbrv9a4CI5YO9mU11Kq
         fLQA==
X-Gm-Message-State: AOAM5321h0JpoS1HlHGS6RCSl/xAitu8tyyM3XGHZ5k4pf4rbckAmIPV
        3FcCG0+KM38J9YEK6i2wP3eTDlziMOeEbQ==
X-Google-Smtp-Source: ABdhPJyPyb5A+8RZ+Tax2bAYWkmMtMth2QaizTkRY/9CrizxLBWYcdGuFNG1FqbavZf7KxVWbo+XRA==
X-Received: by 2002:a17:90a:be0c:: with SMTP id a12mr5430527pjs.204.1638343761375;
        Tue, 30 Nov 2021 23:29:21 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id u22sm25438241pfk.148.2021.11.30.23.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 23:29:20 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
Date:   Wed,  1 Dec 2021 17:59:02 +1030
Message-Id: <20211201072902.127542-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Systems provide line names to make using GPIOs easier for userspace. Use
this feature to make the tools user friendly by adding the ability to
show the state of a named line.

 $ gpioget --line-name power-chassis-good
 1

 $ gpioget -L pcieslot-power
 0

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
While users do have the ability to chain together gpioinfo and gpioget,
this is less discoverable for people new to the tools, and harder to
explain to eg. technicians, and requires more typing.

Please consider this enhancement. If you are happy with it I can send
a patch for gpioset too.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpioget.c | 86 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 22 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 51cecb6a18a9..cd27320b7f2b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -6,6 +6,7 @@
 #include <limits.h>
 #include <stdio.h>
 #include <string.h>
+#include <errno.h>
 
 #include "tools-common.h"
 
@@ -18,7 +19,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlnB:";
+static const char *const shortopts = "+hvlnB:L:";
 
 static void print_help(void)
 {
@@ -34,6 +35,7 @@ static void print_help(void)
 	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
+	printf("  -L, --line-name:\tUse this GPIO line (instead of chip name and offset)\n");
 	printf("\n");
 	print_bias_help();
 }
@@ -47,6 +49,7 @@ int main(int argc, char **argv)
 	struct gpiod_line_bulk *lines;
 	struct gpiod_chip *chip;
 	char *device, *end;
+	char *name = NULL;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -69,8 +72,13 @@ int main(int argc, char **argv)
 		case 'B':
 			flags |= bias_flags(optarg);
 			break;
+		case 'L':
+			name = optarg;
+			num_lines = 1;
+			break;
 		case '?':
 			die("try %s --help", get_progname());
+			break;
 		default:
 			abort();
 		}
@@ -79,30 +87,64 @@ int main(int argc, char **argv)
 	argc -= optind;
 	argv += optind;
 
-	if (argc < 1)
-		die("gpiochip must be specified");
-
-	if (argc < 2)
-		die("at least one GPIO line offset must be specified");
-
-	device = argv[0];
-	num_lines = argc - 1;
-
-	values = malloc(sizeof(*values) * num_lines);
-	offsets = malloc(sizeof(*offsets) * num_lines);
-	if (!values || !offsets)
-		die("out of memory");
+	if (name) {
+		struct dirent **entries;
+		unsigned int num_chips;
+		int offset, n;
+
+		n = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+		if (n < 0)
+			die_perror("unable to scan /dev");
+		num_chips = n;
+
+		values = malloc(sizeof(*values) * 1);
+		offsets = malloc(sizeof(*offsets) * 1);
+		if (!values || !offsets)
+			die("out of memory");
+
+		for (i = 0; i < num_chips; i++) {
+			device = entries[i]->d_name;
+			chip = chip_open_by_name(device);
+			if (!chip) {
+				if (errno == EACCES)
+					continue;
+
+				die_perror("unable to open %s", device);
+			}
+			offset = gpiod_chip_find_line(chip, name);
+			if (offset >= 0) {
+				offsets[0] = offset;
+				break;
+			}
+		}
+		if (i == num_chips)
+			die("unable to find line '%s'", name);
+	} else {
+		if (argc < 1)
+			die("gpiochip must be specified");
+
+		if (argc < 2)
+			die("at least one GPIO line offset must be specified");
+
+		device = argv[0];
+		num_lines = argc - 1;
+
+		values = malloc(sizeof(*values) * num_lines);
+		offsets = malloc(sizeof(*offsets) * num_lines);
+		if (!values || !offsets)
+			die("out of memory");
+
+		for (i = 0; i < num_lines; i++) {
+			offsets[i] = strtoul(argv[i + 1], &end, 10);
+			if (*end != '\0' || offsets[i] > INT_MAX)
+				die("invalid GPIO offset: %s", argv[i + 1]);
+		}
 
-	for (i = 0; i < num_lines; i++) {
-		offsets[i] = strtoul(argv[i + 1], &end, 10);
-		if (*end != '\0' || offsets[i] > INT_MAX)
-			die("invalid GPIO offset: %s", argv[i + 1]);
+		chip = chip_open_lookup(device);
+		if (!chip)
+			die_perror("unable to open %s", device);
 	}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
-		die_perror("unable to open %s", device);
-
 	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
 	if (!lines)
 		die_perror("unable to retrieve GPIO lines from chip");
-- 
2.33.0

