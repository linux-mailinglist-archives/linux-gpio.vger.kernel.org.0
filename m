Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D40F35AE87
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhDJOwZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbhDJOwZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:25 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52843C06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id e34so2403395wmp.0
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FsoMS5N6hO5A7e/loUOsc2OxaXsf77CSJu6LyVlN7o=;
        b=XonbgZ54DJdwNyB868xlCpcLXuoWqNohUfOPFnWDYnSE3soR4K+pVmDJDWoOZ4hX2f
         QmT3r6+n7ix0RKw4s14UbyS9EDEprJXaHprhyirg4YGRLioc6D4A97C28mvONwnzf/g7
         9zTb7qQ9buBY/EnxNNVA+YjU9OqXragPZco+TAi8xutS89MIfkuIBpPnZxk9Q9mctraA
         Ca6HBiC1aq3Fnx2GTBxHAgv8SQ6AxmAGhKcBowGd4/ZChKsCD5E7pKAr+lUwYkblntau
         BsVay5ydGe+zKWE8lV19ibe5BDeZ+06m8GndeSXw8ya//t68NhdV6Y2wl1/Y1fV4Vm/m
         3tQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FsoMS5N6hO5A7e/loUOsc2OxaXsf77CSJu6LyVlN7o=;
        b=OV3fCEe6+O5Xlm53Owv72YAeHybYqfrGtXO6yX6PFREJPzxVfIVCU611eGOy7YQ9Kq
         TGa9a05OzvapiCTlEl1FCbFi9ofErGSDovPC1wQ17HWrnlvb0IOV2YuKL/baWKR3gTk0
         WJN2OfApwvCF6P4aRVM/Iz8rsmOQ0vWgw3/b24txjkesPr5XhU/7yyw8YlDA0DpOXkzE
         7UNpvUeFAP6N9sX8zzF1qh8FgvfZTOXYHO6xZL2RcuVzujx0wtCsE9cgHEugWrBLe6eY
         wOd8FlPbeSZ8ANFwgEoGosjarGteuHGX/HJb3qLwcdf+Ui7hnRoWHgls+q+tILiiHpRF
         t4Zw==
X-Gm-Message-State: AOAM530GZH2GlXqUyA+u1kL05JaPVqI08/fhmPtyO5QijXhDHNs87b6O
        knyMbilNAXLkzZDCSIwfmRArEQ==
X-Google-Smtp-Source: ABdhPJwpLaB1lqZjFKaEboSgxLauLlC7zbl/FD2yCS2nJE8fRqdKC8F0qAFoPwxsWVwm9C5v5w+NHw==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr17972147wmh.131.1618066329121;
        Sat, 10 Apr 2021 07:52:09 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 0/6] first draft of libgpiod v2.0 API
Date:   Sat, 10 Apr 2021 16:51:51 +0200
Message-Id: <20210410145157.30718-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces an entirely reworked API for the core C part of
libgpiod. It's not fully functional as the bindings are not modified,
and starting from patch 5, even the tests stop working. This is on
purpose as I'd like to reach an agreement on the interface before
spending time on reworking the tests.

My plan for the development of v2.0 is to keep the changes in a separate
branch until all bits & pieces are complete and then rearrange them into
a bisectable series that will be merged into the master branch.

A couple points regarding the design of the new API:
- all objects have become opaque and can only be accessed using dedicated
  functions
- line objects as well as bulk containers have been removed
- line requests are now configured using three types of structures: attributes,
  line config and request config structures, which follows the kernel API
- line request handles have now a lifetime separate from the parent chips to
  leverage the separation of chip and request file descriptors
- line events are now opaque but they can be stored in a dedicated container
  so that memory allocations are not necessary everytime an event is read from
  the kernel
- the library code has been split into several compilation units for easier
  maintenance

The new API is completely documented in include/gpiod.h doxygen comments.

Please let me know what you think. I am aware that these patches are huge and
difficult to review but I'm really only expecting a general API review - all
other implementation details can be improved later.

The branch from which this series was generated can be found on my github:
  https://github.com/brgl/libgpiod-private/tree/topic/core-lib-API-v2

Bartosz Golaszewski (6):
  treewide: rename chip property accessors
  core: add refcounting helpers
  core: implement line_info objects
  core: rework line events
  core: rework line requests
  core: implement line watch events

 bindings/cxx/chip.cpp         |    6 +-
 bindings/python/gpiodmodule.c |   14 +-
 include/gpiod.h               | 1224 +++++++++++++++++---------------
 lib/Makefile.am               |   15 +-
 lib/attr.c                    |  232 ++++++
 lib/chip.c                    |  234 +++++++
 lib/config.c                  |  158 +++++
 lib/core.c                    | 1240 ---------------------------------
 lib/event.c                   |  218 ++++++
 lib/handle.c                  |  126 ++++
 lib/helpers.c                 |  302 --------
 lib/info.c                    |  171 +++++
 lib/internal.c                |  147 ++++
 lib/internal.h                |   43 ++
 lib/mask.c                    |   43 ++
 lib/misc.c                    |   80 +++
 lib/request.c                 |  118 ++++
 lib/watch.c                   |   96 +++
 tests/gpiod-test.h            |    5 +
 tests/tests-chip.c            |   33 +-
 tests/tests-event.c           |  470 +++++++++----
 tests/tests-line.c            |  425 ++++++++---
 tools/gpio-tools-test.bats    |   12 +-
 tools/gpiodetect.c            |   17 +-
 tools/gpiofind.c              |    3 +-
 tools/gpioget.c               |   57 +-
 tools/gpioinfo.c              |   58 +-
 tools/gpiomon.c               |  130 ++--
 tools/gpioset.c               |   85 ++-
 tools/tools-common.c          |    8 +-
 tools/tools-common.h          |    2 +-
 31 files changed, 3255 insertions(+), 2517 deletions(-)
 create mode 100644 lib/attr.c
 create mode 100644 lib/chip.c
 create mode 100644 lib/config.c
 delete mode 100644 lib/core.c
 create mode 100644 lib/event.c
 create mode 100644 lib/handle.c
 delete mode 100644 lib/helpers.c
 create mode 100644 lib/info.c
 create mode 100644 lib/internal.c
 create mode 100644 lib/mask.c
 create mode 100644 lib/request.c
 create mode 100644 lib/watch.c

-- 
2.30.1

