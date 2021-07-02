Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E1A3BA04C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhGBM0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:38 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42419 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhGBM0h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228646; x=1656764646;
  h=from:to:cc:subject:date:message-id;
  bh=AtD6tAzbNQok0apKqyY5LKbqNuHtZSAF+bSlk14iYpk=;
  b=DZlJWuCZBO2WASO5afC3U5qf5VGNkWriH3e5GFqo6PtbC2dM3Kl3wePX
   Y3Y7uOw6TR4WeJHDDHL2k951aKH6oKSqsZbfJdzQUFTkt9zIeyluAI6FJ
   TimLQsWVGdRFecxJCTqhWdMn4gC9mavlYwo5rlAPIE0PtpDlxF+XUygLs
   fwsKbuOlYHeiFb2b/17jHZBcDek4bKUAoMoIqCaDLWQduROcsy1UtWb0V
   hmsOa/GYMnvSxxQP7qB1qL8rkbNr1mJuPG4Nj9/+dPmIiEg9UpFzGZ31y
   N94KtHIz6jS0HLz60OvEjC7WZjMZo2WW6CBvCWALp2rXitQv9Zm12FhHy
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252566"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228644; x=1656764644;
  h=from:to:cc:subject:date:message-id;
  bh=AtD6tAzbNQok0apKqyY5LKbqNuHtZSAF+bSlk14iYpk=;
  b=KepUj3xuUr4HOgMcYdHiMYk0XOM/WX6NDorw+HtticMxNVS+Knw6iOEO
   3cbiSJZR9ScIpS6vz1t/g16aHskBOr4TfCvjZ+QaYTos464Nj9SJcXEro
   VseQ1nX+D0e+nvzDpUF75RjGFPCp54aL1rJAWGOWOisXAVTq51m7LUCNi
   nrIaEq2VYMwYnnqS1mPUXvYvD1LGwjS+vRInbeCcGbOvhZA6GNK0dCFEE
   UuyDK4CpWBh6uAIU3zbrhrOjZwf2q0JUtMFlYMrC45J1pud4hUOu3ic2i
   4kQTL37qQ42Q48r5kjBToC1DkufvAT44mwr7iymasfURUSjM1Kw6h1N6H
   g==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252565"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 4647E280070;
        Fri,  2 Jul 2021 14:24:04 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
Date:   Fri,  2 Jul 2021 14:23:46 +0200
Message-Id: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Updated patch series:

- A number of new patches (more hardware support and a few fixes)
- Patches 1-3 have gained Fixes tags
- Patch 2 depends on 1, so maybe we can push the GPIO patch through the
  MFD tree to keep them together?
- The change in patch 7 was somewhat controversial. I've added a
  warning, but it is the last patch of the series, so it doesn't affect
  the rest of the series if it is rejected.


Matthias Schiffer (7):
  gpio: tqmx86: really make IRQ optional
  mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
  mfd: tqmx86: remove incorrect TQMx90UC board ID
  mfd: tqmx86: fix typo in "platform"
  mfd: tqmx86: add support for TQMx110EB and TQMxE40x
  mfd: tqmx86: add support for TQ-Systems DMI IDs
  mfd: tqmx86: assume 24MHz LPC clock for unknown boards

 drivers/gpio/gpio-tqmx86.c |  6 ++---
 drivers/mfd/tqmx86.c       | 48 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 13 deletions(-)

-- 
2.17.1

