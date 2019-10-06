Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91533CCEBE
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfJFFjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:39:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41341 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfJFFjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:39 -0400
Received: by mail-pl1-f196.google.com with SMTP id t10so5169010plr.8
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcPb8R4mzeyCFbyB8HVo6zxzR/OzyD4BCF8RxB8PTUc=;
        b=recCisAmlG4FwXEq2FKmxxK6z2K26czEItMlGJF6hmLLePSFQ7RhgBmQgEWrkqZWv6
         qqb9L4JNSBAboWNaFd4KCr67stX8SztnXJYQnVSh0sN8xg22DlklEnu7gvHCwjtKNbrw
         MatFpo5c94b7nTUEof/QrsVWo7LZlJTwVRCpwr0YMlScHRqC5G5R8QWuMdS8eImIEsFu
         lh0ez8MBBa1aoSRCSgUubk9BAm+cSFS3IfWgNFDK4qGF6Zz5e/a1xC6Vb3gSCJm0Qh1L
         JAZ0/hqjuUIzWRvPo6IR2GuBGe2TLmkqjMeoBq2g0oySBiZDgqGyHXXPhRqcuJC/+DgY
         z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcPb8R4mzeyCFbyB8HVo6zxzR/OzyD4BCF8RxB8PTUc=;
        b=UKhrBVzqCn5+Pf1fr4bmakrzYWv0BUyI1rY4FfRc83euUfJeT9H+7at+UMWK50HTDM
         UXN3r6QiczAirWvRFIegU9mZqZ16z3Ah2AaD4t6JRzn2okbe8umCR68xwNKgBBiynlPv
         WdBs3GfT8fHHdf1tj++Nf0GqjpRQaeim1C8qaVjydZPMrDvCESiUxxLZaLkEtFt1TcPI
         zshQv8xHZfCSzNOkmLg3198ZScuHBSU9LCg0va+PDZdnv59kUrrgkgHOW1IzRIP3VZ7d
         Da4pIrygqK9vVtgSdPM/onNXGpwldOpG0XghmS78Eo99R5eAmrPIDpDYPioS2lCPAqRL
         oJkQ==
X-Gm-Message-State: APjAAAU2je28sQBl+04aJlIEnvcS56i4ON1UCBb5FA6ADJtO7GisSs3K
        fJ80NNl3kb23DWRQ7EslGCQyHg==
X-Google-Smtp-Source: APXvYqy7umsg5ui3ORnKG8T4EjGafZSBNixuawXl7dkAySehS0BK77yPRopjjVm//TC4TwH0oloQBA==
X-Received: by 2002:a17:902:7b82:: with SMTP id w2mr22918229pll.118.1570340376785;
        Sat, 05 Oct 2019 22:39:36 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
Date:   Sun,  6 Oct 2019 07:39:08 +0200
Message-Id: <20191006053916.8849-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The new devm_platform_ioremap_resource() helper has now been widely
adopted and used in many drivers. Users of the write-combined ioremap()
variants could benefit from the same code shrinkage. This series provides
a write-combined version of devm_platform_ioremap_resource() and uses it in a
relevant driver with the assumption that - just like was the case
previously - a coccinelle script will be developed to ease the transition
for others.

There are also users of platform_get_resource_byname() who call
devm_ioremap_resource() next, so provide another variant that they can use
together with two examples.

v1 -> v2:
- dropped everything related to nocache ioremap as this is going away

v2 -> v3:
- don't call platform_get_resource() as an argument of devm_ioremap_resource(),
  it actually decreases readability
- add devm_platform_ioremap_resource_byname() as another variant

Bartosz Golaszewski (8):
  Documentation: devres: add missing entry for
    devm_platform_ioremap_resource()
  lib: devres: prepare devm_ioremap_resource() for more variants
  lib: devres: provide devm_ioremap_resource_wc()
  drivers: platform: provide devm_platform_ioremap_resource_wc()
  misc: sram: use devm_platform_ioremap_resource_wc()
  drivers: provide devm_platform_ioremap_resource_byname()
  gpio: mvebu: use devm_platform_ioremap_resource_byname()
  gpio: tegra186: use devm_platform_ioremap_resource_byname()

 .../driver-api/driver-model/devres.rst        |  4 ++
 drivers/base/platform.c                       | 39 +++++++++++-
 drivers/gpio/gpio-mvebu.c                     | 19 +++---
 drivers/gpio/gpio-tegra186.c                  |  4 +-
 drivers/misc/sram.c                           | 28 +++------
 include/linux/device.h                        |  2 +
 include/linux/platform_device.h               |  6 ++
 lib/devres.c                                  | 62 +++++++++++++------
 8 files changed, 108 insertions(+), 56 deletions(-)

-- 
2.23.0

