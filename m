Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272442D1FA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfE1XJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9103 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfE1XJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8b0000>; Tue, 28 May 2019 16:08:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:08:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 May 2019 16:08:59 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:58 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:08:58 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8a0000>; Tue, 28 May 2019 16:08:58 -0700
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
        <devicetree@vger.kernel.org>
Subject: [PATCH V2 00/12] LP0 entry and exit support for Tegra210
Date:   Tue, 28 May 2019 16:08:44 -0700
Message-ID: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084939; bh=2b+AWpz2HgNUfsfdegjeMuOpOlMUMPBF8kt06/8Whxg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=WmcwXPvawBckbzm/c86tcyg78+pLBn37oIG96jrkb0qfyiLK15R1mGS4NOgHtIOmv
         1FdH6CEG+YV0q0nmBt55XzpIEGcYVN5vnqXsla97HUSfKCN5BZA5MAlihZhewnyLo1
         UOtFDNw3Sn8CGaT+RG//2JDbc1anUNJ7oML2SoXVYhgvh4oFX5VMkmxCx2wrQzUJJB
         0o5ge373yp+KktSfKIJD9QyKdGZbLN/yacasRQ1BIYMaNvGGFdJzMKYfJ35Yzcy+qx
         TjU2xDGLN8UN7BFHguutxfliOELqr1BThk8kpY0I5j4//BhcYP7TLUiXQAHQt6+QoQ
         KTFjGc2UczfZA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series includes Tegra210 deepsleep/LP0 support with
deep sleep exit through RTC alarm wake and power button wake events.

Note: Wake on power button is through gpio-keys node in device tree.

This series also includes save and restore of PLLs, clocks, OSC contexts
for basic LP0 exit.

This patch series doesn't support 100% suspend/resume to allow fully
functional state upon resume and we are working on some more drivers suspend
and resume implementations.

[V2] : V1 feedback fixes
	Patch 0002: This version still using syscore. Thierry suggest not to
	use syscore and waiting on suggestion from Linux Walleij for any better
	way of storing current state of pins before suspend entry and restoring
	them on resume at very early stage. So left this the same way as V1 and
	will address once I get more feedback on this.
	Also need to findout and implement proper way of forcing resume order
	between pinctrl and gpio driver.


Sowjanya Komatineni (12):
  irqchip: tegra: do not disable COP IRQ during suspend
  pinctrl: tegra: add suspend and resume support
  clk: tegra: save and restore PLLs state for system
  clk: tegra: add support for peripheral clock suspend and resume
  clk: tegra: add support for OSC clock resume
  clk: tegra: add suspend resume support for DFLL clock
  clk: tegra: support for Tegra210 clocks suspend-resume
  soc/tegra: pmc: allow support for more tegra wake models
  soc/tegra: pmc: add pmc wake support for tegra210
  gpio: tegra: implement wake event support for Tegra210 and prior GPIO
  arm64: tegra: enable wake from deep sleep on RTC alarm.
  soc/tegra: pmc: configure tegra deep sleep control settings

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
 drivers/clk/tegra/clk-dfll.c                   |  82 ++++++
 drivers/clk/tegra/clk-dfll.h                   |   2 +
 drivers/clk/tegra/clk-divider.c                |  19 ++
 drivers/clk/tegra/clk-pll-out.c                |  25 ++
 drivers/clk/tegra/clk-pll.c                    |  99 +++++--
 drivers/clk/tegra/clk-tegra-fixed.c            |  16 ++
 drivers/clk/tegra/clk-tegra210.c               | 382 +++++++++++++++++++++++++
 drivers/clk/tegra/clk.c                        |  74 ++++-
 drivers/clk/tegra/clk.h                        |  13 +
 drivers/gpio/gpio-tegra.c                      | 116 +++++++-
 drivers/irqchip/irq-tegra.c                    |  22 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c          |  68 ++++-
 drivers/pinctrl/tegra/pinctrl-tegra.h          |   3 +
 drivers/pinctrl/tegra/pinctrl-tegra114.c       |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra124.c       |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra20.c        |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra210.c       |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra30.c        |   1 +
 drivers/soc/tegra/pmc.c                        | 150 +++++++++-
 21 files changed, 1053 insertions(+), 35 deletions(-)

-- 
2.7.4

