Return-Path: <linux-gpio+bounces-38219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u+aCGh0OKWr4PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD6666818
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kFGWaWvf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lk4SQSgf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38219-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38219-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D342630EF18C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2E5388369;
	Wed, 10 Jun 2026 07:05:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CE386562
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075157; cv=none; b=IPOauCVt76Smc/zi2JLH9GAn+3RzQ7P8BjxSGLJ65hUvUUpFyCHEiSkw+dTWkrJoABCqeinV4+rTjjyNuwVln5sjhqZrygzfIL62RfrX8ksmFADHiJ0uAvYJFNlWWzkVxcWy0jaQ/wrkb18ioJR9gddkGR4+sR9PRxvlDC430uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075157; c=relaxed/simple;
	bh=Pfha4C68zR+/bdEEvaPYiNDvDkuwpa6n1rETcsHa5Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdSF5guZSMKEI2ike9Lh1ezkHKLpjHMQxXCAJl9zjTRd5+IRvhKK8pdFc1ff3CfHVvOXlDtGtedVBZDb9XWM9GSPPmB/elvhURzDJQP2/xCR2Zp/wMPHYmmtxlbE+9cGtazS1H6ZFthY+JyoJatLSWScdJH77/BV2538dSm9MfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFGWaWvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lk4SQSgf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ekE83999751
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=; b=kFGWaWvfOM8luwkW
	LwMloZnRF6P8XAEMiyQ2fW5IpfGrvx1NsI13sDzs+I+CdHCTINhY1GSEg0+/2lYc
	VRD23ALVbciCebM3aNtU/r31IuC5sppte/ilgPTvTxs8ZcQ+Hthoag0YlA6evG1/
	E693T0KwSWzFmIBZbKoJTrS5VT970slPASrV2UNrsBqauABCYX2wYtjHkOw/1pfK
	Qwq4RJ3HYpoBD63DhGGWTvzomT1oUI9ztywWBy5ShVX+eitrksd8n1MHYTmP43Yi
	IUVX+CkLh7vlhCItLIGafSdlcGsN812G/5FfcBEOlyI5bS1MxLzvHGrlgS0kQVqR
	0/0vbg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvgx9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so6520111eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075152; x=1781679952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=;
        b=Lk4SQSgf/gzPxMNHR99EkTHA40vZU+4MFAE79eN/a95kTKJlNeQ+xOjpWkCtpQRNKA
         q3ySQiJ3v0TbbLcO5/bewb6nwOG+ayRUKSNd2pGzmuIb8a8oUC7K6dyhklfvNjmpi0gt
         6l9Yg824HLTVbzSKhT5H08gVe0ua9pHGWUxxLfHT7nFFcdxMhkLHBsZ9Sl8P1wCQ0wZW
         6UJwXdMFs5LnL3T+RHIGOVpMQ0gmdWb1AvHXUd4p5K/PAnA4Gu0x//3UB+bmjK/ObtfO
         6j6Ftf42ZUZHuC3dRNlcFQZWuz+LgpDU4gOR7Qf+QvUitKiaNm/aiGAASD13zoxAIzvc
         5U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075152; x=1781679952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xc3+QlMM3uFkSoTosXVsY+aC1p4+Q9HAjtGMte4S82A=;
        b=jT+nMf9NygdDmODhGJISlaAWexBoQ6aRZmjSv6wR/hRrJhAGBRgiNoZzseSz+RaXtf
         LuMwt2mHCCkcc5gqKtWR8GqmczPfbBgDHphH5Ed54WL9vIusESVtDilc3QfsqPKtKzuc
         H+FPYkcY4ATtPW98YX/s6Cj9ggx96fyf7MhdVa9uno22m4Wg0jQP7gftb1NyM4K+J9Si
         c9lIx7BVlmvXaBOivTv4BdhE5Jsbj4c2feenv1mZv3pL9ltfUC77hEKO44HFt/IfCbIx
         PO0wx224Ym8APlGNS0ftBhKSqrabFhS7Zrn3ttumB985ZjpGp29ITV61NbpsTlY6vEnK
         pSVg==
