Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 848F93BA7A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387396AbfFJRLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:11:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44254 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728373AbfFJRLY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:11:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBCWa121338;
        Mon, 10 Jun 2019 12:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186672;
        bh=t38w1L4mrxYXXMjDQM1becdv+NFut23PDyS5X30wChs=;
        h=From:To:CC:Subject:Date;
        b=IY7mJsgQmMZXyAx1hLY3wQu261gSm79u4CiTJ53uSmXqLjbf7invQW++CCrFO2mb7
         V3Ag3YM3RSQuMRUJmbTfgRAYLvLu9YCWbjTDjb2g9UXuZTI1p4doIEb1128wCPwOh/
         RgT+mKi7stL9fx7C4U/xUt+07bLYEVs1JPf9DCb4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBCiO079481
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBAaL066346;
        Mon, 10 Jun 2019 12:11:11 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 00/20]  gpio: gpio-omap: set of fixes and big clean-up
Date:   Mon, 10 Jun 2019 20:10:43 +0300
Message-ID: <20190610171103.30903-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus, Russell, Tony, All,

This series contains set of patches from Russell King which were circulated
internally for quite some time already and I fill it's reasonable to move
future discussion upstream (and also avoid rebasing).
Fisrt two patches are fixes and the rest are big, great clean up
from Russell King.

Personally, I like this clean up and refactoring very much and don't want
it to be lost.

Code can be found at:
 git@git.ti.com:~gragst/ti-linux-kernel/gragsts-ti-linux-kernel.git
branch:
 lkml-next-gpio-clean-up

Russell King (20):
  gpio: gpio-omap: ensure irq is enabled before wakeup
  gpio: gpio-omap: fix lack of irqstatus_raw0 for OMAP4
  gpio: gpio-omap: remove remainder of list management
  gpio: gpio-omap: clean up edge interrupt handling
  gpio: gpio-omap: remove irq_ack method
  gpio: gpio-omap: move omap_gpio_request() and omap_gpio_free()
  gpio: gpio-omap: simplify omap_gpio_get_direction()
  gpio: gpio-omap: simplify get() method
  gpio: gpio-omap: simplify get_multiple()
  gpio: gpio-omap: simplify set_multiple()
  gpio: gpio-omap: simplify bank->level_mask
  gpio: gpio-omap: simplify read-modify-write
  gpio: gpio-omap: simplify omap_toggle_gpio_edge_triggering()
  gpio: gpio-omap: simplify omap_set_gpio_irqenable()
  gpio: gpio-omap: remove dataout variation in context handling
  gpio: gpio-omap: clean up omap_gpio_restore_context()
  gpio: gpio-omap: constify register tables
  gpio: gpio-omap: clean up wakeup handling
  gpio: gpio-omap: irq_startup() must not return error codes
  gpio: gpio-omap: clean up register access in omap2_set_gpio_debounce()

 drivers/gpio/gpio-omap.c                | 497 ++++++++----------------
 include/linux/platform_data/gpio-omap.h |   2 +-
 2 files changed, 161 insertions(+), 338 deletions(-)

-- 
2.17.1

