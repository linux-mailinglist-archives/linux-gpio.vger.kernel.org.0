Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8CDC02DA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfI0KET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 06:04:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58611 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfI0KET (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 06:04:19 -0400
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0DFE524000D;
        Fri, 27 Sep 2019 10:04:15 +0000 (UTC)
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
Subject: [PATCH v3 0/5] LogiCVC mfd and GPIO support
Date:   Fri, 27 Sep 2019 12:04:02 +0200
Message-Id: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces support for the LogiCVC GPIO block to the syscon GPIO
driver, with dt bindings documentation also including the top-level mfd
component.

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


Paul Kocialkowski (5):
  dt-bindings: Add Xylon vendor prefix
  dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
  gpio: syscon: Add support for a custom get operation
  dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
  gpio: syscon: Add support for the Xylon LogiCVC GPIOs

 .../bindings/gpio/xylon,logicvc-gpio.yaml     | 69 +++++++++++++++++
 .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpio/gpio-syscon.c                    | 75 ++++++++++++++++++-
 4 files changed, 193 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

-- 
2.23.0

