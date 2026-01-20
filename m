Return-Path: <linux-gpio+bounces-30814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ia0JTrBb2lsMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:54:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE7F48E61
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA7117EA41D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD84334AB16;
	Tue, 20 Jan 2026 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1BaEcfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMGeW3WH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3B40F8F7
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929830; cv=none; b=F/Gz4uWsQfl/i1XLOB0SFte552r7+EmLDDuOcm9laPU9Ik2iwvArJMAp5kgFeRZfdQlPkgcW2QbAddIIOj31FOM9Z+zhtFW8E5jigpcFg3+Aywcpp49zd3T70dSAwoqhAa05jXNQOrsfFG0DP/VkgVp04vXUDRFvGSmp/YwvZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929830; c=relaxed/simple;
	bh=U9guPNubp3pjZxkbwEiIBcV7mdq7QuDn1LJeqIkMOQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plKVdBpEFHk37grDQiP2W5HVXayC1iWswZFOhPDCqsYsYIKFeBNrJX9QPbtUadDmM3JEPHFPZo8s7PRhoOKNLoAjBdWpfrTVMan5l7fD/lnhFdG83hPku3JpAI+6BVBgLF2F5ney754dn8ZWePy3S2zkcHg5HjQKfCU5PHO3bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1BaEcfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMGeW3WH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KB6sax3252530
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=; b=P1BaEcfxU9fAjIsB
	GixtlbWi9IzCUg+oYd8B3846um5QPdKFdsiLL0IjRQQHg9Lu2KTHIXzVICIpMl2N
	OnD3I9p/PsLFv5GoMQnm+d1quEeC/+iqi4Vgwrq3qFYDhXfl4QZBthciWu3KvQ3b
	Pc3tllZh9+SP+WfgPeHdIo5/KV0PMOPwMuFJHmW/eooIH5mv0/azm0tIuHiDoVuu
	4E3VNMQ7GNgDeJbclG1fL4KfLn44b7GQkWR7afLpe/0J5tD6q8CRR9noQbSAIXQd
	H4/Z3MWql3vspwA7+BAaeiAfvdzOCENPGkFfiMaTbEjOloXPkqGexiaauvHUZe6C
	C90BTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27aje3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6e793cc0bso1923301eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768929824; x=1769534624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=;
        b=MMGeW3WHhHzXkqrcgYs7IdaGQlh66vA+w9+GbizgxGJhQ38H1JDpJdHsek/WJpjJf4
         ycR6FXzLdAJ8R4aV3wqNQ4+xTaBMH23qZRiR8+ja2Gg8YgZtIYGxqcEeFtIinQshgejf
         /xp5dFGHE9pUXeLlUwH8PdBn9b6a/bnxKuqTfl72iNfOrB2TtLhV65hqr0I6NlGWsEyP
         YjcWBeEDj7wGH9AsHX6VuW9zHulx1LNFrGeWoExREL0ITg6ba0uSiRUZUUVfzXvwz3gh
         m+IU9Ty33Fk647fPI7+L00CmF0v6mFEa61JIM7MGNg38MgNgGXyD5xjTrKtcsbDnbOax
         bF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929824; x=1769534624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=;
        b=A3U9p6EUb+kTKU7kcSfC18xEHRRk6oPheL2WWP3n4n4UyrNN7iZr8vwva6R/LlyvXs
         tCVAgdOC6tKyTJvpSX6sETVtIxuxXq55hl3jmJYeJQzX/+cidGWY5NUDrvy0Af/CAXgG
         K+QwxEYgyBruPVeZ6dZCYScLVFGQ5hSFtVEbx88nHAq8bINHtMPWLl9EkD+/CVmbkfQX
         ueBVA6gnrpNtvST8qFS4hViO69d10CLlszZ8vZIP89aC51JLKZmqssXmNbKDIRfXBBBC
         up7GLEZ+1hu0sUU/bVScMS2SMKYJtBCqQil8Agm03UOXNg5Vr6/txVRPmSR5od1h3bzx
         y2vg==
X-Forwarded-Encrypted: i=1; AJvYcCXyCEWvYfV0J50U1XgSsBDumDkAIVEQS00ZeshLbnm/7qkURNnTz1M2bxDHyxriIznkUueXOU7HRKXF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHSNQlydAeiix1nBsvB/OWgKHGpMAqyfkmw2QP+3QVqf2AU1j
	9MgtG9vIhnHPDEjqcY+U/zYVhpfLYplAywYQUx0ntwUvGpxJ0Jp1p1Zlnw2RtFfbcsULNmL6jms
	bf/IAIejbGSl0HRD5pOMZK8SOCKIEQRsgCVUb2hrFsdATRR2/dZd6P1uoCdNfu06W
