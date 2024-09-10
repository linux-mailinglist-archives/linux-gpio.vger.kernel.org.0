Return-Path: <linux-gpio+bounces-9937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA3973DC1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 18:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37151C251FA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 16:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B11A2550;
	Tue, 10 Sep 2024 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FRadL2fu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F11A0729;
	Tue, 10 Sep 2024 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987049; cv=none; b=dEBgvbgF9effUTyJCQfJvPw47i6w69n4ydA9xM5IFub62dg/48A2Euj6h0jkB15e6vYnDqOkhaaB0J5lymwzEJqBQgyUM6QzrAUZyXha90BD9QuMXzdRdhaU4x0aORgk30RDvrB3FzibzZeCNvp7EUlV9a7k2Vl4+shDlBjtGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987049; c=relaxed/simple;
	bh=hn32+nLIPsJdBZLDtjJUW1S+s9pXJdgyRmyAbrJ3xvA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VbnN9SLMDMQC3UPtEiQkOf7w0pM5F2+DuDIUUcq82G/WbqBY6EfG+d3UWvi+PoyFOmlWdcpj/z57wa/Xs4v32h1NxvUs70l9Nzd4VIA9Uj2SKQyNF0mVdznbwTGiPx5eY0mhVOo8Z+8iDHrUegHbJeJ45MNWV7pvwK3jSfTC4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FRadL2fu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AEV8oC000514;
	Tue, 10 Sep 2024 16:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wSySHV0OBt861k7egZN9XT
	ajNDWSLjiqaFWg2xR1lp8=; b=FRadL2furQ7V+akIQc32T0Pb8Y5aANAHiRfk2G
	kmbuMPCyNcKE5KtJ+AnzwzXE97MPKulmycbPgzCyhsw70vzVEmu+Mc0D+lknCNqA
	aBBwXrdiBfi0pVdiDE/RJCDLckdiYJbWzA8oTsZC6t1V2pAcaIVU2xJd9g8rsuCn
	CgPE9KmCim0e/f8n/edJHFoA+Uh3DnW8oaJMAdF0xP3S6YLF5yDc/P9FgZx11se7
	7qt6Hqxiae43dgTwNDP82IPn74sC17oEtY418O4/yZ4CYntqkQEZg3q2OnxJ6+CQ
	qmZCLawWKrbfAhQwlEPvvufVEaEL775LQRYHz12yVkppWwCw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy516nve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 16:50:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AGofkV013112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 16:50:41 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 09:50:38 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <linus.walleij@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_psodagud@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
Subject: [PATCH v4] dt-bindings: pinctrl: Add SA8255p TLMM
Date: Tue, 10 Sep 2024 09:50:26 -0700
Message-ID: <20240910165026.2406338-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wqvEGwXEne_Gy9-MOaI775I1m-Nm1CMQ
X-Proofpoint-GUID: wqvEGwXEne_Gy9-MOaI775I1m-Nm1CMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409100125

Add compatible for TLMM block representing support on SA8255p.

SA8255p uses the same TLMM block as SA8775p however the ownership
of pins are split between Firmware VM and Linux VM on SA8255p. For
example, pins used by UART are owned and configured by Firmware VM
while pins used by ethernet are owned and configured by Linux VM.
Therefore, adding a sa8255p specific compatible to mark the difference.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---

Changes in v4:
	- Removed items tag

Changes in v3:
        - Removed the patch from original series[1]
        - Fixed mising spaces schema errors

Changes in v2:
        - Modified subject line
        - Fixed schema to include fallback

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
---
 .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index e9abbf2c0689..2520ae8b965d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -17,7 +17,12 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sa8775p-tlmm
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sa8255p-tlmm
+          - const: qcom,sa8775p-tlmm
+      - const: qcom,sa8775p-tlmm
 
   reg:
     maxItems: 1
-- 
2.34.1


