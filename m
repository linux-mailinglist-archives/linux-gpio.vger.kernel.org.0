Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB344A7071
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Feb 2022 13:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344058AbiBBMBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 07:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344057AbiBBMBf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 07:01:35 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A45C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 04:01:35 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id 13so17822558qkd.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 04:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sljl6DStCLoSNPaqthXSTe0LKaIkGIm8eYWVpWiA1ao=;
        b=KbNgj2s2UpRRTMzXvOiU0ygDWXGLAD9JdrO4QgIfkeh9xg7WJAWv2koZ97Se15ioql
         DNFaXNvon/VtYRKnwAgj7cqhoPSzGUXKGwOeHa/tN9AiVV1t48kKRmjHJY9uXrbVGC38
         E+/uD1AUAufehDl3lwvj3A0sGCWtzxSdDZK00gW+9ZlRzhTXtO7VOKocPT6H8N46YWGh
         cjDo8Gs+hKdR6msbDuEtKJeHtNbchbXRhXGtJtlzeMSjy8ITFw3r/pd0QRE3VGxuA2m3
         a4MDlAQvZIaPcwP1o5bZ6Hi8NJ4VWgnxSrnhzZZP8MJ6zsv+pXrJcsBgA994FpN4JxES
         Qz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Sljl6DStCLoSNPaqthXSTe0LKaIkGIm8eYWVpWiA1ao=;
        b=XQ4O+nz97jA1ubvW996Vekkqtzgf4a0uP9UNlcjlr8qf1r+oAyAatomgMCqKo8L4mJ
         83BN/HbSrHwUfaZ4jD9Z+AvZXBpKiUUBeSkba0pg2o8jIpEH66+G9Aezd6GqI++GYCDY
         K4/r2oAFhtdId05eyLDWx2ht53KWb+/omKFLcqXLDw6Wvy9QZFFc9aOkzjR6hD9APJ+c
         94vrlWlFfq6W2fWGdB9wbC6UoS5qGdYcSzwoNA+0kKWnXwDdRlXXaLG07+HMXYeaIDWb
         svqRTM7Ym0cGWcueyoBi1HGLCMXTDHLFXoq1Y/6awBdExx4YMO5IXJdCJrFpzVkNOt2K
         hcgQ==
X-Gm-Message-State: AOAM530U7YIZpoMmNupp8yXlLRC52Ju9rAboxzGCJ2OmUDYzy1cMbAYV
        0D4tYHTa+dwkEq8X+/U/pAnblfm2U4s=
X-Google-Smtp-Source: ABdhPJwDMxOGBsKU82VNmDXSJQJeDkdMg5NuvTwIt6Nc9VSllY3s5EglUcgeRLUOQK6bt3eClY6GPw==
X-Received: by 2002:a05:620a:bc3:: with SMTP id s3mr20453177qki.168.1643803293082;
        Wed, 02 Feb 2022 04:01:33 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id y15sm11033394qtx.28.2022.02.02.04.01.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:01:31 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH] gpioinfo: Clean up scandir allocations
Date:   Wed,  2 Feb 2022 22:31:23 +1030
Message-Id: <20220202120123.33727-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

==3017== 176 (80 direct, 96 indirect) bytes in 1 blocks are definitely lost in loss record 2 of 2
==3017==    at 0x483F6C7: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==3017==    by 0x491CE92: ??? (in /lib/libc.so.6)
==3017==    by 0x10AAAC: main (gpioinfo.c:215)

The entires must be freed, and then the array itself.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpioinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 3d8911176281..d50af45dbf35 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -231,7 +231,9 @@ int main(int argc, char **argv)
 			list_lines(chip);
 
 			gpiod_chip_unref(chip);
+			free(entries[i]);
 		}
+		free(entries);
 	} else {
 		for (i = 0; i < argc; i++) {
 			chip = chip_open_lookup(argv[i]);
-- 
2.34.1

