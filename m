Return-Path: <linux-gpio+bounces-35007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBZMAo312GlJkAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:05:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8D3D7D96
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 15:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8041301D0A6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAA03126BF;
	Fri, 10 Apr 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEntjq+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idFNCsmq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E834E2F617C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826312; cv=none; b=PZxzRCo9JXRtFr/f2AcXF3CYn5+8s6ZJbJBFspYLlLLj7/6NdWyMjhrzDs5LqUV0nVimu7kn5/7MqEwRlRvSPb6tygfO7KjfW2ee4VOBErtWPMdAnWTx+3X5rzmVMmW8ziYKj4+mF2S161qTjLToDwYOEQlE+lTfareCR3cVCCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826312; c=relaxed/simple;
	bh=6r2aSZnVyktxNXguIsqv8rbhG8kjpenHo3yDdPaubfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0HmijZmE04Dd8k861wgBK16kHFJ51NA56g+SumXNbkU3Lqn3F/2aSx0BFUhdbD40ZEtn0ijJKSE/neRE0xdoJmoQYFzyAVSECQfs+DdjrYu85dTZ11MFTzdZZThEPe2C4jS6FOCi0t8lRYoAe69ImI2q2XKPPAeekVv9UaeMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEntjq+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idFNCsmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAStIg709301
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=; b=HEntjq+1sqbRiIcS
	uo2x/RVZFJ2YqfGBsnUEIWP67l3XfJhiqZGsdL7muNCTVJ6lM5A29m9a+PGEQMmP
	1rdh7eqYjK9gpCBkCgEseXoaTaZzU0NODe2JRYKoA3lc11wCEwGmgXl/ua5vROb1
	s0BhX5QbMGRNcSdHm+R9PkEZtymwU5GDiwPP1c3AXqouHhVvgZorcKK0mKUDClGc
	e5Abvk4u7CtA2j8tpSevsRpVSLZIzlfc56S9Rj4ppJhBmgYbokgvpiXSPU5iiOaB
	TBSe2PaDfsm1e2/kWmzhyH6WUTaYLb1poud3zEE3sfOxuJItuyMDkQ/Y1EKupPbh
	lGksOw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj1ftj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 13:05:10 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46fec31defdso2810819b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826309; x=1776431109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=;
        b=idFNCsmq4qS1oLEdUefGkbtj2oHeQcB4HcnuA4Txc+4FxAln1OqBW5nCYvOlIti7tb
         /3WC/nyt7C53xZfHJcJFoOMA1wSbJX4Jxlv3scnpXRL/aPrnrcaZJ6BBHOKuf1dkTp1d
         UpAyVYoLt/c9cnWl46348NSSZaCytusjxosl5ucufSQRx+sHkDHwfsTkRGvSa32sCvqy
         +EhUQF2pWkb9HhC0JQAh1GF+wBXa4EzkxBmzoRPQ4BcSqIvF9Nh6LJYW7J8tVjDGwWcx
         ORGsAnN5KrXi7r8u4icQ6coBwua9CVg3+Ppm8Al+qJeRRrBwzsDprzlPfOf3J1WkHx5B
         Aymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826309; x=1776431109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=;
        b=Wl8YYUOHTKFee+flSWSWCq00K50nZHQjBEoMosraynMn50aCjr6lHQ5Lj8QKSWW3iy
         0O8xA5hRrNPXeK7sOmi8gVz/83qR77Y0VeizrfPxD5HRPAMSWSIMNKnjRHyh+3QFU4MO
         jZgQYw0JNmuaCHWLqqg98Hdd9dPuXNcuTOiN9txFIRJEEH1u09rBL7gYgVeEkXCORS/q
         wAbtHuiyB+F+mMZAUPq8hsTNdbxWx1wwXDsYv/d0+Ydl+7MmVvYALP4F0TH8c70PDr9R
         dBZZyUOv8IyLT8l+Ypb3aMt7ZYWNJoOxBEuMLcW602u2BsIR//dKROKiguyt33m+8RUW
         QVJA==
X-Gm-Message-State: AOJu0YyUxL/dXZvoEP5Fmnhm/SQ+DvZPJfKHBxM5PZJIUTyEntxtwRWk
	XXG4viPsIBM+RSf2DtBwZNW+Ns08inlGdZsTLwc4yGDLbdR+1wZmxjMrKkmyBKcd6E6xakzqA/Q
	+9UtuC/20j7WFx5EFRvdaYsLdJOIyqachbALGvldlaf4AgjxVY+dvp65/SA3euIFy
X-Gm-Gg: AeBDiesrZcSuV7JQNNgfQCyVeTnfAvj02DC8Fi0+nLlUaHrAVeS1EYNQzvNSVtgPSdJ
	THVhtN4k1mdyO6o3vCMySHe3F00KavrbRCvUajeGkB1AgITZe43bA3JAOgpSUTqg4KChKjyre4Z
	avUhB8ga7KR3WSansv+w5169OTuJH2ZzZbcnJ7ZQTTGbgsMSMF232QgpnNfnnaoF/2oU2J4cBO+
	u6OwqmKtsUPvpT7Id8EpG1anU5hwxeFeUQkvG5j58v63BaB1jHYEyonbPjwPqv7lmctKPS6Yscd
	mUFgolKNB2EP48ZTMfkP+97xuypXKOGmKLoPBJXbRd+pOyHbpjUnXOAj9iAYP0g8X+CI3jNMst5
	WEuemfvrQ247ohmnu5lnHhn1ZlAAuyWIFuS2rVhyBm2kI
