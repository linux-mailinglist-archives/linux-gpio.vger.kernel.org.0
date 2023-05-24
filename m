Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCEC70FFA9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 23:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjEXVJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 17:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEXVJs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 17:09:48 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCAEC1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 14:09:46 -0700 (PDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OFr6lL030578
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 14:09:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=xQ/0xVo+5jorMcxZnvzlMzLAl/clkI4uOF8xMzv9lTg=;
 b=pjJLgdifwPYi5OKV+fRN63M1QHTetBZ16SI2kQdwu1mHvgkv36h7YzdiZj23hcHtAETe
 JhU2PH3tI3FSpmQIB3GWFqLhdpB/r3amrnGvIAS3i3j6oEvBb+oX7igYsRsbgZFY+Qzq
 kErSVPQ3n1QuyAt5mTvatFeB9LPFFbErkcci8XUrorM00LrE4RzGQ7iB5uWyihADkw0L
 ywUfldUdKhG96nsiWa0XYuoaU7e0GBDaGP6oj+LkQAJ1LoqV1nXNikAguThyP+bPVdsp
 KD2BPVRiT1wuYmxRvzTIS1AXBuAAjhF5wxPIDYm7AGfmhn4WfWFXvPZZirB7lq3qlI9H EQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhc57m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 14:09:46 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 14:09:45 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 14:09:45 -0700
From:   <joe.slater@windriver.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in toggle test
Date:   Wed, 24 May 2023 14:09:45 -0700
Message-ID: <20230524210945.4054480-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: imwbr8C6mV72czyzaM1Ufli-xnN6VFY9
X-Proofpoint-ORIG-GUID: imwbr8C6mV72czyzaM1Ufli-xnN6VFY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_15,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=586
 lowpriorityscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240177
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joe Slater <joe.slater@windriver.com>

The test "gpioset: toggle (continuous)" uses fixed delays to test
toggling values.  This is not reliable, so we switch to looking
for transitions from one value to another.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index adbce94..977d718 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -141,6 +141,20 @@ gpiosim_check_value() {
 	[ "$VAL" = "$EXPECTED" ]
 }
 
+gpiosim_wait_value() {
+	local OFFSET=$2
+	local EXPECTED=$3
+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
+
+	for i in {1..10} ; do
+		VAL=$(<$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
+		[ "$VAL" = "$EXPECTED" ] && return
+		sleep 0.1
+	done
+	return 1
+}
+
 gpiosim_cleanup() {
 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
 	do
@@ -1567,15 +1581,15 @@ request_release_line() {
 	gpiosim_check_value sim0 4 0
 	gpiosim_check_value sim0 7 0
 
-	sleep 1
-
-	gpiosim_check_value sim0 1 0
+	# sleeping fixed amounts can be unreliable, so we
+	# sync to the toggles
+	#
+	gpiosim_wait_value sim0 1 0
 	gpiosim_check_value sim0 4 1
 	gpiosim_check_value sim0 7 1
 
-	sleep 1
 
-	gpiosim_check_value sim0 1 1
+	gpiosim_wait_value sim0 1 1
 	gpiosim_check_value sim0 4 0
 	gpiosim_check_value sim0 7 0
 }
-- 
2.25.1

