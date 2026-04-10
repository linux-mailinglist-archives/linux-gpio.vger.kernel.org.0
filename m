Return-Path: <linux-gpio+bounces-35006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJY/LfH12GlJkAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:06:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198A3D7DCB
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6A97304CA40
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E9431064E;
	Fri, 10 Apr 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUFdD9cW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7cBedpF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C443126BF
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826309; cv=none; b=JHpN87mF31v3JCnHeXcXi3qwjjQ1sU2ZgTo3do1KqKmQT+YhP8s9WSm1OGQ2TaE7h9Iu2eJmCG2E4bmzO1Sd6QtjdZlNcmp2kbv1ggmkfK07W7OpP108fSEagwh5uRA7+IKc8PkYwLOM6wyeJAjYhE8QeF2kDSJJsqPyq9/su8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826309; c=relaxed/simple;
	bh=EvA7w829n8mfXKvoaEE6kQ0QFggTU+hJ+TQqAlBd+d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7alNak7u4HCg4Rz0wdiVy4sledLWelqh8eEslLTNp/10B29M+rpOxy0ltT7VaBXvzyL4T3+hmRmYh/wWxODOdruvPsUMw94mnH72RKy+qANQTVeTj8vBrcYqAf+r3oCMu4WAI/M7GOpykuJasL55NTXrlf2Axk5IIAE75adpXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUFdD9cW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7cBedpF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAVTxo4148365
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=; b=AUFdD9cW86OQdh94
	7OBGt4yDg/qFObzLKy+SR5bZL2l2QSLYO7XxeCMZpKcrFaBHIlCxLivn3TvriIw7
	kJwN0dRNbG7n9VuIZ+9dR8VSt3a8uNiTQow2eSDYi0U6yLignMOqz+HQ9lQCwoj4
	ju5yp4P0/i0iEY/2BbUReRiqCwPxAvCY7Fga5+mFbl3Ju8L2uD6bHTxszMfQalUu
	Kv5KvsEooy3iLqkpg5Agi8B4TvFJkS8FfkViMJXSBl2kENsrMrPUsI8NOrmAUCnZ
	Htwb3v+loRoQ8O4yAYJyQ/d0wEddBTBSX8S64sLTLfiWD/H7vyeTF5Gw/kx+iGIX
	ek8yCw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudghe75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:07 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-68c2c523fbbso901397eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826307; x=1776431107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=Z7cBedpFgW3Dz9gi6bu0shQgZVQGI5zpAfQdjafjWpDnE4zSLcyvGkMoc8iT9Ikqgr
         mYkM6hkldHEzo0an0Y9qe48St7y/ByVw1uaMU3dbyIH+bJnNT+7b44uHt7BMv7rjahVr
         CBXDKtzWLzvZGTs1a3mdsFEdl3+X74EJXD+uz1HgfVXNOVuZLebeeTh61p81osFsy17l
         6H8DWtFOiMXEqD2HCy0v8OyTaJnQttQ3MoIxyO1QwpEDLGB4J326N1f/UgU6GpdPOPlN
         zjPDmuE7yn2X1K8OaFQt+ixp8ZGI3v9Vz4SCMf4AGK8bTeaqtmmJFMP/6eouYqC/sQh6
         ts3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826307; x=1776431107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=cz03W72gCBeuWZlIYheGBGsXY0XUvGlH1VEq3fdGERLSQxeDbhjunUscVzIu8dO/kz
         vI+ZuTEuMbjcOv6+xuop1qUS92I0JIug9gZrIxjqHe3gPUfwZj3AhZdI7FqeaI+7rNBs
         jvIbC9XAjob55TdA9pz6qGct8gO3CQYi3HBFWGrQwuBd9RQzfFdW9ZcNI9f777OaYE8y
         M00c4R3CndHbn6ZZ7wvR8fDRyCN7n9t/BskgdMYVtzjxdC3Z/w+2xuEfQmvxgX6BSqoG
         UB4v3vu3oiM/FEXCIR6ZhwdWV764h3qA6hQ0TY8SY2bviqjneVmbmNOcum29tW+xMLz3
         3MlA==
X-Gm-Message-State: AOJu0YzLL0uw/+15/cqFg5fWrV4bZlkhidh4GZZgtz5o2eEnKWo5jJgy
	Su1TDhcAjasoDB0E3d8tC9LskpSvsXuNO3En6x/KPdDTc6rwXPhaxGtc1cF/hMt681CbVD8jNUP
	HicybiCZyPyhMidfWvKfgj0kcz7Q/NfQQWT7iSoeXEKEiKGzT4Qe8+0xIJgQQSKvl
X-Gm-Gg: AeBDievKp3P+z/N2blkZ5fszJBvYRFo5UJt3ybAhIUgASJGOiPpNLU3T1+vl654ZFRR
	DeuzyAyO1nQEmhHRg7kCCNOSrQ/i9iLXIsx+7FyWMdH1sX5KC2yvwrgd6hpXGRNA8m0soKl9avC
	IBZh3wDZpyxwnTSWJF2FVJE0Ewd9xzRTiwthR9oMKikvy+FNtRSRaBuNt3dU/TMGh+2xW4hRkrx
	+gWDYPhEKIusujVItAcpebgTVHWJVIYMml8Fw/thwMN/1v/20gv4jO2y6FJM7YcpuVwYM71E6it
	xl6zU6IkWNyotYqaB6VKMbPyFfZVKqVTpExYaUZty6lD1y5GtOY+yYj3JqvdVXvmzJ/KblwEvu1
	cUNoz5D32JviTfH74JHtmPudI/t3lSgz+t95IEYAMpAQD
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442391eaf.20.1775826307035;
        Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442333eaf.20.1775826306490;
        Fri, 10 Apr 2026 06:05:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:56 +0200
