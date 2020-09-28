Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B628727ABFE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 12:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgI1KmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 06:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgI1KmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 06:42:00 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95186C061755
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a9so641462wmm.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQMvlLYzShRCjCuL+yV81657EukM33lCWc0jTd+wtqA=;
        b=Q71rF1t2bmcMfRwytJBuynwNN15/ByLljGm4hKcReMfRR3aUAyDnZfL46xPJrM5reY
         261DLQFLCHGTe6lH7wxM4tXKkkSWtiPukBCugp85jIdF2XZwCTk0ebKmQ0EGgUhV7NIX
         NZcl1Yp9qKCFM+lQ1uoHwG4JXjNGpK47v7SmFKWlcGTAHOgnCdm5khI9IsIRygT8PWeM
         Ihqw7dQhY6PnKnxRUuVowQRqopazgpt+QVAqTI7EiCdXPngzR3EaFUfl6IaHlugtQluw
         SewPjypPYg/hpYLabx0j+uyAm1+cmc+8RNc20hkwql5hnN3TLagYaeZBnCPGPi3RI9EI
         XLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQMvlLYzShRCjCuL+yV81657EukM33lCWc0jTd+wtqA=;
        b=pbzhWOaeEakB2UlozdvwsqrhOh5jNPXv6wetZKwJXpVaTL5i1hyNXBbziScSrbEMKS
         d1Kg3Pf8UhWF+E5yZJ1cOhmKE8UH5f+FqHsIBkwWEXgxemk4aoF6ltfxZg6MYkBEcmmm
         96k2tWNeTks0K6UDpaEtv7BpimT++16nBIdxa9iNjbTL9DEh2nvOkwaXYmEN7oOEsyZw
         f0mkoqtPwyFr3WzmEfT+TG0INP9OhXBIdeuALjxHObw4F36QV2s5mTrIdhsFliHNtgpR
         PfhgK86Y0778tFcvZTPK9BC9Fw20iJp+xaKktvcMg6nA108NK426LbtrTTxoDvL+Qxvi
         XOpg==
X-Gm-Message-State: AOAM5314qWhLhZE+2nf0kA5whnfFrvmYkRvRmKariXJy6Ingpqilg4fV
        F12PAFt0WyjkTYzDADEl0FiRiiAvh4M+3g==
X-Google-Smtp-Source: ABdhPJwPGd//WWr9Jhlhc+3bFfRSgHhG5wSnpNrwbziZfU4fkhd4NnKXwaZD+EP8L+s2F9KTS1JYgQ==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr933441wmo.23.1601289719294;
        Mon, 28 Sep 2020 03:41:59 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:41:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/9] gpio: mockup: refactoring + documentation
Date:   Mon, 28 Sep 2020 12:41:46 +0200
Message-Id: <20200928104155.7385-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

These patches were part of the bigger overhaul of gpio-mockup but since
the initial idea was dropped in favor of using configfs + sysfs in the
future I thought I'd resent just the refactoring of the existing code
+ documentation patches. I think it's good to apply them since we don't
really know when the new interface will be ready (configfs needs a new
functionality - commitable items - to support mockup chip instantiation).

v1 -> v2:
- check for NULL pointer in kfree_strarray() to avoid having to always pass
  a zeroed string count when the array pointer is NULL
- collect review tags from Andy

Bartosz Golaszewski (9):
  lib: string_helpers: provide kfree_strarray()
  Documentation: gpio: add documentation for gpio-mockup
  gpio: mockup: drop unneeded includes
  gpio: mockup: use KBUILD_MODNAME
  gpio: mockup: use pr_fmt()
  gpio: mockup: remove unneeded return statement
  gpio: mockup: pass the chip label as device property
  gpio: mockup: use the generic 'gpio-line-names' property
  gpio: mockup: refactor the module init function

 .../admin-guide/gpio/gpio-mockup.rst          |  50 ++++++
 drivers/gpio/gpio-mockup.c                    | 154 +++++++++---------
 include/linux/string_helpers.h                |   2 +
 lib/string_helpers.c                          |  25 +++
 4 files changed, 155 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst

-- 
2.26.1

