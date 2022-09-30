Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533E55F07C9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 11:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbiI3Jkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 05:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiI3Jkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 05:40:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CC9EF0BF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 02:40:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bk15so5952831wrb.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Hiyl4o1HhM/WdVF8UJXF8FQDYDTnFxrXeTsPAOMfpi8=;
        b=V9rW9Mrcz/9n9WHs5iSjAN+NwgTJNR860iekPF26q2SV88qKsVoS7+2vGI2i7dzLOy
         /KB5YYFx5hZhX8Wj4VboDtfx9oDmVEM18PDBOs7Inhm5xSOzL+e/Ep/ve83Nx5ZVJrlv
         5rPG5OjaQ3Ss5pX8oXf5GbIXjZZ4lcCmkckFN60HvwwmQttkXMfHwruPsjHgDjQbN11o
         ubgksUeBdKvH89SIMNy2Zkmzgduia3mP3CDzy9tumLsPdlZz/Kht5FtcIQzDH7ZHmdYF
         oHgHsEKt8lVhVe+jSrEWnGRIJ4CBenTf9NJ8rfpZihmFjGRlRIZ97DteXW+xtFzDQPec
         1Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Hiyl4o1HhM/WdVF8UJXF8FQDYDTnFxrXeTsPAOMfpi8=;
        b=I2erdJrQkughAGhfcARVWAft6JJE4suG1Rq2oOfOLdgSaqzRoZoMQ56SSZGU3zOXFA
         BMg7oaiDKaqXj8WA6pB7rZjn8ziMA/0fXewQBP1DHB4PXGiaVMVTsbCMEZiqYqs0wsTj
         oO0XaJf+aym/DWETsIysPUC6HWe+ooEQyaZoHDI545jUrfE+QlgVyO/TXmgdMwxWzGyG
         ADeGX8ixwgEq5gzhnJuNPepvmYICtfbaOeY/2xiCtWKBnlH19WJ2c2q/DuC43mcbvJV8
         ZcOvPBpbXIBPDahXiFYOaFc4yKXugNnb8tT43u+yd8o34ThwWyt89KbXOFbA8ziRK9fT
         L/dg==
X-Gm-Message-State: ACrzQf0gETnut0k4LIo/OFaAMZ++pXhwEPHV47iM504XBLiMl/COZGco
        ymlcBo9cZFemCbKmc4un7pUMzA==
X-Google-Smtp-Source: AMsMyM7k55wlbIsMYyBoVjH2YD7Ayl1QiPwC0F4ejUGz44JvWSD27fxQ2VZnv3HM7JF3Uo49I7QNfQ==
X-Received: by 2002:a05:6000:1864:b0:22a:e349:f031 with SMTP id d4-20020a056000186400b0022ae349f031mr5265902wri.476.1664530845686;
        Fri, 30 Sep 2022 02:40:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e151:53f5:1e3e:6647])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d5606000000b00228d52b935asm1568437wrv.71.2022.09.30.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 02:40:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v6.0
Date:   Fri, 30 Sep 2022 11:40:40 +0200
Message-Id: <20220930094040.39361-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull one more fix for the upcoming release.

Thanks
Bartosz

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.0

for you to fetch changes up to 4335417da2b8d6d9b2d4411b5f9e248e5bb2d380:

  gpio: mvebu: Fix check for pwm support on non-A8K platforms (2022-09-26 09:20:09 +0200)

----------------------------------------------------------------
gpio fixes for v6.0

- fix the check for pwm support on non-A8K platforms in gpio-mvebu

----------------------------------------------------------------
Pali Rohár (1):
      gpio: mvebu: Fix check for pwm support on non-A8K platforms

 drivers/gpio/gpio-mvebu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
