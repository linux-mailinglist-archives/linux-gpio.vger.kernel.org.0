Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51DB27E512
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbgI3JYf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3JYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:24:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EC7C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:24:32 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so966835wrv.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5tJi2CaN+R8Ew5UuKHn320UUq0Q2ZX4DouxpTOvyvY=;
        b=qQQaes4939iiUJsuX6LVOLtngrlZGmFl7YDa1boZxNvycpaW2gyQWPbqMhwhVrz2Pv
         sH7JGH4I6kOZDaqJPFh/CiLUmV2MBP27gADTv/hEisGcy2tX1LoeafAVeHwh3/ry6xjh
         PmqX/DveVdy1Zg4D0cnsVT/mxQmzNj3gL4dhWeuGzNB+YahxxSH490BmzCJXbjprhulf
         qUsJuS2Rpl6aJ0DnHKQq5bjeqLPhz9jiM038nryGGuvZ6RYQWo07aIV4TEethR3hzXlI
         QM5glRg+QbmCmalJIWUfgt1A0t4o461apCUFFAvXzvfdaX04pOYbTSYO4bUxq2zlBeNS
         j3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5tJi2CaN+R8Ew5UuKHn320UUq0Q2ZX4DouxpTOvyvY=;
        b=Ko4zemlCgehEZXEpBVr1O4QwGgCD6znVNAsKTna+jTsU9IxLMRr1tOoohv1VuZ+Z9k
         8OvPUgT5QtV3qNOMFSIUPxM2LSoNjtxq5v0f357HqaqXGLCLtdFfr8Gu7EHs8lEUnvch
         wW9zv+dTEWLylkpnYEJhUCJqJg5NH1pa027AjZioJB6rark6qZC/3CbUqfINHT6UYRZb
         rncsJBM2wv2TabDzXzzIRL8T+ojLnDXTttGiGAk9Nqu7Barc8qiRrkwGFMzdaCrscz5h
         SNwWWzf4+/wrujMBho22qSESa2oJZkxivord4zAY1WSTJ3n0eUJxlxV/deHiVqVT6dM8
         ByFA==
X-Gm-Message-State: AOAM533EolRtpzejIDOfD6TWjfx1bnCt4w6HJNNB/xs1BJj7b8SaeJna
        rR02XNSIktMPZfFrR2i+2C9SUA==
X-Google-Smtp-Source: ABdhPJyMjP62Z01pXgjQpJNxUz+GaGvio9JYrWLbFcI+w+w15i75TpKuXZj13rXmU+Krtg2YX0AQng==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr2102512wrn.228.1601457871074;
        Wed, 30 Sep 2020 02:24:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id t202sm1768697wmt.14.2020.09.30.02.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 02:24:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.9 - last batch
Date:   Wed, 30 Sep 2020 11:24:26 +0200
Message-Id: <20200930092426.9559-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

Please pull one more fix for v5.9 release.

The following changes since commit 3e640b1eec38e4c8eba160f26cba4f592e657f3d:

  gpio: aspeed: fix ast2600 bank properties (2020-09-24 15:37:18 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.9

for you to fetch changes up to d25e8fdebdad84219b498873300b7f11dd915b88:

  gpio: amd-fch: correct logic of GPIO_LINE_DIRECTION (2020-09-28 12:22:04 +0200)

----------------------------------------------------------------
gpio fixes for v5.9

- correct logic of GPIO_LINE_DIRECTION in gpio-amd-fch

----------------------------------------------------------------
Ed Wildgoose (1):
      gpio: amd-fch: correct logic of GPIO_LINE_DIRECTION

 drivers/gpio/gpio-amd-fch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
