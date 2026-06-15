Return-Path: <linux-gpio+bounces-38447-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NpUjDRSjL2phDwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38447-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:00:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73708683FFF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:00:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ftv4Rfye;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=APS9L1JC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38447-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38447-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0281E304E6EA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 06:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CFB3B42E0;
	Mon, 15 Jun 2026 06:55:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9143B42F4
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:55:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506543; cv=none; b=TlBiw+vbpUWiG6dnogQLohEPYOrbJ4vD+wJ5b1iJYkmrBUedgPxY/pQ/siUesCJQkfGNBdS8XFmiqNcz0cWEF+dhcUqij8BFZo7SB46TkaTRJbffRmf4iNyeuTVemzoIqUgmvmnmJYIVpFEJG+X/DUw7lkNg95l9yS+bHfK4r0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506543; c=relaxed/simple;
	bh=jCVUbTJ0yi4hswPb4p34jGfkn68jSAT71oWpfc+ucr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXnlrwcIVWUnBDCCkDeyskW0OS428hDYSVdFiG/igMBmvU3zCmobqMnzLC7gI2FP014gbkqUG3MIsuceXRgcsXdfJJl4AOH6l6kgVcNX+reIuW+R8gQzGHej1f8dF9jX/nMq4VpmPMuAcU6I4iGZq6ylfdJnTKMIqdlpg54YgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftv4Rfye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APS9L1JC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Li9O3853173
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZyrJ6gM5ei4ruw5AwMI1Q/WIQezWNWQyPMChQPkjuvs=; b=ftv4RfyeAaXgSTah
	6T6G7AF+2gtp6NAHyjL/S0GMd/Ex0vDImjlRDklF4JWqn0vA5IJkTv00XIUJOpIe
	FkRMbp1DvG3NhMlqEb3+fnXoVMXoDIwhBzUdzVh7rhEjR7Mj5zKFFYgY5Th/8qu7
	w5gHeddcy5NusCV4uv1Cma0cm9BbO++yTAg28JuZVR6yXNKT9ZITTBSKU/4JBvqv
	VA7R2Guiha48Fv+Ux543srNLb6N2FKuaMRJHMNOOs8UgEK8AZuAnx7T4KwBNRV3J
	BlVLHLT5ddiB3sOGimr/VT6KT6hxuMF10VcGM6/MDESezyLpT5H3n7nIrz9PilZC
	93dRlA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gx4k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:55:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so4801781eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781506537; x=1782111337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyrJ6gM5ei4ruw5AwMI1Q/WIQezWNWQyPMChQPkjuvs=;
        b=APS9L1JCF4OJJR5zcfWXEMtInsauKRszDnmDGepK35PmOraMMptM4WWYqAtY+70TGG
         W/7JzY9E86HaG+J0vSHIY57VkoL3UM3fC3qZnt1XD4JY1OODAOtC60hqoeR+2K7+/hFD
         Wnj8EMFLSMVFbEP4fzx78ha06zNBFJAkz2QkDeY+edWeyF6KuCfO66/Ihq4C4q7UhMsN
         KOahWigfSjgKRdyOU1Ge5t1KZPhvSWgyEBLfFMA0iiGvzyhoIiwb8Eb38YDNSGvd8Mvj
         99GSuhgAJHe+WdSqqphtGoYGqpCKC5aD5BYnCkVMaQg592dZfe1xscp7fBEbgInlWVMP
         ZxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506537; x=1782111337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZyrJ6gM5ei4ruw5AwMI1Q/WIQezWNWQyPMChQPkjuvs=;
        b=EZxxeDtiv2EmWGjiG97UHJZElZJfkmijyJLaH5/MP1Cz16UHp6+7BDTvZOyGpyJKQF
         gC2DvJMEEke96BdEx6oBsdJ24otuIYJgThwfuVMN3bs6d81eMSDsXq2+bdRS2oBtyTrT
         9Z1upddzjOqCZ91SFtfpNSdrnJPJiGxUUX68y2bzAJAG6sZ9VUj2smeD6Ij/cL1QsHez
         EtpH/VNBylKAXXKLb3qifQFgJGT5GfIAkNUOUUnE0ALJ4D3cbltJ0MoVeOcKVjGpZiJe
         M+BjfPMmvw3ONXs9utFKkWIyFdGxBrZShtUVoyUBAW/9Bsd4dPT2gdjKPEVAMuJdezlH
         a/bA==
X-Forwarded-Encrypted: i=1; AFNElJ/B6eKmb3XB82mo1LcEalMBEZRj9kGqq8sAKbwPQ9QtrSM6w/QLp2Lc2Rd0VNTVHseAWSyp/nymESlp@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9ZRPUroe55K6lhP+9kP9Neagvi7Bx8alRcm5nh/nt7sjmhUg
	duM4i+oxKamILATXKEnDGQVjOCY0O0QJ+b0QTpUlBDHjFmTG+ZsCB/KQUW056BWFlgwNOov4KBu
	8b2aQsiPiOlZmd1ZaUeT6aBDfSX7XAvy4LkwDKiHGNhIbyBVKQP8NTZRP7egXnzB1
X-Gm-Gg: Acq92OE6ru7T9NXzHIN7vFpfspVCzSA5I1kauftC4ABnJPVXHEKtQnQq38GhP3IwgG4
	gKVRU9YPhMH2HWpNjvs5DjW2xlMnTvkQWysxFcbSlcs/GlVJkB5rPf7BSrYfIh6MbsbEm1dNjhB
	qxvhem3/pT5LOFdstHHKZI1y9jpl51F7GR2yHZeXJ/pTEo0iCWIVIfZLbcFaj4etB7xswDXD7DM
	3yzJl1vFeWY3qQfpi8GhwegYcyfT/vo+zahvBU8eMtyu4aZ4Oq2MrLFoqUQT2hAKdQuu6sPUeoU
	LNkxSJQwVQoeUPUSYQOzScMPIRwuSBOr//Pl3WRQ+zxU0wWpLrs4y0DBkmm5vkNQ7KrOvObIdXG
	9xUVf1bz4bKDavg4DDgCB9KFOgxw6eLCAux895pwcQqV7mZJodYUKG+n8H+PIUyVdlk5RPhhl
X-Received: by 2002:a05:7301:9c8e:b0:306:f474:738c with SMTP id 5a478bee46e88-309367670d0mr5148479eec.13.1781506535951;
        Sun, 14 Jun 2026 23:55:35 -0700 (PDT)
X-Received: by 2002:a05:7301:9c8e:b0:306:f474:738c with SMTP id 5a478bee46e88-309367670d0mr5148453eec.13.1781506534969;
        Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm14915174eec.8.2026.06.14.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 23:55:04 -0700
Subject: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
In-Reply-To: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781506532; l=59570;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jCVUbTJ0yi4hswPb4p34jGfkn68jSAT71oWpfc+ucr4=;
 b=8zAYi6/GEdBwuu2l9fJCLwazagCXvtlNanQI8GeJS/iN5V9lKr/Ch5HD+5RIkXeLTyutWU6AC
 yd1aOIwYLyFBwVe2ey+VLFkS6rRs3ZmiPfAt7sx8ZP8lC8OBp8Aiweu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX4G5QwV9kQ0M2
 K35TcDP/MZVNDq7NBi2AP/GCQ8QC2i24BxWvjaPzBisw6lpzf+cD8qtUeYI14KaHDMWFB6o8t+B
 JFSOm4WP9ioaaY2tP7Kiv4EHkijXCKI=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fa1ea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ExstbVCCFKdY7kyAwbkA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX+W7PeAO2QaEd
 Eujvn2D8xxCTlVPKC+4w0O+fkTSeWpZ/K80YaTrsEpEC5d6dd4zpjlVWXWeHRhCWAd1YgYW0l0z
 j0lPsKgl+btLgal8ushwnfrfsAcdTrO7ggiV90YHHqFCmKvxJKRt/Pv7/rlg62LwQ6cEuU1RFgA
 jyUgLQFLihmtpcs/hNrodcZ73X/VG+L5MJbfbnwPas4bmkSFSRmwD2MBKd2MVHr8zP4F9BgwXZN
 QkmQwuWvc5GdkXsPWD1eX9WNSC8KM0KpEJ0TbDKh9wxwTezNGmR60jn5zOWID10WExIi17AzTDC
 wjysD8Ezchd/zeWOXcXTIoh8GRR0KqbQQS0HhsWAzidPGF6l8lLariJrPKXIXkeFE7YSjWTWhJI
 ULWzX31g9IFStDei+qZoutSDQlGy82PcIauIFRmduSBjb/YpQmcGOxfyhWn9Du5ag3Ndh8A5S3X
 hDTC6sDvR+1U3VjdeTA==
