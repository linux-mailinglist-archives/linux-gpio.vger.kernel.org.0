Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C89D2CDD9D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 19:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgLCS1C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 13:27:02 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:60139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgLCS1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 13:27:01 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M597q-1klzCv0zXI-00191P; Thu, 03 Dec 2020 19:24:25 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com, m@bues.ch,
        linux-gpio@vger.kernel.org
Subject: [PATCH 3/3] drivers: gpio: amd8111: use SPDX-License-Identifier
Date:   Thu,  3 Dec 2020 19:24:23 +0100
Message-Id: <20201203182423.5499-3-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201203182423.5499-1-info@metux.net>
References: <20201203182423.5499-1-info@metux.net>
X-Provags-ID: V03:K1:K6rguvECz7albWgihc5SpVddtWHUKDYK1w304F8q96OZlg3LuEs
 maz2qVgYcn/nfVZ1lxunxfjzBOUhN3dpHypiNvj8NXhkkeb1KU2EoCZleDdl/B+sH9J+9MC
 SyH1t4xupsuf3OBeBJ9rOZNEzJlnDA3RUGzjxOQI6MJ7eatWHdjpxwnUzEBveCX15GnI3pi
 KMutGdWrna+46bnA8tADw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9SFYdtNulQs=:hqqxdRQEQQQ/A0OAXbvfg1
 BM7tlRkVpImlerK5pgUC0PLUk2NDi4ape4GW6Zt9C81dUqVY4Ph3nptWaYxIYxApS8xX2xgZs
 /eA2Zk3hEtWWH6UeB1h1g1my4Mv91xGXZ2sZcCbkAvnzues6HjS1IVSCQ2d2pN74K4EBrslmc
 e2cleYdYkPFezfPLeGNHCuxhLXvdB9By6ifZrk0PIxS0fqYtGHZ2SbhyDYJJa5IRCxgnVSue4
 LTojlkpPbuEOuK+Lym7iXplP9ml09+sKjIu/0R/vaPdHg5CLAZiteyQU1JFli/BJGCm1RXUc8
 JVyakhtCROYszW1KEzAORyH2di3vbBWCVs2vVSGyxXvl1t8V82G/IQ0/Iw3L4dCDJvcu7cFx+
 /HQzlo+dmHX8igNtzpLVIs3T6pFT5PUQBda8vMZJUf9vvikUIyobkp/u5zwVU
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prefer SPDX-License-Identifier over hand-written texts.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-amd8111.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 0e260950992d..14e6b3e64add 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * GPIO driver for AMD 8111 south bridges
  *
@@ -20,10 +21,6 @@
  * Hardware driver for Intel i810 Random Number Generator (RNG)
  * Copyright 2000,2001 Jeff Garzik <jgarzik@pobox.com>
  * Copyright 2000,2001 Philipp Rumpf <prumpf@mandrakesoft.com>
- *
- * This file is licensed under  the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 #include <linux/ioport.h>
 #include <linux/module.h>
-- 
2.11.0

