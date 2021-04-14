Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDC735F490
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 15:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhDNNM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 09:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbhDNNM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 09:12:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5F7C061574
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 06:12:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x4so23668501edd.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vRUDKBR7RwkkTXgZ+sUsbwVfdbHWNU9ESm88Dqvkblg=;
        b=Z78a49v7+PWNoXCt2G+P7mD5Bje1NVfIXaUAnp/s74Fh0tMgIh5qZLBKAIfvh2LuoQ
         rB+FjCghvIxW9JSkWdnMIjzY7Jhr8eaooqoR4PLDASf0hnBF5hVXTKvV6LP0j9Q7Pr+a
         xEVRnnF7rHB4Ae5KkvtrhT59u5W0nzZuPeEoQ/61nBkwErKhPyBNHwJZj0qmq0WmHjxq
         HsL2RinDYvbidfZq2/2UDkrBIJE94fkYg9+EaYxgTgclLH0nbp5Utk8EuktnT3SDxhGp
         6+z8tJpqbNFmQhnySe7pXth1q/I5D8S4ZYlieBmpQlGRY8V0g7Pd4cEhfpokQyDQ4bCm
         tfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vRUDKBR7RwkkTXgZ+sUsbwVfdbHWNU9ESm88Dqvkblg=;
        b=qLlt+dlij/NWF+MigfExIIRWlqVMjK0ssMv7MVdztw4diYc1Mq0nvh/pockkQiBkz4
         X4kQlARz6wN6DjUOt46mvTPAaEpJ87AJxoimiMqzib4veDWB+bmr+uQ3q6yAgiiveFkt
         VK2U1E6cxSICCrXKjMwiWOf8EsZTMH8rVpXwbJoRqRoo217xqb43RRmc8QWB58Mjwdqs
         l3AdCBH+PCM6ePdRHKE/g97yR7FEIePmmyispaxGZ4cPmEWS2z/XwMMhRPGjdk73lmYP
         J6ojBEONJ2A8uvZsHb96vMVw4T3KzvEN0GuMtJ5Lh5pFTQplnBZm+JEkRqFFizy1sotx
         o9LQ==
X-Gm-Message-State: AOAM533qIoAjmria/WWdyDolK2E99pnf+YVukcXA48bNcSC1A+d9PNmB
        vA3msf+NfsN4inEbM0zT8vevwg==
X-Google-Smtp-Source: ABdhPJwn/rS2SfHF2VYdBHuVepuPkQv9wfCzaDCvZDOk0dS2tnN1gLRWPu+ZHWIj0/0V1hUU231VXg==
X-Received: by 2002:a05:6402:42c8:: with SMTP id i8mr40924106edc.386.1618405920522;
        Wed, 14 Apr 2021 06:12:00 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id 1sm1095942ejt.95.2021.04.14.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:12:00 -0700 (PDT)
Date:   Wed, 14 Apr 2021 14:11:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Clock, GPIO, Regulator and
 RTC due for the v5.13 merge window
Message-ID: <20210414131158.GN4869@dell>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Please note that this PR will break your build unless you have the
required Regulator API update.

 fb8fee9efdcf0 regulator: Add regmap helper for ramp-delay setting
 e3baacf542756 regulator: helpers: Export helper voltage listing

Pull at your peril! :)

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-clk-gpio-regulator-rtc-v5.13

for you to fetch changes up to 5a8a64d9a38b9d3794f9f5e153fc0358b858cc24:

  MAINTAINERS: Add ROHM BD71815AGW (2021-04-14 10:21:43 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Clock, GPIO, Regulator and RTC due for the v5.13 merge window

----------------------------------------------------------------
Matti Vaittinen (16):
      rtc: bd70528: Do not require parent data
      mfd: bd718x7: simplify by cleaning unnecessary device data
      dt_bindings: bd71828: Add clock output mode
      dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
      dt_bindings: mfd: Add ROHM BD71815 PMIC
      mfd: Add ROHM BD71815 ID
      mfd: Sort ROHM chip ID list for better readability
      mfd: Support for ROHM BD71815 PMIC core
      gpio: Support ROHM BD71815 GPOs
      regulator: rohm-regulator: linear voltage support
      regulator: rohm-regulator: Support SNVS HW state.
      regulator: bd718x7, bd71828: Use ramp-delay helper
      regulator: Support ROHM BD71815 regulators
      clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
      rtc: bd70528: Support RTC on ROHM BD71815
      MAINTAINERS: Add ROHM BD71815AGW

 .../devicetree/bindings/mfd/rohm,bd71815-pmic.yaml | 201 +++++++
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml |   6 +
 .../bindings/regulator/rohm,bd71815-regulator.yaml | 116 ++++
 MAINTAINERS                                        |   3 +
 drivers/clk/clk-bd718x7.c                          |   9 +-
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-bd71815.c                        | 185 ++++++
 drivers/mfd/Kconfig                                |  15 +-
 drivers/mfd/rohm-bd71828.c                         | 486 +++++++++++----
 drivers/mfd/rohm-bd718x7.c                         |  43 +-
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/bd71815-regulator.c              | 652 +++++++++++++++++++++
 drivers/regulator/bd71828-regulator.c              |  51 +-
 drivers/regulator/bd718x7-regulator.c              |  60 +-
 drivers/regulator/rohm-regulator.c                 |  23 +-
 drivers/rtc/Kconfig                                |   6 +-
 drivers/rtc/rtc-bd70528.c                          | 104 ++--
 include/linux/mfd/rohm-bd71815.h                   | 562 ++++++++++++++++++
 include/linux/mfd/rohm-bd71828.h                   |   3 +
 include/linux/mfd/rohm-bd718x7.h                   |  13 -
 include/linux/mfd/rohm-generic.h                   |  15 +-
 23 files changed, 2286 insertions(+), 290 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71815.c
 create mode 100644 drivers/regulator/bd71815-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71815.h

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
