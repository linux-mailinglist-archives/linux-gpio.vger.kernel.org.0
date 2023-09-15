Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACDF37A1ECC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Sep 2023 14:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234836AbjIOMeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Sep 2023 08:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbjIOMef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Sep 2023 08:34:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A07A195
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 05:34:30 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401187f8071so14212775e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694781268; x=1695386068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a84fzKCzx4Lh1OZKpKQr9OcyKJOlraxzLNN52YI1hEE=;
        b=pV69U8x2y2E7TrkvPybl1AbIGU/vZH6heaNEpfqXM+BfiARsDzWrs/C2B5PGm2nYcs
         sHdfxMHbUiy6d1ItM/+COrdcDRcOGPqn73ScHkczyr4VVVOEKFJIZbRzfJXEc8ODdpDw
         P8N5dBfa+tncnmTfahvfKTXr9n+++0T4CqbXNz1l/vnlbIB0oEaAQHbEgh0TgvvMBoaG
         TVpaQjqxU6vvTzMO2Tk/6fV4nnF3sd7s7wPfth5HL/9e8ffJrMjoHmqtLUzVaMOT0QMV
         /xnkDT8Pp/C2Q1OthX73zDiFGfw+Iww54cVaTDvQ4lcmeIokXT5jZVITxp5GKdWI29XO
         aHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694781268; x=1695386068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a84fzKCzx4Lh1OZKpKQr9OcyKJOlraxzLNN52YI1hEE=;
        b=Wzq1fbx8XyQNavObxFJrCkd1lQOjf1EAUgm5RGerrI2zB/FJMloFORBu0ufdhrDeAh
         /ZQZFF+j8xDwnfxk+xpPyq6i+E5pmC14FOGMAkgoG5JBirpcnugMsCU7z//wftDPzcpJ
         Wv4oOx50ZAT/lUi3yrZjGJUyJhzMh2IWG7HsI63HQnlzrskwXcwvy6WRPEt3ElO96MNE
         7tnsVDgpCdyH4JHZ0tcj00s7pdKBLnW4wxXhkQ+5oG4XQP/3I123QOI8PwJbzE6cEJjV
         Jhhfcl2Me1i6DWFp+iT8S2/ifPUvA7dVhJUMDT+sAL1W1ojeatW5pheStprADrzJ40+t
         A9WA==
X-Gm-Message-State: AOJu0YzTu/u/bXl6A2DMAPfwcJ+TNRZVH9b4dN3tRqCCZFJ8/TYtUOop
        YiVsOFy22nZ57xlC6iFlEQKRMey3FCVUjAahjEM=
X-Google-Smtp-Source: AGHT+IHZpExjeLucadZx6gbnHX4mOvdY0Tl0Z1COO3eqQ76w2kvxj39S38pV2dQ0h8gGBO7/qj6cPQ==
X-Received: by 2002:a05:600c:2218:b0:402:ea5c:1845 with SMTP id z24-20020a05600c221800b00402ea5c1845mr1191529wml.5.1694781268300;
        Fri, 15 Sep 2023 05:34:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:aa19:4569:aeeb:c0d3])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c204300b003fefaf299b6sm4553110wmg.38.2023.09.15.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:34:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: sim: include a missing header
Date:   Fri, 15 Sep 2023 14:34:23 +0200
Message-Id: <20230915123423.75948-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915123423.75948-1-brgl@bgdev.pl>
References: <20230915123423.75948-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're using various ERR macros from linux/err.h but the include is
missing. Add it.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index b4e6d06d08a2..d9d7df7bd387 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -12,6 +12,7 @@
 #include <linux/completion.h>
 #include <linux/configfs.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-- 
2.39.2

