Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F540B7A5F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388590AbfISNYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 09:24:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54041 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388408AbfISNYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 09:24:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so4513424wmd.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDeIStA2SVxbAXaFQXClZ86g46tDLe4UA5LZRN92sxU=;
        b=sA4gWwGLLbVGPZOpGQKku8JSVALqiyYoYZAyD4bVbQmtiD7eveepKE9VfNlvhO1d4A
         67DwB43kretuhocqPTsTAeTBH0Tuq3WtiDIryGEhv6AlZuM592nzM8Lbh585J2uP4uLJ
         B47fCwtmxyBC3WYekWy6p/lr7rbijpsloMnt8p5afsGw5bMTdpb48QVmS9nsPEFGa9pS
         TbalDteCOrXQyfYElcQtfzB1NduYLIQsvehCGLnCuZA/UftU7hvmyseE9J8VtEFg0R8x
         qC7i1dPYAOux2zV4lhnqjovSPIahQshgmY5wn+q2OMt3ugwepElmGugL/3D9ImrAnG+Q
         oGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDeIStA2SVxbAXaFQXClZ86g46tDLe4UA5LZRN92sxU=;
        b=XhUP4SZ+OrYl1/QtrIWGy3irZpqYCANpca96sHPlKBUgpeWqZGTlBmjtHUqNRLbnaR
         c3lu/4STYB8JiiHOLK2MtHHxPNPeSkHmySJEZaLF+JaPh69V3uSBs0rhadF5X9fT/zir
         zsvaykxUKMmj/2PO89TLsgLXcunLAO8SpTuBIh3+wluGL4PieWOyIJajwFSz071h/Xzv
         Ts0g7mqx9dU5IBl8tu0NGXdFx6P1aBV6Y4PME9w0ksnqPPCvNnfznRapqUDYBgdrWGNK
         CgnSPVxBJXmETw3uGAFrXrFChkvbZH9lr6wZnBl0kkkGANz/8lmb9qpPegcr/7zalK4u
         xjBQ==
X-Gm-Message-State: APjAAAXK/NEolpyVS7aUyUYXEhXvmpokh1LOsMThAEQfB7gWI0kPmAi9
        fkNDTzrGn+/Iw/1imbkglOTbGQ==
X-Google-Smtp-Source: APXvYqxvYdxqoMstA5eP3IpeSzfkWy7MxwjMkyS4XKl/W+zPB+askv4GufCmfCQi1cSZKq2uApqxkw==
X-Received: by 2002:a05:600c:12:: with SMTP id g18mr2723929wmc.158.1568899446493;
        Thu, 19 Sep 2019 06:24:06 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id f186sm8133678wmg.21.2019.09.19.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 06:24:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.4-rc1
Date:   Thu, 19 Sep 2019 15:24:03 +0200
Message-Id: <20190919132403.1835-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following set of fixes. Two are core code, one is a fix for
a driver. All are stable material.

The following changes since commit 4d856f72c10ecb060868ed10ff1b1453943fc6c8:

  Linux 5.3 (2019-09-15 14:19:32 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc1-fixes-for-linus

for you to fetch changes up to a94b734a563498ac4b8fff61179a3c2bba781a4e:

  gpio: eic: sprd: Fix the incorrect EIC offset when toggling (2019-09-17 10:08:35 +0200)

----------------------------------------------------------------
gpio: fixes for v5.4-rc1

- fix a bug with emulated open-drain/source where lines' values can no longer
  be changed
- fix getting nonexclusive gpiods from DT
- fix an incorrect offset for the level trigger in gpio-eic-sprd

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: don't clear FLAG_IS_OUT when emulating open-drain/open-source

Bruce Chen (1):
      gpio: eic: sprd: Fix the incorrect EIC offset when toggling

Marco Felsch (1):
      gpio: fix getting nonexclusive gpiods from DT

 drivers/gpio/gpio-eic-sprd.c |  7 ++++---
 drivers/gpio/gpiolib.c       | 29 ++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)
