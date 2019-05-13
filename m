Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC331B487
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 13:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfEMLHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 07:07:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44585 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfEMLHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 07:07:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id c5so14715437wrs.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joFk2vw1b9zf6hiTjDnpMJcZIpL/g6IZ7hW2RareD7c=;
        b=MYCcrehvrw9WbobBcFixUBYT4uo9CilXYhYwy/EKwyHwGtLGM18IFHRXHSsu+hW9rW
         AJTJ0k0T+MGpHr4vHMTuWfP33Z1ZJkSLP3AYeMEVDm32aWPwItHAUSDuGrirw+5jjEJC
         G+bE8CRgqtSW9B4KzA4hEi3CzXLKIxYLhwZ8X9GLalZx0QeNoWL31h+r80srHYdfH/ZA
         jpOE3Nlhg0Jlra4+1+6RJ8J2d/J8A2nSVIAMK0gIkjU77wNnSbMSdz7pwO8r9Pcx4tGa
         6pq7Ra0gL4VFHqSNSCPJ+vkn26uzWbl4bIfXzrsv0ChASG9RNqP1Y/iFaU8fn8e4h52c
         xV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joFk2vw1b9zf6hiTjDnpMJcZIpL/g6IZ7hW2RareD7c=;
        b=iVI/1GUu4BaT9URKRwOkr4kBKG3uQyB0LOUVYBddOUxfoTtx3A8HQ1hXDPopEsxNLe
         M1eEQ1p5ijl73ZVD0wtm37X2k0jJBf38htvtCdFURW076OXu/H49osYAcC2no2eYWndD
         566WQcjLyNjLVqIq1LGruxBiuus7qOk50a+wWkkZNgiOu8LEQY9mJFwK0GobhVIM4OBy
         HuCfdEcEHfSD8TDh7heF3aRMNsDtHywBLvxwaIM+kJah+go/B25KlXWCU05ziKsH2Mw9
         DIfBAmxQCCBsE5x2abvfZLULLS5Yc6Oapwp3NCi9MGB05QvNC6Tflzcm2NAcyMtrpYqX
         DyaQ==
X-Gm-Message-State: APjAAAVsLECjHMXc/nFMZjBiNHo6+ywI/NESPzA7ZDegf1FpIBGtDT0E
        1FB696doLWh0AEcZjXqauoiDTYSWQYc=
X-Google-Smtp-Source: APXvYqz86HgWJ0p1+CM2GFCs8la1i2myuKpR5mOCiMQC9Tvo7CSld84NiFvqeNHoGQUoGtq8409nhA==
X-Received: by 2002:adf:db87:: with SMTP id u7mr4723827wri.245.1557745621570;
        Mon, 13 May 2019 04:07:01 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id r64sm29005194wmr.0.2019.05.13.04.07.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 04:07:01 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 2/2] Mark MCP23S08 as one that will not sleep.
Date:   Mon, 13 May 2019 12:06:55 +0100
Message-Id: <20190513110655.14920-2-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513110655.14920-1-joe.burmeister@devtank.co.uk>
References: <20190513110655.14920-1-joe.burmeister@devtank.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Though it has a 'standby' it doesn't appear to be an issue and
marking the chip with can_sleep means gpiolib.c won't allow its
use as a interrupt controller.

Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 7334d8eb9135..3fc63cb5b332 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return PTR_ERR(mcp->regmap);
 
 	mcp->chip.base = base;
-	mcp->chip.can_sleep = false;
+	mcp->chip.can_sleep = true;
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
 
-- 
2.20.1

