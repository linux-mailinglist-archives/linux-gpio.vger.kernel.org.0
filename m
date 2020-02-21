Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F639168239
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgBUPsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:48:46 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53238 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgBUPsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:46 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so2276432wmc.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LeI4uUAherKB7oCfyMKmC8mC9Xr3shtEsETnkdo6NKY=;
        b=bc468FVjR0O2HzM4iW+Zet93uxru6fygwMokZnjsN4Z3+QauJeJgq3arXlVh56HWeZ
         A5uIl36pE23TiUBNM7b9+bDJ85xe4zJtG+NoFQvuOXFPFp6oigTsxBosuCYShHjrDvzg
         BcrOE7FV91S71wNKkhx6+2Rt2tD13s1SHZdHRfrdfNJALCTcoWsNhaK4BKGx95WoW65T
         v82GGJ2l5ITDblA9SU5pJylgyjR0f9nsQYgtBDXc+oAtYKtOxKXTn8Lwi+b3hIDzXrT0
         cS0CcEMHwqM3MJHCig0urM4lO3tc1/Oxa+RTBMuDvDS6of7qDUssIFruEBY2l4BzWH94
         azxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LeI4uUAherKB7oCfyMKmC8mC9Xr3shtEsETnkdo6NKY=;
        b=SqHzt5cshkW150mVFvFnBN8PECcKelim7nW3KUwZ2Lmeh8pLHJgT3d+4eiqYQmtIx0
         5PSju2lQ/xUsEfjPq1R0xVZUar/LKRqZ11EDCX8pQHCqLmkE3Det4nC6Ct7Q36Bu9luH
         p7G2P7YCOqCb1jtnnlUwhFTeLP751uTymP3JhUH9ITL7jrkaGlHQ1gULr5SGCoePEnP0
         fvYEvUVy5Q34TkfL/g4XuroT2HmsOSIVQdhc15msXlAX2dhMHnogyFoSadkm+xMLclSm
         jb0gI7Q6sEgntBJgATGHCr0+AjdlMOPxbd4TVqnoA16TxxFpIWdMhZRXw3xroq0DpIQD
         W3OA==
X-Gm-Message-State: APjAAAUT/ALqw0Dlovw+X2muXKGoxImPi3wv5YYcc6z5JZ2reId1cMSP
        vlrnP2SQVl44hafl8GrF1/5vKg==
X-Google-Smtp-Source: APXvYqxsLHrfDYzPsFWvn6is40yGLcNWGK+wdV+4cbAuhPNyi72AV/LyUrw6n6gSPS65K5YTI6GjRA==
X-Received: by 2002:a1c:a1c3:: with SMTP id k186mr4502020wme.179.1582300124029;
        Fri, 21 Feb 2020 07:48:44 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/5] nvmem/gpio: fix resource management
Date:   Fri, 21 Feb 2020 16:48:32 +0100
Message-Id: <20200221154837.18845-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Srinivas,

sorry for the lack of proper QA last time. This time the code is tested
on real HW (Beagle Bone Black with an ACME cape) including the error
path.

--

This series addresses a couple problems with memory management in nvmem
core.

First we fix a memory leak introduced in this release cycle. Next we extend
the GPIO framework to use reference counting for GPIO descriptors. We then
use it to fix the resource management problem with the write-protect pin.

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

v3 -> v4:
- fixed the return value in error path in nvmem_register()
- dropped patches already applied to the nvmem tree
- dropped the patch adding the comment about resource management

v4 -> v5:
- don't reference nvmem once it's freed
- add GPIO descriptor validation in gpiod_ref()

Bartosz Golaszewski (4):
  nvmem: fix memory leak in error path
  gpiolib: provide VALIDATE_DESC_PTR() macro
  gpiolib: use kref in gpio_desc
  nvmem: increase the reference count of a gpio passed over config

Khouloud Touil (1):
  nvmem: release the write-protect pin

 drivers/gpio/gpiolib.c        | 46 ++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 drivers/nvmem/core.c          | 11 ++++++---
 include/linux/gpio/consumer.h |  1 +
 4 files changed, 52 insertions(+), 7 deletions(-)

-- 
2.25.0

