Return-Path: <linux-gpio+bounces-24702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE7B2ED3B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C8A5E1247
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 04:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6892E8DF6;
	Thu, 21 Aug 2025 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BaoHWOs8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3A2C21DE;
	Thu, 21 Aug 2025 04:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755751770; cv=none; b=DlN9hn5e6TG2QcKJ2cUC2RSvRrwcR3fngG74AUaseCHckZm2WxV5A1FQmS/5wbjT9uk8/7D1sV0dMykJKjeTYo8CjISPi1SWibHbEH/98fBKlkxMdgqiYZXNo+4cYTxpmxzyDZuYblX8fvQhClAimHmyOWw6j8cV+XhksRhBVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755751770; c=relaxed/simple;
	bh=tW2Hau8AOhF6Y7T2uMXWcSWd6kg1T/J7pUIiWoEBYSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V5BQ5ns0YxCfNQgLDnnnBcQoP/rzB0bRnuL5XHuAyWDvgMFleVZIirY42EIuIx3KBkQ0hw1k7DBN4xNYmxCiA9ZOK+zlox2qKw+xVPt9byFQsDpiK2X1fh09c6wp4fC/FlEyChDOo0y8TIzTbnDtAhg9ul57iWxNXDHiF+R3YPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BaoHWOs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KI426V025147;
	Thu, 21 Aug 2025 04:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=suOScva93YHWqgzzZ0UPw5fl6uhBUo7bt64
	NhjijA6o=; b=BaoHWOs8FxyvnzUUNtqrnpMqe2jYVzNMaSZHvvgCj4LOkw88Ywe
	c2uR+GynO7iNzSI6JIK0OW3IXcjZRUa/92a5C53ntsaOESoBB3oFje1scwSh0N1+
	dDnn8hRJ+YZ468zqUzMM0E+C1AlQSg+cW3oyBKpEjAq8MlPp03o302ngFpiAPcz8
	N+g5mhE8TSFD4wRlKJAmtN8X6KPK2nVjwQHHNdrk5OFojOwZcwT5h/F7KWT1lk//
	ZhXwVpyeaXPrHal5cbJVyi08lhkKwDCjzr3Ctcn6eBrFFJeTOPOkkFRyB8CcV9E8
	edRalUH8TL5KPiWypUolJX+E0m5MiVISlVQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ac195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57L4nHx8021953;
	Thu, 21 Aug 2025 04:49:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48jk2m996g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:17 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57L4nHTO021921;
	Thu, 21 Aug 2025 04:49:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 57L4nHgh021917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:17 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 677C75C6; Thu, 21 Aug 2025 10:19:16 +0530 (+0530)
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
Subject: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Thu, 21 Aug 2025 10:19:05 +0530
Message-Id: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-ORIG-GUID: dCeADrQFdI2vZzuGXb5qvzOgUzqeSmqk
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a6a551 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=eK7tGN94E5jGERbYYjcA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: dCeADrQFdI2vZzuGXb5qvzOgUzqeSmqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2G5H4ykGbXh/
 zc/Why06D9LqF57m567qLg2ibYa2dXSR1Bsprdr5UmuBpfYAU4U91O5LLLht65EzhDS2cS/L9lX
 DflbAQV6fFIgcncd8uo7KV52BU26iDlntIGv880TCNwIu5QFChSXpSxtVZycuihKK4HmeMWqpGy
 iofDoRIqRmBs+NN9K0RbUjqhQ4pEGrhFe9z58l2I3ca2+a9pahZm4YLK/Po+I0pF2qfLk6XGx3o
 6DkH91dOOyOZZUuf9CgBoxOTGBW3FsU2srcOMM8d/AwiBhdb00PtrUGIInv1gChg0DwPx2HUAmY
 XMFnpwwGFrZtK/fKo+cWLEEYFZDZB0k/LZhCYVDbRM02oNfhaHFG+d3ZDBTl/t/cWiVfe2HLwDC
 PFVL5TMXg1sVhTBY1FHsZP2Qd066jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

changes in [v8]:
	- Added drive strength for all lpass_dmic pinctrl nodes reported by Konrad Dybcio.
	- Rebased changes on top of the latest kernel tree.
	- Link to V7: https://lore.kernel.org/all/20250720173215.3075576-1-quic_pkumpatl@quicinc.com/

changes in [v7]:
	- Addressed the review commnets in dt-binding patches from Krzysztof Kozlowski
	- Rebased changes on top of dependent patches
	- Link to V6: https://lore.kernel.org/linux-sound/20250715180050.3920019-1-quic_pkumpatl@quicinc.com/

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
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  99 ++++++++-
 6 files changed, 540 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
-- 
2.34.1


