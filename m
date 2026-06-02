Return-Path: <linux-gpio+bounces-37822-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pd14ENz5HmpsbQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37822-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:42:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D462FE6E
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OK8hFhbB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AHCRHi9M;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37822-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37822-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D414301E43B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 15:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D7D3EB818;
	Tue,  2 Jun 2026 15:22:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF03D5C1D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 15:22:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413724; cv=none; b=EAf1LmC1TA8uF6S70MOG55lp+pCC8b/pZN6sgI4lkavI3CfZ9Uwo9LRVhRp8BQXEWNu0Cg4O4u8j2QOeBmflAM7iJPVoeBkECU4/9EAH1T1ANx6ipm8/N8dLW55fpJGrZY0BJyBRpnqCBxcC7rR57+sz7b2cbEQLcmoDFmiNzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413724; c=relaxed/simple;
	bh=lh8FZMX2soQdqCvJUlCXyl979Qmo/LQaCjt7G5Tzax8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KQYv+wA/RttJslm1EZb6VNou81VhNhiq0ukx4LOyen3XUTNMU6IuHDD+tE4NZ0QNA6g0AR1wFxGmCrSEK8DlhwYIt79d44K3kQZMs35Q/B285yVpbYo/eaChy79SO6k0Cp88be0y5e9Rf1k0m9DUup7b6WKiFu2zdFyqe+LCvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OK8hFhbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHCRHi9M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CRYZT4012499
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 15:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rula0vxp21DSEXYbt5FICL
	GmSa3GjueuuDLvkBfCxeA=; b=OK8hFhbBaTiNv1PaGBM6TcxK30wb64QPRVRHwk
	8C6+vFuMBZwa2GPPCOeuIvGH/YROzmtmK2NZSFRHTLjLlmK+3P3ZpvqjAM95tvNM
	YiHWk9QFm9o1FphvLWpekBEFFf8hwZAN+1QMRtpGDla6IeyndmyGWZILaTDm3LDq
	Oz7rcjc5/RFaOOQrFffTq2ggFx6BeSUcU8ZvG+OHOXEOYc5qKnGlUnEchVtf2mbo
	fUcHlQKGEi9000V6YQi9rHpgTn0mohXLOLHfWYB/Frdfys50/W4TlpOezhwvMoTA
	M5xVwMQ6kP4Z5CH+hU4Cb3r0zPOnlu6h00DeyFgxaldb0w4w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4jact-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 15:22:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso77445a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413722; x=1781018522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rula0vxp21DSEXYbt5FICLGmSa3GjueuuDLvkBfCxeA=;
        b=AHCRHi9MbRZEU9Eehx5BQ3tRHFlurQRtbkmJUQnCGyrUIoQ0B6fKdH+HlErN7qy1NC
         PxJN5mjE7krBVDoBLjqWrrArV4BuyBC2LY4KUpuwFUHqo305PjNlojyFyDpJXiKE0DXV
         liLzjoXGP/GQPnWv4BP8GvBtcQBO7qpCftOarwqKrfPiOXsRclDTVZD54rPyvlE8kd9s
         Y08CQ7x+416F4neB3kHS/InJsWkWuJIXLG5a0pncTuYcVixSMKDJRS9ndYKNXLeJ2CIP
         pao9uj+7otjme2o1E3QKackvcUWAK2yefGiSz8S1wkbUCDBvFNGtCFHysGNXOXc53hmL
         qPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413722; x=1781018522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rula0vxp21DSEXYbt5FICLGmSa3GjueuuDLvkBfCxeA=;
        b=EDML0IK+pgVkPQ/a4bzWKVl6I5Uoo/Xckaqah+3gJolPkEkwwbDP+dDNYxQzKTzP89
         WhqFJe/oRdAM6cgEYWOxLqhmpphnJlxiV6JfhJolUq3+zWnzKCoMKsGCJIodfM46+OIa
         GrT332TPZ2mkhbsGAv4YgbpbWbOFG/9mhRXH8iLOOYPbPmYSCBCKL4Sv6lDhRsm0denr
         O8wWQl/ppw2o68eXJlsNvEAiNMvez6YjIbSLIxdDHogfDMUGbFk0psRSOIPrve8joo4D
         JOOv/vUb6cMf0UJQUIJjiJhM+HTUYUha9FLisbEI8m9vivqD0kzFmsq4Sdam3Mx+RyHm
         6qBg==
X-Forwarded-Encrypted: i=1; AFNElJ/z/c5E/xk3pIGwPGD6w4g/+uvM5GLkZLcTMMtoA1dtX4zpZX+LDTeVbhLcniYsbcN22ldz7DwMr59d@vger.kernel.org
X-Gm-Message-State: AOJu0YxmBgTSRG5+clUcTvOr9PK+Xp3GupmhOBMsxCN0G/DXqL043g2d
	6gd/uBwa4r7UQpTRjW6BuT/2SdqxlYpGKDVu424zfT7Pkf8eWRa1nHaM4jcQC7pLKcOf2IAcA+c
	oBu0wqFHbk/JOy9Z6lItdsDVQYwu+PPnOzYYOWSQgbnXcgdWUQkF9JHwlU92YM+Gf
