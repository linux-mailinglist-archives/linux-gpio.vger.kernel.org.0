Return-Path: <linux-gpio+bounces-33110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDhRD3lAsWmtswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:14:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60F261E07
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85F0230A0E44
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED80A3BFE2E;
	Wed, 11 Mar 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6yqtfsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYw+nXbV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01853B6BE9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222380; cv=none; b=A7lrX99RnkhOvlWoPQ34dc0SDTtJ3OurmauijI9LEwzpCtQJokBOscXARDp1/mcnf/jeP5XMXhSS532v0wMiGQANZafp7TTjwOG7rcVO8unCOamwVveinT3XcDsOWCU8DWCNLLDCCLwYubCotQtDOSsiL1U3iGEAfdWpWF2ItnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222380; c=relaxed/simple;
	bh=k9gCqRY1TJN5tP1zpGefnmeIblIUWKs68PsIzcKsJW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRFzUP9EUeMhsXtXEupNXjxd5hZu3X8wxkrK3CZcZaCsHNWNrJjeNhzo+b6egUEW+BOhGvY3zS4BrsypuaVLy5EXF/JPIFOiKE4M7Xcf0ZWJ09MxnMNgi1rRcdcRqs7qcq5Q6ZQzb43ejCx+7YReibfy9/FH26WI0cUQMHLMae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6yqtfsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYw+nXbV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B883s0509379
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/WCRFSWeLZqpJ3qfqYKtV3dWOfNxGVPN0v+gtYs79Q=; b=H6yqtfsWztEIJ3Ip
	gx9BhbcQFT3Jpvl89F0dCFDEj5f5xYQJn1PDnsL2yCbMy6baqucK4NrHG5EtEhLc
	iOSr+l3sGidwUj0ZUSN5yS35DvvOApiUMSFtdPp66TSGExSzFjP2zP9GexarxqG0
	Zvca1qXi7gHbY8FnWyEi2RwlhMMF8YnlDNarBPue+d5B6+VSe5Bl1T842bxP8lSj
	8LiEtPRXJquwWNYuoPueg6WsGgijGk8FLc9pbUa3dBYkluhBgKoA68qf0cvIX79m
	Sh9/SON5LwgkROhW4FfYRBCvCFTLFISPwBIPmhguSeFMmzwIKQemDYgVk/f9gMpH
	BTM/vg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppak78n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b7ed8958so13019535b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222367; x=1773827167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/WCRFSWeLZqpJ3qfqYKtV3dWOfNxGVPN0v+gtYs79Q=;
        b=GYw+nXbVP+urwZLGF4GsuFLOJsctqgDwZMtT+9ZBlq+2Hh880YeVB5E3Dz7AjNnZgM
         ecnwSYDddx/NlRSQatmwl3hBXq2HVz/Ho8Z5JYq6mThxMmksifxUKLbvdzLuLkdwFn71
         wa84IZhPGmI0ETCFieDYXhMdgT7DnCfqVL6jriXRKFy6uusZBVeR7/xFnHWI6+MBMa8A
         TXVkUx6lLgDPprnq7kizpW4xZsB6B5YY8gUu0hkfUCK8XTb/PwSS+xj6B0SBuj6ANecp
         MQbpnNHm0Q+YYCTqdwZMo6Sjduj3WN/hNcp9x8zH507nnd1vX8h049lqybhaJFYaxK6k
         ExGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222367; x=1773827167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/WCRFSWeLZqpJ3qfqYKtV3dWOfNxGVPN0v+gtYs79Q=;
        b=RgOV8zap4dpgQNGm5DuEGlihousy/psaNC4TagwzBJtJ36XtxPJYI1FxKjg8jUFD62
         SKVmBTLmhc/MAQhD9UZ3gJ/s3qzPIKiezGf3w/sHqx7aPtxwm4aXXg3bowCdw56HmVBo
         OTRgEU+5XuHxkyZx5funEsGtfeZRKiwbSUq18PWuXWFGxckN2M2lTgHTl8JvsCyjQWXm
         oSwl68pjviq2k6xYq5fNiyyHExV3FUoWiElZzekYDE0V18XQnvBAUyCnLi5ZXCDjkJEO
         yx4Sy/dIpJXKu0Wl1sGGSQdsI37nr26pD3k62gleq71yR9vg7vtYzh4Svol4mQRooLLA
         fqpA==
X-Forwarded-Encrypted: i=1; AJvYcCVgp8uw9msfW4gTkFrdV08yqWrTISI9B7BfIJlA06BdKucEpsdzVVjrvWiISP5l3CP9dZ2wTAJprOBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXJGquyflsjCgat476u2uonhZG9+PC7f43v7zeL6riSxn4bUM
	43MxohEZWaR34bzBOEKKaZuQK+hP65EQFht360UGTZh531gG3RC1H4/OUuzFHRi9jgFir+jXG1O
	g3H8nAERRf0K5QlwruZAuwgaUviXHFsVX7MLwhh8Vec83EhMIKAqrA6uFI1Yc69R/ojkUNWMi
X-Gm-Gg: ATEYQzziNwJXZyHVF83SNdEIwhpX+PrUlBnJGOnf18zMCQao8+RFgF3Aiw25DScuUy3
	ud59lRtXBEgcHR6su/S1hp635v14uVpD044lpUHaahQlprCrBM6SeHfnlzd+AmKuzChZQaHrZvT
	Gz/Ie8gld0+joLnYyYk6BY9QCQhF5BwC89SkNJ11fsRCKZS6DUqpXESnh1QoOQO5st5HAnod8nJ
	EjEDcp4nIruTsG0+YN1ADs0Eo3xEUiPktrhoyUTmbmT5Eh/q4YlPAudQNvk5HsFF+TqWZhP8zsX
	GYjMLE4xxfqtjjZzRvvf38CH8NTt1OmtKjdPZfozdvSASTpS6VwAJJA4BKk/eMl/POtRZ2OvqCd
	GHZoq0q2HTRbmVT44bbSVkHf1cjo8KLkiOo/AjyE3u6PVvpKtMdmoSTBmNmbw1Y9gNG1KVSBfdB
	wSmT0nQbE/SgZuAKA+uxxaMR1JziVH7W9wekma3UAIGiSquqMBTYM+rNRx
