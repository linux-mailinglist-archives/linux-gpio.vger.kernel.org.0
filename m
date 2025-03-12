Return-Path: <linux-gpio+bounces-17474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE6A5D742
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 08:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2E53B940D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 07:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D6E1E9B3C;
	Wed, 12 Mar 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GOgelmo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980EC38384;
	Wed, 12 Mar 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764322; cv=none; b=ZVHEhT3/OHL2LESCgTQD08FsR5/kPA8QXXdv+51NC2S9357E2iDv83d2HB6bFRqYnXAoc8egPMukF4ITzq1J/BRNyljnfwHjRX5dXlRO/p7i7FP8+7pX9MuPKTML/JypjzEvx2moZErv12U/IYciB2dcHMMjeFLyPAVhfJGxalk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764322; c=relaxed/simple;
	bh=QGGqbxYsTorCp79WPlPGb4ibYyYKjTBPoAiNsFNNTN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MfX4hUgXJ9mTUUI8epOQcB0dJz0SatAb3YRKu88ubMEaCs3i879lfCKD7vIdIWm3YyCGvygZ4S8SJ/Ibvo7ENrSK82ESH00bVFpgmzJnuNx7OVlw8eYh5ZChW7KEtlnWrJ2fYlva5ri073+gnUoKSnwseGgP7anQaHZ1UWIakgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GOgelmo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHivS016092;
	Wed, 12 Mar 2025 07:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e9g3VxcDTuzBTA7EXXJxOgT/EGIYLI7QniO
	tI78XBXs=; b=GOgelmo4+ZaXKOjb4A5JiQRGTUmTy1zESLXyPPd8Q7A+Qkn9JvG
	M/1aSYUB9kyX1NDtAvF38G7INYzF+IJrQzuRrsVfrXJv86vO1V/fChudOAh71hXu
	lKC+fdMULD1eNy+OtdLcx4BdGzXaoy3WIeA18mq+nA69gzGQ5sNO6WM+nRVLCmiy
	vAd7zDMC4qV2ivdHuIYIYf+zY626WI7Hw/B2rtErghB0rMnPumvCivrbVi8l4MD9
	sCixu5/n/KI4JcO5WKyeZdgg+SSnq3pt+R62wagPm4WFF7BHLkEcOuLUkRPxwPGQ
	49fPizz670qpD8zz2TrN//BRlA80e/JQt2g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nsgu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52C7PC0S032141;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn3ehmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52C7PCYr032122;
	Wed, 12 Mar 2025 07:25:12 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52C7PBCa032117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:25:12 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 31C135A9; Wed, 12 Mar 2025 12:55:11 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: Enable egpio function for sa8775p
Date: Wed, 12 Mar 2025 12:55:07 +0530
Message-ID: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: uuMTmPaW1inf1967EuLQ4a3j9XjF46Gh
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d136dc cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=r8Ps2SIJjR79LDofT-oA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uuMTmPaW1inf1967EuLQ4a3j9XjF46Gh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=665 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120049

Add egpio function for GPIOs ranging from 126 to 148.

---
Changelog:

v2:
  - Update dt-bindings for egpio function in sa8775p
  - v1: https://lore.kernel.org/all/20250311095151.1581239-1-quic_wasimn@quicinc.com/

Wasim Nazir (2):
  dt-bindings: pinctrl: qcom: Add egpio function for sa8775p
  pinctrl: qcom: sa8775p: Enable egpio function

 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   |  2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c        | 58 +++++++++++--------
 2 files changed, 35 insertions(+), 25 deletions(-)


base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
--
2.48.1


