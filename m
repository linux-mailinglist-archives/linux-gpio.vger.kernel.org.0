Return-Path: <linux-gpio+bounces-33113-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHLsJqk8sWmAswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33113-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:58:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50F2617DD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A6C73082099
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558B83C13F4;
	Wed, 11 Mar 2026 09:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieCr6mOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7JXJKXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F43B7740
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222395; cv=none; b=GX1PeVImUaI9WgFwolMtWwlxKqCAhswcySdWjuaZGnzRFGFWJGwrpGuivzTVyFO4CaI8c1UuKY87tFyAjyGJYQstg2zeMAOVWfSp4CGME3nGVsymn7GK16ZgLy22EOSnljeRjF/nFjJIZnKv5OYBjK3v/xqWYf1CglMKw1UL2OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222395; c=relaxed/simple;
	bh=IQmLRubc98sYLOJZBs/FSJfKQt2j9qNxxWA76OuA2lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvOUHR4J9u3jrLzbPHnRVXpbBx5K9LGBEi/TZcL7miHuowHCO79llTwSojxrTZGIarJ3r9h7kU7gmUuoXfY3XYUL9IXai58YmQt/7tA04lJGtdZlSxnplabPdhBrL0Wfjj5zX9t+PBZU9Y83aQgV8y95+2ATuWoRKx//o8D917A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieCr6mOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7JXJKXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9fOIl2180799
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=; b=ieCr6mOZ+E4cVJ08
	V6bzprIWIiXuW0j46G2B4XFtuZl7GLIzd9InRRJoN07w9B1XkVpg7758btHjafl/
	H7Za7jIEJEhlX4POOvdKdZc/2+2AiQowXs+fUqFG7I2uTPh3UnmypmaNo9BCxOxw
	IoRBrXqEZra3uGWOnQ0LnU51okvoCVT9ExK3SWAGxQQo1qefk7oO3wDv+xtDNHWy
	XjKdJ7cMM7ADg1Jyl++e5ouO417xTa1/lqFUOCH/QuGgQIuPSHS9EjfcJReAfRVY
	zG1aYkWRbkOGzSvIDHrGc/cQXeAHZu96JdR1q8/ZokE4+0kIKHdCT/rSu78msU4j
	gJCASA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvstw73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:46:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82990cfa91aso2412231b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222389; x=1773827189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=;
        b=S7JXJKXsx94iydb1zH/4RagPvTjFc7wh/VVYk4ad5HfksErL0/0LEXXrQKPtVefV/m
         eOijlBIEaWgN7DtbTw0Zj00tpCHFdTT1bIoEq3OYmiS4/M9Tcedf1JbZaQSo3dTcBMgj
         Fi2t9o73stz+yBlpsbWEsj3RErVDy082COX0SmQEoavgMOaq8+C/7W+pg2W50u32eqdH
         +yeCj9mZYCvZmMIMqbRvB4pBz1Rv+65bCrpRZtHip1EDkAAmHR8CYp7brrtcA9z5WubX
         vIzH9DFpCGXhBk0DROmAUtAia4+pYgf20YcXfDlmiDY+T+JMekMbpLo7IHhPD9WGKQWU
         +1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222389; x=1773827189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tWAywvCGHxTAqEWVQVlrk7dlZA/OJH3Oi9lMQj0nYQM=;
        b=MaN5LaXz557sYyhvUVyQarnPT07tId9w5BCOY8fSkGFfpIfhjh8DKl2kmtFdKEo2nK
         KgDCNTSa+bdCBBqkcKH2j4Iw1C7/S2AkFX36WY0KUGxZtMj+R70WpyFCuaPb2BfJe1Y6
         0RED/tUah5A7tot8R7XkYlbqz9U4nitcNW1y7cjNOuxx5WRpHYeEBuPG1MdqF2yS4bqr
         mnIxPhCUCG7M2IXwfdDLKIUrbMPQXEbyiC1WMDIJ73S0j/TGw+6Azc/qCTObTo5KC57t
         mxsH77rUjhkQyzaC6mbvzE1+LPjlhsBeR019EVKziCj9giavzteGflDNFecIfc6LsW7M
         51WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF/RQepfi3ljbUnTG+CD+o8KKQTMwcQxZMtwNquTrBcYMJ82pidJltMgo2l8G3nwLUIU8Fxj0HjvSK@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNlo+hpuskAjRMWdIxU26oMavY2GnbX3Xoj/GlTOPe2tORV3x
	uLsuVj/r8pfFF5HQgTu7vP6rNyOxsvFDQjKl3Gk5TA0XyvnIpLxlMON3RsQtbG0JI92l/0+N4wk
	c/plCLJhFcnHLLg4oixcZea0iM/CL4sS5W4y2H03f3kD1SKwvaoh4w+REXJYZ5qpr
