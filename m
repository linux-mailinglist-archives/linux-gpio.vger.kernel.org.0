Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EEC3D78D0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbhG0Ost (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbhG0Osl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:48:41 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8672AC0613CF;
        Tue, 27 Jul 2021 07:48:22 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id f18-20020a05600c4e92b0290253c32620e7so1836128wmq.5;
        Tue, 27 Jul 2021 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omWjBOX/3h/WM2lUnp6VftQHp2MdTaSELvMcM6S+KNc=;
        b=Gk1f014+yncZXzcpUjGLdkTPgzpUeaL/lpz0BR/YEjnKLkq48Tipo/39UuBbBYjPaf
         kJTSDwKFk+wfZZnrihgvR1ebNbJmWQFvQtHDbXjOVAm69Khr7o6mJHRSsqfQXYshFxzm
         uJOHJywcCsXu7cD0rcOj+KWFhUURmnXubWvvwrl9QollfJVJ3i8C5uMJeBAj4eWyyVXq
         wdbT6kQXd+emOgi6jHOvvjHOrsxYBLcXYcF2pVTpjv0Lo/9s1SQYJYrpeJw9CLn4dG0P
         GWydd7Qex95nlkp4B93O9lX9dN7HFVFXaSmK0gvsXychwiJIvL+lq/OAlttoKqRbMpjl
         qYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omWjBOX/3h/WM2lUnp6VftQHp2MdTaSELvMcM6S+KNc=;
        b=j3tq06s748ClnaETLNiOZBg761x246tS+f+WWhoi2db6V8BQI4MqQwvPck/LLpJojP
         OnvFEC/QFjOAY+41VcAx2BECoglbPoowRLeQaXS9BmxSjYXJLV0+jamGq9MyHn91jzHs
         ajBJDmNI+1r3fGRi6hBovqQStsLjRLe03eiNaVsl4O+wFvoOekG1dUvTVN+345PXmD5O
         GfUt+9Zg3m15jjV3UHjuNao6jL/wsbjns3EZfH/jXeLlCtcausbYHqh+2bqEomofzbci
         1DjzlZJKRVnR56oULAesodGxr2sFuX4oeRgzE/RB+kLEM1kj+VJSlecvRwvGbA4YH+AL
         guRw==
X-Gm-Message-State: AOAM531ruAwPdcHIY+Fm+Jw5ZMn/+6U5g/4sF6Rp8/C4MVKV+M2oRyvz
        A3e/iYR9WiMYGNFV0iqqTy/AvIO98dDlAAt5
X-Google-Smtp-Source: ABdhPJxs+BJSVXEjy5Z/abPwqOGSp7NtJ2xjEEZXCsGBor5wPH1o0P/a9eU0DX3CkL4Jc7FriWobZA==
X-Received: by 2002:a05:600c:198a:: with SMTP id t10mr4542669wmq.32.1627397300903;
        Tue, 27 Jul 2021 07:48:20 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id o14sm3002555wmq.31.2021.07.27.07.48.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 07:48:20 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] gpio: mt7621: support gpio-line-names property
Date:   Tue, 27 Jul 2021 16:48:15 +0200
Message-Id: <20210727144816.8697-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver uses multiple gpiochip banks per device.
To support 'gpio-line-names' along the banks 'offset'
for each bank must be set explicitly.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..5854a9343491 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -241,6 +241,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 	if (!rg->chip.label)
 		return -ENOMEM;
 
+	rg->chip.offset = bank * MTK_BANK_WIDTH;
 	rg->irq_chip.name = dev_name(dev);
 	rg->irq_chip.parent_device = dev;
 	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-- 
2.25.1

