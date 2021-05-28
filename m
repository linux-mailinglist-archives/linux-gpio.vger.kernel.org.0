Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0F5393FC8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 11:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhE1JX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 05:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhE1JX0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 05:23:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DADC061574
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:21:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b26so4340564lfq.4
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RjwPM80jhf7QqwxBuTnbQa++n8LEjK65ba/1tBbzVfA=;
        b=wu7qxvtd9OJZMNKIdVAeANWw7VckJe0RlTmrWmCd2gVchxil2AMg1WiWdrsjttM6yO
         C2C+iWzGbdVEUTRS55wDUl7i6/zp/Z8IARku9mL8lgjcDRQ+6zp8o9QXM6qId7teZW8c
         rKKF5Ki5nHD96lPmFCUnZw1Yyw3+mVemnVzktDeWnQ5Wddqqm9nizZzAE6yU4seeb71t
         7Q3eCtYK6GlITJWa21EZkOz88WA+DkpjbV2bUvm2uQXQhzCLSLkTXiPifs9W+vAjaXW+
         9qsQBB/OzbPqsqP2Ilmw4hlc+30BHnUYzkueR/rLQeLg76PqE9mJg1HJHRJuZt/Uz0DL
         w15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RjwPM80jhf7QqwxBuTnbQa++n8LEjK65ba/1tBbzVfA=;
        b=eMm7NuWiHgKOhbbmbqi89TerYAtN+okIHlqKlh8nroK+jU04FwD1XI6VsFuCMA/MtW
         WDRXTEZM2f+FlTAqFtp+46U5uOUANwn961vV/Bqh6IGJhpTxgC3W5lqhtNx850Sy6/hO
         tgT+DFWRQpQDcnfAe/6SEgG1WRJka+r0C35OFHjV+4Pj3vHhTT/lEIIMU1KISwQsAOEL
         SBTbgFaDf+wcA4tYnHN95Vi44cDOtf0HusLdWxZ8I/hEkF901Ki2/aqpgQj1+dsRGiIp
         KDlRwwNSmAsbG8mPgBvcUl6eA2AMngRJFo29tiTRUAZwhAP3/+uTNFQ6B6dbJnex/eKX
         fUjQ==
X-Gm-Message-State: AOAM531zctq2hjnkfWiS6aM5bm6K9w+JeCo7rb3vRp5/xg+9GUeTUbk3
        rKnfr6+k2DzRhlAthR3VEwXdVV40QyZC5A==
X-Google-Smtp-Source: ABdhPJw8PFmbP9HkmnrGbK0n1IEf8aMX6vyMKLQ4vHz2OgKqo+BvjIekuj64H9miMsvB38FKIjwU0Q==
X-Received: by 2002:ac2:43d9:: with SMTP id u25mr5322114lfl.54.1622193709676;
        Fri, 28 May 2021 02:21:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m5sm498649ljg.118.2021.05.28.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:21:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: mediatek: move bit assignment
Date:   Fri, 28 May 2021 11:19:45 +0200
Message-Id: <20210528091945.411471-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bit needs offset to be defined which happens some lines
below. Looks like a bug. The kernel test robot complains:

drivers/pinctrl/mediatek/pinctrl-mtk-common.c:137:12:
warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
           bit = BIT(offset & pctl->devdata->mode_mask);
                     ^~~~~~

Fix it up by reverting to what was done before.

Cc: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-mediatek@lists.infradead.org
Fixes: 9f940d8ecf92 ("pinctrl: mediatek: don't hardcode mode encoding in common code")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 9fe91e11a877..525b1aa7f7a6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -134,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			pin, pctl->devdata->port_align, value, arg);
 	}
 
-	bit = BIT(offset & pctl->devdata->mode_mask);
+	bit = BIT(pin & 0xf);
 
 	if (arg == PIN_CONFIG_INPUT_ENABLE)
 		offset = pctl->devdata->ies_offset;
-- 
2.31.1

