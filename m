Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FDF28DC23
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbgJNIyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbgJNIyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:54:36 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40D0C04587B;
        Tue, 13 Oct 2020 23:28:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id y1so1236374plp.6;
        Tue, 13 Oct 2020 23:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=El/pzj9jX1MRiZIL1sB1BOM0SgriA1p/FtOnL1weGFo=;
        b=kOmN7ytnHBMT72P72g/+pc+e8TbtzrNG1a42jRu5bi6oUR8AVaKW8Nc8sQYo7on7GV
         x6Sjlvwh9LMAYq12VZhBv7Gaf7SPEPM87GGgfoSgzaOz0h35ODUMjPBcXUBCfFGuJoiY
         8SWdfNiRx0UYpr0ujxcH7bgHH9iWdQ+9o9p9OwqIlANEjj7aidIcbHYO9UswUgKWq7gX
         T/x/JpUOSwQuJmxkjT0J/DTqnHL6IwOYn5lrBPmHyDBx+StyaLrgmH4gLNnckyjItvoR
         EzoSvdq90sNim1h77fjjzOh4j3BPABD28O7c2Y9oKuEmXQTSeQiK6Yv40egaIx7FnOlv
         N5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=El/pzj9jX1MRiZIL1sB1BOM0SgriA1p/FtOnL1weGFo=;
        b=ZG7u1ye0PxP2CUwQ7J42hVLQxQcSH6NGW2QP4o+p/h4UIN7TCy5NCtABMdFISqrjWp
         syzzT57b6egi1eU00F6se8RugErB4uOZtteD1kaAFC6u6YDZ8TWwW0ouV4+vi173lidm
         YSIIZQqE2rDOvsKlBCV1jik7xCQzOy1dvqgQPVt61tesp9akWsGfLLpYeW/06ix3qt5E
         9ph11B8kBVEH3qbIwfJiz5Ba9R/KkVtm3A+n7inaFklkOcc+kJ02xpURxFlCz56qeCMP
         sdtoRkJNGkFGakY7Lyn/HM3M/d/HAVRZppHq88p+qHR1njGlxosEBu+QjomHl8TYGmzm
         Qahg==
X-Gm-Message-State: AOAM530+Jzolmoe+ImgNh9xu/lXyJ156PVUw+EOaE1zVw1/jOijTkUlL
        46U0DEvQpZHJEE0/bWzb5VVM5f6y+p7yaw==
X-Google-Smtp-Source: ABdhPJwqe7ANtIFwrFLHjY5juaV7war2WkNGP+qBxzhEMfuRzXIr5/C4IoyyNxSDph5hV93RKktA2Q==
X-Received: by 2002:a17:902:bd92:b029:d3:8087:c6c9 with SMTP id q18-20020a170902bd92b02900d38087c6c9mr2756730pls.53.1602656905095;
        Tue, 13 Oct 2020 23:28:25 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q24sm1803266pgb.12.2020.10.13.23.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:28:24 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/3] tools: gpio: add support for reporting realtime event clock to lsgpio
Date:   Wed, 14 Oct 2020 14:27:39 +0800
Message-Id: <20201014062740.78977-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014062740.78977-1-warthog618@gmail.com>
References: <20201014062740.78977-1-warthog618@gmail.com>
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

