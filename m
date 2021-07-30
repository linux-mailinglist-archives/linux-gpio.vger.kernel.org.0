Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21573DBAED
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhG3OoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239142AbhG3OoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:44:04 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96D1C061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:43:59 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so6561110wms.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3Uljq/U1cuZobrPxO7EoVX2yKmmurExxq1TAZfqfvY=;
        b=HnBEitHb6JoyggoXhssr68VhGleS92OhY7UO8DJonQccN2G4ZOvCffzStEFYTVwjsb
         2Dhq/78TXgyUuffmxgAkBay+XstK2KeVOeCMsFgj0vYQVZ7OU+xy0ujIN58aWw1bPFB+
         1QNV0bwNHB3GSCZ5baYkM3hE15prXcIg7HN3w213clCFqhx6UKTu0Zl9uJUGGIaDL/aZ
         PxGf+QMMO9sOMJK9Fx0n5WOIBJ/1gqGGvHzjWNHvJL7wM0fngQF4sPp1wSFF5Hq/Qr+I
         PdDikW97uGMAc509R/b/hmyf132zHk6yabi604cWuIR+drd6bsko/ZHjr7peuoLXdHb2
         oplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3Uljq/U1cuZobrPxO7EoVX2yKmmurExxq1TAZfqfvY=;
        b=BMaQCtjKjhOtW2oR17mT5W/YuGSvSSWh8RQOjmaUH5JtEYsxfrr4hf2D5JnhhVrk+U
         VAQdPAfGt+1vW8/7kuWif41jAI/wgebnqS/TESH0g8Sf7DPeq64b/qRn8hXTkVPojovk
         OBJ4ZgwOtnU9tLKcMplsyj3Q5sahAWacWF4N9xN3h6ZieN1zp/kCqCRCXhiFJfCNBV8O
         fDikuhrehCnykBlEc8FGFiYTR+FxbsAdCXIEPhsZoE93/D5wPEDIoXUjWzJ0xtfMcPVb
         ELk1gsmuNNcPdSmrjeRshWHjYb08+guL1idyCJkIwxsCZa6ZbiwUahnjn4fy5A8DM9ok
         hbOw==
X-Gm-Message-State: AOAM531ZEeO2e85E2ORcr2tgKjHofQ5Tzj7c1pc0kgDcfBe1YAFeX89B
        cDeE4l17aqvPUfLXUPk+df7AtQ==
X-Google-Smtp-Source: ABdhPJzq9oXUYmfpz8xx+a53tbxGMQ1nMtLBD0o+ZXsqeYG/zEfgj+Y8o9+eWKQBLd/owiUEJQlQUg==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr3500096wmq.14.1627656238307;
        Fri, 30 Jul 2021 07:43:58 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id o29sm1825029wms.13.2021.07.30.07.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:43:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 0/3] libgpiod v2: new API improvements
Date:   Fri, 30 Jul 2021 16:43:53 +0200
Message-Id: <20210730144356.23079-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches add new features and improvements to the core C library API.

Bartosz Golaszewski (3):
  chip: provide gpiod_chip_get_path()
  line-info: provide gpiod_line_info_get_event_clock()
  treewide: unify the line settings defines

 include/gpiod.h      | 118 +++++++++++++++++--------------------------
 lib/chip.c           |  15 +++++-
 lib/line-config.c    |  38 +++++++-------
 lib/line-info.c      |  11 ++++
 tools/gpioget.c      |   4 +-
 tools/gpiomon.c      |   6 +--
 tools/gpioset.c      |   7 ++-
 tools/tools-common.c |   6 +--
 8 files changed, 101 insertions(+), 104 deletions(-)

-- 
2.30.1

