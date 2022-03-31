Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3CE4ED13A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 03:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352377AbiCaBOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 21:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352335AbiCaBOY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 21:14:24 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99CB6661C
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:37 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id y6so19500506plg.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NVLhKDY5NVzC+PQtKfgyX0Lx7D2H4nIz7XR+RS3dwz4=;
        b=fwpyD+87B6ffq736RIc9xqkMFk9F28PE+xTna7mfdK8kv6wsqUTCJMj1vfBSMJQ9Xl
         SCyOWOKgq3hy/8aIEDIsSYqdmolCL8mCo07/kHtCr8AuLUKxnQJCpevr1LFDn6+7KSC/
         6dQSkcp09Arzp3gMr2u8Mv6jxquv1jhwb/inBx1fGF+K7g75Bt4JjwCwJ/O2nTJcTqbw
         xJMpLwtY3ttOb0MFyZZu5NMaBUWpTQpNh4vLfl1R2mIs9rhyRvDe8SUGkMj6ql8kX/bV
         2QSrkY+dobGetB2x5XNgLXmsY0Lmu44gE7lrwOyCH86Ek97qx2C32M6eituTNPSDVfLz
         EQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NVLhKDY5NVzC+PQtKfgyX0Lx7D2H4nIz7XR+RS3dwz4=;
        b=l7mIEgY/uNOBW9/uqNbdZtYUf+R/ZfF7LD6n5mAu3lid9ak1kl0wKUmzcSFnLQPXIA
         B6fB+x5QJJLijr3PnCP1rWL4vnt3+JEdkUJxiu4K5eaBjVRMDgOPsU53SByUWcp7Ik60
         N/mPrbwCXfx6KlRWueAwGygq3q/o+3U5jN9akuBW2OPq9Wogg81TgN/2Imvwo9nfmDQc
         axA4GuVn4OMt7FbabPx+FX6In2UzWkI2KTdyLRPLAGlRetS/JIQjli8hCmU1+Y1ojxuZ
         0Tr+decvJRlRVLjria2VKMjp/cpE9R8TEgHTMXwlEYB/mB4TpJ3RkgXxqvrqhfD3avoK
         FHOQ==
X-Gm-Message-State: AOAM530kfIY64tEVqV/92i7a04kfubWgXJMNysCsHkp3Fu6LqD9g653m
        rXzEzOC8ED1tAxMTFn2p1jcHObtwJ7XWew==
X-Google-Smtp-Source: ABdhPJySulKFxtpAsoxAiQUy4/QdNWjA4QAC4NSeLFUFC0Qf3cEbA8O1qjN7tXJBWDCwGXYpScIluA==
X-Received: by 2002:a17:90a:e7d2:b0:1c7:b410:ccfc with SMTP id kb18-20020a17090ae7d200b001c7b410ccfcmr2886900pjb.209.1648689157024;
        Wed, 30 Mar 2022 18:12:37 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e6-20020a63aa06000000b00380c8bed5a6sm21232176pgf.46.2022.03.30.18.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:12:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 4/4] tools: minimize object lifetimes
Date:   Thu, 31 Mar 2022 09:11:41 +0800
Message-Id: <20220331011141.53489-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331011141.53489-1-warthog618@gmail.com>
References: <20220331011141.53489-1-warthog618@gmail.com>
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

The tools double as examples of API usage, so keep object lifetimes to a
minimum to highlight where transient objects are no longer required and
may be discarded.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioget.c | 16 ++++++++++------
 tools/gpiomon.c |  7 ++++---
 tools/gpioset.c |  9 +++++----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index f4c5d46..f789198 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -92,8 +92,7 @@ int main(int argc, char **argv)
 	num_lines = argc - 1;
 
 	offsets = calloc(num_lines, sizeof(*offsets));
-	values = calloc(num_lines, sizeof(*values));
-	if (!offsets || ! values)
+	if (!offsets)
 		die("out of memory");
 
 	for (i = 0; i < num_lines; i++) {
@@ -124,11 +123,20 @@ int main(int argc, char **argv)
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioget");
 	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+	free(offsets);
 
 	request = gpiod_request_lines(path, req_cfg, line_cfg);
 	if (!request)
 		die_perror("unable to request lines");
 
+	free(path);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+
+	values = calloc(num_lines, sizeof(*values));
+	if (!values)
+		die("out of memory");
+
 	ret = gpiod_line_request_get_values(request, values);
 	if (ret)
 		die_perror("unable to read GPIO line values");
@@ -141,10 +149,6 @@ int main(int argc, char **argv)
 	printf("\n");
 
 	gpiod_line_request_release(request);
-	gpiod_request_config_free(req_cfg);
-	gpiod_line_config_free(line_cfg);
-	free(path);
-	free(offsets);
 	free(values);
 
 	return EXIT_SUCCESS;
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index e461458..34de2b2 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -274,6 +274,10 @@ int main(int argc, char **argv)
 	if (!request)
 		die_perror("unable to request lines");
 
+	free(path);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+
 	event_buffer = gpiod_edge_event_buffer_new(EVENT_BUF_SIZE);
 	if (!event_buffer)
 		die_perror("unable to allocate the line event buffer");
@@ -311,9 +315,6 @@ int main(int argc, char **argv)
 done:
 	gpiod_edge_event_buffer_free(event_buffer);
 	gpiod_line_request_release(request);
-	gpiod_request_config_free(req_cfg);
-	gpiod_line_config_free(line_cfg);
-	free(path);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7497eab..f28f8b6 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -312,19 +312,20 @@ int main(int argc, char **argv)
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioset");
 	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+	free(offsets);
 
 	request = gpiod_request_lines(path, req_cfg, line_cfg);
 	if (!request)
 		die_perror("unable to request lines");
 
+	free(path);
+	gpiod_request_config_free(req_cfg);
+	gpiod_line_config_free(line_cfg);
+
 	if (mode->callback)
 		mode->callback(&cbdata);
 
 	gpiod_line_request_release(request);
-	gpiod_request_config_free(req_cfg);
-	gpiod_line_config_free(line_cfg);
-	free(path);
-	free(offsets);
 
 	return EXIT_SUCCESS;
 }
-- 
2.35.1

