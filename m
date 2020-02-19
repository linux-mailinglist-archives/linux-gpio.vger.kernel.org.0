Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEC016402F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgBSJWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40562 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgBSJWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id t3so27285182wru.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xop7uA9KEA3CflxMp8alKEaw5KRSgikIaNdlPJzVrNQ=;
        b=r8Q679kTidmPGV9qqdOGKu2H4tC7DJE7MA/9HVWs5fL7uOkBJ+xkSxk/8Ma/zPCgfK
         bePJi2CuwGjHXVihV+QXhvJZ8qM2R3Xl7ZVoravdFbvcQFPym9nBJswEX9iLwoDUAvFm
         eFY+lZdsJx8xjNw9T64pSxPnDNBQYJqy50oCuWSQoAVoTI5F4xhlMEZtbV/JCEDDDrj0
         PmOQzp3/5EXfIwuciW+kl5Knk+mTqd8Yh0hNESUosFw28uG4C4CYLoPf52E05iCmP5Us
         OibMyXlGei2qaoXMiKAvMX9jX6I5tlsgZXHM2qINc+CrdeMWhAzLEeoJxeJxv4p7Ufak
         684w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xop7uA9KEA3CflxMp8alKEaw5KRSgikIaNdlPJzVrNQ=;
        b=cNswRbRT7+EomRoA8U0UxfEFmGcJlGvc4Zhjzu3gSs0dcAbkqg4pV3Z9cKQ6VDDXy0
         MpRl+l4HrH5xITL/AlKbvhOPQYtpjC/MnyBB/8omUe5DT05+1xD0zYrryCdlFhAgwDBB
         fnN7fwOde1Hkw5FJSWU/7ouU8DDmBdDnymAQhQY09AU+pm6wGXGnca1w+uzORcMAWoJE
         IuRizDCmwXlAsng4/87hrWtNKkJwJ0AaWGf+jGNH++AgvFQXjtq9tVxDBw0MREpdGuWd
         DAVJuRyfChIAm3Yc2Qtl9/YXiM6Gd0ArXgHwMq7k9kmbujCSg/xjZpDJNyvoRjLkloz+
         1HkQ==
X-Gm-Message-State: APjAAAUzNLJu+wxfdZddfe3e0Y/Mree8AOhvYFwlgvY4YnryeIhyEhrI
        W9louq+kne1w2KPkbTbiqQWv2Q==
X-Google-Smtp-Source: APXvYqzonMxTkxgCJH+ua9IjTjmhGpJl96JKt4UTWjr+kP29vfj9Vttfjvx5nFw+/0nfinMWLfdsBg==
X-Received: by 2002:adf:b193:: with SMTP id q19mr34330865wra.78.1582104141315;
        Wed, 19 Feb 2020 01:22:21 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:20 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/7] nvmem/gpio: fix resource management
Date:   Wed, 19 Feb 2020 10:22:11 +0100
Message-Id: <20200219092218.18143-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series addresses a couple problems with memory management in nvmem
core.

First we fix a memory leak introduced in this release cycle. Next we extend
the GPIO framework to use reference counting for GPIO descriptors. We then
use it to fix the resource management problem with the write-protect pin.

Finally we add some readability tweaks and a comment clearing up some
confusion about resource management.

While the memory leak with wp-gpios is now in mainline - I'm not sure how
to go about applying the kref patch. This is theoretically a new feature
but it's also the cleanest way of fixing the problem.

v1 -> v2:
- make gpiod_ref() helper return
- reorganize the series for easier merging
- fix another memory leak

v2 -> v3:
- drop incorrect patches
- add a patch adding a comment about resource management
- extend the GPIO kref patch: only increment the reference count if the
  descriptor is associated with a requested line

Bartosz Golaszewski (6):
  nvmem: fix memory leak in error path
  gpiolib: use kref in gpio_desc
  nvmem: increase the reference count of a gpio passed over config
  nvmem: remove a stray newline in nvmem_register()
  nvmem: add a newline for readability
  nvmem: add a comment about resource management

Khouloud Touil (1):
  nvmem: release the write-protect pin

 drivers/gpio/gpiolib.c        | 36 ++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 drivers/nvmem/core.c          | 17 +++++++++++++----
 include/linux/gpio/consumer.h |  1 +
 4 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.25.0

