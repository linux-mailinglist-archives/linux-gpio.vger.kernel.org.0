Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F31ADAC3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 05:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfD2D0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Apr 2019 23:26:10 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35430 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbfD2D0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Apr 2019 23:26:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id t21so4620318pfh.2
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2019 20:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1t5XlT2MKDWHi6woYas868Il32PJ2FqSyI3/eucTk+M=;
        b=Y/5zs/kxPAO6IznP7l9z6tSm542jICmYfTeptX9Pgu6+SP/6pjsy+VlsKri0qNx3bW
         3CrDEh7MGVazLDHxtLnppmWeGBNx5qs9SjyrF8BGyDBmD5eGDy17qcfeFqswBBmiUIRW
         V78BmDvy9QIwm+aC9Xbe4TSHCO48cVQpBNwI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1t5XlT2MKDWHi6woYas868Il32PJ2FqSyI3/eucTk+M=;
        b=rBXqfgOvj25AHoEdO9bb/kTeWcexbAmSFt8ENKVqhr80ydsxiOO735t8kDVJ0zJiPr
         OydOS3XwZ35FNTni5hUaY82T1tPZ729+K6oXM64uITDW6DtY5kIgVN8FDPg4o/usRa/c
         88JTbD/fSQiJtLR0yhPKQrWkbt4+rW/Vk3XzRjsa6uYY5+lVLytDD8tOJrXMLw+Lxb8K
         RrZufegtdujDbMWPq3T35bYOUKa4xb5V7YETNEmfpV2mGHbKNKI9vB0p/R+zwdOGd5Fu
         hOG7GEz1KsnwAx3+0f6tx2tINwTE9cHn3d2240+WyB/kRyhelsKAxnBQWtzAKZfPRKVC
         hGkg==
X-Gm-Message-State: APjAAAUZVTULwSq9/O3W/ejqku3Se7SElOkZs7EmPccpE6nJXWycb3DC
        R4jji7WErTlZcJ+A4F3yHYjfzg==
X-Google-Smtp-Source: APXvYqwcxJtRHeC+jJ4mkhX0VVM0VpONliBoEORgL2cg9CA+k0cwGAgIX09ALZvOAb8IaI6sFJjyLw==
X-Received: by 2002:a63:161d:: with SMTP id w29mr33985281pgl.395.1556508369048;
        Sun, 28 Apr 2019 20:26:09 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id a10sm41364938pfc.21.2019.04.28.20.26.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 20:26:08 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH 1/2] pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
Date:   Mon, 29 Apr 2019 11:25:50 +0800
Message-Id: <20190429032551.65975-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190429032551.65975-1-drinkcat@chromium.org>
References: <20190429032551.65975-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl variants that include pinctrl-mtk-common-v2.h (and not
pinctrl-mtk-common.h) also need to use mtk_eint_pm_ops to setup
wake mask properly, so copy over the pm_ops to v2.

It is not easy to merge the 2 copies (or move
mtk_eint_suspend/resume to mtk-eint.c), as we need to
dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
different structure definition for v1 and v2.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Chuanjia Liu <Chuanjia.Liu@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 20e1c890e73b30c..7e19b5a4748eafe 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -723,3 +723,22 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+
+static int mtk_eint_suspend(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_suspend(pctl->eint);
+}
+
+static int mtk_eint_resume(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_resume(pctl->eint);
+}
+
+const struct dev_pm_ops mtk_eint_pm_ops = {
+	.suspend_noirq = mtk_eint_suspend,
+	.resume_noirq = mtk_eint_resume,
+};
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 1b7da42aa1d53e4..e2048db5bb16671 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -299,4 +299,5 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val);
 
+extern const struct dev_pm_ops mtk_eint_pm_ops;
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
-- 
2.21.0.593.g511ec345e18-goog

