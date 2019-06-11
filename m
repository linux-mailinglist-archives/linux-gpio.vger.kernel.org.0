Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F8B3C4E3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404321AbfFKHUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 03:20:24 -0400
Received: from shell.v3.sk ([90.176.6.54]:60832 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404319AbfFKHUY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 03:20:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id D224D104F79;
        Tue, 11 Jun 2019 09:20:22 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 2xoZ3eony-IR; Tue, 11 Jun 2019 09:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A6865104F72;
        Tue, 11 Jun 2019 09:20:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id gC3qITR56l2a; Tue, 11 Jun 2019 09:20:04 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 7B4AD104F74;
        Tue, 11 Jun 2019 09:20:04 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>,
        Martin Schiller <mschiller@tdt.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] pinctrl: xway: Switch to SPDX header
Date:   Tue, 11 Jun 2019 09:20:01 +0200
Message-Id: <20190611072001.2978298-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/pinctrl/pinctrl-xway.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xwa=
y.c
index ae74b260b014..b4b4e9ad0fa4 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinmux-xway.c
  *  based on linux/drivers/pinctrl/pinmux-pxa910.c
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  *  Copyright (C) 2015 Martin Schiller <mschiller@tdt.de>
  */
--=20
2.21.0

