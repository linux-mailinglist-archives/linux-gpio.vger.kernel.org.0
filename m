Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B94E23A271
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 01:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfFHXOb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Jun 2019 19:14:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33197 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfFHXOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Jun 2019 19:14:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so6507677wme.0
        for <linux-gpio@vger.kernel.org>; Sat, 08 Jun 2019 16:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Zp1bn2oYxda6LDTqyZ5GXOuq4BjnJOFiw+QZsnsSzQ=;
        b=wuM2tsMdlF07OQhHKBfdaPH8QFPb0U1rth7MZGBaMdKTfuacIn2acYCRPtFtUhPq6c
         TUeW23Qf6cdiKy3kjiAS4zHxDhRU6/LMCNgjQumU5rDkkpnCQH/KQsd3wwqdzxnCkitf
         xx8f7GC6pv9qKP8pLLwDGTgSjFZsluwtW2SbZ87fEVlwJJGmpu0D6RYboQrj80E9J68y
         Z71sa83+SauXC+eNiSvXR2l/1W6oAUPpOvubkOIbejayqQUib1mMQFyDoV7/4Di7hPYX
         82wBi0s3e7tuTsYmIUtCiCSd+svNdKCf3HOVEtqAag4hMDarXW7nCvPo0+YbXoG8xDnM
         2Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Zp1bn2oYxda6LDTqyZ5GXOuq4BjnJOFiw+QZsnsSzQ=;
        b=XbBoLufRcvmlNRHGrrvQxiwHgcD673v6qNnOYx/50n95xfouy/TkgVy2wt0uKL7keh
         EefkJF2hVUyx+yrVCsAVXWjO9GRcIrnIhcXdukFNo2X9G2uACEnVeikeE6qJAmFT1Ohn
         +GVa7eq7vzANQ/A4Bvhvu1oxnlHpjobUg5NBuYJkBn2uqBv96MjUMBwr+5MndnCwKzv1
         SIVWv6ef5YuEH2pqoMSyBf3DAJ8jAO9k40hammkIh0Z6kz5Wf7bAxCGkf92vZGU2y+aQ
         r/LOuo8mNe+1zWevwBTrNZKbctMoTwfnloW+yYuyjcXGxBk93BxJU2MMGC6OP5wvNvsy
         tHVA==
X-Gm-Message-State: APjAAAWnv6efeJ5Z3MMlqlxD4SpnZ/BJRrTAGeUY5PdaXe/lmFCbvKhX
        jHBn/Idc5wylQKE51FTLnzBRnLbcing=
X-Google-Smtp-Source: APXvYqzjpnE/WH1WB4sTdu66sWnhJBvWshmJVjhVCXp6UMnklKl5qtP0SBAnBBYD5v4j9tc2nDeilA==
X-Received: by 2002:a1c:a545:: with SMTP id o66mr8645942wme.138.1560035669245;
        Sat, 08 Jun 2019 16:14:29 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id z17sm5118911wru.21.2019.06.08.16.14.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 16:14:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Federico Vaga <federico.vaga@cern.ch>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
Subject: [PATCH] fmc: Decouple from Linux GPIO subsystem
Date:   Sun,  9 Jun 2019 01:14:30 +0200
Message-Id: <20190608231430.22916-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

FMC has its own GPIO handling, the inclusion of <linux/gpio.h>
is only to reuse some flags that we can just as well provide
using local defines.

Cc: Federico Vaga <federico.vaga@cern.ch>
Cc: Pat Riehecky <riehecky@fnal.gov>
Cc: Alessandro Rubini <rubini@gnudd.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I will merge this into the GPIO tree unless there are protests
against it.
---
 drivers/fmc/fmc-trivial.c |  1 -
 include/linux/fmc.h       | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/fmc/fmc-trivial.c b/drivers/fmc/fmc-trivial.c
index 8defdee3e3a3..b99dbc7ee203 100644
--- a/drivers/fmc/fmc-trivial.c
+++ b/drivers/fmc/fmc-trivial.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <linux/fmc.h>
 
 static struct fmc_driver t_drv; /* initialized later */
diff --git a/include/linux/fmc.h b/include/linux/fmc.h
index 3dc8a1b2db7b..f0d482d29df7 100644
--- a/include/linux/fmc.h
+++ b/include/linux/fmc.h
@@ -101,7 +101,7 @@ struct fmc_gpio {
 	char *carrier_name; /* name or NULL for virtual pins */
 	int gpio;
 	int _gpio;	/* internal use by the carrier */
-	int mode;	/* GPIOF_DIR_OUT etc, from <linux/gpio.h> */
+	int mode;	/* GPIOF_DIR_OUT etc */
 	int irqmode;	/* IRQF_TRIGGER_LOW and so on */
 };
 
@@ -115,13 +115,15 @@ struct fmc_gpio {
 #define FMC_GPIO_USER(x)	((x) + 0x1400)	/*  256 of them */
 /* We may add SCL and SDA, or other roles if the need arises */
 
-/* GPIOF_DIR_IN etc are missing before 3.0. copy from <linux/gpio.h> */
-#ifndef GPIOF_DIR_IN
-#  define GPIOF_DIR_OUT   (0 << 0)
-#  define GPIOF_DIR_IN    (1 << 0)
-#  define GPIOF_INIT_LOW  (0 << 1)
-#  define GPIOF_INIT_HIGH (1 << 1)
-#endif
+/*
+ * These are similar to the legacy Linux GPIO defines from <linux/gpio.h>
+ * but in fact FMC has its own GPIO handling and is not using the Linux
+ * GPIO subsystem.
+ */
+#define GPIOF_DIR_OUT   (0 << 0)
+#define GPIOF_DIR_IN    (1 << 0)
+#define GPIOF_INIT_LOW  (0 << 1)
+#define GPIOF_INIT_HIGH (1 << 1)
 
 /*
  * The operations are offered by each carrier and should make driver
-- 
2.20.1

