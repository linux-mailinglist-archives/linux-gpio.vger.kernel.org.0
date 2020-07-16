Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F059221A09
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 04:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGPCd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 22:33:59 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:57575 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGPCd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 22:33:59 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06G2Xdi56017581, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06G2Xdi56017581
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jul 2020 10:33:39 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 10:33:39 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 10:33:38 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 16 Jul 2020 10:33:38 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/8] pinctrl: update realtek DHC pinctrl driver
Date:   Thu, 16 Jul 2020 10:33:30 +0800
Message-ID: <20200716023338.14922-1-tychang@realtek.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andreas,

This series update Realtek DHC pinctrl driver with the following details:

* add missed pins
* add pin configuration feature
* add realtek DHC pinctrl documentation
* fix the warnings checked by running scripts/checkpatch.pl
* move realtek DHC pinctrl driver to realtek directory
* add \suspend/resume callback function

Changelog:
v2
-remove realtek,rtd-pinctrl.yaml documentation
-add device tree binding rtd1195 documentation
-add deivce tree binding rtd1295 documentation
-fix the errors running 'make dt_binding_check'
-document the pin settings

Cc: Andreas Färber <afaerber@suse.de>


TY Chang (8):
  pinctrl: realtek: rtd1295: Add missed pins.
  pinctrl: realtek: rtd1295: Add pin configs.
  pinctrl: realtek: rtd1195: Add missed pins and pin configs.
  dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1195
  dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1295
  pinctrl: realtek: DHC: Fix pinctrl driver coding style according to
    checkpatch.pl.
  pinctrl: realtek: DHC: Move pinctrl drivers to realtek directory and
    rename.
  pinctrl: realtek: DHC: Add suspend/resume callback function.

 .../pinctrl/realtek,rtd1195-pinctrl.yaml      | 104 +++
 .../pinctrl/realtek,rtd1295-pinctrl.yaml      | 121 +++
 drivers/pinctrl/Kconfig                       |  10 +-
 drivers/pinctrl/Makefile                      |   2 +-
 drivers/pinctrl/pinctrl-rtd119x.c             | 383 ---------
 drivers/pinctrl/realtek/Kconfig               |  14 +
 drivers/pinctrl/realtek/Makefile              |   3 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         | 600 +++++++++++++
 .../pinctrl/{ => realtek}/pinctrl-rtd1195.h   | 490 ++++++++---
 .../pinctrl/{ => realtek}/pinctrl-rtd1295.h   | 805 +++++++++++++++---
 10 files changed, 1899 insertions(+), 633 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
 delete mode 100644 drivers/pinctrl/pinctrl-rtd119x.c
 create mode 100644 drivers/pinctrl/realtek/Kconfig
 create mode 100644 drivers/pinctrl/realtek/Makefile
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd.c
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1195.h (64%)
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1295.h (62%)

-- 
2.27.0

