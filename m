Return-Path: <linux-gpio+bounces-34115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ObnBUCqw2nAtAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:26:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 361123222DA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E33C03084B23
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE10359A75;
	Wed, 25 Mar 2026 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/0YviPP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiEKr8H7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93490303CA0
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430360; cv=none; b=Ovns/OpRsYZjhjeh76rxsGnfND/a1F/0AePL85pHFCC64XPUoxvMyJuyCxkS3cwgzow1O7nScE2EeObDWf3MnTcpm+5rGdm1Yg2BcpVUGFwtoQwuiD0OOQaGqrijgLCfjNrL6CIPXjR4bn8QFgtnZaMALalANLFSrCik16+GCWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430360; c=relaxed/simple;
	bh=Z2A70xPuLx5Qx2+ylNKmwq/SEaBeBQZatR8yiCsq5zA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c1ycKnQi896eXBiZYNsVNvvlzQhgLo6LUc8M8Cto9MxmiIddAExsDINuWdK19J3DDUpB9dsxHF7WEHzXFy15AX3U5eTek9pRvYhSIARqRAq6bLPSXxl9RSnzIn9ickmXkERfLlUf1iY+p8Z+7jMo5hXCwQIS21vSRzFyUIpMfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/0YviPP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiEKr8H7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4eOO32807988
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iSKomS5k0XPpWWOTcEaQoi
	B9gI7D7WVUTAGCcb+RaJo=; b=E/0YviPPm0vWb0Eb97X1SHtwaxEp+vIGMzo40/
	q50XBK22yx+9NVmp2CqYZ85Q4uuRVaLAx+RIGMo/og07I54TREWGvl2ZD9MJuH0P
	Ht2dgJ1An4WsV+40oIkPsDBOLPX8zGI7wXo+dgkqi+Tg1jwUvnHj5s4EJj5rrGOU
	4iEoY/nXcc/KKu6fVfYA1d8BYMHDIvJUnVAsHLMxoH/ADHYDFlmZk85UFmVsyWLq
	hkwq93n2foC1ni0p8Y51E/oNpicFEJmFtMlWlECDUBjCQ96X+vxwJDcq7fMV16uW
	kX0nn9vXZlSBtJfvCtZaUfb2Zmxh513GRPyCL6x7UN65LwJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9emaw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso4103046b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430357; x=1775035157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSKomS5k0XPpWWOTcEaQoiB9gI7D7WVUTAGCcb+RaJo=;
        b=eiEKr8H7HrbAiu5SexIkfR3R2FY7v57lFyKhQB13GPnbmWLLoZSkE0osAaG8KcqUrV
         XQwreMFSDck2vaiCFKAK9XQQFgJ3U3nbtRaNWp5tlTSvTR5yUKx++yw7/dceJM4unhK8
         rdCuUn2cY4nsePOBquPdu8ClCkxnC8wlAD8Bba68hC1Q1syj0P9NyA3HyLb2mz8+wzy6
         BZoRowlAA6dIwjGVBAQob/SDm/NiGmel1IJBH4kiaQQlCU+zL7kcB6ellxeGatBnGorr
         YsW5YQjfZ8fbBGLTLqQ0jXQDNrTAA4jllW6beu9W88xOjgAD4aamapycCXm+0Q29unoV
         zZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430357; x=1775035157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSKomS5k0XPpWWOTcEaQoiB9gI7D7WVUTAGCcb+RaJo=;
        b=SBbLmcXmTVUs53hfYCKMsLdzGSRRcYqo2ml8tjT3UWF14Pmp2O1JSIVD1SYm+EXmEz
         EcZ45hq4q8B2g+rvIqlC/PtcGsqxqkJ2necfJ/rcq+SvJZUfCKRFDWwei0jq8lXs30Bi
         XvQaQceLaUjMCqLQK33ghpTd7FxtRGpOvhFmQKqG9+w4xUo7yjgGEIh/pAuYRltafEzu
         Mt27olIc6zFeqa/N8wsZV3xzTD4HzbbUHBDqLk9bwnVNQx73QXzGnY7If2ANJtqbnkNh
         Q+fQfd9I60mZUw641e9tjR1l/lUVU9Dr29VCd52VV3gS0FsJFpfrVW0UEHCsA3QZct4Q
         HKkw==
X-Forwarded-Encrypted: i=1; AJvYcCVGpiU6sAvG11b+E+Ox3vMeLv42wyKNqWE/14GTLaIGz3f0dCY4PY9PCorb0iwJLv738da0SZA9Y0HV@vger.kernel.org
X-Gm-Message-State: AOJu0Yznj+dYe2iTBwpQQI1CgJCoIBBWM5YfyFp7Qg6FjAZFxEG00lvq
	3abph6gzh/SE1/QOJ4wU8C5lAwFWzzH4+evx9XW4UZvXYcYtEZA1IewHMVRnkq9yuXKrRmlFQxx
	KLpMH2k3MgEaDRQMshdcc8Rea94x3lfHvJTlf+7yCk1zWiyy0AE4QvyqulUV8DUd/
