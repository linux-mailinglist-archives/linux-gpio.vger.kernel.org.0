Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C9D698F95
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBPJTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:19:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjBPJTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:19:17 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F9E1EBD1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:19:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o20so1978384lfk.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHGrJaM+v3HFBCl8mBiFJnmJYZqmXZ++B7X5nh+0dNs=;
        b=XgA58Bsd+W9C16i/19W9II5IsFUbVxt+oKD8e4+xMKb5uhYel6/mtFB/Y7q2729vcL
         A4/cYoFu/EdUt44wViffvD/2QGYWbviHqPIGge7vJSaCZbIPBYFVrDpDQqKWjQZpvdmk
         8+jLovTBOV3LyRV9OzYmrF9qm16MZeTpqWqhm8PDFq2IVynNLqzmZaCoG2CTsTErVl5T
         ABYNW2lxvqllmLgCOqXGpbOnfZ3wZzJDBFPSdESu2oxhQnmtAQpC/teVltIezEZQiwKB
         T4begiohjYvbtwTzEzfViu5g4yePUhBpyb/xwEItLYRh9Sm6ZgUz0UXNDOiY9uelI5I3
         Ay7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHGrJaM+v3HFBCl8mBiFJnmJYZqmXZ++B7X5nh+0dNs=;
        b=lL2A3Z3yxtxuZjw51VYnywCrWZSk/P8uJMCZas/kA9K3/gYT1SHD19gXyVPKOJE8Hz
         K2a2vtkXj7vIF5gz0yvbOOUDBib5h/jHG9XIpytc8Bkais/QcPVqQInJr1GPrWDMHQbQ
         J6mpOBz6OaYhcF2kLJCrnnzDYOvCY+3FxCvFVkAVr+AZJF00pSqCMKWrzXyLmXInHOds
         CMkE7+MbZw84NDGoEFFzRGB18BI4ToXJiPXe3Dy9FLl1ycJmhhdb5Uo4WOH4om14Y1fR
         LA0AFba6RCJmcegtxTE/R7aY9UIm0sxpY+LOJtbxs05HoaZPRJkP+EWhKOIF6Y/AEJgG
         pvSA==
X-Gm-Message-State: AO0yUKWzu7fdcuji6DMpVnBCAnYyL+FUFUgPWu0Mt2+52X6cf2LxGwMD
        rFo8TQ7X5WVsc2aTe7NRVYiSkqsbJjrCPfPf
X-Google-Smtp-Source: AK7set+Uxc8TFqNNgfoIWr+a2gKRJMmelqZ2YnVruHBqHACGlwO/KCxTAKe7UjfQi/iXJ1U7IOXPkQ==
X-Received: by 2002:a05:6512:942:b0:4db:2a28:6453 with SMTP id u2-20020a056512094200b004db2a286453mr1284446lft.25.1676539153369;
        Thu, 16 Feb 2023 01:19:13 -0800 (PST)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id p6-20020ac246c6000000b004db3890cb53sm219680lfo.223.2023.02.16.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:19:12 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Cixi Geng <cixi.geng1@unisoc.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH] gpio: pmic-eic-sprd: Move Kconfig to MFD expanders
Date:   Thu, 16 Feb 2023 10:19:09 +0100
Message-Id: <20230216091909.1808306-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Spreadtrum PMIC EIC interrupt controller is part of an
MFD expander and should thus be in the MFD GPIO expander
menu section with the rest. Move it.

Cc: Cixi Geng <cixi.geng1@unisoc.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c9f3ef56eb24..58b742a50fe0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -492,14 +492,6 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
-config GPIO_PMIC_EIC_SPRD
-	tristate "Spreadtrum PMIC EIC support"
-	depends on MFD_SC27XX_PMIC || COMPILE_TEST
-	depends on OF_GPIO
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support Spreadtrum PMIC EIC device.
-
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
@@ -1310,6 +1302,14 @@ config GPIO_PALMAS
 	  Select this option to enable GPIO driver for the TI PALMAS
 	  series chip family.
 
+config GPIO_PMIC_EIC_SPRD
+	tristate "Spreadtrum PMIC EIC support"
+	depends on MFD_SC27XX_PMIC || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support Spreadtrum PMIC EIC device.
+
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
 	depends on MFD_RC5T583
-- 
2.34.1

