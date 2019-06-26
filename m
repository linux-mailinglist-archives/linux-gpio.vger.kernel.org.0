Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F2056516
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFZJGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:06:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43457 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZJGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so1752581wru.10
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mNkBOhUSKZktXVzPgYHzPfOcBUciHYL1qLyKm8m40Ho=;
        b=EmhhuBkjS/9rAtIkcIwpIcgZ3Gwn0zrnRkXyLjCQGmjeXCOilfqZFNx1wo3/FJFa7U
         9Zf3mWYjuMWiSMztjZ+t0JkNLNA6+0NxTB0hHImzdVdROhyBF+N/VFwugbb1cfquvnDM
         GigBE7k6TeDt+uMKPhQ6uMbUFN9qCJoBpsLPJXOVwMC1otSloUNC73MuEtir+kHO0GpJ
         tf6H17PB/xAW7OUvxq1AdK5eoVwnr8vjho6yMVp+WQGfyPxn3AUJX6jitZCBLI+iwgR1
         Yv64S3XIM0zji9dq5d9l+SNyhHmrsz6JnPZIiYZwTnGRwGDwbOdd2uQvWaS+1r9FPz7r
         kYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mNkBOhUSKZktXVzPgYHzPfOcBUciHYL1qLyKm8m40Ho=;
        b=jigFN7j1lPX1q1RBOOigHFw5dsuD9e+FTPXXsQ9bl4/jYHeD2uA6HKIjEVQSPq2tOJ
         RXS6yVPRRIpg7UhyJmNJHgg4sFHdtjQRb5e5cu7QU5TDDNbuD98R910DaPUhTq2xCE3A
         Cujrm86ZTexuqQ8O0kjyqv8i9moPZ4QVcFGXvmfj/yuf/RBJdOlLEipo4wLuI4Rre9tw
         pI/Fbq3AwnPS//DiaFSFPlEAPEUsK5OwQQdJc1WOi4+ZeTq2M3I3E6FHzqN33c6KQXK+
         AD5XPRq0bIQe2nVaoYdd0/9f+D8xdv/GFtAQr5CcWDsxGmNukGQotthPnbSn9xzSyWy6
         bQhA==
X-Gm-Message-State: APjAAAVZ+hQ7+Ql/HQwfsqFe/ApxImgNJWofWGOjOPrIS+Fegg0XYvgd
        AZyTlGTpfq66zfQqKb43YO8dQg==
X-Google-Smtp-Source: APXvYqwkO8aDGnvu8iP8rFMRwxiWuy/j1doyJakOZ/B3vub9BJrH3obe1f2ZF8drEhnPsKEo5ODJtQ==
X-Received: by 2002:adf:afde:: with SMTP id y30mr2683421wrd.197.1561539996153;
        Wed, 26 Jun 2019 02:06:36 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:35 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 00/14] arm64: g12a: add support for DVFS
Date:   Wed, 26 Jun 2019 11:06:18 +0200
Message-Id: <20190626090632.7540-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
cpu_clk / cpub_clk
|   \- cpu_clk_dyn
|      |  \- cpu_clk_premux0
|      |        |- cpu_clk_postmux0
|      |        |    |- cpu_clk_dyn0_div
|      |        |    \- xtal/fclk_div2/fclk_div3
|      |        \- xtal/fclk_div2/fclk_div3
|      \- cpu_clk_premux1
|            |- cpu_clk_postmux1
|            |    |- cpu_clk_dyn1_div
|            |    \- xtal/fclk_div2/fclk_div3
|            \- xtal/fclk_div2/fclk_div3
\ sys_pll / sys1_pll

This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
the CPU clock in a safe way as recommended by the vendor Documentation
and reference code.

This patchset :
- introduces needed core and meson clk changes
- adds support for the G12B second cluster clock measurer ids
- protects clock measurer from cooncurent measures
- adds the clock notifiers
- moves the G12A DT to a common g12a-common dtsi
- adds the G12A and G12B OPPs
- enables DVFS on all supported boards

Dependencies:
- PWM AO input order fix at [1]
- PWM enhancements from Martin at [2]

Changes since RFT/RFC v1 at [3]:
- Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
- Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
- Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
- Fixed typo in "this the current path" in g12a.c
- Fixed G12B dtsi by adding back the sdio quirk
- Fixed G12A dtsi unwanted sdio quirk removal
- Fixed various checkpatch errors

[1] https://patchwork.kernel.org/patch/11006835/
[2] https://patchwork.kernel.org/patch/11006835/
[3] https://patchwork.kernel.org/cover/11006929/

Neil Armstrong (14):
  pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
  clk: core: introduce clk_hw_set_parent()
  clk: meson: regmap: export regmap_div ops functions
  clk: meson: eeclk: add setup callback
  soc: amlogic: meson-clk-measure: protect measure with a mutex
  soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B
  arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi
  arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
  arm64: dts: meson-g12a: add cpus OPP table
  arm64: dts: meson-g12a: enable DVFS on G12A boards
  arm64: dts: meson-g12b: add cpus OPP tables
  arm64: dts: meson-g12b-odroid-n2: enable DVFS

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 2464 ++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |   55 +
 .../boot/dts/amlogic/meson-g12a-u200.dts      |   55 +
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |   52 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 2502 +----------------
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |   96 +
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  145 +-
 drivers/clk/clk.c                             |    6 +
 drivers/clk/meson/clk-regmap.c                |   10 +-
 drivers/clk/meson/clk-regmap.h                |    5 +
 drivers/clk/meson/g12a.c                      |  500 +++-
 drivers/clk/meson/meson-eeclk.c               |    6 +
 drivers/clk/meson/meson-eeclk.h               |    1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |    9 +
 drivers/soc/amlogic/meson-clk-measure.c       |   14 +-
 include/dt-bindings/clock/g12a-clkc.h         |    1 +
 include/linux/clk-provider.h                  |    1 +
 17 files changed, 3439 insertions(+), 2483 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi

-- 
2.21.0

