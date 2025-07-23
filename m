Return-Path: <linux-gpio+bounces-23663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BFB0EC69
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 09:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633153BCB17
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 07:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D026727814F;
	Wed, 23 Jul 2025 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOjtkfpd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2651274B3B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257192; cv=none; b=Emcchsrz48a7Bb6J4xPl/oVHJlJuyLe1poJhY1KF8uciusmmrboEGcQ1rqWGgtL1XxltpujJ3uYGx/co4Xq6ANLRunRbCC6yLpaVLokU/3ymc4dZpKHX0fCwKOlDvAB9vXK+qRk33YzPnKkikzX0Y3JYNjXVweFjjopGRm3O3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257192; c=relaxed/simple;
	bh=0KSMWlwmOQexTzUypiaXdDYCsjg5c7Njq7vNQ5cw0cI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2dUU3xYPS3qfLCWuPjg29GxAsUkrr88Xv5YjhpXj7MObp1mLH9wTWvNmGKSz4IwMa4gpmG4f0lwltrU5xGRvUHiijxfDQdjcplmZg288asL7VHYZxNk4p2l/FqAJPHijlR4ySTe0sADdSs3tVFBG4VPINqzuMbZGC6IkjAQ2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOjtkfpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNvMV019487
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 07:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SOMoCK5Z62kbEUSptCNX5RZ9a4811e3udrv
	9blV63po=; b=pOjtkfpdQDobqg6J499di8oTM4TOvLfb0iH97RKnHtRNYnYQedb
	jpkDvTDcOOnU1wHhnHlmw9Qx/JM5XaiRZH4MPwMgu+OoIZoZm7cWyJnTsfXPcVbd
	ui3Dwird7tB7olJOEmipe0vovUMCmwE8ZUkhfAHaraYhKR+Y/zPHbFFuFIWMTZKc
	tArrmMbTFY7jmp7hfdPrgCseghY7ut8GYs+sIObd2Y3mVMhUkFmxREVc7BryCVHM
	1Q7v+mzwEDL5S5IOxOjaejirbgl1IBEMfXwR0nKlFrXx07mT26ga3NWnoQy2aRPq
	S0wy5EZlT/Pdbce5v8oIK0VtxnOwV3b/1Kg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6pgnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 07:53:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso5519452b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 00:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753257187; x=1753861987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOMoCK5Z62kbEUSptCNX5RZ9a4811e3udrv9blV63po=;
        b=WZEf+p5TkdBzsKKPW2y5Uil4ArCgYyHV/P/KcMf/8WH+Nqkn9vARmHU2oXhpKk2u/+
         IB5dliJMNNvg+LgXmhhVO32tB5MRbn/fuMDQ8ZleiJEZOj29wMV7T6/qkTdI4z+Jggfp
         LA8XajZM3M9QcU/0fGyNAPDybTX3KA/K/qx+MXXfRnWKCWWTUjI89Gf9W52XBAT/5+Dq
         wTnJh0qgrKgz4r4EqbKsCAwgorCC3rWibDIb2O/p57GDWIJyFDhJYG0o4Kar0Z+z9LuF
         jYH3sUYm/YrK/nj4nq0bN/gucHw7G0Z4XudmsdoQsOYARQjCdOAgGeh2+w8y85k2Enii
         lz/g==
X-Forwarded-Encrypted: i=1; AJvYcCX+nd0lSdPlGSKBQAa/oi9uwBaKNCmLuUsNVWEIAmqF0zvlhuPUK53qAuhHuFTfw0bACftpIOWjTheN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kBUnYaWUu/FxJu8J/lrSGAnI6o+i7gDLQ5et2eSmsB1rcMcD
	u5GAtRxJKassO96p+0ma0qZnGLVOslw5CaiQpfkKtefAqdkCAZzw/ONknbAW+3jFlCOltoO6UyJ
	EYr6QKVwiOaf3/kcuw8BM2MFtagepUNUYOofRZz/Hc8SZciSqho4gGFRRw97gruYK
X-Gm-Gg: ASbGncu7CELkbotwG0zhhnKkNyy9yN1hrX/IyTJrLWpvR38d0k5DzqxbkFHWMhEtp0M
	zzdZZ4qZkTzkGiyLn5wXxZm40b7dZ6XemxIMPPtCF3pQwzKoFS/Ttwyyz8z2gEWhYgclfuWvAXd
	dpcNScroJFoRn1eIuxKHbc6ibmEpojvcDwVnCv9ReScyJs/OYu2yN+e8eGtRxdsialUeISdOk6G
	RbdSQyuTwQmPupkWAA05BaxfTdvDcPJUH771njGxS1ZDr9mKCRevUCyHbI3H1q585kqeByopjAK
	E1MAhYfwzod+iDFf/LmGXSLdmUMF4Urse0EWCgtQrqAb9DBG0M2sGk6oXqFMY3hM8iSrv9cKKeb
	+MWjY4KoVxhpGxCk=
