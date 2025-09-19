Return-Path: <linux-gpio+bounces-26396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A1B89DA5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4739A1C832B1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525C831326D;
	Fri, 19 Sep 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otQm3Lgj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306E227EA8
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291293; cv=none; b=fnwqcqAowW+OMff0Yz73dgNmK1260JtViWVD45h4tL7dNsBQmnGjzVataYb1Pzo1vYpV8dl1DTQ7Eun+S6ej8nhZjqO7I6EkIoYCf7BypLYy94sNTEiguG3sHbX4oI6Xri5tNWywAy3lQdCt7zNE8dC7BJwGtiFoU8Vnk/cjLhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291293; c=relaxed/simple;
	bh=H18JYOxIyEwenlKHPH3Q4sdgZATPQK3L6NM+azc19AE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeC8YlnVI8bk9drRi9hfyZDMXaOPrdNNE5xhauGa8Acs2kunf4UJwreJslOlhjWFv2WXLFOHkJjQK1ns50KQ0XDzqAwJ8DFc4brVXyDWW8LoUtMZwLN+R27ymFHplcdB9EQEIOri+T/lRONvvlXnqg1bKbE3VT+7PbJ8VVOtSuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otQm3Lgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDVA3h032456
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 14:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9EEP86bPrEuFPhyrGPMSKAxoE/r/N527VzL
	IseJvapk=; b=otQm3LgjLRebVNhPqwJ2r4P4UwvdHcYQW0UiPpHqaB7xzV6HyM9
	vKzvnzwXzb1wnT0cQiae+vzW+nGogSHtI8Y/yk9twjffddOQV9ORTjnzAgoOYnBY
	/LIQYPBNpULBHrlS45de4tmaymkz/V9OkN4byh4X/LKbO5/ZxP5CXzUDnJhD7T5r
	EMMwSNDvPTn0zfqt5u5BGnVIomx8pPNxVUgSwzVlNAy8lipcnaLmC98DrPxTW5iM
	vKA0+YsKPkjByEDVsFkuU2fv9VS5oanzav6ZORXWagmzJ9x9hHDFo+YawtMmRXyO
	HETV1gbCN82wR2OYXo0yoi5rOR/IVfupU0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytphr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 14:14:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so1974733a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 07:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291290; x=1758896090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EEP86bPrEuFPhyrGPMSKAxoE/r/N527VzLIseJvapk=;
        b=Huc3FA5nmi6GtyL5ejZGwmk5WX94NWHf9KuJWI9s7ql72/iTMOazy8dC3C+mCq3cFV
         Tocccm2d/gUiUuk7Cl8qtfE/Yt2l256htpxTerRVTqo2Hc0CeHbjtIOZ79FXbWK3G+DW
         z5ebjfRFzWlV8/BOOtR7JqYG5H1qF9Op3X5ZYvQkXKbpswKBQSanL2+bXeK9IMVhwnEJ
         3+CiRay+bxXRsY8YiQarOWFj0MnhmXribq0zfx7q0Hsop1PGhIbh3aHFGhGAvpD42rxZ
         /kGBK19r40OHVK2NaXXa/WMjVVtelRHBIdQTrL/72/IHZb4d+eqy8nGW90eGriCW+tWd
         zLXA==
X-Forwarded-Encrypted: i=1; AJvYcCWHlFHTnYMwPpX85ZHGvtsSLCpL7XktyFkxEVpEsW4u2XddJf8txZA07OD2a7kwEkj0PaRrEFtu/Z6L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KyUKffUhxp4I0CLsyrgkwgamBfM+sqN1UJ1jtDpY02kcngnG
	AnfxL8rtHgpv6kYCyZ8zFaw6/O8eN0t2OcyAHTb9scRngeQw4glXQBJzHMgRA8ocpCWNSm+EIlu
	RYvx5w4r2peP3pKuiKS51vAxqJsslDLcxZhe0ZfTdh31cdZOruQdOicuaO40rrpAw
