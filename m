Return-Path: <linux-gpio+bounces-36457-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP32GFDL/Wn/jAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36457-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:38:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A914F5DA3
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79EB830158A9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 11:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520B2F8EBA;
	Fri,  8 May 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7/f1to3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JP42SMya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A853CEB9B
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240209; cv=none; b=EZmPwvN3dKVxtvA+ylSEn1TTCMPzcK5XvUzLSLn6r/4SHZcPp5GQt66Bgu9HadM1aokopa8Cclvn7NE8MCnrx69SOwNURwO+lLjKF25FUHw14quTgmckDxCaUIKjBITXKoIYw398rKFNt2M34EnB/f7cbPhhLjPBMzOgcAecO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240209; c=relaxed/simple;
	bh=bCoJv15DKrBQkpaJ+E9AvbIvH9keS/I6QI8ZiTWZmGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IrYcvEhwkfEy3i68KAAQLnG/fw3SLNDg38sX3dWJTTrcN7oQE5XYFN3+/pKtcpszO2xJvB7fBsZ4ORrohOYmoDUAXnmLOA+ifOB685neE1U0Ny5U+yhRiUg7rYarVFLbs4cjydWXHkyf99pY4/KtC4XnrC7RIVMDulDTQnLSpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7/f1to3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JP42SMya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BGATF2777673
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 11:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F2+LVMIEyeRvy6JU/N9IZmQuXyI0l4T+5B/
	LtVA2G1A=; b=U7/f1to3Pj2Z5PWGfvteoNRQ8C0LkXuFRUK4Nf4+w4i3zert7f3
	aqiIqRUXP+O7glMc2N2SPnyT8ViT8EefqM+bQWPJhnMn/zMF4cJISHzlbJ1snwmk
	NkDbGQL8Qz5XM3+OUAVSRzaxri7cuahbfbFUcqAujLMTRrRQG80gZqursVeL0vfM
	CS3ynZ0frlZmgvipJupvOHxmLzZeSlrMIYliGDm0A8NZ8Mc1dx/L+5/SpfMi/Wby
	uT6Y16PKyFm/00cchmmkLJeLN1MSN6R57BadvAa/VicTQe6ii7uy42vLSczUMnfS
	ImpIm4H+VnbmcCxDSHZlQxVrKKBOfOYedeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285jvav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 11:36:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso2426104a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240207; x=1778845007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2+LVMIEyeRvy6JU/N9IZmQuXyI0l4T+5B/LtVA2G1A=;
        b=JP42SMya18Ld0EG6JrSxXGf2HK+DEhuFHjr/8WHfvMDV04nIO/socxVb75wYCvxDb0
         ZKppsRP3/9QyhzSH7Npt3sIp0/6jVJyblSC+/lxTuVWdcdsugt2QXlv7xSirU5k9zqCt
         a8UnG7bAWu44p1oPC6V07ZCd+/K+YTw6d6iWs59xh8ZhGpaTV+Doz7rrPFa6WCrN6Ig/
         o+fAreo+CGDx4eWeTViFUE217dnoVHL0IOwdvgDPA6F23n0afgmAyg54TvSWp0DgHby8
         271SJQoFSzMWHgZA6Reb9txyETtXwtpIYXbosZXUkxSD7ly+0AXCfMw0bNsZy5v55Knn
         CRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240207; x=1778845007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2+LVMIEyeRvy6JU/N9IZmQuXyI0l4T+5B/LtVA2G1A=;
        b=OFa4d6hs15Pp3J01/WULa3yA585g27ZHrv/UWhWT28QF9bcWTWi9FZlJp/vvhemAjJ
         3Uj5aVAGpo73235pwn2gAk5NesZ7zG+ufA+vxLjBrVRo0ZsLEIWYnnefB2NsUeie+IGH
         chhF+6SQcFCNUyk+MYWzb/Ah/q/xwLiTh63bl0NbhzBk0kmPb4zt5CwomzB39RxdVS0I
         Fq4Jrux7XlH65Zax1HQgVKEWaVgFMhuKYPdJeFcgkfArzK3AVYha9beY+iyi0t9yJ0qZ
         87KXg+QA50qfQMlbEQ0qHQHrFzQKmVI/+KYKveXhV7mi03mXZ5gv+MKjPKLT72RPY86x
         ohNg==
X-Forwarded-Encrypted: i=1; AFNElJ90LM8WxmumGMO9tiorMo6JsSJyVykszo5RnBG5cXYf+vCy3Y+08YM/kq0YuBCksBu/kpHv8RZqjORw@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpYlNZZfcOF59HRczpIBChvyUMQ1TiazIFWbwb/dj9tdlZLi2
	FYbfVWff1A6OPbRigD+U60F7NvB617BdL5Wc6W4fYR2Df/TSDBDrQ740oo+cTCUN+tnA1fstFSz
	aInkzZaMlERP7on5YeGcLiVvJ6wlVVgf5t+eAyxWCd95E6ITAN1Y3qc86xGU7Qslv
