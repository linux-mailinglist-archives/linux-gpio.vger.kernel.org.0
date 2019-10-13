Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA21ED55E6
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2019 13:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfJMLlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 07:41:11 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44318 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbfJMLlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 07:41:10 -0400
Received: by mail-pg1-f193.google.com with SMTP id e10so4432897pgd.11
        for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2019 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=H4jNSTdI5Utco2tyI+uH4DR1jB5MYkjGkGQxM479hgCZU/ZNemoRjc11r/XAqI1YW4
         26yTn/C4RbX8Yj7MzC/EqAoQUsbQ7LwcxAqg8SPPU/u9+LBCVv5Zt4wtRpser3p7QNoK
         Bd6KA1c7v/uXAgzcCLODw8zyKcYj4k0Cc9x4HNaL+9mzESQ39HKoaVzLP5u8rUS6h3QS
         xqNl9HDBKn1KsgV7mpdOki5g3wMAYmVod4OwM9VDcJhxnJJfuKatl7tmyiOmAOOiQWs8
         fZGZ1RyuZcIcc7zP/xADrB5d7ntJyFr4HyrJ5vBpnqlHJnitWVJYL+lZ6+u+M2cj3u6T
         Li7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7S85Z16eqmxjvMi+R450sz/jCD08hapdQq20bxkJhIQ=;
        b=aU8gHHnYCostOKFQgGGd9j4wuCQ+mXKnkDv6EijQEykDrjd/aqLO/XAIU/9HOPfrh0
         0bl4eMibMSBZPgcWOzk5d9wctvkbG04FEDYQu0M3E7zlKtSa5V1bOtl+iFZwiyufmZl6
         l2Qf9iZvYP6uuYhPwkoRgXTyhC0Qm1/fPRMApDyLM4APCLpNovGRqWY81zqy4Q+weJRs
         jNlnG4srXapqcqg/Cw+Q7bnzm/aSIxrFDpTG7lJXutTxiCXwRh6cZfknYVBB0mzdzJ8S
         df/SqhZyg7yi47VqFoYAR7RrEqga+7170e152imrklhWzIaKWs/mSiJJiqWBMyEMXhr0
         KIQQ==
X-Gm-Message-State: APjAAAVbKGXraN5XAyD0FRIsvJL+ztm16MVCJ4rx35i8fZyz+Ypd68GH
        8txlXRylNON711zFfWJYGr1V
X-Google-Smtp-Source: APXvYqyMf//YphrDSapCyYZlFpndVYwzVoxvk6U4mfcZQ1EDwhJ5RM7JEHNQxeaT6p0MQgWyo+MMUQ==
X-Received: by 2002:a63:1d60:: with SMTP id d32mr5831688pgm.37.1570966868275;
        Sun, 13 Oct 2019 04:41:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8e:4f53:b957:652b:7622:f311])
        by smtp.gmail.com with ESMTPSA id g12sm23165736pfb.97.2019.10.13.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 04:41:07 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/4] MAINTAINERS: Add entry for RDA Micro GPIO driver and binding
Date:   Sun, 13 Oct 2019 17:10:37 +0530
Message-Id: <20191013114037.9845-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
References: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add MAINTAINERS entry for RDA Micro GPIO driver and devicetree binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a69e6db80c79..0303502cd146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2150,9 +2150,11 @@ L:	linux-unisoc@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/boot/dts/rda8810pl-*
 F:	drivers/clocksource/timer-rda.c
+F:	drivers/gpio/gpio-rda.c
 F:	drivers/irqchip/irq-rda-intc.c
 F:	drivers/tty/serial/rda-uart.c
 F:	Documentation/devicetree/bindings/arm/rda.yaml
+F:	Documentation/devicetree/bindings/gpio/gpio-rda.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/rda,8810pl-intc.txt
 F:	Documentation/devicetree/bindings/serial/rda,8810pl-uart.txt
 F:	Documentation/devicetree/bindings/timer/rda,8810pl-timer.txt
-- 
2.17.1

