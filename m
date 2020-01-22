Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5FF14537A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 12:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgAVLLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 06:11:55 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:17694 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbgAVLLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 06:11:54 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00MB3JXr027842;
        Wed, 22 Jan 2020 05:11:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=aVsHz5lbR8Qs2CjSfkaZYb2oisgmRBl63fOUZU0hURQ=;
 b=mkVHCTsc/GafDR/NaP3jPGPKr98G4xPgjAPU1MCJm8iPfB63wk2kk1NsBitSS58nb1Uq
 Mb5clu2/SDnBFGi3NDJoZ9R+0uJoCWfvqNPf4O+/lVvFkr6EGpljpxYJXkRUCyMcy7TI
 bdaJriInBMv4X/vABT2CWrfd//lIsUSzQau1af6GTGFj75CVIMeqsWvxkABkY2u2mwtl
 Mj9/rPTD7q5kHqwB9tjBg3GrY9wWhoK6itgT1r5Sped1J4sNhG1UXyh6++G8Xenb1ZfH
 nsY/3ypdcUgvwbeDcvLVNPYSVNvih4sVpBp/c4CUzAQFimkCrV5H0XCJj6JbAHMTHJwD MQ== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 2xm0a8wd60-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 22 Jan 2020 05:11:53 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 22 Jan
 2020 11:11:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 22 Jan 2020 11:11:51 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 58BE52AB;
        Wed, 22 Jan 2020 11:11:50 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] pinctrl: madera: Remove extra blank line
Date:   Wed, 22 Jan 2020 11:11:50 +0000
Message-ID: <20200122111150.11033-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=1
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=705
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001220101
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index e2f72dcce4c9c..7b6409ef553c9 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -560,7 +560,6 @@ static void __maybe_unused madera_pin_dbg_show(struct pinctrl_dev *pctldev,
 		seq_puts(s, " SCHMITT");
 }
 
-
 static const struct pinctrl_ops madera_pin_group_ops = {
 	.get_groups_count = madera_get_groups_count,
 	.get_group_name = madera_get_group_name,
-- 
2.11.0

