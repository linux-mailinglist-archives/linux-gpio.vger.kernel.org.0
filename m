Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2411CD4C5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 11:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbgEKJWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 05:22:47 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:44774 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKJWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 05:22:47 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04B9MbiO6009310, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04B9MbiO6009310
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 11 May 2020 17:22:37 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 11 May 2020 17:22:37 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 11 May 2020 17:22:36 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXMB01.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server id
 15.1.1779.2 via Frontend Transport; Mon, 11 May 2020 17:22:36 +0800
From:   TY Chang <tychang@realtek.com>
To:     <tychang@realtek.com>
CC:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/7] pinctrl: update realtek DHC pinctrl driver
Date:   Mon, 11 May 2020 17:22:29 +0800
Message-ID: <20200511092236.4554-1-tychang@realtek.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andreas,

This series update realtek DHC pinctrl driver with the following details:

* add missed pins
* add pin configuration feature 
* add suspend/resume callback function
* fix the warnings checked by running scripts/checkpatch
* add realtek pinctrl documentation
* move realtek pinctrl driver to realtek directory


Cc: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Andreas Färber <afaerber@suse.de>

TY Chang (7):
  pinctrl: realtek: rtd1295: Add missed pins.
  pinctrl: realtek: rtd1295: Add pin configs.
  pinctrl: realtek: rtd1195: Add missed pins and pin configs.
  pinctrl: realtek: Add pinctrl Documentation.
  pinctrl: realtek: DHC: Fix pinctrl driver coding style.
  pinctrl: realtek: DHC: Move files to realtek directory and rename.
  pinctrl: realtek: DHC: Add suspend/resume callback function.

 .../bindings/pinctrl/reaktek,pinctrl.txt      |   9 +
 drivers/pinctrl/Kconfig                       |  10 +-
 drivers/pinctrl/Makefile                      |   2 +-
 drivers/pinctrl/pinctrl-rtd119x.c             | 383 ---------
 drivers/pinctrl/realtek/Kconfig               |  10 +
 drivers/pinctrl/realtek/Makefile              |   3 +
 drivers/pinctrl/realtek/pinctrl-rtd.c         | 600 +++++++++++++
 .../pinctrl/{ => realtek}/pinctrl-rtd1195.h   | 490 ++++++++---
 .../pinctrl/{ => realtek}/pinctrl-rtd1295.h   | 805 +++++++++++++++---
 9 files changed, 1679 insertions(+), 633 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/reaktek,pinctrl.txt
 delete mode 100644 drivers/pinctrl/pinctrl-rtd119x.c
 create mode 100644 drivers/pinctrl/realtek/Kconfig
 create mode 100644 drivers/pinctrl/realtek/Makefile
 create mode 100644 drivers/pinctrl/realtek/pinctrl-rtd.c
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1195.h (64%)
 rename drivers/pinctrl/{ => realtek}/pinctrl-rtd1295.h (62%)

-- 
2.26.2

