Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44ACD464116
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344757AbhK3WNE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:13:04 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:42250 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344676AbhK3WMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F146BB81D3F
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD20C53FC7;
        Tue, 30 Nov 2021 22:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310135;
        bh=XnlDPKEDWVuVJi1CUdYT+X3zeuXgvLu8Oq/LXlGLyD8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O8sDCZlCDbmSdOeCC05xaWareeQn1klzeMzws5fkA6lGBXyrvh3xcnywbfmgPfg1I
         vOPKsUESZolNn+Ue9IkYcEKXcyLlOzByFYw8Ca6ApqB5EJpl15cXG//toGJX2olO03
         QHmdUYIAjPE4topyNMySvNcvqxloYEQYpz4CH4JojVaHC5xDdomQeXWWadqNSJ1Ll1
         oxJTKpI8Vs4mJHOOhYJrg0tvI57u2cbx08tshxz2jpPlXLYVoqCFhfvZ8fgg4KNvsr
         w4K8XZQyblg7pM1+kRy5zkIaIjQiieBWi9tP60ZtZ+1HImreCvWVH7JyjN5iAa+jOC
         YMd+UdPbjEMCQ==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 5/5] gpio: ml-ioh: Change whitespace to match gpio-pch.c
Date:   Tue, 30 Nov 2021 16:08:41 -0600
Message-Id: <20211130220841.2776562-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

The ML IOH driver is very similar to the PCH driver.  To make it more
similar, tweak the whitespace in ioh_gpio_direction_output() and
ioh_gpio_direction_input().  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpio/gpio-ml-ioh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 0fb9c8bc9b2d..b060c4773698 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -122,8 +122,8 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
-	pm = ioread32(&chip->reg->regs[chip->ch].pm) &
-					(BIT(num_ports[chip->ch]) - 1);
+	pm = ioread32(&chip->reg->regs[chip->ch].pm);
+	pm &= BIT(num_ports[chip->ch]) - 1;
 	pm |= BIT(nr);
 	iowrite32(pm, &chip->reg->regs[chip->ch].pm);
 
@@ -146,8 +146,8 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->spinlock, flags);
-	pm = ioread32(&chip->reg->regs[chip->ch].pm) &
-				(BIT(num_ports[chip->ch]) - 1);
+	pm = ioread32(&chip->reg->regs[chip->ch].pm);
+	pm &= BIT(num_ports[chip->ch]) - 1;
 	pm &= ~BIT(nr);
 	iowrite32(pm, &chip->reg->regs[chip->ch].pm);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
-- 
2.25.1

