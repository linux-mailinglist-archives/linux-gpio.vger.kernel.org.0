Return-Path: <linux-gpio+bounces-40127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7kXxMGSLV2qMWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:30:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30175EB0D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=clQbA6ia;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PGTBc766;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40127-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40127-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C2003051C50
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D0B41DEE5;
	Wed, 15 Jul 2026 13:22:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C941D644
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121738; cv=none; b=ctyPOoB4hzA0/FRxgrO7pPnuIkcxtXZh+lCRgKDu8lBKC9UvvcEXpzriHxxot6Om1hQKAQ1mld42EglF4szbkkHQn5vrCeO9B/WwNqU9z54HPn1kLH3GN9EZQzNrua41PsgUXlYDe1IRYw/dqnuXB5CawNDNJYUG7Jdczk/HEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121738; c=relaxed/simple;
	bh=cAarEfDJTg9x6THkit0WCQiEr9hmWbYzl7aBt94vLGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W3DbzYlzqqc38nMnYqqMatkSmeGjjQnHWQJ9HsgIGo2uVXHUPOpjs9XQH3sinaY060uykjQ92cLVV//Ec1SaQHV8PL4xXYic3yWFIzeh7HRpw2/QTnQBDHjElLXdVz3xuS7rlk39eMwdk2RVnqyqU/LvcOiC76eAnojp/p7JKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clQbA6ia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGTBc766; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBckhA3480296
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScxMUAEkJz4
	WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=; b=clQbA6iagff0rjCTkkdeyPgcvEU
	GTBEpbJmrh1Lifx7yj/KYlFevvsIJeMrSd1oRWinDTIk1Dl9/mremX3jn6YtsvGq
	ke9ieovhxYiKLpbPwSyxMOTKlmz9PVUHAyvTDqpICox0AO+yiX/kIlWf51k3Tv0C
	HKsSgEwf+ssqvYD4CvJlxPaJjPzJkM7ZITU2SBfCm6B19So09Jo6/25XErC2BHso
	+d5Yzr1ULgb85wu0NRkQ1yoC1tFLmt0Puqy91XY6MlwnXJHKCPXWNltZ3J7ndmvw
	eECspauHEM9odg4CNOSnTYLwrIiX+r9mF9VFEJL7reUrd1Z6zD1lzYOZAog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h9gpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so25294256d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121735; x=1784726535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=PGTBc766mtBvUuhkfahBWstf7JTnxsoBk+gaJDliTOqhfOQSwScyKKpDfjZ3fjD/Wm
         v0VNDk7kBs1LSjFeVGBovgHAOwKnK3fFLvIis0Pmoh22HdwsoM5iJC4fC9ymJf2sQi+R
         kKLPvuR5elKrDZ94EUwRARtvEJqwTHJs3FTD6iSK628B19lmNdlyXZq0e9LAP7KoOqL8
         aiujKE/eYY3VJYUm0UyRJEqiIr3mFHZPL1PCHTZRJyd3dSh493ot0Mi41eyF/pOcF+Sz
         KMCuDVlYlup8sMArcumkjGEOxvJI+OuKkdHlrop1yLVYSqZ3gvUq92W4OJvoX18OSmdL
         RoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121735; x=1784726535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=BYqYTWBftJpBlMGH/x+7kzKaTH84Ath88tPeoksoF5h3w9w0hm+nbrNTfDczWidkXU
         g4VYWtlkSxCWYpPvCDXRSmv8JaEKfgLgSVi5u3bMXVqrBTI6xhMLhXj+vcGwni/TbWbn
         GNplS81Py/bziRoT49TTzHHQoGNmG9YD6dDcq700cuRjeX3e0NqyuALGIcwh8UVPaWGV
         fp0DaUlgyJaWsFpcEZyqnN/Ud4JRyt3vPvX5+/pW13u1c8lhZt5zD2+ZsOqOmvK6KOJw
         s1skJqZns3uqU1xhqSGNUIwxCRo5KYiSDjG2UgY0alh+vz0phQtdTG2nWnSnlN1SQJQI
         Y1NA==
