Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF32D8EAF
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404701AbgLMQSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404226AbgLMQSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:49 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3107C0617A6;
        Sun, 13 Dec 2020 08:17:31 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id k10so11614291wmi.3;
        Sun, 13 Dec 2020 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9VFIJdHj+SJxF4z+WgbqJ8x7eNPsM9DBQcH2wJnArM=;
        b=DgvvQc0NAh1OKOf+xsxZRjBpmVYIChLVpTygScao4JsyKQZOXnJ995flh2Z2WHhXjS
         VU/iMisOaB4SSkMVJ64YnxbYHFcBhhgHnBSWQ0qBOqmg64ucF0sTz89qTDee+v3/FwiT
         WuoMfkWSGEz8J5H4wSIBSk9rnCtdBM/yH3U/TLLWJHV7PNnYKhWyd+qcr1s/l9zmK/sg
         RI7aD+YPTWWVZPrHNVa/GakA3b798KuLaSScKfbCCCB45BhFr/yBSMg7YcnX7MfUEvXd
         r6j/lDdOzcOf267FQjO2UJwx17Mp6zPsKm9bIvIeaozT50bW+fA4B/FbivMZQOQTaw/F
         UBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9VFIJdHj+SJxF4z+WgbqJ8x7eNPsM9DBQcH2wJnArM=;
        b=JGMPzO/lsSDTtpRu6k+4Ss5v1bQ19dqoWhczrrUtiZvopTH8nTpa+q+z+5mYOHIT20
         9AC6T7k+aGQNnH2OudkvLW4VxivEP+fq8ixeakxQDiHpHfWmETPtAYYLoknhZAYyzMqa
         +e80TUIWaJCp2uXgFhPPIrFe82d6kPwsOu7wnR+23oZl/yuKBFLs+7XgyDZwi9oeA8J4
         QSg9MScyAnXc5dGoIxC6hpvvVZC1edzjMLPB3ZuP5e+TAUYmFkxFicEZU56w2OX1/2qj
         GiRri9r2yR/DI1AKie6znDTgbel2UsppE3aO3GYcau1WeQCuygqc7cDftuFm7WrvGmdN
         WhVQ==
X-Gm-Message-State: AOAM530FP02qTKp2FgtbXGzbHXduie7ORmp3XmrUel1B+30sn2e9dJnf
        zuTIyfMHTYO5/Bs4+d2NwxU=
X-Google-Smtp-Source: ABdhPJyTeWtycO/1IXRhvCbaw1614hdJtEa+J6vkyRpI4RbtVAsHskSG3As8u1WNf7N78Tpig7KSGw==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr23205450wmk.121.1607876250816;
        Sun, 13 Dec 2020 08:17:30 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:30 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 6/8] pinctrl: ralink: rt2880: preserve error codes
Date:   Sun, 13 Dec 2020 17:17:19 +0100
Message-Id: <20201213161721.6514-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some paths in probe function are returning '-EINVAL'
instead of preserve original code from called functions.
Change them to preserve all of them.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 4725aa34328a..5af1c8a20322 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -315,6 +315,7 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 {
 	struct rt2880_priv *p;
 	struct pinctrl_dev *dev;
+	int err;
 
 	if (!rt2880_pinmux_data)
 		return -ENOTSUPP;
@@ -330,13 +331,16 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, p);
 
 	/* init the device */
-	if (rt2880_pinmux_index(p)) {
+	err = rt2880_pinmux_index(p);
+	if (err) {
 		dev_err(&pdev->dev, "failed to load index\n");
-		return -EINVAL;
+		return err;
 	}
-	if (rt2880_pinmux_pins(p)) {
+
+	err = rt2880_pinmux_pins(p);
+	if (err) {
 		dev_err(&pdev->dev, "failed to load pins\n");
-		return -EINVAL;
+		return err;
 	}
 	dev = pinctrl_register(p->desc, &pdev->dev, p);
 	if (IS_ERR(dev))
-- 
2.25.1

