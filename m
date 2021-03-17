Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C3233F4B7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 16:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhCQPzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 11:55:09 -0400
Received: from mga14.intel.com ([192.55.52.115]:25236 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231964AbhCQPzC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 11:55:02 -0400
IronPort-SDR: ARDPe4GiD7i0luBv5QWFwKmyPOVi66XF36hwO4NIT6Qj8Oq8VoOT2vVh8RD5ZybmDV7jmlRtj2
 EaxVzgrRElRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="188847327"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="188847327"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 08:19:34 -0700
IronPort-SDR: wGEjl2GbscZBzlZ1YTUJwQpYpRpMv77L7OAHMMGdAWOpmjXEUsRm8LaAui2CDdxC6T8s8IKP6I
 0xXJKYRdwRoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="388876376"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2021 08:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7F1B1147; Wed, 17 Mar 2021 17:19:44 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/2] gpio: sch: Interrupt support
Date:   Wed, 17 Mar 2021 17:19:26 +0200
Message-Id: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series adds event support to the Intel GPIO SCH driver. The hardware
routes all events through GPE0 GPIO event.

I validated this on Intel Minnowboard (v1).

If somebody has different hardware with the same GPIO controller, I would
appreciate additional testing.

Changes in v5:
- added missed IRQ acknowledge callback (hence kernel Oops)
- rewrite patch 2 completely from SCI to GPE hook

Changes in v4 (https://lore.kernel.org/linux-gpio/20210316162613.87710-1-andriy.shevchenko@linux.intel.com/T/#u):
- turned to GPIO core infrastructure of IRQ chip instantiation (Linus)
- converted IRQ callbacks to use better APIs
- use handle_bad_irq() as default handler and now I know why, see
  eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
    for the real example what happens if it's preset to something meaningful
- fixed remove stage (we have to remove SCI handler, which wasn't done in v3)

Changes in v3 (https://lore.kernel.org/linux-gpio/cover.1574277614.git.jan.kiszka@siemens.com/T/#u):
- split-up of the irq enabling patch as requested by Andy

Andy Shevchenko (1):
  gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events

Jan Kiszka (1):
  gpio: sch: Add edge event support

 drivers/gpio/gpio-sch.c | 196 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 188 insertions(+), 8 deletions(-)

-- 
2.30.2

