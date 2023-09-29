Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAD897B3297
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2Mby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjI2Mbx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:31:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DD91AE
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:31:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c02e232c48so232241861fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695990708; x=1696595508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cakR+T0CtDHM2CcBQ8FRiuXJVwcIXPiPweVMCCUBlY=;
        b=F9/5SgkuseLzsyl1LCDjmIPspdoX5PVSebAYbc5SFAl5a+laMkIjQX9KZBDXt3A+sl
         ur7GeKYRWoqwnDPLyz9mr0M9AWK8ntvE9KFmMyqhf4enZo8vnJcsl5U1KTeEztXDMM5B
         ah0j3ZgCyCTk9Lhh6MnBlFZpBmH+DtQzSCyknPEka4gZ36DmaXBwI6FcwPHuwZ48+QNY
         jsTLSdCoiex4T9QyI5dRLGXwtwxlJ0ZgrYZVYp5buUaQcfJ0yw0NlyuhmqoVYTSVkc9A
         +Ql4iMUEr7kOI2isBsN/w1BhJavv8usRTyHDJusqqUI2V7vB9/aUY+mc1w1B2yHzbUgx
         P91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990708; x=1696595508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cakR+T0CtDHM2CcBQ8FRiuXJVwcIXPiPweVMCCUBlY=;
        b=mTrwvj/jzqxfBNWGBkvKsE8I020TJSPB71xZ1I6uSFrDVAFofbHwyfDZQV59pgTxxF
         fGw7pw0kmO9oEWb3j8zupdk7fm12zM3Xh+A+j1LWKXDwnKmi5b68M8/d9ohyqJob/J5O
         jS9c0qc62Yw8Py7LRChxjct5+E+DeB4IQAYz4PC6Kh+0zvNzjcxfsXIBSj5GGHS00Wt0
         /dQb1BBzFVM8It2XEmR3lWCaoa9Kb6uLRGIiwrQvwCmeHkpSwJQTTv0uCYXLhzBvfLq7
         aeTf1Kj3+MhCiSKq9yStDaNVZDUypLWyFq9TjSKvWoAS5Yu42PRqbyFSEiqej6vsyJKW
         +RXw==
X-Gm-Message-State: AOJu0YyiWmWslLQqL0ZRAzdZ4pIOUxPdgPx6kuhl0Y7R8u2BMW6nLS7w
        T7o+1mDieMn61jF2XCKUiuL4nGdLse+Pc+rYaso=
X-Google-Smtp-Source: AGHT+IGYozBPLaVVGV33pkxMveenWJHnuQ25Q9SshKY3WsROcIPox12GhZvT6tGSQdtknuzysErIUw==
X-Received: by 2002:a05:600c:3785:b0:405:3803:558a with SMTP id o5-20020a05600c378500b004053803558amr3731380wmr.12.1695990687598;
        Fri, 29 Sep 2023 05:31:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:325c:7f1d:7e44:c5b1])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c3b9000b003fe29f6b61bsm1356244wms.46.2023.09.29.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 05:31:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.6-rc4
Date:   Fri, 29 Sep 2023 14:31:24 +0200
Message-Id: <20230929123124.19060-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of driver fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.6-rc4

for you to fetch changes up to 26d9e5640d2130ee16df7b1fb6a908f460ab004c:

  gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip (2023-09-27 09:12:09 +0200)

----------------------------------------------------------------
gpio fixes for v6.6-rc4

- fix a potential spinlock deadlock in gpio-timberdale
- mark the gpio-pmic-eic-sprd driver as one that can sleep

----------------------------------------------------------------
Chengfeng Ye (1):
      gpio: timberdale: Fix potential deadlock on &tgpio->lock

Wenhua Lin (1):
      gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip

 drivers/gpio/gpio-pmic-eic-sprd.c | 1 +
 drivers/gpio/gpio-timberdale.c    | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)
