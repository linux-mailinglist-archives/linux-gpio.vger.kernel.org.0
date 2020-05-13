Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AF71D17B8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388899AbgEMOg1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732972AbgEMOg0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:36:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BA4C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 07:36:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so21179189wrt.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2020 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ED/rV/e5loFvJYb5vErCztn0syUYserC98I6IETlsDc=;
        b=lmOX5cIrXVmRIE3aXQWY0Ac/BJ5/tS/IY+BPJBPLWHUSnrrLFnb+JCysGxqq2nWqaF
         h4KOFCgucqDDSt6Ec0WeFpXDbouOM0QMX9QTy4BVy4pe9KNG5D9J1NIXq2iyS5tM2rm/
         +ExxmG6qjfRTmma44NoX3e5vKdLuP4c9RO+CYrqt/6kdkFNWXz1e7O3tkclG4z81bba3
         DS4ujq/SlGNV7sCs3eSmuh3edTcxMxW5D6lOLqztHeaUq6r1sddkvVAJjy28dKGTkZEj
         bBUiMQhru0sws1x2jEvcn7P0qdzWcI/4YiSL3mwpUDS+qbR0ST/TuBSz/o/bqW7QK5wT
         Fkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ED/rV/e5loFvJYb5vErCztn0syUYserC98I6IETlsDc=;
        b=Gc708j/iusKFxOw6No6VIdLqmHLHuIhQ/IQEra/M+bt71xOEBrs/zwYPK/FKtS+WzP
         8Qti7A8c1/iUet6Z9TWq1LhE6/XVYegwHWLip5APf3NjLts0+G0tLaUvcToeZ0rTlEp8
         VJfYP9ARPATcEV18q0Bp7SUIauSL5YZpuNWfiv6lJR42nxpXRw9yJGfyEOQwpfAfZjEs
         GimDPeSD/0OuDkNY03Ieop0JxmW4NMECDcrkTG4zmfQkH36TvQ1OzJGdiVgqdtNjGl5P
         T+zsZy+EJAQLGuUkT38VYg1NghhSbjVdjjLLnH1hI7ps8S1A4f5fTGKG4ouP2v/Rtgkn
         MKdQ==
X-Gm-Message-State: AGi0PuYXfNSfgy5TUMYj8BEwzlJ5gk3oUYbQG9gSNosx3XNZTiNRiXiE
        DZ2EQQpXNohJeWY9slSKRGd1Rg==
X-Google-Smtp-Source: APiQypLWfnbeXHjqIcCUHNCKrowfdLXkgmajZDMAwN6M3geajVlWXZw+u+wMNjWHWyilwDaGYcpoyw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr15780242wrn.268.1589380583465;
        Wed, 13 May 2020 07:36:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z18sm16614041wmk.46.2020.05.13.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:36:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.7-rc6
Date:   Wed, 13 May 2020 16:36:19 +0200
Message-Id: <20200513143619.20565-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

please pull the following batch of fixes I picked up since v5.7-rc3.

Bart

The following changes since commit 6409d049ce28bef35e13dfb8699fc7ee27469ba1:

  gpiolib: don't call sleeping functions with a spinlock taken (2020-04-23 17:55:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.7-rc6

for you to fetch changes up to 9fefca775c8ddbbbcd97f2860218188b8641819d:

  gpiolib: notify user-space about line status changes after flags are set (2020-05-13 16:25:20 +0200)

----------------------------------------------------------------
gpio fixes for v5.7-rc6

- fix probing for chips without PWM in gpio-mvebu
- fix ida_simple_get() error path in gpio-exar
- fix user-space notifications for line state changes

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: notify user-space about line status changes after flags are set

Sascha Hauer (1):
      gpio: mvebu: Fix probing for chips without PWM

Takashi Iwai (1):
      gpio: exar: Fix bad handling for ida_simple_get error path

 drivers/gpio/gpio-exar.c  |  7 +++++--
 drivers/gpio/gpio-mvebu.c | 15 +++++++++------
 drivers/gpio/gpiolib.c    | 15 +++++++++++++--
 3 files changed, 27 insertions(+), 10 deletions(-)
