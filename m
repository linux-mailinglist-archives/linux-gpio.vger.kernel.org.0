Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9751E861F3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 14:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390082AbfHHMdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 08:33:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39187 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389937AbfHHMdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 08:33:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so88660893ljh.6
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3d/YX3xQUjSdE9XgrTOBh4aQEajQ1l3t0t0ocHH6eps=;
        b=jhTNJAxa+jhwaNI6QsPD3ImdY6WbZnDzaJe2M7EiDGf59pHNsDrmM7AO83NaMAImWv
         2hTvJouMXMluWwjsq4Hh0ZtE/MYGRJV+T9Ezh1whUyTbMO9mu+14iksUt5IZ6An4gvzW
         JN9OPeQp9MVuHTgpDI9E0JrHyyIjBCNmk0bGXvWpq9HfnFnyxem7V/+lwxVH2I5wokpn
         ADk8GP2mYdVeHZQNSs9D42Cr7iQ+aoTSFO/ejFW2DfK/+POCd5KRUUKucFznFeA4Fu5D
         y3Q5XtTvLzLF5ClRcCZOyRD/SGGn8oK9IkM3cy/bnv/Ndwd4UX2VcftLEXAnHs4DXGnT
         Z4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3d/YX3xQUjSdE9XgrTOBh4aQEajQ1l3t0t0ocHH6eps=;
        b=Mx3gEz0VG6km1pUCgxeYW9Wv+MMJK10ysY5Y15cd6GsoBMMs9BF/E7G9XFtmry7ErC
         up8GPGqoKtMjgcNgc7PvaIzoc3o/2pB2dxFWTKEkTmwz2v2JDlGsr3GxsSGo1GBxk4Ex
         cd/O5eAxVlX1j1LRUaQsztfRB/ZVVFZQpH/rU3jhuebLldowBK00TJJJK7A1pD65nwOb
         X8c6DzFXQVsoDhDCalEeOfu6VAcYMvud6ubRwyITCj5CoAzgFuxvDo8Uav6wwiSaFHM4
         xi0pX4XUJV9JRDnQ62AtihzYIYaEaX1fYIQeRCjzoDx5mpucBg6CY8PaQmnp5kSJ07Ev
         YThQ==
X-Gm-Message-State: APjAAAXKr8O0UO2F7k/fk+luKq+rBKAs6pGdfNKz6qIbolec0p5SMgBs
        CTyRGd2jNKPIc0YilpBEW7jMMkUGtqs=
X-Google-Smtp-Source: APXvYqxF7a7kbgnO/zvUbx0/DcEWLrukhCG34h9W+Krc3NoG9YsiT7nHX4clcO9C+bW/oII22nfRcg==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr8050165ljj.162.1565267582297;
        Thu, 08 Aug 2019 05:33:02 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h10sm16976423lfp.33.2019.08.08.05.33.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 05:33:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 6/6 v2] RFT: gpio: uniphier: Restrict valid interrupts
Date:   Thu,  8 Aug 2019 14:32:42 +0200
Message-Id: <20190808123242.5359-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808123242.5359-1-linus.walleij@linaro.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Uniphier GPIO can only create interrupt mappings on
GPIOs offset 0..23. Set the valid_mask in the struct
gpio_irqchip and clear bits 24..ngpios indicating that
these can not be mapped to interrupts.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog RFT -> RTF v2:
- New patch to set the valid mask for the interrupts.
---
 drivers/gpio/gpio-uniphier.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 86e8446215fc..9840fcf7de57 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -338,6 +338,7 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	girq->child_to_parent_hwirq = uniphier_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
+	girq->need_valid_mask = true;
 
 	uniphier_gpio_hw_init(priv);
 
@@ -345,6 +346,10 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Only GPIOs 0..UNIPHIER_GPIO_IRQ_MAX_NUM are valid for interrupts */
+	bitmap_clear(girq->valid_mask, UNIPHIER_GPIO_IRQ_MAX_NUM,
+		     ngpios - UNIPHIER_GPIO_IRQ_MAX_NUM);
+
 	platform_set_drvdata(pdev, priv);
 
 	return 0;
-- 
2.21.0

