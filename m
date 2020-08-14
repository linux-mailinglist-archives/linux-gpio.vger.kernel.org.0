Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED4C2443AC
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgHNDDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbgHNDDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:03:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7EEC061757;
        Thu, 13 Aug 2020 20:03:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u20so3869391pfn.0;
        Thu, 13 Aug 2020 20:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1Bj9dSIh39mR+cb3mNLwfHnOjyrZiRgjj6ooulNuZA=;
        b=UtoQ1vpc39WSDbgSqNH3PSccUc40sshdxWH7cpeNgQHguSPoCQSFE0STjpmNipaEHv
         ucQRc+bnkimZgebOQWrZDCBwSuW7KjwopD68NLJRc+zhHQ9gXejxof4D6hdPJPFHqYbT
         plkY3MVuPp2kJFHmVN2S10cx9AlpP7gorn27UnhPKab5POgqZ5PTwU2es2BJMc14Pyy3
         hJtZRfGxSm3Db8PBAcKvnD45LIsgFBp1HpCtu0Mb8SSuPeNhqRE34XL/YnU7On1mR4OW
         1bvsae+9bh/t/ubD56k+0qanYpJI54WYzQ6Oz/qcIygW1YLsk0FOTNM4bJmdL4nWXLnH
         XiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1Bj9dSIh39mR+cb3mNLwfHnOjyrZiRgjj6ooulNuZA=;
        b=TnZZFH+GdVXz376kv/kF2oBHPQP4Wq8qGbsbSvKjptGNEDgc/MjNHC57xBUJGt3wbu
         8WHrUxVikxELKMTwaB+HSvuVAkz9nrep2kL4yfy2uGatSsqyxIb1lFl9Y6q//oZaVN+0
         pEc3uRZw2gHOTvUSNmUdSd9lvkmbSD9zK4i8fA8TaYiWP1oQZoWxMdv8bwwaIXoVkmGM
         7PiioomY/gpmc5mzPtChr2aImgyqC75DHKu0S/Xlwss3nqlSkYkHne8aH7sdF50XQ9n2
         odCjgOKr/pJMAcnejYQkJsBn6DjrHxCYNwK9fM+lvChf62WNMq+ALKXH2LpSzHCT3XsB
         7EpA==
X-Gm-Message-State: AOAM531RwtdMr1kMq0O5kufrWazM94ZgP4Elu6iGgw1vScbaZ4PsyyoP
        LtamAVcKIMNh3+nExl8Mt/tYDWvI
X-Google-Smtp-Source: ABdhPJxufaFMEkSWsGqJmDqi1u2GRZbCuEl7oDe4NclFDxtAeXTfNStWQ9qh0PmQ/aBtXBe+0McXWQ==
X-Received: by 2002:a63:4f52:: with SMTP id p18mr414035pgl.408.1597374194343;
        Thu, 13 Aug 2020 20:03:14 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:03:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 00/20] gpio: cdev: add uAPI v2
Date:   Fri, 14 Aug 2020 11:02:37 +0800
Message-Id: <20200814030257.135463-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset defines and implements adds a new version of the
GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
support for debounce, event sequence numbers, and allowing for requested
lines with different configurations.
It provides some future proofing by adding optional configuration fields
and padding reserved for future use.

The series can be partitioned into two sets; the first eleven
contain the v2 uAPI implementation, and the final seven port
the GPIO tools to the v2 uAPI and extend them to use new uAPI features.

The more complicated patches include their own commentary where
appropriate.

Cheers,
Kent.

Changes for v4:
 - bitmap width clarification in gpiod.h (patch 04)
 - fix info offset initialisation bug (patch 08 and inserting patch 01)
 - replace strncpy with strscpy to remove compiler warnings
   (patch 08 and inserting patch 02)
 - fix mask handling in line_get_values (patch 07)

Changes for v3:
 - disabling the character device from the build requires EXPERT
 - uAPI revisions (see patch 02)
 - replace padding_not_zeroed with calls to memchr_inv
 - don't use bitops on 64-bit flags as that doesn't work on BE-32
 - accept first attribute matching a line in gpio_v2_line_config.attrs
   rather than the last
 - rework lsgpio port to uAPI v2 as flags reverted to v1 like layout
   (since patch v2)
 - swapped patches 17 and 18 to apply debounce to multiple monitored
   lines

Changes for v2:
 - split out cleanup patches into a separate series.
 - split implementation patch into a patch for each ioctl or major feature.
 - split tool port patch into a patch per tool.
 - rework uAPI to allow requested lines with different configurations.


Kent Gibson (20):
  gpiolib: cdev: desc_to_lineinfo should set info offset
  gpiolib: cdev: replace strncpy with strscpy
  gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
  gpio: uapi: define uAPI v2
  gpiolib: make cdev a build option
  gpiolib: add build option for CDEV v1 ABI
  gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and
    GPIO_V2_LINE_GET_VALUES_IOCTL
  gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and
    GPIO_V2_GET_LINEINFO_WATCH_IOCTL
  gpiolib: cdev: support edge detection for uAPI v2
  gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
  gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
  gpiolib: cdev: support setting debounce
  gpio: uapi: document uAPI v1 as deprecated
  tools: gpio: port lsgpio to v2 uAPI
  tools: gpio: port gpio-watch to v2 uAPI
  tools: gpio: rename nlines to num_lines
  tools: gpio: port gpio-hammer to v2 uAPI
  tools: gpio: port gpio-event-mon to v2 uAPI
  tools: gpio: add multi-line monitoring to gpio-event-mon
  tools: gpio: add debounce support to gpio-event-mon

 drivers/gpio/Kconfig        |   29 +-
 drivers/gpio/Makefile       |    2 +-
 drivers/gpio/gpiolib-cdev.c | 1354 +++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib-cdev.h |   15 +
 drivers/gpio/gpiolib.c      |    2 +
 drivers/gpio/gpiolib.h      |    6 +
 include/uapi/linux/gpio.h   |  316 +++++++-
 tools/gpio/gpio-event-mon.c |  146 ++--
 tools/gpio/gpio-hammer.c    |   56 +-
 tools/gpio/gpio-utils.c     |  127 ++--
 tools/gpio/gpio-utils.h     |   50 +-
 tools/gpio/gpio-watch.c     |   16 +-
 tools/gpio/lsgpio.c         |   60 +-
 13 files changed, 1949 insertions(+), 230 deletions(-)


base-commit: 22cc422070d9a9a399f8a70b89f1b852945444cb
-- 
2.28.0

