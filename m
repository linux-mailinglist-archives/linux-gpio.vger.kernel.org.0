Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3003F0708
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbfKEUgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:56275 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbfKEUgC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="195954281"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2019 12:36:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9BE84FC; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping registration
Date:   Tue,  5 Nov 2019 22:35:50 +0200
Message-Id: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the ordering fix for GPIO <-> pin mapping registration to allow
delegation of IRQ chip to the GPIO library. Two drivers are actually converted
to use the new callback followed by switching to use of irqchip structure
inside gpiochip.

The series has been tested on Merrifield device (though no AEI) and on Thinkpad
10 where 4 events are registered, one of which has reasonable amount of
interrupts coming from battery.

First two patches are definitely good for v5.4 cycle (and have Fixes tag) while
the rest can be applied for v5.5 if I didn't miss anything. So, they can go like
patches 1-3 -> v5.4 (gpio/fixes) and to gpio/for-next and to pinctrl/for-next
patches 4-5 -> v5.5 (gpio/for-next)
patches 6-7 -> v5.5 (pinctrl/for-next)

Perhaps it would require to wait next v5.4 rc in order to avoid dependency
issues.

Changelog v2 (resent):
- fixed cover letter
- resent with ML included

Changelog v2:
- added fixes tag to the first patch
- reworked commit message for the second patch
- added baytrail conversion
- tested on ThinkPad 10

Andy Shevchenko (6):
  gpiolib: No need to call gpiochip_remove_pin_ranges() twice
  gpiolib: Introduce ->add_pin_ranges() callback
  gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
  gpio: merrifield: Pass irqchip when adding gpiochip
  pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
  pinctrl: baytrail: Pass irqchip when adding gpiochip

Linus Walleij (1):
  gpiolib: Switch order of valid mask and hw init

 drivers/gpio/gpio-merrifield.c           | 76 ++++++++++++++----------
 drivers/gpio/gpiolib-of.c                |  5 +-
 drivers/gpio/gpiolib.c                   | 19 +++++-
 drivers/pinctrl/intel/pinctrl-baytrail.c | 64 ++++++++++++--------
 include/linux/gpio/driver.h              |  5 ++
 5 files changed, 107 insertions(+), 62 deletions(-)

-- 
2.24.0.rc1

