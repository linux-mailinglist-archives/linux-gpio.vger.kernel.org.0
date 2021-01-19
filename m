Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C53B2FC526
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 00:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbhASXxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 18:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406358AbhASN6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 08:58:55 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8932C061573;
        Tue, 19 Jan 2021 05:58:06 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id r4so10537460pls.11;
        Tue, 19 Jan 2021 05:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL4XTeXlgYSf3JC4dzvkf+Ob0LcmcMIcOK/73KdYSys=;
        b=RP8XNWcgdk0ReCZvzMJI+MVBI4cqb1Tp+obUwl0iC/ywxJfA0moQ6Iy8DEWrWmQ0Fu
         RiVyA4OEYU6whVzbw0fAHrNczTFIVZRMdlRNRjENnWMyzwiSPOW12Skt29j62b3PClQR
         sYdRAbTZSLYdWTwKXiQadEG4l5ebbOcEA9Qg144lub/sMqjUsnNlN9pmXg7IGosM+0Ty
         OYVrMTAbMBpJUhMXyEqxjE4q0Cm8AZhF8f1DbhskDBGbUDl+o91bRK+VXxi0Gyr2lwqq
         jdNbWUcEhkmvslxFvKp+Rk6ixrZkBL1o/ImSt1SLGBs+pE+AQa+kl0gVq3ofu1yPeBtP
         MDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KL4XTeXlgYSf3JC4dzvkf+Ob0LcmcMIcOK/73KdYSys=;
        b=mLgRayafOEW+Ut4fMePTw5T9NcQl1hStRs7GMXdxVOdwTgct4o43P0qpNjqCltmj+u
         73+3abXaxx701XMgnKTbTvxFgEySt3rIeejrsHNwlfp8kk7roU5CCLeHXq99l2Ofx/FB
         vvEPUkHpm+BRPGCo1NAnRI/KiL6+WhqU7q37UOLjP39tt+znh2qCiuCoBLu5lVJt0g81
         lpwfK0ajaHRek97Ge38PdhvVS/uhDbMpSGvgMgSAMWS7t3B9KKdoBnA1PqzT4Qyg7kD0
         KrdF2GBgvgWG0EIdYIc6Zz4EcH+dGpmmNnl8I/1x/aggAVgP527WW9b1tZTSzo/396jy
         srSA==
X-Gm-Message-State: AOAM533/7krPvv7KHSti8w92rWCtn0POdya4lklh0GT9BWo1BmSBr2YP
        +Km8Npkg7yfVX+al06cLK3r80B0Xxrk=
X-Google-Smtp-Source: ABdhPJzH2iEUJxT2cTQQ2+zZ4EtLm7SM90YRu8usYcXGs9F9EQWJEZPk6GX3gDdx9mV/Fx0BREh0HQ==
X-Received: by 2002:a17:90a:808a:: with SMTP id c10mr5589172pjn.229.1611064685930;
        Tue, 19 Jan 2021 05:58:05 -0800 (PST)
Received: from sol.lan (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id c5sm6617710pfi.5.2021.01.19.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 05:58:05 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: uapi: fix line info flags description
Date:   Tue, 19 Jan 2021 21:57:27 +0800
Message-Id: <20210119135727.105360-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The description of the flags field of the struct gpio_v2_line_info
mentions "the GPIO lines" while the info only applies to an individual
GPIO line.  This was accidentally changed from "the GPIO line" during
formatting improvements.

Reword to "this GPIO line" to clarify and to be consistent with other
struct gpio_v2_line_info fields.

Fixes: 2cc522d3931b ("gpio: uapi: kernel-doc formatting improvements")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index e4eb0b8c5cf9..7a6f7948a7df 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -212,7 +212,7 @@ struct gpio_v2_line_request {
  * @offset: the local offset on this GPIO chip, fill this in when
  * requesting the line information from the kernel
  * @num_attrs: the number of attributes in @attrs
- * @flags: flags for the GPIO lines, with values from &enum
+ * @flags: flags for this GPIO line, with values from &enum
  * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
  * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together.
  * @attrs: the configuration attributes associated with the line
-- 
2.30.0

