Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DAF1F7333
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 06:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgFLEvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 00:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgFLEvO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 00:51:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C424C03E96F;
        Thu, 11 Jun 2020 21:51:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w20so3572036pga.6;
        Thu, 11 Jun 2020 21:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cpf7GxzM0Y9QafCZx4irqLQEu0yW7HSq8YN2J34y/ZA=;
        b=XWTDE/HlByHpxBNTJQFiSdPZgaLmU0GV7iZBTwZnorCnrGiscoiGVR3GR9dcBiPGO8
         tOyhQze2G36OtcbvQonrA4LLVDeJn0gwe+LosJhxtFDu+VAWYc59M60PLyTjC8CbeWQ/
         MKurBSRnGOhytHpTRqlQ0Ykd9JA/hPASqYFenbAqx+NqUESQSfTdJVTSFK903wh9yJu+
         yTGXBWcZNja6QpaTF6An1Cd7NnqqUxCOHxZ3D4CmOzv7peKu8KPIIdq1kENXfSKOP0Y4
         aFk+LqgwX700qHO84N11wnnEzILxaZizhK97NvrgS+m6YvADcKURW8qF+suZ/xAY0Mux
         28qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cpf7GxzM0Y9QafCZx4irqLQEu0yW7HSq8YN2J34y/ZA=;
        b=T1yrVqQYkTkCPNjmZjXSarkJ7UscnBfDYoG3y6oewCuF5Xvtpv8VWAX8GqD+jZhrVH
         koIwMrfq7Y2IJuDIF7+JTPw4tiV5hLwkPtXU8XrKoSd2JlOqyCrOonpkh6VBwhsPTxww
         fPHtaOKwSK+KqD8luH6Uegj7gU6rAufDNRrMTTtz9ls42zy3C1Ss2bHyWWxkvbp5MTPg
         n6vzuaLj6OuS+/nEvGGRXJEBtuKatOoO9oNZ2tqx5xrTc757wXeWRGWBCm1hfX1y1Wmr
         081hfdOERjQSGCIuM3dAotzKA+9bAN3qLpM4zeV7glXt9DY9slRAjnJlUIplTplyFn0y
         ujTg==
X-Gm-Message-State: AOAM5328NUFJSsAqUZV6wz6qinTXLdWf4RU2DmxsT9181KBeOY0iVgFC
        +p5utnGwZUItnfGZ4s/4WZAI920pxbU=
X-Google-Smtp-Source: ABdhPJy3OfqmSVVgPSShc/PxgSeDZ/hC/rVavWmtUPmhoM/mgrBmRI3ai8zHZQ1vrrIhYCTq0e+Zfw==
X-Received: by 2002:aa7:85c6:: with SMTP id z6mr10575853pfn.8.1591937472648;
        Thu, 11 Jun 2020 21:51:12 -0700 (PDT)
Received: from sol.lan (220-235-122-244.dyn.iinet.net.au. [220.235.122.244])
        by smtp.gmail.com with ESMTPSA id b23sm3952216pgs.33.2020.06.11.21.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 21:51:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] gpiolib: cdev: fix -Wmissing-prototypes warnings
Date:   Fri, 12 Jun 2020 12:50:33 +0800
Message-Id: <20200612045034.27425-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612045034.27425-1-warthog618@gmail.com>
References: <20200612045034.27425-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix -Wmissing-prototypes warnings by including module's header.

Fixes: f6d984418ffd (gpiolib: split character device into gpiolib-cdev)
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 971470bdc9c9..58011ba88a1d 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -23,6 +23,7 @@
 
 
 #include "gpiolib.h"
+#include "gpiolib-cdev.h"
 
 /* Implementation infrastructure for GPIO interfaces.
  *
-- 
2.27.0

