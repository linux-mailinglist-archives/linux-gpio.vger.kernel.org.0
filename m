Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2ED16D6566
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 16:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbjDDOc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 10:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbjDDOc4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 10:32:56 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C851E75
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 07:32:55 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54184571389so617150857b3.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680618775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TeZQ266LbK5QH2jgnCEXAl0zq9NQeUvBQJ7yQxwh3E=;
        b=UbXeQpuUhpG7jUJNy8ONc+3FOc98eRLbYbSMzyfCaoohZiewRQOjpLfLeZ8sagEiRx
         rCeHtTkjtGo+LuyH1+aSgdQ/BIei5fWlDpwvVflkDjlu94ub8itXOzHFtSkJy9zEvqHZ
         mafj4TyZnrheCv3TAB7zfbhtgZf3Hrhckv2/aOjRWr/UUd1m1NzzOWB2OFG2l6HP2TPc
         /5h8YXNKgQcNxiZxPiS81rHQowkL0zSoRlNiOJwwqVhqchbhkG35fEZ0Jv6K8t/PTz/m
         9lDADd8rq5lQ+y8mG0vf0tcXzX9ZxrsfEqidEb0Hz+HiIC8HKN1NWGdPDB9PvKVAovBo
         p37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TeZQ266LbK5QH2jgnCEXAl0zq9NQeUvBQJ7yQxwh3E=;
        b=BKa7zCDglAvr/h1nxmd/wbmEUnt4OsHnTzzekpzeUJJ+Dk3+DQen5WRVKU7ZZhyHUh
         lTI7KvFyo31HVeftEB4ac5HhHxXAm+hlVqaGIYztc6EcMTRJ3NR4q0UA7OOzmFBe72ft
         G1ozbdLn/y2LNfFhf7bjwvry0zydBTeXo/KJwNfE/GsH6OrLcKnabi8sEE9MO5woNJae
         wlAcstzE+JoVU3/xguqPSjGLaK02s0naDDZsh19fJF3oBbqI5Ksx9UVyX9My2BLPx1qG
         pmDW5YX4eGZ4GNo5+o2uwelHC5xX2hC2a1Ubgdss/cMDPeRBnUeELdduzGHXGdFk3lXy
         DTZA==
X-Gm-Message-State: AAQBX9crOpJV5cnQyHYc+S5dE2SVFgzxRIlwdb/x4dmbrNOPOBAw0a4V
        j9YLOoBWFSYGwoRnThwEkQyMfujf2oMQHs+swqWpeg==
X-Google-Smtp-Source: AKy350bWh+5vjDW9hGWTBBv4oczteiAWOVzKArLgUlLA6mfRVA4cLr/5wyVrkNsz13Q+I8hAzxfSow==
X-Received: by 2002:a0d:df02:0:b0:541:6b00:f68d with SMTP id i2-20020a0ddf02000000b005416b00f68dmr2876678ywe.16.1680618774816;
        Tue, 04 Apr 2023 07:32:54 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id p76-20020a81984f000000b00545a0818489sm3234439ywg.25.2023.04.04.07.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:32:54 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v5 0/4] Migrate IDIO-16 GPIO drivers to regmap API
Date:   Tue,  4 Apr 2023 10:32:44 -0400
Message-Id: <cover.1680618405.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v5:
 - Remove regmap_config max_register lines as superfluous
 - Enable use_raw_spinlock to prevent deadlocks when running -rt kernels

The regmap API supports IO port accessors so we can take advantage of
regmap abstractions rather than handling access to the device registers
directly in the driver. The 104-idio-16 and pci-idio-16 modules depend
on the IDIO-16 library and are thus updated accordingly.

By leveraging the regmap API, the idio-16 library is reduced to simply a
devm_idio_16_regmap_register() function and a configuration structure
struct idio_16_regmap_config.

This patchset depends on the "Drop map from handle_mask_sync()
parameters" patchset [0].

[0] https://lore.kernel.org/all/cover.1679323449.git.william.gray@linaro.org/

William Breathitt Gray (4):
  gpio: idio-16: Migrate to the regmap API
  gpio: 104-idio-16: Migrate to the regmap API
  gpio: pci-idio-16: Migrate to the regmap API
  gpio: idio-16: Remove unused legacy interface

 drivers/gpio/Kconfig            |   7 +-
 drivers/gpio/gpio-104-idio-16.c | 286 +++++++------------------------
 drivers/gpio/gpio-idio-16.c     | 254 ++++++++++++++-------------
 drivers/gpio/gpio-idio-16.h     |  79 +++------
 drivers/gpio/gpio-pci-idio-16.c | 294 +++++++-------------------------
 5 files changed, 289 insertions(+), 631 deletions(-)


base-commit: 7b59bdbc3965ca8add53e084af394c13a2be22a8
prerequisite-patch-id: cd19046150b7cff1be4ac7152198777aa960a3df
prerequisite-patch-id: bd3e3830d9ce4f3876a77483364d7190b7fdffa7
-- 
2.39.2

