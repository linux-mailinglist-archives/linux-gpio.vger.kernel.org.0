Return-Path: <linux-gpio+bounces-22129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB7AE7A1E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60B14A1673
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA9726D4EA;
	Wed, 25 Jun 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kGQ0Ot4H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028926C3B0;
	Wed, 25 Jun 2025 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840193; cv=none; b=XGcqIIvltfmcEHgqj+vJ68WMrmUFZ/Xp5WNXtwig+nywCqHSyR7zhojULpphIFDRSy/FkLdNhGpE6oKVRTN55F/1WuXQZaYRrS4S09RCypwMHEWbyw83GRQ+2gB5sTQDXarvZZz2orZaZxZ5BIH4nkbmwfdCvAVgGVZcoHBPm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840193; c=relaxed/simple;
	bh=On6BPIWO1dYwHtzSJg5/AcjF+SEAEXzTkOiidTOOzCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BlKKHFwFnOujGuhwS9+FWfvyQ/vrRbBMWepg3vIpzpsG6bhcapL37IM54DMbDQVXDwtpDhQpa2NYAUmCKZT+A8Pe3GB/WvoAlwjeHjJ0UuD5xPhTdcjT196yGEJNwhaCLbJGghluS4VmcGDXfd+2YXMJLlPM/RQSUa2YR+ghkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kGQ0Ot4H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1gTqG026920;
	Wed, 25 Jun 2025 08:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=juK5b5AqAnp+0Nh4N3acFkBV1B1PY+jokYx
	xGA5An5k=; b=kGQ0Ot4Hr6+ZWvkl4lqGIFWuXNdWnbWQL1ZSUBcY/QRH0fnSZAz
	YTDL4/GHX26G57b236Iq0WkgexZ3Gs10j2H8lQgmfXL5SNz+DSQwak4Mt/1HMKFV
	6tadi6A0q1UvJncFvTibznV8gl5MpEL4xSjDNnRFeKgYg1ndWdSGejyHsoP8VS0Y
	qd0g8PGtnKLFoQDTihDHCEnqalFst1jbn1Aoy7PIwmZ7HvT1t/AhHmXn5t3dUseU
	/ofYBLSAXRyF+i3AX2TwAN/kbn+xsUpS0ZLgoRIMbQxPG++xtaWIJcekros2BeK8
	HBZWcUuPRzPm6e1NOBzCYNNeyq6TqOOrI7A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqnmg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8Th3Z032598;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2eph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8Th9X032575;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8Tgsp032568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 9BE5D5C5; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Wed, 25 Jun 2025 13:59:18 +0530
Message-Id: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LBM8pvpHvOFVHDFT6nxQ3JaIFPxYBLtE
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bb37a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=3ZyjhVE0i7BfmCAa4gMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LBM8pvpHvOFVHDFT6nxQ3JaIFPxYBLtE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX4DixYfBSkI1M
 WACRPPda2kpJ2rPf+pcp3xGHD5uE1mZtAF14Jdx61QnZwilifcKkYo095wcLy7SFDAzFSyg1bbx
 P62YY1kxhJOIN2r9O5v/M8avLcqjTwFjaCkSeG3EyWTI/sNtHOb5TK75gp71P46+VrG7Wu7zXFO
 tY7zMbUIrjR0HkgUMQ96x7nJl66pylf8/FuVH55NQJSnov+KEAwmwbA+JoAIGlKrJ2UY16pbVWQ
 IAjy3XyG/7hW4PvNzq3kxboBBRMlFnhn2j4s1sseITd1AEl+IazZWryOipkHT9XYCOXYHLi+cUv
 2Ov3CQOX3d/uJ835YW96hvAjCM1YJOv/a68gokd7IOsQsNTLLw/1h2ypCl2w9tM/i9KCITLqACC
 JEA3228V1h/qkj0YFqJ7MPRO9Qa+36ybnrZ1w2vwHB24+w8PlJrbyFNiunpA+tIGiaohpyKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=859 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250062

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add audio device tree support and required dependencies for the qcs6490-RB3Gen2
and qcm6490-idp boards. Since both boards are based on the same SoC platform,
the changes are consolidated into a single patch set to maintain consistency
and simplify future maintenance.

---
This patch series depends on patch series:
https://lore.kernel.org/linux-sound/20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com/
---

changes in [v5]:
	- Add separate patch for QCS6490 pinctrl bindings.
	- Updated commit message with more description.
	- Addressed the review commnets.
	- Link to V4: https://lore.kernel.org/linux-arm-msm/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/

Changes in [v4]:
	- Fix DT binding errors by adding dt-binding clock changes for ADSP base platform.
	- Link to V3 : https://lore.kernel.org/linux-arm-msm/20250520062618.2765109-1-quic_pkumpatl@quicinc.com/

Changes in [v3]:
	- Added protection-domain in gpr services.
	- Addressed the review commnets from Konrad Dybcio.
	- Fix DT binding errors reported by Rob Herring.
	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/

Changes in [v2]:
	- Created dtsi file to handle common audio nodes to support Audioreach.
	- Addressed the review comments.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/

Mohammad Rafi Shaik (9):
  arm64: dts: qcom: qcs6490-audioreach: Add gpr node
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
    clock property
  ASoC: qcom: dt-bindings: qcom,lpass-va-macro: Update bindings for
    clocks to support ADSP
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        |  16 ++
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  14 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 207 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 121 ++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  97 +++++++-
 6 files changed, 530 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 2c923c845768a0f0e34b8161d70bc96525385782
prerequisite-patch-id: 9e69a21fe7c21da3a4a7d91ec953cba6f6c4b9ce
prerequisite-patch-id: 652cda2ff332824b1a722f9af32d51c12537873e
-- 
2.34.1


