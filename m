Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F4239B229
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 07:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhFDFzm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 01:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFDFzm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 01:55:42 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A012C06174A;
        Thu,  3 Jun 2021 22:53:41 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h8so8008860wrz.8;
        Thu, 03 Jun 2021 22:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y+AffRCdJt0ZMld/96EBnadoeYCVbK0vn/bboy+A7Js=;
        b=c6XaSbWGw8LavmJHBjdCxG3+ms3wd6szfDkrBnZXnwjCMoDjm24502USpnzS9Tk9Hq
         nYFd21OF98pXiqN3dkcECVJzLCEJFqHdDjHhQLX77AdBZV0hI+Yt5inTcQU9lzS1S2lm
         LUAA/v3OD1LTFu8+WUobphsWhOl6/zX0opYkBu/0/Fjm8Imxh7kAjruzGgh3Korbdy9r
         ReOHRvkBwxZs/1qZSi2xTU9up9cdHZ5Tyh+eWPHyflh0XBfJEyrz/4tNAXAI8a9Q3Eqt
         0EU0hKCPxqqpcLEb+qB5q+AsyavjF6glgw2W7zqqFs/G8EGqOmbf9+307sx/Z7ub5WfM
         DhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y+AffRCdJt0ZMld/96EBnadoeYCVbK0vn/bboy+A7Js=;
        b=soQJl+6kaS8uszl6PA0QJ1kwux7UWnJa8781H0cTlF7S2Cb62cTls5wFAKij3peTM/
         Kowu4mLAz/xM+nfVTW8tKV6sDcP54xh5bCkmlsaiQZV4WZssUo07tzFIhgQs12nBZJfs
         3EP2rj57/A/8SlzBAWXO41cFOrUUqAn++Q3siCpkmC3LajGfTv2HQcUegFma8DLVDuaC
         7AUx9aJmBWO9G/kQhnSKWfYByrqSdraufjl65PG669MlHFvLL+USimJ+E8G9PWYsm6sg
         eaHsupibjadTxp5HT69fjPsAnclTXjoZfMUsnJt7YTGeaxG1iCct029nhveUDk+mBSal
         S5jQ==
X-Gm-Message-State: AOAM530M9QS7CaiOEWK3ruJTnedSwO6WQb/PdHGIlzQ8p6qDPcp9OaRI
        mYYDothP8t7ML1h7EugaNvftYD9TfYawWg==
X-Google-Smtp-Source: ABdhPJxJMFUXih9UhLuV22oqlaY2Od1zJNF5JCPBKKCy/w1+creSWfBAeal+4PuqUenQFJ0wUhElKA==
X-Received: by 2002:adf:de91:: with SMTP id w17mr1946843wrl.352.1622786019955;
        Thu, 03 Jun 2021 22:53:39 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id u18sm4618835wmj.15.2021.06.03.22.53.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jun 2021 22:53:39 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: ralink: pinctrl-rt2880: avoid to error in calls is pin is already enabled
Date:   Fri,  4 Jun 2021 07:53:37 +0200
Message-Id: <20210604055337.20407-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In 'rt2880_pmx_group_enable' driver is printing an error and returning
-EBUSY if a pin has been already enabled. This becomes in anoying messages
in the caller when this happens like the following:

rt2880-pinmux pinctrl: pcie is already enabled
mt7621-pci 1e140000.pcie: Error applying setting, reverse things back

To avoid this just print the already enabled message in the pinctrl
driver and return 0 instead to don't confuse the user with a real
bad problem.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 1f4bca854add..a9b511c7e850 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -127,7 +127,7 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	if (p->groups[group].enabled) {
 		dev_err(p->dev, "%s is already enabled\n",
 			p->groups[group].name);
-		return -EBUSY;
+		return 0;
 	}
 
 	p->groups[group].enabled = 1;
-- 
2.25.1

