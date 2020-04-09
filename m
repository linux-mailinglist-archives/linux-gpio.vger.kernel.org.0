Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 197EE1A3ADD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 21:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgDIT67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 15:58:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:22248 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgDIT67 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 15:58:59 -0400
IronPort-SDR: /beagUr4RAmCX2EMfEnZyLvfpPgFL5hv/BgNh0XOXJX2Vhe3PWMxsbeEIokEZy2hHi13aciLSL
 IkasNdfZa5TA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 12:58:59 -0700
IronPort-SDR: 5ugSmUDX84qekkZihqgqKgPZHq4JNVNb3vsJWkZtPUTvlhAYGaTaqD8CAnpZGibxC3K+ZIvWIx
 inHUo4KIxJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242745271"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:58:57 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 00/16] ASoC/SOF/clk/gpio/dt: add Hifiberry DAC+ PRO support
Date:   Thu,  9 Apr 2020 14:58:25 -0500
Message-Id: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Hifiberry DAC+ / DAC+ PRO is supported in the Raspberry PI tree
but until now not in the mainline and not for ACPI platforms.

This patchset implements the recommendations suggested by Mark Brown
back in 2018: first add a gpiochip in the PCM512x codec driver, then
use these gpios from a clock driver and the machine driver.

Since this patchset relies on different subsystems, sending as RFC for
now. I chose to import the original code from the Raspberry PI tree as
is, and add my changes on top. If there is a preference to squash the
changes that'd be fine. I also don't know if I should split this
series in two, one for ASoC and one for clk changes?

This patchset does not add changes to the sound/soc/bcm machine
drivers, but that should be trivial once all the gpio/clock is
available.

Thanks to Andy Shevchenko for his help navigating the gpio subsystem
and flagging mistakes in the use of lookup tables, and to Rob Herring
for pointers on the DT bindings verification tools.

Daniel Matuschek (1):
  clk: hifiberry-dacpro: initial import

Pierre-Louis Bossart (15):
  ASoC: pcm512x: expose 6 GPIOs
  ASoC: pcm512x: use "sclk" string to retrieve clock
  ASoC: Intel: sof-pcm512x: use gpiod for LED
  ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+ PRO
  ASoC: Intel: sof-pcm512x: reconfigure sclk in hw_params if needed
  ASoC: Intel: sof-pcm512x: select HIFIBERRY_DACPRO clk
  clk: hifiberry-dacpro: update SDPX/copyright
  clk: hifiberry-dacpro: style cleanups, use devm_
  clk: hifiberry-dacpro: add OF dependency
  clk: hifiberry-dacpro: transition to _hw functions
  clk: hifiberry-dacpro: add ACPI support
  clk: hifiberry-dacpro: add "sclk" lookup
  clk: hifiberry-dacpro: toggle GPIOs on prepare/unprepare
  clk: hifiberry-dacpro: add delay on clock prepare/deprepare
  ASoC: dt-bindings: add document for Hifiberry DAC+ PRO clock

 .../bindings/sound/hifiberry-dacpro.yaml      |  38 +++
 drivers/clk/Kconfig                           |   4 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-hifiberry-dacpro.c            | 284 ++++++++++++++++++
 sound/soc/codecs/pcm512x.c                    | 134 ++++++++-
 sound/soc/intel/boards/Kconfig                |   2 +
 sound/soc/intel/boards/sof_pcm512x.c          | 190 +++++++++++-
 7 files changed, 635 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/hifiberry-dacpro.yaml
 create mode 100644 drivers/clk/clk-hifiberry-dacpro.c


base-commit: dd8e871d4e560eeb8d22af82dde91457ad835a63
-- 
2.20.1

