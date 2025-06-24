Return-Path: <linux-gpio+bounces-22045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19235AE5D2B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 08:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F9797B0AC3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 06:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A18E248880;
	Tue, 24 Jun 2025 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LIJviuAR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5B2472B0;
	Tue, 24 Jun 2025 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747902; cv=none; b=G9yyJqz7Njq8vuYs047KjxlXciXQmtFtBk9b2fzk1VWIMu7EnN05zuT6Gh2aBvd80kk5P7vTWQDcj8Tcy4R6PySv/QaodHnZpy2ZSuw2AOasWYjjj9lcjLHUCGiTpWdG3s/vyzc+p6GHqQbabbWPJuZWNJYffMpd5gHyf9XHgRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747902; c=relaxed/simple;
	bh=5aKCggvOJxLCD7EswMpRU6RabM7vBq0MzzQon9YpWZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cXg+imICv8ERX8zhtRWDP16Q7M3Uwg0EUkQTw2GxMvuJZAjuitQ/7zbcwoMahwpcId5uATRrbI8Yn4kpcA0QBQlN4GGSQPdJFadQ0vSCP/PSFIEhets5SQ3lCfEEXvx/YBlZjRxUZUSn6N5OCIV0y0lwX/aqlopuAEOJ1KwhfWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LIJviuAR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKmVPo009499;
	Tue, 24 Jun 2025 06:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DHmFpKA2pR57THdjEkkqRC8I8y4RsOFi7aJ
	IAlQWDsA=; b=LIJviuARTO+i/NvtjxyzQ0ESCv9vftIEY7KPGG0GF8V/XXh5dOA
	gkZHqtpnGBO1fEJDo8Ua+kXEqWDO+p73QkJDxMimi5w5DvZVMIHTU0CJdFM//DSt
	fC6wLhd7b7uK9Y6fyPMA9TZJ9AxVGqtxySMDnr5Ki68NSo7vr43Jf+OrA/1KqOKv
	M7FTIv8e2Ymr4GHJ8Pc/kKpLxEUWT9dT3ryUeNjYFUIDc9G8T5HgRfSlW41IkoPX
	G2f8AlqUzi5+P+8+tkZwJJtuDd09MDfcQnYYyeMuZCvw29Nr3/gltNPSeGvOfIls
	NH6UmhUFXzQin5FCA/Vw29NHdZlEcrdecVw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt9d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:51:34 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6pVH8010679;
	Tue, 24 Jun 2025 06:51:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 47dntm3rfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:51:31 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O6pUMI010672;
	Tue, 24 Jun 2025 06:51:30 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 55O6pUiB010527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:51:30 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id D405337A5; Tue, 24 Jun 2025 14:51:28 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH] pinctrl: qcom: add multi TLMM region option parameter
Date: Tue, 24 Jun 2025 14:51:21 +0800
Message-Id: <20250624065121.4000885-1-quic_yuanjiey@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a4af7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ZPOA_RKLrMsrJ4bpLEgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VP7j933ZV6sTAfVedLceMJdoGqnfoDxJ
X-Proofpoint-GUID: VP7j933ZV6sTAfVedLceMJdoGqnfoDxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfXwWMWmdvtWvI3
 CrfyPmY0P1e43TQ4fFXtM4EyG13X1C7r27hzFWhcIRNdqqWjTHXvQYohQppMEMHAHOPHAaFY1/M
 UQJnKVrl0D+iBrPwab8gis7Jxbbi2FZJOgnPrv2wq/E1r8C/jF32YxQkSXjT0sbk+iInJdjJXxy
 133YSEBs19XeBUWZGKd2jK0eq7bu+dvHf9hAZBS3wGuiDIHm7oop63CMkvXqsfQXw86DIBXhPkh
 dnUk42i56pVwDRQufhdb3IxJAu1uYqcLdWVMtSQDSoWTq2Mts8CS3R/IytBx7FYQWrz4AP9vPc2
 iskqAPJk7L++CsdwT04PsMHfIdBqR//4OyZgrf9aE8YK5YvmaGo4HbsDlhBL6Lbw99jEesYqE5J
 ABNrLZxCFjDbbVcKYsrWevnk4XWe/fpQhqh/JSOcb0Iq3KDJzXxRJa2Es724gbY5OsW1b66a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240057

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
 drivers/pinctrl/qcom/tlmm-test.c | 42 +++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7b99e89e0f67..b8040c440fe9 100644
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
@@ -570,6 +574,42 @@ static const struct of_device_id tlmm_of_match[] = {
 	{}
 };
 
+static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
+{
+	const char **reg_names;
+	int count;
+	int ret;
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
+		for (int i = 0; i < count; i++) {
+			if (!strcmp(reg_names[i], tlmm_reg_name))
+				ret = of_address_to_resource(tlmm, i, res);
+		}
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
@@ -588,7 +628,7 @@ static int tlmm_test_init_suite(struct kunit_suite *suite)
 		return -EINVAL;
 	}
 
-	ret = of_address_to_resource(tlmm, 0, &res);
+	ret = tlmm_reg_base(tlmm, &res);
 	if (ret < 0)
 		return ret;
 

base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
-- 
2.34.1