X-Received: by 2002:a05:6808:1405:b0:468:bfe3:17b1 with SMTP id 5614622812f47-4772c8a4eddmr3232819b6e.23.1775826309268;
        Fri, 10 Apr 2026 06:05:09 -0700 (PDT)
X-Received: by 2002:a05:6808:1405:b0:468:bfe3:17b1 with SMTP id 5614622812f47-4772c8a4eddmr3232786b6e.23.1775826308625;
        Fri, 10 Apr 2026 06:05:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:57 +0200
Subject: [PATCH 2/4] pinctrl: aspeed: Enable compile testing outside of
 ARCH_ASPEED
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-2-6f708c855867@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6r2aSZnVyktxNXguIsqv8rbhG8kjpenHo3yDdPaubfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV61KfuhzaqJkBRUg6EXADQNZG73hNSQCFms
 G4w2C0D/qmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1egAKCRDBN2bmhouD
 17b3D/9PWcOZ2o477Ut8BBdIYGaAxfj58fvHa+GCDp7OubNgeUWJVxzn99NDUAqMjjLSBqmhwuo
 d6ZiQgytlRcZH6OIyBhZB18jyPYHVGAt2ObEd4z8pb17YWwjQF0tBfGf2aHhXkAB1wrqnzVz8Aa
 2prJ+T6UCeKlDGqCSoWlSeKuZPI3vtWTsC5L/YmzAk83zY6jnIs/D2SKwnpKn/LhRiTOybAl/W5
 8PfuM9nIY2oAjBNGVik4v6zy1urWdB+3S0SYVNpBgGUXfL51BE1KSauL0Q6HPMq7Bmipk9azf/N
 SUBY82ia4Kv6SUsnSGhu+S93l+KsuQKefpkhPCIilL1THCLFvf7HmevNYLqnlQqL1OyjDhCvQOW
 Tv0FAuN4F8bT0D+71c0+4dKwZolTgqDlWpYGi7jiUSLKXl/Sb2mpc4vNnEoW2bBz37gyZkSGCdB
 0GK4+eOWsq71afa4qJejJdkQHZq58l7rnFA/UD4uPaHpXGbOUwjp26eDho2l+SiYEZMB5qbqjtc
 EHw3x/t5zEJLS56fKaUU4TxwRLNImBc4Dy8vmlQyWYXdO3z80dzAfob8h4n9s88dNON79/oITKL
 tCB0DUtIsLZq78Kb0UB6Rr8u/oGJJQTD+/ibJblif3FGMZF1+nqR6cFIuX4Lppc0Sc2799NZ4pQ
 Pt3C4Hf7rccooGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JmNPa8VItde3r_sBDZij8czy4QbLyqnQ
X-Proofpoint-GUID: JmNPa8VItde3r_sBDZij8czy4QbLyqnQ
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8f586 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7VIysbvwOnJS610hwA8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXzOAKElFqIMZA
 G/uLolpU5L3suRi0LBvnvFbAUPA0QCEcYWW4b2t2NyEhr62qTQIlW7jUvFXNi7HgeInHHz7cIYB
 rQ7F5xDLb+qYJoAnPRWYVJwbnaff6JG1n1WF3/BhSrNRm0EExTwUAvAFWZ80bI97y/C1cpy+KRu
 GNzFHjX3APrIrw2InSJbv6FshGIlSqBk/fn0CXmKuHBqqEyZl6stgSTiZRWaq/8NrHZ5vQIQx+d
 7ix8k6ECU2sCa8cF+xKrMt4t4+hYteDtm6UulEP6djlHFYKDNciUSSmJEfqvSB6/iHnb+bfKFNn
 SesWyRPgljjadq0BVAhwMgH4bMwFYjO0fgMUNGpc3P3K1n8XThr3LsQn7vVq9gNjkB7wkWZidSn
 1H3C16iyJMfrft6xHhCwdaybVlwJqBwcEju0c52kkrKkfEVRhkq+UWhGSLZuWkiyouwNnKhUvZf
 bsGiJBQV7k9d/SA+3Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35007-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83B8D3D7D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since inception in commit 4d3d0e4272d8 ("pinctrl: Add core support for
Aspeed SoCs"), the Aspeed pin controller drivers cannot be compile
tested, unless ARCH_ASPEED is selected.  .  That partially defeats the
purpose of compile testing, since ARCH_ASPEED is pulled when building
platform kernels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index b054cfb99348..9320ffae5f31 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= actions/
-obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
+obj-$(CONFIG_PINCTRL_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= cirrus/

-- 
2.51.0


