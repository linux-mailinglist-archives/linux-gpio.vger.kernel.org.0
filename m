Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD8A7437ED
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 11:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjF3JJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 05:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjF3JJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 05:09:11 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AAB2D71
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:09:09 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-53fa455cd94so904922a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688116149; x=1690708149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86Dm02Lc1fWdVHbn2dAYzx0DA/szm4/07ip/o27pNvs=;
        b=E06geDUAHAOe/DmbCttyNgkO+NVmvG0f+NWEoHh7i1qu9AfwTAsniVbwtu26sp7QMs
         j3A005B0y31bnADOlKCasN+g0rUBsU/a0kz5LW8rwDUsxaAiRkHORcvakrKjykeqYccz
         be2jNHFYJeWNCpMBy/fWVgxGrjmhUEsFsW6NMNpPwRsv67KuVbizwXnzEVmvkTr4IJ0p
         2oIV+XGXfDB0FqnyChv1ebiMtJ9FMVAdEPw52fzqMOc4L5L+SDFMhuLEZSKm/gpI/HNV
         3P3HDs5p6nyChV8aosAbYMI8JhC1dusHmpRnveiuEYSEIqltXsJdIcvUMv8o1bI54j7L
         5eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688116149; x=1690708149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86Dm02Lc1fWdVHbn2dAYzx0DA/szm4/07ip/o27pNvs=;
        b=YGhmtYLD228oRdslrITasUtgMJH9aVAxdFUL1pNFlYqW5gJwz0A4+xR0+kOBLNZdmC
         DAiOiB36mjOJZqdJc9H7hOGQq0oa8TDOZFLcl+3VobOKTu2pKaH0SdU9pNufozLAdknt
         j1Ufx2haBCLd9kXILWJb+RGl31jWzN55MTByd/5RSgIEA2PEj58h/JjAqG6zfCnhNgjK
         O1KQ+rr1pWPaTeJAAfceypKYafAyd0sJicI70nOkejFcR+zDggYSDAPdu/tYjMBrw+Nh
         /Hx+yPWJ+fe6E64BRaefa2PZDB3osGqGemHsxJjEHlHh5ZukD/zQQmOtQIPN1y5joErL
         qB8Q==
X-Gm-Message-State: AC+VfDyEHj0G0/7gOmfR3ch/M+CUdpl3IVK+qRQeZ1I/mof0zvf/1x0p
        xHX/cPIHKcboncdfqx6pIxRLtb8HdSw=
X-Google-Smtp-Source: ACHHUZ7EYVn42btYMllULl0sWjJsft1/HGHrymPWC2AQmitUPRcDfbv4Lr/OTwxefuUz2WcTSEwvig==
X-Received: by 2002:a05:6a20:4986:b0:11a:2908:bb5c with SMTP id fs6-20020a056a20498600b0011a2908bb5cmr1415320pzb.28.1688116149169;
        Fri, 30 Jun 2023 02:09:09 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l16-20020a170902f69000b001acad86ebc5sm5709650plg.33.2023.06.30.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 02:09:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] core: examples: fix warning for u64 formatting on 32bit
Date:   Fri, 30 Jun 2023 17:08:57 +0800
Message-ID: <20230630090858.37485-1-warthog618@gmail.com>
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

The watch_line_info example prints the u64 timestamps using "%ld" which
produces a warning for 32bit.  Replace it with PRIu64.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/watch_line_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/examples/watch_line_info.c b/examples/watch_line_info.c
index 1879a62..9df3121 100644
--- a/examples/watch_line_info.c
+++ b/examples/watch_line_info.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 #include <gpiod.h>
+#include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -63,7 +64,7 @@ int main(void)
 
 		info = gpiod_info_event_get_line_info(event);
 		timestamp_ns = gpiod_info_event_get_timestamp_ns(event);
-		printf("line %3d: %-9s %ld.%ld\n",
+		printf("line %3d: %-9s %" PRIu64 ".%" PRIu64 "\n",
 		       gpiod_line_info_get_offset(info), event_type(event),
 		       timestamp_ns / 1000000000, timestamp_ns % 1000000000);
 
-- 
2.41.0

