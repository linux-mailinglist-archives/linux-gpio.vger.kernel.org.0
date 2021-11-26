Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2703345EA11
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 10:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhKZJRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 04:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359785AbhKZJPQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 04:15:16 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2449FC061375
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:17 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id h24so6801030pjq.2
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wYzKRYxIRBWuphS4sQ6mzL/bRM7YJgZ+h3VE3EOkkM0=;
        b=g3BzPTmHhpM4odNCRjKCcd6AT2O7DPluushq9xBtkcAI3mSdkVuidXlvnly8ATlSxJ
         ZBc9MBhhjob4rDd2AvI8ec1DzqvYOjI4+k3wH5EfEKczeThdOLQryZKlJL9KwjFt7ER9
         s5wAo0qlYTdVh8uJUybr7ns70zMAl7l5X0HeDkg5V3N2YgywH3/RTbAy2eCt3zgz/qeS
         mo7Tis/wIbIUbz2XPW41jfv2V0iUt0Fz0hLDyKVnO6mb/YAacKGhkWUL1qLdoo7SZR9B
         k5O13oZAbkvVmCH9wt/AO++wPD2d61FJOJXveBBLLZW/wCtn183ApdrWoWGfXfGG3Dnp
         UKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wYzKRYxIRBWuphS4sQ6mzL/bRM7YJgZ+h3VE3EOkkM0=;
        b=Ft+52t4gyhIpEmGRI8/b24ubR3SCEQDj+SoAUgQ7PwoObsGxrs9md+rqdo2ESaV8ER
         W6vcIl0BJwMUZfgZOsaBt9iZQQKCYhRwfc+hoQ2LykZBIpXO0ZFzvjJuxZs2r+yUlbD7
         LS66i0HuvlKppHzotF+fk+OtvQZtXJ5U8GG8t0Xgl7BXTZNLJmV1n3IBC/6EsPn5wrv/
         S6jgKWmZjqnEcoeDzbd3kIQBX5AiOr+XabjMJFYBMd42UF4EwpuqyBWhtawDaj+wlfc6
         9qHV9kOkbcvvJYLTCmfUGvMd9AtmfCWog6Q+e/ZhK0f1VGPBEx3SJ7hiXk8XEPBEqSyj
         jrsQ==
X-Gm-Message-State: AOAM531X5fEb0smdv/90jx/wU1ykgeEmAIJT/aTlSm2I5BsWJcMlDRhH
        NSbnSGdIs2gK9YRr1iCCsfNtpA==
X-Google-Smtp-Source: ABdhPJyuMquwlfWuWFzDcmvwcNLAkF1/4yEX3E+qTJN18XrY9Pw5Sfwpun7BTUlRx1vqE5Gv93BPlg==
X-Received: by 2002:a17:902:da85:b0:142:11b4:b5c0 with SMTP id j5-20020a170902da8500b0014211b4b5c0mr37097694plx.53.1637917636638;
        Fri, 26 Nov 2021 01:07:16 -0800 (PST)
Received: from localhost ([122.172.196.175])
        by smtp.gmail.com with ESMTPSA id n11sm4345099pgp.15.2021.11.26.01.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:07:16 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/2] libgpiod: Remove dummy declaration gpiod_line_config_get_event_clock()
Date:   Fri, 26 Nov 2021 14:37:05 +0530
Message-Id: <0471e032dc7e7148956cd7a00519ab26e265df46.1637917008.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1637917008.git.viresh.kumar@linaro.org>
References: <cover.1637917008.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiod_line_config_get_event_clock() isn't implemented, and just has the
declaration available. Drop it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/gpiod.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 44deafc83c11..0bc0ceee4b76 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -777,18 +777,6 @@ void gpiod_line_config_set_event_clock_subset(struct gpiod_line_config *config,
 					      unsigned int num_offsets,
 					      const unsigned int *offsets);
 
-/**
- * @brief Get the event clock setting for a given line.
- * @param config Line config object.
- * @param offset Line offset for which to read the event clock setting.
- * @return Event clock setting that would have been used for given offset if
- *         the config object was used in a request at the time of the call.
- * @note If an offset is used for which no config was provided, the function
- *       will return the global default value.
- */
-int gpiod_line_config_get_event_clock(struct gpiod_line_config *config,
-				      unsigned int offset);
-
 /**
  * @brief Set the output value for a single offset.
  * @param config Line config object.
-- 
2.31.1.272.g89b43f80a514

