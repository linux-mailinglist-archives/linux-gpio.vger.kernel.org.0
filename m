Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0218C4CB9FC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 10:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiCCJT2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 04:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiCCJT1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 04:19:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D6C16A5B9
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 01:18:41 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id t11so6773381wrm.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Mar 2022 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cHFGVql2cQztIW02VjNTKPAftBFMWTKbdMY8muRP0mw=;
        b=NIX9va84w10A9VeyiMRcuQqdsz4R5ho6ifJs2sc+wnNsxi57ShvOibzHk9MvLVJrE0
         JI0X5kEAJ+mh4/zsAqbIA9s+KdfPd21fc0ZnytTO/iYCNLNJIhDyY33Hw8wXbImnVTKa
         2ewqJ4lsJGGR1ah81klTcDM4Cnu3OaJQ/asO6gKTokON+rMvfIPIevcqvOLp9vWvDCaS
         U5IQ8NnnJ3RKz4jlNgBxVXRf5hL+jcXrdd65LmQp8MVXb8PsNmSlqWFctWt8lxt1v3Kz
         OVx3YRqcCefkDgTcJ/6Gltpo8TSKaPCtL4y2vjxRMNiDy3gfykFYUJQp02TKzsgzwlvc
         n04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cHFGVql2cQztIW02VjNTKPAftBFMWTKbdMY8muRP0mw=;
        b=a/405q3mQRy0SFv2tQfqYjqIS8hBvL0lDO9Jc4u/t2KQyVQiPi2SZ4ra15ByOmL3Z2
         /aydu/U7pL8McvJSPif2dRSsLQyCbLMyMBQiU7rax8hhzoH99e6WahMfBXCI0hagmPA/
         c4ssJHMzVolw2Kru+dMiG8S6BFfz3PCZDCe9vyEhjRGL/6Ipc+PMbIlabmP8AwgWDzko
         3ZmLEpM4o7PLKFjuDjxuNkwspFobJGWro5IVTWjwybsDoR3vFe9xyYWchNTSsBdUdzxb
         0FI735tT0vLNINFG2Kr82gutHiaX5pN3bDGi7LdazyB0Y3MZ6NkKwHZ/Xju3CMXnjWyv
         W4nw==
X-Gm-Message-State: AOAM531SmMtWYEBqD4Bod1WtwTqpJglerapOcAAxGe+/enDMrqYsg7XM
        Nt8f7iqskjKxHguzmdW2p2iKUfZSuBASGw==
X-Google-Smtp-Source: ABdhPJwIZQqzpOX372++QIMN5/G2FcpWnL5UBqszy9XTWuICFjyJXOrs4Ul/VlkORqyE4EFgaP/+gg==
X-Received: by 2002:adf:e6cd:0:b0:1ef:db24:7ad1 with SMTP id y13-20020adfe6cd000000b001efdb247ad1mr12200258wrm.233.1646299120460;
        Thu, 03 Mar 2022 01:18:40 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x13-20020adfec0d000000b001e31279cc38sm1527286wrn.11.2022.03.03.01.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:18:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 1/3] API: add an enum for line values
Date:   Thu,  3 Mar 2022 10:18:34 +0100
Message-Id: <20220303091836.168223-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220303091836.168223-1-brgl@bgdev.pl>
References: <20220303091836.168223-1-brgl@bgdev.pl>
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

In order to explicitly stress that line values as understood by libgpiod
are logical values, expose a two-value enum with values called: ACTIVE
and INACTIVE that should be used whenever referring to the state of GPIO
lines.

The value of INACTIVE is set to 0 while that of ACTIVE to 1 so that users
can still use integers in C (where no scoped enums exist).

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 074e395..34fdad6 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -185,12 +185,20 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 /**
  * @}
  *
- * @defgroup line_settings Line settings
+ * @defgroup line_settings Line definitions
  * @{
  *
- * These defines are used both by gpiod_line_info and gpiod_line_config.
+ * These defines are used across the API.
  */
 
+/**
+ * @brief Logical line state.
+ */
+enum {
+	GPIOD_LINE_VALUE_INACTIVE = 0,
+	GPIOD_LINE_VALUE_ACTIVE = 1,
+};
+
 /**
  * @brief Direction settings.
  */
-- 
2.30.1