X-Gm-Gg: Acq92OH3PPh/pnvjIhjopQ6jph1AaNtWFlzoNo8xkH1kIjhmkGuGMPlWxE305gPSt1K
	YpaLkPXf/dpwInKXO/QGY1j0n0Nbc4dXkCMHJ6uJwnjy5tANxboH5iphbyz7pOn8pD7/AQjGiRc
	OHYk0nMYj7hsAztc1IM5moYO0VAhs2syoUibpsOCaSGoRpjyIh8QA1jixU5kwaNbi+eKIxXaMSn
	k36zolcJblJBTXhkvkBIYsNcOXuPP+DykjbYT9p/sTnfdq/ODHMRElhJqbp/bi1jeziOrYns4tn
	XEbIEEuWYBHZyO5PvHZsNt8XzmVOVeArK89WjssRNVfb4yzfzHHUbhHlqGf5rIRBaykU/QLK3v+
	jTJq1I7Eqrt/QM7z3b9D4L0YPTqxI6yE6YvzlkCifW5SPU/xbOritXGGj
X-Received: by 2002:a17:903:230b:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c0af09f5d4mr156636085ad.30.1780413721687;
        Tue, 02 Jun 2026 08:22:01 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c0af09f5d4mr156635555ad.30.1780413721216;
        Tue, 02 Jun 2026 08:22:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Tue, 02 Jun 2026 20:51:48 +0530
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAz1HmoC/x3MTQqAIBBA4avErBPUwKirRIg/Uw2ViUIE4d2Tl
 t/ivRcyJsIMY/NCwpsyXaFCtA24zYQVGflqkFwqrrhk0Z/aHbteoz6D17dgPQ5OOmG7wVioXUy
 40PM/p7mUD4Ugca9jAAAA
X-Change-ID: 20260602-pdm_clk_gp_mnd_v1-7e9c2c1b39ab
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfX2t2kXc7h7QrT
 zS06VMnkGGhhBc6AsMxxmuw91GsfRHcbhUgOxKOudt4V6wTzy2OhuhS/Q6daEMsaAKsoUSRSssK
 TImxJ8gSgsRwOmP3jXwlt0Z4lR83G/SIEg9E7JqS4tvK8p2O+1aIoXqojRpbdVYjt8D/oHGlMfK
 iTfMvWHz50v+jpt1kJUXtZTDI7m5vIsMxw6pMHTaZB4VyqD3sMKghRxIkr3WbMQiJzJMLUKsdlz
 hnmgHDGpTpqVeDlGWfX818d2LnFYbxl2K+fuhHljQ4L8jnM2sSqAyEjcQyvLCyaDT15iwJgr13r
 17PRICMUsNDEJpO6K9kiVSSQmBYDox1j/B5+6N0qmNq1vRpzX8145b6uJw6+YsVArKAKcjByj2L
 lM3ytazlDFPHI7tPra9sxyQHYRn6JSozXM4+R4qBsE+g9ValXPOpOePjT+YCEc4dmMQdYw1C/wj
 uRJwhG/XkD6MmaNiyjg==
X-Proofpoint-GUID: xEGbXFyWp07hu3VBMMjPmPHbMI4xqczN
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ef51a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7twCsXJWkRLxYzWIcc4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xEGbXFyWp07hu3VBMMjPmPHbMI4xqczN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37822-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 348D462FE6E

The Peripheral Web's PDM hardware block on several Qualcomm SoCs
contains a GP_MN clock divider that generates a fractional output
frequency from a fixed input clock (typically TCXO4):

  Fout = Fin * (M / N)

The output is routed to an external GPIO pin via a dedicated pin mux
function, making it useful as a reference clock for external devices.

The hardware uses three registers:
  - MDIV: holds M (9-bit numerator)
  - NDIV: holds the 1's complement of (N - M) (13-bit period)
  - DUTY: holds D, the low-phase count, constrained to M < D < (N - M)

This series adds full upstream support for the block:

  Patch 1: dt-bindings YAML schema for qcom,clk-gp-mnd
  Patch 2: standalone platform driver using rational_best_approximation()
           to find the closest M/N pair, with full clk_ops coverage
           (determine_rate, set_rate, recalc_rate, get_duty_cycle,
           set_duty_cycle) and AHB bus clock gating around register
           accesses
  Patch 3: gp_mn pin mux function for QCS8300, SA8775P and SC7280
           TLMM pin controllers
  Patch 4: pinctrl state nodes for the GP_MN output pin in the
           kodiak (SA8775P), lemans (SA8775P) and monaco (QCS8300)
           SoC device trees
  Patch 5: GP_MN clock controller DT nodes for SA8775P (kodiak,
           lemans) and QCS8300 (monaco), clocked from GCC PDM XO4
           and AHB clocks with the XO4 pre-assigned to 4.8 MHz

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (5):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      pinctrl: qcom: Add gp_mn mux function for QCS8300, SA8775P and SC7280
      arm64: dts: qcom: Add gp_mn pin state for GP M/N clock output
      arm64: dts: qcom: Add GP M/N clock controller node for SA8775P and QCS8300

 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 105 +++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 333 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |   9 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   8 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   8 +-
 10 files changed, 539 insertions(+), 3 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-pdm_clk_gp_mnd_v1-7e9c2c1b39ab

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


