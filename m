Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AFF70DD27
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236701AbjEWNFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjEWNFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:05:13 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DEAFF
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:05:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso7086718f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684847109; x=1687439109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMfUjbtBTpIalfm09FmxWbqUcoq8guPUJUrDUUYnlmE=;
        b=N92sQSMCnH+QOHxuV6kA7kiJFOg1qiixNRrU9H3SCaKD6pL0ER7bt/7HRN9vwpSQo/
         /CPAXKUqNX5RTojSIqkeyj6xw3JHM2+3DnxlLJ+xhKy7AoiDYcRbybaVUROx05LLHgoC
         XsO08BNDcBVlpJUg2pIvmD4c2kYUR7VzrANqzUXhWOXtNQbTUb81PomQ4H2GlS0hnftU
         f+xFHliNNkammaTclO8KAV53zNWO4TWZ1iV17z4+uu036d/12C7XpdkbPU0yP65Fe9Fs
         j43RVHfXalJFLBOdayaUaBEicB7WCtRKGugtBnzhQ0/bMtuIS0u8213v4QwPhw+AXppx
         PskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684847109; x=1687439109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMfUjbtBTpIalfm09FmxWbqUcoq8guPUJUrDUUYnlmE=;
        b=RWLBfOeXLUz7lbrrUlvUZ8NO/KheKQDQuHr0w9tjHfEsE/jfqCKu7WQhyuUbDezz5X
         s4H8lrzlvWe989jZSRZaYeY+fNY7w1REeUI1bO0jWSw9lL5VKXlmCFzf+hZIy3BDbqUk
         L9oIgOkyCoTOUMPOh+28PvUQLv0NPeNWdAapUJbDwIqb5yoShpy29vSLz5iecBRPr6PN
         o3TWh8tgMZERxvIGs01n8DijfwmE86UYbVB2OJjvnvgjZsArzSxtf76K/KieDe4m7FIb
         7WBN3ak9GsZYd8h1pJtpqmLTOj2t5Df4xXQlZWNdVq9NG1jiI2dCIdIG/52x1wG7kKvk
         /ATA==
X-Gm-Message-State: AC+VfDztwSege2/SaFun12bAgNsxxn2STFniKYlEeMuOG4CIbRgq+H4l
        NP9gOADBzjUf++LhLptLgg4m+Q==
X-Google-Smtp-Source: ACHHUZ6ykjKfybd1YRDkKbEOs5PxoGujbN6gyFJqGifTM6w9/ZeBPIrOu7//zkkrPbWGfG4p21iPlQ==
X-Received: by 2002:a5d:43c8:0:b0:309:566f:3cd with SMTP id v8-20020a5d43c8000000b00309566f03cdmr9107140wrr.6.1684847109564;
        Tue, 23 May 2023 06:05:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3c9:a1c2:c486:3efd])
        by smtp.gmail.com with ESMTPSA id j17-20020adfea51000000b003063938bf7bsm11076414wrn.86.2023.05.23.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:05:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] bindings: cxx: clarify the meaning of negative timeouts in event wait
Date:   Tue, 23 May 2023 15:05:04 +0200
Message-Id: <20230523130504.151607-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

chip::wait_info_event() and line_request::wait_edge_events() behave the
same as their C counterparts in that they block indefinitely when passed
a negative timeout value. State it explicitly in the docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/chip.hpp         | 5 ++++-
 bindings/cxx/gpiodcxx/line-request.hpp | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index 2553f8c..e8b3c0f 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -125,7 +125,10 @@ public:
 	/**
 	 * @brief Wait for line status events on any of the watched lines
 	 *        exposed by this chip.
-	 * @param timeout Wait time limit in nanoseconds.
+	 * @param timeout Wait time limit in nanoseconds. If set to 0, the
+	 *                function returns immediatelly. If set to a negative
+	 *                number, the function blocks indefinitely until an
+	 *                event becomes available.
 	 * @return True if at least one event is ready to be read. False if the
 	 *         wait timed out.
 	 */
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index 54a4e00..c1e1520 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -176,7 +176,10 @@ public:
 	/**
 	 * @brief Wait for edge events on any of the lines requested with edge
 	 *        detection enabled.
-	 * @param timeout Wait time limit in nanoseconds.
+	 * @param timeout Wait time limit in nanoseconds. If set to 0, the
+	 *                function returns immediatelly. If set to a negative
+	 *                number, the function blocks indefinitely until an
+	 *                event becomes available.
 	 * @return True if at least one event is ready to be read. False if the
 	 *         wait timed out.
 	 */
-- 
2.39.2

