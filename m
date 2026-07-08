Return-Path: <linux-gpio+bounces-39662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQRvHWo5TmoiJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:50:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0F72603E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PJJjcoM6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39662-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39662-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04EDF3018330
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7C2435AAC;
	Wed,  8 Jul 2026 11:49:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753F43847B;
	Wed,  8 Jul 2026 11:49:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511390; cv=none; b=umDu5PiStWXs0y/NcYcDoG05yHpPcveT5m/PTfFPUaNZmh8pnHvhfBkwKad5SgyYkFDLpIie/JJiFZM8hk5Ho1TL5TD+dycsCX7N2/2ZhNiZCmxeCWi9biDPZKL2/6/sezBLt4SzHVl0KiOSOMqBIOtvpBj6vZgeVGsP24Y9BBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511390; c=relaxed/simple;
	bh=75mQV3jIiVNyIrNBhR+mzmx4b3wEwbEzbyEBTzkvEJY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KlsX+yb7Srb6Gr4QG2BxuTKNslT/6SVwrUhxtTzpvGcpD+kgoHLMFexelI17Qf6UVyKYiUDV/MSuLPIU3M6huTV3KFzipiA30lppP9M4rZYBvfKFLIJC0UuZmKxXpp5MXuXzI+WIskGifhR2FCLth8FcFom2yu3aqJAxWktSfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJJjcoM6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT4oO2716732;
	Wed, 8 Jul 2026 11:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VUpVoX5MTpicU5J8GRfeu3sR15/Kgexn58X
	p7ZUNR0w=; b=PJJjcoM66g5erJ6NSdHq/uBwxxte0hliAi5ShM+u+B5rOTIlOwt
	n8GBuBeU3SpM50oFCi5HCs8jBqZ3C+cW9kYQugko/U/fQThZvEyVfwwWgSAmRQeI
	jIhn/FJksn/C7fyyKkFypAT6ueD4pbNozt7oE9lm0WO86sXkY+Dw9G2tKKKUVMTs
	95w6wSxCAFOI4I7H0GDNHSVYaZXOKr7GsqpYJSHxW4JTjD0/eS5+Asm8Clz6DXC7
	R92XtNEsQ2Vmh1r/hjoX5I0OxTSxiIujZuCo26MH3PW9ODztV30wNw1faGh3U0FK
	AMpNKdiWHTDZFkzyVI6xAD+M3jQq1wsLThQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswa77g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 668BnRaU026286;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8k3yj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 668BnRHp026256;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 668BnRL3026251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3EEDD62D; Wed,  8 Jul 2026 17:19:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI TLMM
Date: Wed,  8 Jul 2026 17:19:20 +0530
Message-Id: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YZFEZ77-yS1_iZPXSegsVQEqZzYi0CKi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX7W4glb0A/pBL
 w08lQ8oNpLtDKZ1TmEkcIAmcOCWsgV4pB5P1B7Z+YR2KeAiYyoUYpyyEpoM7z+DWHecdk24+U4l
 W1vvEt9KgNQdEc4nqf8nAYT2Acryb00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfXypLLGEKz9yWK
 dIJNmQqe03PTxAYPaUyEHLziTiWZXxK/Fq09IHBa0sAYKzcncJx+2T3jZVgUorZZYj6+3Z5/RVw
 nTwbdXvt9FR0+K5mVdz2/s40e9CoHuk46Nnv7wx2A5c+XiJ+0IaCf0IT88xC7C3ThCUhA8TOxeB
 biAD/DiAeLVarcCal8O46HTMGNmbTG2TaXUq+txMw6JLWUhgL9BSp0XnPjRhIlTy883aYJap3Vh
 RMqlt6y5TG0+w+8+h9BfHThNSaPL21K3JNeBoduYmj3h8ID07H79BGYljcAqTpZl3gNOM/ITL3Z
 k3ANZdfAYh59ZR6UxDjzTQ0BfE6yha7M7KpYZ3DlQRDoSH/MO+pUsDBn2wcTqZKAqQ0gb/T2pdy
 TVzW0mI7O3NHRfLGuZE85i1KNQzTPsBI/Ar6zIEvFqB8RJcZJ6hMjahd4ErjP9cRqbj0mCjysIg
 vVMx1aWHak+PEcAXwKw==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e394c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=A1kDerJ_e2SBL1ggGacA:9
X-Proofpoint-GUID: YZFEZ77-yS1_iZPXSegsVQEqZzYi0CKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39662-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59E0F72603E

This series adds support for LPASS low-power resource (LPR) voting
through PRM and introduces LPASS LPI TLMM pinctrl support for newer
platforms such as Hawi.

On such platforms, LPASS requires LPR resource voting via PRM to keep
the subsystem active. This is handled by adding a new clock ID and
support for PARAM_ID_RSC_CPU_LPR in q6prm.

Additionally, a new LPASS LPI TLMM block is introduced, requiring a
dedicated DT binding and pinctrl driver.

Prasad Kumpatla (4):
  dt-bindings: sound: qcom,q6prm: add LPASS LPR vote clock ID
  ASoC: qcom: q6prm: add support for LPASS LPR resource voting
  dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI
    pinctrl
  pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c | 244 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  17 ++
 .../sound/qcom,q6dsp-lpass-ports.h            |   3 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c     |   2 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |   2 +
 sound/soc/qcom/qdsp6/q6prm.c                  |  18 +-
 sound/soc/qcom/qdsp6/q6prm.h                  |   1 +
 10 files changed, 401 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

-- 
2.34.1


