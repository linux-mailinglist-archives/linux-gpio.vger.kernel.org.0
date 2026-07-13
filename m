Return-Path: <linux-gpio+bounces-39978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nn05AnPZVGpIfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:26:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD274AECA
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:26:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fy/3QSY8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SEokuNUf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39978-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39978-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0493330317C0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF840B39F;
	Mon, 13 Jul 2026 12:16:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F540B389
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944962; cv=none; b=K4rEib5sdXtA3DzHmvQpQ0Hrop68b+Y1luyZRlLO/Gd3lCO0YIRhJla1yKIbEFRZBYMr3co2YOjGSM8IhE1GYLUwJGGJ6gxvFl7kFIIPleeSyG1dxYX6gD2opHKvjZuKKomGiPQ+YmelNiuQQf3vF6z6rrJ8UxM40xdBL1sSUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944962; c=relaxed/simple;
	bh=qs6ppqp0UOUiNfmIFg/KcxO7swqckHjrNOVvOglkL5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OPngnsYQ7qg6keo2LWNAdlBs74xL6Fnj5w2zBCOCzmG+fN+9glt0L15HwUcz+durhBsGGw69CH0WuWNcqhHVFuASmTZACiJiN4x5/uux8fU2jiToyRm71evIq+gdKkVYAIcLCRtV0PYBWS5kBdQii+UW9d2Rd5PF+JhTpodbtho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy/3QSY8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEokuNUf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDwsM1494447
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=42z1nSf/EWm
	6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=; b=fy/3QSY8y3JOVan+88LMAMVKCsy
	DMSsrh/+NiAytIIjJAQQB/QsLvk5vnrHJPfkhBA3WG4745145JSoZz96Yh2bbXwz
	PyrqLqblPFYMU71oFgc/WjnsCWlmTzOVKL3n6XKjskD6Tdq2p6y+T2RA3Ubb8wEc
	OJnb2c04KuNbaOrv/C8tNiuk6W/20iwW37Xkm5aVrf7HhD11Y3A3CupbSZGe6CXV
	cEDGMAZ/lgPmDS/LfKe2kSBmRqTe+8kxh6NQkXDuVYiEsAdl5EzY4mVmsKuM2G7R
	SWKBDPk899HG9Q8euu4p4PelsEcRrZhEeHVvMdiSblPWF/uib7c1eWMG3eA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2f7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4349212a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944950; x=1784549750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=SEokuNUfPzgVx8drMtYw5Jtaz1nHKxQRGpTzN5pkMyut81yjhiaEbuSspihKIcA3Pz
         Qh0qfL73nx2jnLeImMersO2p1JriP7aY8x08iPBFo2zOQ/zzJV353+PrfArCbML4EhQ/
         zX0zkHEryF56T/QA2K71uHwLPU7kXKk0fivFt6hp4ysAdT9fBxJWl2EHkIFiahMaoQvD
         qWXyB4RK3npbeMNQ7qc5IcJeMM95bMIi72WshGbuj2K/ZH7xAO96ecCuKffogOoDIQ+x
         cWwL0isF8tstP0WVVwUHw1bbYHBYb1TkwI4zIXQQ4zDw7D72GBaIOV6+gjcaP8U4qdK8
         hAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944950; x=1784549750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=TSGLJ5zn+T1MYaYBYHXzBlinRMR7awZHmIDW5/+meXGju58ir0QHghvAemznD1sWj8
         zITsR4hfBlQoiQfN07a6FaDDxhph0FibOmPqIVMYjF4uOV07VwgaAkiBR5Ox3riQv52T
         nbYJG6lJR6FKTt+EBC7++x7aHgXopcjRHv4GOxWkxtdsjPWeZmII3I/OlBS9ujbq/xfP
         5kZ1fBq1Zl1PgROMRhI7BcSDkAOQTy1gHj+nfr15oFZGS4xDLAlZBPBoWQ/48FF2Z6o2
         eK/isexvLvQ1K6ZmIUEH1XC4dBffR4GcrrU4mf/yhC4Svhoe+JaoIll6zOhv8Ej2S+Xh
         ratg==
