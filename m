Return-Path: <linux-gpio+bounces-26553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351AB9AF26
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 19:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FCD19C2F41
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 17:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD218314A63;
	Wed, 24 Sep 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3elQ7GN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440E2E762D
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733278; cv=none; b=nOPfV2Wk9N4Qqep26vmB2n/EOqJZrTltGzzrOtYCCbH2cJHFi+ziuyNa7BsuXpzh8FntK28f2ioy6rAh4KPp/qvuvum0n/n7i1Pauo7mpIx1ZOMaMmbYl7zu09liZWPBvcY9WirvX58tZF7jnhhREC6lq6cGN/+DL0gsz8BSXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733278; c=relaxed/simple;
	bh=kXDI7MEXFf6z8gjpvhdqltoRlqilkIpnmYKOs1pJ2QY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QWyL9NO0x9gmSUMu7cD8riMbFxeOJ6U5ZahrgItEmc6XJDG/nM4rA3i++q/36oEAwEX6Vr9pbrizzPQSwK50NMIDOF0SRrdhTp1nHQAroA5SU1M3HYxHUqUDyKkMP/KPlF+OXTqfjNA7QPl5mjvnHTITYHP9tkfzzJ88bQdlyGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3elQ7GN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCO0xG021670
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N/oDRnmqGat4xmVd4FvGyX
	KUBtNVsnITDdUnNVC6S+A=; b=U3elQ7GND8JRW2U2fpbEX3a4DyuBDwJhxqS9FQ
	x2RmRCwc6ps8b58XiGpPesoGFjhmrLy3kKWL+e8UIaPNlNd1a+OIIPEdNRlwJgts
	iDwzJpBBJamBUX+3z7mIp1i4Yz3nBrAursF726M+8JPwd4Zc86IYliOW4MZRraMy
	chodoQxxJdWnSWnZ9q1J7GwoaxE7Vbrl5pV3uj1QRPleRxBHlMt172lxQ0yoTF89
	9/IaWiD4kaErpgsaFLwUYd5yKH0EJCE5lty1TORdLcAJAHJw4i2mjJeRWDzY378D
	EawItb6wyHVE+7koqphel1I4nJ80tdamhyxrT2Drzuwi9vcg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budacphf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 17:01:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3304def7909so46902a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 10:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733274; x=1759338074;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/oDRnmqGat4xmVd4FvGyXKUBtNVsnITDdUnNVC6S+A=;
        b=f5Wv1a99MjTd+VZ5WjyIvTz+Ccv+Rw/3ljK/c9/ru/wIOOqYcEZEy66k4xiQfteGI0
         1LTke05cWixi20ncVDLImINqGtRtzdD7pNFBF/GOUDCYjtUB0LhAszE6d1MpQVq3Qmfr
         O0vORhf739sK+4nzPeBykNuCY+iPvKKEbWBIx5Um5UkOyvYiXQe/HFfJ9MZLnvAKBZWm
         gAl4mIfYnPGC4vbemeS53vDlql/UojKTU5MzW90Ssdhoaq2RfVpcvs/W61gmShqyr1O1
         G9ykKjL8rQk9A6LEeAM7EkFK2go3Q49AjyGuGO2F0HaxqX2fdBj8U2Pw9TS1PhgWDNb7
         Gh6w==
X-Forwarded-Encrypted: i=1; AJvYcCXRJW4FgFPCaIzeSaGJBf1gQ+5cBjHZZk7CLftAo4EyTa3z2lqmrvq8qXf3WL/MIShZ3DK1aCPngf+6@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7piIOeES4Fkm7TiuJ7ySBIzG84YkW+h5GC6J+E1FBzTsg4hK
	3+ya3zXxhNiaKxd9s3UOgPrg9gGcwYfUsplCK62eiuFN9EC+/MS6EpuE0H5MZl3UEdAdTRbLi3q
	B9yj7iKp7GhIJUYTbbsf1hXFMzyFT7aGxDxWSs+k9/deA4DJYt0DKP47zO5+sE3Wl
X-Gm-Gg: ASbGncujMHFnxMPt2e8lToDYhEMz73D7uFTX68zHZN+Cm0d9NEMdLDbxbaDz36Nj6fd
	t8OcFEBrYc1Y+CMhbIxWyk/uXWVfClZ1tciAxkfNQc7oN2qPn9HjU9KEyy222WSCqF/UZe7EE4u
	NVZWOm2QuiojX65Ed7oz8u1H1EHUHqkR/VOfA3KSF9NSR11E4j+/3EdQTFQjQCY3WyCcHgMOiFW
	aAQYQ6Id4FB03TPmFvugDW1wtHYFIsEA+vzWsmSAUUWVtoeG76Pr3vFf6qz3+ooENUPD2iRcp1P
	sk386ygtbIP+iZi/8Qn/52buqRkNnwGZRAOGHuhrU5WzZfkALGW4tRG2tGznaTu8n23kZaikTgS
	+jeVfYUdrfD+ZPlLTFnKPVghIJg==
