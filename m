Return-Path: <linux-gpio+bounces-23588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E45B0C658
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB03BF3D7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D915F1ADC90;
	Mon, 21 Jul 2025 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+WMDxcw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23369149DFF
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108262; cv=none; b=ieR6TF7OLHP8/jG0DaQiCvtwQGu7SzT+iMwShMI7CAqJWafkQWPF68BrXvPZD5w2CTgct0I3a9CmIxD23LXSiO3X/w06hlbznAsb0MAMiUaCDW88r46XKgig+VSGA+/Nr8wp1LNSpRwdg9yQw6t4fFsQLETVeAvt3nXaq+y/5zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108262; c=relaxed/simple;
	bh=fZh+W/ZwxHCAw9UO9J/kStJAdZaEn8DxlAbvEqkaCIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l3cq8xwx8s4t2yab4JsgJzUzgTUS9w3eW6ccp40WLnYAcbWUWVttPNqfEADGFtGVvEEKrglnmoHlKOHT8Zb5gcEu+O/HPTQQQ8/q8YAh4j/rTmSuQjzQmhv5JE2w9e1nuw52950lDtRPDz9tE0N0TotQYBc5lA1kEmvqkyr8H+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+WMDxcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9mWjm006230
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fB17acm6tcauz9EWmhrWe24ExKFYj74gkCn
	0R6MI3YU=; b=L+WMDxcwc2/AOpU7X4q3PWQ6UfG2odLvmQgoQ5CBCefVM23hI2G
	nUg2FjsGEI4iE3ygzXqho+/6BRVqxyNjslqWbmHsggHzq5OA4ORsbXavHwfvLOXI
	yeiRURCZ7iJ7hcpVTLDqnhgAuSkFLq6Yh/yI2uZ989aru0v8XZG5zdkVkFP3bYn/
	n3C4hF0lNRKfbNdDDJRP3D3ZrhNx3z3UjiUVb7XHuEtiKyeYWA+0CkG4I01FPEJu
	TQzWEeJBP67MCQrbETx6qPr6ROieyfPqPzZ98wkJObN3Iyf8AfcM0cT+Xj2Tbinn
	is8TEITIYfGjLhu4tj+QBLYftbaKy1+Ik8Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q5mmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 14:30:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7492da755a1so3332099b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753108258; x=1753713058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB17acm6tcauz9EWmhrWe24ExKFYj74gkCn0R6MI3YU=;
        b=AKE/zs7v8rRWtZHdpjU5CbaE4ysqyX9/KiDzKUVwsiQ4m9bnWSIWCUwa3+G2nZpBTJ
         AJ9x9y7MqcHj2dbmp4N+ksGCh1S1hcV37NsM/jqdQknxK23mlMRHvkfwi0V090zrDTHE
         0eGV1SCqaeKASeZZ96j/2z+i68p1JMPqZfh0sIUjOjY0e7Tf4sFl5PhT0/3YQKUqxNYr
         E8lGrfdUKzUDS/EQGA6A2T5xlEFHLr6UXn1PlDnkz+K8hGF7Ge5KskhxgOYfDZx33hfy
         Zk37EaE1Tk3ssNTBYhfpqSOIz1KqEUSfnQDA5m+2ROr/lFrV84IZpKhzW0F/BXnY9gKQ
         Z55A==
X-Forwarded-Encrypted: i=1; AJvYcCWPR3JTrGLatXFASV2UZqWgdHMlywtZjXPhO2r7aw3vKdvU4TgH8QyqwHmFmKAQYLejepL9/iCj7+pu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxii260mWSxnPwiBgH1d8sDhmEWdJRhYompTriOMMBkKQ6A54q9
	kiV+OOosrYUH1FXfoFAoD8QPw51D28X3UDkoes5xe4ButXhuZZ/yxrh/p0T19sqcwnxuNCyXdVI
	RxEqdJAx/lC6dKDNhPhOTzQpvIXP7FAi/n3RDuuphHvtNNsLx+BAvgP85ZyEhbuEK
X-Gm-Gg: ASbGncuuqT/x35rSWYQv8OzxBCQ31CmKVqol33exAlrXgHUAHlPnCPpWfJLtaO0Aqjn
	ZlYpx4qqbxjL6skqygNmLXc0RHyAZMJYZq5WKJOHSXD1v1DJpeko8nF9a0UqHQoQwVs5yK+Q0yy
	5nHIv+xI0t1/QRjdc4xqYW9lgnbkg5/W5WrR/av0Dt3k8izaBhNGhNmUOle5VKfSFocpPe4pwWe
	jLRo+I4AB+Dh2OB7xCr3DUuiookx94QfwzMF5j/pSvst6yy7FDniG4/wMdYJdVvCNrJYpyWijuw
	PPnk4EwbI3tF0EehOGRYg38EotTx0OxHo5+VEgkVqbGZhlur4dNASd17I8440Q1T8g0NsKhMZSA
	dEr2ZYIlPf+brYgP+BdY2XibsfQ+kLbS9fBe/tt9XxqGXuEapn0pmR//CnoBV
X-Received: by 2002:a05:6a00:3392:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-75722869545mr25840335b3a.6.1753108257955;
        Mon, 21 Jul 2025 07:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG6I7/YN/GntNBhpwxtH5G52Yy/1kSXDgvLDtnnNoxskhMPb+YeGocnDXdtpvZVJoL8l6lgg==
X-Received: by 2002:a05:6a00:3392:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-75722869545mr25840277b3a.6.1753108257287;
        Mon, 21 Jul 2025 07:30:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb155e1asm5750110b3a.74.2025.07.21.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:30:56 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Mon, 21 Jul 2025 20:00:35 +0530
Message-Id: <20250721143037.20983-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyOSBTYWx0ZWRfX4I1Aw+KQ8wmi
 BR8BRp1lM/cuWOTYOUdkE84cQobZvymNcbggXvjzoJYyput94ZSEt9OzNyetxq7ePKsBjwJxRyD
 2r0Xq/cKkmkTgqHo4f4136TvcaaUGw61EQYeDAXIDGBrdlHWkqo5YK0WK84Iz0QHOPOQK+sP3+c
 Ha+vyjH2svFmC3tYW5F7qUvU3mLeaXc9SFWXBCdTHpLqE3/9F6oLmZBEd+ycA3eAxNeH5kVGMy4
 uuqqHcXXGKeWjU8qbaJA+fYCOpYotNuk6mH6z+maaol7VibCGtNuLJQtfhuPZSI3hkg/NBu58ll
 HjjPS+EWD31zkeUp9+6aVcMuZwfRjGSuCX7gUWDEbHOmBsFUaJaceC32RDHJOFhWdUvcBFVzvFR
 Mq+0eOZDRkx9BntYeIATFPtJ1M5jUVxCG5AGyAEhFwm5bZt+wzszOojaCWOk/TimrfQ1Mv94
X-Proofpoint-ORIG-GUID: OfVw_qB0YZ_YzB8MkV7WhE4xHYSO2VNu
X-Proofpoint-GUID: OfVw_qB0YZ_YzB8MkV7WhE4xHYSO2VNu
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687e4f23 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=TVyXueylgh4vxAmsgxgA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=888 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210129

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

--
Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


