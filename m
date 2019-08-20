Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCCB95CFA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 13:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbfHTLNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 07:13:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39642 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfHTLNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 07:13:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so4735722ljj.6
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RV72oa93aa21BIj70xfyR68IqcSR3HA7Zwoa8K8PK0U=;
        b=hMw3t7tN01xbKsM0iQTAF4zV57CzfDEHvLzZnqQjyOgYLH3BinWYTnHrMRg2Csabf1
         4/GhhRuppUB1YkgcBqj7guE3ts8lAIFy5c00brx12/e8TMiDymSKB4FNf+TvjobvgFHe
         6KGNbiVRY09er24vJBhl9ECJDeH93y2VriYvlfXUVca+Ch2RMUXhKM6U5gE3H7NnVA4M
         WcPJ4r0vnfc/krgHcpcan1wUXK6+ORxREw7xHAJk0PlbUCwppbUdmh7Q+4SdfMhjJpYv
         yRK73qrk1qyTjM6E/SkqSlwIclzraCAACQsYdX0MIn4NPfk7SREy1pyyatiqROSR8niw
         LARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RV72oa93aa21BIj70xfyR68IqcSR3HA7Zwoa8K8PK0U=;
        b=Lgiu8fnJ0Rcd4Yy2+YPUG7gr+LZ1kCW0c4v4ovS9eltfGXehLhL4VT5XuLXEJ8vOwC
         fbD81zt3JdqHyLUaIUz5BoSzdM6Xfbe6bf0sEYdpGELVUYVxjo7yFq+0lLzvO6X9D/yq
         jDFUuRx/DCfWpZwSUhjKSRmW39PFFxDyD09GBX8S05X917dOS6bOWBYgAbhA1ofdrOnu
         +wgSxH1lmLky3rRy79wy7wEQgwPPR/1BXbeTmD3hmtOLaUeAPjw5+jqc0BRA4YUMkn5T
         J8lHjj/3hRPI7li6tKqLil05f24NyU7qrn5VnuBpIaKLUiw3iCSrE5YTPATfjjuOkmYD
         aETg==
X-Gm-Message-State: APjAAAUQ14t/K+vSei1YJyxHD6gTrQmwaoIxl7OlL1lKN3LoJaAimBqT
        Uj/oIOt2jXQrJ8OsQ52D6k4Jjl8kF7/P4g==
X-Google-Smtp-Source: APXvYqx7lfGpr2EeoLbC0RZtdSqjN3f6TDpna7h/TS7RYm1b0rr8SCkkDA9DQIF0aXvYiwG4u0sS6A==
X-Received: by 2002:a2e:8e99:: with SMTP id z25mr15473746ljk.121.1566299618876;
        Tue, 20 Aug 2019 04:13:38 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id r89sm2749433ljr.75.2019.08.20.04.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 04:13:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>
Subject: [PATCH v2] pinctrl: st: Include the right header
Date:   Tue, 20 Aug 2019 13:11:35 +0200
Message-Id: <20190820111135.10701-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ST pinctrl driver wants to provode a gpio_chip but is not
including the header for this, fix the inclusion to use the right
header. <linux/of_gpio.h> has to remain as the driver is calling
of_get_named_gpio().

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Include <linux/of_gpio.h> again, the driver is indeed using
  it.
- Add an explanatory comment.
---
 drivers/pinctrl/pinctrl-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index b9688ea548da..25236b716fb3 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -12,8 +12,9 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
+#include <linux/of_gpio.h> /* of_get_named_gpio() */
 #include <linux/of_address.h>
+#include <linux/gpio/driver.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/pinctrl/pinctrl.h>
-- 
2.21.0

