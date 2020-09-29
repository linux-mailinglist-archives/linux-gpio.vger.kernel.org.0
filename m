Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FE327C203
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgI2KK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgI2KKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 06:10:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224B5C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so4189699wmm.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=QfhLhbUTjHIj3Y7HomIRD7VAgcGMp0d2n7WMsx6Q22a3oTDfO6dk05l7urMoiHN3j0
         V3FfN4skAT9KLDxqtBq6d3dSb32H7Qke+AoW2cytasaKVGrCa65anDtNcHUZqV5EMN7P
         y77oYrSv2wFtz02+uwletmwVhZG7UXc2XhJ33F3IFhnOuGSWs3MIXRtpDiXz2mwNjPNU
         RHwugBiCMmn4j6QXz6nGHwmlvE6tsvecoG46385WJqqLdgpHMtFpAT95ynU7KVNAAOjm
         7JTyTRZItvug/gEmtziOmFJDPm+niFcPOVsv2UAvTQu7KIHDNmJ9zrLpHkGkbbC5SctR
         YR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=dPOJ2FiBg1BOsqFdzOLES+Zz8r8B7GzW3icOd4PevK5rPney8252fjHT9fu6aqEjir
         HL3lncBjULcu3U1Ba2zmihuDTixsZ7VoYxhGzUix2fkngav/2PtmUXz9pZ7S7pqIPoDN
         VAQR7+yDIM5ofrJAsvRS2NB29BSHQ/zTGClIb1nIguFA1ej6e46NeymL7QVkqyV8MC+p
         MavFTyQIhawbi+wbYVsLLZJgDdWvN5wXP7k98W53wSLlzQZ5xDnJJ+28UBeuaqNP7cbv
         bxYdkCuqjGnTHFQ0oCpQtQlDoHMTcCgQF1jvBQ6QujCDdppLKSvaUcV9+7DCboGnzGpn
         JNuQ==
X-Gm-Message-State: AOAM531l7+jbQIbnARldtvOmzsDzK51XOjZL6k4hnoOeNJDfmdWHwqcL
        TAy/oIpqi7Hv2hPfnS5lkBGx/A==
X-Google-Smtp-Source: ABdhPJzhsHf0g1n07jxfN66y7RG66yrbDXd6Rtj9KiqrOmYuW3ZxG/bURwo9Ua+mGtpFIE5NpFsmkA==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr3843472wms.77.1601374217688;
        Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 03/10] gpio: mockup: drop unneeded includes
Date:   Tue, 29 Sep 2020 12:09:57 +0200
Message-Id: <20200929101004.20288-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1652897fdf90..c5092773afd8 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -8,9 +8,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-- 
2.26.1

