Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D6B7E116E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Nov 2023 23:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjKDWys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Nov 2023 18:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjKDWyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Nov 2023 18:54:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6881CEB
        for <linux-gpio@vger.kernel.org>; Sat,  4 Nov 2023 15:54:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507a98517f3so4083785e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 04 Nov 2023 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699138482; x=1699743282; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peHB8fc0FpN3X8Q1SVuag/CxFROBwBEcNoz37/Mm90k=;
        b=ZLWqBfYzAmE38SJpIxyif1VHRPaTcs5RlI6LdhYhATQP4/ciXKGZTffRCetlnmRUDj
         mXF5QTf/Y58lqU4FjjKVuWqf+6skai1oJthpy77JBeiOCX8Exsj/0OItkvnwB1A2vYLO
         a78YhFUlWVVG6OwJ6EjtbopmzDBi+/caDW+WslQSO0A3O2WbObVpuuWC+Qx3YKb/NQDy
         XY19Slo/QPRySmH222w8AKqLGDrr0ZsFH07CG4xEpT89lh8MsA3geNLw2nztF7i2A6g9
         2jU7JXZDXhgj5F6kf9Yi9Ef+5mIs0e2kQRFK2evj2tSbcYUTNR9tePMYg8+S9+3t/T6o
         zx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699138482; x=1699743282;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peHB8fc0FpN3X8Q1SVuag/CxFROBwBEcNoz37/Mm90k=;
        b=NpaLoCYX1bwhBJmhECmu9G3Kb3RHUQTfq+jcbo1P1cTXOG6vY5qLrY6klbENBc287/
         C1+6YA7ntgbUzedOiQsvhF5SyUCtoEpX6SCzOanwsdvDjqxh8U0ESyvsGDYJw/1z4huY
         XNcO+aXrlWrQmrAtv6s9LmPH+hzmC1aj2qGuoCIo6BGCXj2W9goaZwWatgEOZY5tepWC
         cnhuJROnhhMn7iU/DzhLJKTvcUvx6RbzvUbf1/JTRcu5hk/SEEd+81OQxIZ4DcGSVvou
         4bwUfGsPcbyX3lX1bXTHQqIyxf8K/2bU/ZVCGVCfFlApVHIRlRfMIL3D/SJ14p2q8dQv
         3ddw==
X-Gm-Message-State: AOJu0YwKbhDV3uC+JVFY3BVYTLsVXgwkltJwwgSescOeEeM8Qbww97QH
        niLviOdifgCPiweLZjizL9RmXw==
X-Google-Smtp-Source: AGHT+IGMyhDbi0MXWxg8Y2O739hVKH5rXBA+6sBAE+ljJ0M/r/SxM+jvKkFtWAgkaG1Okc0rIyzA6Q==
X-Received: by 2002:a19:430e:0:b0:507:96c7:eb1a with SMTP id q14-20020a19430e000000b0050796c7eb1amr18075662lfa.54.1699138482336;
        Sat, 04 Nov 2023 15:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eo28-20020a056512481c00b005079a3c872esm636475lfb.240.2023.11.04.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 15:54:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 04 Nov 2023 23:54:40 +0100
Subject: [PATCH] RFC: Do not enable the v1 uAPI by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231104-no-y-uapi1-default-v1-1-f60d318b6fbe@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK/LRmUC/x3MTQqAIBBA4avIrBvwj4iuEi1EpxoIE60oorsnL
 b/Few8UykwFevFAppMLb7FCNQL84uJMyKEatNRGKWkwbnjj4RIrDDS5Y93Rammpa720zkANU6a
 Jr386jO/7AZOZOZ1kAAAA
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's been two years since we introduced the v2 uAPI and
the major consumer libgpiod is at v2.1.

What about discouraging the old uAPI?

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 913948876c93..65c9914ee3fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -85,7 +85,7 @@ config GPIO_CDEV
 
 config GPIO_CDEV_V1
 	bool "Support GPIO ABI Version 1"
-	default y
+	default n
 	depends on GPIO_CDEV
 	help
 	  Say Y here to support version 1 of the GPIO CDEV ABI.
@@ -93,8 +93,6 @@ config GPIO_CDEV_V1
 	  This ABI version is deprecated.
 	  Please use the latest ABI for new developments.
 
-	  If unsure, say Y.
-
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate

---
base-commit: e392ea4d4d00880bf94550151b1ace4f88a4b17a
change-id: 20231103-no-y-uapi1-default-4204e86c04a3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

