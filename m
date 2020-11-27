Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BDC2C677A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 15:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbgK0OJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 09:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgK0OJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 09:09:01 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E31C0613D1;
        Fri, 27 Nov 2020 06:09:01 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id u10so1790840wmm.0;
        Fri, 27 Nov 2020 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZJTti8yXsuDFqHTAvXs9MG72Seai+GqJnoEIac8Cs4=;
        b=LwIp3+qJKHXmXYp7p3MtGSdlnadYuz8Z+NYoL8jZaF6g9WyVQeZQb5XZVrZE6zQSB/
         of+hbUMN0aqxEvcH+uJqsgQYZGxwnymulzd9OV0fHPqRK1j41zz/NPgShxWHY/dUt3D+
         fVjVfNN4bRAZKyyvTRL1DYl2snUOvWvaPUoGf5GXWo/y3MfL4BrjF9mx6H1lZai5KgyS
         LXbP0yUSaZUBAQBq8iCAKdd7TCVM3P9yETruE/3o/y+scumfSio4mMBeMgZ0mXVjffOq
         uUKXin4vu4f6WF4aBK1+ME+eOlxqXlSYY7WoKApY4eo98Fc7d2NclqQoMwa7713nVNWq
         4lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZJTti8yXsuDFqHTAvXs9MG72Seai+GqJnoEIac8Cs4=;
        b=mZcbD5BnUIUf/q7VmE9aCIeCrfejKvOM3xHaKIUeb9JfUB0y/PVBkgGr/hseoFJaxE
         sUKD+U4rsrzdu21kV6r3nJGdqex+bpAp8Ar8joL9KduThGFITHragUtsFgbbxLEFSR5a
         JfpztY5Z2rRDgQ7oAgzGb9AEIXRUdWcXsNZzyB/T+gECUr4vFM9nmpNlrINbsm4t5L6r
         n96KK/FL9Rjs4qFHoSTV/4ofhWTV1zWfvNAq6d9o0w4RJ+Q7NcAkZLCKkXVbse9kB5rM
         UhBdcTciuMTxw2wgA9wKZ11Cxv1FE5nyRDoeC5T4z8Fc9rRSD9s1TqcspOOZHl7JQn9n
         H6dg==
X-Gm-Message-State: AOAM53265iNWV12Ywkn/E3mtez/hBqzY8yRYF/9CfKjv20n28rK2GGmJ
        izEgSSgpd6yBAJMXkJFzDEQ=
X-Google-Smtp-Source: ABdhPJy1K+7/XUfcpcBuT68JpUyWE2fRzvx9r3TweJymGF2z9yn/mnMYuAG7ZLUKbYHxeMckNX+Nxw==
X-Received: by 2002:a1c:5f84:: with SMTP id t126mr9328744wmb.172.1606486139792;
        Fri, 27 Nov 2020 06:08:59 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h20sm13113629wmb.29.2020.11.27.06.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:08:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpio: Use Tegra186-specific include guard
Date:   Fri, 27 Nov 2020 15:08:51 +0100
Message-Id: <20201127140852.123192-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127140852.123192-1-thierry.reding@gmail.com>
References: <20201127140852.123192-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use a unique include guard for the Tegra186 GPIO DT bindings header to
avoid clashes with the DT bindings header for earlier chips.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/gpio/tegra186-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/tegra186-gpio.h b/include/dt-bindings/gpio/tegra186-gpio.h
index 0782b05e2775..af0d9583be70 100644
--- a/include/dt-bindings/gpio/tegra186-gpio.h
+++ b/include/dt-bindings/gpio/tegra186-gpio.h
@@ -8,8 +8,8 @@
  * The second cell contains standard flag values specified in gpio.h.
  */
 
-#ifndef _DT_BINDINGS_GPIO_TEGRA_GPIO_H
-#define _DT_BINDINGS_GPIO_TEGRA_GPIO_H
+#ifndef _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA186_GPIO_H
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.29.2

