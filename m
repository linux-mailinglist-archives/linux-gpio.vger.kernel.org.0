Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B673778355
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 00:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjHJWBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 18:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjHJWBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 18:01:00 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC272684
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:01:00 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-48719ca1b3dso549539e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691704859; x=1692309659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLpZ4esgcuub2YiUjxke1PbG+Oe6z0wLY0S3Dh2/w04=;
        b=bd+3O5YVs1oDX3QYRaV15SvzdL94Y4/wlelCJUO0rO4rO+eA2ZEo7vq3H8CMt0p6Jf
         /Xkae0F0NOFaXtjYHs7zSh/aqBbcktUquB6OIDLbSoLylY+d5i62w+epYvwcO31vYaPr
         S+Tau5DUGwJT7+j1wvXxOre9pNRN6UJ88VL6gwY6tCowHlYLk5Mjd8oBcvCJ9rY9AqKB
         NpeVEdzhg2+seefb34jPu1LP2F0w83NnLQ2gHU2DcPUWariQfYrJ5RfDEzSkxvVlL6TF
         0sKz2PbjKQP0STKJZezrJc8LOWftLZOULJU4SDlEjPE/5niacV4MT3xCTYJLBlDMuEYL
         CpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691704859; x=1692309659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLpZ4esgcuub2YiUjxke1PbG+Oe6z0wLY0S3Dh2/w04=;
        b=Ey72WfgPfa23ccHZTW1/byp4KMXES+WhrBl38f+q0zV2k27sT+QbG/tVjOzMXuqNIo
         808QF8vDn/vaqZnBP/Kj86KEXVM82hz0xeLt/h81stuWSYpCJNOXsUmWt+AKbsxBw5VQ
         doT0dZwpWBPPeNb/38UE7ZYcQ5THJIYYniZuTx+7tDgUv88a50V6oiQmr3TiOi9EG7wS
         +eNjdDWwxLvuIEeDwbUkdDukAiExArOkFucbTLGMfj/WJuAebpSz+sp1uBl7DGmwgLFQ
         hANWnClFS3qm7/MfnniYnmj2DJWNtm8jOzswX5102uDssa0vYtxm4xXlZqBvXJbe3DNC
         h11g==
X-Gm-Message-State: AOJu0YwzCjMWaJMkeLlPBmcbyU6uUuKvMpHXQFoW6VmWXX0ouQ9ibYmi
        M47hoNr70B6abvxKwuFsns9Afg==
X-Google-Smtp-Source: AGHT+IHLb3VIHdXI4HGJpYkUpAV+dGfvi1NoSUb2IxbyqLl4j/Ak41ulbnofO5/GYslg9rHaEPyW4Q==
X-Received: by 2002:a1f:c742:0:b0:486:484d:3058 with SMTP id x63-20020a1fc742000000b00486484d3058mr273690vkf.14.1691704859211;
        Thu, 10 Aug 2023 15:00:59 -0700 (PDT)
Received: from fedora.. (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id r17-20020a056122009100b004872b997d3bsm387105vka.1.2023.08.10.15.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 15:00:58 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [RESEND PATCH 0/7] Migrate ACCES and WinSystems drivers to the regmap API
Date:   Thu, 10 Aug 2023 18:00:37 -0400
Message-ID: <cover.1691703927.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.41.0
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

This patchset is a collection and resend of the lingering GPIO patches
for the regmap migration of the ACCES and WinSystems drivers.[^1][^2]
Previously, these patches were postponed due to pending dependency
patches that have since been merged into mainline. Now that those
dependencies are present in the GPIO tree, this patchset can be merged
without incident. An IRQ handling fix for the ws16c48 driver is also
included at the end.[^3]

[^1] https://lore.kernel.org/all/cover.1680618405.git.william.gray@linaro.org/
[^2] https://lore.kernel.org/all/cover.1680708357.git.william.gray@linaro.org/
[^3] https://lore.kernel.org/all/20230228081724.94786-1-william.gray@linaro.org/

William Breathitt Gray (7):
  gpio: idio-16: Migrate to the regmap API
  gpio: 104-idio-16: Migrate to the regmap API
  gpio: pci-idio-16: Migrate to the regmap API
  gpio: idio-16: Remove unused legacy interface
  gpio: pcie-idio-24: Migrate to the regmap API
  gpio: ws16c48: Migrate to the regmap API
  gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent

 drivers/gpio/Kconfig             |  13 +-
 drivers/gpio/gpio-104-idio-16.c  | 286 +++----------
 drivers/gpio/gpio-idio-16.c      | 254 ++++++------
 drivers/gpio/gpio-idio-16.h      |  79 +---
 drivers/gpio/gpio-pci-idio-16.c  | 294 +++-----------
 drivers/gpio/gpio-pcie-idio-24.c | 677 +++++++++++--------------------
 drivers/gpio/gpio-ws16c48.c      | 554 +++++++++----------------
 7 files changed, 728 insertions(+), 1429 deletions(-)


base-commit: 87d0688483f56c748b37a5298bdc382df5cf8f74
-- 
2.41.0

