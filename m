Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7066B3A96
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 10:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjCJJdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 04:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCJJcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 04:32:32 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029155BA0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 01:29:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bw19so4390980wrb.13
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678440575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgmj6Sg9L2ou/8zxflPP2jSH57vOs9BFT58z7CAixTI=;
        b=PoIf0ci7/VXdvs9kGTLcG8ZMvkEMWD1ILsfhEKy1b8OyCpvOiJ1bZ/3ypqQN3fbHEU
         QSIe1f/wMI0+NHmEjJZEtQau0dvXUPsKOVTw3JeYThn3XvAUIyNFM+CVM8Gd12UXMr/W
         1ej0Y20HI/pLKRIFkV7GrOsYLdM4TWrq5dL+O8WqnwWioQS7Q+MuduePmvk2QDQ96zdd
         NlqEShU415rU6IGL7104PmFuFuDJ/vAXu93RizA5NGa2LP0gkr25s0gahyLkL49QZ7bz
         KszFSQ3qUSHP11gtV2ncWk5gnGLnw5dN18hq/aN4KOMI88AWhH5ochS91+QouT0BE8gY
         pTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678440575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zgmj6Sg9L2ou/8zxflPP2jSH57vOs9BFT58z7CAixTI=;
        b=pfhREelOwpLPto0eWUORoinFCOm3HwOJAAQXD9FZL2K87nSgKd1QxCqZT3fA2lYIqb
         qDX9nf3wSKHV2jRAHJVjcpt6UnU1+j7vGqJ5dLIZ0RVXrAtbrPVj+Zrjrw7ZuIx3T4M7
         5PCLTyqZSoACSL9TY+tp8RvsZu4VEgPjhuffYlhHZIMGgu2fGt9U4ypfNCS/RXoSfHWM
         TaWd6KgSFSxbZvTzkZvSyzcfY91hH0Rv25Y9jFzgtIQyPKqHsCpHVvDZOlBfabKoh7RZ
         739hR5JK+Oh/DSNKkO9x4zc+zqBZAdVoKHxha9GEnz1toV2lxzYtolM2+pXBaMIe/ucr
         r6xw==
X-Gm-Message-State: AO0yUKXvH6xUA45EcfUhQX2Qv9Ptm4Kt21UVlECQNSlPA3/MzmEKbx4D
        YM21Uxni0EVUtnWdqB1Sh+UooxQbVQPKwVX7PsU=
X-Google-Smtp-Source: AK7set9t7vuDHlDX36d9u24k+W2NmU6GnYv+SNRr7ewFPBs9w5FqbWvD6dSkWviHH/GUWBy1XkjPTw==
X-Received: by 2002:adf:dc85:0:b0:2c7:d87:7a3f with SMTP id r5-20020adfdc85000000b002c70d877a3fmr16305043wrj.50.1678440574456;
        Fri, 10 Mar 2023 01:29:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:60e1:2dd9:3b20:5b74])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d6e8d000000b002be505ab59asm1677614wrz.97.2023.03.10.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:29:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] core: make the chip file descriptor blocking
Date:   Fri, 10 Mar 2023 10:29:32 +0100
Message-Id: <20230310092932.51756-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        T_SPF_TEMPERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

After discussing this a while back we removed the call to fcntl() that
would make the request file descriptor non-blocking so that a call to
gpiod_line_request_read_edge_events() would block if no events are
pending. We agreed that the same behavior should apply to info events and
made the docs state that. Unfortunately we still pass the O_NONBLOCK flag
to open() making read() called on the chip file descriptor return
immediately if no info events are pending. Fix it by removing this flag.

Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/chip.c b/lib/chip.c
index 507c79d..7d4d21e 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -30,7 +30,7 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 	if (!gpiod_check_gpiochip_device(path, true))
 		return NULL;
 
-	fd = open(path, O_RDWR | O_CLOEXEC | O_NONBLOCK);
+	fd = open(path, O_RDWR | O_CLOEXEC);
 	if (fd < 0)
 		return NULL;
 
-- 
2.37.2

