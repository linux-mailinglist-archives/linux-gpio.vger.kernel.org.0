Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD3631C9B4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 12:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhBPLce (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 06:32:34 -0500
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:9004 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230183AbhBPLcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Feb 2021 06:32:22 -0500
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11GBVQhX007991;
        Tue, 16 Feb 2021 03:31:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0220; bh=iPQIR33lmjIbQRkNTmFSdiF09dX/ngUSmZXcpjmhTPQ=;
 b=DVjLDIAP6YR5JDOTI3a7PkjbyqOdkbtbd0+qhFta6NRDdE4/Vo4RuQ3AWz19ZbZ9cVHv
 rAcsEuSbFr8kQlUw9Og0BmPZ0pwkUrPwS+sQPgkvAvClCaB3xM0R8WFjQHcmiv9iTvGb
 ZoHTQwLAbNtJIYfffw7WCAG/MKE5SQzAk/ii5mAD4qx2VsZRjvx8Fwr9JFvuz9xI5EF8
 rhpHYwFljHhOBQ7jviixa4xGQn4NkgDjz1Yjo0/0yMf5vL1ZngvGvTPpi7bag9IghSuJ
 iqRIofDVr/anqsmP9SGM3B5wz03lug/3tPpsu+HLdmolZMJQZ/BER0UMdHzQJJg49ofY jw== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com with ESMTP id 36pd0vq7h7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 16 Feb 2021 03:31:31 -0800
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:30 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:29 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Feb 2021 03:31:30 -0800
Received: from octopus.marvell.com (octopus.marvell.com [10.5.24.3])
        by maili.marvell.com (Postfix) with ESMTP id 10D143F703F;
        Tue, 16 Feb 2021 03:31:25 -0800 (PST)
From:   <kostap@marvell.com>
To:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <daniel.lezcano@linaro.org>, <amit.kucheria@linaro.org>,
        <viresh.kumar@linaro.org>, <linus.walleij@linaro.org>,
        <sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
        <andrew@lunn.ch>, <robh+dt@kernel.org>, <mw@semihalf.com>,
        <jaz@semihalf.com>, <nadavh@marvell.com>, <stefanc@marvell.com>,
        <bpeled@marvell.com>, Konstantin Porotchkin <kostap@marvell.com>
Subject: [PATCH 1/2] doc: cp110-system-controller: fix the pin function names
Date:   Tue, 16 Feb 2021 13:31:17 +0200
Message-ID: <20210216113118.17484-2-kostap@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216113118.17484-1-kostap@marvell.com>
References: <20210216113118.17484-1-kostap@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-16_01:2021-02-16,2021-02-15 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Konstantin Porotchkin <kostap@marvell.com>

Fix the pin function names for MPP54 and MPP55.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
index a21f7709596c..0705e765f432 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
@@ -142,8 +142,8 @@ mpp50	50	gpio, ge1(rxclk), mss_i2c(sda), spi1(csn0), uart2(txd), uart0(rxd), xg(
 mpp51	51	gpio, ge1(rxd0), mss_i2c(sck), spi1(csn1), uart2(rxd), uart0(cts), sdio(pwr10)
 mpp52	52	gpio, ge1(rxd1), synce1(clk), synce2(clk), spi1(csn2), uart1(cts), led(clk), pcie(rstoutn), pcie0(clkreq)
 mpp53	53	gpio, ge1(rxd2), ptp(clk), spi1(csn3), uart1(rxd), led(stb), sdio(led)
-mpp54	54	gpio, ge1(rxd3), synce2(clk), ptp(pclk_out), synce1(clk), led(data), sdio(hw_rst), sdio(wr_protect)
-mpp55	55	gpio, ge1(rxctl_rxdv), ptp(pulse), sdio(led), sdio(card_detect)
+mpp54	54	gpio, ge1(rxd3), synce2(clk), ptp(pclk_out), synce1(clk), led(data), sdio(hw_rst), sdio_wp(wr_protect)
+mpp55	55	gpio, ge1(rxctl_rxdv), ptp(pulse), sdio(led), sdio_cd(card_detect)
 mpp56	56	gpio, tdm(drx), au(i2sdo_spdifo), spi0(clk), uart1(rxd), sata1(present_act), sdio(clk)
 mpp57	57	gpio, mss_i2c(sda), ptp(pclk_out), tdm(intn), au(i2sbclk), spi0(mosi), uart1(txd), sata0(present_act), sdio(cmd)
 mpp58	58	gpio, mss_i2c(sck), ptp(clk), tdm(rstn), au(i2sdi), spi0(miso), uart1(cts), led(clk), sdio(d0)
-- 
2.17.1

