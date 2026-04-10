Return-Path: <linux-gpio+bounces-35009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MXZM0f22GkYkQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:08:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ACA3D7E60
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D15307AAE5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A95314A6B;
	Fri, 10 Apr 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XifP1DBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGFN4Ds0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF792314A84
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826318; cv=none; b=oq5716jIoT+q/0+VDpiTVCbInd3MwhpgToVylzxXYOtAtk5s3pRJ1in6WPEuXPSRiX+IteNtzFSdd+QCecGb9NDp7wnGA9WVyOXOEOwl7TaJSm3lm0h3BqeHyxHE0vyM6F+rUNZmw2x3aJGcI7kkUK6LVmz4hn0psT8WT6VbcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826318; c=relaxed/simple;
	bh=GjAMz6tobYIxa/SJLPzRW+5gux+Gh/A3X9VoXHkjEnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIpx8m28XJi0sWejfgdeTGosvXYiZGDAeDUJ1UKLtsjz7vZ91X68FEdjgikDHLV//KDK9uBOP04fvpGI2i9ArM1gRjN3/ZYp4nxApKFJJoGY690kHg0EMcYWJRj6UNiMRLOM/tJnE/qVEwZceZ45eCOPLQMpQKiHzUA5nDIEj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XifP1DBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGFN4Ds0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA61Af017381
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=; b=XifP1DBRYal/FUlj
	bJFNkprezix621ZqVep0G97j18bnMOTIEO8CZEO137KFVsfmiBWn1ig4e5WWu97H
	AFEwVPMQhByNNQBQ5S3DnOC47fW+fIAFFsd+5BzMamilhnfXFRyjH6ASmx1lXZld
	O6SE0lrLdLDG+i5DbSbpWAV6g3E9ZO5u+MuUvqIDm6sgCSwWCeW9dTfgdb8xHSsc
	7R9Dp5M4YPa6iTc5NGw71xM7KTBILMy0hOJAVCsHCqdxXHO89Sj4as2P7LF/rCQ9
	URo3X40ei0JPw2t9wE5VjBLGRhgJmtBlPyDFENR/5vAhjxerNU0DjrFC4wBU/Xm9
	ujLECA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j0hfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:15 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68c2c523fbbso901657eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826315; x=1776431115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=OGFN4Ds0WdGP0cTPZutcqus5GLQuFKceAZ8w1IQWCA+4M8SOBh0TZda50AbrJnVwrY
         3FRw9RLlDVPwztYBl73CIJBsQPurEPn+qdO9FX9kbSpxuLpqBfh6FrcCvlQJAaeRlOwP
         9S6Hzfh/HZ1zFtOKWLl7Zjed/RufY1HcxscqOmNmyuRA92A1qHDjyVDkb5Ta2RCeDhKN
         RTWQUEVqNh888CBtyV+I1nSu2VIwXvlob3WJIEtJSVY54CMWF+ZUYlcw2aS9VieKARoq
         QTgY4cno4CqXulJkxUbDQgZnm0OuuA/gFDX4WRMHeSC8ShwZJm21ejUE4xZxYiE5UAz9
         Gmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826315; x=1776431115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=jM66YBefDrcd76nnGU3JU0NchgzeTTVNfMLpj8hb+ycQyqoVe4d/T5tuEJXEjc+vUi
         ar8M0zFyAxfHuOR2Pt4HxfSV0/TiiNMzyI8UaDaJ2O7xjcPkc3I139BnI9QMw4JJR2iV
         G16mg7wsIufSpCfww0Btc467xYaY9uDqG+vOQP/ySz/zo3jhNrfG1FfvdjoGawhhaHw5
         mIDmzqQkRiBXzg8ZPPLkId9G5l+Q7Wh7kzZ1xofEx2VFBggbpQ9ZWgBWdqzskONsZmXD
         bicKQZb4ErrPx3grMWrkxrx9/0zu/mr6Y+YQzXr5dvHsEyO3xWU0+us4FFQD1kkZurHY
         Wtdw==
X-Gm-Message-State: AOJu0Yxg6YL9lIUH2YkM1MOc4ddk6lXu0yXS62na1j9VOYkdehwQNERI
	55xNcv3kyc7x+1ssxGzLbzBZxTzRYZYsr3aouYPc6SXysR8jfkJQpClgoq2riqh/Oob6jacAmia
	/84sxHzuamvZQjXh4krQ8UcUQt5ZTlF/iBRk/9kgMC3uO6wLvF+kTUxbZJUbued2t
