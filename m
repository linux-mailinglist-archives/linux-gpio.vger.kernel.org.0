Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5575AC169
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 23:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiICVKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Sep 2022 17:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiICVKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Sep 2022 17:10:04 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFB43E775
        for <linux-gpio@vger.kernel.org>; Sat,  3 Sep 2022 14:10:01 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t7so1483223wrm.10
        for <linux-gpio@vger.kernel.org>; Sat, 03 Sep 2022 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hUIxq73xHC/NSP+mtX2SJrGVr9RNYXnpazSPUw7uS04=;
        b=HrfsBNpzcWnf0eUgqZMdG12DHWiSKM+S0oyJTgea2q0BSKeos2rlyJsTIPFqLxKTJn
         wqeFIicVastzH6wc/PFCkdWZCFB4OVIL+CHNst39dF7PxZ1l/MSvrdTK1GYaA+HLCdKA
         V1G2HDenA615+3TZzZGyM3ql0IPR7OD+MytNH8M0/aTE3O+yuDMkmOc8wo4VnAnasVxd
         6StlbYsAsqdInL1Ogotcglp5wMyvWr7NkDiSyPiOwWGB1xsSjTpceVvjoNyIez1GBJV6
         35WwaVh1zgTxTjjjzHpcuS7T/TrwOR6g6/3ITtT1RAVutEjpeTQ/w8xqGk449sdNZzeG
         MdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hUIxq73xHC/NSP+mtX2SJrGVr9RNYXnpazSPUw7uS04=;
        b=yOmlhVI07Xx/QZ5GlaRoSc1rDCJF/6WVp+DRqHLOCPAsuZVTCO8UAV0KWSa2fmNASK
         IcU175xbONKHq8FlfZqD4S5ETuSIrSKRPk8WR4JE2+/TBTrPO3Th6jovp/d5Nb+EeMEf
         QKPFGwcYEDBoXWZmorvmSndap6KmY4bPQqhto6QSEqCm90AWSGPka9AH2Opl2GiCu6ME
         8Nwt8KW60eVDXFan300CsaAUkgThvPBnFFY0rzAlWsGbjt74m5DpfbO5XxjS3AG+V1sJ
         qXJuSCzp9qMl6mAx3EcqnOcBMzC+Wu831JUuMbwcd26KTrtWVWwO81sQe6e8VPVwtwzu
         eLjA==
X-Gm-Message-State: ACgBeo2U4Ebmip1A/1MkUvQw28P1OLuzIbByat0uYMpkjSP7ZHwd/FFu
        9B+t14n6t9W3/rQppUbx1v3+QQ==
X-Google-Smtp-Source: AA6agR7hdw5g6zg1fdg/fKAgZxyUaBkqrHb7pAuipZkiMB6l9ISuoDLR+dFk8Q6ng+pfdDLx9QUw6w==
X-Received: by 2002:a5d:54c2:0:b0:225:8841:551c with SMTP id x2-20020a5d54c2000000b002258841551cmr21193099wrv.134.1662239400433;
        Sat, 03 Sep 2022 14:10:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:216e:c311:337a:8942])
        by smtp.gmail.com with ESMTPSA id y2-20020adfd082000000b0021d6924b777sm4574762wrh.115.2022.09.03.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 14:09:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v6.0-rc4
Date:   Sat,  3 Sep 2022 23:09:56 +0200
Message-Id: <20220903210956.6008-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here's a set of fixes from the GPIO subsystem for the next RC. Most are small
driver fixes except the realtek-otto driver patch which is pretty big but
addresses a significant flaw that can cause the CPU to stay infinitely busy
on uncleared ISR on some platforms.

Please pull!
Bartosz Golaszewski

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.0-rc4

for you to fetch changes up to 6890381720b27a41f2d9e68cce241336342ea3b7:

  gpio: ws16c48: Make irq_chip immutable (2022-09-03 22:56:34 +0200)

----------------------------------------------------------------
gpio fixes for v6.0-rc4

- MAINTAINERS update
- fix resource leaks in gpio-mockup and gpio-pxa
- add missing locking in gpio-pca953x
- use 32-bit I/O in gpio-realtek-otto
- make irq_chip structures immutable in four more drivers

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: pxa: use devres for the clock struct

Haibo Chen (1):
      gpio: pca953x: Add mutex_lock for regcache sync in PM

Lukas Bulwahn (1):
      MAINTAINERS: rectify entry for XILINX GPIO DRIVER

Sander Vanheule (1):
      gpio: realtek-otto: switch to 32-bit I/O

Wei Yongjun (1):
      gpio: mockup: remove gpio debugfs when remove device

William Breathitt Gray (4):
      gpio: 104-dio-48e: Make irq_chip immutable
      gpio: 104-idi-48: Make irq_chip immutable
      gpio: 104-idio-16: Make irq_chip immutable
      gpio: ws16c48: Make irq_chip immutable

 MAINTAINERS                      |   2 +-
 drivers/gpio/gpio-104-dio-48e.c  |  10 ++-
 drivers/gpio/gpio-104-idi-48.c   |  10 ++-
 drivers/gpio/gpio-104-idio-16.c  |  18 +++--
 drivers/gpio/gpio-mockup.c       |   9 ++-
 drivers/gpio/gpio-pca953x.c      |   8 +-
 drivers/gpio/gpio-pxa.c          |  11 +--
 drivers/gpio/gpio-realtek-otto.c | 166 ++++++++++++++++++++-------------------
 drivers/gpio/gpio-ws16c48.c      |  10 ++-
 9 files changed, 135 insertions(+), 109 deletions(-)
