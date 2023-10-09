Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3507BEA52
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 21:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346662AbjJITHo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 15:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346660AbjJITHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 15:07:44 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366B8A4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 12:07:42 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40666aa674fso46316245e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696878460; x=1697483260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwmQKdvrDrMfRgXOywmzBm2boicgJWq4jYBe26K+/vc=;
        b=XNtFCdADYp5gWfQF35XtiXh2DrnqSRDXN5dJhX2f9WImaGAxof2RuFtM2bM7cyLqeV
         3sHn2+6d9Rv1bRykmvhuVYRF5qBqOTlZuVjz/DKLtPLx3Etf2cQa0kWJv/2kux7sSAoO
         2SwkKXGhvfLG/uhoqD4Jnz3IL+mn5RoVCaCD71jnavNfM5zqPVJueAatZi11HGIqIA3m
         nBtcv5Yh35L6IY4Rvz5fNocPwbPahYC/x0DfCUWqro844ADUQgqOoYZZAI0eC/zPWROi
         IPTZ+b7SzwWN3S0C2WV5wq3hb82aU6XSBUyJ1G2kWQTS7kXmr50p2Z9aB1d7YnAuOzNw
         8vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696878460; x=1697483260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwmQKdvrDrMfRgXOywmzBm2boicgJWq4jYBe26K+/vc=;
        b=bk165YQbQQuQwAUWovjzr4UK7/o8VxmTYTajYD0pGMslAsyTRqpZeTk83Klfurc+A1
         NS1nR1PGStQrREz25IyxPllCmTV1JF4AvObb5rfDZajvggx6SjPRb02WhpUU/v6Z4KZF
         0QKpZQYSaVj6XKUjpj4DvcRqNdl6sQrpIHizO7ErShyacvSHLVZ4NOCv2yqyreBpcJOG
         6q+W3+e2FT01lSuieqKvffqD6fQZ8X3rBd9FtxoZC+xBEvY1Sv2UxtDXUT7QrT0jscC5
         esEr6jKD2skSFoaCIOjTFsgjTE5IlX/7jomjHdCgNmJU9VEOe/hHdCNPBjBJmSAJmbMg
         2Vpg==
X-Gm-Message-State: AOJu0YzfD8MUp/CK9qAFJtdCcNYaLmeRyYOtaWizeGcBLqCgy8YW3WZN
        NO4I/Xo97iIvXYGt2f1LH+5ahg==
X-Google-Smtp-Source: AGHT+IHvVS+UvuzFLmNsOIBU3IQ+Wq3Qitlt8GSM3V+YKEK5VXkkrZ/bPlLdSCaYw46rdSfXtu73pA==
X-Received: by 2002:a7b:ca54:0:b0:405:3885:490a with SMTP id m20-20020a7bca54000000b004053885490amr14650651wml.0.1696878460407;
        Mon, 09 Oct 2023 12:07:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id k14-20020a05600c0b4e00b003fe1fe56202sm11975755wmr.33.2023.10.09.12.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 12:07:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH] bindings: python: replace PyModule_AddObjectRef() with PyModule_AddObjectRef()
Date:   Mon,  9 Oct 2023 21:07:29 +0200
Message-Id: <20231009190729.38675-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

PyModule_AddObjectRef() was added in cpython v3.10 while libgpiod claims
to depend on python v3.9. Replace it with an older variant that steals the
reference to the added object on success.

Reported-by: Phil Howard <phil@gadgetoid.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/ext/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 25c252a..b456190 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
 		return NULL;
 	}
 
-	ret = PyModule_AddObjectRef(module, "__all__", all);
-	Py_DECREF(all);
+	ret = PyModule_AddObject(module, "__all__", all);
 	if (ret) {
+		Py_DECREF(all);
 		Py_DECREF(module);
 		return NULL;
 	}
-- 
2.39.2