X-Gm-Gg: ATEYQzxK/gz4HZpRIm5G/oF5fm5TI9grOSeemX6DtyLwYK9Q9g99ln9wfz6FS1lt2+I
	QmLBObD4VuZEOnvvjotIaG/oBr5xYeGy0nHhfK7S9Ycym0y9BNqf6Pgwg/UDk/NlrrAiwV1OSSE
	h5//UMw1ixwFtBsrdSRLMMi4vswkxABiYMyYIVDW7k+leHEqbVKzpKLYMyrnLQo5h+2gf4yUf3x
	TEhebGyB+6/pDL+g4YOelV0Dd0vIi4emvZHM4vAsRGqsKe/8ifavKegaO2GsGohBDqNVR0qKK//
	hh33AlRh5d50QteKOitaiPS3uSzQDu51wtCnm9/+qKLHs/7QUCCUB5Aomj0YgAKxvDObiD9tab3
	IvQWh2VUo76mhRSNgD/R0hJdldmm5T7LKOVlylQrX82xjTQ7R97p8CmR7TzyKiPR9Z610hiOnYR
	Aj9u2Nc9r+ssLmfeeiReFKHkWyovR5680DZrxf0jUBnytD69KR/QYgqqSJ
X-Received: by 2002:a05:6a00:ad8a:b0:824:36f8:3461 with SMTP id d2e1a72fcca58-82c6dedfe79mr2958237b3a.23.1774430357131;
        Wed, 25 Mar 2026 02:19:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8a:b0:824:36f8:3461 with SMTP id d2e1a72fcca58-82c6dedfe79mr2958210b3a.23.1774430356676;
        Wed, 25 Mar 2026 02:19:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 25 Mar 2026 14:49:08 +0530
Message-Id: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyow2kC/3XPTW6DMBAF4Ksgr+tosGMMrHKPKkL+GYoliIPto
 EYRd4+Bql11Y+lZmu/NvEjE4DCStniRgIuLzt9y4B8FMYO6fSF1NmfCgFXAoaHuPgtWQqe9T13
 yXRxwHOmZW12JSsimB5Jn7wF79727n9cjB5wfmU/H55/eFoddyl87jdNEbc9YqbEEoUW78E3VK
 iI1fppcaotaNNXZWKMs9GTrGFxMPjz3Uxa2l/zI9T9bL4wCVbVEJg2XIOHiYzzNDzVuJaf8kOu
 6rm9huwi+JQEAAA==
X-Change-ID: 20260309-ipq5210_boot_to_shell-43db656579f0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=2504;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Z2A70xPuLx5Qx2+ylNKmwq/SEaBeBQZatR8yiCsq5zA=;
 b=RJKV7Lj25UPnue3nPFroPH1s2xOZlscFQqPVZR9kNfDLCiV0qbpHWtwev1BeIRWk4Rennfe0f
 cdMDZxMj6lrDoBJClszpCYnWWrrOqOJ+TEZQqNunNOag5OfZcfpHh9f
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: zV6O8YkuxblI96pqjSpQRayvEtcfNHVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NSBTYWx0ZWRfX5pcCq+ZJJ8NB
 fhPLYbvGRbS/IPyBUd3QkLlglCPaQIr5w2O/dF/L/l4nwPR1RHdccOqUjUSe5GGD2Y7YR3992Pz
 TD72upI70uWXsShv0dZLGQAN5C5UP/875GEibve6k+G7Emmu4iSPGJUcJEYKrYEMgMinclCZNR6
 QGc79OIlKEuzGMLOW35yaCLjQ1/BRyCDxhrio/T1Usbx6tp5H23rZPia+TGiOS0dBP70sHCAIWs
 EFKEz5FMqd9HAvIjstafK7kRt96mO89y6CxMSRwbcMATdGpPj+c4FhQJu13cyqS/9/jcY/GovDW
 yCanNe2ZIE406CRHvpbRKzXpa5TBUMSZEbAX5dCwSNZT1hYA/Nk5v5qdvu+S3pNTYNgLKHsH0lw
 8xfftQSwiRO7xV4h6JCZ7RUEPPSyoho7DII4dd5eDlUexmJ1iDl4y7ecHFuaSPDNbDoKt80PTqp
 GB00LifJZymA6zL+Yow==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c3a895 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bSgCymLzPmkwYw6MPxAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: zV6O8YkuxblI96pqjSpQRayvEtcfNHVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34115-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 361123222DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
series adds minimal board boot support for ipq5210-rdp504 board.

SoCs based on IPQ5210 is shipped under 2 different marketing names such as
Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
F8 parts has the Passive Optical Network(PON) interface which acts as the
backhaul where as in N8 parts it is ethernet backhaul.

Qualcomm Dragonwing F8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/f-series/f8-platform

Qualcomm Dragonwing N8 Platform:
https://www.qualcomm.com/networking-infrastructure/products/n-series/n8-platform

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Dropped the patches which are applied (GCC, GCC binding, SCM binding,
  defconfig)
- Various cosmetic changes (drop the comments in intc node, kept the
  newline before status property, padded the register address to 8 digit)
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com

Changes in v2:
- Separated out the TLMM patches into dedicated series
- Dropped the extra ':' from the GCC binding
- Added a comment in GCC driver for the need of CLK_IS_CRITICAL
- Various cosmetic changes in DTS (inclusion of dma-ranges property, \n
  before status property, lower case phandles, enabled the QUP node by
  default in the DTSI)
- Picked the R-b, A-b tags
- Dropped the SDHCI binding change since it is applied
- Link to v1:
  https://lore.kernel.org/r/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com

---
Kathiravan Thirumoorthy (2):
      dt-bindings: qcom: add ipq5210 boards
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts     |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi           | 311 ++++++++++++++++++++++++
 4 files changed, 396 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260309-ipq5210_boot_to_shell-43db656579f0
prerequisite-change-id: 20260317-ipq5210_tlmm-df221be105b5:v3
prerequisite-patch-id: 77404131104f6d8cd899765726fe7e6b41d5af6e
prerequisite-patch-id: 8ed4183a0ea5bf860584e9a5e7d594798f409444

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


