Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E59B722F10
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 21:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjFETBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 15:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjFETA7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 15:00:59 -0400
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6EDEA
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 12:00:57 -0700 (PDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355IHvoN030952
        for <linux-gpio@vger.kernel.org>; Mon, 5 Jun 2023 12:00:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=LE7y1WRcTCOHWOqzt6nd2kaqbK+XGFhobBnpYJzoTlg=;
 b=NW3AykPRh/iDb04dHx3l149qCMf3opEBPMTGmOM6/AQTTUB9TbR2jO9MPTaXCSFdDb1R
 J8tNjSCwyu6+7igxjlsV2dTc+/39r+f2zfWFpLWNtPf6kRtyCwdRXwudqKfCJcGZLOjT
 QG7j8kTHtVOylSsEw5fBHSXbZn5fmezngml7yvu/jzMZMAbwRYnBiD+CgjbIZG4qyPzW
 ApNE7mumim2xC1ysKj/at+9jUVVgpL5ORUvzzolIF494+JAjGaztFsI+ra9rYINc9bIA
 kO2nxvGPjfEcARUg1Ws1NHmD5l4Rff4mOZMtDZCz1wHk/9p0xy3gWlG3J/MjvC2oWEmy PA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t39nh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 12:00:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 12:00:56 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 12:00:56 -0700
From:   <joe.slater@windriver.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in toggle test
Date:   Mon, 5 Jun 2023 12:00:51 -0700
Message-ID: <20230605190051.3915571-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VsCC-rT2GQQXTqg76qeFvWcJIblVKumu
X-Proofpoint-ORIG-GUID: VsCC-rT2GQQXTqg76qeFvWcJIblVKumu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-05_31,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=542 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050163
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 tools/gpio-tools-test.bats | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index c83ca7d..f7a0e38 100755
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
+	for i in {1..15} ; do
+		[ "$(<$PORT)" = "$EXPECTED" ] && return
+		sleep 0.1
+	done
+	return 1
+}
+
 gpiosim_cleanup() {
 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
 	do
@@ -154,7 +168,7 @@ gpiosim_cleanup() {
 		ls $BANKPATH/line* > /dev/null 2>&1
 		if [ "$?" = "0" ]
 		then
-			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
+			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
 			do
 				test -e $LINE/hog && rmdir $LINE/hog
 				rmdir $LINE
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

