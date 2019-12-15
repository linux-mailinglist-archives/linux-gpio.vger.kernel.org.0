Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CE711FB56
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 22:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfLOVFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 16:05:13 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49496 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOVFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 16:05:13 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 45370891AC;
        Mon, 16 Dec 2019 10:05:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576443910;
        bh=B17L/LC4Pm0ZcN7G12j2beHk5JASujxIbHNMPhRgl64=;
        h=From:To:Cc:Subject:Date;
        b=h3oNptCS2SIfUEpx6WYwTtiiUZ0KYLmQguQZVc3yEQliYop243eVFsFcMZBKu/sIT
         J553w0r8YXSQzXpsAHGMN/QYrif4oFwYFuyrVKvDspZHv54KL1Y82/utiFKicyCP1N
         r8nojL2SUIBOGa1TJe1UjGzoaza5dy0KUF3Nxbf+Oj8jLtiNamGmcBo5xCMNm6421K
         Xbr1mX1NWiFgu+VP4APTslcLpo6qhRBhlgreWxTyUM0/3Q5eLTbfQlJsQcfbIrHHYc
         Dkmyr2ylnYLVw00i/N0+Dfqlpvm/7LXy2QtF+i5Gp2Fcxfx0xBiJ4gVa5VYOLxm2Gs
         kiaPJkKWuJ6vA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5df6a0060000>; Mon, 16 Dec 2019 10:05:10 +1300
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 49F4D13EEA8;
        Mon, 16 Dec 2019 10:05:07 +1300 (NZDT)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id 0F54F540430; Mon, 16 Dec 2019 10:05:10 +1300 (NZDT)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH v2 0/1] pinctrl: iproc: Fix level interrupt handling
Date:   Mon, 16 Dec 2019 10:05:02 +1300
Message-Id: <20191215210503.15488-1-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

An issue is seen on the BCM56060 SoC using the pinctrl-iproc-gpio.c drive=
r
for one of its GPIO blocks.
When a GPIO on this block is used as a level sensitive interrupt the
downstream handler is not invoked until the level returns to its previous
(non-interrupting) state. This makes the level sensitive interrupts
unusable. Edge sensitive interrupts are not affected.

The fix is to simply ensure that we use a more appropriate handler
(handle_level_irq) for the interrupt based on what trigger type has been
configured.
Similar setting of the handler is done in numerous other drivers.

v2: Fixes for Ray Jui's review comments.

Hamish Martin (1):
  pinctrl: iproc: Set irq handler based on trig type

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--=20
2.24.1

