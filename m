Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FF83CB588
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbhGPKEO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:14 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62519 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235820AbhGPKEN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429679; x=1657965679;
  h=from:to:cc:subject:date:message-id;
  bh=h9wIrOGUrdG3QsOS9Ks91pvXqFrDcN2FvXSKy3Gp50U=;
  b=EgD91c6QEjOWJ8RtNK08uVadTkBJegrx+mRb16WICb8pGtnP4DVIV3Tv
   HrY4TiKlX5+s3wiQ/SYU+HQs0UZuVC4DXVNmjFBOrTUdgIkzFlRsOqlB2
   x3FVmpB8rAYx2g7VJFr6HpOEy/VPoT8RvQ5EC8/cgwwV2GkwZKKGKRt5d
   6b18XEWtT0FQDfk4ny5VP1KYG+yIxEe50HLPQU2piLgF6GUH80MbCcHqu
   7Dfb448yk3eg0SghABvYPXA4IOOIcjZ4jrEs72ZuF5LU4A2zZ+gqAOqjc
   uo93Sa62R03cOnZyzKYvqx8CBKefaN570G1rkjpUXCfqjA+PAzySBncBJ
   g==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492064"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429678; x=1657965678;
  h=from:to:cc:subject:date:message-id;
  bh=h9wIrOGUrdG3QsOS9Ks91pvXqFrDcN2FvXSKy3Gp50U=;
  b=CUJRfjwUBjJhIeZEBJZEGwDSKkRE832oQVrdWdwXcsMSkUp24QIZNFsa
   AznYqR+WYBM8FMUuNI0MUTDUEgW3rzgWriO/criPAfbyMID7E32fZs17B
   pIm4AWsZdKIXm+aw0IYjWD1U3LnOQY/EY+BmvUewm0mF5LA8DcuGoT/+n
   MtcgrpZZTWIzfDNKOEtmwlZR1QCmmahRAMAOJWjLdukA6aWUdPpaGAu8/
   Ygqi88bNfS0JeXLaTrZqLMFepndqdjF/YDRTR24TQgygyXZAI7QsYV0K1
   cd3PgoXnW5kR8BcCZqVWc+i3NfFVgcbWek8QoEUuQNBqG0wm/JYGZIac+
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492063"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id BC406280070;
        Fri, 16 Jul 2021 12:01:17 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
Date:   Fri, 16 Jul 2021 12:00:46 +0200
Message-Id: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v3:
- Removed Fixes tag from patch 3 again

v2: 
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

