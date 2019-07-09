Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85FB8636FD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 15:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfGINbl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 09:31:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45822 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGINbl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 09:31:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so19547262lje.12
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2019 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WbD3hcaDn1BfG/Ja5p7aRO1UgtIkLxYNpjULSulK7M=;
        b=N1HVBzEWybI77xIwHVChIDoowZZ9ZsRZ2aWRWGegBgaUYWyy+MzGsT6Vb+4Pvh1HJs
         HaPesePZlna/n2BMENvRPq0Qr0n/6KSzlZi4c8riewkwgX93rgpbNJ7dxfuinwrd90on
         YtJ98CVycq/mNrXg9Fwty93HYi8g74AblS6XqoYtQMu5s2tmT1912xqvL08sOYiRhF9+
         +6wgpz19JcMbNPMcQt0tTWFC7SBjd9vuOZkWGXtfFRjdPf4fPm/IGWZs9j/jhZel9cfu
         hjNX4UrAfPB1ShL9yQKx4LL5jDaU34I0civNTZwZO0yXSWQe65kF8veWUopr/c4TbDh0
         AZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4WbD3hcaDn1BfG/Ja5p7aRO1UgtIkLxYNpjULSulK7M=;
        b=fjyQWgnwafSTX7cfziE/kaL4178hvUF+LpQLVEQbnV8W2LswPBAABdo0nJmH0Y0I1n
         T4l4Aint2KLX37QrWkm3DQ3kqSblFVCmZSP3n2AIuOyA7EsChWcACJSal6cstiCpj36l
         Me1F/V3YylBtQD0qE3mBdwX+knG/jc8Y2Gai8rZZw0LwJbT5VVrc01mKyW2UJL0iuCaW
         cwhamsajGgsn+37jwKdVvPm4dX1eIZEPFaWVCNmdRIhp3bTZCWRk29ZmD16+6qRByOU+
         YRedUYBsi+Fdn30gkyqY6cs9cuJGE4X8C+sduNeXG2ep9KbHorunSpkDHuDj0Ey+TtF4
         6KUQ==
X-Gm-Message-State: APjAAAWvwg1mZf93Btt8TeuCEbXcNhzwxTb9tmMhGH38kxwvN41nn0ht
        yp+WIWCHT0g2ijQeGVOFk3yhvTMbfEM=
X-Google-Smtp-Source: APXvYqzIWEVDa3pFsbkLV0jqu9fo2YSOtjBuZ0377VtdupEFUSliM33d3q0juoSWIBN5B9S4Ra6MSA==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr13820182ljk.106.1562679099031;
        Tue, 09 Jul 2019 06:31:39 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m17sm4355523lji.16.2019.07.09.06.31.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 06:31:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] pinctrl: aspeed: Fix missed include
Date:   Tue,  9 Jul 2019 15:31:36 +0200
Message-Id: <20190709133136.2807-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some SPDX churn made my fixes drop an important include
from the Aspeed pinctrl header. Fix it up.

Cc: Andrew Jeffery <andrew@aj.id.au>
Reported-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 9b20b1c03802..b7790395aead 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -16,6 +16,8 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/regmap.h>
 
+#include "pinmux-aspeed.h"
+
 /*
  * The ASPEED SoCs provide typically more than 200 pins for GPIO and other
  * functions. The SoC function enabled on a pin is determined on a priority
-- 
2.21.0

