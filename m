Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541274EEEBB
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 16:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346638AbiDAOCO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 10:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346626AbiDAOCM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 10:02:12 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEA45C65A
        for <linux-gpio@vger.kernel.org>; Fri,  1 Apr 2022 07:00:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a1so4372075wrh.10
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2022 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81peZBmLl1P8MoxcBKe75OzMzjaOe8BW5vGSNP3oTXE=;
        b=Hdh90bsQfQulbfzNnj8rBKM2RkpMeOff3GwqzbmItaBJlvpZWpIN4aoVoScFoR68au
         DY7xCCwSduhD8QEdLwhChipugpkXwCQe5b9LgascBxXen/2w3UZqKkqvEMLVWCeJvnbf
         19THXr24xyg9RT2QWUDyOiz7xXwTgUlyQzPNLVnlCnRO6YPKt7jzfSai5SpkQE1WyNbn
         BjRag587ypYj8P4ltLpckaVeCO9TTTyJGcpYoOQV7vqCxld2ZIoXpfj/9GkzJBfKi899
         qegJgNs2sQApu2KDACf3wkMACwWvLSvZp/Is0A8g/CGzFA9RRteTkNs/9+1l7QZmcqDO
         LSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=81peZBmLl1P8MoxcBKe75OzMzjaOe8BW5vGSNP3oTXE=;
        b=TUt8uy2emGaoW1w5E/tBSZf7yilX8NQyq1mFMbIFx+FZo/dykXmIQQGs/erfr3p5T5
         sV23ZvY0am8lHj//b8htvyrPM8pBs38eWNnaeZmJS5oLfj9N7L+5MbtoxjMr/hxgdzqi
         EZ9vVQcCGPs0p30bl5cgcX0zNVEqd4yNki9qHWJz362/Hwo04N5sVjGB2Lf1KlO1hZ9+
         lgOjLBUPys3dZX1D1MrFIg4TcJGUxhxv1qtzZbkhUpvSY1XnA96uoyWJHdYWSwfI1clB
         MYFTpZx6wJhyWHDJnOCGiVbnShSyQRkkt2osxJaueV5bbjVNqWsAI+2DJrqn9oT1o0B8
         3F2g==
X-Gm-Message-State: AOAM531a8b6JHvvkX2P4rFJtF1JPoi5DCWt1jB+RUnzcVgzoC8s/tO47
        55QFb13xsfdXkxL43CHXW0eGiA==
X-Google-Smtp-Source: ABdhPJyCu9IMphhIOyUvpdqAUVDOPHIsymxVBgBJ9ednqPNXmoIk17Kb4I6XSEUVbLRpacJ5viDp0A==
X-Received: by 2002:a05:6000:22a:b0:203:f7f8:e006 with SMTP id l10-20020a056000022a00b00203f7f8e006mr7866808wrz.175.1648821621323;
        Fri, 01 Apr 2022 07:00:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6f2:bb17:31a5:c2ca])
        by smtp.gmail.com with ESMTPSA id o11-20020adf9d4b000000b001f0077ea337sm2197824wre.22.2022.04.01.07.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:00:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.18-rc1
Date:   Fri,  1 Apr 2022 16:00:16 +0200
Message-Id: <20220401140016.831088-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
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

Please pull the following documentation and comment fixes for the
upcoming rc.

Best regards,
Bartosz Golaszewski

The following changes since commit f443e374ae131c168a065ea1748feac6b2e76613:

  Linux 5.17 (2022-03-20 13:14:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.18-rc1

for you to fetch changes up to 24f71ae5447e661813228677d343208d624fc141:

  gpio: ts5500: Fix Links to Technologic Systems web resources (2022-03-31 16:44:57 +0200)

----------------------------------------------------------------
gpio fixes for v5.18-rc1

- grammar and formatting fixes in comments for gpio-ts4900
- correct links in gpio-ts5500
- fix a warning in doc generation for the core GPIO documentation

----------------------------------------------------------------
Joey Gouly (1):
      gpio: Properly document parent data union

Kris Bahnsen (2):
      gpio: ts4900: Fix comment formatting and grammar
      gpio: ts5500: Fix Links to Technologic Systems web resources

 drivers/gpio/gpio-ts4900.c  | 12 +++++++-----
 drivers/gpio/gpio-ts5500.c  |  4 ++--
 include/linux/gpio/driver.h | 13 ++++++++-----
 3 files changed, 17 insertions(+), 12 deletions(-)
