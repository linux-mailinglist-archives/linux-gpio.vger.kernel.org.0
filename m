Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D93E1EF185
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 08:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFEGpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 02:45:11 -0400
Received: from inva020.nxp.com ([92.121.34.13]:51472 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEGpK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 02:45:10 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 309A71A1F06;
        Fri,  5 Jun 2020 08:45:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D8C21A1F00;
        Fri,  5 Jun 2020 08:45:04 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9254140296;
        Fri,  5 Jun 2020 14:44:58 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 0/8] Support i.MX8 SoCs pinctrl drivers built as module
Date:   Fri,  5 Jun 2020 14:34:26 +0800
Message-Id: <1591338874-4733-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are more and mroe requirements that SoC specific modules should be
built as module in order to support generic kernel image, such as Android
GKI concept.

This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs.

Anson Huang (8):
  pinctrl: imx: Export necessary APIs for i.MX pinctrl drivers
  pinctrl: imx8mm: Support building as module
  pinctrl: imx8mn: Support building as module
  pinctrl: imx8mq: Support building as module
  pinctrl: imx8mp: Support building as module
  pinctrl: imx8qxp: Support building as module
  pinctrl: imx8qm: Support building as module
  pinctrl: imx8dxl: Support building as module

 drivers/pinctrl/freescale/Kconfig           | 14 +++++++-------
 drivers/pinctrl/freescale/pinctrl-imx.c     |  2 ++
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  9 +++------
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  9 ++++-----
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  9 +++------
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  9 +++------
 drivers/pinctrl/freescale/pinctrl-scu.c     |  1 +
 10 files changed, 35 insertions(+), 48 deletions(-)

-- 
2.7.4

