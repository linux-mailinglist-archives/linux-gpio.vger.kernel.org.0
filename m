Return-Path: <linux-gpio+bounces-39384-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0TrAJUFmR2riXgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39384-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 09:35:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F406FF9A9
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 09:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XbG60ZMv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C9suyqD3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39384-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39384-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9D930949C2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 07:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4031367B89;
	Fri,  3 Jul 2026 07:30:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1C433E7B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 07:30:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063856; cv=none; b=cuWIgtXGeKAjM4xWEt6VN8XGABTkdAUrOR4WDvuABnuq8er1QBQndZKBNEz5AD/IkfjtRWrQKci7MjXUr5sqJbQXunAy+BYoqydyCkMZujlDbR3+0d2ndAIpwB+8nJhfParh8EKMtBQZDE0NcBBr6GkSJQHUYM4oeINoHrAt4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063856; c=relaxed/simple;
	bh=Pj0dPoQ1Z36EtPpZ4QwKV/v8H3nhBNbYqOour2sGvPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rCwLEUP5QiaAyzOXjVC9++6atEMxdKpJge2cHqRdZm2aZGa8e+bzkuNU9wAMGIF3JDcKGAMKJOUMc1/Ck6w6ZqI4CI2+uNILvQ5dPOqXUQ/HbW0jBYv8jsF+KInRzx9Q2iWJrkS0e9JOTiJKZ3mCG78Gn+9I6oO8NUt+0Zc5zVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbG60ZMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9suyqD3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IPKS3194632
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 07:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hzACdTCdcV8
	KGypXMG7VhShgdpHT5XPOaI591fMeC/A=; b=XbG60ZMveTTTr01Ib9pJtYgndBT
	ddEavCDTWvQD+vZoxk2MdglCfJl9uyzLBMK4Td6AGiA5YqhTzGXZKviX76c3qQ2k
	2iqNJpCHDP/4n3t3yO4jf0Mfyh2YYrbpaXXRfIVDGc0a3OCUHgB7jfEaE6Z9sO5P
	X5n9TqpUXPNlhFI9ha5sP1xnrRdNZxNakpZq1A23WnNCZnE2LkWaDJUQ3ejdYAG2
	fKqpyiIEVbAVn3bUtpcBCFBHhDS7ocaNGKjy8GxQENts3sCbm1ZjmeabBcJYWAFI
	CAS3TXWP5qMfhCBgKarLdNeExT7YTgefQFancXpler9IZCbtWZSPm48go6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr1nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 07:30:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso460815a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 00:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063851; x=1783668651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzACdTCdcV8KGypXMG7VhShgdpHT5XPOaI591fMeC/A=;
        b=C9suyqD3Zqi3/Uiigjy32RG663TAAoJDxoO2d2qQKlt16Gl9Ath2yEozO8o18nTFFg
         ZpkaVC/fO5V4GJGrRxVkylsWgByenDCJPT5zkk3WY2LUVaZ+ujyDnh5dBEACHj3I2UaJ
         dmztEB5qUOJQmfQ1DVIDl5HdE/a2oxEcBmU0rxa0AhP1YdjF4PLIfSP9HYvrGoUxzLwj
         W2zHL2tJdNawIfUTWqGYPObigvvFZ1mKA3QW25J8eizqjljeVAblswlV8Xw6SJW97tO+
         R63xgMKuhi/JTAQ2HBtmShDW1LW9g+qi6xzX2c1vqa0NSPEvqwbRGQqVnU29uUky/1Q4
         ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063851; x=1783668651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzACdTCdcV8KGypXMG7VhShgdpHT5XPOaI591fMeC/A=;
        b=So4NaNKsVNYqE29ZHfKnxCGJwRaLj45xF6JD2Zal4jZWaCHbNp+MlPU7qpjewUo7yC
         dWyK5D3qpZf5RHdLjyvEls+XtpWgGGO9p8vuqeSLpdUq31oYjFDu/tW7kyKcCXNx9CeH
         FNa8oTo0KdD2KNjAGQSOJgC3VHSVdCq7Xe+TK9Uloak47IiRdSs0x/bEfFZBy/AeyZSE
         xwJBQ1DSV3HJUml6sMJSmRB3nxE1QpYULSbIuOr+CL4x2gVh/wNO9e7RPlKzbz5/hMLx
         3vEO6Ppw2i6jfZu/EWUHLUpWV6Oo0/OlEvLMDwHLfS6zcz8VM3RFL7OSIbMnNKvq3J13
         +DWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdNURwf6pGaImgmUxJc9pP75sbU7XdKWU+ygpuZRSlJ6MBB9cu/yirQreHBGnG8L5Y4dhl5gaFiEdA@vger.kernel.org
