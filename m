Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1BA1D2B3C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 11:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENJVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 05:21:48 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:52955 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgENJVs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 05:21:48 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04E9LPFq8025251, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04E9LPFq8025251
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 14 May 2020 17:21:25 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:25 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 14 May 2020 17:21:25 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Thu, 14 May 2020 17:21:25 +0800
From:   TY Chang <tychang@realtek.com>
To:     <linux-realtek-soc@lists.infradead.org>, <afaerber@suse.de>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/7] pinctrl: update realtek DHC pinctrl driver
Date:   Thu, 14 May 2020 17:21:18 +0800
Message-ID: <20200514092125.6875-1-tychang@realtek.com>
X-Mailer: git-send-email 2.26.2
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
* add suspend/resume callback function

Cc: Andreas Färber <afaerber@suse.de>


TY Chang (7):
  pinctrl: realtek: rtd1295: Add missed pins.
  pinctrl: realtek: rtd1295: Add pin configs.
  pinctrl: realtek: rtd1195: Add missed pins and pin configs.
  dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1195 and
    rtd1295.
  pinctrl: realtek: DHC: Fix pinctrl driver coding style according to
    checkpatch.pl.
  pinctrl: realtek: DHC: Move pinctrl drivers to realtek directory and
    rename.
  pinctrl: realtek: DHC: Add suspend/resume callback function.

 .../bindings/pinctrl/realtek,rtd-pinctrl.yaml |  59 ++
 drivers/pinctrl/Kconfig                       |  10 +-
 drivers/pinctrl/Makefile                      |   2 +-
 drivers/pinctrl/pinctrl-rtd119x.c             | 383 ---------
 drivers/pinctrl/realtek/Kconfig               |  14 +
 drivers/pinctrl/realtek/Makefile              |   3 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         | 600 +++++++++++++
 .../pinctrl/{ => realtek}/pinctrl-rtd1195.h   | 490 ++++++++---
 .../pinctrl/{ => realtek}/pinctrl-rtd1295.h   | 805 +++++++++++++++---
 9 files changed, 1733 insertions(+), 633 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd-pinctrl.yaml
 delete mode 100644 drivers/pinctrl/pinctrl-rtd119x.c
 create mode 100644 drivers/pinctrl/realtek/Kconfig
 create mode 100644 drivers/pinctrl/realtek/Makefile
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd.c
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1195.h (64%)
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1295.h (62%)

-- 
2.26.2

