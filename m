Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F8931C9B5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 12:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBPLcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 06:32:36 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:60574 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230187AbhBPLcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Feb 2021 06:32:24 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11GBUR4U003803;
        Tue, 16 Feb 2021 03:31:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0220; bh=Ygij6HNrABKU1KYvy0RHLUzIehSmfOxrnyfacbENG+w=;
 b=MmVsnsAfE64w/NamTF6cEr99C+TfpEd5kKJjOXHliVXvmHNTOfDMSVxlWuvNJ9XGZR2m
 hL7NUJkwtWK4DmDYAzSxxcgvz4YLnkfD4B1s43zBTsKZSZdgP6kkqXK5t80se44Yw5Mj
 WSnZOgAyzEoUMLVxinfHXy0bNxxlg6N+ziIipd1wYIPgKea0l43yikdVzBcta3jv6kgV
 hJWgONFD/4uaIlD/KelsvRNuHoKCRDIkNRitFHlrL2RZ+x+qbNvjxlrkRp2n82Vf7vxy
 ioHTaxIGAHROsZnHq1a9UBQVPzycylYmnB4Gbvh8ApWSZ8dKPm/+frRjcECefUuDHUWx AQ== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com with ESMTP id 36pf5txsfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 16 Feb 2021 03:31:37 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:35 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:34 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Feb 2021 03:31:34 -0800
Received: from octopus.marvell.com (octopus.marvell.com [10.5.24.3])
        by maili.marvell.com (Postfix) with ESMTP id 66EAE3F703F;
        Tue, 16 Feb 2021 03:31:30 -0800 (PST)
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
Subject: [PATCH 2/2] drivers/pinctrl: armada-cp110 - fix MPP54/MPP55 functions
Date:   Tue, 16 Feb 2021 13:31:18 +0200
Message-ID: <20210216113118.17484-3-kostap@marvell.com>
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

The function name is used for selecting MPP functionality and
should be unique within function names of the same pin.
This patch fixes function names for MPP54 and MPP55 that
have two different functions named the same.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 17491b27e487..8ba8f3e9121f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -519,13 +519,13 @@ static struct mvebu_mpp_mode armada_cp110_mpp_modes[] = {
 		 MPP_FUNCTION(4,	"synce1",	"clk"),
 		 MPP_FUNCTION(8,	"led",		"data"),
 		 MPP_FUNCTION(10,	"sdio",		"hw_rst"),
-		 MPP_FUNCTION(11,	"sdio",		"wr_protect")),
+		 MPP_FUNCTION(11,	"sdio_wp",	"wr_protect")),
 	MPP_MODE(55,
 		 MPP_FUNCTION(0,	"gpio",		NULL),
 		 MPP_FUNCTION(1,	"ge1",		"rxctl_rxdv"),
 		 MPP_FUNCTION(3,	"ptp",		"pulse"),
 		 MPP_FUNCTION(10,	"sdio",		"led"),
-		 MPP_FUNCTION(11,	"sdio",		"card_detect")),
+		 MPP_FUNCTION(11,	"sdio_cd",	"card_detect")),
 	MPP_MODE(56,
 		 MPP_FUNCTION(0,	"gpio",		NULL),
 		 MPP_FUNCTION(4,	"tdm",		"drx"),
-- 
2.17.1

