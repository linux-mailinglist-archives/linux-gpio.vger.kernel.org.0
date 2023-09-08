Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7044F798644
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Sep 2023 13:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjIHLGc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Sep 2023 07:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjIHLGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2023 07:06:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A73311B
        for <linux-gpio@vger.kernel.org>; Fri,  8 Sep 2023 04:06:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-401b393df02so22513195e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Sep 2023 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694171185; x=1694775985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKhDC1+dJXvzLE48gG3JDe5bt95kZKTseJz3HDdmtqI=;
        b=JkJj+of5xIuymvNuwlzXB8+VtMODBRk3sTQjfUxpboMQWvEQ2gzH6SrPe5JU4fLwaz
         ed9TXr6YVGZ8kpXXTg3Nsc2xyFhJAuaSVy0uQQYGvaTcF2ZJ9cgSx5ujmOw7JLe/2WBZ
         z/Q+Q6sX31jSi8NFwGieoCE1FrLskk71wdApFCe80wYDJoR4PPi42lt1LslcjHBtclcP
         tiaTX0rhzZ2Ylgazn13lGE82aMqJbUwMSetX59i1AsOmYEED4xKRJJ1e1FlJZDip1gzB
         Ljtg5Wt8pqx2xBEsth/tGnomkOpBERXLC1iRPKI5f5muIRJ8oY3HmVnov6YptmCWV9NP
         J40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694171185; x=1694775985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKhDC1+dJXvzLE48gG3JDe5bt95kZKTseJz3HDdmtqI=;
        b=dFrqVv0LP3trJLk0ALiyO0jSh06ECx9R7vqbvHFd02cN2HiyA7YvOZqA52AFLHW5QC
         9d7IUXQ6eDd8xccRKQRPFeIydcrFMdIMXialFgjLH3WPtGG2BW8P5Kfo+K7wbYw0o3vu
         x/xvEWIaAOeYrxPXe2G2Xc/A6lLy1b48fJ8p2Vvdn0HBemIpaxR6LKs/YMpjODZFO71Q
         TNkf4CsPtmrL4c6snlJSEMK6KzhOF+havsMXNFEjU/DvWURlnBoPRcoTiYDBrTxiv9jH
         Aac0VrgWe0RizL1LyO3MdWgdnicwTXpRF7wI20v1LZw+IWHpd1WlqdBZhPk22JC54pcm
         TpLg==
X-Gm-Message-State: AOJu0YwSfc7p+EBQDwaEac6Q5NK4T+a5b1y2YX8usAFZfRIflpVpgjyr
        1M37OObh3jNSG/xSY3EjMJNxSg==
X-Google-Smtp-Source: AGHT+IGimABcUqVSDlcYiqilCaACwqh6ZzO7R9wh0ItpyEksOsa+RqaF1QaDUTjen7of4miXXtdhnQ==
X-Received: by 2002:adf:e44b:0:b0:317:3f64:4901 with SMTP id t11-20020adfe44b000000b003173f644901mr1565273wrm.41.1694171185433;
        Fri, 08 Sep 2023 04:06:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6ad7:c094:c795:74f2])
        by smtp.gmail.com with ESMTPSA id d10-20020a5d538a000000b0031c7682607asm1812089wrv.111.2023.09.08.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 04:06:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.6-rc1
Date:   Fri,  8 Sep 2023 13:06:22 +0200
Message-Id: <20230908110622.9503-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following regression fix for the upcoming RC.

Thanks
Bartosz

The following changes since commit 65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4:

  Merge tag 'gfs2-v6.5-rc5-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2023-09-05 13:00:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.6-rc1

for you to fetch changes up to 180b10bd160b014448366e5bc86e0558f8acb74f:

  gpio: zynq: restore zynq_gpio_irq_reqres/zynq_gpio_irq_relres callbacks (2023-09-06 17:08:51 +0200)

----------------------------------------------------------------
gpio fixes for v6.6-rc1

- fix a regression in irqchip setup in gpio-zynq

----------------------------------------------------------------
Daniel Mack (1):
      gpio: zynq: restore zynq_gpio_irq_reqres/zynq_gpio_irq_relres callbacks

 drivers/gpio/gpio-zynq.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