X-Gm-Message-State: AOJu0YyupYk5CJtFNov8+4wT8gvgrj5pSz1DQS01+wkeDDdGlqrPi9JX
	WMV4AK4059nQxd1jkazIt6pX7e/lMlRpH19f62IpzK6+bkI9vFDxjTMG6Az1WPBwBB/tulvJYFu
	IoYd6/HkicDEmZVC2r2yFEfDnotyna+uWCrqsXcb3zZKX9MJL0+Dc67lmaXUyJjiA
X-Gm-Gg: AfdE7cl6lyRnxunVjfZaGhQBJCmljrlzu5MwxzQECQaXcQBqUs7RNxoORGSMyNIEwAb
	ucUbQfefdK43j1fGzf4AjiNDU1YKQGI+X439zq7QW8oQegZrHHMM/3dlWApFRSlABju5wy0fz8W
	XkhQJr7QhuQK7MxNCps3uOxGdCdzD97UdJOchrNrfDv505gecvZHWzbxp4xWqIkZ854D5VTLD3K
	pXecESFDLx2gpRBFZ2yutva3nJfiVMX0Km5vz031a0T1uG5BBp8UiRhteoybIBoNSUqSmzgnMq9
	q1H6P17L3wv69O8t0EQwxJ1hshblNc4da15Qlm4QyI+pPEUIcHX7XXeq6lp/1+L7sl0e/gG5IUM
	THwT0qw2aYZAG2RVE4ieUhDyl6KdbZ7ODYVwPZyWT
X-Received: by 2002:a05:6a00:aa0a:b0:847:7f38:27a9 with SMTP id d2e1a72fcca58-847c0acd325mr9804384b3a.58.1783063851091;
        Fri, 03 Jul 2026 00:30:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:847:7f38:27a9 with SMTP id d2e1a72fcca58-847c0acd325mr9804344b3a.58.1783063850562;
        Fri, 03 Jul 2026 00:30:50 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:50 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Fri,  3 Jul 2026 13:00:29 +0530
Message-Id: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX4bzWuN1fca5o
 ubUu4ZGnSE6qXLoILGUY9nfkFnRl7uzyAx4U6itoNhNmD/6v6Wp3sU5chouGScgTupGF1Twmskj
 m1psXPH5Qe0eW2gQr5lY2y9mJkHD7N9pk1jCM6p3q4XLF4b8971l70ORjca5zNSyiZeToNcUVnW
 FHp5/TpzWJpkT1cSqrZhIE/LjBpFaehbW7ZX1f0iTX/rYaAnZk2/fYAqeDz2VhRt7/MXMwPQ13b
 moYflM6IgJBIcIzM+dDsm27URUUCmuxhks0GafBDJwqItLT6PewhiJl1bb1eVmPVJnu3moY93d0
 cvmFAjpTWyet8pOqAu45JBMA4PwKkRc3AxgHOOcPDsMWxDLzhgBuPh+RlFc/ccgEFGLz9NylQoU
 wjioJmELZNIlnt+xUR1EDUQY2znOYC9UcTBFKXbB74qLt4byPAQrAAmDVUeplI17rTBJilGCnL2
 eD6Q1AeiDKUGrnFJ4vg==
X-Proofpoint-GUID: ym_QbPqAbkvYMwOXLklTxbQpS-lqd0Uo
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47652b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ym_QbPqAbkvYMwOXLklTxbQpS-lqd0Uo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX87WbLOVtUv1a
 2qdde2tVfpJ2b1yeWMTsbWN6SYE8m3Go1eqDV8iHaI0IMnoI3nsIMna7fUOq+Prl2GcXBW83lXT
 zl0zGJJpWVcmNVjULkd1E7SdHN3+rls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-39384-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34F406FF9A9

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 72b8ffd97860..cb4934cd6f75 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -148,6 +148,33 @@ static const struct lpi_pingroup milos_groups[] = {
 	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
 };
 
+static const struct lpi_pingroup eliza_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 11, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 11, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 11, _, _, _, _),
+	LPI_PINGROUP(16, 11, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
 static const struct lpi_function milos_functions[] = {
 	LPI_FUNCTION(gpio),
 	LPI_FUNCTION(dmic1_clk),
@@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_lpi_data = {
 	.nfunctions = ARRAY_SIZE(milos_functions),
 };
 
+static const struct lpi_pinctrl_variant_data eliza_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = eliza_groups,
+	.ngroups = ARRAY_SIZE(eliza_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
+		.compatible = "qcom,eliza-lpass-lpi-pinctrl",
+		.data = &eliza_lpi_data,
+	}, {
 		.compatible = "qcom,milos-lpass-lpi-pinctrl",
 		.data = &milos_lpi_data,
 	},
-- 
2.34.1


