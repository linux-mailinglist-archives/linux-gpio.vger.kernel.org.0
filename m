Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D172445EA10
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 10:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353054AbhKZJRQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 04:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhKZJPQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 04:15:16 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7345EC061374
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:14 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id g19so8294003pfb.8
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PJ/XAODDvDtntgGCN08ZYftWGuovLiYUvUkzr4mDxP8=;
        b=GdZIb81jwS5LTAYNFdzbz1ds5jXVxQqXY6BYSu3rcmdUdhIt+wuOyf0SxLkqPmFxc4
         ngVq6ADs7SklOCAbrfAqGbpy7z6uxaQB4u3CzEaL6cmFeGP9zQQ4v0/nKHbOjpla6BnC
         BAtptwK7rL5wwtJZXQ09XJb+EFOdbRlyP/ngq4iaLKlzl0ALbhaGziBBOAMkI7U/H/64
         Pf8QElXAXIK/U+1TDMeXx74vAgzEH8UAWa/OlT/N8Iq9XNiynpEgJDm2JlZjWnGcwO0f
         w9gyx8GsmDelSwy8Rt4S6bcfIXWLH07fLsj8PQ2RzjasMEUL+9731Hj+TP8DCiCskcHZ
         poCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJ/XAODDvDtntgGCN08ZYftWGuovLiYUvUkzr4mDxP8=;
        b=HGmAXJvoyf3b8VMpllRiwZimRhx+E3ZV4LQHly5hvQsUCrMajOgI4oMVQtzw+f587t
         SaF47quZqQudQy7wM1ZTyGFo28LIVwnJkULJN/5UfFejTE0axTW/Pg0KKD68LhzIxfg3
         oPPRe1tgYqfzACPT3w1/TqfBYY/11YppcwbWQjglYm33n4ZMJxMWNoZjORZl867uIdZn
         S74nqPKKsENROwhiQEqkBXE7KF3vyjhnPOyRSTBeW4qTcoVW5vZrBbzNbz3rWyArw5ms
         hLi8YMo0SSwtECIw77g3G+j269URquUQna+ekuGxK3cTzgunrpgoElLrRWWh13KJgU4w
         unrQ==
X-Gm-Message-State: AOAM533ULcXwMAEzn2AljdcRr074ikbgSAnIzXwJ5Cyy0x/KoRdTT7MX
        Ihe4Y2r8E9F2zarFzFyLV52s15oMXpvb8g==
X-Google-Smtp-Source: ABdhPJzqRZKAo9MZtDt7cvgbSrHWdZaBo5zRYvlSL6MKg35uSJSpgTYNdqwcVKP42UrtVRNZBVco2A==
X-Received: by 2002:a63:89c1:: with SMTP id v184mr6358775pgd.518.1637917634020;
        Fri, 26 Nov 2021 01:07:14 -0800 (PST)
Received: from localhost ([122.172.196.175])
        by smtp.gmail.com with ESMTPSA id fw21sm9754961pjb.25.2021.11.26.01.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:07:13 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/2] libgpiod: Fix ioctl number for gpiod_line_request_reconfigure_lines()
Date:   Fri, 26 Nov 2021 14:37:04 +0530
Message-Id: <ce3d189ec1f04092f7edc56c9a1f6534b60d6a14.1637917008.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1637917008.git.viresh.kumar@linaro.org>
References: <cover.1637917008.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ioctl number used for gpiod_line_request_reconfigure_lines() is
incorrect written as GPIO_V2_LINE_GET_VALUES_IOCTL instead of
GPIO_V2_LINE_SET_CONFIG_IOCTL. Fix it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 lib/line-request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/line-request.c b/lib/line-request.c
index 8008b89c7e65..0ac4ec89408e 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -197,7 +197,7 @@ gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 	if (ret)
 		return ret;
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &cfgbuf);
+	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &cfgbuf);
 	if (ret)
 		return ret;
 
-- 
2.31.1.272.g89b43f80a514