X-Gm-Gg: AeBDies57WgT/+cAda44z38z3e/xtsNm9E9dNhLXUUkmNt/e9Q4vn46qYJ4oRhVXF8D
	xKkF7g9HY2N8Qf/USjn4nqS1omDdledEqoqgofVi35ezWcCq5aBw2Ve306fMPMjWcFvWO5n4SjO
	rVpvwN9U65sHZnYYNb5SwM+g8Ua0nCFS8RSsLpeluyAo5V3JXKe16nivCAjS06IYv9lHKVk84p5
	j6IRif560csftaxAOIcBiVgKVBFpenbEVLPYPFaeXD5HX+KYMWf8l/beoUej0We3w1XO+zQ12Nu
	uIjHYcGIvK76keOU9fXYjSIEIPr67/1afSgmCPlyBf+8+znc54nD5Ka4WuNn/Ucq/5PetGNg8si
	U5+HYw+w4E5OpPoGydqkgxe7ABDgr8+L1aIdoPd5WWfmD
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449909eaf.52.1775826315086;
        Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449864eaf.52.1775826314584;
        Fri, 10 Apr 2026 06:05:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:59 +0200
Subject: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GjAMz6tobYIxa/SJLPzRW+5gux+Gh/A3X9VoXHkjEnU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV81Vd+JP/scQiZoHE8MXITVvwB2S+oCSyu5
 bSdXev0yGOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1fAAKCRDBN2bmhouD
 1zcUD/9Yg5PqPB4i0qujDFde34COX9EkMoqe1+Z4Yi+Xoa/AA0fCdkrsfBesbCrqMV98JSevsIG
 YnA6sHvveGld5hbUKAd303/SDLywIlrEOLGlZDMP8vXK21Zb+WjLEoR/UJgjMl4a3vv1MFEdRve
 RVxvFzhbIpiQNiF4Q6vLmATxbrKqalDmxKreE3ZBvVKoNIWlnsPwkp7g1+GgE09Sj230eRg3pAC
 uPIwPD9SKELCOmPVU5DnDMsElI2OnpVkqduvNy6pOfKJtZDoqgAEgSqPGbVFMi90I1LBomNXWsa
 oPmObSxNd48uzwDK1bTxS4EzAC+0FkoehmUtLIsoiXt4RNT2dE8I+I0Mww8Wev5x1QYF5x2AZTd
 U67BBz7tqOwBj129s3hp/RdyzmQXOunfZhRvozGEmwnBiHg+WdCwVDSHE9l/miJ3A03rcbW2uiH
 1krrCtVP4zUpSS+ZkdMGyxKVD/Gz5sGFJAXKxnUMWVl1WN1sIzx11BMI/UaSbRBpddvCPrfdUOa
 Gnq4EAtfCwik2+YUaKNT0IFlJHBNUyr4TcSwtRoOd0CUPMPX/yDHIDPn22ikxRL9QWxo7bI9Tim
 q+H6vpNr7FM0V+f10VkV1ji1RqQfiEU07M/Zs0WoVph6I2tYqIiaLJBF7rC0eQJtuvBf/Bvimpt
 tH+Il+mVaAxb4Mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: e1jSBExKBQB4e448LtI0Ly1vIPbDwL9X
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d8f58b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h1wwraGuyCXQn7UikQ0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: e1jSBExKBQB4e448LtI0Ly1vIPbDwL9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX+TVmk4PhCdD7
 hth0Ib5nSjgbepl3Q6g5y9Otm3eXc2KJq3xoz0QsQXJ2xgrI6ReIQhYa9LtrszxE4AiFdA0j/Mc
 iMY0hEO5BVE0+dyfajT+Zv5K59ShqWEJUamL0XghIL8zh9eLl1XuHL63AnkhDjtTBKeEfPkhG0T
 KEl8T2TIJhYu5vf+RzvD1c4wggay2vTPJMmyOIUofhrSfrLEGQ9dgBj6JXVZWbbJfIj3lemzsxV
 L7e4/7J58XpK/KXCPnWXBFpgg/o41q0g+6JWaGRtB/51DkByT+JVCNHiuHK0Ie6u4Zx7AIpfZC4
 /r9bbEztZAL0A1wEu5qNACU+UgbHl0rHc3OsfCVwH7eE0HO6ZsnBKCuzFA45CSWIQP41asDELPp
 E2bRzvEPKnwpVwUTHrhbxxrkpzxW2GjZ58ynAp3A7/bc88ia1EjG5zZXQc9gRhs5SEwUitsCOFy
 hWLBvC3YR07LC+Sgyag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35009-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26ACA3D7E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No dedicated maintainers are shown for Realtek SoC pin controllers,
except pinctrl subsystem maintainer, which means reduced review and
impression of abandoned drivers.  Pin controller drivers are essential
part of an SoC, so in case of lack of dedicated entry at least cover it
by the SoC platform maintainers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This patch should go via Realtek SoC maintainers, not pinctrl.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..374ce55e4fb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3373,6 +3373,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>

-- 
2.51.0


