Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51673A4994
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 21:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFKTrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 15:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhFKTrp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 15:47:45 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B2CC0617AF
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 12:45:36 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id i94so7217033wri.4
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 12:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDb8810oCpif6zfap6uDGjWQYilNRwSbod8qRYyAGqY=;
        b=sm1qDDyZtvVhi7pxOR6SBwLAfGjtZVmohr8bg7GIfjQGrxxlhIvj6re5ywBsNtY35S
         bEi2bfXOJJiPHD1WomKlzAb2t/YX6tOPykqpwSHpoaDg2DJHhpFB3tsU1Bf84jR4NCvJ
         0HCiuCkzQVJEeXg6NcEIvpEFEmsv5LIhtHkxF0kvjovW/aPS4gjS3jCyd5pe7iWqHYyP
         pSOh8QhaoITBiWwiVFcB4ufXN8bz7icnJFTW2IdIvx9RHBI7nTNZkK9+696IhOYq7gRw
         lVZkw4+Q4B6Wt2cs8ceMKZMjpZsmXjiOZN5ShVFJJel78YrE0S14Cm0TbI8ZK8FIs+Et
         cmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tDb8810oCpif6zfap6uDGjWQYilNRwSbod8qRYyAGqY=;
        b=M2uMB6BUxKpc9OMSaGDy3kBUh9BE8rMxtzKJRsKGotxVDt36PQeDXa32KxUGFpgJzG
         JVs+4YW+1Lnyz1dn/5sIimExwH+dlHm1wJcJf9unn5BP1vtVtwuz5TGK1W8AZAExLMyQ
         FilKkmsKbB7poCxkey90dzcFm1oenNLBpl7W0V6XavJLXSCr77Bv3EbSSkcnEKM8DObt
         6J90Sgqx1qoU/okgdV6O8d/6zc/ScLXOkcI7caSKXPu5I9kBDSR+8AF7aB7ErqwLCy9U
         Pi4RKs3ubj16oNR8nEfnzX8wQ0gkAfSQ69CK+mDN+s7Vay+LVKCg7nyGyq0K9COFKJTS
         dm9g==
X-Gm-Message-State: AOAM5314wBa4iZV1+LYDYe5r+qwPfTdhOSaaJkcKyz3lntimWtay137l
        vdlfjwcN1puhRF+AAsdmPKivmw==
X-Google-Smtp-Source: ABdhPJyS8qi/lr//hImDA5gRkv1QtJeYyC4mULN69ifLVC29Qbyr6KPVtV0ZFfDMkk9HJSobF8hqmg==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr5719112wrn.48.1623440734939;
        Fri, 11 Jun 2021 12:45:34 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id u18sm6789431wmj.15.2021.06.11.12.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 12:45:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.13-rc6
Date:   Fri, 11 Jun 2021 21:45:30 +0200
Message-Id: <20210611194530.15593-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following fix for v5.13-rc6.

Best Regards,
Bartosz Golaszewski

The following changes since commit bdbe871ef0caa660e16461a2a94579d9f9ef7ba4:

  gpio: tegra186: Don't set parent IRQ affinity (2021-05-12 13:56:43 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.13-rc6

for you to fetch changes up to dbec64b11c65d74f31427e2b9d5746fbf17bf840:

  gpio: wcd934x: Fix shift-out-of-bounds error (2021-05-27 09:51:35 +0200)

----------------------------------------------------------------
gpio fixes for v5.13-rc6

- fix a shift-out-of-bounds error in gpio-wcd934x

----------------------------------------------------------------
Srinivas Kandagatla (1):
      gpio: wcd934x: Fix shift-out-of-bounds error

 drivers/gpio/gpio-wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
