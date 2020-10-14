Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6445A28EA59
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 03:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389445AbgJOBk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 21:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389040AbgJOBjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 21:39:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25641C05113C;
        Wed, 14 Oct 2020 16:12:25 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x13so602712pgp.7;
        Wed, 14 Oct 2020 16:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=El/pzj9jX1MRiZIL1sB1BOM0SgriA1p/FtOnL1weGFo=;
        b=J5bIT6z0TX+eVs8xDW9zOw85VcZRLKNeJHVPD7iao1P2SCJPovIzVZbQuOxLxtOzQm
         JJ8rD20SCZK87cjll2bKuvEhdVmPCwJEC5DBZIKpyZx/YVa/mN274LrVA8Dc+V0GKccW
         Kfj0qd347oz9T63kQpWHG/BGnD9XzeN+H/a/+ggOFxRQ8B4KTOXv+apYWNzVa43P8xK6
         BrTQeaEOU5XYB78nh2Vs/SVVG8Zs8CQX7yt5mHdUDC1Td1yKpzhSFyFB25icffYVG/qe
         HwZEFdLp2Gj8glbrO9XY8BcY6Yw0soPnQdtmwhqqbAKPhNWXkM5k0lC1VdKs6b/duEuS
         1FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=El/pzj9jX1MRiZIL1sB1BOM0SgriA1p/FtOnL1weGFo=;
        b=PX1WtaUC7jfvVti/5jJag23IKr1Gq6u1QbaXjPV924UWkwAx+qbhNzg4urQEDx3OMW
         gEXxLsMkxwYNKX00SEyZlWDkfxKA6ePkI6bFnvbipwTBNzvGUNaqtMnYN4DdQMrbT6zp
         /LkylkjnlFr6QTGtWWyKAded5koRpWculRgdGLIFzm7pv+5dMZVfMMJCehoejtGZV9n+
         xHlPGlHtGUtBU4HuknlTnvEal10TACTWvFww0rP6ZLJNHSNzuPf33XMupDzL4w6o04fL
         vRlN5OFVfUiKdFkQ4c5CBazohpSEhw4KsjK5AqW1sHk+1zydSxaJqpdOe4FNzPwLZ75q
         VcSQ==
X-Gm-Message-State: AOAM533wTmJaCT5clVPj6yfyTOTi7gsrRmVRCk8T61wCMJKuGmhiZ1A4
        uDRqQjMcsjvByFE4yVvMLlNuucQ2M1SqBw==
X-Google-Smtp-Source: ABdhPJy9xT71FwNcunMPImQQmE8t/49Ekelzfy+BJWZLW3EbgpRA4B2rGOShCtbn8XFl/tsUl7aE6g==
X-Received: by 2002:a62:878c:0:b029:155:c0e4:fb39 with SMTP id i134-20020a62878c0000b0290155c0e4fb39mr1472751pfe.62.1602717144332;
        Wed, 14 Oct 2020 16:12:24 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id e5sm723157pjd.0.2020.10.14.16.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:12:23 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 2/3] tools: gpio: add support for reporting realtime event clock to lsgpio
Date:   Thu, 15 Oct 2020 07:11:57 +0800
Message-Id: <20201014231158.34117-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014231158.34117-1-warthog618@gmail.com>
References: <20201014231158.34117-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for reporting if a line is configured to report realtime
timestamps in events.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 5a05a454d0c9..c61d061247e1 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -65,6 +65,10 @@ struct gpio_flag flagnames[] = {
 		.name = "bias-disabled",
 		.mask = GPIO_V2_LINE_FLAG_BIAS_DISABLED,
 	},
+	{
+		.name = "clock-realtime",
+		.mask = GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME,
+	},
 };
 
 static void print_attributes(struct gpio_v2_line_info *info)
-- 
2.28.0

