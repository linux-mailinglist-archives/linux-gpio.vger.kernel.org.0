Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D378833D95C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 17:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237372AbhCPQ0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 12:26:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:46736 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233841AbhCPQ0R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 12:26:17 -0400
IronPort-SDR: 6t5DSnbJYHtFzzxirXHQJ9EfuLSdPQUG6JLgHYy45N6i/72ecctXRhvLS0eDEmMoStQWsAGvph
 QUTOrJ8OuyMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="186913427"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="186913427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 09:26:12 -0700
IronPort-SDR: 2qLLJsDGkWR72qoEWfrVLtCFI6LpqOTVP6JlTx+cpoYY/3612EbuTRiIb7AL1BHam6lDUZyzkm
 g28CpJQ/o28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="511431593"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2021 09:26:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BF2F82D8; Tue, 16 Mar 2021 18:26:23 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/2] gpio: sch: Interrupt support
Date:   Tue, 16 Mar 2021 18:26:11 +0200
Message-Id: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm now struggling to test this on Intel Minnowboard (v1), but it seems not
working and it's only one possible pin to test, so I have to take soldering
iron in my hands and do some hardware hacks to test. Meanwhile I sent this in
order to Jan to test on his side that everything is working on their platform.

Changes in v4:
- turned to GPIO core infrastructure of IRQ chip instantiation (Linus)
- converted IRQ callbacks to use better APIs
- use handle_bad_irq() as default handler and now I know why, see
  eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
  for the real example what happens if it's preset to something meaningful
- fixed remove stage (we have to remove SCI handler, which wasn't done in v3)

Changes in v3 (https://lore.kernel.org/linux-gpio/cover.1574277614.git.jan.kiszka@siemens.com/T/#u):
 - split-up of the irq enabling patch as requested by Andy

Jan Kiszka (2):
  gpio: sch: Add edge event support
  gpio: sch: Hook into ACPI SCI handler to catch GPIO edge events

 drivers/gpio/gpio-sch.c | 146 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 6 deletions(-)

-- 
2.30.2

