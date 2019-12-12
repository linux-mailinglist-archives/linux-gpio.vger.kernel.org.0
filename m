Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5039711D90D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 23:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbfLLWJp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 17:09:45 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47618 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730814AbfLLWJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 17:09:45 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6C1EB886BF;
        Fri, 13 Dec 2019 11:09:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576188583;
        bh=7P9buINH8YZmi8YLKUIL68gu/6asYNIBiQhY6iZpyrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=2TPrp/FvGrmrN4CtpRefZbw+Vh6j9IltNNZ6QWdT48bFOeOBf0NLKEMSOqOSp8P+T
         OTZx9aTZEh2Ka8so0J88n2AHCoqHrXrw3d2Z5ZdaQxwYRPkvPNfVK2Q9SKY2U0HmHC
         tlQzCiXk4f+thvPzjnZGJ2xMI/YYis1M15Uap0RmqXS/sxEA9vx71JvZAnp4sr80Wk
         qz3Y6szdeUvHHs7bJ/DooYiPTxxiWQmKne4LHkH89IWojUnX4UjDL+1Pi39/tUnTq1
         dYQ0XdQ94LOeUvV6RAq+kEdfakhUYRxNVSwbB1XnLD7Qw/7zXMUOQDGEGabAjGp9Hc
         BdTm9jOEaoGxQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df2baa20000>; Fri, 13 Dec 2019 11:09:43 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 3178D13EF6B;
        Fri, 13 Dec 2019 11:09:38 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 76782540505; Fri, 13 Dec 2019 11:09:38 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 1/1] pinctrl: iproc: Set irq handler based on trig type
Date:   Fri, 13 Dec 2019 11:09:23 +1300
Message-Id: <20191212220923.15089-2-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191212220923.15089-1-hamish.martin@alliedtelesis.co.nz>
References: <20191212220923.15089-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rather than always using handle_simple_irq() as the gpio_irq_chip
handler, set a more appropriate handler based on the IRQ trigger type
requested.
This is important for level triggered interrupts which need to be
masked during handling.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index 831a9318c384..c79e91eb1a47 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -288,6 +288,11 @@ static int iproc_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
 		       rising_or_high);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
 	dev_dbg(chip->dev,
 		"gpio:%u level_triggered:%d dual_edge:%d rising_or_high:%d\n",
 		gpio, level_triggered, dual_edge, rising_or_high);
--=20
2.24.1

