Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CAE765DCA
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 23:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjG0VLw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 17:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjG0VLv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 17:11:51 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8736C30DC
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:11:21 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686c06b806cso1121224b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690492281; x=1691097081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cz6/oxlQDdxQ3bLSUB61Oycyqv81ti7+uXuUVUkiwhI=;
        b=fFc04WHKghtkx9iSXgKOJRanGbclksIOT3b4t7bkzhTW4fQN7Fp3u9WNdKkOX1H9Hg
         yte01gck1KdPhfkEzSFncBurGweDm1cbGPgGEF6+DY4/y2K8zUKMFziFIXGl8wsJ9zFZ
         39YSYi85YFjdNTxzJ8D+P1q2r//7dwlqHoSKNAlB7ODRvW/+KSmpUywDt3rHrhwxDxU0
         TS1csYflKX9bnYlOmdX1OQKkD0eq5fxnX1v+/JsWOdU1WM5GXPXX3PXd+5U7Tb1LHE3z
         iAKCFAKOeOUQCqWVaREVSU8EYyY1s3bv43aTqOijS4JL4E713VqJpHzRmny4im5IATzr
         0oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690492281; x=1691097081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cz6/oxlQDdxQ3bLSUB61Oycyqv81ti7+uXuUVUkiwhI=;
        b=fl/jpXFvc2x/CBgAKbeqzW5aJquqXJTZRWdJLXoNAY5NU7nzcytQ/p0v6ufEx9GVIA
         KYS/2ameX/RN0ihuMfZzyEaih8bYPkZvdgSfBWZVW/87bJuYqeUQP6oClVJOrCMOoSx2
         Uqq5QY57PyUh3RzFwSMDW2ojW0PCvAprylOLVn53YFM9s2AEEYj6lucA9nP3VBtV+3xP
         5lflLMv8UkG1fNBGwORJPfq4j5QKoMsolWoqPFx9Am+21f3KWmg51eBv8PHulOXqteb8
         an7xCPz4Zfa7zBquGEerNnrPtz7cn5uC5wUlL5DSz+Kdc92L8mbBo8z0qhvjYQOYsueT
         MAVA==
X-Gm-Message-State: ABy/qLbYJ0rcdzwS5RjEX15wBEen5AOnkpaCqN8IVg0v2TWqtB+u0MX7
        D0x7iZNVNV+QlflkK8Cr+Tv0K/ySFtk=
X-Google-Smtp-Source: APBJJlFWZ2LCv+zNJG1hDTgbYqskN06tjeQs4GXQr1bpxVhcmsAykrDrVpk/o9Myzmbct3Hf9kVnYg==
X-Received: by 2002:a05:6a20:9493:b0:13b:a4fd:3017 with SMTP id hs19-20020a056a20949300b0013ba4fd3017mr230424pzb.46.1690492280645;
        Thu, 27 Jul 2023 14:11:20 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a002000000b00563ff7d9c4bsm1817115pge.73.2023.07.27.14.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:11:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] examples: simplify find_line_by_name
Date:   Fri, 28 Jul 2023 05:10:56 +0800
Message-ID: <20230727211056.19187-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
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

Simplify the find_line_by_name example by using
gpiod_chip_get_line_offset_from_name() rather than iterating over each
line in a chip.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/find_line_by_name.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/examples/find_line_by_name.c b/examples/find_line_by_name.c
index 16d2c4c..87b66ac 100644
--- a/examples/find_line_by_name.c
+++ b/examples/find_line_by_name.c
@@ -69,12 +69,9 @@ int main(void)
 	static const char *const line_name = "GPIO19";
 
 	struct gpiod_chip_info *cinfo;
-	struct gpiod_line_info *linfo;
-	unsigned int j, num_lines;
 	struct gpiod_chip *chip;
 	char **chip_paths;
-	const char *name;
-	int i, num_chips;
+	int i, num_chips, offset;
 
 	/*
 	 * Names are not guaranteed unique, so this finds the first line with
@@ -85,26 +82,20 @@ int main(void)
 		chip = gpiod_chip_open(chip_paths[i]);
 		if (!chip)
 			continue;
+
+		offset = gpiod_chip_get_line_offset_from_name(chip, line_name);
+		if (offset == -1)
+			goto close_chip;
+
 		cinfo = gpiod_chip_get_info(chip);
 		if (!cinfo)
-			continue;
+			goto close_chip;
 
-		num_lines = gpiod_chip_info_get_num_lines(cinfo);
-		for (j = 0; j < num_lines; j++) {
-			linfo = gpiod_chip_get_line_info(chip, j);
-			if (!linfo)
-				continue;
-			name = gpiod_line_info_get_name(linfo);
-			if (name && (strcmp(line_name, name) == 0)) {
-				printf("%s: %s %d\n", line_name,
-				       gpiod_chip_info_get_name(cinfo), j);
-				return EXIT_SUCCESS;
-			}
-
-			gpiod_line_info_free(linfo);
-		}
+		printf("%s: %s %d\n", line_name,
+				       gpiod_chip_info_get_name(cinfo), offset);
+		return EXIT_SUCCESS;
 
-		gpiod_chip_info_free(cinfo);
+close_chip:
 		gpiod_chip_close(chip);
 	}
 
-- 
2.41.0