X-Gm-Gg: ASbGnctVNDYcSub01aZISLULR45HN6GirG9+ovIn4rsmTagPoFJJ5GDoP8s8B2wnlyN
	QYSXuZWedeMfGJJ9ySx3r70TOiT1v2BlG47+1l38eUVL8DdZZihN/FbZacFzS0djnLJY43VFpTr
	/z1fwH1bOQ9kuul/uyYmQKPpom3+nPZLg0OIOQnoScIVRtD1uysb/qG+x464FTbDDM7bXhLnSo+
	7wB761p5AhVzZuFpeRDqJL5PtfIg5WBB0Mx7zsd0+0WAfWBt8sQRS21c8T87RusLEAK6XHNdEEA
	qV3tvCv/8RkNQcAxTcVZ4YZ/VF7YnQwzK+7Nw/IqEHGkgMBAPINQegIuwO2lU6WZddmXBh4DdM2
	Yk4vUQoPadB4DxMa7yMgT5WfwRtH5fLZmlYQ8ulOqoUBqiHBmjTp40nVW9L/g
X-Received: by 2002:a17:903:2341:b0:24c:a269:b6d5 with SMTP id d9443c01a7336-269ba27020bmr50046135ad.0.1758291289603;
        Fri, 19 Sep 2025 07:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZEoV1JBT8ltcQHOk66+9wxwccfdS5Zcfmesrj8v0ZFx8i90bAAeizJjd/qgTQvGzs2XP4SQ==
X-Received: by 2002:a17:903:2341:b0:24c:a269:b6d5 with SMTP id d9443c01a7336-269ba27020bmr50045735ad.0.1758291289091;
        Fri, 19 Sep 2025 07:14:49 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016d9d5sm56456845ad.53.2025.09.19.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:14:48 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO bindings for Glymur PMICs
Date: Fri, 19 Sep 2025 19:44:40 +0530
Message-Id: <20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd655a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gVt0xI4JxzluFwnjjo4A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: r4losYEOm1isEuz3uMmkCD52KKlOZagj
X-Proofpoint-ORIG-GUID: r4losYEOm1isEuz3uMmkCD52KKlOZagj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXz5VbSiFNCoD5
 PMCVqmJrGPh8O14fHeE8T5jZCNIbpL2gAmJ7nllLaPAyQhdOGyNSCCi0G2MKE5OPiFY+yQxAMFt
 Ao1UPmk3J18JE1n5zYyp9EFasWQXZdAaJkHBXcECIM8jXMmQXRqDWAD3TaRHcfPME1RY+gW7/vL
 yWEshQuSOcPzAizJW78XA0mwAq+zP8MuBIx7yw9vPJWVHfdvGSUyn5npPrqatlJWsCkiLog5Nb3
 HE8bg4g6JyKSTp3OlIqhNAMdw7vaINp89BLygC/bvpjSFHVsRoygYUMPMuEFA8qBpKlFn5aUl5X
 tLPlj0Ai1bWLG4q3nXQR5qEI/MEwFHzbbo4tRJsCOUo022iINMra3QJ1Z5CTa/kfNwEEspOoKce
 wua5tU4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
and PMCX0102 PMICs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 5e6dfcc3fe9b..8ae4489637f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -59,7 +59,11 @@ properties:
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
           - qcom,pmc8380-gpio
+          - qcom,pmcx0102-gpio
           - qcom,pmd8028-gpio
+          - qcom,pmh0101-gpio
+          - qcom,pmh0104-gpio
+          - qcom,pmh0110-gpio
           - qcom,pmi632-gpio
           - qcom,pmi8950-gpio
           - qcom,pmi8994-gpio
@@ -68,6 +72,7 @@ properties:
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
+          - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
           - qcom,pmm8654au-gpio
           - qcom,pmp8074-gpio
@@ -191,6 +196,8 @@ allOf:
               - qcom,pm8950-gpio
               - qcom,pm8953-gpio
               - qcom,pmi632-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmk8850-gpio
     then:
       properties:
         gpio-line-names:
@@ -303,6 +310,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmcx0102-gpio
+              - qcom,pmh0110-gpio
               - qcom,pmi8998-gpio
     then:
       properties:
@@ -318,6 +327,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmh0101-gpio
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -481,13 +491,18 @@ $defs:
                  - gpio1-gpio22 for pm8994
                  - gpio1-gpio26 for pm8998
                  - gpio1-gpio22 for pma8084
+                 - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
+                 - gpio1-gpio18 for pmh0101
+                 - gpio1-gpio8 for pmh0104
+                 - gpio1-gpio14 for pmh0110
                  - gpio1-gpio8 for pmi632
                  - gpio1-gpio2 for pmi8950
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
                  - gpio1-gpio6 for pmk8550
+                 - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
                  - gpio1-gpio12 for pmm8654au
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
-- 
2.34.1


