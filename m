Return-Path: <linux-gpio+bounces-23681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD2B0EFF8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 12:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07655583ADC
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCB929E101;
	Wed, 23 Jul 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeeFg4o0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE9286887
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267027; cv=none; b=VzgumMwXl5FWVenoirUNsMa9u/CpEzsQX0TtVOHNzlJzFcrAHGBpfc+nM+2Bvy51WvlZLKdDZava1JbBbX4HX6mU+ocaN7azlSoWYb5IA5U2byHFOqa8H0Gj8pMxGvQfysoU2oJT+FGK0MMIdzz+k7JRe7ezhTtrRPYc4E746Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267027; c=relaxed/simple;
	bh=SBkpMsGrGahLmvK5mXf7uU4yJc9wzbgowThkMVVAhc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e3OLAdo1MFeg4aa+kbw6c4P5DM3UVInL09bVVf9JeCG6AWeSBxszkeVuSIyVb0x2M5xGbrlKCvSnMpd1OkyLDFn6ckulVRoksB6Xkln3cetK5CMO4oIiN3BJb3jFusyWZpPUGm3D7m9cU8DZLmZmYzRfbOA0a6c4BbM+SfXrI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeeFg4o0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9UGRc007900
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZahhtsdxwSGeWMV/+xeQGiaLIv/GIPmtHC
	4taip/PU=; b=KeeFg4o0Nxj8dwDTIKJBNa68K8fXqATd6h4Cpl9NTbJ7ta2g3Hu
	W01t4A0OF545qB2UQFJOLW9/y0cW1SrLGdvzzKCrSbLYa2CSHF4h7V9zGWr8M3Vl
	DefTN7dS8n4he9FYoKYEq+QaskfegakFPyaIHW3gg4CKsSJ5VRwXBkIKz/guov89
	8QCBdR3PlAq9Rg1HQ2aUPld94YJaXW32MQKwUCQcis83Q80M3xWDhTlKyS3MV+/Z
	jlQgUyiD+XhDCdZUUdmqgelnIw61QZBVJfa+ufiv3HudlqIWAh6mqTYOd4vS+p90
	aG5tv+qTpvWh/TuwTzTaiNfdkSwro2jzl1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htug0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 10:37:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-756a4884dfcso6353763b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267022; x=1753871822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZahhtsdxwSGeWMV/+xeQGiaLIv/GIPmtHC4taip/PU=;
        b=llIvWu0JJw7ctcZ2WiJ/t39YEBhmh4C5Tae3azRN1QVXmkWJ+GBZ3lig+dFs63nH9h
         O8E9PrWJWn6sZkMLcLoewDvdDu5YKb+V4PhiGhxBYXPsTS6Avbh/7xcsKU+reZr5kcsM
         rho6+pxivhOLFJfCk6Pdzr2QFFLzM6bdbKhGufbXFytHUn8iZVG8nY4ugdvFF/BKE6JI
         cy9GkLlwwT+v01Jjp/A8jywTI8lsmBD9vHPe1IUuDxbTs241d/I5XYe9bm6XacyY0Gt3
         DYxbPTf2FJ0bB47AfOoA/ue/EbsM7QMGRhUMb7iHsI4REIc9YYsnuhS5tmTn8YSXMCUu
         2zZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYB4UEhx5ThopgX26x7cXsoNQpayum/4LH2vnJNGa45g23nOWX82ZpJlwbisifXF9jO5DSIUg5OIcs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6xmTTfuJk8stPvadkdTdPjLeEx64Bd7nOVWQPiScGM53dMBzT
	k+oNghudhAfjQp3WgyG37v9FPZWbiHaKFw/x6aYC5vr2s238v+ek8qdzM3CwmPmPVP/ogRLxnPy
	CiEI3ISndyLIsAv+XK9elpkw7pShHRsjkWxnt0v6M+MjIUDnpLh5/ZdOifHdNVTSx
X-Gm-Gg: ASbGncvdZ1U6TgGOG//kw/y7KGIRAEjPR5GZs/6w1l9EQ2jK0+MRO4PNbbr4SOUygv+
	hrjUg6c8mbpKFwCmfn0JlMKwO9FkJsq3IEVhLdmliiJa4FA/slFiKXYCATdADIiunGGtq497mDZ
	6pw3uwpo21uSXP9mV/SOkNE3vhkK+gdxQU0+zIevwwutOOUCufJoQHterAMog+TnWEPPe6IEF/5
	GptbqYLZA2VMajxEYin8Oe2iNjy6CHV7IL4vFl38bYQiqCKkvaRp4y2wIQoejSrBYrnk1SdnP0J
	f4xEAEUf4NK+nNH7Gj4+XmZEi3WZdDrgXgKjv1G2rE1u6YkxJVEhq/zKgtv8DAXTWqnT1u2CINl
	BZueo/BdLbczO2cojyvciJXNtAz2ssah+Tph0Z5lGp0QNZxbIHNF1I+fx5EYK
X-Received: by 2002:a05:6a21:6da2:b0:220:ace9:193c with SMTP id adf61e73a8af0-23d491698eamr3826498637.38.1753267022172;
        Wed, 23 Jul 2025 03:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh3iuia7Fnxs1Vjrj7taJa5vrWEz92sHlkDtEQDGIqy8QOF964j+qi8wTzRtiCyAMxDjkHNA==
X-Received: by 2002:a05:6a21:6da2:b0:220:ace9:193c with SMTP id adf61e73a8af0-23d491698eamr3826473637.38.1753267021743;
        Wed, 23 Jul 2025 03:37:01 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678f21sm9458954b3a.104.2025.07.23.03.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:37:01 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Wed, 23 Jul 2025 16:06:42 +0530
Message-Id: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880bb4f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=epAnejISswTQ0IiE-JAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfXx9KXDHsGX+ka
 yVd8k3KCn6xmx0QbfID5oGPhPTjQjeB0T28hRm36SEQERTC3N5Tec6lCkS4bmc29WFjyDncsrzf
 Qt6CZaq8BLnbcfBRf/3CNttwyBhtXqfxAQz/Tim/miQpeatlVi0og+uqLZZFZSDI9xbAlpYZuaz
 c5HNyUOxEsnSGjVw8EYG1W1ddD2Tnr4bc3QRM3Qm8jqQO3QLtY5bWjBmmtoDzIKUrECrnd6lNh6
 SHPC/nuO1/Bc4RU17DIvAqC73ItCiwEc6FeISE4iBQqFPKmUWvviltzB1jkkSEsVyfT8lPIIOim
 dBmQ6y0bsywWU+G41DyLFx5pLsiOEG7FZ/G6cMak7BOJIAvSCnQaA/GvFyV1mD1pA4bSgSoBrd+
 WdPhLgAg3h7qciGd3m3f+R+Se+tQMIjrwoI71mMe2t7G1ZpfeyJdzz/Vz/f5+72KqU320bWl
X-Proofpoint-GUID: BPshyiccm_C_xID5cl4sm9fn4gKZN6ac
X-Proofpoint-ORIG-GUID: BPshyiccm_C_xID5cl4sm9fn4gKZN6ac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=972 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

Changes in v4:
Updated bindings to column length of 80 char

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


