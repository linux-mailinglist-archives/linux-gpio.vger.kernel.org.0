Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032FD724732
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbjFFPEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjFFPEa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:04:30 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852C8101
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:04:28 -0700 (PDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356B1DQU027224
        for <linux-gpio@vger.kernel.org>; Tue, 6 Jun 2023 08:04:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=l91OHlo9kjvtY1zScA4k/0RDrIv4ij66ZeVneEzLILM=;
 b=K0HCO/u1IaRw5JAknYT4kWHemacVDjje9pV+sc2IOXqXWzsDvY+srYy9Wez+GjGbQNWA
 /3Sq68lDe9nDIEG843ANdSXvxAFxBvSBjGxSAuCG04p7D7mCOUDyslYcV90vZXOFcVLK
 m+DYOCZyXW2vZIeiMGqTyYKj6w2leojmn71taX7qSEyR8N9fwqPzNYNaIvhkt32517YH
 1efeeSzLa4v6uWB4fMYKpJcMRf018cfPH+fHQs+x6BJy5dABsC1erd4O85P/RYIfgalm
 Y5/czfp77BjFct6jSEClJr4hLQZFPTnsNJUd++l1aEdtd8GQoZs7e+dZpMbbFjqw7dKP Og== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t3ae2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:04:28 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 08:04:27 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 08:04:27 -0700
From:   <joe.slater@windriver.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [libgpiod][PATCH v4] gpio-tools-test.bats: modify delays in toggle test
Date:   Tue, 6 Jun 2023 08:04:27 -0700
Message-ID: <20230606150427.3999216-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sB-nzCxHqh0FSOBs5SABttbVH_AJITiH
X-Proofpoint-ORIG-GUID: sB-nzCxHqh0FSOBs5SABttbVH_AJITiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_10,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=595 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060128
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joe Slater <joe.slater@windriver.com>

The test "gpioset: toggle (continuous)" uses fixed delays to test
toggling values.  This is not reliable, so we switch to looking
for transitions from one value to another.

We wait for a transition up to 1.5 seconds.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index c83ca7d..929c35a 100755
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
+	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
+
+	for i in {1..15}; do
+		[ "$(<$PORT)" = "$EXPECTED" ] && return
+		sleep 0.1
+	done
+	return 1
+}
+
 gpiosim_cleanup() {
 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
 	do
@@ -1567,15 +1581,12 @@ request_release_line() {
 	gpiosim_check_value sim0 4 0
 	gpiosim_check_value sim0 7 0
 
-	sleep 1
-
-	gpiosim_check_value sim0 1 0
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

