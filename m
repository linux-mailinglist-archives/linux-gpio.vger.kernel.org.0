Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0024C89F21
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 15:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfHLNEG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 09:04:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43921 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHLNEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 09:04:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id c19so74174757lfm.10
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SpoeXI9CyOBeuXGUKMk+3ZqArYp0F4hRneoYF2vXhs=;
        b=cJU8mTaN0E+1VFaejYxp7p8bEiUgYzhSYYFK6s/SN0WpPojsAOOJK3F1oTpInSF4et
         QQ0KWvbvZXDRC8wL4tS4AcTQu2dkPU89StIgc75w4rmrIjpj6UacIhPPD4ZUPfpmLez/
         54FJeI5Wu307lhYMtk7ag8HJi+8xcpHrrO//Pjtz1wgA5O+kSX7qj4Lwiy6E9pO75wO6
         5ZQo+u4Dk0wpOQQKHrQfNNbdV/qLzajl9LbmRMmRSRbrxThRyxK4+v8rWv3c87HjB5ll
         +igyzNTXV5UCbknQm+C8ugnyUINhZvpgJYCGOqRCFN0HNAb4FUkAfa96l2HNGlJc5KF9
         lwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3SpoeXI9CyOBeuXGUKMk+3ZqArYp0F4hRneoYF2vXhs=;
        b=Ok2qgBmMLoxBkTj+HxFdkIL9TQVGx4JCm/gMifuWKd8AV5x1UTJtatX0ueISUey1o0
         GnQyMniDnpL2J6Z4cJSi2GMtjW/8hsej4FDnATAqcoSS6E+yRv9f/SwV7RMFyNRTrVoF
         Hox6ZaUXNFb9aYYPm+AJHo57nG8n+xKXamzXCBGPt2owEgUhivKqF+aY2YwQNjhimNp0
         ACfyuYCMcFoh8IQkOCYzQkc6pRBoZ3W+IF7yffhaOnv9ydyKaA+M86i3mFWLHxSA0puh
         ahB1s1hYDmS5KGghivnc2V9XJjGaG2owgrw88UKlKHC1UGeld3Ed8SpfJli/LRvuF567
         HTsQ==
X-Gm-Message-State: APjAAAVbVqYV6gjOkIFG+1uW0ucywKRqO0hVXida44dgbzU/9209jXs+
        /hZuSxcH0zAXhESp1LxqRBA6mwkHvlw=
X-Google-Smtp-Source: APXvYqzFhcQU+N43shs1D20xQ4GnAvfX42UDkGeDAtVBt2qRxVqB/AKE3ajzgpEauW2O29bFkX4TNg==
X-Received: by 2002:a05:6512:48f:: with SMTP id v15mr19999882lfq.37.1565615044120;
        Mon, 12 Aug 2019 06:04:04 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h129sm19028002lfd.74.2019.08.12.06.04.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 06:04:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: [PATCH] pinctrl: bcm-iproc: Use SPDX header
Date:   Mon, 12 Aug 2019 15:04:01 +0200
Message-Id: <20190812130401.22769-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This convert the BCM IPROC driver to use the SPDX header
for indicating GPL v2.0 only licensing.

Cc: Pramod Kumar <pramodku@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index b70058caee50..18ff01727e0e 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -1,17 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2014-2017 Broadcom
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-/*
  * This file contains the Broadcom Iproc GPIO driver that supports 3
  * GPIO controllers on Iproc including the ASIU GPIO controller, the
  * chipCommonG GPIO controller, and the always-on GPIO controller. Basic
-- 
2.21.0

