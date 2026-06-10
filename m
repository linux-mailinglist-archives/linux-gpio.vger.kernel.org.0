Return-Path: <linux-gpio+bounces-38249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3zwApNcKWrCVgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 14:46:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45866966C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 14:46:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=myxuQVSo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hIksXlts;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38249-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38249-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B1D32D4A93
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D233FFAD7;
	Wed, 10 Jun 2026 12:40:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6424E374A0A
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 12:40:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095259; cv=none; b=S4W2nZhURWS1TwQpFZoY7Lx7NyLlJx/EXUUIXEPEWktGmzC/XvNtc68egQ/nqTDpjWdeH2DJLe4Lx6SKIP3d0/fOrEfImYYwR0e8/fkcGw5G2pExiPrd8xDwnzXwMZjUsAIgeYzJphMFMAzLLPrVz+ov5zYXcxRBKeVCT2QrqU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095259; c=relaxed/simple;
	bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt8KFnKtPS5xL2GDIz9Px0XYNj+sN8o0f/S7g21aOVwAk/UrPvHOwm4P2dRQJriJFKakXMaZN1b1eInkEgIZLR2xfWgjN8AcArnwjv8vxozxteIWWrR4UftjytPz51+lX/zp4wMhPt5X9DHzQ6NKbtirN/x0tqghnFYIRqUu9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myxuQVSo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIksXlts; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCAW51511888
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSe
	zbVc/54w=; b=myxuQVSoFBqe9PqeFUhG4uUZcrOcuWZHt6n0iIXBECzKQIBwXTf
	SuUeVSCJLRvjwJItwfkn1oS2hNJGx+esp/ArJYsgqE7GI4BaNHh3IpCHMuqJ4WZs
	jEBvLxwwLkLqYbYU7YPeC/zWY3KKNyRTyXEGp6OE8B3E6OjDoTjWysiOaMWcbG9w
	sZdn9udtCCHL+WYOq9Ck+yHGrnIIvXu+l2xj5A9ThKssfJr+Xc5Zit5/UNVSxrLN
	27t2unWtKE7kLyyhTJNCz0HMLQ8qfRZtTkD+xklykjekVpcwBe61YbtomxckUfMV
	JoW5XePHfTOfroLTd8wUTc4btNsk4ckogJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epukeu068-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 12:40:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517a00fbac6so16532941cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781095257; x=1781700057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=hIksXlts4muFcUz3sUl2Rw9yW0zCc08e9l+Kcx/qllmEwXw7UqUeCMDZ6dqq3i1doJ
         cC2wGrrHVJ5YxdPFxOz85b/MBpUXGLxlOsBPFI/BWvNkkTcr8LQBqmr9tYx+tRHiWAN8
         rsMyffNAEKya4+S1/crSKpHebQbOIt0JVUyTdh64qKRhWjJPMMyFFPKOW4DgkjXD5U1V
         1T9PS+WTfL51XvOCl3lLwnf2EKvn5tsusGYKEHlY4+v6ijduSLpXAA728XjtDp94Brif
         SzlcMLV4Wq7HesDA9/uiheq8gzosfGC9EUpN3++Ga9kWfwhSyPV4bqbS73lBSDxaoAMD
         N9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095257; x=1781700057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VGykQtzN2390G8YWsdFS4aw1NuPSxIeYSezbVc/54w=;
        b=slgVewZQ7oqaoaD1ZiqQP0Fke6mVFszG93+EpE7sC2louX1nAstj/Udj810V5T60Wp
         cjw6/Fs0v34CISpdzTiyqkUcj7XOrZsdPjyBcA0uu/U9c9t7m0EENcd+dIWgSitHMM6q
         mJulhWTDyBjwRvy5N/rP5mdE3wZcS2D4iCkSJBMQdkPsQWOejvB0mk/tVwG6k3JeeJYU
         7azcopnVPY+kO0CvvDzA2k2wMkzBQHD6zXSke9ly7uHSQHOtNnWKmExgUb9mdkwaqyCz
         4ZMWo/My4xJ1cBUZ+4m0MKJSs0YPV9Ssd+JUGnaC29foS5vBoaaoSB+9dbWCMyJziSI4
         wS8Q==
X-Forwarded-Encrypted: i=1; AFNElJ84cNnlpbEEzQ8lnLYBp84NW3tu4VkVMwqqWieCPvOkPU4rtlsoW4MyisnWIUrMW8RVxp+Na0xrbNuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyOhbrH3aMLzm8z9oG6Fl4NZ0QUCL7PPYvv2lNQatWcKBd3wTpz
	n/5ZW7I0WVjKMulYfY3/iDYac0QMkhLmm/tvXF6q9iumSaLLkGs6uGmHHvNbbTckZWI//Qt3VsJ
	rdEMyXVejnp3yi0jw9kZHVLzkvzVGJFZz6rsMi5BHXIeeJdzaW+mldRuQFxufL1LU
