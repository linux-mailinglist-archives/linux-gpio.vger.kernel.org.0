Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59901324C17
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 09:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhBYIeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 03:34:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbhBYIeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 03:34:03 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FB7C06174A;
        Thu, 25 Feb 2021 00:33:23 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id f17so4928332qkl.5;
        Thu, 25 Feb 2021 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=c+Gb2y3lvWIdiTTwJEZYdb4xQO2rmh9hHZCSxVIafHZtsJ3ATYKqx2+eCcNTkcwEvf
         BgBsK0kt+eeDcIrLyT+qsS22xe8PiT4tueyRXW+d5n/h3ckRC+TNJJCNRsWFbQZBa5aX
         1U/Yn+VeQBHJan47Yr6k66r3YqnNFyTTBhAwB/HvsaZycOAupY4h33OjaVF8K27zsdDs
         VcL2iFRaEWbQc144yfY1LMldK7R30ojmBGDTrpdXaiAlgGXb44ANsgCv90KvooVelwER
         QH5h7kFUCt3HXLjvENF9R3axiohnb4XfkGfdWWrMyt+fj/muH2iPRXpfXzj+7qW6NxRK
         AnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=QOuDbn9m/OcBmiofmTVNhP9VR5Si7nvTKNQ0hdq1ev6uOCy3P2Mo1TvdLk06MUSBGe
         /OxKCljh6vOvf58lglzgL9TSJQFlsCNoXxbqxt6+TekUFUHe9Lz/egD/6wZ5QR0BvNjT
         hcV5tb1kLYRtdW6XoiOMOWkrknSwkekyFktkLcYChftadTCX1x9bfXZr+W6BdOXy574Z
         Ahmhc3zkknn1z3D0c6fPmpZc8yhgQJdHOzz8UZdJe02XvF82Mep6b/ZLc4LSvcn6vc2+
         E6S4rlgEgsSLXp47MceJaaCajqxxXcofLcg+OrA2hWQ8JknfUjzFctSy+zx+tA3Tzbdm
         FBhQ==
X-Gm-Message-State: AOAM530nmkV6z6Gde3ZwZLxVR/PBJIraDNhW41yhzaku696FJpD2NHtG
        BNezQ2W8UO7dQGz6iGN7LYk=
X-Google-Smtp-Source: ABdhPJz8y38zscafFLc9OKZ/olaRjt8Bu/8KetP9TXgOr1f0pUCfBPvgZNXfAjfbUpOSmxOhKv7d3w==
X-Received: by 2002:a37:806:: with SMTP id 6mr1652231qki.258.1614242002195;
        Thu, 25 Feb 2021 00:33:22 -0800 (PST)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id g74sm171054qke.3.2021.02.25.00.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 00:33:20 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
Date:   Thu, 25 Feb 2021 03:33:06 -0500
Message-Id: <20210225083306.25792-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])

This is because PINCTRL_MSM selects GPIOLIB_IRQCHIP,
without selecting or depending on GPIOLIB, despite
GPIOLIB_IRQCHIP depending on GPIOLIB. Having PINCTRL_MSM
select GPIOLIB will cause a recursive dependency error.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 6853a896c476..d42ac59875ab 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -3,7 +3,7 @@ if (ARCH_QCOM || COMPILE_TEST)

 config PINCTRL_MSM
 	tristate "Qualcomm core pin controller driver"
-	depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
+	depends on GPIOLIB && (QCOM_SCM || !QCOM_SCM) #if QCOM_SCM=m this can't be =y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
--
2.27.0
