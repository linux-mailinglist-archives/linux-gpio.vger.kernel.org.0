Return-Path: <linux-gpio+bounces-40130-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sC0YDKCNV2o2WwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40130-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106575EC6D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aMgaXM/1";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40130-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40130-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B04C30810FE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80CB2EC57C;
	Wed, 15 Jul 2026 13:33:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4902989B0;
	Wed, 15 Jul 2026 13:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122381; cv=none; b=ZRAlMBSf7Fbw0lG48vaFN2bsGaBKb2il59mdaxUQmt+HIEHCKZ4jf+pUh9hIdmmAXQZ1JN/0Fyqktn6z6zb+2WtAGhnXEiz0brNrpTZRM+W2jB+wpXdW3sm4xjiNlV/Les6spgxu92v4pH1CwgfIBoN6O1RztVBjnQpvQUhSjL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122381; c=relaxed/simple;
	bh=lY2151NBGx56yZ8i0JVpbAzYx2RUO9pZgEMUvhj57/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ic+VtVaFOksEpdeOmcVSvwe95c0ThuIrHaDE+fMQmbioCbvzadFScsHlWKynx4I8fPrBkZbccFcC/THT4ldJ+onBnu6pJMUReLWQ8ZUophJyzuKwsDsWqKwMWitEth4JHEIxYR2SsnERMrTbuitXbWP95DRxePzMWCV2tFZ7pVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMgaXM/1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdTMm3697867;
	Wed, 15 Jul 2026 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CzU2rFTde2cdldv1gM+BQVKUoYIccHXLxew
	3Utc1hBw=; b=aMgaXM/1IkGKKU9N8xNCyLp0K/hlXzYDMX4ILXuXAw9GF9L3AbS
	n+caTHeRZ28FcKuLj4XRjjdgXcIADGj5uSIJ39GlsS5+YBn7yuD0xotqZtmFVzNx
	NalUL2ATx39ddEOOIo3227vAYFW7si84CisjSynE/7euk8Qv/GkmYZnXj3KwD4Ca
	TuO5dtYwBbmiT1lQ5hlIgZrkkkcb/MCsiirnJ8fyGujzWLC7BT1Gt8l7mRT4k3X2
	mpnI+UisVVenySdG0D232HUOM1XCJPFQRSutV5n442mUCRtbaE8gsvkmuSgVK9Zc
	G2Dvm1cMrnVXhWJ7HPRJoTWJVPglku8jqlQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjgts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FDWkkw030469;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewk39sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FDWkd8030439;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66FDWjKJ030433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id C9EE8632; Wed, 15 Jul 2026 19:02:44 +0530 (+0530)
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
Subject: [PATCH v3 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and Hawi LPASS LPI TLMM
Date: Wed, 15 Jul 2026 19:02:39 +0530
Message-Id: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a578c02 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3Vv4hHRP_OtxPK84qJcA:9
X-Proofpoint-ORIG-GUID: 7zh8_D8Iro9u_1t6PFdhpLlp7rsa2hLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX3xnKXoU6Fn61
 VdufxNNlL60IYVet5n6Nzs1NeI3VJoDko+SvH0YmQpoZlZCR7XXQ8yydvQEh2LBfKTfhSsVg4FL
 4in06WaNEYZzS9ppNKIQCpmpsJje6/8Ji5EOmKLOmdJFD8ON96u8smNkySfrY1HYSvMFH88FdHJ
 NmSVX3nvZw++CAmnnu40TKBUyETivQSG6demcj5ifKUcolbAO95Mp8VDDY7y3mzSw1uktvcWyRx
 V2eCMjv8iZeO7g9PgK+I26Qi6Nl/p+g8rvC8wFykCySGsb5YUU5LJ+ygWegqpNqRVFbE1mO+dQR
 dIo8HdZoiB35aWrEq48tWdJlzr1GvjdbTKCFNf6Q60KmjS+VlOZip5O/9ZpWKiUMrxNIl8dLEaH
 QQ1N8RGEbO5FzMDIv2w3LyN5f5YHHhv7wAFTw3lxQbqRIPhuhxyx6pKNSfVBHlThpYiZPAKoG43
 Q4VO1GuhkBA9uQ43uaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfXz0tkiwTpxANz
 k72NKJO+WQUn04edRkUj8NXmQmeKcZQ2Ulww+j4QMpiZtD9+o3l1EFeE/oDjCX7IdtypIkgfRgw
 r/FBLOCSERqLwgETiM1NgOgPYou1IuA=
X-Proofpoint-GUID: 7zh8_D8Iro9u_1t6PFdhpLlp7rsa2hLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150135
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40130-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8106575EC6D
X-Rspamd-Action: no action

This series adds support for LPASS low-power resource (LPR) voting
through PRM and introduces LPASS LPI TLMM pinctrl support for newer
platforms such as Hawi.

On such platforms, LPASS requires LPR resource voting via PRM to keep
the subsystem active. This is handled by adding a new clock ID and
support for PARAM_ID_RSC_CPU_LPR in q6prm.

Additionally, a new LPASS LPI TLMM block is introduced, requiring a
dedicated DT binding and pinctrl driver.

Changes in v3:
	- Drop the mutex cleanup patch from this series. Since this change
	  is not required for Hawi enablement, keep the current series 
	  focused on LPASS LPR voting and LPASS LPI TLMM support, and 
	  address the cleanup in a dedicated follow-up series.
	 - As Srini suggested changed LPR_CPU_SS_SLEEP_DISABLED to LPR_CPU_SS_SLEEP_DISABLE in patch#2.
	 - Link to v2: https://lore.kernel.org/all/20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com/

Changes in v2:
	- Add mutex cleanup devm-managed in LPASS LPI Pinctrl. 
	- Addressed Bart Comments related to newline and readability.
	- Link to v1: https://lore.kernel.org/linux-arm-msm/20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com/
Prasad Kumpatla (4):
  ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
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
 sound/soc/qcom/qdsp6/q6prm.c                  |  16 +-
 sound/soc/qcom/qdsp6/q6prm.h                  |   1 +
 10 files changed, 400 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c

-- 
2.34.1


