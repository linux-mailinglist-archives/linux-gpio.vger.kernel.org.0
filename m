Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C884B0FBA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 15:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240395AbiBJOH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 09:07:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbiBJOH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 09:07:57 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B288CC1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:07:58 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so4006329wml.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glsU9M9SkwdijgWrH0EYYaaCiCFEppIU0HPZ4Y57/Es=;
        b=3H6EPXpcA/sSPmhLtpwpEr6HStJsDkGvWzkPACaXuwDnFA2epcC9kERdS7hx6Ky3WI
         sVO/BIXZAAObtPmYB9HSBlZHmO/lEBhE/W9HUmsElbAlbtUniU5Mh1KEUNDNw/iQu1cC
         Owm9BShpSJigEJzi6tKKA7CXKpxvQJ7QI2TfzoNfpudYuDZAq6v84pzb2GEYvBXMgNpF
         kdUg3TuFJlKIBh6HXTzuAUrrEiNI7egWmqa7KPFw8vQmlQqfJYOBr30sYp2MPFc94fdL
         Yr54Nbf3xEX0lnebNnA285Igqs9H/HsDwUVN4ixsX56Hcg3Y3zrSmPFmNb1aXPfLwQNC
         s9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glsU9M9SkwdijgWrH0EYYaaCiCFEppIU0HPZ4Y57/Es=;
        b=h4qbAd81XI2SJXx4+eD5Yba5YCDZWhjpHyEQKlYkrLvkDq4uozSMpq9Bm7L+fRHgJW
         L1db7w24MYUUq+R2+xsjv0M0cckpLOQlWmBVn+jjqRL8n/jZVXCiquW8XvKNqzGDyf1M
         sMrXG+MAWT08LymsE15BMf9f7GWMLxDU1XKXzxM3/l3VOqEM1un6VkUnMTk0qDaqgl03
         mPjc9E2MDlRIl+OQ7SkZWWomO0AgmNgmdgKpjFDSvqwoFlDPE6J1BN0d+OTPW3HdQYY9
         fXQo1W4ix/VWJPW4ANYbFOQmZXQDr7+vETCMJ2UKVUPJ3FRcUYwKrp0YEsxmlb4cRAn5
         t/9g==
X-Gm-Message-State: AOAM533sZK9v67E1PM02jqLxgXbKUvi3zL1Tr7VSedA2XSY2BPL4wN8f
        /+zUup702jYA3MxJ8S5vw1zqkLE+M1vtPQ==
X-Google-Smtp-Source: ABdhPJz04MtuPeUw4gB3HK8cDUXLMmmDzPTPwlXaswkX+7Wk45ONkZ1ld/xCKA2KuL7nEol3cX3Orw==
X-Received: by 2002:a05:600c:4611:: with SMTP id m17mr2362246wmo.94.1644502077299;
        Thu, 10 Feb 2022 06:07:57 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm18322879wrq.72.2022.02.10.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:07:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 1/4] line-request: don't accept NULL line config
Date:   Thu, 10 Feb 2022 15:07:42 +0100
Message-Id: <20220210140745.1059087-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220210140745.1059087-1-brgl@bgdev.pl>
References: <20220210140745.1059087-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While it was initially agreed that NULL line_config passed to
gpiod_chip_request_lines() would result in lines being requested with
default config (just like a newly created struct gpiod_line_config),
I believe this is unintuitive in the context of all other functions in
the C library not being NULL-aware (as advertised in one of the first
paragraphs of the documentation) and should be changed to make both
config structures mandatory.

This is C after all and it should be both explicit and spartan. :)

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h   | 4 +---
 lib/line-config.c | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 68130ad..074e395 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -173,11 +173,9 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
  * @brief Request a set of lines for exclusive usage.
  * @param chip GPIO chip object.
  * @param req_cfg Request config object.
- * @param line_cfg Line config object. May be NULL.
+ * @param line_cfg Line config object.
  * @return New line request object or NULL if an error occurred. The request
  *         must be released by the caller using ::gpiod_line_request_release.
- * @note If line_cfg is NULL, lines will be requested in input mode with no
- *       additional parameters set.
  */
 struct gpiod_line_request *
 gpiod_chip_request_lines(struct gpiod_chip *chip,
diff --git a/lib/line-config.c b/lib/line-config.c
index 2ac9f5f..346d331 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -903,11 +903,6 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 	uint64_t mask, values;
 	int ret;
 
-	if (!config) {
-		cfgbuf->flags = GPIO_V2_LINE_FLAG_INPUT;
-		return 0;
-	}
-
 	if (config->too_complex)
 		goto err_2big;
 
-- 
2.30.1

