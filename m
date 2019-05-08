Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7C0172A3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 09:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfEHHdl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 03:33:41 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46904 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbfEHHdk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 03:33:40 -0400
Received: by mail-pf1-f195.google.com with SMTP id j11so10018871pff.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gYFoR4O/xJAOVdtzf1KO84jqKZdhkztW34riW/9p2p8=;
        b=R9/XG+XeN3PX0hPVPayizUpipfNj3Nty3nKih/eJLptpZmg0sKXL/78jJxpaObgd4F
         gn31yG/jV8baGAHB2a71oLwUehdb5yWcz53evRbE3koaBHGOpYv3IYon7P8OT+kqhsBi
         YwJBUX6kOHsrqeLts1KKXgIQaJksLkTxDe6lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYFoR4O/xJAOVdtzf1KO84jqKZdhkztW34riW/9p2p8=;
        b=hUZ32RoZ3ukcbZTL04Uli8zfgmClqxrjCnQpwwZ4ENTLDgvZ0avI6Lu5dNCsPEm6St
         Zysb9qF9GRNgTE2QXr4xo/BuD4BC/V38nIO4b7IVfDdBpCvGv/Yf2AInQjJcNgDGmFqD
         lX+KBnEFFnF1iLUDr0jUNOyvioWE9r0uKYMcq7gLH8GCZvVD3OD8lijHc/ivWJOsIhOE
         /kiK8Bcqr3bdALgrYhyXF9IuzyuvZSwqoawyajKH2NVqZShiv8PDZYLGfayUnq3sAUMh
         5t3m/JLFi4OIiiQhfGdxxoTlS3bhfyLmXmCCVu+bGjt9+qdgv3h1Wte9KI6063iTrdB2
         d8dA==
X-Gm-Message-State: APjAAAV+QBbHl7lRx7YgohhX6Yzb+QV1V+IbcPW+j34kqJzylp5Ka3jt
        k7biOcLHawf57L4f/gW2H9uD+YUX1FPbRV+S
X-Google-Smtp-Source: APXvYqwYR+C8pIy/mW/ntjAU5hcB/QYRY8s1HZ9+YEZj2WlaNk6OmhMsHTxoUDB0Wpphy383/FAE0g==
X-Received: by 2002:aa7:980e:: with SMTP id e14mr46827749pfl.142.1557300819483;
        Wed, 08 May 2019 00:33:39 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id n26sm29539047pfi.165.2019.05.08.00.33.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 00:33:38 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH v2 1/2] pinctrl: mediatek: Add pm_ops to pinctrl-paris
Date:   Wed,  8 May 2019 15:33:30 +0800
Message-Id: <20190508073331.27475-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
References: <20190508073331.27475-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl variants that include pinctrl-paris.h (and not
pinctrl-mtk-common.h) also need to use pm_ops to setup
wake mask properly, so copy over the pm_ops from common
to paris variant.

It is not easy to merge the 2 copies (or move
mtk_eint_suspend/resume to mtk-eint.c), as we need to
dereference pctrl->eint, and struct mtk_pinctrl *pctl has a
different structure definition for v1 and v2 (which is
what paris variant uses).

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 19 +++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d3b34e9a7507ec6..923264d0e9ef2c5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -926,3 +926,22 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+static int mtk_paris_pinctrl_suspend(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_suspend(pctl->eint);
+}
+
+static int mtk_paris_pinctrl_resume(struct device *device)
+{
+	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
+
+	return mtk_eint_do_resume(pctl->eint);
+}
+
+const struct dev_pm_ops mtk_paris_pinctrl_pm_ops = {
+	.suspend_noirq = mtk_paris_pinctrl_suspend,
+	.resume_noirq = mtk_paris_pinctrl_resume,
+};
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 37146caa667d8c8..3d43771074e6de0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -60,4 +60,6 @@
 int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
+extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
+
 #endif /* __PINCTRL_PARIS_H */
-- 
2.21.0.1020.gf2820cf01a-goog

