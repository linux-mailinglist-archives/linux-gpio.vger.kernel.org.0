Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879A073C6E7
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 07:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjFXFV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 01:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjFXFVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 01:21:25 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594182703
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:24 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-763e1a22a68so136491885a.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584083; x=1690176083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeO/fSjwOcNHte1KOPNT2lkhwp7i8fzWFDqSWAjDNis=;
        b=BO2dE+se2TCxQvHeNKSl1vxmvShUVK4GmWPT6MtFbP75LPD4z4bKMzrJxKJeYrDCw2
         EutbGKszyc1czTzwgTLl4UZZ3xtDqpZk2/UO/z7oSzssyf24jiP7WwglM2DUfTs3HN58
         AwL7UKKQ+bwPA32tywI0AbaFwiPbuXEtXNtMi6zxCwXojl1BCORTBz9TWgmjHp5rnrfp
         nMSRy72WU+X6bKi+q+q3vcrNHw7/1XwH6ylfJVFvmBGvEvgiCCWONz6OoAOYkbHH/odD
         LpAKVChFokqgJn7MSn73Tr5WoE4rei0bezrl031fKdxmNQZCkTQZt5F7+Nt82HBmEIo2
         LNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584083; x=1690176083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeO/fSjwOcNHte1KOPNT2lkhwp7i8fzWFDqSWAjDNis=;
        b=JULnFRpHYIiJMdu9f+fExjoKNHaTCxuH6kyzAHy029MkeXoG9vgLfLQy6EsIe23Nf/
         bBOlgodwLl5cKRceJ5mMy6zPxQuTGaF5Me9XjZC9C8NNtuWfv8Sr+s9GLvbKX7aTbAoc
         su+amTwbsoVZTupfo0M+w5vgvb8aOvBRXmqYilWH5Pn8w+r7GCLDFm1kt+bPsB6G8mgk
         4EM0cgWwh/C5BVKzaS+o3wNO+zPPdUryz5RPKuBfBI8VBGrNyIJky95LvgGCnLSW+02U
         GUTAOLRePPHNtFN7yVYGXpuCpSpcTE/DzStD9KwXX984eyjKCA56j+++b7GpdDZHmKKX
         Y4Rw==
X-Gm-Message-State: AC+VfDziLT5PNSlFxZWAToA58uM+OCOKMhBzFJ3YI+G1cAiS0xMkuAES
        5UyAl3a/Lt64oy1ZqSdx0uD867WOU9o=
X-Google-Smtp-Source: ACHHUZ5+ZAx1qqz/iAJXlf8APvbJ/qilc4my/ve1EqrVpN2+f+T5PZ4h9TN8pBxOsBeBhfIbH0tmLg==
X-Received: by 2002:a05:620a:4154:b0:762:27b:894c with SMTP id k20-20020a05620a415400b00762027b894cmr17907629qko.8.1687584083255;
        Fri, 23 Jun 2023 22:21:23 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm487103pjb.49.2023.06.23.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:21:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/4] core: examples: fix file comments
Date:   Sat, 24 Jun 2023 13:20:52 +0800
Message-ID: <20230624052054.13206-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230624052054.13206-1-warthog618@gmail.com>
References: <20230624052054.13206-1-warthog618@gmail.com>
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

Some of the file comments are cut-and-paste errors, so replace them
with the correct comment.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/async_watch_line_value.c      | 2 +-
 examples/get_multiple_line_values.c    | 2 +-
 examples/reconfigure_input_to_output.c | 5 ++++-
 examples/watch_multiple_line_values.c  | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/examples/async_watch_line_value.c b/examples/async_watch_line_value.c
index f35fb1a..8b1d643 100644
--- a/examples/async_watch_line_value.c
+++ b/examples/async_watch_line_value.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
-/* Minimal example of asynchronously watching for edges on a single line */
+/* Minimal example of asynchronously watching for edges on a single line. */
 
 #include <errno.h>
 #include <gpiod.h>
diff --git a/examples/get_multiple_line_values.c b/examples/get_multiple_line_values.c
index b16c570..c6df3f6 100644
--- a/examples/get_multiple_line_values.c
+++ b/examples/get_multiple_line_values.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
-/* Minimal example of reading a single line. */
+/* Minimal example of reading multiple lines. */
 
 #include <errno.h>
 #include <gpiod.h>
diff --git a/examples/reconfigure_input_to_output.c b/examples/reconfigure_input_to_output.c
index e8fbb1c..abfaf79 100644
--- a/examples/reconfigure_input_to_output.c
+++ b/examples/reconfigure_input_to_output.c
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
-/* Minimal example of reading a single line. */
+/* 
+ * Example of a bi-directional line requested as input and then switched
+ * to output.
+ */
 
 #include <errno.h>
 #include <gpiod.h>
diff --git a/examples/watch_multiple_line_values.c b/examples/watch_multiple_line_values.c
index 8015270..e955b2c 100644
--- a/examples/watch_multiple_line_values.c
+++ b/examples/watch_multiple_line_values.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
-/* Minimal example of watching for edges on a single line. */
+/* Minimal example of watching for edges on multiple lines. */
 
 #include <errno.h>
 #include <gpiod.h>
-- 
2.41.0

