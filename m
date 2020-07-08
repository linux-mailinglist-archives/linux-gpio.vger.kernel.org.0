Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E02218C61
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbgGHP67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 11:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730455AbgGHP6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 11:58:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6300BC061A0B;
        Wed,  8 Jul 2020 08:58:54 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so54898016ljg.13;
        Wed, 08 Jul 2020 08:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3Kszy//dV/3ZrTCIiMY2zk03BLva2o1jpjsj31kgZc=;
        b=cQas3odOPQtQaLvgYDobztGG6g2gEYZ2Hg4fbddCnQZtOplm3zyXipgeF0h9B/kqKv
         L0cEB4uzqhWDx2eBXL91wx2LzXPDYh9nUo2yuja8uPPovI46c1+XS3W4NBDB3xV33sQ7
         IaSuvEay+d3bPI0UJoajKxhql7BbsBHyMJLfsRqPHyvqaMlmKSlbweBuFHekIj4NZVzS
         KfNGPZWZUlZKmmtwW/6+7K8qiPTgLsqmiWUIl1ymsnb7xywQMWzgee7nDnCQdpKbDXd1
         VDIvJ/McsukJztVxWQn2oPoISWZDSc8hcTGVVcXSW6UCooIEr9j4wQuZGAM1yalQRWhQ
         sbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3Kszy//dV/3ZrTCIiMY2zk03BLva2o1jpjsj31kgZc=;
        b=jidlL0hDHsBKj9Iwz/ldnZDhdUPdssajpr53gbOQrgtjQuqttkumC+vU1CuK4gd59o
         8AjNrlj1Sh71n0Z6vKMWE2UR1RacMG4kDMFerT+3IwWu/a7AFblUoW43jAPm3BIOb5uS
         eVlvd8btuYNxp9T+2VJYuEwHYmA+xSSmEdomJGHZRNa7Y31hpfTksCX1bIYgCadB+Rop
         J+Ldqn67XDixaPINfx6lhAbrZom3Km3pCkVOVHrm4I3WpWfV+9exgd33RtM4Qtx/8Ov8
         hCJOA/5SV6lGyJXfcio8fmuCx78Fft4BfpVTELj9XFVXUFBU+MFchmjpj4QAKBdnGTLZ
         wMVA==
X-Gm-Message-State: AOAM532A7gRlkuVASJN3ROmxiV7lPPWexOYyWtIBb/j617pBWJSSIZkx
        XKbYfeAOuabh8dfTYVFSEWE=
X-Google-Smtp-Source: ABdhPJyrpjpvYaDXRvcwQAr6Bs0kWI783MfxN1YD+81hFyE9gbvH6upZWVh5QOqda7MHyTpTdEMdXw==
X-Received: by 2002:a05:651c:2006:: with SMTP id s6mr22289969ljo.74.1594223932578;
        Wed, 08 Jul 2020 08:58:52 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id 16sm37977ljw.127.2020.07.08.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 08:58:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date:   Wed,  8 Jul 2020 18:58:34 +0300
Message-Id: <20200708155834.19762-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708155834.19762-1-digetx@gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
let's use it instead of a raw value in order to improve the code's
readability a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 970ad6397a56..08bd5b141437 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -19,8 +19,8 @@ struct max77620_gpio {
 	struct regmap		*rmap;
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
-	unsigned int		irq_type[8];
-	bool			irq_enabled[8];
+	unsigned int		irq_type[MAX77620_GPIO_NR];
+	bool			irq_enabled[MAX77620_GPIO_NR];
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 
 	pending = value;
 
-	for_each_set_bit(offset, &pending, 8) {
+	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
 		unsigned int virq;
 
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
-- 
2.26.0

