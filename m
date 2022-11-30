Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3367C63D5CE
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbiK3Mmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbiK3Mmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:49 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55D81B1C9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:41 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v1so26866883wrt.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emp/AM2e2PfjsIK3lkYn8k6SeYggLBilZf6TLD/dWfg=;
        b=ksJzkKgbaC4Jq581Nw8lSpsuswTx1vgOP7QXdU4MPLip709OwWm8t+E2yLgsn2nLMw
         dxWmaYkFOSDlFNQD6JBhiYT/ItTtCOLftOoHfxkBK0K4DBJwuOX1eBDuNmaibEWxX29y
         I9XdBHWnGeNdaq5BkNXZugsxi2cLckOPuwmD7YF0Z7bZMYbc8H32OF/NvusTBaUmXZKA
         XFik0Z/PWuusltMzz2QZ2eZAMSy2Bgd4KjIS2hElsHCX1sml+H9UYGvLwXkDvhn6t/pw
         sy4JLBXj2N1I7wCPfzHtoMFBCfOrYTYxyldBeH6THHEaIk7Gz8GOESdA2UQi3ZUNwjeM
         w9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emp/AM2e2PfjsIK3lkYn8k6SeYggLBilZf6TLD/dWfg=;
        b=EzkDcjUyo+gUfLIDBxa20lk7p3yI8knul7L8UvS7aMa0u0f9FBAxz8ioDrqwK9psWT
         ceHUqS/b+qtzQmc6zZacp5VO7Yl6LSdqg+0JQGF+tyYO5eDJuSE/3/AMDdCSm9X23voP
         uRu98gRcPFMgo6CxuxKhW41M1h/4JgacCat2jQ6nFKJtg3KEBu362NCA6te71Xjuqgb5
         kPXeNyVDsc/1hp5NiCDBHMyrxTzdMG2ZYGqbIblbZnxCuvhdw6oaCvT//sS/Vy0Bvwhr
         QMs4XwRR+emxCk6+f2xTddFvUQ0dNS7F1GeUpYOsKaMN2Sz8huNSscDwldte8rq/sByM
         FmTQ==
X-Gm-Message-State: ANoB5pm/roKyFsbxvjJFGjG7r6dIw5iN9iD5qu/wS6hf+yQOapl82aAv
        cNLdYMCiEg0l+djE0fCMZDzX6Q==
X-Google-Smtp-Source: AA0mqf7FFem6N64zw3kdi4cqr0l2LeUOem+cWFXv3PaGi6tl+I++qygLKM5H9e/xiH5gRh51HMnj2g==
X-Received: by 2002:adf:f944:0:b0:236:8f54:f1f4 with SMTP id q4-20020adff944000000b002368f54f1f4mr38019370wrr.654.1669812160441;
        Wed, 30 Nov 2022 04:42:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 06/11] tools: display the correct license with --version
Date:   Wed, 30 Nov 2022 13:42:26 +0100
Message-Id: <20221130124231.1054001-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The tools are licensed under GPL-2.0-or-later so fix the output
of --version.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/tools-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 44988d4..3480ede 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -78,7 +78,7 @@ void print_version(void)
 	printf("%s (libgpiod) v%s\n",
 	       program_invocation_short_name, gpiod_version_string());
 	printf("Copyright (C) 2017-2018 Bartosz Golaszewski\n");
-	printf("License: LGPLv2.1\n");
+	printf("License: GPL-2.0-or-later\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
 	printf("There is NO WARRANTY, to the extent permitted by law.\n");
 }
-- 
2.37.2

