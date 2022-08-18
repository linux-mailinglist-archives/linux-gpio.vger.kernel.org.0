Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B29B599103
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Aug 2022 01:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344225AbiHRXMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 19:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343761AbiHRXL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 19:11:59 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D49D0208
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id w28so2276223qtc.7
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NYDLKo9VjEVmmw3ciPy+owZbBQznl3Q/RXFdBzD0ta4=;
        b=Mn2nHlHwebOuqtqWJpQEM0eLdRx1X5n0Oj6DELJoBbyP6zCV6jKp5+xhe5BeBfcfSJ
         xlu+pzmIJ4Kq+qQkRowXqd5ynABdoSWPUxGwnetgqiFAI0VT8oY8G00/5NS+a/ULSt66
         s61bLaxXJ8nxFv7VJhNN0mumElJ34b72q4/7ZY4r3wh0+8BUR+bb2tjsLUXRR12UE3DJ
         gcQe4ExCtVr33Bzkxkwwxc0Q3/2LdOMsd/dcE3qDi7czaZMvhz4kXTk2vfhvSXVTs9IF
         2rLzNkE8UkUnpK8Z9oLPAcuuq3xlY4FYweDbQ0tA4XDkfVGYFK77df8GpE0eXLn07lWd
         YZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NYDLKo9VjEVmmw3ciPy+owZbBQznl3Q/RXFdBzD0ta4=;
        b=qCVY6NwtUvKfftaZMqEQHNmgD8AD2EUOqAVguWQL+hQ4CTGgkN0HkKWvjIHyykxxU6
         wW1UBAff2hyM1NzV1Upz15IPi7wgc/wmemmxCwtFF+jdqp3IkrdMR/OyY33w3B4HUNtZ
         ytVs48YxmmEIx0txztIIQrqPAj7PLK27dQJlbJubtQRvQePMHeqJh2p6J7P9e5HwJcaf
         Y41Mu08O6r0WGeb+ty02L7cFowmCwcRrgvaPFVfQJXIZB4cV3DtwI4CKajHQRqL8QNMn
         UunbFhd82vTZySQb8M9JmwJ9Ph2Xv/+MHxBiCBKhmVIDFQKDvVqlWb2MC9APpGwoRC1P
         ja8A==
X-Gm-Message-State: ACgBeo2UnZVJgSINnMpw0KQop34Ebznsef9BX0G3rRHACLrqHEnpbv88
        WZRXhi6x15ypTG8DcrOCjYgSJw==
X-Google-Smtp-Source: AA6agR7IwQrFD/YiqELu65gG3fpqxSghUbpo4vjRtdaGEPnTe5chpuWAXj/MLPNSDLl+mj7UZVXqEw==
X-Received: by 2002:ac8:5f10:0:b0:343:7a81:e89b with SMTP id x16-20020ac85f10000000b003437a81e89bmr4511261qta.527.1660864317820;
        Thu, 18 Aug 2022 16:11:57 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a245000b006b5f06186aesm2864801qkn.65.2022.08.18.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 16:11:57 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linux-iio@vger.kernel.or, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 1/6] isa: Introduce the module_isa_driver_with_irq helper macro
Date:   Thu, 18 Aug 2022 12:28:10 -0400
Message-Id: <016c8d87cef87a1375e53f1c97c41d8b969f8d79.1660839809.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1660839809.git.william.gray@linaro.org>
References: <cover.1660839809.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several ISA drivers feature IRQ support that can configured via an "irq"
array module parameter. This array typically matches directly with the
respective "base" array module parameter. To reduce code repetition, a
module_isa_driver_with_irq helper macro is introduced to provide a check
ensuring that the number of "irq" passed to the module matches with the
respective number of "base".

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 include/linux/isa.h | 52 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/include/linux/isa.h b/include/linux/isa.h
index e30963190968..4fbbf5e36e08 100644
--- a/include/linux/isa.h
+++ b/include/linux/isa.h
@@ -38,6 +38,32 @@ static inline void isa_unregister_driver(struct isa_driver *d)
 }
 #endif
 
+#define module_isa_driver_init(__isa_driver, __num_isa_dev) \
+static int __init __isa_driver##_init(void) \
+{ \
+	return isa_register_driver(&(__isa_driver), __num_isa_dev); \
+} \
+module_init(__isa_driver##_init)
+
+#define module_isa_driver_with_irq_init(__isa_driver, __num_isa_dev, __num_irq) \
+static int __init __isa_driver##_init(void) \
+{ \
+	if (__num_irq != __num_isa_dev) { \
+		pr_err("%s: Number of irq (%u) does not match number of base (%u)\n", \
+		       __isa_driver.driver.name, __num_irq, __num_isa_dev); \
+		return -EINVAL; \
+	} \
+	return isa_register_driver(&(__isa_driver), __num_isa_dev); \
+} \
+module_init(__isa_driver##_init)
+
+#define module_isa_driver_exit(__isa_driver) \
+static void __exit __isa_driver##_exit(void) \
+{ \
+	isa_unregister_driver(&(__isa_driver)); \
+} \
+module_exit(__isa_driver##_exit)
+
 /**
  * module_isa_driver() - Helper macro for registering a ISA driver
  * @__isa_driver: isa_driver struct
@@ -48,16 +74,22 @@ static inline void isa_unregister_driver(struct isa_driver *d)
  * use this macro once, and calling it replaces module_init and module_exit.
  */
 #define module_isa_driver(__isa_driver, __num_isa_dev) \
-static int __init __isa_driver##_init(void) \
-{ \
-	return isa_register_driver(&(__isa_driver), __num_isa_dev); \
-} \
-module_init(__isa_driver##_init); \
-static void __exit __isa_driver##_exit(void) \
-{ \
-	isa_unregister_driver(&(__isa_driver)); \
-} \
-module_exit(__isa_driver##_exit);
+module_isa_driver_init(__isa_driver, __num_isa_dev); \
+module_isa_driver_exit(__isa_driver)
+
+/**
+ * module_isa_driver_with_irq() - Helper macro for registering an ISA driver with irq
+ * @__isa_driver: isa_driver struct
+ * @__num_isa_dev: number of devices to register
+ * @__num_irq: number of IRQ to register
+ *
+ * Helper macro for ISA drivers with irq that do not do anything special in
+ * module init/exit. Each module may only use this macro once, and calling it
+ * replaces module_init and module_exit.
+ */
+#define module_isa_driver_with_irq(__isa_driver, __num_isa_dev, __num_irq) \
+module_isa_driver_with_irq_init(__isa_driver, __num_isa_dev, __num_irq); \
+module_isa_driver_exit(__isa_driver)
 
 /**
  * max_num_isa_dev() - Maximum possible number registered of an ISA device
-- 
2.37.2

