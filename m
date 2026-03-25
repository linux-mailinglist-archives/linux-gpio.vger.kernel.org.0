Return-Path: <linux-gpio+bounces-34116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EM8NVWqw2nAtAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:26:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8753222E4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABCEF3088B50
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 09:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D84C35BDD5;
	Wed, 25 Mar 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvm1tVnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEqnyaIu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A844359A90
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430365; cv=none; b=H5jInLBl2cVOXOZfkYZUEuF6WGXfPxUPyxNZ2yYmhyhtj8pjhcGiig80zA1nTCxGm3G63S3piHvik6XIggLVzOb9rRKNmsmjSpMYCvjC2HhGk1/9nBHKhaVZ56KyrCZ+XtX/E2424zT/4f8a4JYBsX7f0rQcn2gVtzwHNING9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430365; c=relaxed/simple;
	bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNowxVV6Uh7CM4i1kXNgEffbG1n83seR9A+V1nvbr8P0a5qTmnoIz96FF0kV9YrMyFFmZIDS02/TliOYSz7xe2k6k5YG0jsiild0u7HsbZnjcirR82zq/4c394RPTzxgf2trmSBHylzrYYW0ZCsx9YfIVm8ROtIOFWXu50ACM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvm1tVnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEqnyaIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4xMfS2807976
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=; b=Fvm1tVnC1hgqN7e2
	cjokBbdsl5quK0YCTvRp3K6mLsQ13MLXSVyaTsHQMRJHAf/OWLUGbScQIw5oy/Le
	t91uA+tSbabJAAAuXUF7Po8VbjA4LcvbqDHVAClOHIkZWnoRPbuqRwe8Kl6/Ap6f
	S2G7oJKXKEMbDLpSGbr5/UVPRDMK/gsRl8ft9vprZx9TwQvMv+3uE7AQnuBvQRq0
	c1+pom3XdtCkY3dvq8S/1YWfktocj/rRirGmACoz3J3QXRC5ZA7+nxyfKuT2Q2EF
	jPwNL8j6UOXyA7FBITLGrHB7iAerJrzlt2HsbzijdSerr+2ktIJax5KljUUQTn+g
	+mLzTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9emaw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b06395b8deso32721495ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430363; x=1775035163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=dEqnyaIuacBa8AXnuQUF5W7wWtscf9MF0Mgx99R7oWYKcMzgrmWFdccQebwRaEcGqE
         OFWXQIm6nfxTmgnpehD68S3D4OtyY4L7xw4P2hLG/elWu2XyqZy/xbzoaCNX5gKdPiKy
         RTOsSe0dqwjJKimtvuGBfTl1Q5uz3lBNgbELZRLVZ5mFi+GYJeKcBApP+Cp9PM71Wmk7
         RnqdlVXaPcxdBELJVajaFhS8Q1PNnY5lbOOs4LEzzvNq7R31NaNONdHEBTtcj7LwJlO4
         Lh6qxVj+ClnnccpLbVFne8WV2ktfEAAXMSHJ5WOQVfkhCUJ8QOydX69uVcpsIsFzs52f
         v78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430363; x=1775035163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=O6kQIJLIArymwK3T5+j67FBwu8VWINb3gTTIMo+kHPvH/R/Y/zBsMEgiA6ZEeU+Ezo
         SesEwQF9z7NY36a0haPnu4Rywt254pAZERuxf683Ih2mgKETqY0TF10qJZ4UfWLljkRR
         fhiPWsvXsie0afWOgSMnE8NWY4IAZYUXGJ0tpnaKxpN2SLSEdc4lQtpV/hu4Y6rBHSID
         qYdmubthSwcZ4huv2M7/Gjbx2OU2H54PDBOmFBDRkBHZoaTndcmoTf9Df9AkKIDKLLkc
         nair64sbhty89DLFEA5QkmzcxIIWy+otYnG2wsYutN4d4bl+G57RLZLS3yYvTrkn16qs
         nFUA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ak+FV3irY/DF1CPwB1qbx919+TPjxqZitbqiA7dTIX9boKXbx6b/w0AkDqFpXZmZ1/VAixuF3eOI@vger.kernel.org
