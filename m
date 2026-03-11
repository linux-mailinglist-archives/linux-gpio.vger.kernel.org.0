Return-Path: <linux-gpio+bounces-33111-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFdwMf86sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33111-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:50:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3E26141B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6511F305DD0C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D40E3C3448;
	Wed, 11 Mar 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPUzsrBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOPa9TGm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A8F3B7B92
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222387; cv=none; b=SIegoBT3xfl306jNOZjELkZ/4jG9mPRRvveDKGpAy7wmPfQbarxSaEaolpg0BatralWrFr2YXA2Ye3rVltDBCVWrH6bQkbnYLRLOBvWoJy7FAoiOWKoMSQb66vgFx5TaKZ36iFl3aKf+bnXFWNjBlE+EsVuuNRUIRDixt5MBb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222387; c=relaxed/simple;
	bh=RNXZrAiQpfM/1qCkfKjcDQHfT/ssVSBDe3QuiZjsQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKB7F2FlaDsW/F0PMn3DC0q6uaz8f8ASjTKBiQEerbWfcwNkoMe8jCPF067w9TrYsPR0PBZtnoLflTvwzQvC+ZO3a19sR7b/JIQQ/fadfRgZ94mvTdwZsmGbA+LVaP9DbkzKDhtAGgobzJdhHg3LpPZe2PN2WOwSdhD+p1RV8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPUzsrBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOPa9TGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8HV0p508294
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Am8oOO6jaSnEz+VwzjO2osxzkzNMzDzsmajYpI9y20=; b=mPUzsrBeli+Xv3F2
	xq2HndwCOsyODHDbOQ4Dja6o47A8NRv7TpDvKons0dq9LRXZzQNqDNxiQyB+WkZ4
	mAtvcXe+jERqBnitbWlLYxaDBX9Mr+TmUk6B8x83htkvmPU3poMWNyx7970PmpE/
	zsrKRgsPt2TgaLkOHQhI3tTgjpkS0+pvBqHdJHNh40BkjhB5gFhKBzG7SRuvmOB8
	usSENiQ3cJMpULZiXFCCslYw4DE72QWGIeRal+flYCM2phlfS8gpSrYqyclsgZqv
	gmMAAznB/3nQffDAGDdcrwLoiYtDJKKDGfCeWISCPMTQIjieybIND0CYDLoqGg7e
	SL/uVg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppak79g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829942cf9deso5054472b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222378; x=1773827178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Am8oOO6jaSnEz+VwzjO2osxzkzNMzDzsmajYpI9y20=;
        b=XOPa9TGmEmmHs/ylhTHq55mqy4bjzN9Ucbv9yL0PbUJJfVDvo3XPwV1dA/KDs31E1r
         iw9pFavptGJWVi3lcu3ppx37KBlrl2igIiBwBuhdhX2aDI6G3iZD52wOa205djowGsPk
         F6WrEf4SB0ZeoAqLU7ihE1agBlM5LBs8NmFgfPHTI0urMNOYMoWinpaYvd17zGeQ10Q2
         wp7G1Uwc7JYBO0o3hKM+CHOq4ZlKYnMSynBr9MYShaQp79hSsiDhNstXae5ztvkY1JmC
         QYFOcS0gRuMWwceDyzvJy6YdiBPWr1nM6BU7m13ADEiTbEUojF+yHHVl11nlS/eDwHql
         JKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222378; x=1773827178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Am8oOO6jaSnEz+VwzjO2osxzkzNMzDzsmajYpI9y20=;
        b=i76RkMpjyfw+GP9Nsa5856HFsGqu+usKx1Cu53FnyzbHTH/JP+moT3QCxYUdkLO1x4
         qUqphAWZjOgdKaxSWlvx5eb0yHDUP1fafHnVtzdRC4Ijn0xUecoprt6O/sVVrHRLfZOt
         JROIWFg0eShORGBPp3BcaBbcAm5xpWhDpy/EHYmWsGA/JDNt3PaDMIDBTTdo+ZKO4Ztu
         zCnwEp5Tr9A9rGyRwCecE4Q7+MfYj69PNrYrXy6UAX5EswmBXsU3C9+1yXu2drs2mLIS
         8GWl3tukDtPkJv3CrkFkNA2GrODXOsmAzWueaGmL/FjOE0AvEgYdqoKqocXQNq9maZ83
         Jpzg==
X-Forwarded-Encrypted: i=1; AJvYcCX252nIejTpBFy8AuQwsJjx0/Ji5rNzFdcmqjicJGS9BlIanIRkAS697rtYqzx2dLPitns0eqjAirrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XUHQtObB0vWYmxvJcRi91ijJhpYYbjGhXmphHpfP75VCnMsx
	OmgZVhoXHtl7mXRoP6eAJyy1LwO3f8MhbR6ItX+qUeXwdJgcwSW/RZF0XJdYZ/xakPCwrkslNAu
	yvaSELvRWORI9p4iMgxvuOa+p492Lcss7nFXPofJFARmWVDnRg6bRWRvy4tiJDwoQ
X-Gm-Gg: ATEYQzyvWlTq5y9IkXoBYKPrALMznBY4du0Vgk0xhXG/1So5zgzvT3N/OMD2c/SmYR5
	ngLCyhsDlpxR7u9mmEk0xvwDQ2Hel8QtVD2sw370lzF+YSqd5z9GAZo0Ovb0+2lPW39d0D2+WE1
	SviJ3+Q9noiMTrGP5nIBLqcqdmLKH20/xBLQJ3oaJycVGafYVVWeqE286VRGkmTTOatIBivgu2P
	RPCYvD5y7Cnfkl1Hxx4/e/mKT6sGJkDQdUKkN6krAkaZzJ3SXoODCbH6WGJyLQ+23zvSSntN8bD
	VlAYvsldZQ2O2BigyBhA5BoUyJF0iS/GiNSUQh0C34rto/P/Nce8H1AAFqaaVhW7tPDxdEpSNOC
	AIRTsI6JppE5S0NMfqNwLKUBzBENFlgwvkWivrfYF9BzyrZlAE23qm3aVV+M7lCLsWcngzIVu2R
	5Jyhrg7cs7pPr4rZUxt5ZFF5mGwn2dhFU1bcChc5/g0VchC3eEsS23/WdN
