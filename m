Return-Path: <linux-gpio+bounces-23612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1DB0D157
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 07:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1319A1AA253C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 05:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D5728C84A;
	Tue, 22 Jul 2025 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfqZew4R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B9B21CC43
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753163100; cv=none; b=d356usF1POzKylEz7drKTdhvcagjmmakr89Jvf1ps+MFIbIhTtlo445jUGd22nA1gwo5C/3Ir2uwIDniQmzIZNX/yQIrdr46fTmN0uaLR916N52n9c+SkVWZm2MWoPqc28IVKsbG4AXx6xq0y6sQZVNUmxhvAAJggsN34dAC8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753163100; c=relaxed/simple;
	bh=ukjz107venpREw1AXh4B8olSE8I9TNZM92z3x+eADHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U1gyarz74BNPcfA2ayP3ipd5EgEG0nTtJDzgRx0et9zchsC83A9B+UoPWV0RdHLennklrg+/iBHNblSnjUxxGxqzGtPciFvjNbh/hHVkVC+5EFRPWpJjfeqCoFPc1CYQdINKdDw7apJOD7TWGW6XY8TwSyOvsEbP1V+MT44PLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfqZew4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3VXul016585
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 05:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=75DfiJpF1MttMuOkBOXm8Q+i0oMIyLyaAAI
	5qQMiwVg=; b=AfqZew4R8muh4CKK8rI/aLL9YpauWYXGwTy0jrzj9HZSdDVDGpN
	kvmnfyPPHsr0uSJnDXZNeAeEYsydQgMGeEjB8rKThZp8zmSywNFb1XNpe6EXb++G
	ph/NWR04SR7Hp9/Bevm9w8X96bCUrlbWS0nis6bRcPTVGTND35w6ecQw8ZxCY9tK
	k4PBit6ogsMDGz1vgM4IjkgQsMRS5TAS45ppsv6xjyslIzAmEbO11BF4UgEI3E5b
	81TBug5vcvvJ90j019jZbndD0Gw4U3moVjSGkeUApgq+2OnRAo/4NB+uAppTgKUL
	iaO4yzhN2DrESObcL0HQJxZ9q5GfPESLJ5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s095g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 05:44:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2349498f00eso49446595ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 22:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753163095; x=1753767895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75DfiJpF1MttMuOkBOXm8Q+i0oMIyLyaAAI5qQMiwVg=;
        b=dhBExC8Tu9TMYSOpRlbsMlaRUv5mHTaL8nKqslKvtwBgaytrmBlDe4emBzxVzolbOs
         RV9hdDEP+VUIATeRDcPeAflM+zMURwfcJO3ue+iQ5hD1Qoj/t9JBjNSn7uQ99kwKLd3n
         yWvJHG9JoxAOmGJ8XEkWXCN6vgXnm0Sfhf+SEOkBKv4KrR+VmRBQUJ9eLE31L3RUMXYo
         o/GcnwLz8IRoQfMLFAHhUer+aTuh5Ju3R1VBgzMsQIdeEtEe+qa1kxAhV6aGnyTrKTkh
         26soKeFw4f4xnajRDBM4S4Y1/B45EA/mGH8/hy+qJTApKUjVykFF3/lNQfIJjccq4wGH
         vJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLu8m0CkDxeYVVkONy8lneOyu5vha9TY7kVsGbovpeVwJcBikUABEA+NXuXvUhFFbUz9iLXauwSqEL@vger.kernel.org
X-Gm-Message-State: AOJu0YwPko979mv+1t2u1pn8fbN9uRjnvcLVoIbZxIIug0881SGE/PcV
	QDNAILTK7p9F3D1hK+0t9utblH2T6S6vfp+fVpgPoXth0OqseC1ZA0u2Ke176pgbgsV3+tWC0Rw
	F3cA+LbP73JMAYENOsssOefpGS6rYkcGWFiGGBN0m0hDqy4M9lgWS0T8xNMqJL1Lr
X-Gm-Gg: ASbGnctLDsvG/8siLLKxeWdyWIMG46QAKEoUH5aqeQq8MHN8oI2+/PKZBaUzv5EpqIP
	gY7Ls3Ghml0XpgW+5SGjHbcn8cgQX5tnnNAju0/59Mv07g/C+nnEISwtKiZ3Co1s6qumZZ4vzAz
	1rtRe7SxR1XoxxtUy50Y2HCHPxPOcM0LNz8fEJs+MhIeIzY751TChUEMv0PQ84yEe1L7oDPxnlC
	Bddd9AaGfmLXGdYhmI0O+MPafkdJvbOhIgk9pO5XA/z6Pqnd5nJvWGt5OLEmV8YEVhd4LrIBA8C
	QPbH9CNsV2cA2iy/erHEkN/3CKNDoi9uPFf2XwngnQ/LbqaRMtiKiDee3OyP8OvZzrVjXYfuEjE
	bbwS3dhphSpdJiSg=
