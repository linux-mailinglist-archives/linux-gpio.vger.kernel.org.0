Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298483FE353
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 21:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343712AbhIATs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Sep 2021 15:48:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:36524 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343505AbhIATs1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Sep 2021 15:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=o3WveLW81BDHsV2epXosq3kZpkL
        Zc1B0Ik5zl4hkcJY=; b=wdW69VSCr353jZLX1z33RAzULcdDHeJrvbPbitzd2ix
        M1fkJv3taHW7bp9IPwYx9L4+qiqtC1pMK1lQXVJxGKcjlFQOqaRhBQTb1uUaXalr
        WLgLQbfBYw6LnBxlw/l4UfRgn/esLss/ETM19zj8Ak6tKC7yAez1lQHgPh47rmpg
        =
Received: (qmail 3153047 invoked from network); 1 Sep 2021 21:47:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2021 21:47:27 +0200
X-UD-Smtp-Session: l3s3148p1@LJOCVfTKwOYgAwDPXwmvAFZKlTMHlX5i
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/1] gpio: add simple logic analyzer using polling
Date:   Wed,  1 Sep 2021 21:45:48 +0200
Message-Id: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bravery continues with the next update and first non-RFC version of
the in-kernel logic analyzer based on GPIO polling with local irqs
disabled. It has been been tested locally and remotely. It provided
satisfactory results. Besides the driver, there is also a script which
isolates a CPU to achieve the best possible result. I am aware of the
latency limitations. However, the intention is for debugging only, not
mass production. Especially for remote debugging and to get a first
impression, this has already been useful. Documentation is within the
patch, to get a better idea what this is all about.

Changes since RFC v2:

* took most of the suggestions from Andy's review. For the things I did
  not take, I added comments when appropriate.
* A *lot* of cleanups to the shell script guided by checkers, mainly
  'shellcheck'. This is mainly to ensure that the scripts works on most
  minimal shells. Tested are 'busybox ash', 'dash', and 'bash'.
* a *lot* more error checking and reporting in the script
* I found fatal_signal_pending(), so the sampling process is now
  finally killable \o/
* script sets CPUfreq now to "performance" for the isolated CPU
* the acquisition_delay is now measured before each sampling and not
  only during probe because the probing core is likely not the one
  used for sampling later

Thanks to Andy for many suggestions.

A branch with preparation for the Renesas Salvator-XS (R-Car H3 ES2.0
and M3-N tested) and Falcon boards (R-Car V3U) is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gpio-logic-analyzer-v3

The documentation is also available online on the elinux wiki:
https://elinux.org/Kernel_GPIO_Logic_analyzer

Looking forward to comments and especially further tests with different
use cases than mine.

Thanks and all the best,

   Wolfram


Wolfram Sang (1):
  gpio: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  71 ++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 340 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer         | 214 +++++++++++
 6 files changed, 644 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer

-- 
2.30.2

