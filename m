Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B733F8790
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Aug 2021 14:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbhHZMgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Aug 2021 08:36:05 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:56040
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233929AbhHZMgE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Aug 2021 08:36:04 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 5543F3F245;
        Thu, 26 Aug 2021 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629981316;
        bh=hp/MGwugmtywXw2ouaoVTIlnX+WgZIai2/xh2cUr2SE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=vj++iI24UhSMwzLKDFbOFLm1z55vHiUy2Q4Hj9+NVI4d7JC5s8w4ujbfHfqz5lWns
         ket4JbG3nJKhmF8vyKueCijMUcDJtnRAVybkn/USjuB/C3K1N6+YRUf4erByyaQJWn
         pOM+6H3+9K8Yn4AznHv77f4YxS6anpc1e1AWbElCd+5WxTNZ2yTqgtNJ0JGkKqjOjw
         suyegC6Bz7mACPKsHNJOsM5lY+a5Mz2Vs4zCMvCan1y6p9riv6BBTy51lh1tgQO7x+
         3LUtlXAUp//fD4l3VnIsUEZ+Ru/tGFYJ7bq1cs3a+zb7zDYACrCM6G5Q1TrQ3eTeGx
         ziv/QQgYa7Bng==
From:   Colin King <colin.king@canonical.com>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: Fix spelling mistake "atleast" -> "at least"
Date:   Thu, 26 Aug 2021 13:35:16 +0100
Message-Id: <20210826123516.14441-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fa3edb4b898a..1482a01dfec7 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1588,7 +1588,7 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 
 	st_pctl_dt_child_count(info, np);
 	if (!info->nbanks) {
-		dev_err(&pdev->dev, "you need atleast one gpio bank\n");
+		dev_err(&pdev->dev, "you need at least one gpio bank\n");
 		return -EINVAL;
 	}
 
-- 
2.32.0

