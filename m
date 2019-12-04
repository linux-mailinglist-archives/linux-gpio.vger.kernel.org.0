Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238141128F8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLDKK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:10:57 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56576 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLDKK5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:10:57 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id CDC9D27E0A05;
        Wed,  4 Dec 2019 11:10:55 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id d58SyFKbqL4u; Wed,  4 Dec 2019 11:10:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6D7ED27E0E3A;
        Wed,  4 Dec 2019 11:10:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6D7ED27E0E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454255;
        bh=tm1bz/38l5nlWepy+IT4YdTVC5S4emIIOh/grEnMF+w=;
        h=From:To:Date:Message-Id;
        b=MZ7NMmHEpRCaQ865e6RwFE55yZG1FCzmVZpIqnUyy7/Cbj9oJInEju9n/GCIf7j4L
         NFY/LiY/BDznTa1YxUQJLkvHv0s6IJiK3vdQ4fixmqrk36LwFUeQANuwAboiGB22zm
         J2b7x0ubuHRxrtIct1BNH91qp1JK1J7fl0BBwiPQ=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id nJS6I94fpCeJ; Wed,  4 Dec 2019 11:10:55 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 48BB027E0A05;
        Wed,  4 Dec 2019 11:10:55 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
Date:   Wed,  4 Dec 2019 11:10:34 +0100
Message-Id: <20191204101042.4275-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Synopsys DWAPB IP includes support for pin control. This control is basic
and allows to switch between a hardware and a software function.
Software function is when driving GPIOs from IP and hardware is controlled
by external signals.
This serie export necessary interface to be able to move the driver to
pinctrl folder and then implement the pinctrl support which is based on the
digicolor driver. The idea is to avoid hardcoding pins in driver since
this IP is a generic one available on multiple SoC.

Clement Leger (5):
  gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
  pinctrl: dw: move gpio-dwapb.c to pinctrl folder
  pinctrl: dw: use devm_gpiochip_add_data
  pinctrl: dw: add pinctrl support for dwapb gpio driver
  dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl

 .../bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt |  21 +-
 MAINTAINERS                                        |   6 +-
 drivers/gpio/Kconfig                               |   8 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/gpiolib-acpi.h                        |   4 -
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/dw/Kconfig                         |  11 +
 drivers/pinctrl/dw/Makefile                        |   4 +
 .../gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c}    | 277 +++++++++++++++++++--
 include/linux/gpio/driver.h                        |  12 +
 include/linux/platform_data/gpio-dwapb.h           |   1 +
 12 files changed, 310 insertions(+), 37 deletions(-)
 rename Documentation/devicetree/bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt (76%)
 create mode 100644 drivers/pinctrl/dw/Kconfig
 create mode 100644 drivers/pinctrl/dw/Makefile
 rename drivers/{gpio/gpio-dwapb.c => pinctrl/dw/pinctrl-dwapb.c} (77%)

-- 
2.15.0.276.g89ea799

