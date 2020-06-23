Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E702420482E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgFWEBl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgFWEBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:01:41 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F68C061573;
        Mon, 22 Jun 2020 21:01:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jz3so913585pjb.0;
        Mon, 22 Jun 2020 21:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFjLj0bl+VYraVK7EH0Sx184sAdJumgqD7SqEv9MyDk=;
        b=HRuYspq+da/B8UubH7Cws7wDBRl2MEP6PZuGwQTIsNdlOOcUcAWAsM7/t/7SMhAT9C
         mx8sSjA6g/gjz8U9GVegCstdHup3IpFB/TTRCpI4j+bxiKBeBR+GKXPHpQDhV+jTL4a5
         ux1gtx7kopRZUr2tQeWOvT2vlJQ20DVc2VvtuEgY/VBNMcPLJ0t8RbviTR2Ob1o2AxMC
         ADUPgi5JqU1Pv9xzh2Zein5RmG8HCjAkZxho7l3Bw05KEAkq6RHOI9zd+3nrCUFWhZms
         IM7D0AADcfJLjGGoVBMU8Q+zGyekVcJHZcKpWWW9huRJjTOHViumWV2fBtibDIHjREml
         kBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFjLj0bl+VYraVK7EH0Sx184sAdJumgqD7SqEv9MyDk=;
        b=QvjuwcBelRFXG6Z5mqpXCNDX0MKkYehaOGvyqz7y2vxlV5TYgFxUoMRls9zwke0DkN
         PU7M0cE6ArF6VGeolGfiXwpRMPHCrAdBpYHARSeLOGrMVy1KKLuZ4rXQSvClbPjhQugu
         GBgPzSXCUrrhvqMHmwcEAKa6fv3bSG7pP15HAJQ8rYwtaKlwYWMdIhk3HThO4tfrduZR
         xZZdFWufb4vh0Z0AkD/BL7DorXm18mCjmHdctPHjcOq4f/F3BMJMqXgP31/ZHPVKS8ZN
         A4hJW6C8OwND2oPsCFzj5Wwa+A06DXjEsWfQz4NgN0M9Xr3Mae70HPJAtnF1U3kWAC9F
         gG+A==
X-Gm-Message-State: AOAM532C6E1K9FZVu0cDhgHtFlGYopwVDi86JypX09kT8sdIjX2tF6jF
        nf3ygorHhiukfXKHXoVSu2f5+J3fxQI=
X-Google-Smtp-Source: ABdhPJxYw9zfw9NE/mB37n8HQ6NpIdh6OU37oEaCSBRPCxg7oBXjWmEeejdESprCVexw4Iazmgnh7A==
X-Received: by 2002:a17:902:523:: with SMTP id 32mr22509872plf.212.1592884898603;
        Mon, 22 Jun 2020 21:01:38 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:01:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 00/22] gpio: cdev: add uAPI V2
Date:   Tue, 23 Jun 2020 12:00:45 +0800
Message-Id: <20200623040107.22270-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset defines and implements adds a new version of the
GPIO CDEV uAPI to address existing 32/64bit alignment issues, add
support for debounce and event sequence numbers, and provide some
future proofing by adding padding reserved for future use.

The series can be partitioned into three sets; the first twelve
are minor code tidy ups or fixes that I ran across while implementing V2,
the next seven contain the V2 uAPI implementation proper, and the final
three port the GPIO tools to the V2 uAPI.

The more complicated patches include their own commentary where appropriate.

Cheers,
Kent.

Kent Gibson (22):
  gpiolib: move gpiolib-sysfs function declarations into their own
    header
  gpiolib: cdev: sort includes
  gpiolib: cdev: minor indentation fixes
  gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
  gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent
    with other use
  gpiolib: cdev: rename numdescs to num_descs
  gpiolib: cdev: remove pointless decrement of i
  gpiolib: cdev: complete the irq/thread timestamp handshake
  gpiolib: cdev: rename priv to gcdev
  gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
  gpiolib: cdev: remove recalculation of offset
  gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
  gpio: uapi: define uAPI V2
  gpiolib: make cdev a build option
  gpiolib: add build option for CDEV V1 ABI
  gpiolib: cdev: add V2 uAPI implementation to parity with V1
  gpiolib: cdev: report edge detection in lineinfo
  gpiolib: cdev: support setting debounce
  gpio: uapi: document uAPI V1 as deprecated
  tools: gpio: switch tools to V2 uAPI
  tools: gpio: add debounce support to gpio-event-mon
  tools: gpio: support monitoring multiple lines

 drivers/gpio/Kconfig         |   28 +-
 drivers/gpio/Makefile        |    2 +-
 drivers/gpio/gpiolib-cdev.c  | 1610 ++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib-cdev.h  |   15 +
 drivers/gpio/gpiolib-sysfs.c |    1 +
 drivers/gpio/gpiolib-sysfs.h |   24 +
 drivers/gpio/gpiolib.c       |    3 +
 drivers/gpio/gpiolib.h       |   24 +-
 include/uapi/linux/gpio.h    |  280 +++++-
 tools/gpio/gpio-event-mon.c  |  133 +--
 tools/gpio/gpio-hammer.c     |   28 +-
 tools/gpio/gpio-utils.c      |  107 +--
 tools/gpio/gpio-utils.h      |   48 +-
 tools/gpio/gpio-watch.c      |   10 +-
 tools/gpio/lsgpio.c          |  112 ++-
 15 files changed, 1933 insertions(+), 492 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-sysfs.h


base-commit: 84651e81ee3323c7d544edfa6ac6026425fe5a52
-- 
2.27.0

