Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53DEC9553
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 02:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbfJCADT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 20:03:19 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55782 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729220AbfJCADQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 20:03:16 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 95A36891AC;
        Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570060993;
        bh=iUvA3HctFAZbLaG023LjBql2W+ZBQfiEqjeVbF2OMeI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=K4uihTorKxE0T+IhKkM9Ri1yc2NhJIFE2zA/QLUImn6J2VPyvKBHT4anq5dgXcP/S
         c6QZry8JLXjQ88O6zL3+SbauIfUyRCq/cFyvGMSedncjAVFvgLuoqRFkbdYjl+1rA/
         u0BTNGyYgQ7KsZY7xiZ3cAv6WcnoHhfSpW6NEj/OxaYi/xanidPEwYwQJ04xHD3thi
         QYZ9LGTrhvJzTXQcXPdQE/oQpUumc2Xnp3eOxooLSYWAKnZxWwX8v1x66V9KWgJwM6
         /j5VGjTOE1ab9QIVBqPve2SbO4ch3e3Nedg15YYHPSlTeeiKod4YdwPzwwS8XPHTiR
         N5BRy3iwm8x+A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d953ac20000>; Thu, 03 Oct 2019 13:03:14 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4A36C13EEC9;
        Thu,  3 Oct 2019 13:03:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 729E228003E; Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
Date:   Thu,  3 Oct 2019 13:03:10 +1300
Message-Id: <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the dev_name(dev) for the irqc->name so that we get unique names
when we have multiple instances of this driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index 8971fc54e974..c24d49d436ce 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -858,7 +858,7 @@ static int iproc_gpio_probe(struct platform_device *p=
dev)
 		struct gpio_irq_chip *girq;
=20
 		irqc =3D &chip->irqchip;
-		irqc->name =3D "bcm-iproc-gpio";
+		irqc->name =3D dev_name(dev);
 		irqc->irq_ack =3D iproc_gpio_irq_ack;
 		irqc->irq_mask =3D iproc_gpio_irq_mask;
 		irqc->irq_unmask =3D iproc_gpio_irq_unmask;
--=20
2.23.0

