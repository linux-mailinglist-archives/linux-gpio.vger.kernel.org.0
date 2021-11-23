Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B475345A938
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 17:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhKWQwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 11:52:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:58944 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232465AbhKWQwS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 11:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=S4+2usPTIuL0LPfu++kpe1/JFhM
        /8ayY3pPeYrbNGxk=; b=d/zK2Syfpvs74N3+dEYMWV5MKDN/kRFifMTmGdNQMan
        4/8QXnXBvTZKz+9wXEobEwWwlTQtW7kN1/ACDgGvEZO4Z5dpUXt95IPdazJHx3vW
        8p/xUIDLNdlDA8rPF0d752NbxvORX4LKqbRMNaAa1PHMmfIuD52OjTYygo8iTs3g
        =
Received: (qmail 1315803 invoked from network); 23 Nov 2021 17:49:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2021 17:49:08 +0100
X-UD-Smtp-Session: l3s3148p1@o6rphHfRwKAgAQnoAFmOARJ9+DDMIx2D
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 0/1] gpio: add simple logic analyzer using polling
Date:   Tue, 23 Nov 2021 17:49:01 +0100
Message-Id: <20211123164902.35370-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bravery continues with the next update of the in-kernel logic
analyzer based on GPIO polling with local irqs disabled. It has been
tested locally and remotely. It provided satisfactory results. Besides
the driver, there is also a script which isolates a CPU to achieve the
best possible result. I am aware of the latency limitations. However,
the intention is for debugging only, not mass production. Especially for
remote debugging and to get a first impression, this has already been
useful. Documentation is within the patch, to get a better idea what
this is all about.

A branch is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gpio-logic-analyzer-v5

And an eLinux-wiki page with a picture of a result is here:
https://elinux.org/Kernel_GPIO_Logic_analyzer

Changes since last version:
* increased version number to 5 to match internal and external numbering
* added "SLOPPY" to the Kconfig symbol as well
* addressed Geert's comments (typos and more 'unsigned int' usage).
  Thanks!
* addressed Andy's comments (updated comment, use dev_err_probe, use
  '... || fail' pattern in script consequently). Thanks!

I've used the analyzer in a few more scenarios and on another SoC
(Renesas R-Car M3-W) and was happy with the outcome. Looking forward to
other tests and comments. From my side this is good to go.

Happy hacking,

   Wolfram


Wolfram Sang (1):
  gpio: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  71 ++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 340 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer         | 222 ++++++++++++
 6 files changed, 652 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer

-- 
2.30.2

