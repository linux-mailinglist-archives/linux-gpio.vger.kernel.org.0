Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F007A5DF7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 11:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbjISJb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 05:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjISJb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 05:31:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A690102
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:53 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-530ab2d9e89so4221345a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695115911; x=1695720711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjSxSHbiXy+6uVxVvYkOIKZH9X7bozWPqt08nDfakz4=;
        b=cM9gbtB1Jj85aPhIp84eHAug824kxlfeLOLgZuJjeY4OHjwPJYy4wb04gvSRujG0Ln
         7ibYtytL5tMN6JPqX+lRTgzy7mlIIxXyWshw1NCDSC4efNJdus8vYbJUR/kB0W0i1H06
         6Ozu/dEFNOaGYzAsP5E9CsKiv9tNp+/ERi+L2sXejxarF8bCwYqKxpzf4V/pTdUoSiJj
         b9FuqedtwxfvRTSd0P4u/nyO813mzEHbFR17zTAoVNRfY0YcJ6iSOCwabPhr3HgwkwtI
         +Xfxt93agTXjjrtYjs4TC1CvjzbQ7AGFmb1i9/A66Yl2c0Ij++zGLnzsPHpYbPvr8ZW0
         E+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115911; x=1695720711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjSxSHbiXy+6uVxVvYkOIKZH9X7bozWPqt08nDfakz4=;
        b=AasYK6xgb4sTzNZ2E0IQVNcQS/wz6aVKZg4a3BKQukuOUjnOR9sPls8j5X3syjhen8
         3vvsONO+Mzx9FZ+4kRUova5Seji/Jb5gF0OvI4lxptOtd8DjlIcrZmf9bEQtHfzXk8bf
         N7E9ZaUm2J2F2PEamjZjTzXLJ6twfGW93x2serRRwi+NTJtrS5PDTGwJU8i2/rZFCRUA
         sTwKQNdhb11Rm4edZFIIYfAX8aIVebfT3nw/MR58J+SeP6aS7PkVmcDv6E3DkK8qyxye
         Z7mljsZdvQJ+MA2krGAwZydm8jkzmtg1Wy1UoRp20sMC/kzhTj4v8ytv+73eumszWNkY
         y/WQ==
X-Gm-Message-State: AOJu0YxF58R4owMWCwyUJNsZWHjG7xpnO4hrCgJRIuar7sN/c97oQFZn
        MsQ5B/UIhRKs0geYn78B/9QUvLtcimi5kNvAfhsWQA==
X-Google-Smtp-Source: AGHT+IHsLGwodG7bsUAQBaPqZQnwKz2nEYEmKXSM9PH6EEpiIkJlaXnmSEQ0Qanl7WZf3ItP1rtjdg==
X-Received: by 2002:a05:6402:2744:b0:530:e9bf:1ea3 with SMTP id z4-20020a056402274400b00530e9bf1ea3mr7995399edd.7.1695115911626;
        Tue, 19 Sep 2023 02:31:51 -0700 (PDT)
Received: from brgl-uxlite.. (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cy18-20020a0564021c9200b005231e1780aasm3227294edb.91.2023.09.19.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 02:31:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 3/3] bindings: python: tests: don't use the same chip from different threads
Date:   Tue, 19 Sep 2023 11:31:42 +0200
Message-Id: <20230919093142.85389-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919093142.85389-1-brgl@bgdev.pl>
References: <20230919093142.85389-1-brgl@bgdev.pl>
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

There are no thread-safety guarantees in libgpiod. Let's not reuse the
chip object created in one thread to generate info events in another but
use a global request function instead.

Reported-by: Erik Schilling <erik.schilling@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/tests_info_event.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index f3926d9..6bb09d5 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -37,9 +37,9 @@ class InfoEventDataclassBehavior(TestCase):
                     event.line_info = 4
 
 
-def request_reconfigure_release_line(chip, offset):
+def request_reconfigure_release_line(chip_path, offset):
     time.sleep(0.1)
-    with chip.request_lines(config={offset: None}) as request:
+    with gpiod.request_lines(chip_path, config={offset: None}) as request:
         time.sleep(0.1)
         request.reconfigure_lines(
             config={offset: gpiod.LineSettings(direction=Direction.OUTPUT)}
@@ -95,7 +95,7 @@ class WatchingInfoEventWorks(TestCase):
         self.assertEqual(info.direction, Direction.INPUT)
 
         self.thread = threading.Thread(
-            target=partial(request_reconfigure_release_line, self.chip, 7)
+            target=partial(request_reconfigure_release_line, self.sim.dev_path, 7)
         )
         self.thread.start()
 
-- 
2.39.2

