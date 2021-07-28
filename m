Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9603D976F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 23:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhG1VTX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 17:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbhG1VTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 17:19:22 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E41AC061757
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 14:19:20 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id da26so5157001edb.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=1IKGI1GUQsgXCTeYN+XBzQSjEYoJPSerWkPGhzqx4cs=;
        b=F1DDDOsy7uLNdOiRs/UaIf4fl1cXmKM4FDCkFqCq64wlC9/FgmVtHrito/YPLbvmXb
         +76LhXCw9AzMyaytP0YN6y0Nca2YNL2NKbtw7fqv5TBN8LNfGXKvqHtv9XOaCeLjHSab
         q+phBS7/3r2VZ/XKPz48FKcZbDyM00c+Papo0cOxmvTXz6k10I9EqZomIdBDNR/7GD/I
         SEffhLoYNxpdeuXEIvpE7l+3zXQjALLuEKY1cRcQy9WmMv71H+a9EdMtkSny+ebo82ft
         uBiHOX4aX+0qRIydWBSHbGyTsUvHy1CITLH1P7zdMqLiQjGgZRfDmAOfARsZXfJ/wMvp
         cLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1IKGI1GUQsgXCTeYN+XBzQSjEYoJPSerWkPGhzqx4cs=;
        b=SoPfW7Zj+BA8nENDFGrYeBu6rUCDCKiTYmaK6sNZgGuh4q3OaSnA9qDnkMJsnUg2NU
         Q1tC1O7eEFJBXGuhOjFVN/X+4opsH3C914wdVw6y/wRPHS8g2SwD2APU9sU4849PsG+D
         Hgc8ZxUdyoy6km6ifGZ+necCSnd9x30SddJgeXu0uTZ0yDgyqt+Ylo9harRy8n/F8df+
         WPduH3PBSZX2My6D/D0KnaIBEPDRhnFlwwzF9HPQXsnf10dBj93lSNqdmI/Dx4/QyqLH
         5lxqULBCwkEvvG5czlL1jsLJ1OPtkhvr482gUdN43S1EeDroJIfbPe/H5vtKIvVFY7HR
         lAqw==
X-Gm-Message-State: AOAM530ZKNZrCB2X//DFJGot4lji/bUBLTg3xb95agnUdg4oFS578xO+
        t2Nmfu5ygK4PhlnDNnNR7xYkCgVpcoWZig==
X-Google-Smtp-Source: ABdhPJwzDXfGF8VM7R9qF79PxThd2Dpmu70FhVTZLiN6fAzfMFMxrHRFO0FLGyngj3AG5NwgqWLXCw==
X-Received: by 2002:aa7:c542:: with SMTP id s2mr2202860edr.41.1627507159125;
        Wed, 28 Jul 2021 14:19:19 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id m26sm367742edf.4.2021.07.28.14.19.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 14:19:18 -0700 (PDT)
Date:   Wed, 28 Jul 2021 23:19:17 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod-v2] tools: Restore support for opening chips by label
Message-ID: <20210728211916.GB14442@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support for opening chips by label was removed because labels
are not necessarily unique and lookup by label requires opening
every GPIO device.

I don't think these concerns apply to the tools.  They will normally
be run by root, and if a label is specified it's because it's known to
be unique.

This adds a chip_open_by_label() function to tools-common.c, which:

1. Scans the /dev/ directory for GPIO devices, and opens each in turn
2. Checks whether the label matches, and that the label isn't used by
   two distinct devices
3. If all devices can be opened and exactly one matches the label,
   return that device

It changes chip_open_lookup() to call chip_open_by_label() as a final
fallback, rather than the previous behaviour.  This should avoid
producing spurious error messages if a tool is run by a user that can
only access a subset of GPIO devices.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 tools/tools-common.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 36724d5..d2665e8 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -4,6 +4,7 @@
 /* Common code for GPIO tools. */
 
 #include <ctype.h>
+#include <dirent.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <libgen.h>
@@ -146,6 +147,66 @@ static struct gpiod_chip *chip_open_by_number(unsigned int num)
 	return chip;
 }
 
+struct gpiod_chip *chip_open_by_label(const char *label)
+{
+	struct gpiod_chip *chip = NULL, *next = NULL;
+	struct dirent **entries;
+	int num_chips, i, error = 0;
+
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+	if (num_chips < 0) {
+		error = errno;
+		fprintf(stderr, "unable to scan /dev: %s\n", strerror(error));
+		goto out;
+	}
+
+	for (i = 0; i < num_chips; i++) {
+		next = chip_open_by_name(entries[i]->d_name);
+		if (!next) {
+			error = errno;
+			fprintf(stderr, "unable to open %s: %s\n",
+				entries[i]->d_name, strerror(error));
+			break;
+		}
+
+		if (chip && !strcmp(gpiod_chip_get_name(chip),
+				    gpiod_chip_get_name(next))) {
+			/* chip and next are actually the same device */
+			gpiod_chip_close(next);
+		} else if (!strcmp(gpiod_chip_get_label(next), label)) {
+			/* label matches; check it's not a duplicate */
+			if (chip) {
+				fprintf(stderr,
+					"multiple chips have the label \"%s\"\n",
+					label);
+				error = EINVAL;
+				break;
+			}
+			chip = next;
+		} else {
+			gpiod_chip_close(next);
+		}
+	}
+
+	if (error) {
+		if (chip)
+			gpiod_chip_close(chip);
+		if (next)
+			gpiod_chip_close(next);
+		chip = NULL;
+	} else if (!chip) {
+		error = ENOENT;
+	}
+
+	for (i = 0; i < num_chips; i++)
+		free(entries[i]);
+	free(entries);
+
+out:
+	errno = error;
+	return chip;
+}
+
 static bool isuint(const char *str)
 {
 	for (; *str && isdigit(*str); str++)
@@ -166,6 +227,8 @@ struct gpiod_chip *chip_open_lookup(const char *device)
 		else
 			chip = gpiod_chip_open(device);
 	}
+	if (!chip)
+		chip = chip_open_by_label(device);
 
 	return chip;
 }
-- 
2.20.1
