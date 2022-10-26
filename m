Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8AE60DCBA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 10:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiJZIFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 04:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiJZIFd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 04:05:33 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616318C47A
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:05:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j16so7434554lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT2RtRVdSe4A/vZjl2soZfExRRC4tFUI2ftnW/OyxcI=;
        b=lISX1dm2DJj7wZFPa1HV8C2vEB4pYOwWe1OWwHy2MTGzcz9GgV5lgxJun1dAgqAaOY
         a70ief7EQxbkEhZpwrhvG9vgZPrngGP20z6ds8fiwF+SPIehpova3CEhulOxck89ibOb
         yUJm6LEQyTuOPqBTT+ISRpvBkYEbWOEA/N8EmZiatLCD/ccW0UrxSeLO8tEPVzJTUdV1
         UUvRx/H15+Bhebn/fjJ2EOG2wdBnInH37t2CyWhCNoL2gH3K5w8lVHCMDg8zWi1u8fwl
         l3wAz3bOVvdLMbltmnFeuRo5xfu3nw62jcACldLwEksRurz+goE439ZnLk5Tt81Pp1rr
         loCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT2RtRVdSe4A/vZjl2soZfExRRC4tFUI2ftnW/OyxcI=;
        b=yLI5bGC8oRaHdlCYtKqkyNadCDnvLkVOBpbbXKkhacwDpJLnkEbsdH/oCu5lpt58+p
         y7Pxq3QLpVQo6FcoI2V8fJVs+HsfdRdAEJoTPWoXcqG/6Uh9y0s8Ljxjg8jagF9v0O1H
         74TdEXiDj+I1+KZ9yyo8cwxvcVgsvMQC/5vf7e8xBfTnmDDUWMOjPbo9YzxjOw6cr/JF
         XBTcYf0qgoyQDDdWYVxST1vrIeTPjlITuLEwl7O5efi+JWNBvSRDcTKHe58uPZymOnHW
         lEW2a8I8AqPTFL3Mo9XwHvK+/Ucb0IENPLYWIqaLhgfYwMs//3kopLNJ6/aT1NOZfP0T
         XQug==
X-Gm-Message-State: ACrzQf2HlJpydHxZS8s1nUcFBrqpsJKjGSuAGdZ2VoRkL9yrBzr7QXId
        XQqaDuPOf4mOEn7lklKVGXw75mAw2ICmWnf9
X-Google-Smtp-Source: AMsMyM7kRy8yg7rxEFuFWIuyQarh2UEzeIz+Ek640A+laDhZFLsSren6Ycu8zeeVYw2FhvPF84nmUA==
X-Received: by 2002:a19:5e11:0:b0:4a2:7d32:66 with SMTP id s17-20020a195e11000000b004a27d320066mr15044771lfb.48.1666771530736;
        Wed, 26 Oct 2022 01:05:30 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id d10-20020ac244ca000000b004a1e592837esm750958lfm.140.2022.10.26.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 01:05:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ralf Baechle <ralf@linux-mips.org>
Cc:     linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: [PATCH] mips: alchemy: gpio: Include the right header
Date:   Wed, 26 Oct 2022 10:05:28 +0200
Message-Id: <20221026080528.105967-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The local GPIO driver in the MIPS Alchemy is including the legacy
<linux/gpio.h> header but what it wants is to implement a GPIO
driver so include <linux/gpio/driver.h> instead.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/mips/alchemy/common/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index a17d7a8909c4..1b16daaa86ae 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -31,7 +31,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
 #include <asm/mach-au1x00/gpio-au1300.h>
 
-- 
2.34.1

