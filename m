Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1C825DE8E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIDPwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgIDPwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:52:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95989C061244
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:52:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so7269499wrv.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tF66yPfX1NKAG53/DHurnvbRXaRAE6KmX50Xc7KSu5I=;
        b=mLh68MJT1U8IQ6NzF3VoGinjRWq7ktw9W9LKtgXTietebfbmzsTaSHeqzxZZQtTUmf
         KqO2GZfYxMRWMDXBlUkW7TIfevHNv9hovtNfTDeeqRB8YYXBKjl0k2malgR/zmOrVDeE
         T7NO7XV5ljqxl2TWnSmBNOQ7q5lLYj29U4K6wcmq7ezkkDOLcTP8JbPvJRBRdk4gVAlo
         CyTGAbxEsXY7oODVLiOjjISkobPLHE/Zzu57OCY0HxUsMaO8nXcggbIXH5nbitj3SLl4
         bQYYGeqsQuH+Hc47/XfbNhKxAiRyl/Dvsb+AYUixQlzh5P+rPsS3BDWHydKkUyf8COi2
         SidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tF66yPfX1NKAG53/DHurnvbRXaRAE6KmX50Xc7KSu5I=;
        b=oJqNMjL21fxCRjM+GS3otwaBB1jZY5QLzcaPOJ2HWQU9RlKvGtf0c2cR3WWTiiImrT
         nBDWhqGpwEbwcQFH7gj1qaHSJmiZ87izMVsKeR+JU0s6nDe8nrsKgEbhYwRkHeszKF7R
         XedB/NOrwSsI+rGDdmGR2zEkjuUT8Qdbw7YjI8WqWns5vJDfDDr+xXJIAaCMT3MzTwrB
         CEtRObkJ5zbudp1VgNEOQigP/vRf7CpL8SKOoMwEhO3StR2eU+/Ls0MIhtAkXmTsBVw4
         E+XhiRdFeFha3JyLxcEFhWjuikufkLzjqrBGOUGXU/0Pth8MUPjFtRHWkurHblhNF5c/
         Hffw==
X-Gm-Message-State: AOAM532OYHHlxFke4MdMWgzTLTrvwleQdves1M88ZxLyIBK8WkJLNHHN
        mj+gZ7aWgAAjCSNZDI+lU2q4gQ==
X-Google-Smtp-Source: ABdhPJzEUCneAx2hf0OOAGsxURs54T9x7yx+aWKopdRHP7BTNB6P5GyejTFP3NKMMf3ZkoZHzrKA2A==
X-Received: by 2002:a5d:574e:: with SMTP id q14mr7850513wrw.281.1599234764343;
        Fri, 04 Sep 2020 08:52:44 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id h6sm11656811wmb.22.2020.09.04.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:52:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.9-rc4
Date:   Fri,  4 Sep 2020 17:52:40 +0200
Message-Id: <20200904155240.4877-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following two fixes for v5.9.

Bartosz

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.9-rc4

for you to fetch changes up to 5fcface659aab7eac4bd65dd116d98b8f7bb88d5:

  gpio: sprd: Clear interrupt when setting the type as edge (2020-08-31 18:06:28 +0200)

----------------------------------------------------------------
gpio fixes for v5.9-rc4

- fix warnings if PM is enabled in gpio-omap
- clear interrupt when setting the type as edge in gpio-sprd

----------------------------------------------------------------
Taiping Lai (1):
      gpio: sprd: Clear interrupt when setting the type as edge

Tony Lindgren (1):
      gpio: omap: Fix warnings if PM is disabled

 drivers/gpio/gpio-omap.c | 4 ++--
 drivers/gpio/gpio-sprd.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)
