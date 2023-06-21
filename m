Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEEB737EBE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 11:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjFUIso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 04:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjFUIsn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 04:48:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E551737
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 01:48:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f86a7a5499so5248402e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687337318; x=1689929318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ5riSMnXRwtP2v+dn9d35hsXUHRhzOV8tTviQB3F/A=;
        b=hwF0+oTvnHvQ0QhOtN6RSE0z4eSQf93sSKl374VfTsodrJ01vc/0cbHCRsejBAd19z
         W1vfJ+doAIlNa7CnzrBromZmG3B/18SUOT8fnFh8QJKbpKe711VpqIwQQ3UwgBdUu8Af
         Xr9Nny0GZWrmZ9+99zFP0k+CVu6m6380yiIYZdn4CmiQpP2aLC6BW6Wmw9DlTRjtKh7y
         7fRzqxafELppsUdqBnCzONKySLxuYk/xw74kzlDC5OcpOpPjVeNNI/lvfzA9hbCPg2GI
         AiiTjh0REwjaubdzrtI7YE7jdhQ1HbFM/4KRxM3YRdrZadAU9EfYSRYoHJvmL+OkFFlX
         lpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337318; x=1689929318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ5riSMnXRwtP2v+dn9d35hsXUHRhzOV8tTviQB3F/A=;
        b=TYYl2smSfvy72kjhauSW5X+dqViy4IMO56o5YSFEdQlA5KzdxMf3154XGDCxd2hsPC
         Xmpynto9aIZxoDzQPWEL4Toz7roEUFcQoZuMnLA2nyn41IvDQVgkp7oJTG2SWDCCJg+v
         K04ZyoooXiwPFiyMSUMryvy3kWs1uxGk5RjcTH44LnLTlhDbn5fqU/4gBkgAZMVTHk/d
         eDImQpr8AFHAYDXZjeCdi7j6EQr518osfnPFOKQESFzPRjzAn/k8KhqrhBbVaqhn7A3Q
         510wzc0t7J0z717mytMvkHqRuwttEbXygZGmWCoLOd9/GkJGwpJctVw8m9BfPVIGcr//
         0KlQ==
X-Gm-Message-State: AC+VfDw+aYvZMaDP5LrK0wl5OCKrgMZw0PqEW39yzjJRpjZ2x0NzNlnt
        m3wb1ygBfjg8AY8Sqaxpq9PxrQ==
X-Google-Smtp-Source: ACHHUZ5Gzr+Au+mUZf7FbcNnAh/qgtQ1+EOvDDaCRoRq8e4xsjjxfFb45zHb05GD50wYQig3FsraCA==
X-Received: by 2002:a19:6503:0:b0:4f8:7960:f72 with SMTP id z3-20020a196503000000b004f879600f72mr3126628lfb.44.1687337318057;
        Wed, 21 Jun 2023 01:48:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
        by smtp.gmail.com with ESMTPSA id f1-20020adfdb41000000b0030ae499da59sm3856476wrj.111.2023.06.21.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 01:48:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] tools: port tests to shunit2
Date:   Wed, 21 Jun 2023 10:48:33 +0200
Message-Id: <20230621084835.114473-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a two-patch respin of the previous port of gpio-tools tests to
shunit2. The first patch fixes a potential problem (which for me became
real after the switch) with losing edge events. The second is the actual
port.

v1 -> v2:
- don't change the way symlinks are handled
- drop remaining bats-specific workarounds
- restore dropped calls to num_lines_is
- require shunit version 2.1.8 and add a test for it

Bartosz Golaszewski (2):
  tools: tests: add short sleeps between generating edge events
  tools: tests: port tests to shunit2

 README                                        |   6 +-
 TODO                                          |   2 +-
 configure.ac                                  |   6 +-
 tools/Makefile.am                             |   4 +-
 tools/gpio-tools-test                         |  57 ---
 ...o-tools-test.bats => gpio-tools-test.bash} | 469 ++++++++++--------
 6 files changed, 266 insertions(+), 278 deletions(-)
 delete mode 100755 tools/gpio-tools-test
 rename tools/{gpio-tools-test.bats => gpio-tools-test.bash} (87%)

-- 
2.39.2