X-Received: by 2002:a17:902:ebcb:b0:237:e753:1808 with SMTP id d9443c01a7336-23f8accd820mr31458655ad.20.1753163094786;
        Mon, 21 Jul 2025 22:44:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjnBKOTKbEfvmKSJ25MWepQGV65OWl3NjJ9lnM4agFmO6tGJ8XkNxJ1NO5Wil99RX2LWYPxA==
X-Received: by 2002:a17:902:ebcb:b0:237:e753:1808 with SMTP id d9443c01a7336-23f8accd820mr31458375ad.20.1753163094335;
        Mon, 21 Jul 2025 22:44:54 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d65sm67494375ad.109.2025.07.21.22.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 22:44:53 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH] pinctrl: qcom: Fix logic error when TLMM reg-names property is missing
Date: Tue, 22 Jul 2025 13:44:46 +0800
Message-Id: <20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA0NSBTYWx0ZWRfXyUzyx9hJecCp
 TLsldYJVxlwalwexKdUKsCgHEbValx/T8dG3Wi6P26KD2uuFxdSgKwjnl58IOWbIMXjcXqzhzQW
 4KPJIO+KGyimd38fKCjsGI2+PCK5C/XGJKfF+YwGa/Yb7s+1Qq3K2Kgmnc2WKpErfn+LJcF1Fqp
 LdgT+XcnudTCT7UnV4XnZILobIf/z4KnN2e6bHpW02xdGavxqnGRBAE5qHDuTnjtf28DuPzQs1v
 ur+PumRz1d7cNXPcSvjoyKBpANCQ+ipmmVT1s/PXjH4e048IPex0jY1tY5T9LhCT/QSUodedLL5
 5UGwHmox0DQVK0Cm/Mlcyq9Dk+Kqv675ftm5QZ/hNCYxmO82M2ZICF6+hONgbkqVTebaTfASJQk
 kimFwwApDJpoPlX/COvceRddwyzdAvmilhQ1K2U6rCQFFPc3jC/lnFtuBd/tLYUGk/9oF8Xw
X-Proofpoint-ORIG-GUID: IO0Ana9rZFj-Ko7La24CcMpanO8hDUUo
X-Proofpoint-GUID: IO0Ana9rZFj-Ko7La24CcMpanO8hDUUo
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f2558 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WDoE7Cz0S_A2IT9AzmkA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220045

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
region without the reg-names property. This is a valid and expected
configuration. However, the current code incorrectly treats the absence
of reg-names as an error, resulting in unintended behavior.

Refactoring the logic to handle both cases correctly:
If only the gpio parameter is provided, default to TLMM region 0.
If both gpio and name are provided, compare the reg-names entries in the
TLMM node with the given name to select the appropriate region.

This ensures proper handling of platforms with either single or multiple
TLMM regions.

Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7d7fff538755..6de8cf23f9f0 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -581,25 +581,25 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 	int ret;
 	int i;
 
-	count = of_property_count_strings(tlmm, "reg-names");
-	if (count <= 0) {
-		pr_err("failed to find tlmm reg name\n");
-		return count;
-	}
-
-	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
-	if (!reg_names)
-		return -ENOMEM;
-
-	ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
-	if (ret != count) {
-		kfree(reg_names);
-		return -EINVAL;
-	}
-
 	if (!strcmp(tlmm_reg_name, "default_region")) {
 		ret = of_address_to_resource(tlmm, 0, res);
 	} else {
+		count = of_property_count_strings(tlmm, "reg-names");
+		if (count <= 0) {
+			pr_err("failed to find tlmm reg name\n");
+			return -EINVAL;
+		}
+
+		reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
+		if (!reg_names)
+			return -ENOMEM;
+
+		ret = of_property_read_string_array(tlmm, "reg-names", reg_names, count);
+		if (ret != count) {
+			kfree(reg_names);
+			return -EINVAL;
+		}
+
 		for (i = 0; i < count; i++) {
 			if (!strcmp(reg_names[i], tlmm_reg_name)) {
 				ret = of_address_to_resource(tlmm, i, res);

base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
-- 
2.34.1


