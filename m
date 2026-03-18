Return-Path: <linux-gpio+bounces-33723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFH8BVhlumklWAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:42:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A712B83D5
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E00E33034C6F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228A436BCDC;
	Wed, 18 Mar 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8N+i14x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aC+jwNJs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1E38B7A9
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823231; cv=none; b=BEhDvMb/shxSxuBN6LmVZTQzTQCbRaZpzCye9FYoWqorE0dtUSTsPilf9zhlf+y1VyvtEh5OemNGojtCZx4bjVbJTDY4vBbyGt8sC8kPZwQ8R/pOkiGC0OqgTRyfZR9R95osvP48skh4VSHQpDVjHX5Co8aCqkoaURuI+iDcoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823231; c=relaxed/simple;
	bh=dy2TgZcFr9/VB3bkmaus0Cw/gHd5PPq/I0Ed7LWpshY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyqmBW425jk8MDWRTfRanQT6C7Cdou3+h3VM/5YS/klmw9zV8Mq6qwmMCgCKH2VILNcdGRacHHLTeVsB1AUnoJBup8om4muOV1AgJsm3L2NQYH75JQ+7ZTIP3VVBeNw782xtcPKQ+gagwa4WJf+ML1LkjyG+X08wVgsIPLkZaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8N+i14x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aC+jwNJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZIix2878124
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=; b=J8N+i14x+44hohYW
	keV7et/QjarduXc5TfZsM2CERCjRPGwTkDcoi7GKWkY2pbzkVulklifoHG/kYyrX
	nkOej6koPxwZj2HeVvNcc8PInJOSuy8opM8R2JXk4aiadTU8v5YdWEGh9nhkYaRT
	yiuzQdCPu2OPc3Ht4P/eimhQHI2sJA6gMaTi+GIugqrkzM4ybRNyHO3VneLDmqol
	+6VKitcRcOjG+N+tIInExX0CmK3m/j7HP4BRFKxCOaFtg7VE32wqpuAOMM3NEySk
	myuM0p4ONTx5QunPvRUYyH2euaC/2FNVmj8XPpM+V4XuqmfcYA9+gCFD0jdiJTbN
	LIfyQA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr0jge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 08:40:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b6b22dabso3111986b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773823229; x=1774428029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=;
        b=aC+jwNJsIc/GyHZg2RCtFnvrECD8IpMbcdwD+CDLH/oHlE/g1Bh46qykUf4LfA4+vQ
         EQ5Kwf2YAl/ofavB2tQ8YioG0DBLQeDZF77H3d0iBvYpEuDH0UZmJ4KIj+pLqgzvUoVM
         xCcY4oLQCK83rOrcZnr5yXmiPSw+Q5zFcSv30y1kNdS9orQZePsR6jFB2hWMNZ2mg9HJ
         z6y4Tnh3MNWEWVS04KC/F1bOX+FrkTwFCn9Wzzyit7Ej6RoiHVuKwYhJlJU2tb2eQex4
         vudeFqQxlh0OdY+kcoqf25MgeEalnjFHM3Mpdx81aOMMTzOQzIMX2zqwL/BEbVuZQvci
         yRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823229; x=1774428029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IyAv/fUqxS1bjhIsyOH9MFeZHeI00unuuOW8vGV845I=;
        b=JwhvOR6yIvPW8ycRwKDUi2cBei2EG3NXl4oJGKIldfnmPYN10DwW4caOd7MamPWlfh
         DJwhSYW7PwEqbvkXvwyqDE/6oA/xAp9Pi7s7GuyTtjnUm8ykdwyi+yidpgFA0KeNTXl4
         zTDxCfgPsLLq9FOy76TxvXNtTRuuXlboSFUPkCtS40XO87ZFwoJPV4yuIBjHEkYSk6OO
         E6+bTAEDN4hViBUoUs2BBLKEexcDVuFqUZ8R3X4dvM0tf4D+Q9cKIY6lQkAcT7cpKLVj
         1K7d7gtKPwr07ZFJTP7u6PlommOVm5tZT9cD6PZJEsQemrAf++xjduqYBampocgnWdj7
         DcuA==
X-Forwarded-Encrypted: i=1; AJvYcCX1kfqWUOwQLqAgZZnhhrahGrlv5OJN1yBPC/hKkbyDzxc5wSiz7kGj0yWcJ1p6seKMRuMd5ZPeY4Lr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6xazvKeTGtRqWyiFpOszk7LsB99IOVsjuh4hEIqP/bU3mx6Q
	Hf2QLpS3UlOJk+9Hx+eBDOpLhnT9sdZi3p4zLfwxp0jmq67gdEY/AiHkJ5Vvia4esXqBIdXfX3x
	7OkeE5YvYj7gvtxD7r3uONgGHUpGjeVkj6dfPr0wffybyYp+q/+Xl8nDqGI3TfGTHXxqoc+jY
