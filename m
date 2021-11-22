Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BBD45941E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 18:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240130AbhKVRpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 12:45:47 -0500
Received: from li918-116.members.linode.com ([45.56.68.116]:47296 "EHLO
        weed.darkmist.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240108AbhKVRpr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 12:45:47 -0500
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Nov 2021 12:45:47 EST
Received: by weed.darkmist.net (Postfix, from userid 1000)
        id C8E2C35185; Mon, 22 Nov 2021 16:36:06 -0600 (CST)
Date:   Mon, 22 Nov 2021 16:36:06 -0600
From:   Ed Schaller <schallee@darkmist.net>
To:     Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org
Subject: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <20211122223606.GA20997@darkmist.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new IDs of the Intel Lakefield chip to the list of supported
devices.

Signed-off-by: Ed Schaller <schallee@darkmist.net>
---
 drivers/mfd/intel-lpss-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index a872b4485eac..9700e5acd0cd 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -359,7 +359,14 @@ static const struct pci_device_id intel_lpss_pci_ids[] = {
 	/* LKF */
 	{ PCI_VDEVICE(INTEL, 0x98a8), (kernel_ulong_t)&bxt_uart_info },
 	{ PCI_VDEVICE(INTEL, 0x98a9), (kernel_ulong_t)&bxt_uart_info },
+	{ PCI_VDEVICE(INTEL, 0x98aa), (kernel_ulong_t)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0x98c5), (kernel_ulong_t)&bxt_i2c_info },
+	{ PCI_VDEVICE(INTEL, 0x98c6), (kernel_ulong_t)&bxt_i2c_info },
 	{ PCI_VDEVICE(INTEL, 0x98c7), (kernel_ulong_t)&bxt_uart_info },
+	{ PCI_VDEVICE(INTEL, 0x98e8), (kernel_ulong_t)&bxt_i2c_info },
+	{ PCI_VDEVICE(INTEL, 0x98e9), (kernel_ulong_t)&bxt_i2c_info },
+	{ PCI_VDEVICE(INTEL, 0x98ea), (kernel_ulong_t)&bxt_i2c_info },
+	{ PCI_VDEVICE(INTEL, 0x98eb), (kernel_ulong_t)&bxt_i2c_info },
 	/* SPT-LP */
 	{ PCI_VDEVICE(INTEL, 0x9d27), (kernel_ulong_t)&spt_uart_info },
 	{ PCI_VDEVICE(INTEL, 0x9d28), (kernel_ulong_t)&spt_uart_info },
-- 
2.30.2
