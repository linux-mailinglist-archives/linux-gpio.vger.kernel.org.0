Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662EB70D6A1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbjEWIFm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236267AbjEWIFV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:05:21 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E309B18F
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:04:48 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-253e0edc278so2559579a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684829028; x=1687421028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXxswV9F88lm9yuu4eGkfqqU6VA143P27jOssPy5N0E=;
        b=oLMD/9JXTt1UFnytnZ/1CW9aVhkD9G3UJmKWTjXyIq04cpOWWIHCKbOTTW26bGzWrR
         Ezfj1oVtcDUWSBjGLRKEyA1ttWNwa5zBOlumkeQd3kdAyUzAO9nNaJJWE/nYvgPU2oDV
         XkBdBLp49cSs5hzt/LtkdN6nN8PePUZxoOHl7z95kFZDZJYMonuM7ytvvsmrRmLPsz01
         DA7Bdd5/ahy7+589vKYyoNV/lgAAnAhNggLMLlHGP+rKZRtWwZdxbxkAP3aRuylAX45c
         IoZfskXeFuT1WU1iaoWyiROe6ADwJBWqRYR1gQwsgOprM6tXB/cbsAVngPnKF//58dmM
         +CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684829028; x=1687421028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXxswV9F88lm9yuu4eGkfqqU6VA143P27jOssPy5N0E=;
        b=IOW0NCbEdXytpYUwv+/JvKZXFG82avJGcodgC7wDo6zzMRmltdhL5vmxE1g3SRLvS7
         vTQsABoMYymZjRKjdwFF1xu4mk8RNhkjFGLPYUzfStH5TC0AErAdXB9oqHpw4ftaNUXF
         BbJt12Sg4Q57pjb8F/KBnBB44vYJXq68mY2VD4nmDLTJWHEp2YqAwxDPDKBFh2Mde1QU
         umI5nmCLRVDF0DVdpzMritkgu4AjFMfQW6TrsLUvvr5BMXwI5We4PycRc48YQZINObUK
         UUzT4UBK33kfEYtOhDB51FcND6h9gRwz7f2xhtR9+dmX41nF7cRmVmHoiqIrPTaU6tBC
         5azw==
X-Gm-Message-State: AC+VfDw65NmOOsfQsWMtEdJ8L/jvYlT3VdbYkEEYhAaaGCRU4H9+bLdC
        8hMMb/IlDD6Vf9Z+jfethwSGNRHZhaQ=
X-Google-Smtp-Source: ACHHUZ6hvsgUsiPhyY3tMXfYn/IYTDjoadyYEniFvbA5D8U8Q85Hm0ChV8jnnCWyhNgUnpNP8RRgQQ==
X-Received: by 2002:a17:90a:c912:b0:255:47fd:9ab4 with SMTP id v18-20020a17090ac91200b0025547fd9ab4mr7492682pjt.10.1684829028016;
        Tue, 23 May 2023 01:03:48 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id 19-20020a631653000000b0050376cedb3asm5379470pgw.24.2023.05.23.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 01:03:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2] README: provide more info in Contributing
Date:   Tue, 23 May 2023 16:03:34 +0800
Message-Id: <20230523080334.38971-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
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

Add more detail to Contributing to make it easier for new users to
contribute.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
Changes v1 -> v2:
 - add more info on the mailing list and archive.

 README | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/README b/README
index b71739e..85b6300 100644
--- a/README
+++ b/README
@@ -275,8 +275,26 @@ were selected and help2man is available in the system.
 CONTRIBUTING
 ------------
 
-Contributions are welcome - please send patches and bug reports to
-linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail subject
-line) and stick to the linux kernel coding style when submitting new code.
+Contributions are welcome - please send questions, patches and bug reports
+to the linux-gpio mailing list[2] by e-mailing to linux-gpio@vger.kernel.org
+(add the [libgpiod] prefix to the e-mail subject line).
+Note that the mailing list quietly drops HTML formatted e-mail, so be sure
+to send plain text[3].
+
+Code submissions should stick to the linux kernel coding style[4] and
+follow the kernel patch submission process[5] as applied to the libgpiod
+source tree.
+
+The mailing list archive[6] contains all the historical mails to the list,
+and is the place to check to ensure your e-mail has been received.
+Search for "libgpiod" to filter the list down to relevant messages.
+Those also provide examples of the expected formatting.
+Allow some time for your e-mail to propagate to the list before retrying,
+particularly if there are no e-mails in the list more recent than yours.
 
 [1] https://github.com/bats-core/bats-core
+[2] http://vger.kernel.org/vger-lists.html#linux-gpio
+[3] https://docs.kernel.org/process/email-clients.html
+[4] https://docs.kernel.org/process/coding-style.html
+[5] https://docs.kernel.org/process/submitting-patches.html
+[6] https://lore.kernel.org/linux-gpio/
-- 
2.40.1