X-Gm-Gg: Acq92OHLO7VRdgd7RFdWILFFAqFnjASRIy5kFT5G9zl1mpVkn9/8XfQIeMGiLEFINum
	/DIJpq168gK2w1vodwFlazm1onEZNoYa9NRAFpextNPntgtw/2lVNAgU7rqlnfnFIdYBwEzFgEq
	cnkzYcRXhQLbn8MNpX+8OWFuHZQQY+y9h66SMdtUNZjeLn2SusPuP7gfsmY/1ZUqMY7ddKO+bQe
	GnHNzaHa7+VPep238DZUo2gffDfZMpgjO9o4mY7d524HeBKvGUZhKPFINBsmbGCfF2EicU3xy0P
	ksI4E4u4H8p1iPWxEC5vt8189jNusbMvxUNag/ImvIa4CrRXR3WPOlERK4/I0F3Ajz6mtmi67+Q
	qnnivJLaN7hZH5Q53FgE0ebNjd1yAvRfJWJrOu5WP4pj8p2oOHw==
X-Received: by 2002:a17:90b:590c:b0:35d:93c7:e386 with SMTP id 98e67ed59e1d1-366052d03femr5998986a91.4.1778240206964;
        Fri, 08 May 2026 04:36:46 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:35d:93c7:e386 with SMTP id 98e67ed59e1d1-366052d03femr5998952a91.4.1778240206437;
        Fri, 08 May 2026 04:36:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bdac03sm1256373a91.2.2026.05.08.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:36:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] pinctrl: qcom: lpass-lpi: Switch to PM clock framework
Date: Fri,  8 May 2026 17:06:34 +0530
Message-Id: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX3QH+FpAK53nd
 LFd/6Bp4K640bkLWynnTy+l5mU3UkdgryMgF8eYqBwQ7avCS7Vy6bA+V6Ki2RDX7lPwgJqDY3x7
 RtGJYxtq7Sj6looQhzDehTFjyNLKP0oZqVeUJl1BLjr0MBat2xSheM/XII2RBSARz7pqXL/w51S
 W1itBR1WfXyjgUeYRt6LFDlxRMJmAfWoZW9L5X/i+91/epg6Pxw7JRyTVdfuYO3ARHUlTTz2JbF
 F8tD/G8VN8Ja7zTVcAOh1PBcxVdDvpIyxHTMmVQ0a8aS11vnTOA3QQMIsGydwMJGyIYkGNYE5/a
 IRoB0T1/yPH4ZIzfIFygZiu95jfhWdpCo+tRSOpxbihqkwi0f3YsVLUVR1y2VFyExebQ0KmYbC2
 dsOseJV7qr4MYb8CkDHHQ9wq+isSdi46CDIaqmG6w/LNpoyo0B6/ONfRx+RiwmPchidUFZPaObT
 j4o4rlLb5Eak5AFesIQ==
X-Proofpoint-GUID: 8cMw04Pwuc-Zd44qubXzVHWpyXQ2Jza3
X-Proofpoint-ORIG-GUID: 8cMw04Pwuc-Zd44qubXzVHWpyXQ2Jza3
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdcacf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GA15WUm4zoOJX-8LQ24A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080120
X-Rspamd-Queue-Id: 04A914F5DA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36457-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series moves LPASS LPI pinctrl runtime clock control to the PM
clock framework and ensures GPIO register accesses runtime-resume the
block before MMIO.

The common LPASS LPI core now uses PM clocks and autosuspend. Runtime PM
callbacks are wired for all LPASS LPI variant drivers sharing the common
core so behavior is consistent across SoCs using DT-provided clocks via
of_pm_clk_add_clks().

---
v2: https://lore.kernel.org/all/20260420123135.350446-1-ajay.nandam@oss.qualcomm.com/
v1: https://lore.kernel.org/r/20260413122233.375945-1-ajay.nandam@oss.qualcomm.com

Changes since v2:
- Reordered series for bisect safety:
  - patch 1 wires runtime PM ops for all LPASS LPI variants first
  - patch 2 converts the shared core to pm_clk + runtime PM access paths
- Dropped the standalone "Resume clocks for GPIO access" patch and folded
  those changes into the core conversion patch
- Added runtime PM ops wiring for milos/sdm660/sdm670 in the first patch
  so all variant drivers are covered before core conversion
- Rebased on latest linux-next

Testing:
- Runtime behavior validated on Kodiak (sc7280)
- Wider runtime testing on other LPASS LPI variants is welcome

Ajay Kumar Nandam (2):
  pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on remaining SoCs
  pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM

 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 109 +++++++++++++-----
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |   7 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  11 +-
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |   7 ++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  11 +-
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  11 +-
 12 files changed, 164 insertions(+), 42 deletions(-)

-- 
2.34.1

