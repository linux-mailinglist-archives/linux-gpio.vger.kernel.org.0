Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3E9A7812B6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 20:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357462AbjHRSRL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 14:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379454AbjHRSRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 14:17:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842773C3C
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 11:16:56 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-3197a71a9c0so1533081f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692382615; x=1692987415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdQTPHFVJUzTLBnT6Boa8lOj/znOn/OEZflwWf8XjmU=;
        b=Mqm1LgATJKgvxJkiNBepKbB409fB4B91nbYGSSxGzvC/Z4O052PgZL4cjf15ONWofk
         G3O67DzGdBBzDlI17GXVPz43EdK6v201U+Q5GwvWjeqVWOYAPcm4Rg9MtHxPG6ZwkiP7
         a98oO03rtU0bZDj+x8FGiqEWMuyCiNTNKO2/K2MjDdowRzPd4uYRtu411zOF+FaaeDWR
         eJJCUPPZF6jo5qM9lu8r3oaAxReOCWuz8ePe0O1oPtc+ZcIw5YtL/hLJGkYBqP/i05x1
         Yv7RSpkEpBxW2rpKjxrsmTQ11thBOns5UUQLoPQ4JB2A5IXd6tqiNsKlWC0/Xtt0P9Pw
         1pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692382615; x=1692987415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdQTPHFVJUzTLBnT6Boa8lOj/znOn/OEZflwWf8XjmU=;
        b=lkh/4hc0zCE9r7dLB0zN2u5IkFLDXFsDf8yhK2ysQwCzgIWCuDn+kmcaehug4OcfrK
         zaeW6F+1WIQ2mNxDc4gdYBRx2KAVqspW9YymxzLr8jWYJTKhSjXjD8MvVnyMv0hHMYHB
         j2ykn9RDBwtTSU+rRd8lijB0S7596P5Y4b0WjEup/eyDena83XuSXG5ni9Du7iBLruZ5
         9rpU7nbK4x5xjkcToFisMvoTkYLXPhSfH0ZNS1u2y3zv0LSZMKhUhmxSzf9sfQL+G5bu
         +MU9M62Tp+H9b93L8TfEOAlNy8hOJKKGMnmMiZy2nh+jN9LzHH59k/iv33kyeM8Ii3To
         Wzyg==
X-Gm-Message-State: AOJu0YzcjYkMRtI7HenYXaRfqo9GFKiCImHAmo1mpcCwycKomXYaToQg
        KEvGn4TtpCDbsYorPDB9eg15IA==
X-Google-Smtp-Source: AGHT+IGrpCUAku0s5dB6vXG61L0urBTHfVd65PuIyvHfLGdfswXIWNOcd40NbN8LNXD0IszcsYVtoQ==
X-Received: by 2002:a5d:4ec6:0:b0:318:416:a56a with SMTP id s6-20020a5d4ec6000000b003180416a56amr5305846wrv.13.1692382614958;
        Fri, 18 Aug 2023 11:16:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d1c5:9f1f:6f05:38a3])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d594a000000b003140f47224csm3552460wri.15.2023.08.18.11.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 11:16:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.5-rc7
Date:   Fri, 18 Aug 2023 20:16:49 +0200
Message-Id: <20230818181649.20814-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fixes from the GPIO subsystem. Details are in the
signed tag.

Thanks,
Bartosz

The following changes since commit 2ccdd1b13c591d306f0401d98dedc4bdcd02b421:

  Linux 6.5-rc6 (2023-08-13 11:29:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.5-rc7

for you to fetch changes up to 3386fb86ecdef0d39ee3306aea8ec290e61b934f:

  gpiolib: fix reference leaks when removing GPIO chips still in use (2023-08-16 13:35:50 +0200)

----------------------------------------------------------------
gpio fixes for v6.5-rc6

- fix a regression in the sysfs interface
- fix a reference counting bug that's been around for years
- MAINTAINERS update

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: sysfs: Do unexport GPIO when user asks for it

Bartosz Golaszewski (1):
      gpiolib: fix reference leaks when removing GPIO chips still in use

Michael Walle (1):
      MAINTAINERS: add content regex for gpio-regmap

 MAINTAINERS                  |  1 +
 drivers/gpio/gpiolib-sysfs.c |  7 +++++--
 drivers/gpio/gpiolib.c       | 16 +++++++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)
