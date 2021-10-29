Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E152543F416
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 02:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJ2Asl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 20:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhJ2Ask (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 20:48:40 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCF4C061570;
        Thu, 28 Oct 2021 17:46:13 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id f1so7571559qto.9;
        Thu, 28 Oct 2021 17:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QY+65c0e3dWyBQrqP8qzKIb5vCuj9L4rzbD7EyWu1RU=;
        b=FSERi+nPsTIGYYISWvWgnBvExH6uLzjrzzWIp+sgZVc4/3waSxIQsPVt54rIVup3wy
         3CX76R4Wnqnr5Um8YZl4vcXmDafOy0cPzjtRqaUAFeNZgZn9nCbijoCxRIq151pDqoyy
         4vkmv59yjIUyQycsDWwCerf2XO35G1UEOAFo9NTVzjLxB6woyCiHt5EnqciYlPYiG71i
         ZQDOtwag87gmxqtjvyUMYJZmbr7XrFb1AXLu3v0POa0+mflUPfGoHrRkaG2XmO+VC3tI
         QwUJsOcZtAt+crOpd77a2bj/P09duJXbOfxLIb+XbIQ6ZaWoWg7AypuZgRXFD1u/nOfj
         qZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=QY+65c0e3dWyBQrqP8qzKIb5vCuj9L4rzbD7EyWu1RU=;
        b=hsZN1k8xZhKNx5LvO4lo85VQmUH2h5PDsvTiZfFTt6Wkc4mg2LQOKuCgCWPUlzOLAk
         Fl/Mnmo9clJJRSKrwyx1juVWviglwNOEyqmZyKj15Dj8pX81UZHKb8VhEEed3HHwHlVq
         Lu9s7LJ23JvhkiNPhOao7WYn2sc48cPzmiXxPKY8rhPooHDFPVNPgJaB9DvCgFQg71BJ
         K6TbqI9elgpdHpg1UwN/+1JE2Iai3Tfvx5/BwfT+dXTU0NeaybwDt9ogruB15l13w85x
         vbfuk57NYj0ix9uMIPpId46ofIB3fq//dLqsdhyn/XfzWyh7nNwKVlOg5sV/9SVb73QJ
         Kk1Q==
X-Gm-Message-State: AOAM531X/k79BYgfyyYxaPBFyn3V8ed1Aikl4K8cxPg36anodq5OiLzz
        RHdIjrtiIZ1SF4Mrq1HY0joQqpRhv8Fn+4rP/hI=
X-Google-Smtp-Source: ABdhPJwIr6iRt8zwIUDPiwYjJszcYORv6srUQZ2L6ViPNPXks6zEi4lcFsfM5DmwIM1N6oiGkRHMng==
X-Received: by 2002:ac8:59cb:: with SMTP id f11mr8303822qtf.350.1635468372262;
        Thu, 28 Oct 2021 17:46:12 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id q13sm3127907qkl.7.2021.10.28.17.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 17:46:12 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: fix unmet dependencies on GPIOLIB for GPIOLIB_IRQCHIP
Date:   Thu, 28 Oct 2021 20:46:10 -0400
Message-Id: <20211029004610.35131-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When PINCTRL_QCOM_SPMI_PMIC or PINCTRL_QCOM_SSBI_PMIC
is selected, and GPIOLIB is not selected, Kbuild
gives the following warnings:

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_QCOM_SPMI_PMIC [=y] && PINCTRL [=y] && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && OF [=y] && SPMI [=y]

WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
  Depends on [n]: GPIOLIB [=n]
  Selected by [y]:
  - PINCTRL_QCOM_SSBI_PMIC [=y] && PINCTRL [=y] && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && OF [=y]

This is because these config options enable GPIOLIB_IRQCHIP
without selecting or depending on GPIOLIB, despite
GPIOLIB_IRQCHIP depending on GPIOLIB.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index b9191f1abb1c..3e0c00766f59 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -197,6 +197,7 @@ config PINCTRL_QCOM_SPMI_PMIC
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+  select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -211,6 +212,7 @@ config PINCTRL_QCOM_SSBI_PMIC
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+  select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.30.2

