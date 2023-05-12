Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D9B700A22
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 16:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbjELOSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 10:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241497AbjELOSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 10:18:13 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F7413C02
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 07:17:59 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3063208beedso9557290f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683901077; x=1686493077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrJxMU8vIMHm/TMwdpWrRCixZQfDd4ErxxMWxBnxsIw=;
        b=xsWSJes1/LDFaZJmw5SGhHwYE3xlBrAEX7eqH6b8Gsbuof6UB2KjGVk1gNwLXvNMUZ
         y757ReyoLYsWKwMnCITiGnkPSvyqXS9H3TG8rUxuOTR+2dI9goQdiiyVT32XZon2F8oG
         AWpFJt8CfCw9DK9VGT1PXZVxijHEpGuxaqCpGmklOnA1bE49qNdjDRth5NbYp0kqyA21
         eNm1/b68d0+wg96IClikVvcqJSwB6FTj0AaeSKdkwQO6sv1zqpemPIFNR7fmFBPr+NZi
         tZqt8rlQEzqXtq6xfAIBfJFhFeLJIhcEJW6WVIOAU2EQrzemVvMyvHcbCxBgn35AKw9s
         q7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683901077; x=1686493077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrJxMU8vIMHm/TMwdpWrRCixZQfDd4ErxxMWxBnxsIw=;
        b=Ftby/4XdOnxZc8Q5+hXNfIfkWgJ4K6hbxCJsVZejf/0i7LYCtPkkO7dD8TpbHgGX3O
         2UwSy8THDd3giLdjRoAjcTS7Zkvp50H4McK8tF/yHeCcBrE3pDr4ys1SsfRaa/E1l/es
         We3kBODj90iDeQfsb6GovKASCwRAIjrtaCWbkUK25Bw0shEhciShg9uB6mMyd8HN9HYH
         uf92rmzvVl0qShs08057AyqvUoa6fZ2EqbeIGyc/P0RJTKQv1OMQffyqdhvYfwHw64a7
         5bsHUGiV9Pt02y/jQJ9P+DAEYTBZKpPhNcoHjmVjG9kTvVEFhelgP2dv7cU9IOP57/yu
         d5mQ==
X-Gm-Message-State: AC+VfDxyOyWS+BkXiuInkA9PiKmhsooBRGlIHuYzrKQkeGQ4/PwZVYr8
        XfvWH2iRuxXK8xfg8Wm6o7tcFQ==
X-Google-Smtp-Source: ACHHUZ5Dam+p3j2mO7hOPDi7EwOapz3Q9dzuaFpo1CqgC96qPBKIszszLRwntx88jEu+00Gim4jxxA==
X-Received: by 2002:a5d:6dce:0:b0:306:db7b:bb2d with SMTP id d14-20020a5d6dce000000b00306db7bbb2dmr17042012wrz.38.1683901077543;
        Fri, 12 May 2023 07:17:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:28d:66d0:c0c4:a67e:f152:1413])
        by smtp.gmail.com with ESMTPSA id r12-20020a5d494c000000b003077f3dfcc8sm22819982wrs.32.2023.05.12.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 07:17:57 -0700 (PDT)
From:   Esteban Blanc <eblanc@baylibre.com>
To:     linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, jpanis@baylibre.com,
        jneanne@baylibre.com, aseketeli@baylibre.com, eblanc@baylibre.com,
        sterzik@ti.com, u-kumar1@ti.com
Subject: [PATCH v4 0/3] TI TPS6594 PMIC support (RTC, pinctrl, regulators)
Date:   Fri, 12 May 2023 16:17:52 +0200
Message-Id: <20230512141755.1712358-1-eblanc@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

TPS6594 is a Power Management IC which provides regulators and others
features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
PFSM (Pre-configurable Finite State Machine). The SoC and the PMIC can
communicate through the I2C or SPI interfaces.
TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.

This series adds support to TI TPS6594 PMIC and its derivatives.

This should be applied on top of other patch series:
- https://lore.kernel.org/all/20230406075622.8990-1-jpanis@baylibre.com/
  For core MFD driver