X-Forwarded-Encrypted: i=1; AHgh+Rr014Z8h+Rpgb2632KcXKvcv6si/oBc5Q42CpFh2hLPlDWpZUkGR5LWWoYSioGPyQ9SpeHKKfUx4tvX@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCunEvRhTbHzM80Mrhz3AeaVPXgcuFoPPuI0aZecP2+iZbrzW
	IX7ZL1DhwfYLvANsa/40rQF43gLJBq2jZscOJvAKaa3/m5FksY5XJ15K0OTiN0kx6u7ztgxFmBS
	ughyImAfQ9Q1yqoCH4ZlJQ06ggvRCq6aPzwNbaJwb47uiQ7bkI4MKSYujNGmk3Xi8
X-Gm-Gg: AfdE7cl9K9N+M+m3uHENRspItSVPgdbC4ATUj6AKjsHuMX4dkdK+Ii0a9b77vsc7Nng
	qfzvxiBE6NHizMrqGLrdlTdwe+VKfmVGVL38rO5ftgxru67fWMkKsKNuVdotThLIIZC1lBYYXLZ
	3W9MM0zXoHSOP/STH7Y5DDFhtgTHmvATo35LcHOy2Y2eRLmBw4C78iERKtFR1FdCGAnBJhHkClO
	vJOMMvMmXIcwBEpeh4UVzCok4k8MtOasd8Jpj+R275eZhnhpUpZ3CuXr4yUAawbJ2iPFmYkn1j/
	QfaCwUP3N1cCz7dJzzCXoJGabOWGIs19hcsFRbXfXJET2cSBpznKsmZVPpB3+J21Tw7+sEaIFWH
	h3v1fqJ6f3MytOboWi54LcsIx36T170YBAhhJIeaI
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197442786d6.24.1784121734928;
        Wed, 15 Jul 2026 06:22:14 -0700 (PDT)
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197439996d6.24.1784121731333;
        Wed, 15 Jul 2026 06:22:11 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:10 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Wed, 15 Jul 2026 18:51:49 +0530
Message-Id: <20260715132150.1322663-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX4yzG57gFH3uB
 snBQ3EA3MWByLdu+AIbTZBFaKo9gzf666jARF48zIREtyFj4Aj1MFphch1JT5yg9ngtYwDPX0Mt
 BFpriWe76sUJwjvhmZBXCc5x2MnmBa8=
X-Proofpoint-ORIG-GUID: RGA39jzTA2gC906pIbdqc0hjhqU2pkV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX4rSjiGjfVQPO
 ++fWANQvicFIlCIX9ZQWc/N4orleEMrK5m4wGBNfVZYYf6We+SvDD9A46PLMMazm1IbYndWcqH0
 /+9EWoOl3tJ6ebqNoXX+/bVIULrIIKahwiSdQG/lijdrGi+CiigLA5d9bwDO0neyknXJoqWK/bA
 qQvTaJt5qWMNqi6z4spFIRKEJq/JA85bF9iW+IPZtDzM14GdEgh4WmpsqiC0Ra+YflFECexRrn8
 JRwy43oo9zoOZbngdiFKEs6YPXypWA1oRxmIVV6mbGcyJRjGe3iRBv2211UVtESz/AWPU1wNKUQ
 0pH2ooZZWm5f2oAaGMABB+5TwTRQ4Ee29qyvKs+sY4rOvPXXtYE0lR2Ih3keLhOmcnA6qy8L7vT
 exZwydHYypv4GXCpnuH9jYNEOOxQYymX8+7bAQyCp8iaH4PcqzOMP/K5SLQcmk+QzVEtA3R5ybl
 GZesCkDWk8LiKdgRleQ==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a578988 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=AILnUmMEF99VWB6qR_8A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: RGA39jzTA2gC906pIbdqc0hjhqU2pkV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40127-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD30175EB0D
X-Rspamd-Action: no action

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..86c1da0f577c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,eliza-lpass-lpi-pinctrl
+      - qcom,milos-lpass-lpi-pinctrl
 
   reg:
+    minItems: 1
     items:
       - description: LPASS LPI TLMM Control and Status registers
       - description: LPASS LPI MCC registers
@@ -74,6 +77,19 @@ $defs:
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,eliza-lpass-lpi-pinctrl
+    then:
+      properties:
+        reg:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 2
+
 required:
   - compatible
   - reg
-- 
2.34.1


