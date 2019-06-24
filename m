Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F0F4FF9C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 05:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfFXDDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 23:03:07 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13165 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfFXDDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 23:03:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d103d670001>; Sun, 23 Jun 2019 20:03:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 23 Jun 2019 20:03:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 23 Jun 2019 20:03:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 03:03:03 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 03:03:03 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Jun 2019 03:03:03 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.126]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d103d650000>; Sun, 23 Jun 2019 20:03:03 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V4 00/18] SC7 entry and exit support for Tegra210
Date:   Sun, 23 Jun 2019 20:02:41 -0700
Message-ID: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561345383; bh=FXKH8IMDorFgav/DVdwP1OzQMzFRRIOPr/T/3uTyBFU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=IpCOSL/++rOP3zioi/NBgfIA6zsHbAjJJ24ukprP13lUzOAxnN2GiEvaiwmb7w58E
         qGSq8jMusbPDKl4Y+9zQ4eoYjiK6uhKJP27/EKvf4k6iI+w8JwEVASr9LMjSGmf2Uz
         Q6wy8Dc8uWeSkGCumppxlCCJ6g9q7UXdvsQ23SzlxoXpy+Xc6iLxrzN8UJJ4+xlzaj
         8sSGNG6Teyuk6/EBLuG7asHCddGLsKy57KfSbsXjljUQ/BqdJSodLg0meOj4YLLQ1t
         smhCJYwoGq7P031IaID+NefAxIec7M3i4rqYRT0w3uoLCgjhL3kaJiMLKZbPraX5q7
         /Yjnmdo8DUV7Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series includes Tegra210 deepsleep support with RTC alarm
wake event.

This series also includes save and restore of PLLs, clocks, OSC contexts
for deepsleep exit to normal operation.

This patch series doesn't support 100% suspend/resume to allow fully
functional state upon resume and we are working on some more drivers suspend
and resume implementations.

[V4]: Changes between V3 & V4 are
	- V3 feedback fixes
	- Removed park bits clear for EMMC pads in pinctrl-tegra driver
	  function tegra_pinctrl_clear_parked_bits as based on V3 feedback
	  parked_bit is updated to parked_bitmask to use with DRV_PINGROUP
	  as well and thierry posted patch series for this.
	- Implemented all peripheral clocks save and restore through their
	  corresponding clk_ops save_context and restore_context and removed
	  all direct registers store and restore in clk-tegra210 driver.
	- Created separate patch for fence_delay update during PLLU init based
	  on V3 feedback.
	- Added more comments in tegra210_clk_resume regarding dfll restore
	  sequence and its dependency on peripheral clocks restore.

[V3]: Changes between V2 & V3 are
	- V2 feedback fixes
	- GPIO restore should happen prior to Pinctrl restore to prevent
	  glitch on GPIO lines. So using resume_noirq for gpio tegra to allow
	  gpio resume prior to pinctrl resume.
	- Implemented save_context and restore_context callbacks for clock
	  plls, pll outs and dividers in corresponding drivers.
	  Note: Peripheral clocks and clock enable and reset need to be in
	  Tegra210 clock suspend/resume as they need to be in proper sequence
	  w.r.t DFLL resume for restoring CPU clock.
	- Removed gpio-tegra changes for hierarchical support to have PMC as
	  parent to GPIOs for GPIO wake event support. Thierry is working on
	  gpiolib for some cleanup before adding hierarchical support. So
	  holding on to GPIO wake support for now.

[V2] : V1 feedback fixes
	Patch 0002: This version still using syscore. Thierry suggest not to
	use syscore and waiting on suggestion from Linux Walleij for any better
	way of storing current state of pins before suspend entry and restoring
	them on resume at very early stage. So left this the same way as V1 and
	will address once I get more feedback on this.
	Also need to findout and implement proper way of forcing resume order
	between pinctrl and gpio driver.

[V1]:	Tegra210 SC7 entry and exit thru RTC wake and Power button GPIO wake
	using hierarchical IRQ with PMC as parent to GPIO.



Sowjanya Komatineni (18):
  irqchip: tegra: do not disable COP IRQ during suspend
  pinctrl: tegra: add suspend and resume support
  gpio: tegra: use resume_noirq for tegra gpio resume
  clk: tegra: save and restore divider rate
  clk: tegra: pllout: save and restore pllout context
  clk: tegra: pll: save and restore pll context
  clk: tegra: save and restore CPU and System clocks context
  clk: tegra: support for saving and restoring OSC context
  clk: tegra: add suspend resume support for DFLL
  clk: tegra: add save and restore context support for peripheral clocks
  clk: tegra210: use fence_udelay during PLLU init
  clk: tegra210: support for Tegra210 clocks suspend and resume
  soc/tegra: pmc: allow support for more tegra wake
  soc/tegra: pmc: add pmc wake support for tegra210
  arm64: tegra: enable wake from deep sleep on RTC alarm.
  soc/tegra: pmc: configure core power request polarity
  soc/tegra: pmc: configure deep sleep control settings
  arm64: dts: tegra210-p2180: Jetson TX1 SC7 timings

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
 drivers/clk/tegra/clk-dfll.c                   |  78 ++++++++++++++
 drivers/clk/tegra/clk-dfll.h                   |   2 +
 drivers/clk/tegra/clk-divider.c                |  23 ++++
 drivers/clk/tegra/clk-periph-fixed.c           |  31 ++++++
 drivers/clk/tegra/clk-periph-gate.c            |  34 ++++++
 drivers/clk/tegra/clk-periph.c                 |  43 ++++++++
 drivers/clk/tegra/clk-pll-out.c                |  28 +++++
 drivers/clk/tegra/clk-pll.c                    | 115 ++++++++++++++------
 drivers/clk/tegra/clk-sdmmc-mux.c              |  30 ++++++
 drivers/clk/tegra/clk-tegra-fixed.c            |  14 +++
 drivers/clk/tegra/clk-tegra-super-gen4.c       |   4 -
 drivers/clk/tegra/clk-tegra210.c               | 123 +++++++++++++++++++--
 drivers/clk/tegra/clk.c                        |  94 ++++++++++++++++
 drivers/clk/tegra/clk.h                        |  35 +++++-
 drivers/gpio/gpio-tegra.c                      |   5 +-
 drivers/irqchip/irq-tegra.c                    |  20 +++-
 drivers/pinctrl/tegra/pinctrl-tegra.c          |  47 ++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h          |   4 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c       |   6 ++
 drivers/soc/tegra/pmc.c                        | 143 ++++++++++++++++++++++++-
 22 files changed, 838 insertions(+), 53 deletions(-)

-- 
2.7.4

