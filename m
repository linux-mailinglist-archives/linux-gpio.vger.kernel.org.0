Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C5F7189E7
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 21:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjEaTMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 15:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEaTM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 15:12:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3482107
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 12:12:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b01d912a76so129775ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685560348; x=1688152348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHuo9LWfKkvR418Lqy/QbomFvVPtIv6i40y7E4crOFE=;
        b=mY1fOwCiDHh2fSL0jr6cfF/dmQc3Ak0tIAs1tQtrDoDQdRZPJF6C+aOVC2cPHRU+iP
         V2XD3vD6+3IlwzKQt5po5jyIpy8iOsGs7Wk2Pef3ryv404NMPq5+8HhRk/AYH2naet3K
         ZMSD+kDX6RZiYnbv5N+hHbm6LAsOD7WNeDawzOTAI4+xjUOf4UKHDZ36DoeymqS0Wn9y
         HoJrGXX/qfR0GOnzC4MpQR1VB5W2Lb2XGq4b3VSsFEjGgfvaic+ZeUHOZnAo8cdT4w4H
         NHVagPz/r0y54NVE78fDc9cLg4nfDPtTF/xdzgm9HT4H/XimBVQDvlYGNUxsRbfnYx3Y
         ngYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560348; x=1688152348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHuo9LWfKkvR418Lqy/QbomFvVPtIv6i40y7E4crOFE=;
        b=brCeI9BfFDirXH6bBfp+XdMQo3DDvH3rMTPn5gR+Kzt3K7nXbKJ9aN4abl/uh0Z0x3
         f86rKHs+istVFy2+4/NRpa/dm+CUx02wVkY6pEpbkEQ9al7Ka64yyyuAwk12nUKjSMx0
         cqr2TROiGbT3b8dUPm+ap05TPLE6zNdKt7epgvH4IizGFd3xxciLcV6hlVHwsr5ywgam
         9pxnnKDETvRVNB79KmULvUyi5BOVzuyextwepFEaigvjEQRgHujSxETjHdrQb3KIxyH2
         WRXak51JXtxvfd03GStRG36DJC0/v5TGLPJqmJSTzNiBb6Eu94xyP/QoeflyR/uLQsde
         M7cw==
X-Gm-Message-State: AC+VfDx9jRnRef/SFF+QQEXXmPzjdRVgZwsS4alDaytcD2B/f3OAQ/Oh
        aJRUN1sZ+LeA/wojfs8PbiA=
X-Google-Smtp-Source: ACHHUZ7wWCfQdawKDNzADclRv8zO0Ngxz+CJqsLIoFu3PG287PAOE18/e7T9bHzXWOHDfKrN7AKgPQ==
X-Received: by 2002:a17:902:d4d1:b0:1b1:8471:341 with SMTP id o17-20020a170902d4d100b001b184710341mr1069951plg.21.1685560348034;
        Wed, 31 May 2023 12:12:28 -0700 (PDT)
Received: from babbage.. (162-227-164-7.lightspeed.sntcca.sbcglobal.net. [162.227.164.7])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902e84d00b001a52974700dsm1739078plg.174.2023.05.31.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:12:26 -0700 (PDT)
From:   msmulski2@gmail.com
To:     linus.walleij@linaro.org
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        Michal Smulski <michal.smulski@ooma.com>
Subject: [PATCH] gpio: mpc8xxx: latch GPIOs state on module load when configured as output
Date:   Wed, 31 May 2023 12:12:12 -0700
Message-Id: <20230531191212.9229-1-msmulski2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Michal Smulski <michal.smulski@ooma.com>

Qoriq and related devices allow reading out state of GPIO set as output.
However, currently on driver's init, all outputs are configured as driven
low. So, any changes to GPIO confiuration will drive all pins (configured
as output) as output-low.
This patch latches state of output GPIOs before any GPIO configuration
takes place. This preserves any output settings done prior to loading
the driver (for example, by u-boot).

Signed-off-by: Michal Smulski <michal.smulski@ooma.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 3eb08cd1fdc0..a2045ece429d 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -370,13 +370,17 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 * GPIO port’s direction is set to input (GPIO_GPDIR[DRn=0]), the
 	 * associated input enable must be set (GPIOxGPIE[IEn]=1) to propagate
 	 * the port value to the GPIO Data Register.
+	 * Also, latch state of GPIOs configured as output by bootloader.
 	 */
 	fwnode = dev_fwnode(&pdev->dev);
 	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
-	    is_acpi_node(fwnode))
+	    is_acpi_node(fwnode)) {
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+		gc->bgpio_data = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) &
+			gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
+	}
 
 	ret = devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
 	if (ret) {
-- 
2.34.1

