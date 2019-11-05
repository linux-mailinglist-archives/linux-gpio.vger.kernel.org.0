Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA08EF335
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfKECEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:04:51 -0500
Received: from mail-pl1-f178.google.com ([209.85.214.178]:38780 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfKECEv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:04:51 -0500
Received: by mail-pl1-f178.google.com with SMTP id w8so8587041plq.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MjheHLXXHFuxfF3ZTLVn3BPsOFdynnERBGUpMtJfiQ=;
        b=vIYRTFntu2POiXcubw2Z3VW9IMu1JI4AELgqkTnx2KquN1xOlSY8HnDSvSYiqEwWSM
         +Vriv5CdWMoAYSBXdTy5XSAk9NDzPAHu9VsCzKhx0lOsE4XSR7bpVxyesSDA5vn2Wzy2
         w4ZSiguUsltlpGhI+JygNdX56KhtXBSQa4YruvvSU/UA15GUwg2qNAGt72feIPDEXwy1
         DrfgmR5Quep219oS11ydsTaBrzKuF/QkzuEEzBfBSBHavuLIifQyWCNnG02UKOTAsU6U
         MDCJMqN9F6q6sAr9z5f0wXu3N8zGbMfJJ3vCUjETGoI/+yBMQ99sDymBl7Bhajec5oeR
         A8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MjheHLXXHFuxfF3ZTLVn3BPsOFdynnERBGUpMtJfiQ=;
        b=ke4Wd93RywbFr9hZNydJBeNwM8hrbzqNpy86F73p7teetpIZ49S81XbY9yWrgfPXIu
         RLKdfg/1e9a4qDSA8FDR4Q3nPWrJA5ugdv0tPR1W5Ir5ImUAq916F0CQlATyXXhBg/0L
         +vplBM55G6HIdt7T1gY0SHE/rm+Lgco6D1FVvYzXdF26y2yEST3lZ+o3NIXRwUswqmAd
         9NZLi5QGoiAZlmScmUl7uFm6BRU73zWgDgs30W34TMimuazKeKLkv9vKIzQlaqlKBndl
         1JnkLpc9N+ENwsHY/Yv5Jxy6gkPsSmOqTyNUIN+CO+L0y5gNbfu2m5lH0FqTtoHki4FQ
         0f7A==
X-Gm-Message-State: APjAAAUNUba03tW6ClMP5erkODnwiY+bZRAzICfT7ilWytB5V4RS+9Lx
        QdDSEio8PxisodOYfq6StdFHFIK+zhCNbw==
X-Google-Smtp-Source: APXvYqyZm++ScRUuuhJpqSTnOeyyiwgE0eDhb+zRmGDu9X4jQ78GAUmgej2T/BMHpOCa1tGLTKzdlg==
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr20367340pln.6.1572919490558;
        Mon, 04 Nov 2019 18:04:50 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id r184sm11641909pfc.106.2019.11.04.18.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 18:04:49 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, thomas.petazzoni@bootlin.com,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Date:   Tue,  5 Nov 2019 10:04:22 +0800
Message-Id: <20191105020429.18942-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The changes from v5: 
  - rebased onto Bart's gpio/for-kent branch.

The changes from v4:
Review changes:
 - relocate restriction on applying bias to as-is from patch 2 to patch 1.
 - propagate errors, other than ENOTSUPP, from gpio_set_bias. (squashed 
   into patches 3 and 4).
 - include SET_CONFIG patch series v2 (patch 6 and 7 here).

I've also fixed a few other nits I noticed along the way:
 - rework gpio_set_bias as flags are mutually exclusive.
 - remove input flag required to set bias restriction from 
   lineevent_create as events are implicitly assumed inputs anyway.
 - reorder patches to group gpiolib bias patches together before the 
   gpio-mockup changes.


This series adds gross control of pull-up/pull-down to the GPIO uAPI.
Gross control means enabling and disabling of bias functionality,
not finer grained control such as setting biasing impedances.

The support allows both input and output lines to have any one of the
following biases applied as part of the line handle or event request:
 0. As Is - bias is left alone.  This is the default for ABI compatibility.
 1. Bias Disable - bias is explicitly disabled.
 2. Pull Down - pull-down bias is enabled.
 3. Pull Up - pull-up bias is enabled.

The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
and BIAS_PULL_UP.  These map directly to the similarly named 
pinctrl pin_config_param flags.
As Is corresponds to none of the flags being set.

The setting of biases on output lines may seem odd, but is to allow for
utilisation of internal pull-up/pull-down on open drain and open source
outputs, where supported in hardware.

The series also adds the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
The ioctl allows some of the configuration of a requested handle to be
changed without having to release the line.
The primary use case is the changing of direction for bi-directional 
lines.

Patches are against Bart's gpio/for-kent branch[1].

The patch has been successfully tested against gpio-mockup, and 
on a Raspberry Pi, in both cases using the feature/pud_set_config 
branch of my Go gpiod library[2], as well as with my feature/pud 
development branch of libgpiod[3].  Patch 7 has only been tested using 
my gpiod library as libgpiod has not yet been updated to support the 
SET_CONFIG ioctl.

Patch 1 adds pull-up/pull-down support to line handle requests.
Patch 2 adds pull-up/pull-down support to line event requests.
Patch 3 adds support for disabling bias.
Patch 4 adds support for setting bias on output lines.
Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
Patch 6 refactors the flag validation from linehandle_create.
Patch 7 adds the SET_CONFIG ioctl.

Drew Fustini (1):
  gpio: expose pull-up/pull-down line flags to userspace

Kent Gibson (6):
  gpiolib: add support for pull up/down to lineevent_create
  gpiolib: add support for disabling line bias
  gpiolib: add support for biasing output lines
  gpio: mockup: add set_config to support pull up/down
  gpiolib: move validation of line handle flags into helper function
  gpio: add new SET_CONFIG ioctl() to gpio chardev

 drivers/gpio/gpio-mockup.c |  94 ++++++++++------
 drivers/gpio/gpiolib.c     | 213 +++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib.h     |   1 +
 include/uapi/linux/gpio.h  |  24 +++++
 4 files changed, 264 insertions(+), 68 deletions(-)

-- 
2.23.0