X-Proofpoint-GUID: lUiyL7XsrZRT_CBs6e27NrJgN9COAyko
X-Proofpoint-ORIG-GUID: lUiyL7XsrZRT_CBs6e27NrJgN9COAyko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38447-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73708683FFF

Add support for Maili TLMM configuration and control via the pinctrl
framework.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm     |   10 +
 drivers/pinctrl/qcom/Makefile        |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
 3 files changed, 1641 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 9409e678ec6d..42875457b5fc 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -153,6 +153,16 @@ config PINCTRL_KAANAPALI
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	  Technologies Inc Kaanapali platform.
 
+config PINCTRL_MAILI
+	tristate "Qualcomm Technologies Inc Maili pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc TLMM block found on the Maili platform.
+	  Say Y here to compile statically, or M here to compile it as a module.
+	  If unsure, say N.
+
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 93cc4e7965ca..43ecd246afe8 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_PINCTRL_IPQ6018)	+= pinctrl-ipq6018.o
 obj-$(CONFIG_PINCTRL_IPQ9574)	+= pinctrl-ipq9574.o
 obj-$(CONFIG_PINCTRL_IPQ9650)	+= pinctrl-ipq9650.o
 obj-$(CONFIG_PINCTRL_KAANAPALI) += pinctrl-kaanapali.o
+obj-$(CONFIG_PINCTRL_MAILI)	+= pinctrl-maili.o
 obj-$(CONFIG_PINCTRL_MSM8226)	+= pinctrl-msm8226.o
 obj-$(CONFIG_PINCTRL_MSM8660)	+= pinctrl-msm8660.o
 obj-$(CONFIG_PINCTRL_MSM8960)	+= pinctrl-msm8960.o
diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
new file mode 100644
index 000000000000..984b7444a2c1
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -0,0 +1,1630 @@
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
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
+	{						\
+		.grp = PINCTRL_PINGROUP("gpio" #id,	\
+			gpio##id##_pins,		\
+			ARRAY_SIZE(gpio##id##_pins)),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
+			msm_mux_##f11 /* egpio mode */	\
+		},					\
+		.nfuncs = 12,				\
+		.ctl_reg = REG_SIZE * id,		\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.mux_bit = 2,				\
+		.pull_bit = 0,				\
+		.drv_bit = 6,				\
+		.egpio_enable = 12,			\
+		.egpio_present = 11,			\
+		.oe_bit = 9,				\
+		.in_bit = 0,				\
+		.out_bit = 1,				\
+		.intr_enable_bit = 0,			\
+		.intr_status_bit = 0,			\
+		.intr_wakeup_present_bit = 6,		\
+		.intr_wakeup_enable_bit = 7,		\
+		.intr_target_bit = 8,			\
+		.intr_target_kpss_val = 3,		\
+		.intr_raw_status_bit = 4,		\
+		.intr_polarity_bit = 1,			\
+		.intr_detection_bit = 2,		\
+		.intr_detection_width = 2,		\
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
+	{					        \
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define UFS_RESET(pg_name, ctl, io)			\
+	{						\
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = io,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+static const struct pinctrl_pin_desc maili_pins[] = {
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
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "GPIO_151"),
+	PINCTRL_PIN(152, "GPIO_152"),
+	PINCTRL_PIN(153, "GPIO_153"),
+	PINCTRL_PIN(154, "GPIO_154"),
+	PINCTRL_PIN(155, "GPIO_155"),
+	PINCTRL_PIN(156, "GPIO_156"),
+	PINCTRL_PIN(157, "GPIO_157"),
+	PINCTRL_PIN(158, "GPIO_158"),
+	PINCTRL_PIN(159, "GPIO_159"),
+	PINCTRL_PIN(160, "GPIO_160"),
+	PINCTRL_PIN(161, "GPIO_161"),
+	PINCTRL_PIN(162, "GPIO_162"),
+	PINCTRL_PIN(163, "GPIO_163"),
+	PINCTRL_PIN(164, "GPIO_164"),
+	PINCTRL_PIN(165, "GPIO_165"),
+	PINCTRL_PIN(166, "GPIO_166"),
+	PINCTRL_PIN(167, "GPIO_167"),
+	PINCTRL_PIN(168, "GPIO_168"),
+	PINCTRL_PIN(169, "GPIO_169"),
+	PINCTRL_PIN(170, "GPIO_170"),
+	PINCTRL_PIN(171, "GPIO_171"),
+	PINCTRL_PIN(172, "GPIO_172"),
+	PINCTRL_PIN(173, "GPIO_173"),
+	PINCTRL_PIN(174, "GPIO_174"),
+	PINCTRL_PIN(175, "GPIO_175"),
+	PINCTRL_PIN(176, "GPIO_176"),
+	PINCTRL_PIN(177, "GPIO_177"),
+	PINCTRL_PIN(178, "GPIO_178"),
+	PINCTRL_PIN(179, "GPIO_179"),
+	PINCTRL_PIN(180, "GPIO_180"),
+	PINCTRL_PIN(181, "GPIO_181"),
+	PINCTRL_PIN(182, "GPIO_182"),
+	PINCTRL_PIN(183, "GPIO_183"),
+	PINCTRL_PIN(184, "GPIO_184"),
+	PINCTRL_PIN(185, "GPIO_185"),
+	PINCTRL_PIN(186, "GPIO_186"),
+	PINCTRL_PIN(187, "GPIO_187"),
+	PINCTRL_PIN(188, "GPIO_188"),
+	PINCTRL_PIN(189, "GPIO_189"),
+	PINCTRL_PIN(190, "GPIO_190"),
+	PINCTRL_PIN(191, "GPIO_191"),
+	PINCTRL_PIN(192, "GPIO_192"),
+	PINCTRL_PIN(193, "GPIO_193"),
+	PINCTRL_PIN(194, "GPIO_194"),
+	PINCTRL_PIN(195, "GPIO_195"),
+	PINCTRL_PIN(196, "GPIO_196"),
+	PINCTRL_PIN(197, "GPIO_197"),
+	PINCTRL_PIN(198, "GPIO_198"),
+	PINCTRL_PIN(199, "GPIO_199"),
+	PINCTRL_PIN(200, "GPIO_200"),
+	PINCTRL_PIN(201, "GPIO_201"),
+	PINCTRL_PIN(202, "GPIO_202"),
+	PINCTRL_PIN(203, "GPIO_203"),
+	PINCTRL_PIN(204, "GPIO_204"),
+	PINCTRL_PIN(205, "GPIO_205"),
+	PINCTRL_PIN(206, "GPIO_206"),
+	PINCTRL_PIN(207, "GPIO_207"),
+	PINCTRL_PIN(208, "GPIO_208"),
+	PINCTRL_PIN(209, "GPIO_209"),
+	PINCTRL_PIN(210, "GPIO_210"),
+	PINCTRL_PIN(211, "GPIO_211"),
+	PINCTRL_PIN(212, "GPIO_212"),
+	PINCTRL_PIN(213, "GPIO_213"),
+	PINCTRL_PIN(214, "GPIO_214"),
+	PINCTRL_PIN(215, "GPIO_215"),
+	PINCTRL_PIN(216, "GPIO_216"),
+	PINCTRL_PIN(217, "GPIO_217"),
+	PINCTRL_PIN(218, "GPIO_218"),
+	PINCTRL_PIN(219, "GPIO_219"),
+	PINCTRL_PIN(220, "GPIO_220"),
+	PINCTRL_PIN(221, "GPIO_221"),
+	PINCTRL_PIN(222, "GPIO_222"),
+	PINCTRL_PIN(223, "GPIO_223"),
+	PINCTRL_PIN(224, "GPIO_224"),
+	PINCTRL_PIN(225, "GPIO_225"),
+	PINCTRL_PIN(226, "UFS_RESET"),
+	PINCTRL_PIN(227, "SDC2_CLK"),
+	PINCTRL_PIN(228, "SDC2_CMD"),
+	PINCTRL_PIN(229, "SDC2_DATA"),
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
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+DECLARE_MSM_GPIO_PINS(113);
+DECLARE_MSM_GPIO_PINS(114);
+DECLARE_MSM_GPIO_PINS(115);
+DECLARE_MSM_GPIO_PINS(116);
+DECLARE_MSM_GPIO_PINS(117);
+DECLARE_MSM_GPIO_PINS(118);
+DECLARE_MSM_GPIO_PINS(119);
+DECLARE_MSM_GPIO_PINS(120);
+DECLARE_MSM_GPIO_PINS(121);
+DECLARE_MSM_GPIO_PINS(122);
+DECLARE_MSM_GPIO_PINS(123);
+DECLARE_MSM_GPIO_PINS(124);
+DECLARE_MSM_GPIO_PINS(125);
+DECLARE_MSM_GPIO_PINS(126);
+DECLARE_MSM_GPIO_PINS(127);
+DECLARE_MSM_GPIO_PINS(128);
+DECLARE_MSM_GPIO_PINS(129);
+DECLARE_MSM_GPIO_PINS(130);
+DECLARE_MSM_GPIO_PINS(131);
+DECLARE_MSM_GPIO_PINS(132);
+DECLARE_MSM_GPIO_PINS(133);
+DECLARE_MSM_GPIO_PINS(134);
+DECLARE_MSM_GPIO_PINS(135);
+DECLARE_MSM_GPIO_PINS(136);
+DECLARE_MSM_GPIO_PINS(137);
+DECLARE_MSM_GPIO_PINS(138);
+DECLARE_MSM_GPIO_PINS(139);
+DECLARE_MSM_GPIO_PINS(140);
+DECLARE_MSM_GPIO_PINS(141);
+DECLARE_MSM_GPIO_PINS(142);
+DECLARE_MSM_GPIO_PINS(143);
+DECLARE_MSM_GPIO_PINS(144);
+DECLARE_MSM_GPIO_PINS(145);
+DECLARE_MSM_GPIO_PINS(146);
+DECLARE_MSM_GPIO_PINS(147);
+DECLARE_MSM_GPIO_PINS(148);
+DECLARE_MSM_GPIO_PINS(149);
+DECLARE_MSM_GPIO_PINS(150);
+DECLARE_MSM_GPIO_PINS(151);
+DECLARE_MSM_GPIO_PINS(152);
+DECLARE_MSM_GPIO_PINS(153);
+DECLARE_MSM_GPIO_PINS(154);
+DECLARE_MSM_GPIO_PINS(155);
+DECLARE_MSM_GPIO_PINS(156);
+DECLARE_MSM_GPIO_PINS(157);
+DECLARE_MSM_GPIO_PINS(158);
+DECLARE_MSM_GPIO_PINS(159);
+DECLARE_MSM_GPIO_PINS(160);
+DECLARE_MSM_GPIO_PINS(161);
+DECLARE_MSM_GPIO_PINS(162);
+DECLARE_MSM_GPIO_PINS(163);
+DECLARE_MSM_GPIO_PINS(164);
+DECLARE_MSM_GPIO_PINS(165);
+DECLARE_MSM_GPIO_PINS(166);
+DECLARE_MSM_GPIO_PINS(167);
+DECLARE_MSM_GPIO_PINS(168);
+DECLARE_MSM_GPIO_PINS(169);
+DECLARE_MSM_GPIO_PINS(170);
+DECLARE_MSM_GPIO_PINS(171);
+DECLARE_MSM_GPIO_PINS(172);
+DECLARE_MSM_GPIO_PINS(173);
+DECLARE_MSM_GPIO_PINS(174);
+DECLARE_MSM_GPIO_PINS(175);
+DECLARE_MSM_GPIO_PINS(176);
+DECLARE_MSM_GPIO_PINS(177);
+DECLARE_MSM_GPIO_PINS(178);
+DECLARE_MSM_GPIO_PINS(179);
+DECLARE_MSM_GPIO_PINS(180);
+DECLARE_MSM_GPIO_PINS(181);
+DECLARE_MSM_GPIO_PINS(182);
+DECLARE_MSM_GPIO_PINS(183);
+DECLARE_MSM_GPIO_PINS(184);
+DECLARE_MSM_GPIO_PINS(185);
+DECLARE_MSM_GPIO_PINS(186);
+DECLARE_MSM_GPIO_PINS(187);
+DECLARE_MSM_GPIO_PINS(188);
+DECLARE_MSM_GPIO_PINS(189);
+DECLARE_MSM_GPIO_PINS(190);
+DECLARE_MSM_GPIO_PINS(191);
+DECLARE_MSM_GPIO_PINS(192);
+DECLARE_MSM_GPIO_PINS(193);
+DECLARE_MSM_GPIO_PINS(194);
+DECLARE_MSM_GPIO_PINS(195);
+DECLARE_MSM_GPIO_PINS(196);
+DECLARE_MSM_GPIO_PINS(197);
+DECLARE_MSM_GPIO_PINS(198);
+DECLARE_MSM_GPIO_PINS(199);
+DECLARE_MSM_GPIO_PINS(200);
+DECLARE_MSM_GPIO_PINS(201);
+DECLARE_MSM_GPIO_PINS(202);
+DECLARE_MSM_GPIO_PINS(203);
+DECLARE_MSM_GPIO_PINS(204);
+DECLARE_MSM_GPIO_PINS(205);
+DECLARE_MSM_GPIO_PINS(206);
+DECLARE_MSM_GPIO_PINS(207);
+DECLARE_MSM_GPIO_PINS(208);
+DECLARE_MSM_GPIO_PINS(209);
+DECLARE_MSM_GPIO_PINS(210);
+DECLARE_MSM_GPIO_PINS(211);
+DECLARE_MSM_GPIO_PINS(212);
+DECLARE_MSM_GPIO_PINS(213);
+DECLARE_MSM_GPIO_PINS(214);
+DECLARE_MSM_GPIO_PINS(215);
+DECLARE_MSM_GPIO_PINS(216);
+DECLARE_MSM_GPIO_PINS(217);
+DECLARE_MSM_GPIO_PINS(218);
+DECLARE_MSM_GPIO_PINS(219);
+DECLARE_MSM_GPIO_PINS(220);
+DECLARE_MSM_GPIO_PINS(221);
+DECLARE_MSM_GPIO_PINS(222);
+DECLARE_MSM_GPIO_PINS(223);
+DECLARE_MSM_GPIO_PINS(224);
+DECLARE_MSM_GPIO_PINS(225);
+
+static const unsigned int ufs_reset_pins[] = { 226 };
+static const unsigned int sdc2_clk_pins[] = { 227 };
+static const unsigned int sdc2_cmd_pins[] = { 228 };
+static const unsigned int sdc2_data_pins[] = { 229 };
+
+enum maili_functions {
+	msm_mux_gpio,
+	msm_mux_aoss_cti,
+	msm_mux_atest_char,
+	msm_mux_atest_usb,
+	msm_mux_audio_ext_mclk,
+	msm_mux_audio_ref_clk,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async_in,
+	msm_mux_cci_i2c0,
+	msm_mux_cci_i2c1,
+	msm_mux_cci_i2c2,
+	msm_mux_cci_i2c3,
+	msm_mux_cci_timer,
+	msm_mux_coex_espmi,
+	msm_mux_coex_uart1_rx,
+	msm_mux_coex_uart1_tx,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi,
+	msm_mux_dp_hot,
+	msm_mux_egpio,
+	msm_mux_gcc_gp,
+	msm_mux_gnss_adc,
+	msm_mux_host2wlan_sol,
+	msm_mux_host_rst,
+	msm_mux_i2chub0_se0,
+	msm_mux_i2chub0_se1,
+	msm_mux_i2chub0_se2,
+	msm_mux_i2chub0_se3,
+	msm_mux_i2chub0_se4,
+	msm_mux_i2s0,
+	msm_mux_i2s1,
+	msm_mux_ibi_i3c,
+	msm_mux_ibi_i3c_qup5_se0,
+	msm_mux_jitter_bist,
+	msm_mux_mdp_esync0,
+	msm_mux_mdp_esync1,
+	msm_mux_mdp_esync2,
+	msm_mux_mdp_vsync,
+	msm_mux_mdp_vsync_e,
+	msm_mux_mdp_vsync_p,
+	msm_mux_mdp_vsync0_out,
+	msm_mux_mdp_vsync1_out,
+	msm_mux_mdp_vsync2_out,
+	msm_mux_mdp_vsync3_out,
+	msm_mux_mdp_vsync5_out,
+	msm_mux_modem_pps_in,
+	msm_mux_modem_pps_out,
+	msm_mux_nav_gpio,
+	msm_mux_nav_gpio0,
+	msm_mux_nav_gpio3,
+	msm_mux_nav_rffe,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_pcie1_clk_req_n,
+	msm_mux_pcie1_rst_n,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_clk_aux,
+	msm_mux_qdss_cti,
+	msm_mux_qlink,
+	msm_mux_qspi,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs,
+	msm_mux_qup1_se0,
+	msm_mux_qup1_se1,
+	msm_mux_qup1_se2,
+	msm_mux_qup1_se3,
+	msm_mux_qup1_se4,
+	msm_mux_qup1_se5,
+	msm_mux_qup1_se6,
+	msm_mux_qup1_se7,
+	msm_mux_qup2_se0,
+	msm_mux_qup2_se1,
+	msm_mux_qup2_se2,
+	msm_mux_qup2_se3,
+	msm_mux_qup2_se4_01,
+	msm_mux_qup2_se4_23,
+	msm_mux_qup3_se0,
+	msm_mux_qup3_se1,
+	msm_mux_qup3_se2,
+	msm_mux_qup3_se3,
+	msm_mux_qup3_se4,
+	msm_mux_qup3_se5,
+	msm_mux_qup4_se0,
+	msm_mux_qup4_se1,
+	msm_mux_qup4_se2,
+	msm_mux_qup4_se3_01,
+	msm_mux_qup4_se3_23,
+	msm_mux_qup4_se3_l3,
+	msm_mux_qup4_se4_01,
+	msm_mux_qup4_se4_23,
+	msm_mux_qup4_se4_l3,
+	msm_mux_qup5_se0,
+	msm_mux_rng_rosc,
+	msm_mux_sd_write_protect,
+	msm_mux_sdc2_clk,
+	msm_mux_sdc2_cmd,
+	msm_mux_sdc2_data,
+	msm_mux_sdc2_rclk,
+	msm_mux_sdc4_clk,
+	msm_mux_sdc4_cmd,
+	msm_mux_sdc4_data,
+	msm_mux_sys_throttle,
+	msm_mux_tb_trig_sdc,
+	msm_mux_tmess_rng,
+	msm_mux_tsense_clm,
+	msm_mux_tsense_pwm,
+	msm_mux_uim0,
+	msm_mux_uim1,
+	msm_mux_usb0_hs,
+	msm_mux_usb_phy,
+	msm_mux_vfr,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux_wcn_sw,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
+	"gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
+	"gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
+	"gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41",
+	"gpio42", "gpio43", "gpio44", "gpio45", "gpio46", "gpio47",
+	"gpio48", "gpio49", "gpio50", "gpio51", "gpio52", "gpio53",
+	"gpio54", "gpio55", "gpio56", "gpio57", "gpio58", "gpio59",
+	"gpio60", "gpio61", "gpio62", "gpio63", "gpio64", "gpio65",
+	"gpio66", "gpio67", "gpio68", "gpio69", "gpio70", "gpio71",
+	"gpio72", "gpio73", "gpio74", "gpio75", "gpio76", "gpio77",
+	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83",
+	"gpio84", "gpio85", "gpio86", "gpio87", "gpio88", "gpio89",
+	"gpio90", "gpio91", "gpio92", "gpio93", "gpio94", "gpio95",
+	"gpio96", "gpio97", "gpio98", "gpio99", "gpio100", "gpio101",
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio108", "gpio109", "gpio110", "gpio111", "gpio112", "gpio113",
+	"gpio114", "gpio115", "gpio116", "gpio117", "gpio118", "gpio119",
+	"gpio120", "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio130", "gpio131",
+	"gpio132", "gpio133", "gpio134", "gpio135", "gpio136", "gpio137",
+	"gpio138", "gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
+	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
+	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
+	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
+	"gpio174", "gpio175", "gpio176", "gpio177", "gpio178", "gpio179",
+	"gpio180", "gpio181", "gpio182", "gpio183", "gpio184", "gpio185",
+	"gpio186", "gpio187", "gpio188", "gpio189", "gpio190", "gpio191",
+	"gpio192", "gpio193", "gpio194", "gpio195", "gpio196", "gpio197",
+	"gpio198", "gpio199", "gpio200", "gpio201", "gpio202", "gpio203",
+	"gpio204", "gpio205", "gpio206", "gpio207", "gpio208", "gpio209",
+	"gpio210", "gpio211", "gpio212", "gpio213", "gpio214", "gpio215",
+	"gpio216", "gpio217", "gpio218", "gpio219", "gpio220", "gpio221",
+	"gpio222", "gpio223", "gpio224", "gpio225",
+};
+
+static const char *const aoss_cti_groups[] = {
+	"gpio74", "gpio75", "gpio76", "gpio77",
+};
+
+static const char *const atest_char_groups[] = {
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio133",
+};
+
+static const char *const atest_usb_groups[] = {
+	"gpio78", "gpio79", "gpio102", "gpio103", "gpio104",
+};
+
+static const char *const audio_ext_mclk_groups[] = {
+	"gpio120", "gpio121",
+};
+
+static const char *const audio_ref_clk_groups[] = {
+	"gpio120",
+};
+
+static const char *const cam_mclk_groups[] = {
+	"gpio90", "gpio91", "gpio92", "gpio93", "gpio94", "gpio95",
+};
+
+static const char *const cci_async_in_groups[] = {
+	"gpio15", "gpio109", "gpio110",
+};
+
+static const char *const cci_i2c0_groups[] = {
+	"gpio109", "gpio110",
+};
+
+static const char *const cci_i2c1_groups[] = {
+	"gpio111", "gpio112",
+};
+
+static const char *const cci_i2c2_groups[] = {
+	"gpio113", "gpio114",
+};
+
+static const char *const cci_i2c3_groups[] = {
+	"gpio107", "gpio160",
+};
+
+static const char *const cci_timer_groups[] = {
+	"gpio105", "gpio106", "gpio107", "gpio159", "gpio160",
+};
+
+static const char *const coex_espmi_groups[] = {
+	"gpio144", "gpio145",
+};
+
+static const char *const coex_uart1_rx_groups[] = {
+	"gpio144",
+};
+
+static const char *const coex_uart1_tx_groups[] = {
+	"gpio145",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio82",
+};
+
+static const char *const ddr_bist_groups[] = {
+	"gpio40", "gpio41", "gpio44", "gpio45",
+};
+
+static const char *const ddr_pxi_groups[] = {
+	"gpio66", "gpio67", "gpio68", "gpio69", "gpio70", "gpio71", "gpio72", "gpio73",
+};
+
+static const char *const dp_hot_groups[] = {
+	"gpio47",
+};
+
+static const char *const egpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
+	"gpio6", "gpio7", "gpio28", "gpio29", "gpio30", "gpio31",
+	"gpio48", "gpio49", "gpio50", "gpio51", "gpio163", "gpio164",
+	"gpio165", "gpio166", "gpio167", "gpio168", "gpio169", "gpio170",
+	"gpio171", "gpio172", "gpio173", "gpio174", "gpio175", "gpio176",
+	"gpio177", "gpio178", "gpio179", "gpio180", "gpio181", "gpio182",
+	"gpio183", "gpio184", "gpio185", "gpio186", "gpio187", "gpio188",
+	"gpio189", "gpio190", "gpio191", "gpio192", "gpio193", "gpio194",
+	"gpio195", "gpio196", "gpio197", "gpio198", "gpio199", "gpio200",
+	"gpio201", "gpio202", "gpio203", "gpio204", "gpio205", "gpio206",
+	"gpio207", "gpio208", "gpio209", "gpio212", "gpio213", "gpio214",
+	"gpio215", "gpio216", "gpio217", "gpio218",
+};
+
+static const char *const gcc_gp_groups[] = {
+	"gpio17", "gpio86", "gpio87", "gpio97", "gpio155", "gpio156",
+};
+
+static const char *const gnss_adc_groups[] = {
+	"gpio18", "gpio19", "gpio20", "gpio23",
+};
+
+static const char *const host2wlan_sol_groups[] = {
+	"gpio204",
+};
+
+static const char *const host_rst_groups[] = {
+	"gpio106",
+};
+
+static const char *const i2chub0_se0_groups[] = {
+	"gpio66", "gpio67",
+};
+
+static const char *const i2chub0_se1_groups[] = {
+	"gpio78", "gpio79",
+};
+
+static const char *const i2chub0_se2_groups[] = {
+	"gpio68", "gpio69",
+};
+
+static const char *const i2chub0_se3_groups[] = {
+	"gpio70", "gpio71",
+};
+
+static const char *const i2chub0_se4_groups[] = {
+	"gpio72", "gpio73",
+};
+
+static const char *const i2s0_groups[] = {
+	"gpio46", "gpio84", "gpio161", "gpio162",
+};
+
+static const char *const i2s1_groups[] = {
+	"gpio222", "gpio223", "gpio224", "gpio225",
+};
+
+static const char *const ibi_i3c_groups[] = {
+	"gpio0", "gpio1", "gpio4", "gpio5", "gpio8", "gpio9",
+	"gpio12", "gpio13", "gpio24", "gpio25", "gpio28", "gpio29",
+	"gpio32", "gpio33", "gpio36", "gpio37", "gpio48", "gpio49",
+	"gpio60", "gpio61", "gpio64", "gpio65", "gpio85", "gpio89",
+	"gpio117", "gpio118",
+};
+
+static const char *const ibi_i3c_qup5_se0_groups[] = {
+	"gpio8", "gpio9",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio73",
+};
+
+static const char *const mdp_esync0_groups[] = {
+	"gpio88", "gpio100",
+};
+
+static const char *const mdp_esync1_groups[] = {
+	"gpio86", "gpio100",
+};
+
+static const char *const mdp_esync2_groups[] = {
+	"gpio87", "gpio97",
+};
+
+static const char *const mdp_vsync_groups[] = {
+	"gpio86", "gpio87", "gpio88", "gpio97",
+};
+
+static const char *const mdp_vsync_e_groups[] = {
+	"gpio98",
+};
+
+static const char *const mdp_vsync_p_groups[] = {
+	"gpio98",
+};
+
+static const char *const mdp_vsync0_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync1_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync2_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync3_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync5_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const modem_pps_in_groups[] = {
+	"gpio151",
+};
+
+static const char *const modem_pps_out_groups[] = {
+	"gpio151",
+};
+
+static const char *const nav_gpio_groups[] = {
+	"gpio146", "gpio147", "gpio148", "gpio151",
+};
+
+static const char *const nav_gpio0_groups[] = {
+	"gpio150",
+};
+
+static const char *const nav_gpio3_groups[] = {
+	"gpio150",
+};
+
+static const char *const nav_rffe_groups[] = {
+	"gpio134", "gpio135", "gpio138", "gpio139",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio103",
+};
+
+static const char *const pcie1_clk_req_n_groups[] = {
+	"gpio221",
+};
+
+static const char *const pcie1_rst_n_groups[] = {
+	"gpio220",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio40", "gpio41", "gpio44", "gpio45", "gpio46", "gpio47", "gpio126",
+	"gpio127", "gpio128", "gpio129", "gpio130", "gpio131", "gpio132",
+	"gpio133", "gpio161", "gpio162", "gpio169", "gpio170", "gpio171",
+	"gpio174", "gpio175", "gpio178", "gpio179", "gpio180", "gpio181",
+	"gpio182", "gpio183", "gpio205", "gpio222", "gpio223", "gpio224",
+	"gpio225",
+};
+
+static const char *const pll_bist_sync_groups[] = {
+	"gpio104",
+};
+
+static const char *const pll_clk_aux_groups[] = {
+	"gpio94",
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio72", "gpio73", "gpio82", "gpio83", "gpio222", "gpio223",
+	"gpio224", "gpio225",
+};
+
+static const char *const qlink_groups[] = {
+	"gpio152", "gpio153", "gpio154",
+};
+
+static const char *const qspi_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio147",
+};
+
+static const char *const qspi_clk_groups[] = {
+	"gpio83",
+};
+
+static const char *const qspi_cs_groups[] = {
+	"gpio146", "gpio148",
+};
+
+static const char *const qup1_se0_groups[] = {
+	"gpio222", "gpio223", "gpio224", "gpio225",
+};
+
+static const char *const qup1_se1_groups[] = {
+	"gpio74", "gpio75", "gpio76", "gpio77", "gpio188", "gpio189", "gpio192", "gpio193",
+};
+
+static const char *const qup1_se2_groups[] = {
+	"gpio40", "gpio41", "gpio42", "gpio43", "gpio130", "gpio131", "gpio132",
+};
+
+static const char *const qup1_se3_groups[] = {
+	"gpio44", "gpio45", "gpio46", "gpio47",
+};
+
+static const char *const qup1_se4_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const qup1_se5_groups[] = {
+	"gpio52", "gpio53", "gpio54", "gpio55",
+};
+
+static const char *const qup1_se6_groups[] = {
+	"gpio56", "gpio57", "gpio58", "gpio59",
+};
+
+static const char *const qup1_se7_groups[] = {
+	"gpio60", "gpio61", "gpio62", "gpio63",
+};
+
+static const char *const qup2_se0_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qup2_se1_groups[] = {
+	"gpio4", "gpio5", "gpio6", "gpio7",
+};
+
+static const char *const qup2_se2_groups[] = {
+	"gpio117", "gpio118", "gpio119", "gpio120",
+};
+
+static const char *const qup2_se3_groups[] = {
+	"gpio97", "gpio122", "gpio123", "gpio124", "gpio125",
+};
+
+static const char *const qup2_se4_01_groups[] = {
+	"gpio208", "gpio209",
+};
+
+static const char *const qup2_se4_23_groups[] = {
+	"gpio208", "gpio209",
+};
+
+static const char *const qup3_se0_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio67", "gpio82", "gpio83",
+};
+
+static const char *const qup3_se1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio15",
+};
+
+static const char *const qup3_se2_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15",
+};
+
+static const char *const qup3_se3_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19",
+};
+
+static const char *const qup3_se4_groups[] = {
+	"gpio20", "gpio21", "gpio22", "gpio23",
+};
+
+static const char *const qup3_se5_groups[] = {
+	"gpio24", "gpio25", "gpio26", "gpio27",
+};
+
+static const char *const qup4_se0_groups[] = {
+	"gpio48", "gpio49", "gpio50", "gpio51",
+};
+
+static const char *const qup4_se1_groups[] = {
+	"gpio28", "gpio29", "gpio30", "gpio31",
+};
+
+static const char *const qup4_se2_groups[] = {
+	"gpio32", "gpio33", "gpio34", "gpio35",
+};
+
+static const char *const qup4_se3_01_groups[] = {
+	"gpio84", "gpio121",
+};
+
+static const char *const qup4_se3_23_groups[] = {
+	"gpio84", "gpio121",
+};
+
+static const char *const qup4_se3_l3_groups[] = {
+	"gpio98",
+};
+
+static const char *const qup4_se4_01_groups[] = {
+	"gpio161", "gpio162",
+};
+
+static const char *const qup4_se4_23_groups[] = {
+	"gpio161", "gpio162",
+};
+
+static const char *const qup4_se4_l3_groups[] = {
+	"gpio88",
+};
+
+static const char *const qup5_se0_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio16", "gpio17", "gpio85", "gpio89", "gpio100", "gpio214", "gpio215",
+};
+
+static const char *const rng_rosc_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio84",
+};
+
+static const char *const sd_write_protect_groups[] = {
+	"gpio85",
+};
+
+static const char *const sdc2_clk_groups[] = {
+	"gpio56",
+};
+
+static const char *const sdc2_cmd_groups[] = {
+	"gpio57",
+};
+
+static const char *const sdc2_data_groups[] = {
+	"gpio74", "gpio75", "gpio76", "gpio77",
+};
+
+static const char *const sdc2_rclk_groups[] = {
+	"gpio54",
+};
+
+static const char *const sdc4_clk_groups[] = {
+	"gpio83",
+};
+
+static const char *const sdc4_cmd_groups[] = {
+	"gpio148",
+};
+
+static const char *const sdc4_data_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio147",
+};
+
+static const char *const sys_throttle_groups[] = {
+	"gpio99",
+};
+
+static const char *const tb_trig_sdc_groups[] = {
+	"gpio88", "gpio146",
+};
+
+static const char *const tmess_rng_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio84",
+};
+
+static const char *const tsense_clm_groups[] = {
+	"gpio87", "gpio97", "gpio98", "gpio99", "gpio105", "gpio106",
+	"gpio159",
+};
+
+static const char *const tsense_pwm_groups[] = {
+	"gpio35", "gpio38", "gpio58", "gpio87", "gpio97", "gpio98", "gpio99",
+};
+
+static const char *const uim0_groups[] = {
+	"gpio126", "gpio127", "gpio128", "gpio129",
+};
+
+static const char *const uim1_groups[] = {
+	"gpio36", "gpio37", "gpio39", "gpio54", "gpio55", "gpio56", "gpio70",
+	"gpio71", "gpio72", "gpio130", "gpio131", "gpio132", "gpio133",
+};
+
+static const char *const usb0_hs_groups[] = {
+	"gpio79",
+};
+
+static const char *const usb_phy_groups[] = {
+	"gpio59", "gpio60",
+};
+
+static const char *const vfr_groups[] = {
+	"gpio146", "gpio151",
+};
+
+static const char *const vsense_trigger_mirnat_groups[] = {
+	"gpio16",
+};
+
+static const char *const wcn_sw_groups[] = {
+	"gpio18", "gpio19", "gpio155", "gpio156",
+};
+
+static const struct pinfunction maili_functions[] = {
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(aoss_cti),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_usb),
+	MSM_PIN_FUNCTION(audio_ext_mclk),
+	MSM_PIN_FUNCTION(audio_ref_clk),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(cci_async_in),
+	MSM_PIN_FUNCTION(cci_i2c0),
+	MSM_PIN_FUNCTION(cci_i2c1),
+	MSM_PIN_FUNCTION(cci_i2c2),
+	MSM_PIN_FUNCTION(cci_i2c3),
+	MSM_PIN_FUNCTION(cci_timer),
+	MSM_PIN_FUNCTION(coex_espmi),
+	MSM_PIN_FUNCTION(coex_uart1_rx),
+	MSM_PIN_FUNCTION(coex_uart1_tx),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(ddr_bist),
+	MSM_PIN_FUNCTION(ddr_pxi),
+	MSM_PIN_FUNCTION(dp_hot),
+	MSM_PIN_FUNCTION(egpio),
+	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gnss_adc),
+	MSM_PIN_FUNCTION(host2wlan_sol),
+	MSM_PIN_FUNCTION(host_rst),
+	MSM_PIN_FUNCTION(i2chub0_se0),
+	MSM_PIN_FUNCTION(i2chub0_se1),
+	MSM_PIN_FUNCTION(i2chub0_se2),
+	MSM_PIN_FUNCTION(i2chub0_se3),
+	MSM_PIN_FUNCTION(i2chub0_se4),
+	MSM_PIN_FUNCTION(i2s0),
+	MSM_PIN_FUNCTION(i2s1),
+	MSM_PIN_FUNCTION(ibi_i3c),
+	MSM_PIN_FUNCTION(ibi_i3c_qup5_se0),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(mdp_esync0),
+	MSM_PIN_FUNCTION(mdp_esync1),
+	MSM_PIN_FUNCTION(mdp_esync2),
+	MSM_PIN_FUNCTION(mdp_vsync),
+	MSM_PIN_FUNCTION(mdp_vsync_e),
+	MSM_PIN_FUNCTION(mdp_vsync_p),
+	MSM_PIN_FUNCTION(mdp_vsync0_out),
+	MSM_PIN_FUNCTION(mdp_vsync1_out),
+	MSM_PIN_FUNCTION(mdp_vsync2_out),
+	MSM_PIN_FUNCTION(mdp_vsync3_out),
+	MSM_PIN_FUNCTION(mdp_vsync5_out),
+	MSM_PIN_FUNCTION(modem_pps_in),
+	MSM_PIN_FUNCTION(modem_pps_out),
+	MSM_PIN_FUNCTION(nav_gpio),
+	MSM_PIN_FUNCTION(nav_gpio0),
+	MSM_PIN_FUNCTION(nav_gpio3),
+	MSM_PIN_FUNCTION(nav_rffe),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(pcie1_clk_req_n),
+	MSM_PIN_FUNCTION(pcie1_rst_n),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll_bist_sync),
+	MSM_PIN_FUNCTION(pll_clk_aux),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qlink),
+	MSM_PIN_FUNCTION(qspi),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs),
+	MSM_PIN_FUNCTION(qup1_se0),
+	MSM_PIN_FUNCTION(qup1_se1),
+	MSM_PIN_FUNCTION(qup1_se2),
+	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se4),
+	MSM_PIN_FUNCTION(qup1_se5),
+	MSM_PIN_FUNCTION(qup1_se6),
+	MSM_PIN_FUNCTION(qup1_se7),
+	MSM_PIN_FUNCTION(qup2_se0),
+	MSM_PIN_FUNCTION(qup2_se1),
+	MSM_PIN_FUNCTION(qup2_se2),
+	MSM_PIN_FUNCTION(qup2_se3),
+	MSM_PIN_FUNCTION(qup2_se4_01),
+	MSM_PIN_FUNCTION(qup2_se4_23),
+	MSM_PIN_FUNCTION(qup3_se0),
+	MSM_PIN_FUNCTION(qup3_se1),
+	MSM_PIN_FUNCTION(qup3_se2),
+	MSM_PIN_FUNCTION(qup3_se3),
+	MSM_PIN_FUNCTION(qup3_se4),
+	MSM_PIN_FUNCTION(qup3_se5),
+	MSM_PIN_FUNCTION(qup4_se0),
+	MSM_PIN_FUNCTION(qup4_se1),
+	MSM_PIN_FUNCTION(qup4_se2),
+	MSM_PIN_FUNCTION(qup4_se3_01),
+	MSM_PIN_FUNCTION(qup4_se3_23),
+	MSM_PIN_FUNCTION(qup4_se3_l3),
+	MSM_PIN_FUNCTION(qup4_se4_01),
+	MSM_PIN_FUNCTION(qup4_se4_23),
+	MSM_PIN_FUNCTION(qup4_se4_l3),
+	MSM_PIN_FUNCTION(qup5_se0),
+	MSM_PIN_FUNCTION(rng_rosc),
+	MSM_PIN_FUNCTION(sd_write_protect),
+	MSM_PIN_FUNCTION(sdc2_clk),
+	MSM_PIN_FUNCTION(sdc2_cmd),
+	MSM_PIN_FUNCTION(sdc2_data),
+	MSM_PIN_FUNCTION(sdc2_rclk),
+	MSM_PIN_FUNCTION(sdc4_clk),
+	MSM_PIN_FUNCTION(sdc4_cmd),
+	MSM_PIN_FUNCTION(sdc4_data),
+	MSM_PIN_FUNCTION(sys_throttle),
+	MSM_PIN_FUNCTION(tb_trig_sdc),
+	MSM_PIN_FUNCTION(tmess_rng),
+	MSM_PIN_FUNCTION(tsense_clm),
+	MSM_PIN_FUNCTION(tsense_pwm),
+	MSM_PIN_FUNCTION(uim0),
+	MSM_PIN_FUNCTION(uim1),
+	MSM_PIN_FUNCTION(usb0_hs),
+	MSM_PIN_FUNCTION(usb_phy),
+	MSM_PIN_FUNCTION(vfr),
+	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
+	MSM_PIN_FUNCTION(wcn_sw),
+};
+
+/* Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup maili_groups[] = {
+	[0] = PINGROUP(0, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[1] = PINGROUP(1, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[2] = PINGROUP(2, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[3] = PINGROUP(3, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[4] = PINGROUP(4, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[5] = PINGROUP(5, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[6] = PINGROUP(6, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[7] = PINGROUP(7, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[8] = PINGROUP(8, qup3_se1, ibi_i3c, qup5_se0, ibi_i3c_qup5_se0, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, qup3_se1, ibi_i3c, qup5_se0, ibi_i3c_qup5_se0, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, qup3_se1, qup5_se0, _, _, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup3_se1, qup5_se0, _, _, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup3_se2, ibi_i3c, qup3_se1, qup5_se0, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup3_se2, ibi_i3c, qup3_se1, qup5_se0, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup3_se2, qup5_se0, _, _, _, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup3_se2, cci_async_in, qup3_se1, _, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup3_se3, qup5_se0, _, vsense_trigger_mirnat, _, _, _, _, _, _, _),
+	[17] = PINGROUP(17, qup3_se3, qup5_se0, gcc_gp, _, _, _, _, _, _, _, _),
+	[18] = PINGROUP(18, wcn_sw, qup3_se3, _, gnss_adc, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, wcn_sw, qup3_se3, _, gnss_adc, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup3_se4, _, gnss_adc, _, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, qup3_se4, _, gnss_adc, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, qup3_se5, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, qup3_se5, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, qup3_se5, _, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, qup3_se5, _, _, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qup4_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[29] = PINGROUP(29, qup4_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[30] = PINGROUP(30, qup4_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[31] = PINGROUP(31, qup4_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[32] = PINGROUP(32, qup4_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, qup4_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[34] = PINGROUP(34, qup4_se2, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup4_se2, tsense_pwm, _, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se4, uim1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se4, uim1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, qup1_se4, tsense_pwm, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, qup1_se4, uim1, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, qup1_se2, ddr_bist, phase_flag, _, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, qup1_se2, ddr_bist, phase_flag, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, qup1_se2, _, _, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, qup1_se2, _, _, _, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, qup1_se3, ddr_bist, phase_flag, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, qup1_se3, ddr_bist, phase_flag, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, qup1_se3, i2s0, phase_flag, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, qup1_se3, dp_hot, phase_flag, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, qup4_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[49] = PINGROUP(49, qup4_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[52] = PINGROUP(52, qup1_se5, _, _, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, _, _, _, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, qup1_se5, uim1, sdc2_rclk, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, qup1_se5, uim1, _, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, qup1_se6, uim1, sdc2_clk, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, qup1_se6, sdc2_cmd, _, _, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, qup1_se6, tsense_pwm, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, qup1_se6, usb_phy, _, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, qup1_se7, usb_phy, ibi_i3c, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, qup1_se7, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, qup3_se0, rng_rosc, tmess_rng, ibi_i3c, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, qup3_se0, rng_rosc, tmess_rng, ibi_i3c, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, i2chub0_se0, qup3_se0, rng_rosc, tmess_rng, _, ddr_pxi, _, _, _, _, _),
+	[67] = PINGROUP(67, i2chub0_se0, qup3_se0, _, ddr_pxi, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, i2chub0_se2, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, i2chub0_se2, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, i2chub0_se3, uim1, _, _, ddr_pxi, _, _, _, _, _, _),
+	[71] = PINGROUP(71, i2chub0_se3, uim1, _, _, ddr_pxi, _, _, _, _, _, _),
+	[72] = PINGROUP(72, i2chub0_se4, uim1, qdss_cti, _, ddr_pxi, _, _, _, _, _, _),
+	[73] = PINGROUP(73, i2chub0_se4, qdss_cti, jitter_bist, ddr_pxi, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, qup1_se1, aoss_cti, sdc2_data, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, qup1_se1, aoss_cti, sdc2_data, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, qup1_se1, aoss_cti, sdc2_data, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, qup1_se1, aoss_cti, sdc2_data, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, i2chub0_se1, _, atest_usb, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, i2chub0_se1, usb0_hs, _, atest_usb, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, sdc4_data, qspi, _, _, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, sdc4_data, qspi, _, _, _, _, _, _, _, _, _),
+	[82] = PINGROUP(82, sdc4_data, qdss_cti, qspi, qup3_se0, dbg_out_clk, _, _, _, _, _, _),
+	[83] = PINGROUP(83, sdc4_clk, qdss_cti, qspi_clk, qup3_se0, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, qup4_se3_01, qup4_se3_23, rng_rosc, tmess_rng, i2s0, _, _, _, _, _, _),
+	[85] = PINGROUP(85, sd_write_protect, qup5_se0, ibi_i3c, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, mdp_vsync, mdp_vsync0_out, mdp_vsync1_out, mdp_esync1, gcc_gp,
+			_, _, _, _, _, _),
+	[87] = PINGROUP(87, mdp_vsync, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out, mdp_esync2,
+			gcc_gp, tsense_clm, tsense_pwm, _, _, _),
+	[88] = PINGROUP(88, mdp_esync0, mdp_vsync, qup4_se4_l3, tb_trig_sdc, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, qup5_se0, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, cam_mclk, pll_clk_aux, _, _, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[96] = PINGROUP(96, _, _, _, _, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, mdp_esync2, qup2_se3, mdp_vsync, gcc_gp, tsense_clm, tsense_pwm,
+			_, _, _, _, _),
+	[98] = PINGROUP(98, mdp_vsync_e, qup4_se3_l3, mdp_vsync_p, tsense_clm, tsense_pwm,
+			_, _, _, _, _, _),
+	[99] = PINGROUP(99, sys_throttle, tsense_clm, tsense_pwm, _, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, mdp_esync1, mdp_esync0, qup5_se0, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, _, _, _, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, atest_usb, _, _, _, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, pcie0_clk_req_n, atest_usb, _, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, pll_bist_sync, atest_usb, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, cci_timer, tsense_clm, _, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, host_rst, cci_timer, tsense_clm, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, cci_i2c3, cci_timer, _, _, _, _, _, _, _, _, _),
+	[108] = PINGROUP(108, _, _, _, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, cci_i2c0, cci_async_in, _, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, cci_i2c0, cci_async_in, _, _, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, cci_i2c2, _, _, _, _, _, _, _, _, _, _),
+	[114] = PINGROUP(114, cci_i2c2, _, _, _, _, _, _, _, _, _, _),
+	[115] = PINGROUP(115, _, _, _, _, _, _, _, _, _, _, _),
+	[116] = PINGROUP(116, _, _, _, _, _, _, _, _, _, _, _),
+	[117] = PINGROUP(117, qup2_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[118] = PINGROUP(118, qup2_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[119] = PINGROUP(119, qup2_se2, _, _, _, _, _, _, _, _, _, _),
+	[120] = PINGROUP(120, qup2_se2, audio_ext_mclk, audio_ref_clk, _, _, _, _, _, _, _, _),
+	[121] = PINGROUP(121, audio_ext_mclk, qup4_se3_01, qup4_se3_23, _, _, _, _, _, _, _, _),
+	[122] = PINGROUP(122, qup2_se3, _, _, _, _, _, _, _, _, _, _),
+	[123] = PINGROUP(123, qup2_se3, _, _, _, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, qup2_se3, _, _, _, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, qup2_se3, _, _, _, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, uim0, phase_flag, _, atest_char, _, _, _, _, _, _, _),
+	[127] = PINGROUP(127, uim0, phase_flag, _, atest_char, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, uim0, phase_flag, _, atest_char, _, _, _, _, _, _, _),
+	[129] = PINGROUP(129, uim0, phase_flag, _, atest_char, _, _, _, _, _, _, _),
+	[130] = PINGROUP(130, uim1, qup1_se2, _, phase_flag, _, _, _, _, _, _, _),
+	[131] = PINGROUP(131, uim1, qup1_se2, _, phase_flag, _, _, _, _, _, _, _),
+	[132] = PINGROUP(132, uim1, qup1_se2, _, phase_flag, _, _, _, _, _, _, _),
+	[133] = PINGROUP(133, uim1, phase_flag, _, atest_char, _, _, _, _, _, _, _),
+	[134] = PINGROUP(134, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[135] = PINGROUP(135, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[136] = PINGROUP(136, _, _, _, _, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, _, _, _, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[139] = PINGROUP(139, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, coex_uart1_rx, coex_espmi, _, _, _, _, _, _, _, _, _),
+	[145] = PINGROUP(145, coex_uart1_tx, coex_espmi, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, _, vfr, nav_gpio, tb_trig_sdc, qspi_cs, _, _, _, _, _, _),
+	[147] = PINGROUP(147, _, nav_gpio, sdc4_data, qspi, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, nav_gpio, _, sdc4_cmd, qspi_cs, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, nav_gpio0, nav_gpio3, _, _, _, _, _, _, _, _, _),
+	[151] = PINGROUP(151, nav_gpio, vfr, modem_pps_in, modem_pps_out, _, _, _, _, _, _, _),
+	[152] = PINGROUP(152, qlink, _, _, _, _, _, _, _, _, _, _),
+	[153] = PINGROUP(153, qlink, _, _, _, _, _, _, _, _, _, _),
+	[154] = PINGROUP(154, qlink, _, _, _, _, _, _, _, _, _, _),
+	[155] = PINGROUP(155, wcn_sw, gcc_gp, _, _, _, _, _, _, _, _, _),
+	[156] = PINGROUP(156, wcn_sw, gcc_gp, _, _, _, _, _, _, _, _, _),
+	[157] = PINGROUP(157, _, _, _, _, _, _, _, _, _, _, _),
+	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, _, _, _),
+	[159] = PINGROUP(159, cci_timer, tsense_clm, _, _, _, _, _, _, _, _, _),
+	[160] = PINGROUP(160, cci_timer, cci_i2c3, _, _, _, _, _, _, _, _, _),
+	[161] = PINGROUP(161, qup4_se4_01, qup4_se4_23, i2s0, phase_flag, _, _, _, _, _, _, _),
+	[162] = PINGROUP(162, qup4_se4_01, qup4_se4_23, i2s0, phase_flag, _, _, _, _, _, _, _),
+	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, _, _, egpio),
+	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, _, _, egpio),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, _, _, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, _, _, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, _, _, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, _, _, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, _, _, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, _, _, _, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, _, _, _, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, qup1_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, qup1_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, qup1_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, qup1_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, _, _, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, _, _, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, _, _, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, _, _, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, host2wlan_sol, _, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, _, _, _, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, _, _, _, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, qup2_se4_01, qup2_se4_23, _, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, qup2_se4_01, qup2_se4_23, _, _, _, _, _, _, _, _, egpio),
+	[210] = PINGROUP(210, _, _, _, _, _, _, _, _, _, _, _),
+	[211] = PINGROUP(211, _, _, _, _, _, _, _, _, _, _, _),
+	[212] = PINGROUP(212, _, _, _, _, _, _, _, _, _, _, egpio),
+	[213] = PINGROUP(213, _, _, _, _, _, _, _, _, _, _, egpio),
+	[214] = PINGROUP(214, qup5_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[215] = PINGROUP(215, qup5_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[216] = PINGROUP(216, _, _, _, _, _, _, _, _, _, _, egpio),
+	[217] = PINGROUP(217, _, _, _, _, _, _, _, _, _, _, egpio),
+	[218] = PINGROUP(218, _, _, _, _, _, _, _, _, _, _, egpio),
+	[219] = PINGROUP(219, _, _, _, _, _, _, _, _, _, _, _),
+	[220] = PINGROUP(220, pcie1_rst_n, _, _, _, _, _, _, _, _, _, _),
+	[221] = PINGROUP(221, pcie1_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[222] = PINGROUP(222, qup1_se0, i2s1, qdss_cti, phase_flag, _, _, _, _, _, _, _),
+	[223] = PINGROUP(223, qup1_se0, i2s1, qdss_cti, phase_flag, _, _, _, _, _, _, _),
+	[224] = PINGROUP(224, qup1_se0, i2s1, qdss_cti, phase_flag, _, _, _, _, _, _, _),
+	[225] = PINGROUP(225, qup1_se0, i2s1, qdss_cti, phase_flag, _, _, _, _, _, _, _),
+	[226] = UFS_RESET(ufs_reset, 0xf1004, 0xf2000),
+	[227] = SDC_QDSD_PINGROUP(sdc2_clk, 0xe6000, 14, 6),
+	[228] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xe6000, 11, 3),
+	[229] = SDC_QDSD_PINGROUP(sdc2_data, 0xe6000, 9, 0),
+};
+
+static const struct msm_gpio_wakeirq_map maili_pdc_map[] = {
+	{ 0, 111 }, { 3, 119 }, { 4, 112 }, { 7, 113 }, { 8, 114 }, { 11, 115 },
+	{ 12, 121 }, { 15, 137 }, { 16, 122 }, { 17, 147 }, { 18, 149 }, { 19, 118 },
+	{ 23, 123 }, { 24, 124 }, { 27, 125 }, { 28, 131 }, { 31, 132 }, { 32, 133 },
+	{ 35, 107 }, { 36, 134 }, { 39, 135 }, { 43, 136 }, { 47, 160 }, { 48, 141 },
+	{ 51, 120 }, { 55, 110 }, { 57, 142 }, { 58, 143 }, { 59, 144 }, { 60, 145 },
+	{ 61, 151 }, { 63, 130 }, { 64, 116 }, { 65, 129 }, { 67, 138 }, { 68, 152 },
+	{ 69, 153 }, { 75, 157 }, { 77, 154 }, { 78, 155 }, { 79, 161 }, { 80, 162 },
+	{ 81, 163 }, { 82, 164 }, { 83, 171 }, { 84, 140 }, { 85, 165 }, { 86, 166 },
+	{ 87, 167 }, { 88, 168 }, { 95, 169 }, { 96, 170 }, { 97, 139 }, { 98, 156 },
+	{ 99, 117 }, { 100, 199 }, { 103, 173 }, { 104, 174 }, { 117, 201 }, { 120, 175 },
+	{ 123, 176 }, { 125, 177 }, { 129, 159 }, { 133, 106 }, { 144, 178 }, { 146, 179 },
+	{ 151, 180 }, { 152, 181 }, { 155, 128 }, { 158, 126 }, { 162, 148 }, { 164, 182 },
+	{ 165, 183 }, { 167, 184 }, { 168, 185 }, { 174, 186 }, { 177, 187 }, { 179, 188 },
+	{ 183, 189 }, { 184, 190 }, { 185, 191 }, { 186, 158 }, { 188, 150 }, { 202, 108 },
+	{ 203, 109 }, { 205, 146 }, { 209, 192 }, { 213, 127 }, { 215, 200 }, { 216, 193 },
+	{ 220, 172 }, { 221, 194 }, { 222, 195 }, { 223, 196 }, { 224, 197 }, { 225, 198 },
+};
+
+static const struct msm_pinctrl_soc_data maili_tlmm = {
+	.pins = maili_pins,
+	.npins = ARRAY_SIZE(maili_pins),
+	.functions = maili_functions,
+	.nfunctions = ARRAY_SIZE(maili_functions),
+	.groups = maili_groups,
+	.ngroups = ARRAY_SIZE(maili_groups),
+	.ngpios = 227,
+	.wakeirq_map = maili_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(maili_pdc_map),
+	.egpio_func = 11,
+};
+
+static const struct of_device_id maili_tlmm_of_match[] = {
+	{ .compatible = "qcom,maili-tlmm", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, maili_tlmm_of_match);
+
+static int maili_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &maili_tlmm);
+}
+
+static struct platform_driver maili_tlmm_driver = {
+	.driver = {
+		.name = "maili-tlmm",
+		.of_match_table = maili_tlmm_of_match,
+	},
+	.probe = maili_tlmm_probe,
+};
+
+static int __init maili_tlmm_init(void)
+{
+	return platform_driver_register(&maili_tlmm_driver);
+}
+arch_initcall(maili_tlmm_init);
+
+static void __exit maili_tlmm_exit(void)
+{
+	platform_driver_unregister(&maili_tlmm_driver);
+}
+module_exit(maili_tlmm_exit);
+
+MODULE_DESCRIPTION("Qualcomm Maili TLMM driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


