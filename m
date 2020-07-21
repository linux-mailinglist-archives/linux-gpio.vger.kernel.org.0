Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084C52282BE
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbgGUOuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729935AbgGUOuv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:50:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EA8C0619DB;
        Tue, 21 Jul 2020 07:50:50 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so3175902wmo.1;
        Tue, 21 Jul 2020 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5sbT+EI8mugvtDF1VmyRGRysnMof7B0jYDdWMIy2HI0=;
        b=DRLaKFx9Yg18d3fsC4dq4Tutzsdy6fluMD0LtlH/yLc1uhOmhW4ShJGu1dlYv25VD8
         ccVk0yhXMEM0VcZFfDqjqsQB0t/yOvIqT9LRe2v/KL9JX/LvvXAgvPGeFn4+5LA8QCdu
         pLRFgGua2Hzk7r4+C2sHqZku00PT4YRtW9ZBLOS57RUHt8ujqRrw4/soo5/IgFqePPQK
         BsQoB/LmR54g38R0aONrRtc+sErfTsRW2W8OzWGcG7zyhWBFNbz2WK4TaJvUtF6EYVsD
         jJ/TNLoLwpfAodeLH7MetejzxfesVoBlR2ou5mAJsfopm/k4hzJ86PH3O+b3Mg/Ay98A
         AA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5sbT+EI8mugvtDF1VmyRGRysnMof7B0jYDdWMIy2HI0=;
        b=d5JmjERn4buzCt0e/nxjpf2Nc3emmi4UsrElL28sRWeYn7gaX75/EMmCnmDcL0Y9JV
         PpBcaLQjB5ZB16NHjyeKUpgG5ZXvr3PJ/ha8H2wUIMrxlE/H4h+rJMLi9f2e/28f+B6f
         gRZd7yFcOrn6+g/Q8d+YSq4/s5Kl5JMPGOL2El0lTAwno9GGQZuhiZEFa9EuGqvuV3Km
         75/9olhrwyv83icv5WgVD+HDih4YdPUpM4bHMGua9i8kkwxgcU/NR1fbQJoZW7gWZ69v
         tv0x2jrMFteizwwrYkxg3I6vlec3bB4ZgnwE5twEnoaWmEAjnYfXi76MW2m/bZVi42P4
         1p4w==
X-Gm-Message-State: AOAM532DocAWgDLcaQ8VWXRqNvlnGDnfyZmP8IBuKJWnIB+MDB+gXO+6
        KPWtmj1DgxxYKcvOg1iiMGX3LQEkei4=
X-Google-Smtp-Source: ABdhPJy+TAFyeakasuFJKIjC1q/8wwM5dtpY4HMzP61PSnDXKJxr3Y6/tmu6A4eiKUn7d878gcf7Gg==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr4715479wme.177.1595343049583;
        Tue, 21 Jul 2020 07:50:49 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id a11sm14803596wrq.0.2020.07.21.07.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:50:49 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 4/4] gpio: gpio-msic.c: fixed a coding style error
Date:   Tue, 21 Jul 2020 16:50:27 +0200
Message-Id: <20200721145027.770268-4-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721145027.770268-1-abanoubsameh@protonmail.com>
References: <20200721145027.770268-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Removed space before comma to fix coding style error.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-msic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 84e00e0ab953..37664e7b3ddd 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -140,7 +140,7 @@ static void msic_gpio_set(struct gpio_chip *chip, unsigned int offset, int value
 	if (reg < 0)
 		return;
 
-	intel_msic_reg_update(reg, !!value , MSIC_GPIO_DOUT_MASK);
+	intel_msic_reg_update(reg, !!value, MSIC_GPIO_DOUT_MASK);
 }
 
 /*
-- 
2.28.0.rc0

