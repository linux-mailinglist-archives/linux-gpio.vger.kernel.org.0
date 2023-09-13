Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1D379E724
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 13:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240485AbjIMLuY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 07:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235715AbjIMLuX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 07:50:23 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F8D1990
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 04:50:19 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31dca134c83so6775390f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694605818; x=1695210618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE2ORVq287JLkcnuWpgymLTUjppVm5JnqXblhoOF+yE=;
        b=0OOsdDHBRtrLCVZElwuZ1wNqoib2sJOpZLkK56+PrfcUd3OBHx3EGYOp8VemCfHxcz
         dKy1GmsVheKR+fs2u7NWbawiLo+QVOS6awLxDoxsyFjZkKSFsCBCZUIG6bGO+39RtqRu
         Leyy7DgAfveKRcsG82LB0WUgz3SsHtrolpN0zR/VM5/bG61OCo9jSXWKHJJaXiJqElNh
         7A2zDr8i4aMFDD/ETCuI86ZLswFQqki1Jjaj5qdF8sxbSWPMcmJv1MdQtDfA+3KAYejU
         C7bH2zGLfVz2N8wg3+bVxHwh8qn/GclO0sPWHD6KI0ylQLA4xWzBBRm5jnuQLyQ7PCk7
         z4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605818; x=1695210618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE2ORVq287JLkcnuWpgymLTUjppVm5JnqXblhoOF+yE=;
        b=ovBICMZNfDjRUWaGhSGWbmN4XEjAhZjEFYBXsI7qo4U0QZsIk1WbY8rJWW+95Qc/vB
         6WJfagFs72zeRfeK/XCm8CvSXEi7txTjqcbLMXtqCC3GrpAwx+kP0RqJAR8Vr+V9zJGl
         R/d63DyrSBpPcfR3VjHlfCWNMotSuiudYOyX6x3/Z3ZIMNNPTs2IgFVsFrVIAZLsdWXV
         ctdjmcO4vNoVFpsAkHWO1rQcRDbIFcXmp6Or7waTTnI0M/NBpmRZ6d5PKyLn4rOy1epZ
         KAjCwgruTP+OmMlApWsDXnfRUiCrM0rnKHIkfsev3WybeyZZ0QRg+gB+9JHiwvyEMpRt
         S2dw==
X-Gm-Message-State: AOJu0YwJTqVUygaGI9l2QZjzitAdPPnM/UXLfV+koFcIZn79mYTG41IX
        EjhFWJBesmtVZvH889+GFrFX9w==
X-Google-Smtp-Source: AGHT+IFXSSuEq9wtyazcQ7l1hh+jAkGlzZwC0/98tI2tsHjMXKI3a8JB3xTIjBmtqjgeTD74oF6Sxg==
X-Received: by 2002:adf:fe47:0:b0:31a:b3aa:d19b with SMTP id m7-20020adffe47000000b0031ab3aad19bmr1937928wrs.23.1694605817854;
        Wed, 13 Sep 2023 04:50:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3b50:bca5:a754:7463])
        by smtp.gmail.com with ESMTPSA id j14-20020adfd20e000000b0031fc4c31d77sm1932689wrh.88.2023.09.13.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:50:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/5] gpio: remove gpiod_toggle_active_low()
Date:   Wed, 13 Sep 2023 13:49:56 +0200
Message-Id: <20230913115001.23183-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The semantics of gpiod_toggle_active_low() are just bad and in almost
all cases require users to check the current state anyway. Let's replace
it with something clearer and more useful.

For getting this upstream: I'm thinking that I should apply patch 1/5,
provide other subsystems with an immutable tag and then we can apply
patch 5/5 for the next release once first four are in master.

Bartosz Golaszewski (5):
  gpiolib: provide gpiod_set_active_[low/high]()
  mtd: rawnand: ingenic: use gpiod_set_active_high()
  mmc: slot-gpio: use gpiod_set_active_[low|high]()
  platform/x86: int3472/discrete: use gpiod_set_active_low()
  gpiolib: remove gpiod_toggle_active_low()

 drivers/gpio/gpiolib.c                        | 21 ++++++++++++++-----
 drivers/mmc/core/slot-gpio.c                  | 11 +++++-----
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  5 ++---
 .../x86/intel/int3472/clk_and_regulator.c     |  2 +-
 drivers/platform/x86/intel/int3472/led.c      |  2 +-
 include/linux/gpio/consumer.h                 | 11 ++++++++--
 6 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.39.2

