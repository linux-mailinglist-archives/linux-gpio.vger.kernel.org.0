Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888F08CC56
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 09:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHNHOZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 03:14:25 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36039 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfHNHOZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 03:14:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id u15so8873432ljl.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vzNdtC8eX7MpmDhIFLfHQyAcpvn92eSgt/TFjGXPsRs=;
        b=aJM7HjKJ2xaYN59M33vWejI8189ote6KiCg6X6Rzip5OdbU3PTs4Cvskk8ywaHZ0Kr
         Pp9D1QP7KshiRBsF562oneoSDzaoUk/6Mwl4OefY6Obo0dUjJW3dRr435IvZj8mFgRgR
         VaxVVX2r705T+bdN6iLbKeHNgyRbz5DRVBkQ9FVOpPmPPA8IKxTgf/E0ZA69oB1Qlq7j
         +m+TwROEkRapkWIKqpXoejL4tPcRhAd/Ql7V0OjECjUgR7LsnmAN8/eEzySwm6uxbyWZ
         hlkRwWM3VEJBnMJFU/YvVp2pOu0TigUpV4PL74d6o7UKDuXa9iAdtZ1TDDSu8UF3xdag
         lm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vzNdtC8eX7MpmDhIFLfHQyAcpvn92eSgt/TFjGXPsRs=;
        b=hHhBIV4mSuVfQ44qAg8Ui5QnVur/yR9//yRmqiVGOK4w6snLQ2DDioM1AwiOchlU1I
         jYAzIFJ/6JoZ+GkQMcIcZFWTKVHV3rCGrIgX3oFLEbaNNilJ/17GFdhgGTEDesgEQ8OD
         Y9KloS9FYNp7laOYGJQYVgPqulgKuuPtxE7d33rTBOyjc/xaQLMCceNmxPa4vry5HVZd
         NhH4TQs3qCv1RYwzZ0wB7V0sJjmPAcZHera3GhTuOXTFC7LKc2rpDctE/HcnMtKeroL5
         vl+NkITQYyGqDzuBnAM4zjy4f4DnjtYDuFn71eYcoWTwM7NoPSjwCT8bh0GDsM2KOORH
         N7Fg==
X-Gm-Message-State: APjAAAXZHNOkEuRz2OJCLiAUQ3k7rCWPkQMJjPHa7RGGqs683/wRkDYV
        fnzfg7cPX9OWzwfVYVf+mIIgfKyV6gQ=
X-Google-Smtp-Source: APXvYqyheV0two14elqlLfl9E260KSFL9v9S98J8QJ+DG2bLWJuu3HCVz+Mpt8fgUAhOhcJx/TryGQ==
X-Received: by 2002:a2e:8455:: with SMTP id u21mr23107661ljh.20.1565766863327;
        Wed, 14 Aug 2019 00:14:23 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h1sm20047348lfj.21.2019.08.14.00.14.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 00:14:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <maxime.coquelin@st.com>
Subject: [PATCH] pinctrl: st: Include the right header
Date:   Wed, 14 Aug 2019 09:14:19 +0200
Message-Id: <20190814071419.4773-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ST pinctrl driver wants to provode a gpio_chip but is using
the wrong header for this, fix the inclusion to use the right
header.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index b9688ea548da..422bc8ec72ea 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -12,8 +12,8 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <linux/of_address.h>
+#include <linux/gpio/driver.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/pinctrl/pinctrl.h>
-- 
2.21.0