X-Received: by 2002:a05:6a00:3d56:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-829f70e7f96mr1700373b3a.50.1773222365931;
        Wed, 11 Mar 2026 02:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d56:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-829f70e7f96mr1700340b3a.50.1773222364974;
        Wed, 11 Mar 2026 02:46:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:44 +0530
Subject: [PATCH 2/9] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5210 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=77141;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=k9gCqRY1TJN5tP1zpGefnmeIblIUWKs68PsIzcKsJW0=;
 b=sddttYw14ncHT3UlH6R+e3vyzoEJiqgwXz1KkkfUsdASJAvNUimjEYTlVPwpaXWWm8T02qP2D
 hgF2Kngb0WrBZOFg0Y327xvp31WJiRTvacIKKnWCcveO+QlGHKg6/KG
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: DLN1-MdMuqT82YGR8PiYY0DiS31531zJ
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b139e0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hselGU0lqRRdcXzI58cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX1EheMq4cLQVM
 AuZmhc0IFyj7gpHxO/SjnpW6gkkmUk3mWQyrbhc2KLpSmf9PsQP2s1YHhNU54mQBIo7ZB/qMEtQ
 QTfR+upjDwSinRazvsRMO+RIviX8Mb6ssg1VbKhESN6ANBEchPtTXu+P/UFsOsm6YvGYK1e4mE5
 0BQyQ6fG6mt49oQxoI/LBFgCazXssDiyejznENRjxa5E9Ubhu5bkZCMu/cld0SH/kh0ZOqX3N63
 DJ7e3XEV5pdkE42em1IBuN+kFCxLpVVAwUfm9ffRGFQpcLRYsq+xvrTMbj2rtU+dxzb1FUfzDYN
 LUZF7xPkC4xV2LnoalDgoPngzCOuFacXQyYEeMDfoOVvnEa5GLllZAddS66EAY6dqiwyGauLrYZ
 XymRafUZh+L8CWbJcDvYQFwQ6dx8ZWDyYKKYYzCSccQOxgENDAucGzBpjpI2d6NmtC2i5Brrl2Z
 AQ4tbY7cKylp/MnmAig==
X-Proofpoint-ORIG-GUID: DLN1-MdMuqT82YGR8PiYY0DiS31531zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110081
X-Rspamd-Queue-Id: 2F60F261E07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33110-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Action: no action

Add support for the global clock controller found on IPQ5210 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |    8 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/gcc-ipq5210.c | 2641 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2650 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f23280219d56436fd142a38ff22a219e431539a6..171cb4a6198b1a70a958bc0dfbdd7b65cdaa7bea 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -332,6 +332,14 @@ config IPQ_GCC_5018
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  i2c, USB, SD/eMMC, etc.
 
+config IPQ_GCC_5210
+	tristate "IPQ5210 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the global clock controller on ipq5210 devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  i2c, USB, SD/eMMC, etc.
+
 config IPQ_GCC_5332
 	tristate "IPQ5332 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 90ea21c3b7cf7956309648c4445ecf8fd61f23b0..c07214c0dd83f43e7847ae374957bf6536cc3451 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
 obj-$(CONFIG_IPQ_CMN_PLL) += ipq-cmn-pll.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
+obj-$(CONFIG_IPQ_GCC_5210) += gcc-ipq5210.o
 obj-$(CONFIG_IPQ_GCC_5332) += gcc-ipq5332.o
 obj-$(CONFIG_IPQ_GCC_5424) += gcc-ipq5424.o
 obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
