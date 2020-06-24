Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2429D206C85
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 08:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389055AbgFXGff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 02:35:35 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47324 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388262AbgFXGfe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jun 2020 02:35:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E3FF1200F3D;
        Wed, 24 Jun 2020 08:35:32 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 59F4B200172;
        Wed, 24 Jun 2020 08:35:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 38419402A6;
        Wed, 24 Jun 2020 14:35:22 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V6 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Date:   Wed, 24 Jun 2020 14:23:55 +0800
Message-Id: <1592979844-18833-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are more and mroe requirements that SoC specific modules should be built
as module in order to support generic kernel image, such as Android GKI concept.

This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs, i.MX common pinctrl driver and i.MX
SCU common pinctrl driver as still built-in.

Compared to V5, the changes are as below:
        - Keep i.MX common pinctrl libary built in, ONLY i.MX SoC pinctrl driver
          support built as module.

Anson Huang (9):
  pinctrl: imx: Support i.MX8 SoCs pinctrl driver built as module
  pinctrl: imx: scu: Support i.MX8 SCU SoCs pinctrl driver built as
    module
  pinctrl: imx8mm: Support building as module
  pinctrl: imx8mn: Support building as module
  pinctrl: imx8mq: Support building as module
  pinctrl: imx8mp: Support building as module
  pinctrl: imx8qxp: Support building as module
  pinctrl: imx8qm: Support building as module
  pinctrl: imx8dxl: Support building as module

 drivers/pinctrl/freescale/Kconfig           | 14 +++++++-------
 drivers/pinctrl/freescale/pinctrl-imx.c     |  2 ++
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  5 +++++
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  |  6 ++++++
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  |  6 ++++++
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  |  6 ++++++
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  6 ++++++
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  5 +++++
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  5 +++++
 drivers/pinctrl/freescale/pinctrl-scu.c     |  4 ++++
 10 files changed, 52 insertions(+), 7 deletions(-)

-- 
2.7.4

