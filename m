Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5279718B35C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgCSM1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34171 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgCSM1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id z15so2736488wrl.1;
        Thu, 19 Mar 2020 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t61mb6qLDf6pydus3SpO95pR09smLBtSSYCBNAzko/s=;
        b=CGpRkLuL3HhqmKTNfl2lIz4Ma3pBgZpVNWixkg5eE8sBHYJSfMsGgMElPvoycW1EmG
         EoUKulogkFkaHqHMjSRx7jvfnTyYGCxT7vQedxibrZ11dNPhKQVtKkfMk0H1Qf9HDS8G
         lZXFhFnswgYz8v76U2s9PQpMIKaMiM+vmj9BVMDvKeaV9Ie+VVDwO8bAwjUFRb1F8R8U
         LKSLf5HaOMyANv6+n4bKo9GNP6CxxqFaUIqQKqP0nj2K1g4U0kD0ktPP0Ang4T9R3yYv
         FFDfN9AX+0oLM3MB018NJVDaDQql6kysU7EeOAiXHXXIbMd9KUQUxPBTsW/id0ZCI3uF
         RbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t61mb6qLDf6pydus3SpO95pR09smLBtSSYCBNAzko/s=;
        b=r/Xb0DaBnT7JRItOJfBVSzBLwbSvKKRwxuWTzjOKFcMRwZjSTrcg0o9/+uMMNgekOO
         s61TWWKzrHlPx3w0H8AJyYJESkbECwh+m4IpA1KWZaAYp42JGToPQEsZSzsVX7VrTZla
         cmYgZKxKxJK8ozfEzwz63LeFIL6M4HwFknt/dBgW8vtlHdnD7pFzNXTxq8zrmqutxvBa
         YYnXUuixmaNfPWuvI4B7YK/i+P1stu3a/Phoh4SlCrtZIDNJELBT3rGx2Pl0vCs/vhxI
         Pf3gVpysXKlIUoX+8Yci2z+9Rnyhsm6qKnVugJB7DfbxIhu7Mv4scuVzPypgCh8vSJPy
         95ug==
X-Gm-Message-State: ANhLgQ28LLQWPe9/FPvbDdUQK7YWp0dDWPzK/dgtrNMqyFT6t1idqToE
        Hd998YKnn+I59brhAr97/X8=
X-Google-Smtp-Source: ADFU+vvbWBwA2px0IxYN/5Atp5gpxq/GLnbapY3F04BVMAv+SiJMw9760G3hRRxvL6LZWQVYEYd09A==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr4248215wrq.153.1584620866690;
        Thu, 19 Mar 2020 05:27:46 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id p8sm3369836wrw.19.2020.03.19.05.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
Date:   Thu, 19 Mar 2020 13:27:29 +0100
Message-Id: <20200319122737.3063291-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Wake gpiochip_generic_request() call into the pinctrl helpers only if a
GPIO controller had any pin-ranges assigned to it. This allows a driver
to unconditionally use this helper if it supports multiple devices of
which only a subset have pin-ranges assigned to them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f31b1d46599e..12f3c339da78 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2792,7 +2792,10 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
  */
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_request(chip->gpiodev->base + offset);
+	if (!list_empty(&chip->gpiodev->pin_ranges))
+		return pinctrl_gpio_request(chip->gpiodev->base + offset);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
-- 
2.24.1