new file mode 100644
index 0000000000000000000000000000000000000000..3294a6e116ea984e256e75e9d70b39a75d685d54
--- /dev/null
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -0,0 +1,2641 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/reset/qcom,ipq5210-gcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "reset.h"
+
+enum {
+	DT_XO,
+	DT_SLEEP_CLK,
+	DT_PCIE30_PHY0_PIPE_CLK,
+	DT_PCIE30_PHY1_PIPE_CLK,
+	DT_USB3_PHY0_CC_PIPE_CLK,
+	DT_NSS_CMN_CLK,
+};
+
+enum {
+	P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC,
+	P_GPLL0_OUT_AUX,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL2_OUT_AUX,
+	P_GPLL2_OUT_MAIN,
+	P_GPLL4_OUT_AUX,
+	P_GPLL4_OUT_MAIN,
+	P_NSS_CMN_CLK,
+	P_SLEEP_CLK,
+	P_USB3PHY_0_PIPE,
+	P_XO,
+};
+
+static const struct clk_parent_data gcc_parent_data_xo = { .index = DT_XO };
+
+static struct clk_alpha_pll gpll0_main = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll0_main",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor gpll0_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0_div2",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpll0_main.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll0 = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpll0_main.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll2_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll2_main",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll2[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll2 = {
+	.offset = 0x21000,
+	.post_div_table = post_div_table_gpll2,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll2),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll2",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2_main.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll4_main = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll4_main",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+			.flags = CLK_IS_CRITICAL,
+		},
+	},
+};
+static const struct parent_map gcc_parent_map_xo[] = {
+	{ P_XO, 0 },
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_XO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .index = DT_XO },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_XO, 0 },
+	{ P_NSS_CMN_CLK, 1 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_GPLL2_OUT_AUX, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .index = DT_XO },
+	{ .index = DT_NSS_CMN_CLK },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_7[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4_main.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_9[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4_OUT_AUX, 1 },
+	{ P_GPLL0_OUT_MAIN, 3 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_9[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll4_main.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_10[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_10[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll4_main.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_11[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_11[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll4_main.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_12[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_OUT_AUX, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_12[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2_main.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_13[] = {
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_13[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_gcc_adss_pwm_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_adss_pwm_clk_src = {
+	.cmd_rcgr = 0x1c004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_adss_pwm_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_nss_ts_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_nss_ts_clk_src = {
+	.cmd_rcgr = 0x17088,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nss_ts_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_system_noc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266666667, P_GPLL4_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x2e004,
+	.freq_tbl = ftbl_gcc_system_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_system_noc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src[] = {
+	F(429000000, P_NSS_CMN_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_nssnoc_memnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x17004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie0_axi_m_clk_src[] = {
+	F(200000000, P_GPLL4_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie0_axi_m_clk_src = {
+	.cmd_rcgr = 0x28018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_axi_m_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie0_axi_s_clk_src = {
+	.cmd_rcgr = 0x28020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_axi_s_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie0_rchng_clk_src = {
+	.cmd_rcgr = 0x28028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_rchng_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie1_axi_m_clk_src[] = {
+	F(266666667, P_GPLL4_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie1_axi_m_clk_src = {
+	.cmd_rcgr = 0x29018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_pcie1_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_axi_m_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie1_axi_s_clk_src = {
+	.cmd_rcgr = 0x29020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_axi_s_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie1_rchng_clk_src = {
+	.cmd_rcgr = 0x29028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_rchng_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_aux_clk_src[] = {
+	F(20000000, P_GPLL0_OUT_MAIN, 10, 1, 4),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_aux_clk_src = {
+	.cmd_rcgr = 0x28004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_pcie_aux_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_aux_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap_se0_clk_src[] = {
+	F(960000, P_XO, 10, 2, 5),
+	F(3686636, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 2, 217),
+	F(4800000, P_XO, 5, 0, 0),
+	F(7373272, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 4, 217),
+	F(9600000, P_XO, 2.5, 0, 0),
+	F(14746544, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 8, 217),
+	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
+	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
+	F(46400000, P_GPLL0_OUT_MAIN, 2, 29, 250),
+	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
+	F(58986175, P_GPLL0_OUT_MAIN, 1, 16, 217),
+	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
+	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se0_clk_src = {
+	.cmd_rcgr = 0x4004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se0_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se1_clk_src = {
+	.cmd_rcgr = 0x5004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se1_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se2_clk_src = {
+	.cmd_rcgr = 0x2018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se3_clk_src = {
+	.cmd_rcgr = 0x2034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se3_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se4_clk_src = {
+	.cmd_rcgr = 0x3018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se4_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se5_clk_src = {
+	.cmd_rcgr = 0x3034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se5_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(144000, P_XO, 16, 12, 125),
+	F(400000, P_XO, 12, 1, 5),
+	F(24000000, P_GPLL2_OUT_MAIN, 12, 1, 2),
+	F(48000000, P_GPLL2_OUT_MAIN, 12, 0, 0),
+	F(96000000, P_GPLL2_OUT_MAIN, 6, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(192000000, P_GPLL2_OUT_MAIN, 3, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x33004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
+	F(300000000, P_GPLL4_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x33018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_ice_core_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_uniphy_sys_clk_src = {
+	.cmd_rcgr = 0x17090,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_uniphy_sys_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb0_aux_clk_src = {
+	.cmd_rcgr = 0x2c018,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_aux_clk_src",
+		.parent_data = gcc_parent_data_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb0_master_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb0_master_clk_src = {
+	.cmd_rcgr = 0x2c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_usb0_master_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_master_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(60000000, P_GPLL4_OUT_AUX, 10, 1, 2),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb0_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2c02c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_9,
+	.freq_tbl = ftbl_gcc_usb0_mock_utmi_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_9,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qdss_at_clk_src[] = {
+	F(240000000, P_GPLL4_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qdss_at_clk_src = {
+	.cmd_rcgr = 0x2d004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gcc_qdss_at_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qdss_at_clk_src",
+		.parent_data = gcc_parent_data_10,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qdss_tsctr_clk_src[] = {
+	F(600000000, P_GPLL4_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qdss_tsctr_clk_src = {
+	.cmd_rcgr = 0x2d01c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gcc_qdss_tsctr_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qdss_tsctr_clk_src",
+		.parent_data = gcc_parent_data_10,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcnoc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x31004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcnoc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qpic_io_macro_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qpic_io_macro_clk_src = {
+	.cmd_rcgr = 0x32004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_12,
+	.freq_tbl = ftbl_gcc_qpic_io_macro_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qpic_io_macro_clk_src",
+		.parent_data = gcc_parent_data_12,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_12),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qpic_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qpic_clk_src = {
+	.cmd_rcgr = 0x32020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_12,
+	.freq_tbl = ftbl_gcc_qpic_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qpic_clk_src",
+		.parent_data = gcc_parent_data_12,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_12),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pon_tm2x_clk_src[] = {
+	F(342860000, P_GPLL4_OUT_MAIN, 3.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pon_tm2x_clk_src = {
+	.cmd_rcgr = 0x3c004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_11,
+	.freq_tbl = ftbl_gcc_pon_tm2x_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pon_tm2x_clk_src",
+		.parent_data = gcc_parent_data_11,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sleep_clk_src = {
+	.cmd_rcgr = 0x3400c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_13,
+	.freq_tbl = ftbl_gcc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sleep_clk_src",
+		.parent_data = gcc_parent_data_13,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_13),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_lpass_sway_clk_src[] = {
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_lpass_sway_clk_src = {
+	.cmd_rcgr = 0x27004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_lpass_sway_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_lpass_sway_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_lpass_axim_clk_src = {
+	.cmd_rcgr = 0x2700c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_lpass_sway_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_lpass_axim_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_nssnoc_memnoc_div_clk_src = {
+	.reg = 0x1700c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_nssnoc_memnoc_bfdcd_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb0_mock_utmi_div_clk_src = {
+	.reg = 0x2c040,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_mock_utmi_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb0_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_pon_tm_div_clk_src = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pon_tm_div_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gcc_pon_tm2x_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_branch gcc_adss_pwm_clk = {
+	.halt_reg = 0x1c00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_adss_pwm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_adss_pwm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cnoc_pcie0_1lane_s_clk = {
+	.halt_reg = 0x31088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cnoc_pcie0_1lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cnoc_pcie1_2lane_s_clk = {
+	.halt_reg = 0x3108c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cnoc_pcie1_2lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cnoc_usb_clk = {
+	.halt_reg = 0x310a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x310a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cnoc_usb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio_ahb_clk = {
+	.halt_reg = 0x17040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mdio_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio_gephy_ahb_clk = {
+	.halt_reg = 0x17098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17098,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mdio_gephy_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ts_clk = {
+	.halt_reg = 0x17018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nss_ts_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nss_ts_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nsscc_clk = {
+	.halt_reg = 0x17034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nsscc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nsscfg_clk = {
+	.halt_reg = 0x1702c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nsscfg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_atb_clk = {
+	.halt_reg = 0x17014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_at_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_memnoc_1_clk = {
+	.halt_reg = 0x17084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_memnoc_clk = {
+	.halt_reg = 0x17024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_nsscc_clk = {
+	.halt_reg = 0x17030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_nsscc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 gcc_xo_clk_src = {
+	.cmd_rcgr = 0x34004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_xo,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_xo_clk_src",
+		.parent_data = &gcc_parent_data_xo,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_xo_div4_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_xo_div4_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gcc_xo_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_branch gcc_gephy_sys_clk = {
+	.halt_reg = 0x2a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_gephy_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_pcnoc_1_clk = {
+	.halt_reg = 0x17080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_pcnoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_qosgen_ref_clk = {
+	.halt_reg = 0x1701c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_qosgen_ref_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&gcc_xo_div4_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_1_clk = {
+	.halt_reg = 0x1707c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1707c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_snoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_system_noc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_clk = {
+	.halt_reg = 0x17028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_snoc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_system_noc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_timeout_ref_clk = {
+	.halt_reg = 0x17020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_timeout_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_div4_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_xo_dcd_clk = {
+	.halt_reg = 0x17074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_xo_dcd_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_ahb_clk = {
+	.halt_reg = 0x28030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_aux_clk = {
+	.halt_reg = 0x28070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_m_clk = {
+	.halt_reg = 0x28038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
+	.halt_reg = 0x28048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_clk = {
+	.halt_reg = 0x28040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie0_pipe_clk_src = {
+	.reg = 0x28064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY0_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_pipe_clk = {
+	.halt_reg = 0x28068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x28068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie0_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_ahb_clk = {
+	.halt_reg = 0x29030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_aux_clk = {
+	.halt_reg = 0x29074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_m_clk = {
+	.halt_reg = 0x29038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_bridge_clk = {
+	.halt_reg = 0x29048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_clk = {
+	.halt_reg = 0x29040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie1_pipe_clk_src = {
+	.reg = 0x29064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie1_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY1_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_pipe_clk = {
+	.halt_reg = 0x29068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x29068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie1_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qrng_ahb_clk = {
+	.halt_reg = 0x13024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(10),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qrng_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_ahb_mst_clk = {
+	.halt_reg = 0x1014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_ahb_mst_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_ahb_slv_clk = {
+	.halt_reg = 0x102c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_ahb_slv_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se0_clk = {
+	.halt_reg = 0x4020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se1_clk = {
+	.halt_reg = 0x5020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se2_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se3_clk = {
+	.halt_reg = 0x2048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se4_clk = {
+	.halt_reg = 0x302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se5_clk = {
+	.halt_reg = 0x3048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x3303c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3303c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x3302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x33034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x33034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_pcie0_axi_m_clk = {
+	.halt_reg = 0x2e04c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_snoc_pcie0_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_pcie1_axi_m_clk = {
+	.halt_reg = 0x2e050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_snoc_pcie1_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_ahb_clk = {
+	.halt_reg = 0x1704c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1704c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_sys_clk = {
+	.halt_reg = 0x17048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy0_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_ahb_clk = {
+	.halt_reg = 0x1705c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1705c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_sys_clk = {
+	.halt_reg = 0x17058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy1_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_ahb_clk = {
+	.halt_reg = 0x1706c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1706c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy2_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_sys_clk = {
+	.halt_reg = 0x17068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy2_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_aux_clk = {
+	.halt_reg = 0x2c04c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_master_clk = {
+	.halt_reg = 0x2c044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_mock_utmi_clk = {
+	.halt_reg = 0x2c050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_mock_utmi_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_phy_cfg_ahb_clk = {
+	.halt_reg = 0x2c05c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c05c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_phy_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb0_pipe_clk_src = {
+	.reg = 0x2c074,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_USB3_PHY0_CC_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_pipe_clk = {
+	.halt_reg = 0x2c054,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2c054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_usb0_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_sleep_clk = {
+	.halt_reg = 0x2c058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2c058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_sleep_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_rchng_clk = {
+	.halt_reg = 0x28028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie0_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_rchng_clk = {
+	.halt_reg = 0x29028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie1_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_ahb_clk = {
+	.halt_reg = 0x32010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x32010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_clk = {
+	.halt_reg = 0x32028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x32028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qpic_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_io_macro_clk = {
+	.halt_reg = 0x3200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_io_macro_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qpic_io_macro_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_ahb_clk = {
+	.halt_reg = 0x3a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cmn_12gpll_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_sys_clk = {
+	.halt_reg = 0x3a008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cmn_12gpll_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_at_clk = {
+	.halt_reg = 0x2d034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2d034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qdss_at_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_at_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_dap_clk = {
+	.halt_reg = 0x2d058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qdss_dap_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_tsctr_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pon_apb_clk = {
+	.halt_reg = 0x3c01c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pon_apb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pon_tm_clk = {
+	.halt_reg = 0x3c014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pon_tm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pon_tm_div_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pon_tm2x_clk = {
+	.halt_reg = 0x3c00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pon_tm2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pon_tm2x_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_lpass_clk = {
+	.halt_reg = 0x2e028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_snoc_lpass_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_lpass_axim_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_sway_clk = {
+	.halt_reg = 0x27014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x27014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_lpass_sway_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_lpass_sway_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cnoc_lpass_cfg_clk = {
+	.halt_reg = 0x31020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x31020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cnoc_lpass_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_lpass_sway_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_lpass_core_axim_clk = {
+	.halt_reg = 0x27018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x27018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_lpass_core_axim_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_lpass_axim_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static __maybe_unused struct clk_regmap *gcc_ipq5210_clocks[] = {
+	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
+	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
+	[GCC_CMN_12GPLL_AHB_CLK] = &gcc_cmn_12gpll_ahb_clk.clkr,
+	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
+	[GCC_CNOC_LPASS_CFG_CLK] = &gcc_cnoc_lpass_cfg_clk.clkr,
+	[GCC_CNOC_PCIE0_1LANE_S_CLK] = &gcc_cnoc_pcie0_1lane_s_clk.clkr,
+	[GCC_CNOC_PCIE1_2LANE_S_CLK] = &gcc_cnoc_pcie1_2lane_s_clk.clkr,
+	[GCC_CNOC_USB_CLK] = &gcc_cnoc_usb_clk.clkr,
+	[GCC_GEPHY_SYS_CLK] = &gcc_gephy_sys_clk.clkr,
+	[GCC_LPASS_AXIM_CLK_SRC] = &gcc_lpass_axim_clk_src.clkr,
+	[GCC_LPASS_CORE_AXIM_CLK] = &gcc_lpass_core_axim_clk.clkr,
+	[GCC_LPASS_SWAY_CLK] = &gcc_lpass_sway_clk.clkr,
+	[GCC_LPASS_SWAY_CLK_SRC] = &gcc_lpass_sway_clk_src.clkr,
+	[GCC_MDIO_AHB_CLK] = &gcc_mdio_ahb_clk.clkr,
+	[GCC_MDIO_GEPHY_AHB_CLK] = &gcc_mdio_gephy_ahb_clk.clkr,
+	[GCC_NSS_TS_CLK] = &gcc_nss_ts_clk.clkr,
+	[GCC_NSS_TS_CLK_SRC] = &gcc_nss_ts_clk_src.clkr,
+	[GCC_NSSCC_CLK] = &gcc_nsscc_clk.clkr,
+	[GCC_NSSCFG_CLK] = &gcc_nsscfg_clk.clkr,
+	[GCC_NSSNOC_ATB_CLK] = &gcc_nssnoc_atb_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_1_CLK] = &gcc_nssnoc_memnoc_1_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC] = &gcc_nssnoc_memnoc_bfdcd_clk_src.clkr,
+	[GCC_NSSNOC_MEMNOC_CLK] = &gcc_nssnoc_memnoc_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_DIV_CLK_SRC] = &gcc_nssnoc_memnoc_div_clk_src.clkr,
+	[GCC_NSSNOC_NSSCC_CLK] = &gcc_nssnoc_nsscc_clk.clkr,
+	[GCC_NSSNOC_PCNOC_1_CLK] = &gcc_nssnoc_pcnoc_1_clk.clkr,
+	[GCC_NSSNOC_QOSGEN_REF_CLK] = &gcc_nssnoc_qosgen_ref_clk.clkr,
+	[GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
+	[GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
+	[GCC_NSSNOC_TIMEOUT_REF_CLK] = &gcc_nssnoc_timeout_ref_clk.clkr,
+	[GCC_NSSNOC_XO_DCD_CLK] = &gcc_nssnoc_xo_dcd_clk.clkr,
+	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
+	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK_SRC] = &gcc_pcie0_axi_m_clk_src.clkr,
+	[GCC_PCIE0_AXI_S_BRIDGE_CLK] = &gcc_pcie0_axi_s_bridge_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK_SRC] = &gcc_pcie0_axi_s_clk_src.clkr,
+	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
+	[GCC_PCIE0_PIPE_CLK_SRC] = &gcc_pcie0_pipe_clk_src.clkr,
+	[GCC_PCIE0_RCHNG_CLK] = &gcc_pcie0_rchng_clk.clkr,
+	[GCC_PCIE0_RCHNG_CLK_SRC] = &gcc_pcie0_rchng_clk_src.clkr,
+	[GCC_PCIE1_AHB_CLK] = &gcc_pcie1_ahb_clk.clkr,
+	[GCC_PCIE1_AUX_CLK] = &gcc_pcie1_aux_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK] = &gcc_pcie1_axi_m_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK_SRC] = &gcc_pcie1_axi_m_clk_src.clkr,
+	[GCC_PCIE1_AXI_S_BRIDGE_CLK] = &gcc_pcie1_axi_s_bridge_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK] = &gcc_pcie1_axi_s_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK_SRC] = &gcc_pcie1_axi_s_clk_src.clkr,
+	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
+	[GCC_PCIE1_PIPE_CLK_SRC] = &gcc_pcie1_pipe_clk_src.clkr,
+	[GCC_PCIE1_RCHNG_CLK] = &gcc_pcie1_rchng_clk.clkr,
+	[GCC_PCIE1_RCHNG_CLK_SRC] = &gcc_pcie1_rchng_clk_src.clkr,
+	[GCC_PCIE_AUX_CLK_SRC] = &gcc_pcie_aux_clk_src.clkr,
+	[GCC_PCNOC_BFDCD_CLK_SRC] = &gcc_pcnoc_bfdcd_clk_src.clkr,
+	[GCC_PON_APB_CLK] = &gcc_pon_apb_clk.clkr,
+	[GCC_PON_TM_CLK] = &gcc_pon_tm_clk.clkr,
+	[GCC_PON_TM2X_CLK] = &gcc_pon_tm2x_clk.clkr,
+	[GCC_PON_TM2X_CLK_SRC] = &gcc_pon_tm2x_clk_src.clkr,
+	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
+	[GCC_QDSS_AT_CLK_SRC] = &gcc_qdss_at_clk_src.clkr,
+	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
+	[GCC_QDSS_TSCTR_CLK_SRC] = &gcc_qdss_tsctr_clk_src.clkr,
+	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
+	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
+	[GCC_QPIC_CLK_SRC] = &gcc_qpic_clk_src.clkr,
+	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
+	[GCC_QPIC_IO_MACRO_CLK_SRC] = &gcc_qpic_io_macro_clk_src.clkr,
+	[GCC_QRNG_AHB_CLK] = &gcc_qrng_ahb_clk.clkr,
+	[GCC_QUPV3_AHB_MST_CLK] = &gcc_qupv3_ahb_mst_clk.clkr,
+	[GCC_QUPV3_AHB_SLV_CLK] = &gcc_qupv3_ahb_slv_clk.clkr,
+	[GCC_QUPV3_WRAP_SE0_CLK] = &gcc_qupv3_wrap_se0_clk.clkr,
+	[GCC_QUPV3_WRAP_SE0_CLK_SRC] = &gcc_qupv3_wrap_se0_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE1_CLK] = &gcc_qupv3_wrap_se1_clk.clkr,
+	[GCC_QUPV3_WRAP_SE1_CLK_SRC] = &gcc_qupv3_wrap_se1_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE2_CLK] = &gcc_qupv3_wrap_se2_clk.clkr,
+	[GCC_QUPV3_WRAP_SE2_CLK_SRC] = &gcc_qupv3_wrap_se2_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE3_CLK] = &gcc_qupv3_wrap_se3_clk.clkr,
+	[GCC_QUPV3_WRAP_SE3_CLK_SRC] = &gcc_qupv3_wrap_se3_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE4_CLK] = &gcc_qupv3_wrap_se4_clk.clkr,
+	[GCC_QUPV3_WRAP_SE4_CLK_SRC] = &gcc_qupv3_wrap_se4_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE5_CLK] = &gcc_qupv3_wrap_se5_clk.clkr,
+	[GCC_QUPV3_WRAP_SE5_CLK_SRC] = &gcc_qupv3_wrap_se5_clk_src.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
+	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
+	[GCC_SNOC_LPASS_CLK] = &gcc_snoc_lpass_clk.clkr,
+	[GCC_SNOC_PCIE0_AXI_M_CLK] = &gcc_snoc_pcie0_axi_m_clk.clkr,
+	[GCC_SNOC_PCIE1_AXI_M_CLK] = &gcc_snoc_pcie1_axi_m_clk.clkr,
+	[GCC_SYSTEM_NOC_BFDCD_CLK_SRC] = &gcc_system_noc_bfdcd_clk_src.clkr,
+	[GCC_UNIPHY0_AHB_CLK] = &gcc_uniphy0_ahb_clk.clkr,
+	[GCC_UNIPHY0_SYS_CLK] = &gcc_uniphy0_sys_clk.clkr,
+	[GCC_UNIPHY1_AHB_CLK] = &gcc_uniphy1_ahb_clk.clkr,
+	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
+	[GCC_UNIPHY2_AHB_CLK] = &gcc_uniphy2_ahb_clk.clkr,
+	[GCC_UNIPHY2_SYS_CLK] = &gcc_uniphy2_sys_clk.clkr,
+	[GCC_UNIPHY_SYS_CLK_SRC] = &gcc_uniphy_sys_clk_src.clkr,
+	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
+	[GCC_USB0_AUX_CLK_SRC] = &gcc_usb0_aux_clk_src.clkr,
+	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
+	[GCC_USB0_MASTER_CLK_SRC] = &gcc_usb0_master_clk_src.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK_SRC] = &gcc_usb0_mock_utmi_clk_src.clkr,
+	[GCC_USB0_MOCK_UTMI_DIV_CLK_SRC] = &gcc_usb0_mock_utmi_div_clk_src.clkr,
+	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+	[GCC_USB0_PIPE_CLK_SRC] = &gcc_usb0_pipe_clk_src.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
+	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[GPLL0_MAIN] = &gpll0_main.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL2_MAIN] = &gpll2_main.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL4_MAIN] = &gpll4_main.clkr,
+};
+
+static const struct qcom_reset_map gcc_ipq5210_resets[] = {
+	[GCC_ADSS_BCR] = { 0x1c000 },
+	[GCC_ADSS_PWM_ARES] = { 0x1c00c, 2 },
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x38000 },
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_ARES] = { 0x3800c, 2 },
+	[GCC_APSS_AHB_ARES] = { 0x24014, 2 },
+	[GCC_APSS_ATB_ARES] = { 0x24034, 2 },
+	[GCC_APSS_AXI_ARES] = { 0x24018, 2 },
+	[GCC_APSS_TS_ARES] = { 0x24030, 2 },
+	[GCC_BOOT_ROM_AHB_ARES] = { 0x1302c, 2 },
+	[GCC_BOOT_ROM_BCR] = { 0x13028 },
+	[GCC_GEPHY_BCR] = { 0x2a000 },
+	[GCC_GEPHY_SYS_ARES] = { 0x2a004, 2 },
+	[GCC_GP1_ARES] = { 0x8018, 2 },
+	[GCC_GP2_ARES] = { 0x9018, 2 },
+	[GCC_GP3_ARES] = { 0xa018, 2 },
+	[GCC_MDIO_AHB_ARES] = { 0x17040, 2 },
+	[GCC_MDIO_BCR] = { 0x1703c },
+	[GCC_MDIO_GEPHY_AHB_ARES] = { 0x17098, 2 },
+	[GCC_NSS_BCR] = { 0x17000 },
+	[GCC_NSS_TS_ARES] = { 0x17018, 2 },
+	[GCC_NSSCC_ARES] = { 0x17034, 2 },
+	[GCC_NSSCFG_ARES] = { 0x1702c, 2 },
+	[GCC_NSSNOC_ATB_ARES] = { 0x17014, 2 },
+	[GCC_NSSNOC_MEMNOC_1_ARES] = { 0x17084, 2 },
+	[GCC_NSSNOC_MEMNOC_ARES] = { 0x17024, 2 },
+	[GCC_NSSNOC_NSSCC_ARES] = { 0x17030, 2 },
+	[GCC_NSSNOC_PCNOC_1_ARES] = { 0x17080, 2 },
+	[GCC_NSSNOC_QOSGEN_REF_ARES] = { 0x1701c, 2 },
+	[GCC_NSSNOC_SNOC_1_ARES] = { 0x1707c, 2 },
+	[GCC_NSSNOC_SNOC_ARES] = { 0x17028, 2 },
+	[GCC_NSSNOC_TIMEOUT_REF_ARES] = { 0x17020, 2 },
+	[GCC_NSSNOC_XO_DCD_ARES] = { 0x17074, 2 },
+	[GCC_PCIE0_AHB_ARES] = { 0x28030, 2 },
+	[GCC_PCIE0_AUX_ARES] = { 0x28070, 2 },
+	[GCC_PCIE0_AXI_M_ARES] = { 0x28038, 2 },
+	[GCC_PCIE0_AXI_S_BRIDGE_ARES] = { 0x28048, 2 },
+	[GCC_PCIE0_AXI_S_ARES] = { 0x28040, 2 },
+	[GCC_PCIE0_BCR] = { 0x28000 },
+	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x28054 },
+	[GCC_PCIE0_PIPE_RESET] = { 0x28058, 0 },
+	[GCC_PCIE0_CORE_STICKY_RESET] = { 0x28058, 1 },
+	[GCC_PCIE0_AXI_S_STICKY_RESET] = { 0x28058, 2 },
+	[GCC_PCIE0_AXI_S_RESET] = { 0x28058, 3 },
+	[GCC_PCIE0_AXI_M_STICKY_RESET] = { 0x28058, 4 },
+	[GCC_PCIE0_AXI_M_RESET] = { 0x28058, 5 },
+	[GCC_PCIE0_AUX_RESET] = { 0x28058, 6 },
+	[GCC_PCIE0_AHB_RESET] = { 0x28058, 7 },
+	[GCC_PCIE0_PHY_BCR] = { 0x28060 },
+	[GCC_PCIE0_PIPE_ARES] = { 0x28068, 2 },
+	[GCC_PCIE0PHY_PHY_BCR] = { 0x2805c },
+	[GCC_PCIE1_AHB_ARES] = { 0x29030, 2 },
+	[GCC_PCIE1_AUX_ARES] = { 0x29074, 2 },
+	[GCC_PCIE1_AXI_M_ARES] = { 0x29038, 2 },
+	[GCC_PCIE1_AXI_S_BRIDGE_ARES] = { 0x29048, 2 },
+	[GCC_PCIE1_AXI_S_ARES] = { 0x29040, 2 },
+	[GCC_PCIE1_BCR] = { 0x29000 },
+	[GCC_PCIE1_LINK_DOWN_BCR] = { 0x29054 },
+	[GCC_PCIE1_PIPE_RESET] = { 0x29058, 0 },
+	[GCC_PCIE1_CORE_STICKY_RESET] = { 0x29058, 1 },
+	[GCC_PCIE1_AXI_S_STICKY_RESET] = { 0x29058, 2 },
+	[GCC_PCIE1_AXI_S_RESET] = { 0x29058, 3 },
+	[GCC_PCIE1_AXI_M_STICKY_RESET] = { 0x29058, 4 },
+	[GCC_PCIE1_AXI_M_RESET] = { 0x29058, 5 },
+	[GCC_PCIE1_AUX_RESET] = { 0x29058, 6 },
+	[GCC_PCIE1_AHB_RESET] = { 0x29058, 7 },
+	[GCC_PCIE1_PHY_BCR] = { 0x29060 },
+	[GCC_PCIE1_PIPE_ARES] = { 0x29068, 2 },
+	[GCC_PCIE1PHY_PHY_BCR] = { 0x2905c },
+	[GCC_QRNG_AHB_ARES] = { 0x13024, 2 },
+	[GCC_QRNG_BCR] = { 0x13020 },
+	[GCC_QUPV3_2X_CORE_ARES] = { 0x1020, 2 },
+	[GCC_QUPV3_AHB_MST_ARES] = { 0x1014, 2 },
+	[GCC_QUPV3_AHB_SLV_ARES] = { 0x102c, 2 },
+	[GCC_QUPV3_BCR] = { 0x1000 },
+	[GCC_QUPV3_CORE_ARES] = { 0x1018, 2 },
+	[GCC_QUPV3_WRAP_SE0_ARES] = { 0x4020, 2 },
+	[GCC_QUPV3_WRAP_SE0_BCR] = { 0x4000 },
+	[GCC_QUPV3_WRAP_SE1_ARES] = { 0x5020, 2 },
+	[GCC_QUPV3_WRAP_SE1_BCR] = { 0x5000 },
+	[GCC_QUPV3_WRAP_SE2_ARES] = { 0x202c, 2 },
+	[GCC_QUPV3_WRAP_SE2_BCR] = { 0x2000 },
+	[GCC_QUPV3_WRAP_SE3_ARES] = { 0x2048, 2 },
+	[GCC_QUPV3_WRAP_SE3_BCR] = { 0x2030 },
+	[GCC_QUPV3_WRAP_SE4_ARES] = { 0x302c, 2 },
+	[GCC_QUPV3_WRAP_SE4_BCR] = { 0x3000 },
+	[GCC_QUPV3_WRAP_SE5_ARES] = { 0x3048, 2 },
+	[GCC_QUPV3_WRAP_SE5_BCR] = { 0x3030 },
+	[GCC_QUSB2_0_PHY_BCR] = { 0x2c068 },
+	[GCC_SDCC1_AHB_ARES] = { 0x3303c, 2 },
+	[GCC_SDCC1_APPS_ARES] = { 0x3302c, 2 },
+	[GCC_SDCC1_ICE_CORE_ARES] = { 0x33034, 2 },
+	[GCC_SDCC_BCR] = { 0x33000 },
+	[GCC_TLMM_AHB_ARES] = { 0x3e004, 2 },
+	[GCC_TLMM_ARES] = { 0x3e008, 2 },
+	[GCC_TLMM_BCR] = { 0x3e000 },
+	[GCC_UNIPHY0_AHB_ARES] = { 0x1704c, 2 },
+	[GCC_UNIPHY0_BCR] = { 0x17044 },
+	[GCC_UNIPHY0_SYS_ARES] = { 0x17048, 2 },
+	[GCC_UNIPHY1_AHB_ARES] = { 0x1705c, 2 },
+	[GCC_UNIPHY1_BCR] = { 0x17054 },
+	[GCC_UNIPHY1_SYS_ARES] = { 0x17058, 2 },
+	[GCC_UNIPHY2_AHB_ARES] = { 0x1706c, 2 },
+	[GCC_UNIPHY2_BCR] = { 0x17064 },
+	[GCC_UNIPHY2_SYS_ARES] = { 0x17068, 2 },
+	[GCC_USB0_AUX_ARES] = { 0x2c04c, 2 },
+	[GCC_USB0_MASTER_ARES] = { 0x2c044, 2 },
+	[GCC_USB0_MOCK_UTMI_ARES] = { 0x2c050, 2 },
+	[GCC_USB0_PHY_BCR] = { 0x2c06c },
+	[GCC_USB0_PHY_CFG_AHB_ARES] = { 0x2c05c, 2 },
+	[GCC_USB0_PIPE_ARES] = { 0x2c054, 2 },
+	[GCC_USB0_SLEEP_ARES] = { 0x2c058, 2 },
+	[GCC_USB3PHY_0_PHY_BCR] = { 0x2c070 },
+	[GCC_USB_BCR] = { 0x2c000 },
+	[GCC_QDSS_BCR] = { 0x2d000 },
+};
+
+static const struct of_device_id gcc_ipq5210_match_table[] = {
+	{ .compatible = "qcom,ipq5210-gcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_ipq5210_match_table);
+
+static const struct regmap_config gcc_ipq5210_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x3f024,
+	.fast_io        = true,
+};
+
+static struct clk_hw *gcc_ipq5210_hws[] = {
+	&gpll0_div2.hw,
+	&gcc_xo_div4_clk_src.hw,
+	&gcc_pon_tm_div_clk_src.hw,
+};
+
+static const struct qcom_cc_desc gcc_ipq5210_desc = {
+	.config = &gcc_ipq5210_regmap_config,
+	.clks = gcc_ipq5210_clocks,
+	.num_clks = ARRAY_SIZE(gcc_ipq5210_clocks),
+	.resets = gcc_ipq5210_resets,
+	.num_resets = ARRAY_SIZE(gcc_ipq5210_resets),
+	.clk_hws = gcc_ipq5210_hws,
+	.num_clk_hws = ARRAY_SIZE(gcc_ipq5210_hws),
+};
+
+static int gcc_ipq5210_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_ipq5210_desc);
+}
+
+static struct platform_driver gcc_ipq5210_driver = {
+	.probe = gcc_ipq5210_probe,
+	.driver = {
+		.name   = "qcom,gcc-ipq5210",
+		.of_match_table = gcc_ipq5210_match_table,
+	},
+};
+
+static int __init gcc_ipq5210_init(void)
+{
+	return platform_driver_register(&gcc_ipq5210_driver);
+}
+core_initcall(gcc_ipq5210_init);
+
+static void __exit gcc_ipq5210_exit(void)
+{
+	platform_driver_unregister(&gcc_ipq5210_driver);
+}
+module_exit(gcc_ipq5210_exit);
+
+MODULE_DESCRIPTION("QTI GCC IPQ5210 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


