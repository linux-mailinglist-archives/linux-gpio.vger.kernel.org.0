Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A87D217E02
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgGHESP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHESO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:18:14 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20B0C061755;
        Tue,  7 Jul 2020 21:18:14 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d10so17634562pls.5;
        Tue, 07 Jul 2020 21:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B33cksrAv/5XiOP1rjwC97If9HhuGSq0KwZOoyPCrvI=;
        b=fzwAaKzwf3aKVUtl51Q0/MoFw1bXj+hmW5lTf5nk2KBmtmwFizsPkK/e0D7NZZPFRd
         0z/n/wWScrqIVRlIafx1NxpC35Chz0IL7fneCwgPVNzXAnvxGnUysobtgOh2c/O1O0Sv
         2nbOuWQ6hTx8amDGUKT/dNCz+Uq1rbFFFEPMyJHWd19w2wmz8pfYyhclAHDt0jKHCAM+
         Hy1BwRAPLn70lLisSanIVrYCIUhETMmteG74J38+1PWE3cGUyaBTOY2hDPAyvGd8vE8y
         n7Xqe3lwo0QyoD0vaQGMZSt6GXPKuVV2/w+M2Wu7u5nOyGf+IZgKKa+iYpAb5o5I0DK1
         2BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B33cksrAv/5XiOP1rjwC97If9HhuGSq0KwZOoyPCrvI=;
        b=oxqOIOvN68SZpEqGMIKPSP0HoZ+61xD8qGExTZtH25YGCWG3OWogFVZSFkW3o0HhYl
         ktQdagzjyCMripEGMsLSmProd4QjgqeDOWBiW8MvOOM+9Q+YxtoW6/KLvgjVyd6sEFtr
         zhP2s9VvqzKfFFGQesIG1dfFT9drHbEVv3DEOIsDDlGSlKSuEvF3psAsa+2lsNDSOoGx
         90lYkr2s1espTUPl/PhVb/HsmbcxRYwPwWF9jqHrKgfAIxwaNzqZ8tbPfH8Dz9WrNnF8
         F8e0o0vabkRQyB+UWzhuJ83izMAs5ILWjB4TJPX7wS5rD3nzveUwLvy3kpxeiQKyeSQa
         jxhw==
X-Gm-Message-State: AOAM531OGo7fF+hrJAM7O/8bnFJPTHeyDtMTrr5dM6rqryOK4y7/3d+Y
        9ipBnn2W417J1/gSozxUPcN2qUeF
X-Google-Smtp-Source: ABdhPJwyJYUGo/Fm1+dPlY6WLMFrB+xIhx7KuREcPHNOeUe78d8KnwnW6IHYstUQairqp6tx9qI+Dg==
X-Received: by 2002:a17:902:6544:: with SMTP id d4mr5464452pln.138.1594181893858;
        Tue, 07 Jul 2020 21:18:13 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:18:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 00/17] gpiolib: cdev: pre-uAPI v2 cleanups
Date:   Wed,  8 Jul 2020 12:15:43 +0800
Message-Id: <20200708041600.768775-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This collection of patches provides improvements to or
address minor problems in gpiolib-cdev.

The majority of the patches (1-7, 9-11) have been pulled directly from
my "gpio: cdev: add uAPI V2" patch set, as they are not related to any
uAPI changes.
The remaining patches were either split out of the remaining patches
from that set, as they are not directly part of the uAPI changes, or
were inspired by fixes for issues in that set, or were only noticed
subsequent to that set.

Changes since "gpio: cdev: add uAPI V2":
 - rebase onto latest gpio/devel
 - fix typo in patch 1 commit description
 - replace patch 8 with the blocking notifier call chain patch
 - rename priv to cdev instead of gcdev in patch 9
 - fix error handling in patch 10
 - add patches 12 to 17

Kent Gibson (17):
  gpiolib: move gpiolib-sysfs function declarations into their own
    header
  gpiolib: cdev: sort includes
  gpiolib: cdev: minor indentation fixes
  gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
  gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent
    with other use
  gpiolib: cdev: rename numdescs to num_descs
  gpiolib: cdev: remove pointless decrement of i
  gpiolib: cdev: use blocking notifier call chain instead of atomic
  gpiolib: cdev: rename priv to cdev
  gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
  gpiolib: cdev: remove recalculation of offset
  gpiolib: cdev: refactor linehandle cleanup into linehandle_free
  gpiolib: cdev: refactor lineevent cleanup into lineevent_free
  gpio: uapi: fix misplaced comment line
  tools: gpio: fix spurious close warning in lsgpio
  tools: gpio: fix spurious close warning in gpio-utils
  tools: gpio: fix spurious close warning in gpio-event-mon

 drivers/gpio/gpiolib-cdev.c  | 385 ++++++++++++++++-------------------
 drivers/gpio/gpiolib-sysfs.c |   1 +
 drivers/gpio/gpiolib-sysfs.h |  24 +++
 drivers/gpio/gpiolib.c       |  15 +-
 drivers/gpio/gpiolib.h       |  20 +-
 include/uapi/linux/gpio.h    |   2 +-
 tools/gpio/gpio-event-mon.c  |   3 +-
 tools/gpio/gpio-utils.c      |   4 +-
 tools/gpio/lsgpio.c          |   3 +-
 9 files changed, 217 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-sysfs.h


base-commit: b239e4454e59bc85d466eb5630da46f6a876df77
-- 
2.27.0

