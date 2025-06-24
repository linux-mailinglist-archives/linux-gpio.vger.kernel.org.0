Return-Path: <linux-gpio+bounces-22050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F21AE6032
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 11:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FE9919243E2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 09:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0EF27AC34;
	Tue, 24 Jun 2025 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZOM+WFCg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184D19CD01;
	Tue, 24 Jun 2025 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755978; cv=none; b=AZ8Qstq7ywG2sfXJyiqQ6yPZK3P6D/cuyjCjC22cqLvo6cdG0LbLflaHaDR0KtzWC8lY0E1Q5bGgEPieVUxjBMdoZr0QUlZTLbT5Xrery700Sk/9k3i/Ac2J/+USfxUCpkW+Q3BRLdT17Or6io785Bf0i+p1Bp2qwCSP53IcEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755978; c=relaxed/simple;
	bh=HsWccBeQOAdF9Qsr2o+WddLltnhc1Ev0pc3kEbe3iY4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F9wQppLjZQfKF1dZO08L2VlX8uOlm8Yj2LK2wGEjJkoM44ix07CdzrBmYR/pjTMxt7UMVoCoWnOCVE8ty5fjxNA5XchXz2b2Mt0WDLNoAcJex/4pY+6675frB8CdRD0a/nMt0geFBuaCHLOuAvaZzbfILvNtYklh8vCW/S+xBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZOM+WFCg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8xQV0022985;
	Tue, 24 Jun 2025 09:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XQk0+U0bQplq6kWPaa4GSZLJWHoca74kTIK
	1mfcnAHE=; b=ZOM+WFCg6+E5vfpCvV2dpwqoe+QFDZKT445gAWjP/S9MOWp0LWP
	rtu1IsQg5QkVLD52agnhl+MOwcg6+MC+q6WsG/qutQ/Rt81YWUcbp9bcgstw/vtK
	HY5yk6eU8QqLc8D/u7mkMwPblVb3IaKadyZeLFL6alT30vQuUfdqxdTFtQiHWPCl
	Rhb8+sXlyv0IEVe1afiqiQqZXgDIKJleL0xJ5IQizqj7EpyuPHaQT8Xy9FLsMT5M
	LUxk2i3FRZbaiNMa6xgp6aTJhMAOrjYkdvDL/+CvBslfogeoetkQta4buqmvooxJ
	j981dH1XvuJhdoyX/VJwfTaeU8u2Maq2ucQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgbg0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:06:11 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O968RM030167;
	Tue, 24 Jun 2025 09:06:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm4axq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:06:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O968l2030161;
	Tue, 24 Jun 2025 09:06:08 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O967Q2030160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:06:08 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 8584B37C3; Tue, 24 Jun 2025 17:06:06 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v2] pinctrl: qcom: add multi TLMM region option parameter
Date: Tue, 24 Jun 2025 17:06:00 +0800
Message-Id: <20250624090600.91063-1-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qAYcjN7DvlgY23TohpjWPL1oZxHfcPS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NyBTYWx0ZWRfX+eQU/aRLmmJv
 7z7KdqkzmK/nZUUnaAhJxIfdU4oScbRJIN1MSbGCmsKG9HdO/uDfMaY6Wpld0yaaK6sDA4p9k7I
 iHC4LF4PgIOYzb1SUDW5wUawbQT4Cm1uiccvJSeJ/9h3EtqRJP4w/IYRv9nKHriXO3xNMtB3spz
 TP5Q8fVH2DqbxLWHkgzB5WDN59ZCZE2oDPhZcCAmO1S5GoWhXPRAsObfsRhX9sk2beiUJBqxyas
 QZiOmS9Qr70aGw15aAv8MtJDV3qMBCq1KqkrI9YfXIM0X53hF44wzSnQ+hN0fDmBz66yUpIm4P5
 YDCLx/NHas20pFL97xDsg1cPm5KaJXOLS2WQ6Gf8GZWNHmHaKPc8DsGZOyPnzEsA16V84yhu757
 Gl6AiWEw/TWx9xbFbq3VsqmwOSJLRMksFf5T29OwxKSz8V8KZ/8nl9u4BeDZXUiIGc0A08SM
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a6a83 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vwwexvYrekbnnILydekA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qAYcjN7DvlgY23TohpjWPL1oZxHfcPS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240077

Add support for selecting multiple TLMM regions using the
tlmm-test tool.
The current implementation only selects the TLMM Node region
0, which can lead to incorrect region selection.

QCS 615 TLMM Node dts reg:
	tlmm: pinctrl@3100000 {
		compatible = "qcom,qcs615-tlmm";
		reg = <0x0 0x03100000 0x0 0x300000>,
		      <0x0 0x03500000 0x0 0x300000>,
		      <0x0 0x03d00000 0x0 0x300000>;
		reg-names = "east",
			    "west",
			    "south";

QCS615 gpio57 is in the south region with an offset of 0x39000,
and its address is 0x3d39000. However, the default region selection
is region 0 (east region), resulting in a wrong calculated address
of 0x3139000.

Add a tlmm option parameter named tlmm_reg_name to select the region.
If the user does not input the parameter, the default region is 0.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
Changes in v2:
- when input name can't match reg name, set error code
- Link to v1: https://lore.kernel.org/all/20250624065121.4000885-1-quic_yuanjiey@quicinc.com/

---
 drivers/pinctrl/qcom/tlmm-test.c | 47 +++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7b99e89e0f67..7d7fff538755 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -16,6 +16,7 @@
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 /*
  * This TLMM test module serves the purpose of validating that the TLMM driver
@@ -38,7 +39,10 @@
 #define TLMM_REG_SIZE		0x1000
 
 static int tlmm_test_gpio = -1;
+static char *tlmm_reg_name = "default_region";
+
 module_param_named(gpio, tlmm_test_gpio, int, 0600);
+module_param_named(name, tlmm_reg_name, charp, 0600);
 
 static struct {
 	void __iomem *base;
@@ -570,6 +574,47 @@ static const struct of_device_id tlmm_of_match[] = {
 	{}
 };
 
+static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
+{
+	const char **reg_names;
+	int count;
+	int ret;
+	int i;
+
+	count = of_property_count_strings(tlmm, "reg-names");
+	if (count <= 0) {
+		pr_err("failed to find tlmm reg name\n");
+		return count;
+	}
+
+	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
+	if (!reg_names)
+		return -ENOMEM;
+
+	ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
+	if (ret != count) {
+		kfree(reg_names);
+		return -EINVAL;
+	}
+
+	if (!strcmp(tlmm_reg_name, "default_region")) {
+		ret = of_address_to_resource(tlmm, 0, res);
+	} else {
+		for (i = 0; i < count; i++) {
+			if (!strcmp(reg_names[i], tlmm_reg_name)) {
+				ret = of_address_to_resource(tlmm, i, res);
+				break;
+			}
+		}
+		if (i == count)
+			ret = -EINVAL;
+	}
+
+	kfree(reg_names);
+
+	return ret;
+}
+
 static int tlmm_test_init_suite(struct kunit_suite *suite)
 {
 	struct of_phandle_args args = {};
@@ -588,7 +633,7 @@ static int tlmm_test_init_suite(struct kunit_suite *suite)
 		return -EINVAL;
 	}
 
-	ret = of_address_to_resource(tlmm, 0, &res);
+	ret = tlmm_reg_base(tlmm, &res);
 	if (ret < 0)
 		return ret;
 

base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.34.1