X-Gm-Message-State: AOJu0YzrpbayolU7PgT8GB+a32V8BHjIrJ3Bb83ZZfjyrmmxSza3nD/u
	q5+nFAmHLRQ2MNeYkPsO5JeVPfuhG7156YmObYi/nK86ab6aSSYC1ypPNv9GCHu6MhdCLhbySBV
	vqzONfUxJpyRnZA3IGwe3nuD31kMJTIbLrqe0e1wPd4W/WRzoplp1OIru2348T/AU
X-Gm-Gg: ATEYQzznboPhEl+kkkUMnh85s9LbuXcp7TONTsDDLEO1WsBD//OMaVvPfMKAcRQ7zej
	IjQHAbjNu9m/oZn9WZpqTVqfLPv5nzX5F/Ik5Cw83ak117s2ZgOaJblCF9BpAsXEznEG1qsqtHh
	L42AghE9wRVATRbmXGFRoF0k6k1md2ITr6vw6h2tKiWrU58ZC0FTH2PiPCzz5a3HoUoE+dZTebU
	ogvAOZXYm2+RisP1oAvyzxFoUrvXdjzD4wC8HgkRG8hN/lmTVd24WICYyxjkWq7FzOYHvZ/e17R
	6b0XH71g6rcrMcBGVTNl1EwKc+e+5eUElFT6rO4kY9aMmPJyZKeR+nynlYCxDSDP5nSxVxmF/gG
	4b6v0ApySOqRVOVvA2v6A7gSlBInoHvM7WY+kq6KUxn0ys8eJJCGG1LhFlexJVKFQgX338X6DY1
	i9GbmiWuu3bL/0iwh4Elv1UxKzCQSiQuRSzEXVovmQbp+5TkYPg7sLWsrD
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998782637.57.1774430362687;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998745637.57.1774430362204;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:49:09 +0530
Subject: [PATCH v3 1/2] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq5210_boot_to_shell-v3-1-9c7360d19d10@oss.qualcomm.com>
References: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=893;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
 b=djQly+ldqLQ0wZD7dx5lcKg64pPrB/d2bMfDj6mDkhh60Nyu16gAcmW0jK5yWoo5WqEP8lxBh
 wlhvXDc1RiUCwVs9U51jWXEeEzcjlgNJ5NgKkcxHDiRPbKvFrXw0qVt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 8cTO8cohB9AIuDOhs_en-G2EW0Pv-76G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NSBTYWx0ZWRfX6ViEm8QLN4zl
 qolEBjd+zjPx1dGLZ9IOoX3SrdMwHJI93Oy5eVyFZwEIyjnpqvTZDP5tVxOYODiI/S2nO8IkvtP
 ym1eKAz4W28GtCXsQEYtPcbJTupBnpg6prQFFWvAcRHQg9Vn7+91fJ4hqqu6PVpEY5BHA8/Uxy0
 Cl+3T0QuMShKXZKpxcJiOJKabJwB+zMwQxsYFF+WSUmEOeVDgmAeYT3t9tVJ9fskSYia4a/aqrn
 EYBWB8dQ/QIaEjSQI2qamhcQ9ZNs9YkrMxTNW78bCWpuPhMxF6Q4hMGYLsLx6WR7lj1Gpu1CYpV
 jCXWg6C2BMVTctsFV/DziHTnU6fzyogagV6vFEd2lzsXTcyB4UyAw5ZfTP6KnT15PkW7MYmipbG
 GQ7hHgC/lJi57uX9bPzOAH3RpzWP2tujK10aTuVMeipraFtzozJIqeOeFUbvJLQZQs1uTdNAW7I
 nNrsO2J88lmadYD4bQw==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c3a89b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HYPJJSFQ9-wKY5ciiH4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8cTO8cohB9AIuDOhs_en-G2EW0Pv-76G
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34116-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: DD8753222E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e..ca880c105f3b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -322,6 +322,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1