X-Received: by 2002:a05:6a00:3e05:b0:824:b304:2cfa with SMTP id d2e1a72fcca58-829f70dfbe5mr1842988b3a.62.1773222377286;
        Wed, 11 Mar 2026 02:46:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e05:b0:824:b304:2cfa with SMTP id d2e1a72fcca58-829f70dfbe5mr1842963b3a.62.1773222376663;
        Wed, 11 Mar 2026 02:46:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:46 +0530
Subject: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=33467;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=RNXZrAiQpfM/1qCkfKjcDQHfT/ssVSBDe3QuiZjsQqQ=;
 b=d5wLXAVVCY7KgvbkKci2+9pL69bg9n0QhnfbcQEvk/IWciQX6NpwkXAE8D9/NqIme3WGCzgxX
 2u2V1cdfNiwBB4fq8V1K6jGkHhMrsnsFyw3eS6JD3XhmYe07VIA8vG3
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: mvos_mgf528VD6b--5h_3BMUrm8vc7qS
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b139ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4Iti9FFGXJfufOaZZOAA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX/FQABApFrmxE
 V3J5rp2QqDsf/EZy/DpEcj32A8+WGyS6+QAkg4EPWJKQybNxTs9w/KRtqP0uW2Q3rcSm+rNioJu
 0gTOLWRWwBXCWqfvTKrI0UbGqoks7QqQetVyHW464Ms6XBUWGWAHxDCRVyjjg4Z0Rh0ZjTGbB0E
 ySgYDC8TcVpdQssAmLBS4DwiXWIHxflOrJjw4HogUJdAAwoilc29fLNWyMqnunsJfFUYd/WAjt1
 R6yRQu+ORjFazReIRHfVRA2LBtmIBCrDUw3r2bviEF5CyIR3pZy8+f2RciW/5KRoE9T8Nx22TM7
 LL0OYxchD5aFbanYNxfA9mJ5lfq107+2GKHqyFzUGSdCTNf+ZuECYSypVCp/UkT7NSwhK4PhY6Z
 e+RdMJcYQiURLhrOeth7wh+PLgN1tAyY3FoUv3ZpPY74IXR57yJexz4Jepllhe/W75jzdKFamvH
 ztsavEycVHDyJpMrZUw==
X-Proofpoint-ORIG-GUID: mvos_mgf528VD6b--5h_3BMUrm8vc7qS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110081
X-Rspamd-Queue-Id: 5DB3E26141B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33111-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Action: no action

Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
so add a driver for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm       |    8 +
 drivers/pinctrl/qcom/Makefile          |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c | 1156 ++++++++++++++++++++++++++++++++
 3 files changed, 1165 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 6df6159fa5f89f9f0470e700b4698dc8849ed515..17416dce8e70cce022c6ffdc2d3ac8adf7aae1ff 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -58,6 +58,14 @@ config PINCTRL_IPQ8064
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
 
+config PINCTRL_IPQ5210
+	tristate "Qualcomm Technologies Inc IPQ5210 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	  Technologies Inc IPQ5210 platform.
+
 config PINCTRL_IPQ5332
 	tristate "Qualcomm Technologies Inc IPQ5332 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index a8fd12f90d6e6f8e139097cc0a81d6f178f09000..84ff95ff246a4073508d60e92a09f82f989bb50f 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_GLYMUR)	+= pinctrl-glymur.o
 obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ5018)	+= pinctrl-ipq5018.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
