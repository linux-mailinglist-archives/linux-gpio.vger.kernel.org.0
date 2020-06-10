Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554C51F4FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 10:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgFJIIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 04:08:43 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37876 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgFJIIn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 04:08:43 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF6091A1525;
        Wed, 10 Jun 2020 10:08:41 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 22E491A1502;
        Wed, 10 Jun 2020 10:08:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 88B6540307;
        Wed, 10 Jun 2020 16:08:31 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Date:   Wed, 10 Jun 2020 15:57:36 +0800
Message-Id: <1591775865-26872-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are more and mroe requirements that SoC specific modules should be built
as module in order to support generic kernel image, such as Android GKI concept.

This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs, and it also supports building
i.MX common pinctrl driver and i.MX SCU common pinctrl driver as module.

Compared to V3, the changes are as below:
	- change the config dependency back to original;
	- use function callbacks for SCU related functions, and all drivers
	  using SCU pinctrl driver need to initialize the function callbacks,
	  pinctrl-imx.c will check the SCU function callback and call it when
	  it is valid, then no build issue when PINCTRL_IMX is built in and
	  PINCTRL_IMX_SCU is built as module.

Anson Huang (9):
  pinctrl: imx: Support building SCU pinctrl driver as module
  pinctrl: imx: Support building i.MX pinctrl driver as module
  pinctrl: imx8mm: Support building as module
  pinctrl: imx8mn: Support building as module
  pinctrl: imx8mq: Support building as module
  pinctrl: imx8mp: Support building as module
  pinctrl: imx8qxp: Support building as module
  pinctrl: imx8qm: Support building as module
  pinctrl: imx8dxl: Support building as module

 drivers/pinctrl/freescale/Kconfig           | 19 +++++-----
 drivers/pinctrl/freescale/pinctrl-imx.c     | 22 ++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c | 12 +++---
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  | 10 ++---
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  | 10 ++---
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  | 10 ++---
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  9 ++---
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  | 12 +++---
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 12 +++---
 drivers/pinctrl/freescale/pinctrl-scu.c     |  6 +++
 11 files changed, 86 insertions(+), 93 deletions(-)

-- 
2.7.4