X-Gm-Gg: AY/fxX7TUu6x0zKDGeB6VZ/RB4Xl3wOh4fsb/aoFJefWlzEQgEncgAPJn6AoRF9k3ZN
	DGN8PA50jy6lRrZZuuA6CmmHMKGVqWDztD8FNB4S/a+A4qFhsQvp4qtcoU/0KJeD89P02qVohiF
	n2VoNqdiq6L4z/xBebdEn0FcYPI7M3tZ+o8KcZmVHzAu3659fC/dH7+8YET4V82ndzCSw6Yzyul
	jhUY/ICfzo6B3shq3tLedkJt3BgHjzQ80qxbhAB/xiqEKuaNnGAgZ6OBgrmAsTPc1WPlb6fK+lL
	2D95RxgHM2rIWf71OhGMdMrex+lUnIYudDAPwCvYmTehWvZPtXdpP8jgqnkA4l/+UlxlwHLp/78
	JzDciTGLZvNnGLlzuDSk77Ki0uBmSxflTzqYm92Fj/Dc/+bEHLwouxlYBlTk/wpMF5mtsAizSjQ
	==
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id a92af1059eb24-1246a9583ecmr1721513c88.1.1768929824286;
        Tue, 20 Jan 2026 09:23:44 -0800 (PST)
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id a92af1059eb24-1246a9583ecmr1721480c88.1.1768929823571;
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm18714842c88.17.2026.01.20.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 09:22:50 -0800
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,glymur-tlmm: Document
 Mahua TLMM block
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-pinctrl-qcom-mahua-tlmm-v3-1-8809a09dc628@oss.qualcomm.com>
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768929822; l=1230;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=U9guPNubp3pjZxkbwEiIBcV7mdq7QuDn1LJeqIkMOQ0=;
 b=3b3h+e0CRgHdu92gZr2IUdVPdpvviVcHJ1B1pOdlsKKRNAx0mhyGyYfxpPbUROrD9fY7gnXfs
 a+DdAv25YbZC/rQ8NQ6nAxGOtrjlQfyW0PIOd6qQQwMiQ6CunE52Aik
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: W7Wtskg1RaSipGIxRHk5MFrb-49KXg_7
X-Proofpoint-GUID: W7Wtskg1RaSipGIxRHk5MFrb-49KXg_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0NSBTYWx0ZWRfXzPx3aENKCwvb
 ITlgnVacl3Ue4JdnzEpZs2TT7P93v1ngBA8KYLVHwdtOsk0rDUMvbSmUxlLPHsVlxwLB3sCwpXr
 c4FNKxRmtRHdQY71WfUN5ikE464ukndJwoKkqImylQpbyPfquN3NeyLlFyhBHHhioMMfcGMks/l
 X4w2048qfUxKvs1p4tJtt9Wwy+2Fc6uf5jKzCBqjtscO8ScGBWJ/CONJAQnVa+ZzetArI3GbZf8
 9polYIm5p5gDYmMSH9jkExx5DpoEFTNm7n1PRQEUyz4VlDvgMNuewQWu0pjMgrea5wdXO+lhw3v
 muJaPv36PJ4P194fpMbQeKrTEWkAaB37Evlm96YUVCEF/oSpbcRCbadVQYni6hvCMN55XO9pd+o
 lVWZJcJHON1BCyOpUxpZxitWXmAbimjfbhSz7/p7n2z7EzJaG9F4Fqzi4WxbdW9Hyr5gGEIT5D3
 CJQKH8cQUldfTb9CJRg==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696fba23 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_GxIMNjxlj-suDvTKbUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200145
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-30814-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CE7F48E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the pinctrl compatible for the Mahua SoC, a 12-core variant
of Glymur. The PDC wake IRQ map differs since PDC handles the interrupt
for GPIO 155 instead of GPIO 143 as seen on Glymur.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index d2b0cfeffb50..2836a1a10579 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -10,14 +10,16 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
 
 description:
-  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur and Mahua SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
-    const: qcom,glymur-tlmm
+    enum:
+      - qcom,glymur-tlmm
+      - qcom,mahua-tlmm
 
   reg:
     maxItems: 1

-- 
2.34.1


