Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F595312CB6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhBHJBU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:01:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:12867 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhBHI7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 03:59:23 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DZ0Jn63pSz7RZm;
        Mon,  8 Feb 2021 16:57:13 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Mon, 8 Feb 2021
 16:58:35 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <grygorii.strashko@ti.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@openeuler.org>
Subject: [PATCH for next v1 0/2] gpio: few clean up patches to replace spin_lock_irqsave with spin_lock
Date:   Mon, 8 Feb 2021 16:57:55 +0800
Message-ID: <1612774677-56758-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to use API with _irqsave in hard IRQ handler, So replace
those with spin_lock.

Luo Jiaxing (2):
  gpio: omap: Replace raw_spin_lock_irqsave with raw_spin_lock in
    omap_gpio_irq_handler()
  gpio: grgpio: Replace spin_lock_irqsave with spin_lock in
    grgpio_irq_handler()

 drivers/gpio/gpio-grgpio.c |  5 ++---
 drivers/gpio/gpio-omap.c   | 15 ++++++---------
 2 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.7.4

