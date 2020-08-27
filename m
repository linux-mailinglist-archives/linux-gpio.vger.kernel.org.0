Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E9B254D54
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 20:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0S6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 14:58:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbgH0S6n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 14:58:43 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AD122087E;
        Thu, 27 Aug 2020 18:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554722;
        bh=LFqs81pjV2AB3heJBIp/bGnwvU4OW/BsN3exXdyoSeM=;
        h=From:To:Cc:Subject:Date:From;
        b=HW69DhahnMu9OGAvNDhOxukWgSSVgLl/Myb1Jn+vEEYvdZD0VqFSJOhCKtOkiYkkm
         tekKhLyHLEkQ433QJNohEYs3MafMf1pgdGhWoZBwvxVqFAi9CnLp0SCgkR94M1uNEY
         iiFpoaQ4URBW7Gc3THkloyK9RSGmORNSvrzFRJOA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 01/27] Input: Simplify with dev_err_probe()
Date:   Thu, 27 Aug 2020 20:58:02 +0200
Message-Id: <20200827185829.30096-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Changes since v2:
1. Add review tags,
2. Fixes after review (see individual patches).
3. Two new patches - 26 and 27.


Best regards,
Krzysztof



Krzysztof Kozlowski (27):
  Input: gpio_keys_polled - Simplify with dev_err_probe()
  Input: gpio-vibra - Simplify with dev_err_probe()
  Input: pwm-beeper - Simplify with dev_err_probe()
  Input: pwm-vibra - Simplify with dev_err_probe()
  Input: rotary_encoder - Simplify with dev_err_probe()
  Input: elan_i2c - Simplify with dev_err_probe()
  Input: bu21013_ts - Simplify with dev_err_probe()
  Input: bu21029_ts - Simplify with dev_err_probe()
  Input: chipone_icn8318 - Simplify with dev_err_probe()
  Input: cy8ctma140 - Simplify with dev_err_probe()
  Input: edf-ft5x06 - Simplify with dev_err_probe()
  Input: ektf2127 - Simplify with dev_err_probe()
  Input: elants_i2c - Simplify with dev_err_probe()
  Input: goodix - Simplify with dev_err_probe()
  Input: melfas_mip4 - Simplify with dev_err_probe()
  Input: pixcir_i2c_ts - Simplify with dev_err_probe()
  Input: raydium_i2c_ts - Simplify with dev_err_probe()
  Input: resistive-adc-touch - Simplify with dev_err_probe()
  Input: silead - Simplify with dev_err_probe()
  Input: sis_i2c - Simplify with dev_err_probe()
  Input: surface3_spi - Simplify with dev_err_probe()
  Input: sx8643 - Simplify with dev_err_probe()
  Input: bcm-keypad - Simplify with dev_err_probe()
  gpio: Add devm_fwnode_gpiod_get_optional() helpers
  Input: gpio_keys - Simplify with dev_err_probe()
  Input: bu21013_ts - Use local 'client->dev' variable in probe()
  Input: bu21029_ts - Use local 'client->dev' variable in probe()

 drivers/gpio/gpiolib-devres.c                 | 71 ++++++++++++++++++
 drivers/input/keyboard/bcm-keypad.c           | 14 ++--
 drivers/input/keyboard/gpio_keys.c            | 25 +++----
 drivers/input/keyboard/gpio_keys_polled.c     |  8 +--
 drivers/input/misc/gpio-vibra.c               | 20 ++----
 drivers/input/misc/pwm-beeper.c               | 19 ++---
 drivers/input/misc/pwm-vibra.c                | 20 ++----
 drivers/input/misc/rotary_encoder.c           |  8 +--
 drivers/input/mouse/elan_i2c_core.c           |  9 +--
 drivers/input/touchscreen/bu21013_ts.c        | 72 ++++++++-----------
 drivers/input/touchscreen/bu21029_ts.c        | 53 ++++++--------
 drivers/input/touchscreen/chipone_icn8318.c   |  8 +--
 drivers/input/touchscreen/cy8ctma140.c        |  8 +--
 drivers/input/touchscreen/edt-ft5x06.c        | 10 +--
 drivers/input/touchscreen/ektf2127.c          |  8 +--
 drivers/input/touchscreen/elants_i2c.c        | 22 ++----
 drivers/input/touchscreen/goodix.c            | 40 +++--------
 drivers/input/touchscreen/melfas_mip4.c       |  9 +--
 drivers/input/touchscreen/pixcir_i2c_ts.c     | 38 ++++------
 drivers/input/touchscreen/raydium_i2c_ts.c    | 30 +++-----
 .../input/touchscreen/resistive-adc-touch.c   |  8 +--
 drivers/input/touchscreen/silead.c            |  8 +--
 drivers/input/touchscreen/sis_i2c.c           | 20 ++----
 drivers/input/touchscreen/surface3_spi.c      | 13 +---
 drivers/input/touchscreen/sx8654.c            | 10 +--
 include/linux/gpio/consumer.h                 | 30 ++++++++
 26 files changed, 253 insertions(+), 328 deletions(-)

-- 
2.17.1

