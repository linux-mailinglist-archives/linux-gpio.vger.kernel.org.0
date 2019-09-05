Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C36BA97E5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 03:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIEBQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 21:16:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42810 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIEBQr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 21:16:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id w22so564926pfi.9;
        Wed, 04 Sep 2019 18:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOasyZt6sdsNwBn8Gt+vfPwKrru431DH9AuzyGk0MuE=;
        b=Rfio1YTOgo6pg+zve3gTIxmDdPAyguIP5ao4mD3EW1H3R3pwjr/wjhxDn0mTuBoLDb
         jhkvz2jscbKJ83LdJFeb7QPvgQhC6+fpObLqg4NgUA9c7jsFm2LIixt+nnSoWHrZ16Jp
         SbXQiJHsCdwbl9tWrbitPt95fQyxPOnAOBeAgasuMLFSE2zmTK/LtD4/1YuX+jb+NBdf
         vxaCY1HEU2SAvrt+GoBj1klUkN5hJpGfk4sZQRk6OT3mJL7H0BFF8GEsNSxvn8nlcO5h
         tATs6goGtXHeV6kAGYx0Myl/2uRjs2WWqd+9wLX3SDbN53fZVqqgVRNDWXe2TCeI9GXy
         KYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOasyZt6sdsNwBn8Gt+vfPwKrru431DH9AuzyGk0MuE=;
        b=ncATmaUAsYLfsX6iBJvkeasQdMHQxbgsY3bi1oAR8Db4xwRbCyXbfEPvs4hbm8nZtK
         xB+r6uppBYrX2jYdlkBe1mEzYkDUMbjCS8sRR11npPekC6Gx9zmpxLpjV9tEeddl/jyO
         D7Cxam5Xd96ZAASdC+NBH7PRnvLHMyRS701BwxohDNBRmfkn9mWPe5vbHzo8IzfMG0HL
         VOeGyWItClA60ilVZvz55t3WVTqIVL+bBHdOD6rg6ujAP7Zja+ipyAujLdzD7em/dGli
         /bk0KTyVSHhJsoCWFwAM0px5wTABrKhdqdT5NZuhBfT7zsf2vE+qy+OyIgsnaLQot5up
         tT9Q==
X-Gm-Message-State: APjAAAWK4qY+rCVePmwiUWUE67ebbzjjnOi/hKOLM221XN4i8Oq0GvCj
        rY1D0vxmnZGsYfbyyPSQLqo=
X-Google-Smtp-Source: APXvYqzTX/4P+wtUjwav6k/1/i7Nh0oj0E26EmN9zScuJ0JIlRTGuq0FjCWnfFgRvHJ73C7n7rDdow==
X-Received: by 2002:a17:90a:350:: with SMTP id 16mr1054780pjf.110.1567646206375;
        Wed, 04 Sep 2019 18:16:46 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id v27sm329968pgn.76.2019.09.04.18.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 18:16:45 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] gpio/aspeed: Fix incorrect number of banks
Date:   Thu,  5 Sep 2019 11:16:35 +1000
Message-Id: <20190905011635.15902-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current calculation for the number of GPIO banks is only correct if
the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
currently say there are 0 banks, which is incorrect).

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..b83e23aecd18 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

