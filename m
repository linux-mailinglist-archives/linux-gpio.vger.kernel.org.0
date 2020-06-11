Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F901F66FF
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 13:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgFKLpz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 07:45:55 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38354 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbgFKLpz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 07:45:55 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D00A1A070E;
        Thu, 11 Jun 2020 13:45:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A0EFF1A06F6;
        Thu, 11 Jun 2020 13:45:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B8C024028F;
        Thu, 11 Jun 2020 19:45:43 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 0/9] Support i.MX8 SoCs pinctrl drivers built as module
Date:   Thu, 11 Jun 2020 19:34:46 +0800
Message-Id: <1591875295-19427-1-git-send-email-Anson.Huang@nxp.com>
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

Compared to V4, the changes are as below:
	- remove unnecessary changes of replacing arch_initcall() with
	  module_platform_driver() in each SoC pinctrl driver, to make
	  sure no probe sequence change for built-in config.
	- add module author and description to each module.

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
 drivers/pinctrl/freescale/pinctrl-imx.c     | 25 ++++++++-----
 drivers/pinctrl/freescale/pinctrl-imx.h     | 57 ++++++++++++-----------------
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c |  8 ++++
 drivers/pinctrl/freescale/pinctrl-imx8mm.c  |  6 +++
 drivers/pinctrl/freescale/pinctrl-imx8mn.c  |  6 +++
 drivers/pinctrl/freescale/pinctrl-imx8mp.c  |  6 +++
 drivers/pinctrl/freescale/pinctrl-imx8mq.c  |  6 +++
 drivers/pinctrl/freescale/pinctrl-imx8qm.c  |  8 ++++
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c |  8 ++++
 drivers/pinctrl/freescale/pinctrl-scu.c     |  9 +++++
 11 files changed, 106 insertions(+), 52 deletions(-)

-- 
2.7.4