X-Gm-Gg: ATEYQzypA5PNeSpTYX/JO2XcxuZWfusSYgFdHIsf1Cu7XlyahH9u2iLUOWlTJadf8ix
	A3K4jsrYJAasmYqQY3gHHKDqAbDxK8b6SvSCTJTZwgyaGpqGQ+3+ync4etNJ8U88W44/OOdfWzW
	6TUexQWgO8kZhni6BEllwqJWD3IjbzHHM9bIw3w9ZkCKN72aSEXQctdFTyGKO4eDVWuhhi3XQZP
	w64WuHUlXdBfIjIN1rH5aJdSMGN+dNrEoLVwvO69zukSUDvo5u2SEu9UuuL9M2T9YQkwpln9Urb
	CbI32f0xR3UPPJvYlrbaSuiLyFgUSRahzUbv2IZ3TvFsbYr9MvV44YauP0G3EjNVACnLtbrBrq9
	2ktDN1F4CockClLXYdK78qu6Ln5BpZ0+152ykhah7xwSA0Sj2s+7gDaWzli250NSh37smjEUlRg
	LMCheUxg1nxrMOYf+P8nXUYzBEALs2uV8N51fHC032lQkdYsVvn9SZwHFI
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr1763999b3a.66.1773222388659;
        Wed, 11 Mar 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1911:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-829f71c2835mr1763975b3a.66.1773222388178;
        Wed, 11 Mar 2026 02:46:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:27 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:48 +0530
Subject: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=900;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IQmLRubc98sYLOJZBs/FSJfKQt2j9qNxxWA76OuA2lY=;
 b=9OwKMF0wDQKD28dnxyfTBusxTtAvDuDyTKmPQ4VL0dBcvlZWFztEFq9OqlcRrZDkeya/k5Gn8
 3APJ64QSwWpBbWrkghqziq1rpWICb2jnmWd95rlJgXBMGplAUHqoBmW
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX3jDIz56jHvth
 F7DeH1mlPedHjPVAh0F4ftXG0BGlmkTB1LgtUxA82Hyp1S7EZzIVWWTKDKy2XMkSuv74pgIBaqP
 X8NqjP0SdN9WMU7BLh0NL4jWXvLRfV8fw+Qe+i8+OMMtOQCo/HrS5qb2BB6i3lUgu+mJKTHzqEm
 vkjj643hxNLR2DV+YOeDjT7EhwuUUY5cbOaAVkDz8FYxQMwrkF4Cst9+flYi4z73NQBhVMbu1+4
 4i0fyGX5FY8P6ERSVBv2YDRrs0vFcna91ZaUI6B2WKZGRsSL5fky5h2p1CHpNcWkYdEMFMQjoT2
 XFOA3pUIUtGzTduHM17WnygbmNLbKEOujauZ+PXrL6MGTJeWwu6lan5CPPngUpf8JJh0VSM2+4W
 lAJe5Kgs95nTEcV7ZceZ+V5ubPckRo5eQdMEMuj1zi0jTkFRdlLBVuqVkkPB7gR/YMHYRFk8W3S
 nPzr1P/YEWspRJ+C5Vg==
X-Proofpoint-ORIG-GUID: Sjb1Cc1o3rxliVN88Mb1xKXCIn_0o09X
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b139f5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lbzul4gwta_GEy2M20MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Sjb1Cc1o3rxliVN88Mb1xKXCIn_0o09X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: 5F50F2617DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33113-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
compatible to the documentation.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 938be8228d668c87f0be95c63d4d951ebbadd4e4..fd1d5b04e7556903daffe86e455fde11be0dbd9f 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-sdhci
+              - qcom,ipq5210-sdhci
               - qcom,ipq5332-sdhci
               - qcom,ipq5424-sdhci
               - qcom,ipq6018-sdhci

-- 
2.34.1


