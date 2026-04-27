Return-Path: <linux-gpio+bounces-35584-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEmlCOxs72kcBQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35584-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:04:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF52473F96
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FB0730275E6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E9E3CCA11;
	Mon, 27 Apr 2026 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyU6p2XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXBXKoT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C749C3D1CAA
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298449; cv=none; b=AYEQZzUoRi3n1pXs9mD7xmFCYkaYacdXKEyDbPKI9bE/JCHl5KuTyjadhMolU/DW2qYzt/MZ7OhsO8ZY01h4yke2xbTMQeV99FU99lQGs5Ab/4lmfXEpCP/pbKLa0n3m2iWfT3208Sn4Ie7IE/wyT8eJ+3VxKxu3zzwDEmdOjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298449; c=relaxed/simple;
	bh=CtPtCsmZwOD1/yEeHHTHvFr0GEck+VeERmWbJcRsglQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRCNCl5Pohjv8zFpRH6n2VTIsmRmtzeXsJWvzcpQbOfVgrMLfBFBPWdh1p0SrEkHyqx6/UIfYodTyic0C7en/UHsPv4sbH2EYriey9UBbwhwm7rSIlOcETmLNIFUyD1JOcxxX4jcPYnOsOF5Sqp4pjpwBrRHv1zr62rLuO1maEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyU6p2XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXBXKoT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYMAW428827
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMUg5fUFKM28HHKnSHstPP6JoeUsxHqkx/cbc3k469s=; b=dyU6p2XWhEw2PdL1
	/+UTlHF+BYdHzuYz30HQWrmKahe/lavMrGy5GSNyPxEcuG2EU5shw+48Oj7XaRtn
	jzL8J476tu2bmWCEC0/35g/X6Ut27IaO0R+ovoZ3hj5E8fnI+UyceViJ5PujD+I+
	FmYFxBFlGavV2yRByJanL1b36Q6RRrQsK4HwUgQO+k/A8EZojQd3cAI8ojEvLHRN
	fUp7/BfyQxx15PGpgFAY4540L1uwPCPtaFreMXw7B8ODJVrKN44JKryLFbsdNO4G
	nvN8MASQbUX4uJBEnX70YDIMT3G6n8ZZ5TbXmbHwrBr1OWaN8fMxcSrAy7omSHDt
	VVmylg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x309tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:00:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-467e00b684eso12973589b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298446; x=1777903246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMUg5fUFKM28HHKnSHstPP6JoeUsxHqkx/cbc3k469s=;
        b=AXBXKoT2ZSg3OLfEAcNaabcLrpCFw9ibEQQMeQbIoRGodLtzYeXMti9D2ZqfTSYLpL
         oHcTC7pBmNYZYGtbrQmxWxifP3nTkiCuMT/m+3lZiOVRNYMjryANKXvwAgV4aFYPbGU2
         EPBSfr1541G276pYB7mEEVX8AoYUqDh+DdYm6ShQWDf+pjAZQFa0aSpT+NKPykyUAzPE
         d5hx+lIyn0HCXskI5YtzPxy7CqkKt8qeXE+JfBPoPNaQLPzkUEsguTy93bf8gEVRnHRh
         qnjW9SG7GfwyoC5c5fvb4CXmh5vPDrfTHjXNYZP9dm7U5dDbDiA7uX4JLIXpLJNG8abC
         POrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298446; x=1777903246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMUg5fUFKM28HHKnSHstPP6JoeUsxHqkx/cbc3k469s=;
        b=DeOcn9cUynRXvqOVDJnllMZYOzVSyUSUy4RAevqdEHExvt2gqp9niaRcYFOsceI38i
         0GunLYtoKT4JTssKFMI+5Qfalf7s5Y3Q7sRl5s65O1JIqRXNnOkQ8lMF1VrGPPYjMFC5
         U5HJSbxy2EBkmQMaYuHbHCegYDk+ev3ZDzjkidixH2/dXswk09JswA6UOvZjCtfA5+Qy
         f+RuMzuPfJStM1lzB91JLFmcbek5yZsqqQ100c/o7N7aIy+6Mr/OfqhImhWZrNNdVQ08
         R6kxusWVK4vEGFkzyMYAbzTLGxUpIoU56bNm365yHJvTwiIJQgeNPMINLaz2hoBI2X8X
         rDSA==
