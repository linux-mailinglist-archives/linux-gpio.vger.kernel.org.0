Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E213B961D1
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbfHTOAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 10:00:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42358 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730115AbfHTOAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 10:00:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id l14so5217571ljj.9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdjrR163OvNQOzxW/RsIvv+HcRRibCJSVQsaILHRThk=;
        b=wHouE7ePHN8eNwsYy28BvJsYnIes3rPayPyN193n0neli/u9XOvq4HENFHhn5aRo7X
         oW+kMVxRNbXWC+apGuEFv/lxjJbVZtO1ZxR0UYu38x4NSZeD3qTM1jwggYcpWEx99CM1
         TVXzX3+rBreXuL4+oYDHs8GC2d3C1Bd54CweY8OfZSCPoGKWAstdwaKo4gs9sJLju161
         LJ61ETGhP5NpWm43vDIUxUzfVhqOPGNaD1zH4i2gZri+ONvHAW0wexokXlv93Os4hk6A
         N6NiZpq1qudPE+9egU2awXsbGTeQJpORpxRhCF9igAmheqq/VMsQd4izWsuti/FyylLM
         nj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdjrR163OvNQOzxW/RsIvv+HcRRibCJSVQsaILHRThk=;
        b=eg+nYR7G1XFvJUu9Glqn6PXNJp3RN7Kw9hXUTor9pAJnUcjXiX0Zer7KqzZC6J9NWp
         wltogjXlBSKpzfE6Uup3hZ6Vb+frVa+vo6Jzh/Sy5ZkP3n1sxR5DsVKDwY1UgT05z2PW
         /fm8AdKx4tGj52wHqCSiEKi2cs0JgygHQPAMH894p8AUXP+MzWlQOQiEKzBebhUSZMql
         9Mqr2RHPLXlAv8xKQgN3sPlh2f2p5ihi7Hep5Ok4/ER81NcGG6k1KzeTe+bFC5MlRA9q
         VwSG9SzBVeIFCy495w7Z6nPSpQpxbnp55kpKdfsYdZfN5mb3nT2TUfOZeL5n5GTOyE/l
         /pKg==
X-Gm-Message-State: APjAAAWtwqTADc6bXtkoDUykEDJEdWk+LUWivwd6He/vTJD3nv6GXgJ0
        a5SauT8htNW1FKm34791zJaIaulpDac=
X-Google-Smtp-Source: APXvYqyvKDtC7hphICx4vBeM3lHSPlzPLLSjl3Zvgwz83BqQSqIiKOBoRKZcuqZbAD6oYo2Nsovx/g==
X-Received: by 2002:a2e:9582:: with SMTP id w2mr15043166ljh.194.1566309602528;
        Tue, 20 Aug 2019 07:00:02 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id w6sm2871543lff.80.2019.08.20.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 07:00:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2 v3] pinctrl: rza2: Include the appropriate headers
Date:   Tue, 20 Aug 2019 15:59:55 +0200
Message-Id: <20190820135955.14391-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820135955.14391-1-linus.walleij@linaro.org>
References: <20190820135955.14391-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver is implementing a GPIO driver so include
<linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
When testing it turns out it also relies on implicit
inclusion of <linux/io.h> (readw etc) so make sure to
include that as well.

Cc: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLov v2->v3:
- Fix one more instance.
- Test compile properly.
ChangeLog v1->v2:
- Remove the use of GPIOF_* consumer flags in the driver.
---
 drivers/pinctrl/pinctrl-rza2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index b0806667e94c..3be1d833bf25 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -11,7 +11,8 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinmux.h>
-- 
2.21.0

