Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1309B1BECE0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgD3AKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 20:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726282AbgD3AKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 20:10:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2656AC03C1AE;
        Wed, 29 Apr 2020 17:10:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so1951267pfc.12;
        Wed, 29 Apr 2020 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0Uv2a8SpWt1dTnmxZxhtVMKOvjS4ym5W5xsfvNLKFk=;
        b=cqZlXLKlr6kvQbC0dL7m42EaWEosWMCnT7t7YFh0HujWAh492foEsN/2JJdJimAx8K
         LxZnPhu35w27UkiJt9ED7pUXUn/0g1kU+yfHaKM9xmMM5+dRu9eJnuAyLKWUilRUZq9z
         YI9LEhBrx++jmdHpvoAtuqS5kzvCKtcXaJIUwxiiTvlQvXN7xR0haNkjar7AaS9xIWNz
         fXq0lyWucBs4aaToG16hy0cII4NBeMDuFXuMvadKDI3M9LXbgTby23hUpN5ZupHs3lML
         dtHI2yMxi9K9QnP34MaE9OBy2zk5JuoTTE20Yu8Xi1PPCFEB7nObb2eAd6LxvNdvArjX
         dJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0Uv2a8SpWt1dTnmxZxhtVMKOvjS4ym5W5xsfvNLKFk=;
        b=UbHswpBIlvw+SXm7zYCDquPWknQD0rakW+UqPiDJyCkzCIXgV0ayd2yb+5I4g1btx7
         yC1V59BtK7jt2kSA8wyQv0wYuATR1qUapvFI9ao5awCpgFAJGV19YDf8uOOiiI4kuHn5
         k9qK2mX4VZABlm6WVc2GwLOGVEveC/Er5S2MGDohbxHWsGONlMTmMJjvUICETOLfxbg2
         XKdxUzp2BV9EN454zMehPVF8ocWzEDmZ1FphDv9KuoJyA0j5a2aOdeeymfHmoFhLl+fO
         fyTj6YYkNCKNDKnAJycf21L3hTpASsQup/SYkSSHWgg0JzI23bz9IzKIs/D4PZ51A9xd
         U4wQ==
X-Gm-Message-State: AGi0PuZIdsS5kS616/7t9v0LHSxcno1aaoplRffHvV1ADvNPbS74z+un
        wh9XiYdqObxTMjVQ/MPcymahZ2TlFW8=
X-Google-Smtp-Source: APiQypJYC8zD0qmO6c5Eh+Bv6Kzb/PYjHbxkvWbKcN7HSvcRqN/lpkh1qWyU7W2Dk48DP3vixKD1yw==
X-Received: by 2002:a63:c443:: with SMTP id m3mr803622pgg.262.1588205404045;
        Wed, 29 Apr 2020 17:10:04 -0700 (PDT)
Received: from sol.lan (220-235-85-217.dyn.iinet.net.au. [220.235.85.217])
        by smtp.gmail.com with ESMTPSA id 207sm1840592pgh.34.2020.04.29.17.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 17:10:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] tools/gpio: add bias flags to lsgpio
Date:   Thu, 30 Apr 2020 08:09:16 +0800
Message-Id: <20200430000916.8880-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add display of the bias flags.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index e1430f504c13..8a71ad36f83b 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -49,6 +49,18 @@ struct gpio_flag flagnames[] = {
 		.name = "open-source",
 		.mask = GPIOLINE_FLAG_OPEN_SOURCE,
 	},
+	{
+		.name = "pull-up",
+		.mask = GPIOLINE_FLAG_BIAS_PULL_UP,
+	},
+	{
+		.name = "pull-down",
+		.mask = GPIOLINE_FLAG_BIAS_PULL_DOWN,
+	},
+	{
+		.name = "bias-disabled",
+		.mask = GPIOLINE_FLAG_BIAS_DISABLE,
+	},
 };
 
 void print_flags(unsigned long flags)
-- 
2.26.2