X-Gm-Gg: Acq92OGmrAZWScoXwbNiJ6LlF9PlwR9hfjT64eez46xTTY7CRWw3Kk++ZAU8Wm8lSgL
	j8YJHzZ+DeBVDNdHayFFdKklYlw1C29sCHDO6QmEJMyKgrahzfZV8C0HnFBlJ1XuYZ9mNmPV1DN
	g7TAEchXEDNBEfMyxxdRyR5/spnRDePPtU5YuTkfW9niFWHvC7POiENUpM6Z5wV6sibQnND3l5b
	7alb7UphgGraWhw66qAM2Iz6J6fkorIUAC0YYx2a9OCnycinG8PQgo9F0kLD0cyhkuemqj3C2lM
	qel9t2kKIZNaV/yAqn5fME06eoEgdVkHzzpgT1QklIRDgukOiIgJvXwaqIVR9gFr+MyOeAPdQdv
	lmqJhdMSBGauNpz/y1wpwR9G5KbHkqFIlfa7g1NbP7zoxkj3V
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371949021cf.20.1781095256725;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr371948311cf.20.1781095256104;
        Wed, 10 Jun 2026 05:40:56 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc472f13sm27731015e9.0.2026.06.10.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Wed, 10 Jun 2026 14:40:49 +0200
Message-ID: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=aPWVfAnpsa1PzlO+27ezh/vSR+IwDjLwuVaE82fElVc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKVtQmvY4RYXSxcYcCWaPp6RJs4PdEHTLYnk0p
 cXz8gUkuUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCailbUAAKCRDBN2bmhouD
 101FD/9HTHvUOAP3X+3zXSTgPAopPiKuc3qZ5vogOYJiDG7swdGcMLhnB2alvLjVR//aYlPhQ63
 DrtxkinXKX+PQFl3U1TZWcADWIUKw8iNspLELzOv2S0k4KmKsAxyTuDNMdnM4d8Jt5E7pCMrwWm
 0FwckD+sluG+8HnfWsJWttc8LC3lKad34hugxMMaRgMoEICUX+I6qYod8mqEDHgumRdvlGIs0if
 kDohtPnGw30b7mpyx1uQofK340+WQ0I+/OqHFuZg/zg7GCw582/mNzlZCzNDKg7vBW0BMpHJg4W
 dnbvp33YfVHYnQC/Iyzi6bThp6b/vFle+MJ8J2cTn4dh/2NXK16mpt67RHMugCtpUyYkM1UZf3o
 5+8UTA9w+RajpvcYfv0M5EuXWsM9Q7NhMA8biXUl5HFc2yCEFKw9/l9ftoEuqaf6FejeYbCSe8F
 AWqSkl8wydipkWoWy46X/FpzlpE0EOy1uPadSeOTrkgijl7mU63AB8Nj6nf6ic2nONWD7P50nQa
 fEE+knNf2KQPsLPTDXEqL6QVBcELs0tIaxaghvhcv4pSWJZ+ueQvwCEX8ySEy1tagAxizE3CzwO
 5EY8cLvesZINbo3+GcUn63PnJtd+X8fmDBV14ZYj9Br4JayZHkddi/hczy4B7lcf/WQemhA6M3E 2Cbl5qH3p3N0E3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMSBTYWx0ZWRfX8aHdgrmofFJl
 sk9+8/l8ZuRhfyHMo12fHi5FYMPob9EK/yURGieGu5hJ0CKAz5N9V+PNgxNGUIyncYrg6Bu5Eq2
 O+n4Zu5J8dEcLO7+g3t7F7ERMJzdZP6s8SFQK1LQG9Ik9NpZ8Yvf2e48/JGkUgjbqwNl8WJigf0
 s3tMhUPMNk0hOh7unCkqbdX/f6Fz73ie7UUPtFUhmG6t59/UK9+yjUV2oWFNz26645OooBNaO+P
 jlplr/ilW15h+Qq63nCm7BZeJQndVTSghAgFyEXPNI0Ab9cEnJ9S6IXJN/5nBGKRF1uOQOZk140
 XLGomAzYo5M8QlTDqzs35UvMqxjHzeLkP+ZnlLddl1LGtV2fiRA7Vv/YsUiiYckkYqglKUHbu7h
 MuHU8n1M6i7xEY4mWX0aqsSb559sa4QYgGswONvFbkrJJQ5cYNfg8x+fePOAY1yXGDIsgpAyUuV
 AwrnJhIh4ex7JeETaiA==
X-Proofpoint-ORIG-GUID: B7IFr3JQG-HBBnsxaHQYLds3uQq34Lxh
X-Proofpoint-GUID: B7IFr3JQG-HBBnsxaHQYLds3uQq34Lxh
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a295b59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jHtBG9Y8VJBRIzbNs_wA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38249-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B45866966C

Document Qualcomm PMK7750 used with Eliza SoC.  PMIC is almost the same
as (and compatible with) PMK8550.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..cd4593512f81 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -71,6 +71,7 @@ properties:
           - qcom,pmih0108-gpio
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
+          - qcom,pmk7750-gpio
           - qcom,pmk8550-gpio
           - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
@@ -173,6 +174,7 @@ allOf:
               - qcom,pm8018-gpio
               - qcom,pm8019-gpio
               - qcom,pm8550vs-gpio
+              - qcom,pmk7750-gpio
               - qcom,pmk8550-gpio
     then:
       properties:
@@ -501,6 +503,7 @@ $defs:
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
+                 - gpio1-gpio6 for pmk7750
                  - gpio1-gpio6 for pmk8550
                  - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
-- 
2.53.0


