Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF5E7D1EF6
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Oct 2023 20:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUSjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Oct 2023 14:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUSjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Oct 2023 14:39:36 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E18AF7
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 11:39:34 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so16089345e9.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Oct 2023 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697913572; x=1698518372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfGwds8BsJ5PS79wIoZ/UmBsuPKrEgJUS23OzoLXe80=;
        b=D9Up9mqAi5emQb9WfQ2bjyYKukvPNQf35kYkZQrlIF606oNTJsZlHYr9ucAoTLllY/
         7+ukNJKMTMNyZZsDZztoKjpjMjyVQVSHKLxhgrHe+nfTlj9NwBDDwe46osDHFVaynZHr
         3hcvaB10AcATLvOvVdfuTPppn6oOWw5V220dmYCmKVTLwpBAa1dbYiQLVmjAskegFUzs
         vhL3u7tCLfQUHQ2+pwiIMduiAZNvwwdJ3VxN09QNCsrD8Jqh7CURvXgi6jHDC8u6lPgQ
         h9YvO0Uf/gbkRsJ122TTYZLhWRPYfu58g1aDJHObLWV6XWUHwMKQ0SLYcb7YiA4GkjnG
         fXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697913572; x=1698518372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfGwds8BsJ5PS79wIoZ/UmBsuPKrEgJUS23OzoLXe80=;
        b=MW9ig5a1Smvb6msuS71KbcXe9jNQdIg+Hcw7124RG43oUq3Nxju0cSD+N7hZFf78CI
         dIb06mLz3WEp11703Lzmk7/6V1ZkpPWQIAV+GfZSn6wi+HMvIZb17ssz2E4el61hHbDq
         dEU6TY7u3RxBXvs7zUt+W4koprAV7T814UatyPCZzqaR68zdzZkLstV8lBM/QPh9qXLu
         MXCQHsO2PZOzEWZKBpIiKM1f8XAeiId+32vOH+5mttRqGf1EKVN2IDDas+9pXBGpNC86
         zePENUFDGX6wSxaE2/NxJKaek/Xmf7cr+FNQVfq7Jb3z7MtIFMblJGgFFe/9qGwdbv9+
         gXFg==
X-Gm-Message-State: AOJu0YxyOGc6O1oWjDaICJD1Amp9UrwsCA1muLszqO1xlIgmU59eS78/
        7ztWxtl3hXqTAsyMmV0tnZoPQQ==
X-Google-Smtp-Source: AGHT+IEjtdIzNkB/XQ5MDi3/Kzobl1YTvyUkztdro7kWjlQ437ArdxwEWadc99lGzJSV/IMw9IZ9Hw==
X-Received: by 2002:a05:600c:3582:b0:408:3804:2a20 with SMTP id p2-20020a05600c358200b0040838042a20mr3912263wmq.22.1697913571848;
        Sat, 21 Oct 2023 11:39:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9c03:2672:ef7a:46a5])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b00405d9a950a2sm9764601wml.28.2023.10.21.11.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 11:39:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.6-rc7
Date:   Sat, 21 Oct 2023 20:39:25 +0200
Message-Id: <20231021183925.22831-1-brgl@bgdev.pl>
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

Linus,

Please pull another round of fixes from the GPIO subsystem for the next
RC. There are two fixes for one of the drivers and a one-liner for ACPI
handling. Details are in the signed tag.

Bartosz

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.6-rc7

for you to fetch changes up to 479ac419206b5fe4ce4e40de61ac3210a36711aa:

  gpiolib: acpi: Add missing memset(0) to acpi_get_gpiod_from_data() (2023-10-20 11:24:16 +0200)

----------------------------------------------------------------
gpio fixes for v6.6-rc7

- fix interrupt handling in suspend and wakeup in gpio-vf610
- fix a bug on setting direction to output in gpio-vf610
- add a missing memset() in gpio ACPI code

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: acpi: Add missing memset(0) to acpi_get_gpiod_from_data()

Haibo Chen (2):
      gpio: vf610: mask the gpio irq in system suspend and support wakeup
      gpio: vf610: set value before the direction to avoid a glitch

 drivers/gpio/gpio-vf610.c   | 15 ++++++++-------
 drivers/gpio/gpiolib-acpi.c |  1 +
 2 files changed, 9 insertions(+), 7 deletions(-)