X-Forwarded-Encrypted: i=1; AFNElJ91JSEoJx2nMtEDtNmE4XwOIupxowatiXA7WhGkLMUHulpHrIgBLNrxFAGLm90ewRU2F2aoBPGLL5ds@vger.kernel.org
X-Gm-Message-State: AOJu0YwaD8pwUUdlwniEy7wqjgBD766K/+E81gCm1y+BXh4ozbqsm+QK
	1OPWIAtl6hMu5MbhG4u3t0aZqBz/vfZFLF+0SJCj+AVVmcS7Kkt8UnsuXp9AkSxlaZPSD6EgrsW
	lhhkWn6W+bIs2CtrUW1EDloda4QRgvFEqN+bBeGWJT01Q+B4tuSIb+4+pgsSUrpXK
X-Gm-Gg: Acq92OFWapT8oKsl7RVAWUe1iOsnp2FkNKDkDWxlmN4V1omWoIBEjXMhMTZ9mUMBgvX
	mpg1Ii6eQvwQJMXOU6uWjeECR0s4W9WKrZCs7Ts5unIMgeEWdCACG3TbKZ9chy2WnOwoP6Cbez7
	Dkxae97w5u+iAgzi82SE1WBmYWU1bbSp7fwXv0bS9HuYf59CMmOMiGeLIO8e2wK+Sm6w8TJ7QQH
	baEhTthLqRlNKWoqd7MIklwK6dTpwLuNdndmBHiOn0mJ72/Pyei/dOb0fRC4+/Xl0QGhOtrgOWQ
	Qy1si03E6KFexSyx5h2AfwbM5PW7/DIceFf4UCrW4//Un96WrSi1GDzVagpks2u5XxM5QhG3UmN
	uHdKiGhKeA7pxgF/r6r+yxknAj3B+wdck9Dpy6rYLb0Woc6ZymvZoyhgB/PJvukolnt1wflaPX1
	ZDAPD1b1KW
X-Received: by 2002:a05:693c:2c94:b0:304:b14:ec53 with SMTP id 5a478bee46e88-3077b30eb24mr14278259eec.27.1781075151842;
        Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
X-Received: by 2002:a05:693c:2c94:b0:304:b14:ec53 with SMTP id 5a478bee46e88-3077b30eb24mr14278224eec.27.1781075151246;
        Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:05:47 -0700
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=1044;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Pfha4C68zR+/bdEEvaPYiNDvDkuwpa6n1rETcsHa5Pg=;
 b=iuWdV9zzzVMAMsGBEbwooYpwVTpXyzeYsymsffVHBp7X5KaQH0m22iGoJTm1qb8iXuXHkNInq
 7UCcgvEj/8DD5Itbr5BTXQfMNg491avEnZEqfOWBB2S11Aswk814256
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: GzixdwX3C8cAmIc62lnmQFPwHY57vNw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX8hMPOyTkPoAn
 F+zMwcY7QJoSKa57xCKm+FP/bua+lvFZv2pyGfcKxMCmaTrKOGtZWjKd5BSBvwnuWYJKTZV3vc9
 LgQAdjxe9gGrpV8zTlS4XtD8PdxkUvRFLGP4i9rCSuCegfjJvL4trFxRYh6C4u0+4QX1AV4jQ8q
 r32n7PASPjtspZvcAWHikLFgk432PoGetld6eIMrljASJ22B32KyDuA+PfHJsL00aoO9Sc2TUl7
 R7vDs+JMTWKoxmUiaodYQowkIwopMwEg8dGFgzLekpVsfkGqFOHoGxYUGxQgap4ujL40lTBzymB
 y12UK6Ne7A4jXLBgGR4BgOkbJaxOOM3Tn7ESLM/7RySrf8tRQZBFceC/XE9wWBDCesUdD3upsuG
 Ns0msGk205MDFj7Ax7Plfzqq6m39oVrmopdVSa1wEbgJtX2ZTGbbv8vrRfbHVHVxtqT8lLTpe7o
 F9R0BEmGoPZJ4iNiW2g==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a290cd0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IexnuNYFraQ-YrH4PxgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: GzixdwX3C8cAmIc62lnmQFPwHY57vNw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38219-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13BD6666818

Add PMG1110 GPIO support with its compatible string and match data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d02d42513ebb..01f735ce65ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1261,6 +1261,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmg1110-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmh0101-gpio", .data = (void *)18 },
 	{ .compatible = "qcom,pmh0104-gpio", .data = (void *)8 },
 	{ .compatible = "qcom,pmh0110-gpio", .data = (void *)14 },

-- 
2.43.0


