Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851581A7036
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 02:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390540AbgDNAhg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 20:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390520AbgDNAhf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 20:37:35 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EA5C0A3BDC;
        Mon, 13 Apr 2020 17:37:33 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id j20so2132234edj.0;
        Mon, 13 Apr 2020 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ji43IE1bftwYizBHoZlC7/uT/8SnmPOaZiZXALCB9zs=;
        b=qfHOKJv/Xqjjy5+2x5jxtYRYOgVDbDQKDd2T7C9Sb3Vs17lYOrl62Nc0sn00u2asCg
         0HR23YDfGqrStkBj4TJCItH8NJi4MdwDs8IGr+a9P6bXgb/5Anh5SPJdXROEqxK7fPy6
         ZIA4gx/0Hp0xN8A23YAJz1fzkgx7rojVq/K+E6JM3i+bhi1TVZMfr/oji7xwkC80KqQf
         YoTZl/x+4t9if7Hq4hPiDusjgHqFtuGbPZoAaVWighgOIMao+kj8oT8TKriXXmx5t221
         Q9DsCx9BwzrXX3JWxk/P3eZgz/jBymctHKecGSAbKWMNSXcAOzFRfkuu9+l9hp/bklXQ
         Km7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ji43IE1bftwYizBHoZlC7/uT/8SnmPOaZiZXALCB9zs=;
        b=JiRFhliiJSBotFeUOn7YwbiaNZe/xCoUBEAF2Svd5pSYd/1sv8pK7JEKIKkLoOSYkG
         NhWNt9Fx0+ECuBIdq2GS8epQhGqfRHnud307lPSZajJyy85wM2eovlzkGXGH6iNcw5+P
         ZAQ19xh2ZNObDYXN+3UKfTFynynw3G3TRqJL+cJeo7lRy3xuAivdJccwy8OYhBO5oK7i
         XGXzqIVQ4Yw6UPrnOg8+n02cK+2LM9ml4UIzUzeGO1dI5M44pKaW8g4PqyZgIl/JbFjQ
         w1dLYai8txMM7mWPQxp9LzmSFaa6Xf1oB/yFcnVIMQ5sM7DkhNZkFppv98oKUDpp2sMD
         iseQ==
X-Gm-Message-State: AGi0PuaVHkZkN06gKy95ZrIEjuSjDjSOdF2/0yB72Ju6c/g886W2Xxk6
        MYXftIW9XnFFvn9/YeRePmY=
X-Google-Smtp-Source: APiQypLSPeVMtOBkEEOVW9sn/+Zs7n0byX39evNWxNuOsYsP1VzJR9fD/SSg9hcde7nAGChwvsTGuw==
X-Received: by 2002:a50:fb9a:: with SMTP id e26mr17271158edq.377.1586824652058;
        Mon, 13 Apr 2020 17:37:32 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host117-205-dynamic.180-80-r.retail.telecomitalia.it. [80.180.205.117])
        by smtp.googlemail.com with ESMTPSA id k18sm1705742ejq.84.2020.04.13.17.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 17:37:31 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: fix wrong write in update_dual_edge
Date:   Tue, 14 Apr 2020 02:37:26 +0200
Message-Id: <20200414003726.25347-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a typo in the readl/writel accessor conversion where val is used
instead of pol changing the behavior of the original code.

Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 1a948c3f54b7..9f1c9951949e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -692,7 +692,7 @@ static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
 
 		pol = msm_readl_intr_cfg(pctrl, g);
 		pol ^= BIT(g->intr_polarity_bit);
-		msm_writel_intr_cfg(val, pctrl, g);
+		msm_writel_intr_cfg(pol, pctrl, g);
 
 		val2 = msm_readl_io(pctrl, g) & BIT(g->in_bit);
 		intstat = msm_readl_intr_status(pctrl, g);
-- 
2.25.1

