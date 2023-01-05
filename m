Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2A565F4C0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jan 2023 20:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbjAEToX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Jan 2023 14:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbjAEToW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2023 14:44:22 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B332023
        for <linux-gpio@vger.kernel.org>; Thu,  5 Jan 2023 11:44:20 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso2717550wmb.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jan 2023 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xP6IZLtRfzLLTf9PLyMzo4VPs1WL/TdKeh5EXdYX0Y=;
        b=b1eJkiKKEuE0smAQVwgKTkrhm/UKykO8viG4/O4e4o9tmujDLtRnGJ1sGs2mVXRYHD
         b69ESfhTQBBPeWepKEdHYpSobsObC5ZFvsigmVmIVvPvDFVY6afYlKfRmzQut0AGyPc9
         Pld31XdtBK+1rR60BAHnzs7RaxTV0byyxcKNweHAQo5IaWp7WysNeUFHYSH9qj3cpPvz
         Y2skXdIR+lsUfZ1ObU+IffAY/EeAR1+w869kRTTY/U57uC+eu9RIzQxgHppNy2YxXGad
         TkGmEIxTPb850auPDODd9sKIVUnQT6tt3+zDFq/lSGcsxYgaYuDZrqk6jVdPP5dVaIkR
         74GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xP6IZLtRfzLLTf9PLyMzo4VPs1WL/TdKeh5EXdYX0Y=;
        b=h0XsnVSMut2RpFSJVrgresqoPTgFCZ0LDqHTnEzikbpovnANO0/J5ieXucmfON0e/K
         MYxmMdB5c8XwNoqmrUwDbpe84ag0Y9+JeFqzo6j0ZgmveOz6+2H3qVSMVucs2Do24eqU
         WMcytTHc7TZu+d1kIHLyZZauLYlR9QGeh4VebV7SNeOmsZHzrEBOHV1WKxTzqZzn3r2B
         gHzwlW4kEyfZqOUu+iPOwhoZQbRIoRCe6vBrlfwZuAc0Lh094fra42yjqTOdNrvU/FC/
         ZaWb+QDYGHYFELM1VVyuASaURRkG/H8V1zSDSE4siux3W1L+EPukk+OvxH9io0Nbb4pv
         sKvg==
X-Gm-Message-State: AFqh2kr6uKaanmcJ+JFNeSb5D5CQVwXBlXszgJK4uMAQH3Rb26vWhMFa
        jsG4/SaLptYzC8tm1TxDv8qeNg==
X-Google-Smtp-Source: AMrXdXsdvwnq+HU/o8SHbw1c1AdG+LYjfjLo6vx0iiOWVUdobYOXg1kpbw5iF2RQ5h1Z5AjVaeZzzQ==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id a21-20020a05600c349500b003c6e62e2e74mr37808686wmq.15.1672947859515;
        Thu, 05 Jan 2023 11:44:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:101:3196:3a40:6416])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm3981421wmb.42.2023.01.05.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 11:44:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.2-rc3
Date:   Thu,  5 Jan 2023 20:44:15 +0100
Message-Id: <20230105194415.552286-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

Please pull the following set of fixes for the next rc. We have a reference
leak fix, two fixes for using uninitialized variables and more drivers
converted to using immutable irqchips.

Details are in the signed tag.

Best regards,
Bartosz Golaszewski

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.2-rc3

for you to fetch changes up to 694175cd8a1643cde3acb45c9294bca44a8e08e9:

  gpio: sifive: Fix refcount leak in sifive_gpio_probe (2023-01-02 13:01:14 +0100)

----------------------------------------------------------------
gpio fixes for v6.2-rc3

- fix a reference leak in gpio-sifive
- fix a potential use of an uninitialized variable in core gpiolib
- fix a potential use of an uninitialized variable in gpio-pca953x
- make GPIO irqchips immutable in gpio-pmic-eic-sprd, gpio-eic-sprd and
  gpio-sprd

----------------------------------------------------------------
Cixi Geng (3):
      gpio: eic-sprd: Make the irqchip immutable
      gpio: pmic-eic-sprd: Make the irqchip immutable
      gpio: sprd: Make the irqchip immutable

Haibo Chen (1):
      gpio: pca953x: avoid to use uninitialized value pinctrl

Hans de Goede (1):
      gpiolib: Fix using uninitialized lookup-flags on ACPI platforms

Miaoqian Lin (1):
      gpio: sifive: Fix refcount leak in sifive_gpio_probe

 drivers/gpio/gpio-eic-sprd.c      | 23 ++++++++++++++---------
 drivers/gpio/gpio-pca953x.c       |  3 +++
 drivers/gpio/gpio-pmic-eic-sprd.c | 29 ++++++++++++++++++-----------
 drivers/gpio/gpio-sifive.c        |  1 +
 drivers/gpio/gpio-sprd.c          |  9 ++++++---
 drivers/gpio/gpiolib.c            |  2 +-
 6 files changed, 43 insertions(+), 24 deletions(-)
