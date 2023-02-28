Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31A06A8B7C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 23:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjCBWGy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 17:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjCBWGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 17:06:52 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF735ADC3
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 14:06:46 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id r5so948725qtp.4
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2023 14:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=595Lzrfk9ZZdyXMZyGBrATdXcUsn/JJF/BAGuFzsFec=;
        b=q9WuQVRcQGJLXY3BAu1UJSkTSvvF1INVr1jkwYHInIoJV+Uqtz8CGfN1RJSrewwQyY
         TnagFtJVhOawMjgbufAar2d6mWYxR2ajsOuPVjIKJUAYydnhR2KGNo1xMi/oT1MsfRHK
         uam8jWsm0vRXugto4GCeO6FPz5gJtoqfC6tNnN7IcRGZF3vKhORpPi9jDH9uBYqhXIIo
         97GsyuCMlV5WVhB7bS3a2FIoOddClAuFAE8UeExs/scG80bhGu1TNbYmmZIlrurJlpHX
         zXLRy6x8NDzI14OVLEJJw7zVESq3wvmcY3IJjwMdKlzvsdwijOAnjHZ/Ti2eARtO7oze
         2t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=595Lzrfk9ZZdyXMZyGBrATdXcUsn/JJF/BAGuFzsFec=;
        b=foocaLr/uoMHjmai4LZJkZ1psT7h7E2HgpQYyGMlmDfEXEA9r9lNA/mbsYzOTJ7GmH
         1Tfok2MYdoCZmkcqU0BMEJD3UDjCYM8jP6hFhA9W2zD5ryHSJJBIyR93E0JSvK45giuv
         n5uSl0aC1i6ie4IIM/I9D+YA0GOUNl3EeV9x5deAnWbLVL6fuK+QLZQY/bywi879sCoo
         BwWN6MpYpsOvzODARexIhCzbPi7L5mv9Gmwsns5tzPUdf2zo5U7WqaGbaHLhHy/9p3GN
         KKWLEj0lEO0k6h/Nz0OulfzXBpT3cWJjzIWHM/nVbgVAl6AUNoYZbYY/NEHoWDiOyxwD
         8MEw==
X-Gm-Message-State: AO0yUKWnO9JbDI3v6oa6bWgPl3kC7WpBqvrHj5VkHsStilXdXFOeVBk5
        yOxedG7VoOxZu8HfnIgz9ZTdSw==
X-Google-Smtp-Source: AK7set/9MBtd+iJjRd54/HRa57T4mYovpBo3CmEJtLHoI+UdeNKSex3laftnTdJhaGJtNjJcjmVNRQ==
X-Received: by 2002:ac8:5b10:0:b0:3a9:818f:db3d with SMTP id m16-20020ac85b10000000b003a9818fdb3dmr19779078qtw.53.1677794805636;
        Thu, 02 Mar 2023 14:06:45 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id g5-20020ac87d05000000b003b68d445654sm527483qtb.91.2023.03.02.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 14:06:45 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        techsupport@winsystems.com, stable@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Subject: [PATCH] gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
Date:   Tue, 28 Feb 2023 03:11:26 -0500
Message-Id: <20230228081126.94280-1-william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The WinSystems WS16C48 I/O address region spans offsets 0x0 through 0xA,
which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
correct value of 11 so that access to necessary device registers is
properly requested in the ws16c48_probe() callback by the
devm_request_region() function call.

Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register structures")
Cc: Paul Demetrotion <pdemetrotion@winsystems.com>
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-ws16c48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index e73885a4dc32..afb42a8e916f 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -18,7 +18,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#define WS16C48_EXTENT 10
+#define WS16C48_EXTENT 11
 #define MAX_NUM_WS16C48 max_num_isa_dev(WS16C48_EXTENT)
 
 static unsigned int base[MAX_NUM_WS16C48];

base-commit: 4827aae061337251bb91801b316157a78b845ec7
-- 
2.39.2

