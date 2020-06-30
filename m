Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B69F20F5BB
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388169AbgF3NeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388175AbgF3Nd6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838D2C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so19613378wmf.5
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qg/i7Z+DVHnxMJURbtuvnuqmQ2dblOKzOYHmn2TAyNw=;
        b=wTYsKZg6XOOwxF3oDluUk1u7aO7yNTj639l5CvuRCOC6RNDIbnTV/IcodT/0pqXNw5
         pFneNKZwxITWnSGPM7dh/ReDTHF6g0AZZopWTNoTm3SVu8g3gabrkJMYF+fLUxsCAOtc
         g2sEqrZ62BMpGwWgQhxIyK1xLKtDhgVq7F4kMmb84oNfW36RuTgAnkrQ2AUiRMYHq5mb
         5Z1wMXrCHXX73X50iSEhunoIGLBqslyiYCHs+Ekoh9ShjjyXgkgMDYMdvtVrgjQCiCAw
         crp4lzcA5lAPU0j8es+fPggZvMOjmHObzD87nJW7VuLRDGYln9cRTzANzvJR6PXgUd8P
         FLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qg/i7Z+DVHnxMJURbtuvnuqmQ2dblOKzOYHmn2TAyNw=;
        b=kTMSz0HkLRQtu2QCHTvCEPJJ1PGvi/4JV5CRnwjaoQjTrGj2lu9kjvAw7V7BGZ9tu5
         Nq90uPuqqjTa2prCNrl4uqm4YCtDFVU2xiiysX49VOmGSFNG3erNe0xp/opVa1th5P5J
         OCqxHkWKmebZH5bdh45/M/OCqUC7gSMZg+7T0AMzuwwIVbmLSrLCoQDuYE4uKpro84r8
         CHL4aoSSwES4sZ182BqrO+waDFqqaNClXmlilI2V3xC5WVfyn33QBil3J0dbXrQUTjZx
         xOJfDvCFI+yXMnM+cASe1Xu9/nAvhNFv+0MIcN8/K1Ekl1L8J2YZVrwuDQd16W8b5G5A
         a5TQ==
X-Gm-Message-State: AOAM530DIkv28C8GJBgeCnSRfpEnpwEuTBgHOuqVf70n5ycaWM6Algcz
        QwHRSNMOtX1IhUOCmLvJRQvo+Q==
X-Google-Smtp-Source: ABdhPJxuB0GHncTea0p5EeyC3ow+2hK3Kp2Tm41ZPwIkJuIuPL7Leq57W4yxAyWNj5wXl7BWX7g3dQ==
X-Received: by 2002:a1c:6102:: with SMTP id v2mr22253807wmb.6.1593524036198;
        Tue, 30 Jun 2020 06:33:56 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>
Subject: [PATCH 07/10] gpio: gpio-it87: Fix formatting issues which confuse kerneldoc
Date:   Tue, 30 Jun 2020 14:33:42 +0100
Message-Id: <20200630133345.2232932-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kerneldoc expects struct properties to be documented using the syntax
'@.*: ', but no ':' has been provided in 'struct it87_gpio's
header.  Add them to stop confusing kerneldoc.

Fixes the following W=1 warnings:

 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'chip' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'lock' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'io_base' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'io_size' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'output_base' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'simple_base' not described in 'it87_gpio'
 drivers/gpio/gpio-it87.c:69: warning: Function parameter or member 'simple_size' not described in 'it87_gpio'

Cc: "Diego Elio Pettenò" <flameeyes@flameeyes.eu>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-it87.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index b497a1d18ca9b..8f1be34953ce4 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -47,13 +47,13 @@
 
 /**
  * struct it87_gpio - it87-specific GPIO chip
- * @chip the underlying gpio_chip structure
- * @lock a lock to avoid races between operations
- * @io_base base address for gpio ports
- * @io_size size of the port rage starting from io_base.
- * @output_base Super I/O register address for Output Enable register
- * @simple_base Super I/O 'Simple I/O' Enable register
- * @simple_size Super IO 'Simple I/O' Enable register size; this is
+ * @chip: the underlying gpio_chip structure
+ * @lock: a lock to avoid races between operations
+ * @io_base: base address for gpio ports
+ * @io_size: size of the port rage starting from io_base.
+ * @output_base: Super I/O register address for Output Enable register
+ * @simple_base: Super I/O 'Simple I/O' Enable register
+ * @simple_size: Super IO 'Simple I/O' Enable register size; this is
  *	required because IT87xx chips might only provide Simple I/O
  *	switches on a subset of lines, whereas the others keep the
  *	same status all time.
-- 
2.25.1

