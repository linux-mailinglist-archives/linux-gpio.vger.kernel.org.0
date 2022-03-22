Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC5D4E499A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 00:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbiCVXTk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 19:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235062AbiCVXTk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 19:19:40 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FE1D9
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 16:18:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bt26so32318577lfb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IlvSzK9qr8gzT/s3Ppjw2CrkkSxqvSAAPHHlUkK2vds=;
        b=WD7pP6yEtnbV4YoAHvSM6rC3s0OTmDEWHSUM0KhQB0zmbbrVxTOY0pFDxSnwgRJXHp
         RrmZz+sjli/PkTL9vzdTBFmF4qySLhiHmzY6ZX2LTxEzQcM52rxNMa63yPAfTOUozClb
         lfYXRWQ4BGkcnwxwWC7uuXZD2SRfEZBiZr593BJ+tn622aHHurBQtDYZY8cLiJ+1stuy
         7lAKmvWLXxJEFLTpNm2EXz8AHA1Ewv3+91L8vvAOD2FLewJQ7dHjVXpydnLo3svpn/5o
         m7oNhAPW9Tg/GcoyiHWMNKr1bbXYkaJCP4nUGc+sQYwXhR/I/PDTQwOKmKGvcGA8uPl+
         sauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IlvSzK9qr8gzT/s3Ppjw2CrkkSxqvSAAPHHlUkK2vds=;
        b=J1PAhnXs3V41AWZPoLWl46/lXvsY/kp0q8Zk/VbO/qAXeolci8nOc1uynxVJ0Di8h1
         bEC15zZ2nJ5aQnsWrVFwW7E6Pua0LiM1BsN/53w5suHqkYA/urocA6Fhw5VdLIUWiz9O
         J2ppYu2IAW+tdmt0pQcP4WDa6XAxiMn09PHuhS+z9R/NMhl/frmeZkfxkwzQ+fnPcVVV
         ay6rMBCXACFdkjd006Oo2XRDJm2cG3E66AwUkmWDvS5eP4TU8ekPKprjS7Hl0pxkFjQw
         KiuCIxGQIvUGQ9KhPwxyQQDIoCge43Rql01g4ExTqZq8yx6PEYTG1MZOOPTkCRHnDA0S
         Qbyw==
X-Gm-Message-State: AOAM5334sn1Y8rxUH33eq57eQeu6Wq72nkQ8txSnTLZTCUqLelp3Rrip
        /KQQkraskOBkw5GEfeYnga79oMBTwXCyzw==
X-Google-Smtp-Source: ABdhPJzW1PnUGIU67IxyTYx/I1hP1yoKU9DZiK7jETMSLtS6d7HAidQds6IIgIo6CsMqPgqnohRKZQ==
X-Received: by 2002:a05:6512:a8f:b0:44a:3936:3a1c with SMTP id m15-20020a0565120a8f00b0044a39363a1cmr4392712lfu.464.1647991087047;
        Tue, 22 Mar 2022 16:18:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e18-20020ac25cb2000000b0044a2f5cfba8sm730114lfq.303.2022.03.22.16.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 16:18:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: nuvoton: Fix sparse warning
Date:   Wed, 23 Mar 2022 00:16:04 +0100
Message-Id: <20220322231604.491272-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sparse complains:
drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9:
sparse: sparse: obsolete array initializer, use C99 syntax

This is because no equal sign is between the array index
and the assignments, in the macro.

Fix it up.

Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 661aa963e3fc..1402840af11f 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -613,8 +613,8 @@ static struct wpcm450_func wpcm450_funcs[] = {
 };
 
 #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
-	[a] { .fn0 = fn_ ## b, .reg0 = WPCM450_GCR_ ## c, .bit0 = d, \
-	      .fn1 = fn_ ## e, .reg1 = WPCM450_GCR_ ## f, .bit1 = g }
+	[a] = { .fn0 = fn_ ## b, .reg0 = WPCM450_GCR_ ## c, .bit0 = d, \
+	        .fn1 = fn_ ## e, .reg1 = WPCM450_GCR_ ## f, .bit1 = g }
 
 struct wpcm450_pincfg {
 	int fn0, reg0, bit0;
-- 
2.35.1

