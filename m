Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CF63C4E6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 09:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404335AbfFKHUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 03:20:36 -0400
Received: from shell.v3.sk ([90.176.6.54]:60852 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404319AbfFKHUd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 03:20:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id B6A85104F7E;
        Tue, 11 Jun 2019 09:20:31 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id u2YoUcM1_rmB; Tue, 11 Jun 2019 09:20:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 56CC8104F75;
        Tue, 11 Jun 2019 09:20:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id TwDhlqFSGqW1; Tue, 11 Jun 2019 09:20:09 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id D1A02104F6E;
        Tue, 11 Jun 2019 09:20:08 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] pinctrl: lantiq: Switch to SPDX header
Date:   Tue, 11 Jun 2019 09:20:04 +0200
Message-Id: <20190611072004.2978373-1-lkundrak@v3.sk>
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
 drivers/pinctrl/pinctrl-lantiq.c | 5 +----
 drivers/pinctrl/pinctrl-lantiq.h | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-l=
antiq.c
index 22e80613e269..029e0aecb8d8 100644
--- a/drivers/pinctrl/pinctrl-lantiq.c
+++ b/drivers/pinctrl/pinctrl-lantiq.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinctrl-lantiq.c
  *  based on linux/drivers/pinctrl/pinctrl-pxa3xx.c
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
=20
diff --git a/drivers/pinctrl/pinctrl-lantiq.h b/drivers/pinctrl/pinctrl-l=
antiq.h
index 0e4308b8f235..d6530838fca8 100644
--- a/drivers/pinctrl/pinctrl-lantiq.h
+++ b/drivers/pinctrl/pinctrl-lantiq.h
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/drivers/pinctrl/pinctrl-lantiq.h
  *  based on linux/drivers/pinctrl/pinctrl-pxa3xx.h
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
=20
--=20
2.21.0

