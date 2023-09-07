Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDC579754D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 17:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjIGPqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244841AbjIGPZw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 11:25:52 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB45CF
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 08:25:29 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so12220715e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694100321; x=1694705121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HijaDWjtU9+MMMmQDH1Rm0HmHWsQfV4zHlVWc3shxSo=;
        b=NcimMccUpdcJOzDBrDiQHRJa+Pf5tShg/1Q82rRNAOVvxHvrMu6KRaQFu8JCyk2RZU
         aQSsS1wKcBAAhitatqxMJcp0OeSpdK5JYAASp5JpGdglVEZ6z8iTV1oaaQorB2YEkojD
         VW4u0778OKCnE3bQqiIdFJzUG6vq4paoHQ3gibyd5irs+WGiaA0mrGihkeuj3lbUIsLJ
         5rqqdMcHElt4OhOFc5GkrUKULSDW9us7oNxLUk45bEe6aJcDmBRlziZ6iY5QkqcnnYn6
         r+Qc5Jkk5tljZm4dRc0cTLuTPTyCYoMfBv/NKyO0FPWwL5Ka6lVa9cxiEH6mHN8SG7ib
         ZVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100321; x=1694705121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HijaDWjtU9+MMMmQDH1Rm0HmHWsQfV4zHlVWc3shxSo=;
        b=TfGAz/l5V5NlKFvWUu1DtEn0DZWL19UC5gVf5l4+tzS8xHIHh6RwAOvqQNDsPWkiR/
         n90scuMD5v9366ODofL9LHvQ2BofScNx1scgATAhcHyP5O4t8h2ZJDv2j2UtShOl5Ylx
         MwY4+UrNDIeUs3UCES8EKN0ZfJaaUIkWUz9LFTzhp3lsqQqYbJ3pkjoLrgORYD0eeeXq
         uthcNWOksLLeNcw8XTRx0yfMYbRazDEBVHCcEjyCtY0moiOxgmR9Mphpk0sNdfGvOv76
         N8ia6CXT7NA7Dh5FlLmGDIygYSObqkjr6MnS6aYfcFWYuQnHab7TEfy/jiqm30qFDqdV
         Pgwg==
X-Gm-Message-State: AOJu0Yy6ep4jvXIjp3yxrhh7s5Y1OMRnFi0oNqw5ZQtKimxZzTYDSsGn
        xCIoSE0pbr++QJkQbRRWvIV3VnmmkSda0HQUnwk=
X-Google-Smtp-Source: AGHT+IGMfrd68cQiTItvDb+O04EvbhJPhzV/s88UZI49HyvK3RoNa7kYSWHBGxozNXZDNyvX7p4BiA==
X-Received: by 2002:a05:600c:224e:b0:401:b2c7:349d with SMTP id a14-20020a05600c224e00b00401b2c7349dmr4904033wmm.29.1694098353082;
        Thu, 07 Sep 2023 07:52:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:56f5:e2d4:1e04:b28e])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003feef82bbefsm2757588wmi.29.2023.09.07.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:52:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/5] gpio: mockup: fix kerneldoc
Date:   Thu,  7 Sep 2023 16:52:26 +0200
Message-Id: <20230907145230.44085-1-brgl@bgdev.pl>
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

The pull field of the line state struct is undocumented. Fix it.

Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b32063ac845a..17d4d48524b7 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -39,6 +39,8 @@
  * struct gpio_pin_status - structure describing a GPIO status
  * @dir:       Configures direction of gpio as "in" or "out"
  * @value:     Configures status of the gpio as 0(low) or 1(high)
+ * @pull:      Configures the current pull of the GPIO as 0 (pull-down) or
+ *             1 (pull-up)
  */
 struct gpio_mockup_line_status {
 	int dir;
-- 
2.39.2