+obj-$(CONFIG_PINCTRL_IPQ5210)	+= pinctrl-ipq5210.o
 obj-$(CONFIG_PINCTRL_IPQ5332)	+= pinctrl-ipq5332.o
 obj-$(CONFIG_PINCTRL_IPQ5424)	+= pinctrl-ipq5424.o
 obj-$(CONFIG_PINCTRL_IPQ8074)	+= pinctrl-ipq8074.o
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5210.c b/drivers/pinctrl/qcom/pinctrl-ipq5210.c
new file mode 100644
index 0000000000000000000000000000000000000000..182bfeae6b30f79ed289cbe3c2d6ba8bb28705f8
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5210.c
@@ -0,0 +1,1156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	      \
+	{                                                             \
+		.grp = PINCTRL_PINGROUP("gpio" #id,                   \
+					gpio##id##_pins,              \
+					ARRAY_SIZE(gpio##id##_pins)), \
+		.ctl_reg = REG_SIZE * id,                             \
+		.io_reg = 0x4 + REG_SIZE * id,                        \
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
+		.intr_status_reg = 0xc + REG_SIZE * id,               \
+		.intr_target_reg = 0x8 + REG_SIZE * id,               \
+		.mux_bit = 2,                                         \
+		.pull_bit = 0,                                        \
+		.drv_bit = 6,                                         \
+		.oe_bit = 9,                                          \
+		.in_bit = 0,                                          \
+		.out_bit = 1,                                         \
+		.intr_enable_bit = 0,                                 \
+		.intr_status_bit = 0,                                 \
+		.intr_target_bit = 5,                                 \
+		.intr_target_kpss_val = 3,                            \
+		.intr_raw_status_bit = 4,                             \
+		.intr_polarity_bit = 1,                               \
+		.intr_detection_bit = 2,                              \
+		.intr_detection_width = 2,                            \
+		.funcs = (int[]){                                     \
+			msm_mux_gpio, /* gpio mode */                 \
+			msm_mux_##f1,                                 \
+			msm_mux_##f2,                                 \
+			msm_mux_##f3,                                 \
+			msm_mux_##f4,                                 \
+			msm_mux_##f5,                                 \
+			msm_mux_##f6,                                 \
+			msm_mux_##f7,                                 \
+			msm_mux_##f8,                                 \
+			msm_mux_##f9,                                 \
+		},                                                    \
+		.nfuncs = 10,                                         \
+	}
+
+static const struct pinctrl_pin_desc ipq5210_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+
+enum ipq5210_functions {
+	msm_mux_atest_char_start,
+	msm_mux_atest_char_status0,
+	msm_mux_atest_char_status1,
+	msm_mux_atest_char_status2,
+	msm_mux_atest_char_status3,
+	msm_mux_atest_tic_en,
+	msm_mux_audio_pri0,
+	msm_mux_audio_pri1,
+	msm_mux_audio_pri2,
+	msm_mux_audio_pri3,
+	msm_mux_audio_pri_d0,
+	msm_mux_audio_pri_d1,
+	msm_mux_audio_pri_fsync,
+	msm_mux_audio_pri_pclk,
+	msm_mux_audio_sec0,
+	msm_mux_audio_sec1,
+	msm_mux_audio_sec2,
+	msm_mux_audio_sec3,
+	msm_mux_audio_sec_d0,
+	msm_mux_audio_sec_d1,
+	msm_mux_audio_sec_fsync,
+	msm_mux_audio_sec_pclk,
+	msm_mux_core_voltage_0,
+	msm_mux_cri_trng0,
+	msm_mux_cri_trng1,
+	msm_mux_cri_trng2,
+	msm_mux_cri_trng3,
+	msm_mux_dbg_out_clk,
+	msm_mux_dg_out,
+	msm_mux_gcc_plltest_bypassnl,
+	msm_mux_gcc_plltest_resetn,
+	msm_mux_gcc_tlmm,
+	msm_mux_gpio,
+	msm_mux_Led00,
+	msm_mux_led01,
+	msm_mux_led02,
+	msm_mux_led10,
+	msm_mux_led11,
+	msm_mux_led12,
+	msm_mux_led20,
+	msm_mux_led21,
+	msm_mux_led22,
+	msm_mux_mdc_mst,
+	msm_mux_mdc_slv0,
+	msm_mux_mdc_slv1,
+	msm_mux_mdc_slv2,
+	msm_mux_mdio_mst,
+	msm_mux_mdio_slv0,
+	msm_mux_mdio_slv1,
+	msm_mux_mdio_slv2,
+	msm_mux_mux_tod_out,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_pcie0_wake,
+	msm_mux_pcie1_clk_req_n,
+	msm_mux_pcie1_wake,
+	msm_mux_pll_test,
+	msm_mux_pon_active_led,
+	msm_mux_pon_mux_sel,
+	msm_mux_pon_rx,
+	msm_mux_pon_rx_los,
+	msm_mux_pon_tx,
+	msm_mux_pon_tx_burst,
+	msm_mux_pon_tx_dis,
+	msm_mux_pon_tx_fault,
+	msm_mux_pon_tx_sd,
+	msm_mux_gpn_rx_los,
+	msm_mux_gpn_tx_burst,
+	msm_mux_gpn_tx_dis,
+	msm_mux_gpn_tx_fault,
+	msm_mux_gpn_tx_sd,
+	msm_mux_pps,
+	msm_mux_pwm_out00,
+	msm_mux_pwm_out01,
+	msm_mux_pwm_out02,
+	msm_mux_pwm_out03,
+	msm_mux_pwm_out10,
+	msm_mux_pwm_out11,
+	msm_mux_pwm_out12,
+	msm_mux_pwm_out20,
+	msm_mux_pwm_out21,
+	msm_mux_pwm_out22,
+	msm_mux_pwm_out30,
+	msm_mux_pwm_out31,
+	msm_mux_pwm_out32,
+	msm_mux_qdss_cti_trig_in_a0,
+	msm_mux_qdss_cti_trig_in_a1,
+	msm_mux_qdss_cti_trig_in_b0,
+	msm_mux_qdss_cti_trig_in_b1,
+	msm_mux_qdss_cti_trig_out_a0,
+	msm_mux_qdss_cti_trig_out_a1,
+	msm_mux_qdss_cti_trig_out_b0,
+	msm_mux_qdss_cti_trig_out_b1,
+	msm_mux_qdss_traceclk_a,
+	msm_mux_qdss_tracectl_a,
+	msm_mux_qdss_tracedata_a,
+	msm_mux_qrng_rosc0,
+	msm_mux_qrng_rosc1,
+	msm_mux_qrng_rosc2,
+	msm_mux_qspi_data,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs_n,
+	msm_mux_qup_se0_l0,
+	msm_mux_qup_se0_l1,
+	msm_mux_qup_se0_l2,
+	msm_mux_qup_se0_l3,
+	msm_mux_qup_se0_l4,
+	msm_mux_qup_se0_l5,
+	msm_mux_qup_se1_l0,
+	msm_mux_qup_se1_l1,
+	msm_mux_qup_se1_l2,
+	msm_mux_qup_se1_l3,
+	msm_mux_qup_se2_l00,
+	msm_mux_qup_se2_l01,
+	msm_mux_qup_se2_l10,
+	msm_mux_qup_se2_l11,
+	msm_mux_qup_se2_l2,
+	msm_mux_qup_se2_l3,
+	msm_mux_qup_se3_l0,
+	msm_mux_qup_se3_l1,
+	msm_mux_qup_se3_l2,
+	msm_mux_qup_se3_l3,
+	msm_mux_qup_se4_l0,
+	msm_mux_qup_se4_l1,
+	msm_mux_qup_se4_l2,
+	msm_mux_qup_se4_l3,
+	msm_mux_qup_se4_l4,
+	msm_mux_qup_se4_l5,
+	msm_mux_qup_se5_l00,
+	msm_mux_qup_se5_l01,
+	msm_mux_qup_se5_l10,
+	msm_mux_qup_se5_l11,
+	msm_mux_qup_se5_l2,
+	msm_mux_qup_se5_l3,
+	msm_mux_qup_se5_l4,
+	msm_mux_qup_se5_l5,
+	msm_mux_resout,
+	msm_mux_rx_los00,
+	msm_mux_rx_los01,
+	msm_mux_rx_los10,
+	msm_mux_rx_los11,
+	msm_mux_rx_los20,
+	msm_mux_rx_los21,
+	msm_mux_sdc_clk,
+	msm_mux_sdc_cmd,
+	msm_mux_sdc_data,
+	msm_mux_tsens_max,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",	"gpio4",  "gpio5",  "gpio6",
+	"gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11", "gpio12", "gpio13",
+	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20",
+	"gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27",
+	"gpio28", "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34",
+	"gpio35", "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41",
+	"gpio42", "gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
+	"gpio49", "gpio50", "gpio51", "gpio52", "gpio53",
+};
+
+static const char *const atest_char_start_groups[] = {
+	"gpio46",
+};
+
+static const char *const atest_char_status0_groups[] = {
+	"gpio34",
+};
+
+static const char *const atest_char_status1_groups[] = {
+	"gpio35",
+};
+
+static const char *const atest_char_status2_groups[] = {
+	"gpio36",
+};
+
+static const char *const atest_char_status3_groups[] = {
+	"gpio37",
+};
+
+static const char *const atest_tic_en_groups[] = {
+	"gpio42",
+};
+
+static const char *const audio_pri0_groups[] = {
+	"gpio12",
+};
+
+static const char *const audio_pri1_groups[] = {
+	"gpio19",
+};
+
+static const char *const audio_pri2_groups[] = {
+	"gpio8",
+};
+
+static const char *const audio_pri3_groups[] = {
+	"gpio13",
+};
+
+static const char *const audio_pri_d0_groups[] = {
+	"gpio34",
+};
+
+static const char *const audio_pri_d1_groups[] = {
+	"gpio35",
+};
+
+static const char *const audio_pri_fsync_groups[] = {
+	"gpio36",
+};
+
+static const char *const audio_pri_pclk_groups[] = {
+	"gpio37",
+};
+
+static const char *const audio_sec0_groups[] = {
+	"gpio17",
+};
+
+static const char *const audio_sec1_groups[] = {
+	"gpio16",
+};
+
+static const char *const audio_sec2_groups[] = {
+	"gpio49",
+};
+
+static const char *const audio_sec3_groups[] = {
+	"gpio50",
+};
+
+static const char *const audio_sec_d0_groups[] = {
+	"gpio43",
+};
+
+static const char *const audio_sec_d1_groups[] = {
+	"gpio42",
+};
+
+static const char *const audio_sec_fsync_groups[] = {
+	"gpio40",
+};
+
+static const char *const audio_sec_pclk_groups[] = {
+	"gpio41",
+};
+
+static const char *const core_voltage_0_groups[] = {
+	"gpio22",
+};
+
+static const char *const cri_trng0_groups[] = {
+	"gpio6",
+};
+
+static const char *const cri_trng1_groups[] = {
+	"gpio7",
+};
+
+static const char *const cri_trng2_groups[] = {
+	"gpio8",
+};
+
+static const char *const cri_trng3_groups[] = {
+	"gpio9",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio23",
+};
+
+static const char *const dg_out_groups[] = {
+	"gpio46",
+};
+
+static const char *const gcc_plltest_bypassnl_groups[] = {
+	"gpio38",
+};
+
+static const char *const gcc_plltest_resetn_groups[] = {
+	"gpio40",
+};
+
+static const char *const gcc_tlmm_groups[] = {
+	"gpio39",
+};
+
+static const char *const Led00_groups[] = {
+	"gpio23",
+};
+
+static const char *const led01_groups[] = {
+	"gpio39",
+};
+
+static const char *const led02_groups[] = {
+	"gpio6",
+};
+
+static const char *const led10_groups[] = {
+	"gpio39",
+};
+
+static const char *const led11_groups[] = {
+	"gpio27",
+};
+
+static const char *const led12_groups[] = {
+	"gpio7",
+};
+
+static const char *const led20_groups[] = {
+	"gpio38",
+};
+
+static const char *const led21_groups[] = {
+	"gpio26",
+};
+
+static const char *const led22_groups[] = {
+	"gpio9",
+};
+
+static const char *const mdc_mst_groups[] = {
+	"gpio26",
+};
+
+static const char *const mdc_slv0_groups[] = {
+	"gpio31",
+};
+
+static const char *const mdc_slv1_groups[] = {
+	"gpio20",
+};
+
+static const char *const mdc_slv2_groups[] = {
+	"gpio47",
+};
+
+static const char *const mdio_mst_groups[] = {
+	"gpio27",
+};
+
+static const char *const mdio_slv0_groups[] = {
+	"gpio33",
+};
+
+static const char *const mdio_slv1_groups[] = {
+	"gpio21",
+};
+
+static const char *const mdio_slv2_groups[] = {
+	"gpio49",
+};
+
+static const char *const mux_tod_out_groups[] = {
+	"gpio19",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio31",
+};
+
+static const char *const pcie0_wake_groups[] = {
+	"gpio33",
+};
+
+static const char *const pcie1_clk_req_n_groups[] = {
+	"gpio28",
+};
+
+static const char *const pcie1_wake_groups[] = {
+	"gpio30",
+};
+
+static const char *const pll_test_groups[] = {
+	"gpio18",
+};
+
+static const char *const pon_active_led_groups[] = {
+	"gpio11",
+};
+
+static const char *const pon_mux_sel_groups[] = {
+	"gpio45",
+};
+
+static const char *const pon_rx_groups[] = {
+	"gpio48",
+};
+
+static const char *const pon_rx_los_groups[] = {
+	"gpio10",
+};
+
+static const char *const pon_tx_groups[] = {
+	"gpio15",
+};
+
+static const char *const pon_tx_burst_groups[] = {
+	"gpio14",
+};
+
+static const char *const pon_tx_dis_groups[] = {
+	"gpio12",
+};
+
+static const char *const pon_tx_fault_groups[] = {
+	"gpio17",
+};
+
+static const char *const pon_tx_sd_groups[] = {
+	"gpio16",
+};
+
+static const char *const gpn_rx_los_groups[] = {
+	"gpio47",
+};
+
+static const char *const gpn_tx_burst_groups[] = {
+	"gpio51",
+};
+
+static const char *const gpn_tx_dis_groups[] = {
+	"gpio13",
+};
+
+static const char *const gpn_tx_fault_groups[] = {
+	"gpio49",
+};
+
+static const char *const gpn_tx_sd_groups[] = {
+	"gpio50",
+};
+
+static const char *const pps_groups[] = {
+	"gpio18",
+};
+
+static const char *const pwm_out00_groups[] = {
+	"gpio13",
+};
+
+static const char *const pwm_out01_groups[] = {
+	"gpio9",
+};
+
+static const char *const pwm_out02_groups[] = {
+	"gpio3",
+};
+
+static const char *const pwm_out03_groups[] = {
+	"gpio22",
+};
+
+static const char *const pwm_out10_groups[] = {
+	"gpio12",
+};
+
+static const char *const pwm_out11_groups[] = {
+	"gpio8",
+};
+
+static const char *const pwm_out12_groups[] = {
+	"gpio2",
+};
+
+static const char *const pwm_out20_groups[] = {
+	"gpio11",
+};
+
+static const char *const pwm_out21_groups[] = {
+	"gpio7",
+};
+
+static const char *const pwm_out22_groups[] = {
+	"gpio1",
+};
+
+static const char *const pwm_out30_groups[] = {
+	"gpio10",
+};
+
+static const char *const pwm_out31_groups[] = {
+	"gpio6",
+};
+
+static const char *const pwm_out32_groups[] = {
+	"gpio0",
+};
+
+static const char *const qdss_cti_trig_in_a0_groups[] = {
+	"gpio30",
+};
+
+static const char *const qdss_cti_trig_in_a1_groups[] = {
+	"gpio33",
+};
+
+static const char *const qdss_cti_trig_in_b0_groups[] = {
+	"gpio34",
+};
+
+static const char *const qdss_cti_trig_in_b1_groups[] = {
+	"gpio37",
+};
+
+static const char *const qdss_cti_trig_out_a0_groups[] = {
+	"gpio28",
+};
+
+static const char *const qdss_cti_trig_out_a1_groups[] = {
+	"gpio31",
+};
+
+static const char *const qdss_cti_trig_out_b0_groups[] = {
+	"gpio16",
+};
+
+static const char *const qdss_cti_trig_out_b1_groups[] = {
+	"gpio35",
+};
+
+static const char *const qdss_traceclk_a_groups[] = {
+	"gpio23",
+};
+
+static const char *const qdss_tracectl_a_groups[] = {
+	"gpio26",
+};
+
+static const char *const qdss_tracedata_a_groups[] = {
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",	"gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio20", "gpio21",
+	"gpio38", "gpio39", "gpio40", "gpio41",
+};
+
+static const char *const qrng_rosc0_groups[] = {
+	"gpio12",
+};
+
+static const char *const qrng_rosc1_groups[] = {
+	"gpio13",
+};
+
+static const char *const qrng_rosc2_groups[] = {
+	"gpio14",
+};
+
+static const char *const qspi_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qspi_clk_groups[] = {
+	"gpio5",
+};
+
+static const char *const qspi_cs_n_groups[] = {
+	"gpio4",
+};
+
+static const char *const qup_se0_l0_groups[] = {
+	"gpio8",
+};
+
+static const char *const qup_se0_l1_groups[] = {
+	"gpio9",
+};
+
+static const char *const qup_se0_l2_groups[] = {
+	"gpio6",
+};
+
+static const char *const qup_se0_l3_groups[] = {
+	"gpio7",
+};
+
+static const char *const qup_se0_l4_groups[] = {
+	"gpio14",
+};
+
+static const char *const qup_se0_l5_groups[] = {
+	"gpio15",
+};
+
+static const char *const qup_se1_l0_groups[] = {
+	"gpio30",
+};
+
+static const char *const qup_se1_l1_groups[] = {
+	"gpio28",
+};
+
+static const char *const qup_se1_l2_groups[] = {
+	"gpio39",
+};
+
+static const char *const qup_se1_l3_groups[] = {
+	"gpio38",
+};
+
+static const char *const qup_se2_l00_groups[] = {
+	"gpio21",
+};
+
+static const char *const qup_se2_l01_groups[] = {
+	"gpio53",
+};
+
+static const char *const qup_se2_l10_groups[] = {
+	"gpio20",
+};
+
+static const char *const qup_se2_l11_groups[] = {
+	"gpio52",
+};
+
+static const char *const qup_se2_l2_groups[] = {
+	"gpio13",
+};
+
+static const char *const qup_se2_l3_groups[] = {
+	"gpio12",
+};
+
+static const char *const qup_se3_l0_groups[] = {
+	"gpio23",
+};
+
+static const char *const qup_se3_l1_groups[] = {
+	"gpio22",
+};
+
+static const char *const qup_se3_l2_groups[] = {
+	"gpio11",
+};
+
+static const char *const qup_se3_l3_groups[] = {
+	"gpio10",
+};
+
+static const char *const qup_se4_l0_groups[] = {
+	"gpio42",
+};
+
+static const char *const qup_se4_l1_groups[] = {
+	"gpio43",
+};
+
+static const char *const qup_se4_l2_groups[] = {
+	"gpio40",
+};
+
+static const char *const qup_se4_l3_groups[] = {
+	"gpio41",
+};
+
+static const char *const qup_se4_l4_groups[] = {
+	"gpio52",
+};
+
+static const char *const qup_se4_l5_groups[] = {
+	"gpio53",
+};
+
+static const char *const qup_se5_l00_groups[] = {
+	"gpio49",
+};
+
+static const char *const qup_se5_l01_groups[] = {
+	"gpio52",
+};
+
+static const char *const qup_se5_l10_groups[] = {
+	"gpio50",
+};
+
+static const char *const qup_se5_l11_groups[] = {
+	"gpio53",
+};
+
+static const char *const qup_se5_l2_groups[] = {
+	"gpio47",
+};
+
+static const char *const qup_se5_l3_groups[] = {
+	"gpio48",
+};
+
+static const char *const qup_se5_l4_groups[] = {
+	"gpio51",
+};
+
+static const char *const qup_se5_l5_groups[] = {
+	"gpio52",
+};
+
+static const char *const resout_groups[] = {
+	"gpio44",
+};
+
+static const char *const rx_los00_groups[] = {
+	"gpio42",
+};
+
+static const char *const rx_los01_groups[] = {
+	"gpio37",
+};
+
+static const char *const rx_los10_groups[] = {
+	"gpio41",
+};
+
+static const char *const rx_los11_groups[] = {
+	"gpio36",
+};
+
+static const char *const rx_los20_groups[] = {
+	"gpio40",
+};
+
+static const char *const rx_los21_groups[] = {
+	"gpio35",
+};
+
+static const char *const sdc_clk_groups[] = {
+	"gpio5",
+};
+
+static const char *const sdc_cmd_groups[] = {
+	"gpio4",
+};
+
+static const char *const sdc_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const tsens_max_groups[] = {
+	"gpio20",
+};
+
+static const struct pinfunction ipq5210_functions[] = {
+	MSM_PIN_FUNCTION(atest_char_start),
+	MSM_PIN_FUNCTION(atest_char_status0),
+	MSM_PIN_FUNCTION(atest_char_status1),
+	MSM_PIN_FUNCTION(atest_char_status2),
+	MSM_PIN_FUNCTION(atest_char_status3),
+	MSM_PIN_FUNCTION(atest_tic_en),
+	MSM_PIN_FUNCTION(audio_pri0),
+	MSM_PIN_FUNCTION(audio_pri1),
+	MSM_PIN_FUNCTION(audio_pri2),
+	MSM_PIN_FUNCTION(audio_pri3),
+	MSM_PIN_FUNCTION(audio_pri_d0),
+	MSM_PIN_FUNCTION(audio_pri_d1),
+	MSM_PIN_FUNCTION(audio_pri_fsync),
+	MSM_PIN_FUNCTION(audio_pri_pclk),
+	MSM_PIN_FUNCTION(audio_sec0),
+	MSM_PIN_FUNCTION(audio_sec1),
+	MSM_PIN_FUNCTION(audio_sec2),
+	MSM_PIN_FUNCTION(audio_sec3),
+	MSM_PIN_FUNCTION(audio_sec_d0),
+	MSM_PIN_FUNCTION(audio_sec_d1),
+	MSM_PIN_FUNCTION(audio_sec_fsync),
+	MSM_PIN_FUNCTION(audio_sec_pclk),
+	MSM_PIN_FUNCTION(core_voltage_0),
+	MSM_PIN_FUNCTION(cri_trng0),
+	MSM_PIN_FUNCTION(cri_trng1),
+	MSM_PIN_FUNCTION(cri_trng2),
+	MSM_PIN_FUNCTION(cri_trng3),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(dg_out),
+	MSM_PIN_FUNCTION(gcc_plltest_bypassnl),
+	MSM_PIN_FUNCTION(gcc_plltest_resetn),
+	MSM_PIN_FUNCTION(gcc_tlmm),
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(Led00),
+	MSM_PIN_FUNCTION(led01),
+	MSM_PIN_FUNCTION(led02),
+	MSM_PIN_FUNCTION(led10),
+	MSM_PIN_FUNCTION(led11),
+	MSM_PIN_FUNCTION(led12),
+	MSM_PIN_FUNCTION(led20),
+	MSM_PIN_FUNCTION(led21),
+	MSM_PIN_FUNCTION(led22),
+	MSM_PIN_FUNCTION(mdc_mst),
+	MSM_PIN_FUNCTION(mdc_slv0),
+	MSM_PIN_FUNCTION(mdc_slv1),
+	MSM_PIN_FUNCTION(mdc_slv2),
+	MSM_PIN_FUNCTION(mdio_mst),
+	MSM_PIN_FUNCTION(mdio_slv0),
+	MSM_PIN_FUNCTION(mdio_slv1),
+	MSM_PIN_FUNCTION(mdio_slv2),
+	MSM_PIN_FUNCTION(mux_tod_out),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(pcie0_wake),
+	MSM_PIN_FUNCTION(pcie1_clk_req_n),
+	MSM_PIN_FUNCTION(pcie1_wake),
+	MSM_PIN_FUNCTION(pll_test),
+	MSM_PIN_FUNCTION(pon_active_led),
+	MSM_PIN_FUNCTION(pon_mux_sel),
+	MSM_PIN_FUNCTION(pon_rx),
+	MSM_PIN_FUNCTION(pon_rx_los),
+	MSM_PIN_FUNCTION(pon_tx),
+	MSM_PIN_FUNCTION(pon_tx_burst),
+	MSM_PIN_FUNCTION(pon_tx_dis),
+	MSM_PIN_FUNCTION(pon_tx_fault),
+	MSM_PIN_FUNCTION(pon_tx_sd),
+	MSM_PIN_FUNCTION(gpn_rx_los),
+	MSM_PIN_FUNCTION(gpn_tx_burst),
+	MSM_PIN_FUNCTION(gpn_tx_dis),
+	MSM_PIN_FUNCTION(gpn_tx_fault),
+	MSM_PIN_FUNCTION(gpn_tx_sd),
+	MSM_PIN_FUNCTION(pps),
+	MSM_PIN_FUNCTION(pwm_out00),
+	MSM_PIN_FUNCTION(pwm_out01),
+	MSM_PIN_FUNCTION(pwm_out02),
+	MSM_PIN_FUNCTION(pwm_out03),
+	MSM_PIN_FUNCTION(pwm_out10),
+	MSM_PIN_FUNCTION(pwm_out11),
+	MSM_PIN_FUNCTION(pwm_out12),
+	MSM_PIN_FUNCTION(pwm_out20),
+	MSM_PIN_FUNCTION(pwm_out21),
+	MSM_PIN_FUNCTION(pwm_out22),
+	MSM_PIN_FUNCTION(pwm_out30),
+	MSM_PIN_FUNCTION(pwm_out31),
+	MSM_PIN_FUNCTION(pwm_out32),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b1),
+	MSM_PIN_FUNCTION(qdss_traceclk_a),
+	MSM_PIN_FUNCTION(qdss_tracectl_a),
+	MSM_PIN_FUNCTION(qdss_tracedata_a),
+	MSM_PIN_FUNCTION(qrng_rosc0),
+	MSM_PIN_FUNCTION(qrng_rosc1),
+	MSM_PIN_FUNCTION(qrng_rosc2),
+	MSM_PIN_FUNCTION(qspi_data),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs_n),
+	MSM_PIN_FUNCTION(qup_se0_l0),
+	MSM_PIN_FUNCTION(qup_se0_l1),
+	MSM_PIN_FUNCTION(qup_se0_l2),
+	MSM_PIN_FUNCTION(qup_se0_l3),
+	MSM_PIN_FUNCTION(qup_se0_l4),
+	MSM_PIN_FUNCTION(qup_se0_l5),
+	MSM_PIN_FUNCTION(qup_se1_l0),
+	MSM_PIN_FUNCTION(qup_se1_l1),
+	MSM_PIN_FUNCTION(qup_se1_l2),
+	MSM_PIN_FUNCTION(qup_se1_l3),
+	MSM_PIN_FUNCTION(qup_se2_l00),
+	MSM_PIN_FUNCTION(qup_se2_l01),
+	MSM_PIN_FUNCTION(qup_se2_l10),
+	MSM_PIN_FUNCTION(qup_se2_l11),
+	MSM_PIN_FUNCTION(qup_se2_l2),
+	MSM_PIN_FUNCTION(qup_se2_l3),
+	MSM_PIN_FUNCTION(qup_se3_l0),
+	MSM_PIN_FUNCTION(qup_se3_l1),
+	MSM_PIN_FUNCTION(qup_se3_l2),
+	MSM_PIN_FUNCTION(qup_se3_l3),
+	MSM_PIN_FUNCTION(qup_se4_l0),
+	MSM_PIN_FUNCTION(qup_se4_l1),
+	MSM_PIN_FUNCTION(qup_se4_l2),
+	MSM_PIN_FUNCTION(qup_se4_l3),
+	MSM_PIN_FUNCTION(qup_se4_l4),
+	MSM_PIN_FUNCTION(qup_se4_l5),
+	MSM_PIN_FUNCTION(qup_se5_l00),
+	MSM_PIN_FUNCTION(qup_se5_l01),
+	MSM_PIN_FUNCTION(qup_se5_l10),
+	MSM_PIN_FUNCTION(qup_se5_l11),
+	MSM_PIN_FUNCTION(qup_se5_l2),
+	MSM_PIN_FUNCTION(qup_se5_l3),
+	MSM_PIN_FUNCTION(qup_se5_l4),
+	MSM_PIN_FUNCTION(qup_se5_l5),
+	MSM_PIN_FUNCTION(resout),
+	MSM_PIN_FUNCTION(rx_los00),
+	MSM_PIN_FUNCTION(rx_los01),
+	MSM_PIN_FUNCTION(rx_los10),
+	MSM_PIN_FUNCTION(rx_los11),
+	MSM_PIN_FUNCTION(rx_los20),
+	MSM_PIN_FUNCTION(rx_los21),
+	MSM_PIN_FUNCTION(sdc_clk),
+	MSM_PIN_FUNCTION(sdc_cmd),
+	MSM_PIN_FUNCTION(sdc_data),
+	MSM_PIN_FUNCTION(tsens_max),
+};
+
+static const struct msm_pingroup ipq5210_groups[] = {
+	[0] = PINGROUP(0, sdc_data, qspi_data, pwm_out32, _, _, _, _, _, _),
+	[1] = PINGROUP(1, sdc_data, qspi_data, pwm_out22, _, _, _, _, _, _),
+	[2] = PINGROUP(2, sdc_data, qspi_data, pwm_out12, _, _, _, _, _, _),
+	[3] = PINGROUP(3, sdc_data, qspi_data, pwm_out02, _, _, _, _, _, _),
+	[4] = PINGROUP(4, sdc_cmd, qspi_cs_n, _, _, _, _, _, _, _),
+	[5] = PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
+	[6] = PINGROUP(6, qup_se0_l2, led02, pwm_out31, _, cri_trng0, qdss_tracedata_a, _, _, _),
+	[7] = PINGROUP(7, qup_se0_l3, led12, pwm_out21, _, cri_trng1, qdss_tracedata_a, _, _, _),
+	[8] = PINGROUP(8, qup_se0_l0, pwm_out11, audio_pri2, audio_pri2, _, cri_trng2, qdss_tracedata_a, _, _),
+	[9] = PINGROUP(9, qup_se0_l1, led22, pwm_out01, _, cri_trng3, qdss_tracedata_a, _, _, _),
+	[10] = PINGROUP(10, pon_rx_los, qup_se3_l3, pwm_out30, _, _, qdss_tracedata_a, _, _, _),
+	[11] = PINGROUP(11, pon_active_led, qup_se3_l2, pwm_out20, _, _, qdss_tracedata_a, _, _, _),
+	[12] = PINGROUP(12, pon_tx_dis, qup_se2_l3, pwm_out10, audio_pri0, audio_pri0, _, qrng_rosc0, qdss_tracedata_a, _),
+	[13] = PINGROUP(13, gpn_tx_dis, qup_se2_l2, pwm_out00, audio_pri3, audio_pri3, _, qrng_rosc1, qdss_tracedata_a, _),
+	[14] = PINGROUP(14, pon_tx_burst, qup_se0_l4, _, qrng_rosc2, qdss_tracedata_a, _, _, _, _),
+	[15] = PINGROUP(15, pon_tx, qup_se0_l5, _, qdss_tracedata_a, _, _, _, _, _),
+	[16] = PINGROUP(16, pon_tx_sd, audio_sec1, audio_sec1, qdss_cti_trig_out_b0, _, _, _, _, _),
+	[17] = PINGROUP(17, pon_tx_fault, audio_sec0, audio_sec0, _, _, _, _, _, _),
+	[18] = PINGROUP(18, pps, pll_test, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, mux_tod_out, audio_pri1, audio_pri1, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup_se2_l10, mdc_slv1, tsens_max, qdss_tracedata_a, _, _, _, _, _),
+	[21] = PINGROUP(21, qup_se2_l00, mdio_slv1, qdss_tracedata_a, _, _, _, _, _, _),
+	[22] = PINGROUP(22, core_voltage_0, qup_se3_l1, pwm_out03, _, _, _, _, _, _),
+	[23] = PINGROUP(23, Led00, qup_se3_l0, dbg_out_clk, qdss_traceclk_a, _, _, _, _, _),
+	[24] = PINGROUP(24, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, mdc_mst, led21, _, qdss_tracectl_a, _, _, _, _, _),
+	[27] = PINGROUP(27, mdio_mst, led11, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, pcie1_clk_req_n, qup_se1_l1, _, _, qdss_cti_trig_out_a0, _, _, _, _),
+	[29] = PINGROUP(29, _, _, _, _, _, _, _, _, _),
+	[30] = PINGROUP(30, pcie1_wake, qup_se1_l0, _, _, qdss_cti_trig_in_a0, _, _, _, _),
+	[31] = PINGROUP(31, pcie0_clk_req_n, mdc_slv0, _, qdss_cti_trig_out_a1, _, _, _, _, _),
+	[32] = PINGROUP(32, _, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, pcie0_wake, mdio_slv0, qdss_cti_trig_in_a1, _, _, _, _, _, _),
+	[34] = PINGROUP(34, audio_pri_d0, atest_char_status0, qdss_cti_trig_in_b0, _, _, _, _, _, _),
+	[35] = PINGROUP(35, audio_pri_d1, rx_los21, atest_char_status1, qdss_cti_trig_out_b1, _, _, _, _, _),
+	[36] = PINGROUP(36, audio_pri_fsync, _, rx_los11, atest_char_status2, _, _, _, _, _),
+	[37] = PINGROUP(37, audio_pri_pclk, rx_los01, atest_char_status3, _, qdss_cti_trig_in_b1, _, _, _, _),
+	[38] = PINGROUP(38, qup_se1_l3, led20, gcc_plltest_bypassnl, qdss_tracedata_a, _, _, _, _, _),
+	[39] = PINGROUP(39, qup_se1_l2, led10, led01, gcc_tlmm, qdss_tracedata_a, _, _, _, _),
+	[40] = PINGROUP(40, qup_se4_l2, rx_los20, audio_sec_fsync, gcc_plltest_resetn, qdss_tracedata_a, _, _, _, _),
+	[41] = PINGROUP(41, qup_se4_l3, rx_los10, audio_sec_pclk, qdss_tracedata_a, _, _, _, _, _),
+	[42] = PINGROUP(42, qup_se4_l0, rx_los00, audio_sec_d1, atest_tic_en, _, _, _, _, _),
+	[43] = PINGROUP(43, qup_se4_l1, audio_sec_d0, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, resout, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, pon_mux_sel, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, dg_out, atest_char_start, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, gpn_rx_los, mdc_slv2, qup_se5_l2, _, _, _, _, _, _),
+	[48] = PINGROUP(48, pon_rx, qup_se5_l3, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, gpn_tx_fault, mdio_slv2, qup_se5_l00, audio_sec2, audio_sec2, _, _, _, _),
+	[50] = PINGROUP(50, gpn_tx_sd, qup_se5_l10, audio_sec3, audio_sec3, _, _, _, _, _),
+	[51] = PINGROUP(51, gpn_tx_burst, qup_se5_l4, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, qup_se2_l11, qup_se5_l5, qup_se4_l4, qup_se5_l01, _, _, _, _, _),
+	[53] = PINGROUP(53, qup_se2_l01, qup_se4_l5, qup_se5_l11, _, _, _, _, _, _),
+};
+
+static const struct msm_pinctrl_soc_data ipq5210_tlmm = {
+	.pins = ipq5210_pins,
+	.npins = ARRAY_SIZE(ipq5210_pins),
+	.functions = ipq5210_functions,
+	.nfunctions = ARRAY_SIZE(ipq5210_functions),
+	.groups = ipq5210_groups,
+	.ngroups = ARRAY_SIZE(ipq5210_groups),
+	.ngpios = 54,
+};
+
+static const struct of_device_id ipq5210_tlmm_of_match[] = {
+	{ .compatible = "qcom,ipq5210-tlmm", },
+	{ },
+};
+
+static int ipq5210_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &ipq5210_tlmm);
+}
+
+static struct platform_driver ipq5210_tlmm_driver = {
+	.driver = {
+		.name = "ipq5210-tlmm",
+		.of_match_table = ipq5210_tlmm_of_match,
+	},
+	.probe = ipq5210_tlmm_probe,
+};
+
+static int __init ipq5210_tlmm_init(void)
+{
+	return platform_driver_register(&ipq5210_tlmm_driver);
+}
+arch_initcall(ipq5210_tlmm_init);
+
+static void __exit ipq5210_tlmm_exit(void)
+{
+	platform_driver_unregister(&ipq5210_tlmm_driver);
+}
+module_exit(ipq5210_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI IPQ5210 TLMM driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


