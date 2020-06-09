Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0611F3E26
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 16:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbgFIOcP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 10:32:15 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49066 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728440AbgFIOcP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 10:32:15 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 82FB01A13DD;
        Tue,  9 Jun 2020 16:32:12 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E7C9E1A13CA;
        Tue,  9 Jun 2020 16:32:07 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6D4BD40307;
        Tue,  9 Jun 2020 22:32:02 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Date:   Tue,  9 Jun 2020 22:21:16 +0800
Message-Id: <1591712485-20609-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are more and mroe requirements that SoC specific modules should be built
as module in order to support generic kernel image, such as Android GKI concept.

This patch series supports i.MX8 SoCs pinctrl drivers to be built as module,
including i.MX8MQ/MM/MN/MP/QXP/QM/DXL SoCs, and it also supports building i.MX
common pinctrl driver and i.MX SCU common pinctrl driver as module.

Compared to V2, the changes are as below:
	- add "depends on OF" to PINCTRL_IMX to fix build error using x86 randconfig;
	- change the config dependency of PINCTRL_IMX_SCU to support scenario of
	  building in PINCTRL_IMX while building PINCTRL_IMX_SCU as module, no other
	  good choice in my mind, if you have better idea without changing the driver
	  code, please advise.

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

 drivers/pinctrl/freescale/Kconfig           | 27 ++++++++++++++-------------
 drivers/pinctrl/freescale/pinctrl-imx.c     |  4 ++++
 drivers/pinctrl/freescale/pinctrl-imx.h     |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  9 +++------
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  | 10 ++++------
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  9 ++++-----
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  9 +++------
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  9 +++------
 drivers/pinctrl/freescale/pinctrl-scu.c     |  6 ++++++
 11 files changed, 50 insertions(+), 55 deletions(-)

-- 
2.7.4

