Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E381934E39B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhC3I5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:57:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:42638 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231602AbhC3I5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 04:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=qEj0gd9b5dP6yH2NCFYOIYkYymz
        6y2EV8e9qLz0MKYY=; b=S/GGt3/TbG73K7KvnKHZf/c5gwy6sus4pgmcYRp8/fU
        HkQzwxvl2+jhIu3xbqOhZLELIBZJwzs+ryRS77popBDEi9+w9LkEDg9fa8l7sjna
        PZxs90ECJWp8bdLWEKw0GgZ4QNxNYryADKbUKtWDeMfdywtUzgD5mG+nyyLoWfjQ
        =
Received: (qmail 144548 invoked from network); 30 Mar 2021 10:57:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2021 10:57:11 +0200
X-UD-Smtp-Session: l3s3148p1@scjjLr2+htMgARa4RV5TAXqFgB02ZUaY
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC/RFT 0/1] add simple logic analyzer using polling
Date:   Tue, 30 Mar 2021 10:56:54 +0200
Message-Id: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Okay, this one is maybe a bit brave, let's see if it is suitable for
upstream. This is an in-kernel logic analyzer based on GPIO polling with
local irqs disabled. Besides the driver, there is a script which
isolates a CPU to get towards the best possible result. I am aware of
the latency limitations. However, the intention is only for debugging.
Especially for remote debugging and to get a first impression, this has
already been useful. So, I wonder if we want to provide this for others,
too, and have it in Linus' tree. Documentation is within the patch, to
get a better idea what this is all about.

A branch with preparation for the Renesas Salvator-XS boards is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gpio-logic-analyzer

The documentation is also available online on the elinux wiki:
https://elinux.org/Kernel_GPIO_Logic_analyzer

Looking forward to comments. If somebody has a pointer how to detect if
a task was requested to be killed (while irqs and preemption are
disabled), I'd appreciate that to avoid the currently unkillable
sub-process.

All the best,

   Wolfram


Wolfram Sang (1):
  misc: add simple logic analyzer using polling

 .../dev-tools/gpio-logic-analyzer.rst         |  63 ++++
 Documentation/dev-tools/index.rst             |   1 +
 .../bindings/misc/gpio-logic-analyzer.yaml    |  40 ++
 drivers/misc/Kconfig                          |  12 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/gpio-logic-analyzer.c            | 355 ++++++++++++++++++
 tools/debugging/gpio-logic-analyzer           | 156 ++++++++
 7 files changed, 628 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-logic-analyzer.rst
 create mode 100644 Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
 create mode 100644 drivers/misc/gpio-logic-analyzer.c
 create mode 100755 tools/debugging/gpio-logic-analyzer

-- 
2.30.0

