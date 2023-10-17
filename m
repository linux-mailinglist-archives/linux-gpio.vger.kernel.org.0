Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2497CC1F8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 13:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbjJQLmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 07:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjJQLmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 07:42:08 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B86995
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:42:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso55376615e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697542923; x=1698147723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxRVTYJvLXRJ2reptGOfGa/+cEy5Ge6cdnFHrE14BE0=;
        b=WZiIua0hOLxwl40X6dr1rgtT5J79SygV9IVh1A2sXHTY78mcgyLr18aVSJN/Q0oAZH
         PJpL17F6H74jpHQuQcUZFEm1Sr7y2xKmq7fFWEDcsAsiyUtQjVaUnfoHjLwBpa/yyx4k
         VDOD08i4q1v9S7x9UXiDrP1aLqHNStWIw/1meKbG3+gmslGA6moAUk1p4iKoryA3FbqF
         oKuxTcdcLXsUI75uwvyoiag94kbVgKKg1PVVTk8xMSvCtU+DxqHc3bnyz4GXbGyMla7Z
         rgBKtjUvH50jZA4TkPw5ysxSyl5bc3GQ2jSi51p1N6gsxXnza1dLHXGg69LH9skzkYcg
         XOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697542923; x=1698147723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxRVTYJvLXRJ2reptGOfGa/+cEy5Ge6cdnFHrE14BE0=;
        b=M4oW4b4FOYqmUhKzr/FAizSS20fhwLtS7oart8a/K5Kx4tJzm4wY9WNcdnE2tl7BNg
         D0AVjCK2OeGgwshHSRUt5VZ5uNx6hgYNfqlEbH+CXkKi5BkWpeFkBH9uVVu8tnoG+i6m
         yFykOLzXOfXXuuUNtnyZVgl45phdOrZ9jY3ZGMie0/jeOwfl6XSkxf0qgkoWD6zFCOqW
         EXl8vz5VCyL/y85dVbxXc9UtvD2fxW3gdZ04K56r+QHrydqQyv00Kng4i5Y5LA7kcE7Z
         KXPNFTR48XonRDLrbr02uu/klTFIFesPqQPADxQt+JWnBGlI611JJBAsMy3+smeJNEju
         vV7A==
X-Gm-Message-State: AOJu0YwVgQHEDfcyuqqZaA09TMUpds6+IOJ0OifpJQg7kABGahR5csQF
        0BjcueyjMU7ir7Ha0F6YAHAXvA==
X-Google-Smtp-Source: AGHT+IFUn9p5Knw4ulVpUX062t9Zzkz9JT4IU6mq9/TsONeSoA7pGk4tGbHJ5sd1ez6gDCjJTE+KPA==
X-Received: by 2002:a05:600c:4f02:b0:401:a0b1:aef6 with SMTP id l2-20020a05600c4f0200b00401a0b1aef6mr1659383wmq.2.1697542922693;
        Tue, 17 Oct 2023 04:42:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id o29-20020adfa11d000000b00326b8a0e817sm1501983wro.84.2023.10.17.04.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 04:42:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Phil Howard <phil@gadgetoid.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: change the package name to 'gpiod'
Date:   Tue, 17 Oct 2023 13:41:59 +0200
Message-Id: <20231017114159.51979-1-brgl@bgdev.pl>
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

We now control the name 'gpiod' on pypi. Let's change the project name
as the package we import in python code is named 'gpiod' and not
'libgpiod'

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 168c1af..fbe5bc5 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -148,7 +148,7 @@ if environ.get("GPIOD_WITH_TESTS") == "1":
     extensions.append(procname_ext)
 
 setup(
-    name="libgpiod",
+    name="gpiod",
     packages=find_packages(exclude=["tests", "tests.*"]),
     python_requires=">=3.9.0",
     ext_modules=extensions,
-- 
2.39.2

