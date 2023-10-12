Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8967C6D9F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 14:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjJLMJp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 08:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbjJLMJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 08:09:45 -0400
Received: from mail-wm1-x361.google.com (mail-wm1-x361.google.com [IPv6:2a00:1450:4864:20::361])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321DBB7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:09:43 -0700 (PDT)
Received: by mail-wm1-x361.google.com with SMTP id 5b1f17b1804b1-406619b53caso9427995e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697112581; x=1697717381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCd86krm+sRKImeRGg3ra0F0+tROXTJ0aHYDS1TwYCg=;
        b=UtyvYFvl52z48kxz6v5Vq5ue6+Pm9lfnvoqUHFfi27+D4hd22rddTqxzjlEV5oo8fm
         +eIHgppgcIzEYWnYO0vBSGnZTDpEiZQx70xP4w498ApYWsi45AJHjPle6duUuVDoGZKF
         1oHW+uxrwOjxr3taZC2E+C9u7gdwTyCP/LCjW6bSYN0OgI8Ig/kp7XlxefdrBU28+YRU
         NyErLGRSLXRYm0q/dCjzcWfasoiOjLVQtb5UCOI/MA6YlATJQqgN6YKEl8705LPf43Wl
         YYYhGOVh5WInIT/ILPpbUaf1W77L7Yhf17ymmlwuAsZu9icYjYxf9nFlv1J5RZK6qHSp
         2qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112581; x=1697717381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCd86krm+sRKImeRGg3ra0F0+tROXTJ0aHYDS1TwYCg=;
        b=qNetynkuBwnzphUc+U6PJYo7HK/9M/BMzuIkQCAzZ5sWoIBkPYfZ5HQWkIOV4iDMH/
         a3AUUlxHazdKEWN17b3NrG9CeGlk42r5A+eI+UmIcVaDfxY4fmqx1dlKHId9vJxF0CwR
         guRf+fURMxttjUzUQLDW4548S5c15gPXm1SaWsxP8gFYD1vyJduFMyjerC41jSnqsy7+
         iWx1898kAvr1uYO1pXLvtbxPZNDPRgTYf1dLJiauf1D6HDRLLZM6guOL4xPRdCGQ2IIC
         21qgmOqQL2jdByaPZsfaXiyCBBOPiq6EK8lg48MQ8bnFBwdNw1UgyaZgRcb51VJ/jnWK
         sBkg==
X-Gm-Message-State: AOJu0YyWWNJm4V+i0BoYF20amINIDOncxWKDojSwSR1La/tlgx5ZsZYS
        bvxFAPV9cVajnFE+rw3M3IOZGF99sizy+VU7RjYO1LHrijIqIQ==
X-Google-Smtp-Source: AGHT+IHq0XYRzZDJ8l6GVVYlMlNfLVoZBoSOogBT7hh+EJZaW3wYyCm3Tj1WuLL2Tdmfw1mso5xOcGD29ou4
X-Received: by 2002:a05:600c:2298:b0:406:513d:7373 with SMTP id 24-20020a05600c229800b00406513d7373mr21476887wmf.11.1697112580716;
        Thu, 12 Oct 2023 05:09:40 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id v14-20020a7bcb4e000000b003fbc072d865sm1394583wmj.31.2023.10.12.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:09:40 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 1/1] bindings: python: don't use exec to get __version__
Date:   Thu, 12 Oct 2023 13:09:25 +0100
Message-Id: <20231012120925.58508-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012120925.58508-1-phil@gadgetoid.com>
References: <20231012120925.58508-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Import __version__ from gpiod.version instead of using exec
since the latter is potentially unsafe and unnecessary.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/setup.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 66b7908..278baee 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -5,6 +5,7 @@ from os import environ, path
 from setuptools import setup, Extension, find_packages
 from setuptools.command.build_ext import build_ext as orig_build_ext
 from shutil import rmtree
+from gpiod.version import __version__
 
 
 class build_ext(orig_build_ext):
@@ -54,9 +55,6 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
-    exec(fd.read())
-
 setup(
     name="libgpiod",
     packages=find_packages(exclude=["tests", "tests.*"]),
-- 
2.34.1

