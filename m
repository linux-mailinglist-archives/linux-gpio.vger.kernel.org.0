Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10332388F05
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 15:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353656AbhESN1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 09:27:30 -0400
Received: from www.zeus03.de ([194.117.254.33]:51232 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353659AbhESN12 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 09:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=D4WTcDSnFA5CD6imsXF4T5RU9Bl
        RhYKlVSgW61z0jYA=; b=E/gBYmjhyzzAegIXyLarHyk6myV2BewRfPIeqJ2tvzu
        L7MiP/YORhFU44P2Yh7xqysTBVN3qnar8yMfr7kb+nGicZTrYI5uYX8t56wgW5aR
        u+/cXrbxPRyYGeztwlM5FbhCULcDezLnJs6UkwsIC39KrQus746iaryOeTOtiIaQ
        =
Received: (qmail 3334756 invoked from network); 19 May 2021 15:26:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2021 15:26:07 +0200
X-UD-Smtp-Session: l3s3148p1@3WfhxK7CNMwgAwDPXwaBAEltFu20ukzh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 0/1] gpio: add simple logic analyzer using polling
Date:   Wed, 19 May 2021 15:25:27 +0200
Message-Id: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bravery continues with the second RFC for the in-kernel logic
analyzer based on GPIO polling with local irqs disabled. Besides the
driver, there is also a script which isolates a CPU to achieve the best
possible result. I am aware of the latency limitations. However, the
intention is only for debugging. Especially for remote debugging and to
get a first impression, this has already been useful. Documentation is
within the patch, to get a better idea what this is all about.

Changes since RFC v1:

* moved from misc/ to gpio/. Thanks to Linus and Bartosz for offering a
  home for this
* renamed from "simple logic analyzer" to "sloppy logic analyzer"
  everywhere to make its limitations crystal clear
* moved the parser for trigger data from the kernel into the script.
  Much cleaner kernel code but passing binary data now. We'll see...
* all gpios now must be named. This removes ugly fallback code and
  allows to use generic device properties instead of OF properties only.
* added and updated documentation
* triggers are also now checked at sample speed, not full speed
* replaced pr_* printouts with dev_*
* removed bashisms in the script (tested with bash, dash, and busybox
  ash)
* depends on EXPERT now
* small bugfixes, refactoring, cleanups all around

Thanks to Andy, Linus, Randy, and Ulrich for suggestions and testing.

A branch with preparation for the Renesas Salvator-XS boards is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gpio-logic-analyzer-v2

The documentation is also available online on the elinux wiki:
https://elinux.org/Kernel_GPIO_Logic_analyzer

Looking forward to comments and especially further tests with different
use cases than mine. I have looked enough at the code, fresh view would
really help. And still, if somebody has a pointer how to detect if a
task was requested to be killed (while irqs and preemption are
disabled), I'd appreciate that to avoid the currently unkillable
sub-process.

All the best,

   Wolfram

Wolfram Sang (1):
  misc: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  72 ++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 317 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer         | 200 +++++++++++
 6 files changed, 608 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer

-- 
2.30.2

