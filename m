Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9685B691F79
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 14:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjBJNEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Feb 2023 08:04:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbjBJNEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2023 08:04:06 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00177AE38
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 05:04:04 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n13so3762976wmr.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ixA9jzJ6GpVnqslHKqpMGo99fPJA21Nf52MUAyWPLy8=;
        b=eL3khXKUZ/eBE4JTmEQ3Mpxi0QTe4qp9du6M7JWe5lEAqTJkVCoK4rMhtqVV+mzlNQ
         0wNwwd4h1HazuPAsiaazpQqMXJRakWCAtSRG0TXyit58qnDTrGL/6+qwkLPMRNnKmXsH
         bZLvQ+Wz1QYtrXSFORHhNWLC3UFEKQNiSpyLoPniiOQPCJq49d80+lbNrEkg9DQcpkG7
         PRzt7H0hQcRz3lMt79rdFvzEobPFQp6zratJBamv616A2g8Z+FGWfDA2g1cbdnX3W/EV
         GFHAUT29vDCa6ZXuHYqYfhtDGRn9aSMTjHAMVkOfgin7PYhlKAPEBA+uJtxyAuMKWPxY
         upfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixA9jzJ6GpVnqslHKqpMGo99fPJA21Nf52MUAyWPLy8=;
        b=M3kYHvhFgvLT3U3wd+oQMDzPY4/nEQ10ZqFJcohNnb/6KoO21hI834nAZ+4S18rEJ/
         +BPwKrJuiWrY6PoggJUhy7XxowPVf31a2bDH5TciT+nMmCO5QK8RgNFafFvUJjHaPq/Z
         Yi3sAHu90U32m3NCcO+HhzwQSRgAbLLRsn9uNVegLIoESCjPYRNh9M8WSFAaXPfa19vz
         0KqLmoext8ZvFmlzCdU+NovC7wOodvJEv9ctvO1kscciwOMl8PxkMv/6f48YCFgr5KK5
         5dQ+W2oXxjMK2qEXOhiTX36yBJq2/HMpHzpCbYIJIRcEMZmE1JoF9pgBPxZ8C8aXTnwn
         lTRQ==
X-Gm-Message-State: AO0yUKVZSjfjhqFbb+4hQ3KS4GuUg7eP+PelcHeVCovx+ar/EOwWepWF
        w9zHMAm8ch2XOIqhAzFJyAeO6A==
X-Google-Smtp-Source: AK7set/TL22nHy41O2BY3kDURGTenR8zccOioBWdHdjiLntbHbTYIeoNAHfyLDnvRPJLA5dNZvEbTA==
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id b28-20020a05600c4a9c00b003dd1b6f4f30mr16996411wmp.3.1676034243474;
        Fri, 10 Feb 2023 05:04:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d60c:4605:88cb:74c])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c468d00b003e001afa274sm5492940wmo.2.2023.02.10.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:04:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: cxx: fix building gpiod::timestamp with clang
Date:   Fri, 10 Feb 2023 14:04:01 +0100
Message-Id: <20230210130401.1181599-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

Clang's system_clock implementation uses microseconds resolution by
default and we fail to construct a time_point out of chrono::nanoseconds
as the library prohibits us from accidentally losing information when
casting the latter to the former. Use nanoseconds explicitly as the
resolution of the realtime timestamp.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/timestamp.hpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
index 2eaadd2..5efeb4c 100644
--- a/bindings/cxx/gpiodcxx/timestamp.hpp
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -38,7 +38,8 @@ public:
 	/**
 	 * @brief Real-time time_point.
 	 */
-	using time_point_realtime = ::std::chrono::time_point<::std::chrono::system_clock>;
+	using time_point_realtime = ::std::chrono::time_point<::std::chrono::system_clock,
+							      ::std::chrono::nanoseconds>;
 
 	/**
 	 * @brief Constructor with implicit  conversion from `uint64_t`.
-- 
2.37.2

