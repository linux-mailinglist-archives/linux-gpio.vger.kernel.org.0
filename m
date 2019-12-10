Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A689119114
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 20:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfLJTys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 14:54:48 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:53641 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfLJTys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 14:54:48 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N336L-1hbMDX22vd-013KWw; Tue, 10 Dec 2019 20:54:18 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Scott Branden <scott.branden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        YueHaibing <yuehaibing@huawei.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: xgs-iproc: remove __exit annotation for iproc_gpio_remove
Date:   Tue, 10 Dec 2019 20:54:01 +0100
Message-Id: <20191210195414.705239-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ViR4DlsLfm5z2iRq3mTNYVk27TUrhxY06rvnZvn6AHxtb0Apv0z
 4e9w9BqtLQi6Qw6gQ9xQoi2nXSUcB/7vx4+cw6R33qDkF+b0xmxG8eNSJXNbJsWfVgqGJ64
 8x4p1fC6i11hD8F2rivD2eq/nE8IT731gbb1xxNeEzsGxuGk8zxQioL00K/1bEATXEAY7Bf
 p3r9pBpxe7yJSWfbcnpkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pmgS5U1eydc=:xvG/qPdehBWt2PvVfZW4ud
 KlyDQmCyrjE4iKkSzfdIT9hJcLWGPzN144l7Z9BwKCTSreDoLLHLqG2I31JYTddlkBsmqjcg3
 r93e4fKiBBTaQej3N/h3w7MItzWjKGcp/TsyCUbZKVTiMy1u4WOFN6Oe4lsTvZkpkssbJvzid
 N90jgAMRpYhX1Mte738oeU+VFRdieJYtIx5o0DGjF+o17YJUDNB+fiZ6/sbqRi4oX4PmyQsyz
 ODuzphVORVBcXFYTPjyxIPKyy8oWPXn9qmQV6QlrEGAMFNPHr4aQ7n1uLcBBMVbyJaeL+LesG
 7lwmxeDNo4GMmekHkdsanJNZLvlqTxLvSx8E61r1auB4IBdmAMPRiO/MLiw8AaAGDzkoyo1qJ
 OS9MLxFxfuwgo/n2ruUPEDG9ic/BmdGhAkLY3ky31jSv9cxjlU1VUIMHuw/sXprWCCrsQQVQM
 95PR8UwH7G5APK8IZ28/wJGqp24m9FGM9WuzydJ0+VaJdCMlhT6VELXdZ3NAhBpxqwgmp1B52
 0dx9jat9gtZDwxPLl7dYYxBTNAgxWACteKtalqIWfZd+KB487IzQFOB1heZpYS/314uvEfykG
 S+T/TxCaRwNk3C1WPJDPvHeXr7ZZw02nhDF//5rAOHYe7IBxHpbdqNissm6x0zvKEyBGSVnfX
 /zdOgNN3CA4dkQ53qYq38uyOblz4F7RoOGo3ZGXb9IM5DotVgYaUWJ1+FdM0UM/9ZVkRht8wZ
 sveGAYYhip5Lphx2als+DMz4g5G7zDl/mHyua2WzogxuqA2bgpUm+fGDCgms6fYe62CchbU9V
 jtu48Dxee/6lwEupPpuD2iE59n1TCuJJ63a4aBhch+sVpznDppqBWhB7AcbhkyiSKvhd26Qrr
 2/CPCb9uxNeX//437iCQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When built into the kernel, the driver causes a link problem:

`iproc_gpio_remove' referenced in section `.data' of drivers/gpio/gpio-xgs-iproc.o: defined in discarded section `.exit.text' of drivers/gpio/gpio-xgs-iproc.o

Remove the incorrect annotation.

Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-xgs-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 773e5c24309e..b21c2e436b61 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -280,7 +280,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit iproc_gpio_remove(struct platform_device *pdev)
+static int iproc_gpio_remove(struct platform_device *pdev)
 {
 	struct iproc_gpio_chip *chip;
 
-- 
2.20.0

