Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12F8697EC1
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 15:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjBOOwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 09:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjBOOwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 09:52:13 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31760392A7
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 06:52:10 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw12so48856755ejc.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I2AVCTxVI6zQjggycmwXv6RwAq/qSzlndyzZgf2fgz8=;
        b=lrdM++KfkWIGn5grRBA4X+MGpFJlgwE9l7RMREt1AThrnYs0njeYFwcBFtmBa5pkCx
         buwXceGlqjeactxgCq1JRsJc4U3AKX5nTUuYfXFM+s5AWh0XJ5NYSkUod4h5FCBtjeUs
         OQ17kPQeWYlot61B0RC1rnYX65+JEca8t4JJaM4oAGHMDqE3MEEgGjXwJ0Erg6fS9Zgx
         HqEvndEdFIC76IBbYG4/H+9P5qKeXQQSv9rBTB5y27iE3LLhf8EuiTK4Ak6B1PdTFhFL
         tim1+kwhElX8dooSespzHUYofRFmRdgpVJTp91WcAapLFJaALGtT8EruZRieU1zRwKl8
         8Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2AVCTxVI6zQjggycmwXv6RwAq/qSzlndyzZgf2fgz8=;
        b=vnv0F2BIMXyQdk+yko/OCEPXBXpnQ4ZJZr7UQl2KrCX+NlN8KG2bTYJ74bTfkL1LhJ
         8JcMZhSFjzL571lMhoHxoy/dJWRz/+IooEgtUucnDJcwr+muYxJsLjiWBgWyuDyJQNTx
         Pl4wq3+4zCGuBcIMKLMkUcocptPGbfOSz3LvNDThmRJpxU12tuP/0nLX+GNRwyhJ3QWC
         j2uE0uutvHiMFCtzWeFIUkisAoyRkn3WcE//jIDk8ABdnSfC7WL/ZVOinSi7tq5XxKjR
         DyJkUUoEgXEko9AiQZZvKEIV6sEb0BiEyFsR2BqxNv7f/oc80lPtXp1fMbcTgFzYfsrs
         M0vw==
X-Gm-Message-State: AO0yUKWePQMM32eBpX2+0UFyz7RbkXCrz+ZMRn7OOXuJSQDmB1D3/2c5
        qxrrmhQmC7+HDFu/oWRXXt04SQ+0eZuW77gr
X-Google-Smtp-Source: AK7set/dmgqiWoaDYWs3vFxhgIzpfj8+85XiHoXGZ/c4Hxc0fHofrncnXMesA0dzw9xL18nu279KpQ==
X-Received: by 2002:a17:907:a508:b0:8af:54d0:181d with SMTP id vr8-20020a170907a50800b008af54d0181dmr2488553ejc.35.1676472729287;
        Wed, 15 Feb 2023 06:52:09 -0800 (PST)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090651c300b007c11e5ac250sm9905233ejk.91.2023.02.15.06.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:52:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mlxbf2: select GPIOLIB_IRQCHIP
Date:   Wed, 15 Feb 2023 15:52:06 +0100
Message-Id: <20230215145206.1761912-1-linus.walleij@linaro.org>
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

This driver uncondictionally uses the GPIOLIB_IRQCHIP so
select it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ec7cfd4f52b1..e9917a45b005 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1531,6 +1531,7 @@ config GPIO_MLXBF2
 	tristate "Mellanox BlueField 2 SoC GPIO"
 	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here if you want GPIO support on Mellanox BlueField 2 SoC.
 
-- 
2.34.1

