Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB32217E20
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgGHEUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHEUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:30 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F32C061755;
        Tue,  7 Jul 2020 21:20:30 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so17628040plo.7;
        Tue, 07 Jul 2020 21:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VKmH3YWulKNlmBCUWN+19BKJhRrHEIxCdWWdI5ONgVQ=;
        b=I0db/GMV+yKS6YB/hvaO5ilO3CZulrIXoCps60q5y1KQbGax48CDCyV+4LpQ9dVmfE
         t1WB+ecfNCLR9cftJEoAffjcR5SSYn96RQLy7yILSHjw7nHvdLGmiv7KOrxV1CLgE6ql
         iNJ2ljwTdTBOOqq5eJ2W00cACFedA/OEyutq2y+5ACu93d6w49gKxzM96IQHICPkAn86
         D0uYxyP54EEjD18kvs5G/ms8a93Ou2lLQQtI93puNAJ8i+nTIsOkqlQdQx3P1c7W84+x
         li5gsOb4hdTWYVfDnlkU3nh0wpPwgv+wGjG9mpyQYytcTgVI6dx7nD9W+QLSegzA1gwH
         yaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKmH3YWulKNlmBCUWN+19BKJhRrHEIxCdWWdI5ONgVQ=;
        b=QvIojYd+y4hG6Ab6p/qIxo8LzGz/Rg9wFIzc02qwQ5imnUUFKJakAXINIT/q7EYRZo
         BT9dIs/01X8EwhB6lOMM/4xzF3V/s+mbg2tqRtvQ3zNPe9LXGBHEamczNxOt9jb3Ld4h
         NU6pdLR0YqwJzQbn3QZL01rtmbujM7vNJJ1/rjsneHS5m5wFE8gRzx2lL9EzusFY3bCY
         kFannyQfQjqljJDu91+akJi6NOReg3TJ8TYW1q2y4rArIGi9/ZMrdiroKmg3CySTifaE
         PpV78ml0upkGm+3rjD0axi1Mm826mnOcijddf2ZBGPnY6QINq4UGizAyEpn3qQseiwLV
         BdWw==
X-Gm-Message-State: AOAM530Mn1J/7bJ+xsndyixnmly8r4rk5n3ZLwixLj4OBEvhjhlQ6w+H
        +JAqg9pTRyH3OgCCqVZyXhb4VVRZ
X-Google-Smtp-Source: ABdhPJzO9ynxK5hyUX81L+r9B4WJQaCuy2OCu/ePFoV4L4Q262AO8yt8UxPT5PfplD0JUFh/BZRrGA==
X-Received: by 2002:a17:90b:2350:: with SMTP id ms16mr7935948pjb.224.1594182029156;
        Tue, 07 Jul 2020 21:20:29 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:28 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 14/17] gpio: uapi: fix misplaced comment line
Date:   Wed,  8 Jul 2020 12:15:57 +0800
Message-Id: <20200708041600.768775-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The second line of the description for event_type is before the first.
Move it to after the first line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 0206383c0383..9c27cecf406f 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -71,8 +71,8 @@ enum {
  * of a GPIO line
  * @info: updated line information
  * @timestamp: estimate of time of status change occurrence, in nanoseconds
- * and GPIOLINE_CHANGED_CONFIG
  * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
+ * and GPIOLINE_CHANGED_CONFIG
  *
  * Note: struct gpioline_info embedded here has 32-bit alignment on its own,
  * but it works fine with 64-bit alignment too. With its 72 byte size, we can
-- 
2.27.0