X-Received: by 2002:a17:90b:364d:b0:32b:7d2f:2ee7 with SMTP id 98e67ed59e1d1-3342a22c945mr282052a91.13.1758733273967;
        Wed, 24 Sep 2025 10:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENExJBcnMRSaIHCjd/DduchLrLj47zDfDf7++AjetgzThk/lhpjIGtQg+ChueQ7qA4WR/ppQ==
X-Received: by 2002:a17:90b:364d:b0:32b:7d2f:2ee7 with SMTP id 98e67ed59e1d1-3342a22c945mr281996a91.13.1758733273086;
        Wed, 24 Sep 2025 10:01:13 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda09a0sm2931299a91.9.2025.09.24.10.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:12 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] pinctrl: Update dt-binding and driver to support
 Glymur PMICs
Date: Wed, 24 Sep 2025 22:31:01 +0530
Message-Id: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0j1GgC/13NwQqDMAzG8VeRnBdwmWXVVxkeShtdQJ1LtWyI7
 74yD4Md/x/klw0iq3CEpthAOUmUx5SDTgX4u5t6Rgm5gUoyZU0V9sN7XBVnmfyiAwaVxIpsPfk
 LOWuCh3w7K3fy+rq39mjl55r55Rh/en72Z8d5FEwWu7Mz166ytaWqSQTtvn8Ap7+jD7AAAAA=
X-Change-ID: 20250924-glymur-pinctrl-driver-e8c2c32a85dc
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733268; l=1571;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=kXDI7MEXFf6z8gjpvhdqltoRlqilkIpnmYKOs1pJ2QY=;
 b=OfnaSG/Tgae/FcBfTGMWUQfl2So7nVlRvb/7ycVRmbTPHJpFn4oi8IScj3L10z5mQhkuL3h3p
 M1h3HHusEpyDryQzZotWbZ2oOzZFknSriVvhrCrBmPqve0nmG8QaTS5
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: h-yTPP-Py_LWGj8a2fRkEYKAYnUAsVZ2
X-Proofpoint-ORIG-GUID: h-yTPP-Py_LWGj8a2fRkEYKAYnUAsVZ2
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d423db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xrc4ZGigH1M6lUekqJwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX/Ay5EETEtBR6
 8WFAyUKjiFUHiCFkhlyOskG44cnNyYvXqp+7PzgZduwmXa5Sh+2kJDyVyGf2z9mp6mBFrrnbXcN
 AJ3mIVVLclYj7BgCHcTi2Zfw7xxNSo1OH4aHaoDifKtr0GTOAWduNByPqL3KZzkkNUBpcvlL4ne
 qUHpvhhFnYUX/79IWVmW2gBE1AOHBWw1O3pF1iPaDpFfQhkvegbSU7uhvyFZzb0wBn08AhZK39y
 xT5bMxRpdQQ1ViPwHZMV//XuaqxuHDsF7uGPrM4Adw382Jw9FG7JJLb4l3BP3J31blVjENvN6Qx
 dO+b6p2z85i8UlpiqDpuV8q3IbbZ22dTZu0JGa4tgOkPGnlw3xTckdgiZZCTdFNRRFMMQXu71p1
 qkWo9bZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

This series contains patches to update the PINCTRL drivers
and device tree bindings needed to support the new GPIO types
for PMICs present on boards with Qualcomm's next-generation
compute SoC - Glymur.

Device tree changes are not included in this series and will
be posted separately after the official announcement of the
Glymur SoC.

Changes in v2:
- Split into two series: SPMI and PINCTRL(this series)
- Included the DT bindings in this series, previously posted separately.
- Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Anjelique Melendez (1):
      pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 & PMH01XX PMICs support

Jishnu Prakash (1):
      dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO bindings for Glymur PMICs

Subbaraman Narayanamurthy (1):
      pinctrl: qcom: spmi-gpio: add support for {LV_VIN2, MV_VIN3}_CLK subtypes

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml       | 15 +++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                  |  9 +++++++++
 2 files changed, 24 insertions(+)
---
base-commit: dd1059140d0608262a3a39591360fc0101bddf68
change-id: 20250924-glymur-pinctrl-driver-e8c2c32a85dc
prerequisite-change-id: 20250924-glymur-spmi-v8-f1a57f489824:v2
prerequisite-patch-id: a27e60b23189b89c17444ad76fbeaa7687a426d4
prerequisite-patch-id: 6940e73d1975830ceb11b4e8bf1be2303e866e7d

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


