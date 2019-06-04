Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDAC3494B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 15:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfFDNr0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 09:47:26 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2489 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfFDNrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 09:47:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf6766a0000>; Tue, 04 Jun 2019 06:47:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Jun 2019 06:47:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Jun 2019 06:47:24 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 13:47:24 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id BF5AE40609; Tue,  4 Jun 2019 16:47:21 +0300 (EEST)
Date:   Tue, 4 Jun 2019 16:47:21 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V2 00/12] LP0 entry and exit support for Tegra210
Message-ID: <20190604134721.GF29894@pdeschrijver-desktop.Nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559656043; bh=h2xwZU1WNNFX816oKRNQbyQ51t2yd2F/AsXBiGhNVVk=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=Ihm/uBLRIn2ScqSaz1oj9l2NqVNY2fx/8jNAdJuDV2k7hPZN0F6YMR+H89uEZlbvF
         5gZlKQUiCv+o1kUWAUYDId4E6gq8AFCJru2x7UhTJiSSZwleuzzLOFm5sgoyx5/RB4
         +ODZhkNY91JcdP3rG2e2Y7dFsgyn0kt42+YLExcWHHZQfkHa9RWtk/2yDnOvO0rlVy
         9uzx7SEaDXA9sMIQq3OI+L69734Z9xUTLEdxN5UFSvInL0P7z5amkewPmCHv3TnWcK
         W4+VabqiTRMpFgdGbJiF5wOVwc16RtEYK8+bD/jwukJ340ZhBqnjl0EZRfvyJFK6mb
         EWaD5HOuqDx+w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 04:08:44PM -0700, Sowjanya Komatineni wrote:
> This patch series includes Tegra210 deepsleep/LP0 support with
> deep sleep exit through RTC alarm wake and power button wake events.
> 

We have been calling this SC7 (system C-state 7) for quite a while now.

Peter.

> Note: Wake on power button is through gpio-keys node in device tree.
> 
> This series also includes save and restore of PLLs, clocks, OSC contexts
> for basic LP0 exit.
> 
> This patch series doesn't support 100% suspend/resume to allow fully
> functional state upon resume and we are working on some more drivers suspend
> and resume implementations.
> 
> [V2] : V1 feedback fixes
> 	Patch 0002: This version still using syscore. Thierry suggest not to
> 	use syscore and waiting on suggestion from Linux Walleij for any better
> 	way of storing current state of pins before suspend entry and restoring
> 	them on resume at very early stage. So left this the same way as V1 and
> 	will address once I get more feedback on this.
> 	Also need to findout and implement proper way of forcing resume order
> 	between pinctrl and gpio driver.
> 
> 
> Sowjanya Komatineni (12):
>   irqchip: tegra: do not disable COP IRQ during suspend
>   pinctrl: tegra: add suspend and resume support
>   clk: tegra: save and restore PLLs state for system
>   clk: tegra: add support for peripheral clock suspend and resume
>   clk: tegra: add support for OSC clock resume
>   clk: tegra: add suspend resume support for DFLL clock
>   clk: tegra: support for Tegra210 clocks suspend-resume
>   soc/tegra: pmc: allow support for more tegra wake models
>   soc/tegra: pmc: add pmc wake support for tegra210
>   gpio: tegra: implement wake event support for Tegra210 and prior GPIO
>   arm64: tegra: enable wake from deep sleep on RTC alarm.
>   soc/tegra: pmc: configure tegra deep sleep control settings
> 
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   7 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi       |   5 +-
>  drivers/clk/tegra/clk-dfll.c                   |  82 ++++++
>  drivers/clk/tegra/clk-dfll.h                   |   2 +
>  drivers/clk/tegra/clk-divider.c                |  19 ++
>  drivers/clk/tegra/clk-pll-out.c                |  25 ++
>  drivers/clk/tegra/clk-pll.c                    |  99 +++++--
>  drivers/clk/tegra/clk-tegra-fixed.c            |  16 ++
>  drivers/clk/tegra/clk-tegra210.c               | 382 +++++++++++++++++++++++++
>  drivers/clk/tegra/clk.c                        |  74 ++++-
>  drivers/clk/tegra/clk.h                        |  13 +
>  drivers/gpio/gpio-tegra.c                      | 116 +++++++-
>  drivers/irqchip/irq-tegra.c                    |  22 +-
>  drivers/pinctrl/tegra/pinctrl-tegra.c          |  68 ++++-
>  drivers/pinctrl/tegra/pinctrl-tegra.h          |   3 +
>  drivers/pinctrl/tegra/pinctrl-tegra114.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c        |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c       |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra30.c        |   1 +
>  drivers/soc/tegra/pmc.c                        | 150 +++++++++-
>  21 files changed, 1053 insertions(+), 35 deletions(-)
> 
> -- 
> 2.7.4
> 
