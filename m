Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A69FC9554
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 02:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfJCADT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 20:03:19 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55779 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbfJCADQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 20:03:16 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7EFED891AB;
        Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570060993;
        bh=3VnnKl2LrhqjyKH1KQiZB7hJ16Qi3F1l1RHfX6a0Es4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=mjFuhjmSnsBfvlPu9H0nE3Tp+dSwoMoz2TEuBngeGK0Ef5ShLyNn+qHJ/OVwxP8OX
         lpT/9MdSmB7RCGZXZqhD/w5RHQwFV1UWaOfznTaaCChlWeK0rWbDXVq283RENMsDsU
         ds0no38E4UR5cDV1e8Jwzkh8VmEsPYdE9gcbSNYQOsNLCN/sevbTEQ4TAMURXcXTSl
         WEJIf/99w1nY2GSjVL/gNUQSDAU9f/HkhHCCLYgmf9GbuWOWQaMu3YSJdwYB84QAyX
         EMxW3fqvQAQgnBd58Pa+iDn7AAerdNGjtjhIKKWtjnVLeaOb48QHGQzFYExaFdXKIV
         Lsm1b/T45rssw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d953ac10002>; Thu, 03 Oct 2019 13:03:13 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 299E013EEC9;
        Thu,  3 Oct 2019 13:03:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 51FA928003E; Thu,  3 Oct 2019 13:03:13 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] pinctrl: iproc: allow for error from platform_get_irq()
Date:   Thu,  3 Oct 2019 13:03:09 +1300
Message-Id: <20191003000310.17099-2-chris.packham@alliedtelesis.co.nz>
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

platform_get_irq() can return an error code. Allow for this when getting
the irq.

Fixes: 6f265e5d4da7 ("pinctrl: bcm-iproc: Pass irqchip when adding gpioch=
ip")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index 6f7d3a2f2e97..8971fc54e974 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -853,7 +853,7 @@ static int iproc_gpio_probe(struct platform_device *p=
dev)
=20
 	/* optional GPIO interrupt support */
 	irq =3D platform_get_irq(pdev, 0);
-	if (irq) {
+	if (irq > 0) {
 		struct irq_chip *irqc;
 		struct gpio_irq_chip *girq;
=20
--=20
2.23.0

