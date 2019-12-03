Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166A110FFA7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 15:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLCONL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 09:13:11 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33949 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCONL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 09:13:11 -0500
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 049E96000B;
        Tue,  3 Dec 2019 14:13:00 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v5 0/4] LogiCVC mfd and GPIO support
Date:   Tue,  3 Dec 2019 15:12:39 +0100
Message-Id: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces support for the LogiCVC GPIO block to the syscon GPIO
driver, with dt bindings documentation also including the top-level mfd
component.

Changes since v4:
- Moved the GPIO driver to a dedicated driver.

Changes since v3:
- Added collected tags;
- Kept syscon_gpio_data set function pointer line intact;
- Grouped declarations in a single line as requested.

Changes since v2:
- Fixed dt schema examples.

Changes since v1:
- Converted dt bindings documentation to dt schemas;
- Used BIT macro and removed version from structure name;
- Improved documentation example with gpio-line-names;
- Added vendor prefix to dt bindings;
- Added mfd component dt bindings documentation.

Cheers,

Paul

Paul Kocialkowski (4):
  dt-bindings: Add Xylon vendor prefix
  dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
  dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
  gpio: Add support for the Xylon LogiCVC GPIOs

 .../bindings/gpio/xylon,logicvc-gpio.yaml     |  69 +++++++
 .../bindings/mfd/xylon,logicvc.yaml           |  50 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpio/Kconfig                          |   6 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-logicvc.c                   | 170 ++++++++++++++++++
 6 files changed, 298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
 create mode 100644 drivers/gpio/gpio-logicvc.c

-- 
2.24.0