X-Forwarded-Encrypted: i=1; AFNElJ8MsnNbszcOESMzM/z7Q8KQCp5Ht37lWdwy5PoM0v1JjPNXazpZ0JY6Od3x9NuIHZM1gCkobr/aIF8f@vger.kernel.org
X-Gm-Message-State: AOJu0YwipS+0RyNYV9AjlepGtJqwEVWNLrD09R33IlIXmJ3i9j45fUBs
	DhWa/V7GCo9lZo1/Ht6Swcq7DnxGsmMzgfy2561/72fWsk2WeGNynUxutTK2RmFW1gh/n4KlFG2
	B/likA7eg5ENN1Fmu3i4B7eITTjOi5y2kExg6slvMKjr8/3PNfOIplHQgzArwlV9hbM0Xz7Gm
X-Gm-Gg: AeBDiesi+JTWyV4rZkU1j8/vrbKGcEW0//kN7mxDBVg3BMsF9e7gddFUZ+kkHbUCXyZ
	7rjP1MQ8nPr1cAM5nO4I7Joy1AZ34DS4BJLFsmo7CfuGJE3wg1Mhaqc+IxEfc6zdb2d3u2oGge3
	ws5V7YZF5hAE3gQN8SuOFg7c5EULAq21b0zQbHOwg3byhkWFr4DIqS0y/2QEFTDIa299oyvsgqC
	qdDmVeXhG2/KqJ+hT8O/c3/HnUuE0uq6rPWYPQYyQuAiz5arECM26opZzcbHlR6gyN8PTa5bbLP
	mfjZgKFEk7k20jyW/A0U3hGOAlub9lReibK8nkogfy8KZuovsaii/G8NNGb3M8+Y5WkKDX/n4TC
	33TNjCeoSUYyqsUyFZrfOh2rapZWhU10AGFg0PPLxaP72c3abuwqsIbo4iZvWPA==
X-Received: by 2002:a05:6808:13c6:b0:46e:df55:2403 with SMTP id 5614622812f47-4799c874fc0mr26537990b6e.18.1777298445477;
        Mon, 27 Apr 2026 07:00:45 -0700 (PDT)
X-Received: by 2002:a05:6808:13c6:b0:46e:df55:2403 with SMTP id 5614622812f47-4799c874fc0mr26537926b6e.18.1777298444683;
        Mon, 27 Apr 2026 07:00:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85d0:5328:3f13:c3e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm626849135e9.1.2026.04.27.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:00:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:00:29 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: describe the Qualcomm
 nord-tlmm
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-nord-tlmm-v2-1-ade8e0f3d803@oss.qualcomm.com>
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtPtCsmZwOD1/yEeHHTHvFr0GEck+VeERmWbJcRsglQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp72wGrFtI2SPRLKQgb5ap58UjP8gEcFCQSVlHt
 vZI1HFLIAyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9sBgAKCRAFnS7L/zaE
 w5NbD/4gddws+6L0kHOKC8BccOq2YbPgNB0iB8nKdoY6JeHRzLNIMMvZzwmBMVSf33ejhlopMJb
 mGr6GaxXZ8JUZOjMvgCW9jmC2kVDbcKH2no59W/8IR4yXwdwgDcb41OjWid6EXoVdKRu40NiTyi
 PXJU4aNjpPIjRA7ReGN3oxMs4pE+fVqtkrLZ+OadK5wsMbyJywVtN4A/U3O/TTzmj0q9lOHwbDJ
 0W3p0hifoeGA6gcLZIpbFw/3+si4CEM2oM5mL5zKDtbpLOYj1XkRWcwWM66uhvnSia2gykDEebz
 qGA8QEnvwVLgna6xwnkyfUqL1MRdmsTii/ziTjPbIQrslrOQssPIwTbRw5rkQ/ZIV53FgggkwR8
 QN96NNQ6xRD9Ncdx/Faqkp3+BcygP6e9xpei3zLgtX/dQC9mqnz641CBlxe1xPgmvjQM7jamgCE
 RaQLQffwGlXQe6xg1N8TsMSpWAXsMCbwyAO2gmEvbnhu2oxOIckWpdmYA91vjicxr8bSrcNQU9h
 uYYas828u5co9b7DIpw/kfqQXnFJkfjceHOlqcFY1CcPql5NG5uvjSEgK4ZSntyXuscLRPdE88Z
 teMKnJnTfePQpkVl7ocmERJPEUqobGQX+P6BzyHNXvHNr5oh8wjGe3P2Mn8Z3DNzG1LQC2Q6bSS
 2ws7YXd0yC9vWOA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX072N2L5YicPo
 tVRm4Ks5IYbezFXDlRtk2NCQRkQ6j/YCoRGV4O6NhizDe2H4C1YIY18DrCvIx3m5KPTec3hqeHk
 g4cSYboyxVSUfBoVJoeXgv7XTXdh5GZG112/vTGlZ6xZT32MAVIgcA4mnNjV1Hv3cjj1vFYZtXR
 6dBG3oZ5saMW6GQhxYKxADxQDVdqqPxM5ZP76vX6u04dl8hD8IAS1ccsE7ki7SHmrf9fjwtt2cI
 3HV6/TLOH4986vw0rFNnB9kGS6QbdP5FkAa6qmE/npUpZN2B8EhghFzBgca1of7xfgYJ4s/VX13
 wgyDgm9VM55V4frDs/Z4O0i+LEFidqyHwp0jj1D+BQrWlgAh4jSqIzed0acrFLTRTuNsq+/+94l
 RqqblWcjCBw0cjoeEodS3SFMROwJbyISnvzDar5DJVn4FrFuWpcknbeQ0ferVuqzSc0crqph4yc
 HstxRIeCq+ghMAPiSpA==
