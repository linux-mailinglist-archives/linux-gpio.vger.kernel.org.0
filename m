Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3BA42A5F4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236995AbhJLNnm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236854AbhJLNnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F63C061570;
        Tue, 12 Oct 2021 06:41:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y26so88692959lfa.11;
        Tue, 12 Oct 2021 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jer+D64NwFqg3lswgRPWI11ACDNtMRc57uH44gzLJtg=;
        b=euUG5Cl85wO2leafnMYDPaOFYjrD5EJsXk6bBLz4KQTDmfddtviBrNxH6ZE/W//Ogq
         bcFZJskPNi1rzKGw0+ICAivGHQS4GqD5qORdoTYcrbWJ1Meh5W1FSrzMNyqEb4JaefuE
         0O2kmSv8GcjU+xADdDhGzt4ug+d7lsJWG6F19UAIiTj2h4B5E0rwz1MWNQNdf4cBcXA6
         ZhZu2gA+DTXk4gm4XGzzwFuG+ztx5swp5eKX86ooAOnfWrNaw76kvYitVF9PBxy+a+Hh
         DWkk/WoFu129gwJ09TYqRingohCcFKqf+wrcMOvfaNavQgebwIRVJfHLNrbOxXy4SLAJ
         tISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=jer+D64NwFqg3lswgRPWI11ACDNtMRc57uH44gzLJtg=;
        b=3YrajwTFhM1UQlHrix2Hs94jTCoWgnhQWiuwO9Spps/HGnSsHeWnUnQ1os2E0fRDmf
         lY1cmC+XU1CXRCnbzGMKZh+X6W0dwwPhqM6HWczAn0PhKIfUbkLXLid9VtKJrvxZv5sn
         JHUPjL8yrRXPgFvJqgHAvGyPHLzhS98czn7bqIHi8YT+qymyIxNbOGWxvxDsF/cX9KBC
         WXnl8WhB2T8OIaVJqwBhHc8d6NufScoDChtRK8IQzZ++lLQ8nxolLk9BofyyKwZq36X0
         vo39+MZkA0ptnb57nlVkviISu6lgosG5QewTL74GhNg7CaDozrc+phaKM1mu1KOZqhhr
         dMgQ==
X-Gm-Message-State: AOAM5339tVYrEqjndgv7NHFqrjeCi64S0+vzEZYB9ZviNHZq1olBPZXk
        +xX/v7ZDpOChIhNcktak1Ak=
X-Google-Smtp-Source: ABdhPJw09X/T52DBQcqbij/xht30zGMRPqEKz9t98hER+srgMXNSFRn7x43yGUM7vmVB443vsV2dkg==
X-Received: by 2002:a05:6512:3c88:: with SMTP id h8mr8189918lfv.128.1634046097813;
        Tue, 12 Oct 2021 06:41:37 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:37 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/16] Basic StarFive JH7100 RISC-V SoC support
Date:   Tue, 12 Oct 2021 15:40:11 +0200
Message-Id: <20211012134027.684712-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
many devices that needs non-coherent dma operations to work which isn't
upstream yet[1], so this just adds basic support to boot up, get a
serial console, blink an LED and reboot itself. Unlike the Allwinner D1
this chip doesn't use any extra pagetable bits, but instead the DDR RAM
appears twice in the memory map, with and without the cache.

The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
Starlight Beta boards were sent out with them as part of a now cancelled
BeagleBoard.org project. However StarFive has produced more of the
JH7100s and more boards will be available[2] to buy. Hopefully before
the end of the year.

This series is also available at
https://github.com/esmil/linux/commits/starlight-minimal
..but a more complete kernel including non-coherent dma operations can
be found at
https://github.com/starfive-tech/linux/tree/starlight

/Emil

[1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
[2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/

Emil Renner Berthing (12):
  RISC-V: Add StarFive SoC Kconfig option
  dt-bindings: timer: Add StarFive JH7100 clint
  dt-bindings: interrupt-controller: Add StarFive JH7100 plic
  dt-bindings: reset: Add Starfive JH7100 reset bindings
  reset: starfive-jh7100: Add StarFive JH7100 reset driver
  dt-bindings: pinctrl: Add StarFive pinctrl definitions
  dt-bindings: pinctrl: Add StarFive JH7100 bindings
  pinctrl: starfive: Add pinctrl driver for StarFive SoCs
  dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
  serial: 8250_dw: Add skip_clk_set_rate quirk
  RISC-V: Add initial StarFive JH7100 device tree
  RISC-V: Add BeagleV Starlight Beta device tree

Geert Uytterhoeven (4):
  dt-bindings: clock: starfive: Add JH7100 clock definitions
  dt-bindings: clock: starfive: Add JH7100 bindings
  clk: starfive: Add JH7100 clock generator driver
  dt-bindings: reset: Add StarFive JH7100 reset definitions

 .../clock/starfive,jh7100-clkgen.yaml         |   56 +
 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../pinctrl/starfive,jh7100-pinctrl.yaml      |  274 ++++
 .../bindings/reset/starfive,jh7100-reset.yaml |   38 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    5 +
 .../bindings/timer/sifive,clint.yaml          |    1 +
 MAINTAINERS                                   |   22 +
 arch/riscv/Kconfig.socs                       |    8 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/starfive/Makefile         |    2 +
 .../dts/starfive/jh7100-beaglev-starlight.dts |  162 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  228 +++
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/starfive/Kconfig                  |   10 +
 drivers/clk/starfive/Makefile                 |    3 +
 drivers/clk/starfive/clk-starfive-jh7100.c    |  769 +++++++++
 drivers/pinctrl/Kconfig                       |   17 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-starfive.c            | 1439 +++++++++++++++++
 drivers/reset/Kconfig                         |    8 +
 drivers/reset/Makefile                        |    1 +
 drivers/reset/reset-starfive-jh7100.c         |  164 ++
 drivers/tty/serial/8250/8250_dw.c             |   32 +-
 include/dt-bindings/clock/starfive-jh7100.h   |  202 +++
 .../dt-bindings/pinctrl/pinctrl-starfive.h    |  274 ++++
 include/dt-bindings/reset/starfive-jh7100.h   |  126 ++
 27 files changed, 3833 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/Makefile
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi
 create mode 100644 drivers/clk/starfive/Kconfig
 create mode 100644 drivers/clk/starfive/Makefile
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7100.c
 create mode 100644 drivers/pinctrl/pinctrl-starfive.c
 create mode 100644 drivers/reset/reset-starfive-jh7100.c
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h

-- 
2.33.0

