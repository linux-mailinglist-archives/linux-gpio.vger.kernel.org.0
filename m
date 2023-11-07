Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97F57E4102
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 14:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbjKGNts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 08:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbjKGNtc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 08:49:32 -0500
Received: from mail-lj1-x261.google.com (mail-lj1-x261.google.com [IPv6:2a00:1450:4864:20::261])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BDF1721
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 05:47:24 -0800 (PST)
Received: by mail-lj1-x261.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso75513731fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Nov 2023 05:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699364842; x=1699969642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dT8HNQOrxIm3pkuqT2pRA4XkMhzWg9k/6qHhenud2A=;
        b=CP4zAY5vEi8UJtnFyGECT4yr2osFXpOmKrhgUqdNiugNrK6TcDkceHV9xBIwcsxO0J
         ATDI8O6GU4Zdm6Zg7Wd2L60OkRywEagMT+/cTFQHpDpf2nyj8OtXAlYISY0yqZvqZb9U
         7+0VCMPaveJ0pAUB+BFN8CNw9LAAuethP+8lmuGPzR0MiaZyf5g62p6GdkZMIzR+SL8f
         UiLV6ERNtIHtWHBup4qM17CIgKMu29uhN4CRwlLPHqG+ZzkEEpiHERkYQLO2NghudxvM
         OWn2oWJEasqF4lxU0K7iWw0itFCja0/vrVQS7UtgYWd6seBt2sFU0lgyy09kURO35x3K
         Q2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699364842; x=1699969642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dT8HNQOrxIm3pkuqT2pRA4XkMhzWg9k/6qHhenud2A=;
        b=GPJ7vuIDpQ42aChJxnW2dn/296K3M6Kz+ceJ5wo+OZRHhHr7eYrpMtOPjDNAuqsMfL
         PZJu3nPn8XmT93NbOGl+ETZkMKmeAU0Mv3KewN9bZIx1jTvwH39tMdB+vcuVFqeHjQb2
         v4ph7OVB4l20SAXZ6vmpAjKM8CQKmIUeIFnE2urwgwTib8r2AgiSGui4Z5MPuwL2glbl
         jLEmvVib6rZjurTql8qOz3vgfLfRcjXaGVXPR2imo/c9ujwdF0I8FU8Dmt8PbwycARKM
         aC2KDrwJ8UcGDEeHKs1qeoEvxuxhren9Xz3rNTtndA3WUFztA3YqA+b1CWxO90QzENjM
         a1RQ==
X-Gm-Message-State: AOJu0YzWtLIePHRr+iWvDDrYUEriGd2ZhHtQUWzkz5PjOCXvSMtl7xjV
        iM+G7Oys9espjeVN7aK3lQQBqCLfckwMnEYTcKD3qOKgdDJWmA==
X-Google-Smtp-Source: AGHT+IHyctoVVuPshnlL40GpsjVRt9xwgrMfJDFxe8gnyu8YqyTnkxXmo0l+2C4O3Urt+6wYYo4f6IKNE2dd
X-Received: by 2002:a19:430d:0:b0:507:9d70:b297 with SMTP id q13-20020a19430d000000b005079d70b297mr22347999lfa.60.1699364842167;
        Tue, 07 Nov 2023 05:47:22 -0800 (PST)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x8-20020a5d4908000000b0032db2e770f1sm66153wrq.66.2023.11.07.05.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 05:47:22 -0800 (PST)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 2/2] bindings: python: use absolute paths for python test builds
Date:   Tue,  7 Nov 2023 13:47:18 +0000
Message-Id: <20231107134718.2913223-2-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107134718.2913223-1-phil@gadgetoid.com>
References: <20231107134718.2913223-1-phil@gadgetoid.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change the paths used to build test C extensions in place to their abs
counterparts. Avoids issues locating files if the build behaviour changes.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/Makefile.am | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index b2f2779..95edfff 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -14,8 +14,8 @@ endif
 all-local:
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
 	$(PYTHON) setup.py build_ext --inplace \
-		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
-		--library-dirs=$(top_builddir)/lib/.libs/:$(top_builddir)/tests/gpiosim/.libs/
+		--include-dirs=$(abs_top_srcdir)/include/:$(abs_top_srcdir)/tests/gpiosim/ \
+		--library-dirs=$(abs_top_builddir)/lib/.libs/:$(abs_top_builddir)/tests/gpiosim/.libs/
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-- 
2.34.1