The features implemented in this series are:
- RTC (child device)
- Pinmux/GPIO (child device)
- Regulator (child device)

RTC description:
The TPS6594 family has an RTC built-in, except for LP8764.
It provides time and an alarm.

Pinmux/GPIO:
TPS6594 family has 11 GPIOs. Those GPIO can also serve different
functions such as I2C or SPI interface, watchdog disable functions.
The driver provides both pinmuxing for the functions and GPIO capability.

Regulator:
TPS6594/TPS6593: 5 BUCKs and 4LDOs
LP8764: 4 BUCKs and no LDO
Bucks can be used in multipahse mode.

Changes since v1:
https://lore.kernel.org/all/20230224133129.887203-1-eblanc@baylibre.com/
Rtc:
- Removed struct tps6594_rtc.
- Removed some dev_err messages.
- Removed some comments.
- Remove some whitespaces in comments and error messages.
- Check if RTC is running before reading a timestamp in read_rtc.
- Stop RTC at the end of probe to wait for a timestamp to be set.
- Add default MFD_TPS6594 to Kconfig.

Pinctrl:
- Removed #define DEBUG.
- Add default MFD_TPS6594 to Kconfig.
- Fix typo and reword help message of Kconfig.

Regulators:
Further to Mark Brown review:
- File header whole block C++ style.
- Configuring modes not supported: omit all mode operations
- Log the error before notifying.
- Request the interrupts while registering the regulators (then remove
  the lookup function).
Further to Matti review:
- Postponed: devm_regulator_irq_helper() and
  regulator_irq_map_event_simple() can probably be used but code.
  refactoring is not so trivial. This can be done later as an enhancement
  after this patch list is merged.
Buck Multi phase management:
- Multiphase property can take an array when 2 multi phase buck, buck12
  and buck34.
- Configuration multi phase buck34 without multiphase buck12 is not
  supported (when only one multiphase, must be buck12). Not clear from the
  spec but confirmed by TI.
- Supported multiphase conficurations: buck12, buck123, buck1234,
  buck12 + buck34.
- All interrupts are attached to the multiphase buck (ie: for regulator
  buck12, buck1 & buck2 interrupts are registered).

Changes since v2:
https://lore.kernel.org/all/20230328091448.648452-1-eblanc@baylibre.com/
Rtc:
- Add logic to avoid reinitializing a working clock.
- Fix some multiline comments format.

Regulators:
Further to Mark Brown review:
- Log the error before notifying.
- Request the interrupts while registering the regulators.
Further to Krzysztof Kozlowski:
https://lore.kernel.org/all/75f0a18d-aed9-8610-2925-4e604b4b0241@baylibre.com/
- Remove ti, multi-phase-id property which is redundant with buck dts naming
  rules.

Changes since v3:
https://lore.kernel.org/lkml/20230414101217.1342891-1-eblanc@baylibre.com/
RTC:
- Add wakeup source

Pinctrl:
- Switch to GPIO_REGMAP framework

Esteban Blanc (2):
  rtc: tps6594: Add driver for TPS6594 RTC
  pinctrl: tps6594: Add driver for TPS6594 pinctrl and GPIOs

Jerome Neanne (1):
  regulator: tps6594-regulator: Add driver for TI TPS6594 regulators

 drivers/pinctrl/Kconfig               |  31 ++
 drivers/pinctrl/Makefile              |   2 +
 drivers/pinctrl/pinctrl-tps6594.c     | 301 +++++++++++++
 drivers/regulator/Kconfig             |  13 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/tps6594-regulator.c | 620 ++++++++++++++++++++++++++
 drivers/rtc/Kconfig                   |   9 +
 drivers/rtc/Makefile                  |   1 +
 drivers/rtc/rtc-tps6594.c             | 479 ++++++++++++++++++++
 include/linux/mfd/tps6594.h           |   3 +-
 10 files changed, 1459 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/pinctrl-tps6594.c
 create mode 100644 drivers/regulator/tps6594-regulator.c
 create mode 100644 drivers/rtc/rtc-tps6594.c

-- 
2.39.2

