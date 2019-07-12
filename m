Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7721666965
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 10:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfGLIyz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jul 2019 04:54:55 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39351 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfGLIyz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jul 2019 04:54:55 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MC0HF-1hcGYX1ygP-00CUbG; Fri, 12 Jul 2019 10:54:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
Date:   Fri, 12 Jul 2019 10:54:16 +0200
Message-Id: <20190712085437.4007720-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q5tPZJu9QNhMvB+Wjc3nD4+lt6P94lxXdaRle25TJJYOM/GHoiD
 /Ck9YlzlpO5LarKonCtXtY6s32D3RHStZ/uUlKcxN5hl6/5Q8d/8zFb2B4tCpX3rh/3EC7F
 prAVYFM+3zsSaFDP4Yf0HX1G1fSaPq787L7KWXquFwxEpl0DIvcpTwdL62bd+OPqmI3BF3W
 V5C2Cui+oFBnuSwh3lXeg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UryBGBMeQx4=:kSGxr+DizaqVDm43tZ3n4N
 1/ubNIVL20pMkt/p5VJw0mi1kSmHkbWNqF1KNp/+CdZ7CtN9NyLpnwAkyl/ZqodCHm4de/IpB
 r1uA5TZZazzo0Pr4dqco8Mn7EJW/C7joDbzjB/RklUZpiIWmSt4GutOOagb028hift7Js602J
 WZZ6G694HH44qLQQ6ba5fb7ofpQ3bY6u/sWC35PoSCDLM/fmrhFaVBpyd8wRpeef1TZkdVPtH
 E+MBT+ergUp39Q+6HEhf6V4XWfcJifcVk+yWyW8sc2oK8kBf2aIV68i+jxERDjDwKSb9BYNpe
 m7z+XmVRrzbDDj7NSqvqIoUqfv1Hzykf5/kNuYE0o/04VkPZBxPILkc1TZm1gAK5AXduhxddb
 j+D5R5hNmharF2JSQrAEi9jmgDSHY6haYX5ghczeXbOsQCi+6dgX2qa9+o3c3acqQ+6ToWO+E
 8njWP05diZlWuu2RNw83lTew3NQBysGjkG7n+UqTiXuKQmcFJ9Wvdavfu5F/DdyzGmH9uWcJK
 JnRBLrUm/2Gpu1SGTZgGmp611f5rNQjtp+f3TF1ipq8QCbC6vUrGQiKv0Rz9GUaL3E+FkPnfq
 i9ONNp8WCM7kelzX/rIB6z8t1KnK7kqXaHULkK6CHgxUNQOG2O5Y6f8GMScvupRh44c9dVgBW
 wiWTHD4luwvayUctO4hxX3SjbTupBAeGozktuTdq11NQTCD91ixWsd+GG5Xi9P06pV7smJJee
 3PnvsgeYyL3rORargUuokfIjbkCnQp/hOtDA3w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I ran into another build issue in randconfig testing for this driver,
when CONFIG_GPIOLIB is not set:

WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
  Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

Make the 'select' statements conditional on that so we don't have to
introduce another 'select'.

Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Fixes: a422bf11bdb4 ("platform/x86: fix PCENGINES_APU2 Kconfig warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e869a5c760b6..cf48b9068843 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1324,8 +1324,8 @@ config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
 	depends on INPUT && INPUT_KEYBOARD
 	depends on LEDS_CLASS
-	select GPIO_AMD_FCH
-	select KEYBOARD_GPIO_POLLED
+	select GPIO_AMD_FCH if GPIOLIB
+	select KEYBOARD_GPIO_POLLED if GPIOLIB
 	select LEDS_GPIO
 	help
 	  This driver provides support for the front button and LEDs on
-- 
2.20.0

