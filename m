Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880FF52F16D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 19:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352117AbiETRTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 13:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351168AbiETRTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 13:19:42 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13BF186299
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 10:19:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t6so12373545wra.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AotfV1tzndaO8ANao4j/ji8ZRWlSeHdzWiW8XQoX2j8=;
        b=uEM9R+wyIujwZo+Xod1pCpBS3mDc5bdCIzHeWWTe+kAJo51EEgb3Epu6GyBGpNmNyS
         2a1nK9/TN3lwJQQUEVuOPd6wqcjOgLvzdNVlTnPw3TYqOXgi1tq6dAbqR+2+/GwLN6qW
         A8lm8xRGsHf0Pw9EotRg7HC+DRr1bmbIgoHcFtJrhfxJnnfJBcke5WFSMsKitrJv3eRv
         Jc4KVDnd05msVsEnq7WoLRtpzmEVhK2u4uOw/tIZN/8V2zp/xiyNdeX+xVhrS+AoWAzj
         50pOs8vNyWVx19ZQ/NIO+MYkwOmVb14MuN4M+R8TxpOrZb8OD60MO+GPFzE+GUDNuR1e
         +FiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AotfV1tzndaO8ANao4j/ji8ZRWlSeHdzWiW8XQoX2j8=;
        b=u4he6Vlyi6dn+NETeXrWr0Ay35wWUylXhgq4Dsozdig6gFY5RnO+7kxju1fGefGwMF
         DkE92PCTYzi49MzL+PWiTw/q7WV4JlSscZVmZn3M1tCsXeGUzrUyQI5+oZodgPD5BVHe
         R0KMXu9elH+zT0EtrXnldUivylrDLSCGTYheR1ORS6c4iBli/E6vAMW9yCgnyMjY6C1N
         LCoxIwal2+Fy/7+uTLp/1ETjroQHrlCm1TwAaQg4vsG3fP9f7jrS/j7Azy1GLHGvGjoC
         qN7BS3WSaeIRgmlb9ZZT6T7KFSp0RvxchOa/hz1gNnM6UBMG2z2e0NVq2ib99Z3JoQrq
         JXUg==
X-Gm-Message-State: AOAM5329RGKAwkquFI3ra5V9/IDvFLyeFEsMRizTKajhSnWYbNmWivMz
        ogGc6sgVWQxD8qsx3LTQix6zjQ==
X-Google-Smtp-Source: ABdhPJyYsswAx77EPhgnR3dEm+3zJQONdtGcwMikEMVNq+b69dxB7GRncKeudxz+ih1WeNNa9sLm6A==
X-Received: by 2002:adf:eac9:0:b0:20d:cdd:a719 with SMTP id o9-20020adfeac9000000b0020d0cdda719mr9341473wrn.0.1653067179375;
        Fri, 20 May 2022 10:19:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3f03:2f2e:2755:5200])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c338400b003949dbc3790sm2474752wmp.18.2022.05.20.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 10:19:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.18
Date:   Fri, 20 May 2022 19:19:30 +0200
Message-Id: <20220520171930.1029663-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Please pull the last batch of GPIO driver fixes for this release cycle.

Best Regards,
Bartosz Golaszewski

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.18

for you to fetch changes up to 3ecb10175b1f776f076553c24e2689e42953fef5:

  gpio: mvebu/pwm: Refuse requests with inverted polarity (2022-05-20 16:46:56 +0200)

----------------------------------------------------------------
gpio: fixes for v5.18

- fix bitops logic in gpio-vf610
- return an error if the user tries to use inverted polarity in gpio-mvebu

----------------------------------------------------------------
Haibo Chen (1):
      gpio: gpio-vf610: do not touch other bits when set the target bit

Uwe Kleine-König (1):
      gpio: mvebu/pwm: Refuse requests with inverted polarity

 drivers/gpio/gpio-mvebu.c | 3 +++
 drivers/gpio/gpio-vf610.c | 8 ++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)
