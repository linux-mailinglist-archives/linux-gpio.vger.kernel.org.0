Return-Path: <linux-gpio+bounces-23533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D0B0B764
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C18188CDBE
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D99B23507A;
	Sun, 20 Jul 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZGfjbb26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE86221F13;
	Sun, 20 Jul 2025 17:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753032771; cv=none; b=KnigTQGZa/bMJcjk8Ex45kiqfVElkVYegWIRlUwYiGvcHFfNZxAOExYOs78IGcHvjij7ylL5uSN+P7FX3/Wnzlh267EY9RiHIUnne/ybT0K9uzTb0Yt4ZfToaKk3tsSxF/nW4Ps0NpC9klRnR2K6bRFb8dkaGmeKooWTupY4Jkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753032771; c=relaxed/simple;
	bh=K4oEczkUuXGrUJo1dJKlhotr909AtVEhCRK9tgy9q/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jTPWqLaESLD/rFB8T2fnCyVDPmEASVn/+adOij0qbC35j26DnP9UTTZG4WIdv1Ru3Ypq7NfMQL4e1SWNaPOJS1sqvYa9GvZzKWAN9c6pqdzYQdHBv05j4SrKEqs3hicyOgyGoyi5RY6SGTuhKk/uXR4+7IsUZ6OuLloXjzxzbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZGfjbb26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8QlIP020870;
	Sun, 20 Jul 2025 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I3OS9mr40gFWzFBcrI8beMLCMgFFxIi/zXQ
	F1n5qzuI=; b=ZGfjbb26fw+vj5sYDdRpTQIigld7G/wf9ci4jHJg8pBio/S8O1P
	q3IHpdbLpguRE/3c9MqTrDI+Pyriaoq2e6fwTACqk4em/hdHJLxpHAXGoDlpD4Z/
	8rDB1a1p0Xe8dUvkP2rE2RlyG11A6b3+LtJu/Ziu/NvM+LGAoyVzk/Gk/VDFitId
	cMDQzqQZVqKNVXCVh5r576hWRzrxNh4zqrhNnpeiSPmWg5bk41zSmsIJAb0o+ygx
	C4bCFdtmKa2j5EM+rbar+RS8NxGdaqBwDjil6u2lJlE+X3STzQcAkeo5kTXVD3v/
	FH2kqgw5wmIyUG5immAcYn/QcDx3pNe9AJg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v2gka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHWKuO027048;
	Sun, 20 Jul 2025 17:32:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4804ek9a42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56KHWK7o027033;
	Sun, 20 Jul 2025 17:32:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56KHWIJL027027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:32:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 09CBA5C6; Sun, 20 Jul 2025 23:02:18 +0530 (+0530)
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v7 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Sun, 20 Jul 2025 23:02:06 +0530
Message-Id: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: v4U1zwl4w1mO_xwBl1WgK7fFi5x0sQoa
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687d2829 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=eK7tGN94E5jGERbYYjcA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE2OCBTYWx0ZWRfXy7LUjQrLY83c
 g1Zv+GoULtXcamUfQFtrJ/puwaguKCp3EZZHttpGlmulXmVUM+MOCtv2lUQa/aRzw1i9WXinsTa
 +vzplQRQt4+wdPVDewDKnz73F4XfMqhiKEAqKey6GlN6ViJJMJVZTARE0sT67ATI4T2MCgpVCfc
 kkZFIanUaDFEH7GUkV/uHSRuLT4CRTMJayqiyqdQEvVpO6Qmad90ErchH8TGv9zOadvteQO4YQ0
 HNhFJ/0SdZ9nE9LFiTkQFQQXidlkKXIEnl1OCr8uX3+HO1N1V7iR6wrCUiBToayOvRXZgTnehHO
 9lNOg9Hj5XA/uHnGm1mTSaSx4Jfs78Zb4FMldjU6BBhUSEEkmXhaeFXZ+xuCbATp3aXkYVKDvVY
 MeWGiSlh2HSVHj2xPE+nzLag4yV+AbFIV+lt7kLFpYOKcmVDAWz2+Eiyq0GJWxXcJximNi0S
X-Proofpoint-ORIG-GUID: v4U1zwl4w1mO_xwBl1WgK7fFi5x0sQoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=950
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200169

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250716074957.102402-2-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/linux-sound/20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com/
---

changes in [v7]:
	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
	- Rebased changes on top of dependant patches
	- https://lore.kernel.org/linux-sound/20250715180050.3920019-1-quic_pkumpatl@quicinc.com/

changes in [v6]:
	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
	- Link to V5: https://lore.kernel.org/linux-arm-msm/20250625082927.31038-1-quic_pkumpatl@quicinc.com/

changes in [v5]:
	- Added separate patch for QCS6490 pinctrl bindings.
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
  ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to
    support ADSP
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        |  16 ++
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  23 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 207 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 121 ++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  97 +++++++-
 6 files changed, 538 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
prerequisite-patch-id: 9e69a21fe7c21da3a4a7d91ec953cba6f6c4b9ce
prerequisite-patch-id: 0f14f3782900bc2906440dd183321ed9971805ac
prerequisite-patch-id: a83808de40d82c5b67c013283fe14473368b49ae
-- 
2.34.1