X-Gm-Gg: ATEYQzxvtxsmzYJX018jGwy3b49Arx2iHC7y92bC0t4PdxUpVuSa6Ne1rSPDkU8z5qC
	IQv4JOqewdJaHr4XHitLfhIKpGIWmELAOIH4pbT7qIMTS2k+y9q47cdf8yQ8iE8oamz/O81CVqs
	d/O9lseR8L1BP8cbzW5boH0h1/NfxSuGwAKYw2AT6KTFTjKMk17gvBJ9PLUgTlpQC718GPqiaYL
	s8dvEQyjyGM/gXTJ8PYqVbIPAlosgZVCz/4V4+4QVB8ArovFxxeXaOaOjJdMN8KDnL30EieSBV8
	pemGTJTctpVZmjlYpgmU3alJnJAY/z8WJ1OtBVwbEt9GAgXksJLoNN4fHxML7FMp8rs0hINAFEx
	ITiyBjyc/lRAQMGT1barlsBWsA+YBDHNRgJ5YdVmdkFQNw7WFdYxFXSHEyajyPPwXVxd2fHTXug
	S8Lje5y3mxD+nvi7pAVdukDbYpyXCAtyR0k3J+iNTad6TCzgycxp1h4Zc4
X-Received: by 2002:a05:6a00:1f0f:b0:82a:110b:e216 with SMTP id d2e1a72fcca58-82a6acbe2cfmr2308859b3a.19.1773823228949;
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0f:b0:82a:110b:e216 with SMTP id d2e1a72fcca58-82a6acbe2cfmr2308843b3a.19.1773823228497;
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbb2802sm1863498b3a.31.2026.03.18.01.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:40:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 14:09:48 +0530
Subject: [PATCH v2 6/6] arm64: defconfig: enable IPQ5210 RDP504 base
 configs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-ipq5210_boot_to_shell-v2-6-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773823188; l=1056;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=dy2TgZcFr9/VB3bkmaus0Cw/gHd5PPq/I0Ed7LWpshY=;
 b=6lprkFKodzP4k0sKVzjKf00VbCzbGf50y6WOPChoRVJ34fDSoTqdz3WKbqR382Ul9sxVyiaZR
 aMiW+5nuamxBRio0eXil4YZ906KsuyUNtmTwVq4BzqYpUJQ93OuLzOW
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba64fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: MnGJUcWZOVRCi33tOfPWyHNOjNUh3gzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MyBTYWx0ZWRfX6SHtapjBh9Gk
 Y8RxIFHlIBn/GoeeDP/HIwz5imSCw6irR9rnAilzqfRwx/GW4xRnpvDaQIMgKdU4q20D92zFgDf
 TZiNNRPeO60tIhJEKU8/njE7te5QwUKoEdijEH/Xb0Mk7iA6+IhNAH2dBNGap5ExgYTqw5SnIU8
 g5X3mlChlE4kHpRtEYj5P4bNtY9iXKoa41gU3cSNUDMHNYyXaO1Y8v6Ya+Drsbt0LzcB/P3TKPZ
 Vizn5rKhT+Y65qLXNDzk/ixmk6QGhvzbf+3HG+S6n8d3ePq6mO5jrfSwjP2VzNIAZCHcWxO4qud
 60V6zuH4r7HG3SV62vsS9hHVX2SC0WRd9kKXbaojEufck3arZdhVz81+MKTNMDxjJFSGd88xCQe
 RrVzPx55xTw/Lg9W4ToX23GfeiJBo0K8u0IInAT2Xv8sM3ElrkZCgZQCvftlXC+XyNZ9wFBQl8k
 vAjOWu0NDRq0Wu4vCEg==
X-Proofpoint-GUID: MnGJUcWZOVRCi33tOfPWyHNOjNUh3gzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33723-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
X-Rspamd-Queue-Id: B9A712B83D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable GCC, Pinctrl for Qualcomm's IPQ5210 SoC which is required to boot
ipq5210-rdp504 board to a console shell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9c53e74ad5caa492bace394e4fde7..ceec9a109f08f2a2a4f4090e92c228279509c3ed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -649,6 +649,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
+CONFIG_PINCTRL_IPQ5210=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
 CONFIG_PINCTRL_IPQ8074=y
@@ -1479,6 +1480,7 @@ CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
 CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
+CONFIG_IPQ_GCC_5210=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_5424=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


