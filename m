Return-Path: <linux-gpio+bounces-20581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0EAC4CCD
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89A343A3C03
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BB2258CCC;
	Tue, 27 May 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VmMxHqyB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D1823E35E;
	Tue, 27 May 2025 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344368; cv=none; b=aBQDb69IXff/0c5zrXDPYVBLmQRjhePs5fho6WyQNnE4f/i9JAWddloUjNqmqe1L/GawhYDp7JSkIImEziU/aKkBg8f17XvcRoys80VKDYamd+z0yW112xXsLOekKXByPO3u2w00VwBABkmgCA0WPh7V4jHgaslaPW8zH8ctUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344368; c=relaxed/simple;
	bh=+9vIz8RPmIiRf0C4dtd1KKpx/hVy47Wgk7T3FPC2ZZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GCnB1LpslfMUlqgYY7VCgElLrhEFZXnpd6y99yCGLOI5462WMIU2fhugFWxjAOyFsqFZnPqjfn4k+rxMq96G9SERSGlBaxpon1QV0QRLBvZtutDBbrddsdwiEkqTKzxHiQKZcnGL/8UyIz8ZsJkLc+4bFT/4vlPKBCYQy7mMIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VmMxHqyB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9l5jf015869;
	Tue, 27 May 2025 11:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NiQ8r7m1fImqQ96assEtTys1ZULVRCidbg5
	E2QC9s2U=; b=VmMxHqyBq0QsXDh36Wq9fRU6mWn8NLlKiU1qtsRiYRGr2pIo0sD
	8wCKMZ5GfkemmpwekRCNxdwj/2czWqJx39JpI4BZN1zVW5fmQkPEUKcK+yFLldkP
	f5I9dfwwrauH9mKkJNMuEmIuIWR0BNQgyvzVendPG7JX0gpkpJy6sQE1jNVgpkJB
	TUwMhrPiEhcUsSETOWRm8KwNruCLkfaijLmxGpK4OIj4NDsLtmU6daX4gNY0geiw
	maHU4Idf3XGe3f15+crSnFVwv5UaY7rKqw/6tQCmc3IuSdL9Tz08Wp8se6wbQUl9
	n/N/3SMDmbueRlfNZIGADBjO26YzNyBX02Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6m4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBCbD5028074;
	Tue, 27 May 2025 11:12:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76kscbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54RBCath028006;
	Tue, 27 May 2025 11:12:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54RBCaVg027868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 474825C2; Tue, 27 May 2025 16:42:35 +0530 (+0530)
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
Subject: [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Tue, 27 May 2025 16:42:19 +0530
Message-Id: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: AnpWjkQdGj2IVN-3opCWtR3eDLzETS4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfXwjCceqau7Z2Q
 JUt2SViSRD9gIMCKnsMmSO6Sa46mX0GIw6ImV50aHPgsaSss8BGYafBoA639xhaF7IF4LEpqk+D
 IrFHhgskwLOCHvn7l06R0IbV5YltHH09F26P9AmJ3wtnMSQhoGrki8LA1AmX+lQ3/TBUht/gjui
 10+EpZ+J5Taf9YxK0yl5MsNpjas9mFevH9h5NXZ8FGGA/eWjKqXjcV9mK3RpZJ0Syx7skqqwEak
 wwSSdTBjVClb86F9zdBn0Rh/xE+ZL/ZrbQsd+IR2FYZ3hFF+p+vPMW3nRQfw24RdBazgRyOS/Dv
 na00LabWEilBpXW7Vgtgj4xtA4h5WMoMP30I610mclGQ27KI8zBTweSl9ulfly8bYuIs9GD2cAP
 sXbf5oaCux5l5zVaKZR9yg/+aKu4txQNjmnjxM8CHKV02ri+4F8Ee1+FSzg1Yxy+NJhyafuI
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68359e2a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=3ZyjhVE0i7BfmCAa4gMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AnpWjkQdGj2IVN-3opCWtR3eDLzETS4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=916 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

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

Mohammad Rafi Shaik (8):
  arm64: dts: qcom: qcs6490-audioreach: Add gpr node
  ASoC: dt-bindings: qcom: Manage clock settings for ADSP solution
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        |  10 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  12 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  24 ++-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 180 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 158 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  78 +++++++-
 7 files changed, 535 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
-- 
2.34.1


