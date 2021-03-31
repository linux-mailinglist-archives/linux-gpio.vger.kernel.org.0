Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CD43500A6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbhCaMtp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbhCaMtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:49:42 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EDABC061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:49:41 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u4so23718535ljo.6
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ulErVBvInkOJe7cRGIy9V1u53MlKrZJX75o8Yw4nPc=;
        b=x/aep+x8b+Alhu8B2lTTV2tNf1Ykms1BqDiePg9M0bKlGil6HDRU/0atlIHZoPafJq
         SV5176iXvapJf/QnVYMRbmDpXiHbZsTWuDi2OpS4JCu+XismJI+Clgu6HywFNtTnqt1U
         CQO4t+7S/NT/Etlsd8vC8FNxkbs0xQEwa7IJ9B0aP1X5XVikXSTCWFsqVcMrvD1m9+j8
         o7+6Di860jaTLZdetCx/gk6Wf3nNU84ZlOlFKgF2r4GVExEUIe3NF3vwte+bMK7gPYc8
         fcTsgYadu8uIUBhn9g2+Exk15B8CNSlVCa1gvDlCQoBCm/4BHNiLDGDzMNgz/TfYrc6N
         Tu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ulErVBvInkOJe7cRGIy9V1u53MlKrZJX75o8Yw4nPc=;
        b=cd+7D53rusjvvTNHPEpjLIXhhtwDAG0SbHUw07OAxV+FsnCtlp0zSIb3iZt5xeD8HF
         qGBCrFGV+tUnlI/H+1iJVzdCBhNXHItn56qlDwHlMEgCvtHkivKtr+WMYGBFOhd1B1Su
         ZpZpbIIneuxZRSp8/4GyO/7HZvuHGWrMUy7mlbda76SZZlKjpZhg69p+md1eXx4D9bHl
         tWN5yyPWpqysmn9yjcTEWrT0k7rElzzNILEFtR3bUOfCWvf5guDsMPp5qXpAiB/lWqKG
         p8mxXGrCaBV0cQrxQ9HNI+R2HTID4gE3X3QmcJ4tR0/qV6VWio1Ykip2LlClLRBzzXHf
         a1fA==
X-Gm-Message-State: AOAM531bFCl3Ru0RHjZL+dcyZOoTxcFQGc33h0t4U/i9cxc5PtfEjns2
        1yIO5bIEKTpsp/6We+W6GpUEru7uC6QiBfGJ
X-Google-Smtp-Source: ABdhPJxFcHP3HcYkWYMWDvUdftL4jDo12SqDm9hcWO+pbis89rpW+5cBbm5GYI7ZxR8azGDSD+7VuA==
X-Received: by 2002:a2e:8e34:: with SMTP id r20mr2067646ljk.114.1617194980297;
        Wed, 31 Mar 2021 05:49:40 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id b25sm228109lfo.72.2021.03.31.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:49:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] pinctrl: bcm63xx: Fix dependencies
Date:   Wed, 31 Mar 2021 14:47:33 +0200
Message-Id: <20210331124733.2059013-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add depends on OF so we don't get weird build errors on
randconfig.

Also order selects the same as the other drivers for
pure aestetic reasons.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 33660e8fec05..17615674ac1a 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -31,10 +31,12 @@ config PINCTRL_BCM2835
 
 config PINCTRL_BCM63XX
 	bool
+	depends on OF
+	select PINMUX
+	select PINCONF
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIO_REGMAP
-	select PINCONF
-	select PINMUX
 
 config PINCTRL_BCM6318
 	bool "Broadcom BCM6318 GPIO driver"
-- 
2.29.2

