Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3A225DE79
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgIDPui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgIDPql (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:41 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03A6C06125F
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id q9so6497820wmj.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmK93ghUCK4Bfkn87SsfLV7Lx2ToEIVDjZGF81gdV3I=;
        b=imCUNYkyVYERELDx5z17ROl3W0tPoyG6+NCLtcyQUclp/DLiloNkPtJzWEXXyubLAC
         h+4HuoA1iGdskeY62BZFfE8AGzR5LltiwgSovvfligA3ru6g1Mmthw69qbjeE8RUaLbr
         +PYf8q+AFYdKipDE8+Zu2jWHu/amtYYNu75E5ZpsiGP5ZSbomoCQJvvem6mLfv2k5zcE
         q+85l1xCKNUc1gRTlgOnGV0Pxl+3e3dSGIWChjVkrpEFZEAkzoHawJpmtHzYjQn2NAo+
         w64MAdJTEpnavglHJzxNT5kWPO4SUSfdi1zyQVm17Ta9V26Z8XWz3AYA+5gYgPFhE50B
         RpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmK93ghUCK4Bfkn87SsfLV7Lx2ToEIVDjZGF81gdV3I=;
        b=EP2rMU41qpQsaztTmZhUL4/4jaPQ1cGmBEgXr2Rt2MbMyesjK/EaJmLz8V4KYZhOrx
         zV0QTAESqUgDBuNXclmyzUnKWTHUkfEfRfYe9be0iCN+4nTnCS3ysTcIAtcUSWZCNhEm
         7F53NlYEdT/FHKaZvsSV4/PShpLpThkmQfKLCMSNvL6X0tlDKST91oaq0znLPv3jLQms
         9EDB/9MDnEtz/vD0IVI+XJ9CJ5FOA8WLN1WT1gNO02jAKQgNiLdofJH19Vkk3jeMcTGC
         c2X/MwRbZfYTtNH2BBGkGwR14JjxtLay7iDQFJp1jXXs7VXzAK0zAir2ViEaUPAU+Kfa
         R5lg==
X-Gm-Message-State: AOAM531d4pMDNpjy/nrtoBvP9CmteeN7fgtpy5PvRlmvdkwDF2DrYtwX
        YeYBS1FOkxXV0PVUZTrh6G8Tfg==
X-Google-Smtp-Source: ABdhPJwT14PBgDJkOeHgwMzyq3LJMTMmetylVFwoCbarhMQNwhP0okhbv0nlb/abXQmSIiMpOSdJqA==
X-Received: by 2002:a1c:9a48:: with SMTP id c69mr7940657wme.43.1599234390539;
        Fri, 04 Sep 2020 08:46:30 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 00/23] gpio: mockup: support dynamically created and removed chips
Date:   Fri,  4 Sep 2020 17:45:24 +0200
Message-Id: <20200904154547.3836-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're about to merge w V2 user API for GPIO. In user-space we're using the
gpio-mockup driver for testing but it's quite cumbersome (needs unloading
and reloading to change chip configuration) and not very extensible (config
is passed over module params).

This series proposes to extend the debugfs interface to support dynamic
creation and removal of dummy chips, with extensible options.

First 3 patches add some lib functionality we'll use later on. Next 3 contain
general gpiolib refactoring and can be picked up independently.

Next we refactor gpio-mockup and finally add the delete_device and new_device
attributes. Last patch adds documentation for gpio-mockup so I'm not going into
detail on how the new interface works - the doc describes it pretty well.

Bartosz Golaszewski (23):
  lib: cmdline: export next_arg()
  lib: string_helpers: provide kfree_strarray()
  lib: uaccess: provide getline_from_user()
  gpiolib: generalize devprop_gpiochip_set_names() for device properties
  gpiolib: unexport devprop_gpiochip_set_names()
  gpiolib: switch to simpler IDA interface
  gpio: mockup: drop unneeded includes
  gpio: mockup: use pr_fmt()
  gpio: mockup: use KBUILD_MODNAME
  gpio: mockup: fix resource leak in error path
  gpio: mockup: remove the limit on number of dummy chips
  gpio: mockup: define a constant for chip label size
  gpio: mockup: pass the chip label as device property
  gpio: mockup: use the generic 'gpio-line-names' property
  gpio: mockup: use dynamic device IDs
  gpio: mockup: refactor the module init function
  gpio: mockup: rename and move around debugfs callbacks
  gpio: mockup: require debugfs to build
  gpio: mockup: add a symlink for the per-chip debugfs directory
  gpio: mockup: add a lock for dummy device list
  gpio: mockup: provide a way to delete dummy chips
  gpio: mockup: provide a way to create new dummy chips
  Documentation: gpio: add documentation for gpio-mockup

 .../admin-guide/gpio/gpio-mockup.rst          |  87 +++
 drivers/gpio/Kconfig                          |   1 +
 drivers/gpio/Makefile                         |   1 -
 drivers/gpio/gpio-mockup.c                    | 614 ++++++++++++++----
 drivers/gpio/gpiolib-acpi.c                   |   3 -
 drivers/gpio/gpiolib-devprop.c                |  63 --
 drivers/gpio/gpiolib-of.c                     |   5 -
 drivers/gpio/gpiolib.c                        |  62 +-
 include/linux/gpio/driver.h                   |   3 -
 include/linux/string_helpers.h                |   2 +
 include/linux/uaccess.h                       |   3 +
 lib/cmdline.c                                 |   1 +
 lib/string_helpers.c                          |  22 +
 lib/usercopy.c                                |  37 ++
 14 files changed, 705 insertions(+), 199 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst
 delete mode 100644 drivers/gpio/gpiolib-devprop.c

-- 
2.26.1

