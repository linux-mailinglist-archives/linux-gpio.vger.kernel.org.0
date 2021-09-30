Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5334541D4D6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 09:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348807AbhI3H4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 03:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348793AbhI3H4J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 03:56:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB14C06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 00:54:27 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id s21so8483964wra.7
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 00:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tFbQ55QvE4VrWzx0WGzzZpPelBHUJX2nhQzISPTrz70=;
        b=PUadw4c9isS2cxmqFi/YX6ItKbHK/CZky15wGeWzyFsJDGwdkFRU0Qfq6Z2EuMUW5o
         3l2px3o6FszfOwoAcpLjIGJp3ofUG3NKuhQU4B3/Z0504nsVDapfs8gCD4m+bN/1Xkep
         ndWK58TB5TBC+mDt9BCpgkLN9Kx1LxlyuTlGzXX3sAfaL2ZumBwfO+MGimu78MW85RwK
         ICYEMjlJ6T0QONaOg4q2z89i6XV03nEouIzSXuMR62l8VkkUD6L8k6vMBPIXRu1dTt1z
         RjCV8QepIE9eQi7iZKAxAc7Sqi+UB9E0WIDiTc1qnYZPf5WLD9WPuIf1IZCPPyLy9xOS
         t0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tFbQ55QvE4VrWzx0WGzzZpPelBHUJX2nhQzISPTrz70=;
        b=Wl+jZP9Jld+yfEPrXP/PrV/XaD2IgxGlxif/3vQG4OJul4qdc7vN6pV1kEPfVhRcDP
         TsK+aMByk9tdZ3Y/ozeuoLesD1JCjaLWlDII79OibbAqYwv9I0t5JyNBaY2m3DTzE2oT
         5VqG5SjIYJL5S0loah3venwGQlM5Uhl0Y2jpcmb1h0R8qJWd/sDjCalJhodvdsgRxFWN
         OB/eDHsVsXIthVoxEordiBfaR/8YUGWIMpdGUulCDcd6B5rVjb+6+TsWCNLazaMpa3Rd
         /jhdlKRpRtstUjBwwuUuDgZT3TCuOSTX/ERjavsFI86T9uzweMZfho+sYq3hlk+F6jut
         8qug==
X-Gm-Message-State: AOAM530ZzCR0zGaY/oEsL89qhyzRtXYFSNMZomwkXwuqGdREMNsDP1Qt
        zcnrlPyY0hz73nwqVu8xxAzsoQ==
X-Google-Smtp-Source: ABdhPJxlSWHDK5dVmImux7/6JfIXow/ENgBS7KUEh5J/aun7idE2uWRl1wtPeVEbs/Vvqj2ovcIDlQ==
X-Received: by 2002:adf:a3c7:: with SMTP id m7mr4442360wrb.339.1632988463070;
        Thu, 30 Sep 2021 00:54:23 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id w5sm2135322wra.87.2021.09.30.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 00:54:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.15-rc4
Date:   Thu, 30 Sep 2021 09:54:21 +0200
Message-Id: <20210930075421.13146-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

This PR contains a single fix for the gpio-pca953x driver and two commits
updating the MAINTAINERS entries for Mun Yew Tham (GPIO specific) and myself
(treewide after a change in professional situation).

Please pull.
Bartosz

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.15-rc4

for you to fetch changes up to 040d985e27dc39353d50d0f75a6be3330f4fece2:

  MAINTAINERS: Update Mun Yew Tham as Altera Pio Driver maintainer (2021-09-29 20:42:31 +0200)

----------------------------------------------------------------
gpio fixes for v5.15-rc4

- don't ignore I2C errors in gpio-pca953x
- update MAINTAINERS entries for Mun Yew Tham and myself

----------------------------------------------------------------
Andrey Gusakov (1):
      gpio: pca953x: do not ignore i2c errors

Bartosz Golaszewski (1):
      MAINTAINERS: update my email address

Mun Yew Tham (1):
      MAINTAINERS: Update Mun Yew Tham as Altera Pio Driver maintainer

 MAINTAINERS                 | 10 +++++-----
 drivers/gpio/gpio-pca953x.c | 11 ++---------
 2 files changed, 7 insertions(+), 14 deletions(-)