X-Forwarded-Encrypted: i=1; AHgh+RqJ8MkVngSM0HrNkZxj8a22uRTiENDPb223XjZe0STyYHM8v4wR1M+hJ6J7zLRnVatxv8OyRPmgaHv2@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgZKLj+b2s9wq+Hn7MOlcaq1e2eICFtZCJI75fA/fb2aj+01C
	EOMakB3+Blm0ObhbtfuGLfUtyWjNsPulbVOCuBJ/bD3a82QGcRxb0ddstCZ4GMfayV++If80nhl
	DmiXMvkJYHKxLwDEfU6xc4qWiBhOYAl8eeDiLqfeYFp+6il/5jGWjnfzwUo4KedyA
X-Gm-Gg: AfdE7cl+Gb0LvVxxSX/CJd0p0q3Cxqk7Vm8WewlpN2IxmjlYVQgqxuyv200Z/7Rgc17
	tf01htKTPJMbEidAwtyFEvgHoAb/Rl+NgXpdR7pCfN9pmBQwWW+tH6KpTwZSmCW1ouirtF9UCui
	f08wkyRcGHGzR3VkxNBFDPDuAW+Ldv0+gNo7GSYYhU+px/7Xxzzv//csFOC56VL6mtaB/UAx9G8
	dM0dZO2Dp/7jpU6xvr9eUKZt4BnXlyLJG1ZyQV+mXTrh1HtjHQo5eUCYIhy+DwFczSSqYvhgiMC
	TJJKlGLGlpFKFqPARE5mhi6rJoOBLYvWsM+QokHfRoYTdrdBKPoxVpzGK8QLrThWVl4WvpKPYUF
	Z7SobTLpEEhIg7bUdULR6FYDGK1IDNqoPsE8xQz6S
X-Received: by 2002:a17:90b:2d4e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38dc74cf95bmr9012338a91.13.1783944949823;
        Mon, 13 Jul 2026 05:15:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4e:b0:380:fead:448d with SMTP id 98e67ed59e1d1-38dc74cf95bmr9012311a91.13.1783944949430;
        Mon, 13 Jul 2026 05:15:49 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:49 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Mon, 13 Jul 2026 17:45:18 +0530
Message-Id: <20260713121518.2724474-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Y_dW5t7a30p4v0R7fEtjdsp0y6X70eu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXwpInZhR7tyOc
 rZ/nEnFWxXe67Nt6F50xL6RHIGfC50qDGoO4RbwQN2hOq834Wt3wMslgu0+xoF3DuR4CIFSQ8Nv
 OeVq76nUWwTgDyIHPrqrzG7M2o/EYxGH641pm0618aNEJnQhOZ0JknZgWeiiusDX5LFlF+LtRMh
 YRHpm29Hs9YyPzizJS+MyWAqaDW5+2qnZqUmIYTWcxtRtjL9ZT9PnWkRZ5P0J8PoswSOXmQrH+2
 GxcdhKlf5a5jgdzLJnimhdAyFgSfsFsBc/iGh85Czce9rZQKbZDzBsxQI4wBdsCEtSm+3uC06Zc
 aozczoMq9L9nBDqY5dwBf/Zsfe6oSr0VHIfEwIgYoo19JcUpgBWEbeT22SSpo9SZYkMsVqke8hR
 XE9huRQOcQ9zNRF6rPzhsS2deKn3moJbfSO8pz3M4DBIH8xLnb4GI+oHAeNgn9bsZ3AxFmgDDAJ
 +5JNxOXnYZRCsqOggLw==
X-Proofpoint-GUID: 2Y_dW5t7a30p4v0R7fEtjdsp0y6X70eu
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d6f6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXw/bWVIngWb04
 P3CEalwWuDNmXDjr6OoxVjgqmEtBmCpsd4TAQKHxjWJbRlag1nea0HrohOA6vW6X4VpDEMUyGmc
 4evx5qzXmM4aCOPJ2FuG4hrALIcB3Ig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39978-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDBD274AECA

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


