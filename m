Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F301C93F1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 00:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJBWAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 18:00:41 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55484 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJBWAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 18:00:41 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 268A1891A9;
        Thu,  3 Oct 2019 11:00:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570053638;
        bh=YLkP+2lAHWkPfMgk6pb+w4QEvy7mnsmDv74TU3Uz62c=;
        h=From:To:Cc:Subject:Date;
        b=IwimoNCrsPFplXawmbt8wLuLtStub2nm0qotITdAm+Su6EDzjvmeEwP6xDbE/8knz
         +VQ16/PSyzdtoU2XwAyc+Eg3gtCcF+eJg7uRWZy84gFAdW0sg2HquLTbZCojqe0Qgg
         nzpIOifjgsYyYkAbXKBYGCsv7zUPYW8wpJp32ktC3KMvRVunNRLHyrH/EL5vcFzori
         GtVPv9VjOYkWobRJoWn8U2kVBAtw09eTJQXjQSZZSRrzoefRuqKb/jboBYLKRHAbKc
         lZI4viHWHZ5fLcDPJuKQNr29s2cTWBaGiZIV+X7ir3dGLqv/f1iLKdJy5fPahDWESA
         dnTS9t+GzSsDw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d951e060000>; Thu, 03 Oct 2019 11:00:38 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id B015913EEC9;
        Thu,  3 Oct 2019 11:00:41 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id D493228003E; Thu,  3 Oct 2019 11:00:37 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] pinctrl: iproc: improve error handling
Date:   Thu,  3 Oct 2019 11:00:33 +1300
Message-Id: <20191002220034.2034-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

platform_get_irq() can return an error code. Allow for this when getting
the irq.  While we're here use the dev_name(dev) for the irqc->name so
that we get unique names when we have multiple instances of this driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Noticed this while debugging another problem.

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index 6f7d3a2f2e97..c24d49d436ce 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -853,12 +853,12 @@ static int iproc_gpio_probe(struct platform_device =
*pdev)
=20
 	/* optional GPIO interrupt support */
 	irq =3D platform_get_irq(pdev, 0);
-	if (irq) {
+	if (irq > 0) {
 		struct irq_chip *irqc;
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

