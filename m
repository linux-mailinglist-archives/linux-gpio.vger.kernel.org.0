Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2E135EB1E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 04:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhDNCwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 22:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbhDNCwI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 22:52:08 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666A9C061574;
        Tue, 13 Apr 2021 19:51:47 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d15so7128894qkc.9;
        Tue, 13 Apr 2021 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=jYfaY9zxNu/2QS44/M6LtPAs1mgku7wiBmhRISygBRKBSFmRb4pGRoTEfU7frQ+lRU
         dJ8qPqsIwk/VK9QP3yFncDqjWhTv+srwrXeh/LW/y4KYEErwuNhUfSSfbd7IAwD4YNnI
         +2nvRfFfp2eNmuozK47Lc1X3cVJWK2wloLYr2leQ2fdJZDPoUiNYGZG0NRPeqr9rwDpJ
         +ikW4E01IJJ4N13Ec3/Fx3z4biIzrE6dYR+oIA5Ie+/r4fclXHeZ5PnTHhgBNT+MPVZk
         z9AVk1OOee77WJjZ6a5BqkU3wHykfHQtgjXfzDrkOt6Xgz1VohefB2Uxu1hkDTNobkJl
         fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rzXO5uwkd4UlJ7sr2WOeKxv8d9eLoFxx3aBaT5I3Xd0=;
        b=MhwyjXFMmsuYTSnEBaM5ueOMZstg2OJNjiWjE+Zx+Y3KExNtiP1DmM+IiBfwll5ZYZ
         stNWxRX8e7Uzh75VdA2rWgUrP7ZEjmKg3UwNnICIAndBwG2S6xIOO21IZJtYCE4M56tG
         +KuMh3XBqDuseEY2dBqy4aS3iJsV6Rpi7jhHGwjU/fVA4uIgZvr1jqbV+ACX0S7HHVMv
         qPOdI+Rm8fNFjqjibhHxBr3J6RmCRC/xd12C4SQ+Yx0LjZTIfSfV91Ab9DeG1RKzsILv
         By3S0Q08kLEoMFxyBdifEmaBCKtyRlaVxeASPznfxOcBbqV1kaIjoemmUee+xY7WjTzT
         snuw==
X-Gm-Message-State: AOAM530YrTbIus9Hak4Agt0nFDPlbcAcSmVBuA/6Md1kGh7ArQjVs2+u
        kfD8Mr7J8/hvwvYu9vD6oVVKwD4Bpn4Lipzf
X-Google-Smtp-Source: ABdhPJxM5PTfDBSyqInJQUaT+iw4jnvOlYEyqnYXguijyhsyFpEYr+tnQZT+3vVJAyVjp7W6AUcwSQ==
X-Received: by 2002:a37:916:: with SMTP id 22mr29293933qkj.189.1618368706629;
        Tue, 13 Apr 2021 19:51:46 -0700 (PDT)
Received: from ubuntu-mate-laptop.lan1 ([2603:9001:6801:559c:e52a:4a50:abef:38b1])
        by smtp.gmail.com with ESMTPSA id s17sm10855720qta.44.2021.04.13.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 19:51:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
Date:   Tue, 13 Apr 2021 22:51:38 -0400
Message-Id: <20210414025138.480085-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.27.0
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

