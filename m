Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B911D11D1D0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 17:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbfLLQE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 11:04:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57359 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729719AbfLLQEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 11:04:21 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQwr-0003cW-KD; Thu, 12 Dec 2019 17:04:17 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ifQwr-0004L9-24; Thu, 12 Dec 2019 17:04:17 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [RESEND PATCH v3 0/3] Add DA9062 GPIO support
Date:   Thu, 12 Dec 2019 17:04:10 +0100
Message-Id: <20191212160413.15232-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

this update address all comments made on [1], for further details see
the patch based changelog.

I resend this v3 since I forgot to add the MFD maintainers on the To:.
Please can you review the MFD part?

Regards,
  Marco

[1] https://patchwork.ozlabs.org/cover/1201549/

Marco Felsch (3):
  dt-bindings: mfd: da9062: add gpio bindings
  mfd: da9062: add support for the DA9062 GPIOs in the core
  pinctrl: da9062: add driver support

 .../devicetree/bindings/mfd/da9062.txt        |  10 +
 MAINTAINERS                                   |   1 +
 drivers/mfd/da9062-core.c                     |  16 +-
 drivers/pinctrl/Kconfig                       |  12 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-da9062.c              | 297 ++++++++++++++++++
 6 files changed, 336 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/pinctrl-da9062.c

-- 
2.20.1

