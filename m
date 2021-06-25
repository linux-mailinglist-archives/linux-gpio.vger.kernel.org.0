Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F163B434A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 14:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhFYMfx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 08:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhFYMfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 08:35:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00304C061766
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 05:33:24 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h11so10401670wrx.5
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q49iOsqrIpUBUkgsVkFNfQxjuRrZYZfy83eTo9eH/GA=;
        b=A6hWL8jLKRzThhYA1kxqVHiAf8Os+awuEcjGrxjpm9u2A9YG2ULePe0KsUHocFUsAg
         jr6Gesd0NJG6AaTjyITS4djjh84uaIZITB8tx0JQKdM4cT5IdeosomJe89d/O9e9/t0a
         joRhYvylONhowLWv6wCwQXVNymRg5n1EEvAkG3vW37VGiX57AtcO0l+tgX9bpZEX1lFW
         DHZYfqKdOY9ywkuoGCYfMOj1pfHCTxkyyWNO9wsPCTCb/ikcZL9+cieCIIWS+f1h6b+S
         xT1TPsZAP/N3ZDBYP3PAg8g0uG8J0JJ1FS/CQpkdwJWBg177mFn4XjiwX31zjeI4wlWu
         U41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q49iOsqrIpUBUkgsVkFNfQxjuRrZYZfy83eTo9eH/GA=;
        b=ZBcyJWBw3AlC5Y08198lIfT8RqbOduj7JfMtIScUKL7qF71GgLXbuwWZqHPizAskV5
         3dswk5uI/29fPi7EH51W7KL2xzeGVMVE+4E25W29+SB33KpDbLfl0M+CdmO2ozG06frd
         Gk1ZeIVg0afyYwHJp6wTzkJvEIWz97OlPHWX9/O8dmmqRhoxElE+qSToAI8fXHER267t
         S1Xr/8StLp75LqCGpyJM9nxlAl6pXSb7S/iEw7xEYzfLNMbPCVJlgVjkcbl7FKH5TNTO
         yDEqQWCH6lsbIee1nkCheK1kre0p6mwgKTAj4nB6G7EXME8fXHVa2+mvqJ4Vomlz/N47
         C1XQ==
X-Gm-Message-State: AOAM53085n7q8PaEYqdE5r5DxXBNhMR3GpoHrlfTgbKrIfrhCMie0pgM
        v/cohKC8WMFINCwZj8aRXBB0SQ==
X-Google-Smtp-Source: ABdhPJzNlGzXWZdhV3OKMQn9TOLkqGWfab72DykFnaoKAdswvA2htySYb8On20siho5VTFQTEXPIOg==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr10370532wrh.376.1624624403604;
        Fri, 25 Jun 2021 05:33:23 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-146-78.w2-15.abo.wanadoo.fr. [2.15.229.78])
        by smtp.gmail.com with ESMTPSA id h15sm5951120wrq.88.2021.06.25.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:33:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.13
Date:   Fri, 25 Jun 2021 14:33:20 +0200
Message-Id: <20210625123320.26510-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following late fixes for the GPIO subsystem.

Best regards,
Bartosz Golaszewski

The following changes since commit dbec64b11c65d74f31427e2b9d5746fbf17bf840:

  gpio: wcd934x: Fix shift-out-of-bounds error (2021-05-27 09:51:35 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13

for you to fetch changes up to c6414e1a2bd26b0071e2b9d6034621f705dfd4c0:

  gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP (2021-06-25 12:13:53 +0200)

----------------------------------------------------------------
gpio fixes for v5.13

- fix wake-up interrupt support on gpio-mxc
- zero the padding bytes in a structure passed to user-space in the GPIO
  character device
- select HAS_IOPORT_MAP in two drivers that need it to fix a Kbuild issue

----------------------------------------------------------------
Gabriel Knezek (1):
      gpiolib: cdev: zero padding during conversion to gpioline_info_changed

Johannes Berg (1):
      gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP

Loic Poulain (1):
      gpio: mxc: Fix disabled interrupt wake-up support

 drivers/gpio/Kconfig        | 2 ++
 drivers/gpio/gpio-mxc.c     | 2 +-
 drivers/gpio/gpiolib-cdev.c | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)
