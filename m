Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BB1F2C9E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 11:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388149AbfKGKfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 05:35:48 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15857 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGKfs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 05:35:48 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dc3f3470000>; Thu, 07 Nov 2019 02:34:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 07 Nov 2019 02:35:47 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 07 Nov 2019 02:35:47 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Nov
 2019 10:35:46 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 7 Nov 2019 10:35:46 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.11.187]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dc3f3810000>; Thu, 07 Nov 2019 02:35:46 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] gpio: xgs-iproc: Fix crash when driver is built as a module
Date:   Thu, 7 Nov 2019 10:35:40 +0000
Message-ID: <20191107103540.21088-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573122887; bh=RYTz0Jl2ILzETh0Xix36C/pYhL1SzsDNDWRscJE9ZBw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=nNyi8EhO1rYJ1J2AFvbPB5V3Gc9ao9aXOAtKYzxodEnTaFv6A9IRjXfh2SZOcQahQ
         smnNE+U9rafERVPn9tuktXFSuAalgUfbKAA6kimXjn5wNAt67qHIWEu6sj5B/hpI6P
         UnRT4Z12P82gmpDtZd/Yjpwnn3z0iHJmryFL2L8dofsY3ieoIHsXI6XXFO92/pezot
         uaw1ogJAuDYxuJUQ/HD4oG9RoLhGfbuKTeIsE72DpH3qV8NWjZ4iydT+89is+2KCcV
         ZB5izp/MltbXpmlJJDZXaa2dfVQOvv3/JR0nT48c/aFjYsM6VVcIQLZrmPCA6gzUCT
         b+Zqfq/DV7D/A==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6a41b6c5fc20 ("gpio: Add xgs-iproc driver") introduced a new
GPIO driver for the Broadcom GPIO controller. When this driver is built
as a module the following warning is observed because the
bcm_iproc_gpio_of_match structure is defined with the __initconst
attribute ...

 MODPOST vmlinux.o
 WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from
 the variable bcm_iproc_gpio_driver to the variable
 .init.rodata:bcm_iproc_gpio_of_match
 The variable bcm_iproc_gpio_driver references
 the variable __initconst bcm_iproc_gpio_of_match

This then causes a translation fault on boot which and results in a
system crash. Fix this by dropping the __initconst attribute from the
bcm_iproc_gpio_of_match structure.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpio-xgs-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index a3fdd95cc9e6..bb183f584d92 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -299,7 +299,7 @@ static int __exit iproc_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
+static const struct of_device_id bcm_iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,iproc-gpio-cca" },
 	{}
 };
-- 
2.17.1