X-Proofpoint-ORIG-GUID: 4p8J9epzmOdxpMAwZnlSG-ablZZPsEUw
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef6c0e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NwY9oKpC6fpBCectsZUA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 4p8J9epzmOdxpMAwZnlSG-ablZZPsEUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149
X-Rspamd-Queue-Id: 1DF52473F96
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35584-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,f100000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a DT binding document describing the TLMM pin controller available
on the Nord platforms from Qualcomm.

Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 184 +++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b776dd20e15b6cfd3d99c7b96cf23733ada817bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA8797P TLMM block
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SA8797P SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 181
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-nord-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-nord-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-nord-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180)$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ aoss_cti, atest_char0, atest_char1, atest_char2, atest_char3,
+                atest_char_start, atest_usb20, atest_usb21, aud_intfc0_clk,
+                aud_intfc0_data0, aud_intfc0_data1, aud_intfc0_data2,
+                aud_intfc0_data3, aud_intfc0_data4, aud_intfc0_data5,
+                aud_intfc0_data6, aud_intfc0_data7, aud_intfc0_ws,
+                aud_intfc10_clk, aud_intfc10_data0, aud_intfc10_data1,
+                aud_intfc10_ws, aud_intfc1_clk, aud_intfc1_data0,
+                aud_intfc1_data1, aud_intfc1_data2, aud_intfc1_data3,
+                aud_intfc1_data4, aud_intfc1_data5, aud_intfc1_data6,
+                aud_intfc1_data7, aud_intfc1_ws, aud_intfc2_clk,
+                aud_intfc2_data0, aud_intfc2_data1, aud_intfc2_data2,
+                aud_intfc2_data3, aud_intfc2_ws, aud_intfc3_clk,
+                aud_intfc3_data0, aud_intfc3_data1, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data0, aud_intfc4_data1,
+                aud_intfc4_ws, aud_intfc5_clk, aud_intfc5_data0,
+                aud_intfc5_data1, aud_intfc5_ws, aud_intfc6_clk,
+                aud_intfc6_data0, aud_intfc6_data1, aud_intfc6_ws,
+                aud_intfc7_clk, aud_intfc7_data0, aud_intfc7_data1,
+                aud_intfc7_ws, aud_intfc8_clk, aud_intfc8_data0,
+                aud_intfc8_data1, aud_intfc8_ws, aud_intfc9_clk,
+                aud_intfc9_data0, aud_intfc9_ws, aud_mclk0_mira,
+                aud_mclk0_mirb, aud_mclk1_mira, aud_mclk1_mirb,
+                aud_mclk2_mira, aud_mclk2_mirb, aud_refclk0, aud_refclk1,
+                bist_done, ccu_async_in0, ccu_async_in1, ccu_async_in2,
+                ccu_async_in3, ccu_async_in4, ccu_async_in5, ccu_i2c_scl0,
+                ccu_i2c_scl1, ccu_i2c_scl2, ccu_i2c_scl3, ccu_i2c_scl4,
+                ccu_i2c_scl5, ccu_i2c_scl6, ccu_i2c_scl7, ccu_i2c_scl8,
+                ccu_i2c_scl9, ccu_i2c_sda0, ccu_i2c_sda1, ccu_i2c_sda2,
+                ccu_i2c_sda3, ccu_i2c_sda4, ccu_i2c_sda5, ccu_i2c_sda6,
+                ccu_i2c_sda7, ccu_i2c_sda8, ccu_i2c_sda9, ccu_timer0,
+                ccu_timer1, ccu_timer10, ccu_timer11, ccu_timer12, ccu_timer13,
+                ccu_timer14, ccu_timer15, ccu_timer2, ccu_timer3, ccu_timer4,
+                ccu_timer5, ccu_timer6, ccu_timer7, ccu_timer8, ccu_timer9,
+                clink_debug, dbg_out, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi0,
+                ddr_pxi1, ddr_pxi10, ddr_pxi11, ddr_pxi12, ddr_pxi13, ddr_pxi14,
+                ddr_pxi15, ddr_pxi2, ddr_pxi3, ddr_pxi4, ddr_pxi5, ddr_pxi6,
+                ddr_pxi7, ddr_pxi8, ddr_pxi9, dp_rx0, dp_rx00, dp_rx01,
+                dp_rx0_mute, dp_rx1, dp_rx10, dp_rx11, dp_rx1_mute, edp0_hot,
+                edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd, edp3_hot,
+                edp3_lcd, emac0_mcg0, emac0_mcg1, emac0_mcg2, emac0_mcg3,
+                emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg0, emac1_mcg1,
+                emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync0_out, mdp0_vsync10_out, mdp0_vsync1_out,
+                mdp0_vsync2_out, mdp0_vsync3_out, mdp0_vsync4_out,
+                mdp0_vsync5_out, mdp0_vsync6_out, mdp0_vsync7_out,
+                mdp0_vsync8_out, mdp0_vsync9_out, mdp1_vsync0_out,
+                mdp1_vsync10_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                mdp1_vsync9_out, mdp_vsync_e, mdp_vsync_p, mdp_vsync_s,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,
+                pcie3_clk_req_n, phase_flag0, phase_flag1, phase_flag10,
+                phase_flag11, phase_flag12, phase_flag13, phase_flag14,
+                phase_flag15, phase_flag16, phase_flag17, phase_flag18,
+                phase_flag19, phase_flag2, phase_flag20, phase_flag21,
+                phase_flag22, phase_flag23, phase_flag24, phase_flag25,
+                phase_flag26, phase_flag27, phase_flag28, phase_flag29,
+                phase_flag3, phase_flag30, phase_flag31, phase_flag4,
+                phase_flag5, phase_flag6, phase_flag7, phase_flag8,
+                phase_flag9, pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                pwrbrk_i_n, qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1,
+                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
+                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5,
+                qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9, qspi0, qspi1,
+                qspi2, qspi3, qspi_clk, qspi_cs0_n, qspi_cs1_n,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4, qup1_se5,
+                qup1_se6,
+                qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4, qup2_se5,
+                qup2_se6,
+                qup3_se0_mira, qup3_se0_mirb,
+                sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
+                smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
+                tmess_prng1, tsc_timer0, tsc_timer1, tsc_timer2, tsc_timer3,
+                tsc_timer4, tsc_timer5, tsc_timer6, tsc_timer7, tsc_timer8,
+                tsc_timer9, tsense_pwm1, tsense_pwm2, tsense_pwm3, tsense_pwm4,
+                tsense_pwm5, tsense_pwm6, tsense_pwm7, tsense_pwm8, usb0_hs,
+                usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs, usxgmii0_phy,
+                usxgmii1_phy, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,nord-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+            pins = "gpio147", "gpio148";
+            function = "qup2_se2";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.47.3