Subject: [PATCH 1/4] pinctrl: realtek: Enable compile testing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EvA7w829n8mfXKvoaEE6kQ0QFggTU+hJ+TQqAlBd+d0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV5fURTv69ctIJObouydnGfin2qlcPP7k+Jz
 x4cFHxLp8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eQAKCRDBN2bmhouD
 1wzwD/99QhlA+5EozhSFiPpos/E8vIiz3LaiJBgNVAsipLyqXnfxXpkr+HGaE85fbl7IbeyQDzC
 9JgbCq4S288BgK5gKMnwxpaMLaPFWZqqoxC7r3CDwyx0QBD18Z7QxzZthXJH7btlnWYMCMiSdNc
 bS4IUmzsU/neeqaMi0pakxgWRf3iN1NRW0JBx74RFxa7w7PvHfwMuei/ENvGgkmfSgtI+2AATZi
 SX2dHL55y1Y1VT9wEJ3CX4os9kBOtHTsdXUOPnY+/FpolynFHMZ1ZJ+YLY/PHDNilVYxtd5t2h3
 1PtVdHHTy/HqetoAsmVH9Pm79ld4RSS1rw349IKF4CjqnLyUnyv+xjItYjW42SBerN93LoOWIRS
 M7nrOHnJgGlIfVkoPxBS7/eGNgls2vDogY6R3pA9yncikato+ONlrkwivCrVhHRGx1EJvbL/nT/
 guxKjxhfsGNjpwgl9bgmzN536jwl5PL4Q0l9XfPVoZq7Owibj3iL1S9b+1lBHTL2B0PwoLc1Jf1
 HgQIlbkFmfboCrOKvXa+oMQGJP1TX4S1dL3pRmeuH9lU4p/vBS6WuXSHEAlolurGqeiCpaVjZyz
 vpmu1Kc59HzyiLLVSSiXD9xfVzbFuJeSR0qKZOkaRd/zTVjrA2H2IKs+NOajRoJB/QOfjXm8oh0
 qHiKBZcbERs5xkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: LIzGTb2P4D3T1GBt1JhxxAwN_5XtVcUa
X-Proofpoint-GUID: LIzGTb2P4D3T1GBt1JhxxAwN_5XtVcUa
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8f583 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JDIqfKjBPsxaAJzGQCsA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXyMTNEeEQfSFy
 a/Q1x82zFLS8sxAX/GZEQflMBRiv7ho8atxwo5oMF8qfz+rHgu/kChu/yHlUO+c/9bBfEUYcWSF
 EoIh4fYQ+dzgo+UwuZhCwxHRt3urUAvChCuVtp1rg5tsZtj9u3tfMGXakWrozAGrOwCjXQTxH3u
 wd82pvPrgsTybSTz+s6wGVlUiRdivyvComTl2UoEG8Cy53Nh42BWHhf8a8SpuES/CEKL4P7sMJU
 /VZRwwrHWT87g4bPjR7YnHRhBPlbRuvSJof1i9TUrWqPyEOJ5+R+tORiz3McgF2+XsXHteBA7Mn
 mMYhpfNaoD+fM6g6Se9WK8Bd2lVgJ9NGkGgsLtfWuQpegLxt3HFKT5cqS3Vq6mo0j5yy8X282KN
 RGN4+99dufPu1FqMvM5ykWdql31eGwIGO7aPdhddLtAO8is/FJgZVzM6nD4wLxUFVbpZIpPIwDo
 DYftv0R88ynsSYy9q/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35006-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4198A3D7DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_RTD uses
pinconf_generic_dt_node_to_map(), thus needs OF.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile        |  2 +-
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9d33fa28a096..b054cfb99348 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -82,7 +82,7 @@ obj-y				+= nuvoton/
 obj-y				+= nxp/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-y				+= qcom/
-obj-$(CONFIG_ARCH_REALTEK)      += realtek/
+obj-$(CONFIG_PINCTRL_RTD)	+= realtek/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
diff --git a/drivers/pinctrl/realtek/Kconfig b/drivers/pinctrl/realtek/Kconfig
index 054e85db99e7..a156c4ef556e 100644
--- a/drivers/pinctrl/realtek/Kconfig
+++ b/drivers/pinctrl/realtek/Kconfig
@@ -2,8 +2,8 @@
 
 config PINCTRL_RTD
 	tristate "Realtek DHC core pin controller driver"
-	depends on ARCH_REALTEK
-	default y
+	depends on ARCH_REALTEK || (COMPILE_TEST && OF)
+	default ARCH_REALTEK
 	select PINMUX
 	select GENERIC_PINCONF
 	select REGMAP_MMIO
@@ -11,22 +11,22 @@ config PINCTRL_RTD
 config PINCTRL_RTD1619B
 	tristate "Realtek DHC 1619B pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1319D
 	tristate "Realtek DHC 1319D pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1315E
 	tristate "Realtek DHC 1315E pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1625
 	tristate "Realtek DHC 1625 pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 	help
 	  This driver enables support for the pin controller on the Realtek
 	  RTD1625 SoCs.

-- 
2.51.0


