Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7B5AABFE5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 20:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733237AbfIFSwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 14:52:39 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33441 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733067AbfIFSwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 14:52:39 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MBmI6-1i0lxs3B0O-00CDCx; Fri, 06 Sep 2019 20:52:32 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Chris Chiu <chiu@endlessm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] pinctrl: intel: mark intel_pin_to_gpio __maybe_unused
Date:   Fri,  6 Sep 2019 20:51:59 +0200
Message-Id: <20190906185231.1081695-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LYhjHgPFyG2YyZsIuMFmNQ40r4UR9V9veB7fl9wmjxQjFy0pWBD
 MWIVkVLdH2LOAgexBDGQ+wJr1LrUc3dKwwGYMwSuHqO88dDME9Kz9KyVrMn2tOQL2aumsP2
 5cFSRr3QqvCsOchx5nbVcw8Rw/hg7p3kD0xKVgBu71W5BFGn+xv82N6Ur6Bdhav1SrgOa2b
 2PCzaBhxa1r7FvTggn4ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/sCSmMEMQf0=:akckMagX/KLHXlyiBZtFij
 F0JSPU0tIurJbr4NnIOnm1CLFArZ6lHJ8dcbUa4sC6pPcWCIjTlcj+70wIDtXvO64oe/Lx5X+
 sUbGUp4gMgH8gt1Uh5YY7lah3yazPBm+5owNToKTfftUdOMQpPMaohHGbp+NxmmzQejsuhQef
 ucukrNKYq/PjTLfFFio7bF/NuWIKt51mX9V38isziuI6iTeRWhO/v9UbuhIKIEKq0D/0/vhz7
 57XSaG/pjvOuHDoboAv/46LJBXf9tkGP33rIbT85YU8RW1Cuj22pITkhKM/QKDy2BlV9bQTaE
 zzq6RBXhAddshnZBReaQIWn9sjO3foKL4hZcRgxEkodpEoKVem8R8rwlWkJ921eWe+ZLFiOk1
 SyrPyHKiNThPIiFmOQ/f3mKhDrPaN3HS/nqpsP5UbWq1geTilD+tcQ93hZW2Zz4vsAMSWAKbs
 I3ymSKhC3GTRngdEsvMc8tnOY4ELV8f6j2PKkDyWzx2lKTKEfSngslN1EHu1jSUQFFkDDJY1G
 JLzCLyOkAO4oDTGLJpHEhS/0BMSR40vAphmUpFOcKkwa9sOmr4cZp1HooVJFfZr3WB5/L4eaY
 Cy33OPGDosY87DFbxdwyBEv8wD7ZesFHB+jwVNN+j5pvhSeLWDk9cXqP+roOculIbTmRP6O4D
 n83JyjsItdhHjhCJ/94cPJvc7UatSU3c4NeXzrzDUiMqPTIHDs8JbyYCfGMVpBwdJQzTdbDwi
 kQi2gwCRUTxBxx6fLCMRQ/ii4rVrIMLNPiYVAd814272xuOgHesmYXm4oFeSbS4PaSB4W10l/
 3mCYFqiROy5RO9MfU5a5EIwdwIkhxjYpqsEnrwzq4C6GSv3vmQ=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The intel_pin_to_gpio() function is only called by the
PM support functions and causes a warning when those are disabled:

drivers/pinctrl/intel/pinctrl-intel.c:841:12: error: unused function 'intel_pin_to_gpio' [-Werror,-Wunused-function]

Mark it __maybe_unused to suppress the warning.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use __maybe_unused instead of moving the code
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d66fe2b4221b..1f13bcd0e4e1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -838,7 +838,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
  *
  * Translate the pin number of pinctrl to GPIO offset
  */
-static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
+static __maybe_unused int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
 {
 	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
-- 
2.20.0