X-Received: by 2002:a05:6a20:748f:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23d49136ea5mr3637343637.31.1753257187263;
        Wed, 23 Jul 2025 00:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUAGcYxje+EhTOZciJRbvuAo0LH8110NzyFn9Q0lgKpHEpXgrJWvgD0QcKFF3FowijVLcrGg==
X-Received: by 2002:a05:6a20:748f:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23d49136ea5mr3637311637.31.1753257186749;
        Wed, 23 Jul 2025 00:53:06 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2a6esm8609161b3a.11.2025.07.23.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:53:06 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: kernel@oss.qualcomm.com, quic_tingweiz@quicinc.com,
        quic_yuanjiey@quicinc.com
Subject: [PATCH v2] pinctrl: qcom: Fix logic error when TLMM reg-names property is missing
Date: Wed, 23 Jul 2025 15:50:24 +0800
Message-Id: <20250723075024.4604-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=688094e4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WDoE7Cz0S_A2IT9AzmkA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Gwb-Hl_IFjwhnEME7pX8texAs3F1LG6v
X-Proofpoint-GUID: Gwb-Hl_IFjwhnEME7pX8texAs3F1LG6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA2NiBTYWx0ZWRfX0r9z8jt0ovUo
 BsyH9mLr85yM+AyOX4H/V5kko9itql5VU7qr23jDp5L/uJWuM5NSOpF6AAr1q+6DG8V3yxK2JHo
 gFZOVpw4y3kYRfv33VIv9uG6JVellTIY7DCy/Bhm5ulzRj2h7kc7UmDArT1QbZGs7CuDdmYSUnY
 s41fy7rL326djll3ifgf0h7D9dKqD29+QvNoup0tq0RvixXXKcd5otDyKNaSQbJ4pe3eZ9EIFYJ
 l7SmAtMhtP0dr7JT1qPax63M+Pa/e6ig6X14p/deqjYxQSIHJi2WdGmLohzpO+Pkb1CzIKwKGSe
 l68UsqUMVS2o3pUoM8FRiN5HSeNFdYx4D7LHkTchm+JWIu/bUwBQ7zAllGNKh2gD7dJbOxKRspc
 pawr4TWqshRN11NXnorwoMN6lmq5THLWALYbsddLebfT/F7UJamXE7Z6k1Diojpb188sfkWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230066

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Some Qualcomm platforms, such as sm8750.dtsi, define a single TLMM
region without the reg-names property. This is a valid and expected
configuration. However, the current code incorrectly treats the absence
of reg-names as an error, resulting in unintended behavior.

Refactor the logic to handle both cases correctly:
If only the gpio parameter is provided, default to TLMM region 0.
If both gpio and name are provided, compare the reg-names entries in the
TLMM node with the given name to select the appropriate region.

Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

---
- optimize commit message
- optimize code structure and fix kfree issue
- rebase on tag: next-20250723
- Link to v1: https://lore.kernel.org/all/20250722054446.3432-1-yuanjie.yang@oss.qualcomm.com/

---
 drivers/pinctrl/qcom/tlmm-test.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 7d7fff538755..e41fe7e76c80 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -581,10 +581,13 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 	int ret;
 	int i;
 
+	if (!strcmp(tlmm_reg_name, "default_region"))
+		return of_address_to_resource(tlmm, 0, res);
+
 	count = of_property_count_strings(tlmm, "reg-names");
 	if (count <= 0) {
 		pr_err("failed to find tlmm reg name\n");
-		return count;
+		return -EINVAL;
 	}
 
 	reg_names = kcalloc(count, sizeof(char *), GFP_KERNEL);
@@ -597,19 +600,16 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 		return -EINVAL;
 	}
 
-	if (!strcmp(tlmm_reg_name, "default_region")) {
-		ret = of_address_to_resource(tlmm, 0, res);
-	} else {
-		for (i = 0; i < count; i++) {
-			if (!strcmp(reg_names[i], tlmm_reg_name)) {
-				ret = of_address_to_resource(tlmm, i, res);
-				break;
-			}
+	for (i = 0; i < count; i++) {
+		if (!strcmp(reg_names[i], tlmm_reg_name)) {
+			ret = of_address_to_resource(tlmm, i, res);
+			break;
 		}
-		if (i == count)
-			ret = -EINVAL;
 	}
 
+	if (i == count)
+		ret = -EINVAL;
+
 	kfree(reg_names);
 
 	return ret;

base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
-- 
2.34.1


