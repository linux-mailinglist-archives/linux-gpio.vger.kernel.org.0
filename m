Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675A049B6D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFRHqi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:46:38 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19625 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRHqi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896dc0000>; Tue, 18 Jun 2019 00:46:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:46:35 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:35 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:35 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896d90001>; Tue, 18 Jun 2019 00:46:35 -0700
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
Subject: [PATCH V3 00/17] SC7 entry and exit support for Tegra210
Date:   Tue, 18 Jun 2019 00:46:14 -0700
Message-ID: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560843996; bh=MwvRLxgw/Ex+WgwWlRPTWg792Ydrvex5zgIQoYyWuCY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=c2n0y9rs3Lp6RAkxbHP0NVsS9Afbf0+QNHDjBb03WEfZzNWMX3bKkUcBDfVVpRgFp
         N2bSO+vMXIZb4dbTW9InLYUJ/TbzuWqfGzkd/+35dyzTqKBj+ZzirF5Xql52PBwsee
         SwRczKxMd/gPnI+yYP8ciwJ0EZNt1fcAdlPJ1e6MfrrxzH0IRN6Ow+JjCfUjZwYoSF
         gHOWe3WxdJjL+SkdZ7ozWLr7HZhYnq47X7+YmTaCkbhjsX7G14j2T4g6gUnL4uSxwa
         zjJuOeehwbpW4cfYUlM7DZRavE1oT5GGWN8ZGs+PvPKlBLYXmHqToryZUZMrDViuzZ
         XzmzOjltYAEDw==
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


Sowjanya Komatineni (17):
  irqchip: tegra: do not disable COP IRQ during suspend
  pinctrl: tegra: add suspend and resume support
  gpio: tegra: use resume_noirq for tegra gpio resume
  clk: tegra: save and restore divider rate
  clk: tegra: pllout: save and restore pllout context
  clk: tegra: pll: save and restore pll context
  clk: tegra: save and restore CPU and System clocks context
  clk: tegra: add support for peripheral clock suspend and resume
  clk: tegra: support for saving and restoring OSC clock context
  clk: tegra: add suspend resume support for DFLL
  clk: tegra210: support for Tegra210 clocks suspend and resume
  soc/tegra: pmc: allow support for more tegra wake
  soc/tegra: pmc: add pmc wake support for tegra210
  arm64: tegra: enable wake from deep sleep on RTC alarm.
  soc/tegra: pmc: configure core power request polarity
  soc/tegra: pmc: configure deep sleep control settings
  arm64: dts: tegra210-p2180: Jetson TX1 SC7 timings

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
 drivers/clk/tegra/clk-dfll.c                   |  78 +++++++++
 drivers/clk/tegra/clk-dfll.h                   |   2 +
 drivers/clk/tegra/clk-divider.c                |  23 +++
 drivers/clk/tegra/clk-pll-out.c                |  28 ++++
 drivers/clk/tegra/clk-pll.c                    | 115 +++++++++----
 drivers/clk/tegra/clk-tegra-fixed.c            |  14 ++
 drivers/clk/tegra/clk-tegra-super-gen4.c       |   4 -
 drivers/clk/tegra/clk-tegra210.c               | 218 ++++++++++++++++++++++++-
 drivers/clk/tegra/clk.c                        | 150 ++++++++++++++++-
 drivers/clk/tegra/clk.h                        |  29 +++-
 drivers/gpio/gpio-tegra.c                      |  17 +-
 drivers/irqchip/irq-tegra.c                    |  21 ++-
 drivers/pinctrl/tegra/pinctrl-tegra.c          |  62 +++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h          |   5 +
 drivers/pinctrl/tegra/pinctrl-tegra114.c       |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra124.c       |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c        |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c       |  13 ++
 drivers/pinctrl/tegra/pinctrl-tegra30.c        |   1 +
 drivers/soc/tegra/pmc.c                        | 143 +++++++++++++++-
 22 files changed, 880 insertions(+), 58 deletions(-)

-- 
2.7.4

