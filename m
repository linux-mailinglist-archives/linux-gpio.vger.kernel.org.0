Return-Path: <linux-gpio+bounces-35928-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AsOEDlh82le2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35928-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:03:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8A4A3D25
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2397F3040682
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA94C42DFF1;
	Thu, 30 Apr 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5ozEa43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YyvlXJTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72742848A
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557723; cv=none; b=ct5YtPhkJgzhMhdruWN3fOf7jrmvP6S16xut+Sw9iGjHzKR2zW4mGUJZnwb/TznSgNd/NKWRksQRePJve9JBmWmBMFUuoXG0QsYdYM+iA1383yS8p5mus1FK4rY53/aMso7XUl8kl5ngyO8gJ7rfvcN23RJVrzhvwtUq/Ooc1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557723; c=relaxed/simple;
	bh=iRqdUt0yocz/+7auDO3oR6q8zPntvhLalwYqwpTPTUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gxNX/OLRkCI9MFrChpLWuJoS0NHCcuNuucnOJFpytgWR2RYY45peF6dafA/FZaKDPSO4Y9X9XFMB4W7FOWKoooKf2Or+Idq7Jmt/tNHJgF0xsy4+W2KJM8Eaaq6jddJ4BQ/XidF+O5+IBE+4idem+T6qRNS0HqOy9KDKEy+3x1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5ozEa43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyvlXJTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCMT5j088626
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 14:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYN
	AvuvmDlk=; b=L5ozEa43L4tvU/Zje5gH07kE24miikviYHWDUdJZgsDDvI8PagF
	C0glsopCbpnikButh1qzLG05TdDVPhctG6IqixiBZRdtLdJWlzwwSygIld5/OH6T
	0KWxqZeOWGPnxLuiceyORyIGw0gKdCohkko8bk8FF3OYq25f3k1CmtJKRU/VCrvA
	tJUKWZ3LSr8xKRyC5xHnYZLApgzX8UJ3Pf83gevqcHbmLOgcE3MOAk9agg5IZez4
	7ecO28a3qJARLWT1il9WxunxvzNNSakmn9EMZA38SpXKi0HI4EB408r0KdLoQy/P
	xVzHbsDlCMjwHW4Dvx+Id6/f6Ott2dINlFQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u41u4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 14:01:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so705675b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557717; x=1778162517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=YyvlXJTCd88KtvUA5zo3jw64DoVlEho8SuZm8NeSlLOJxv/7ujAV4xwisRENhyKbd4
         3ABcRDnJsrJMSUwhNG8Y9HtZRk4KrfxtESWNdRvHiffn6Tr+aCMD+Ar7JbmkVquv9HmI
         7adfNg7ZTQi8YXU5bZCjHqrsLRdboRpcbLHRc/xIFosiVQs2nb+t7ZlTzyw/kNWRMM3P
         TZfnCdFoLRYwJr8UnDhLcEiZOnoLjPYqav6UoLIudKlGBbbf6HN0rHj4GvSBQLuR1oEK
         1BBGgtFa3BxlavdZ1cvJX3U8F9XIQKHUn4V1doJbxZRziejIbhhzlW2lLec6+Af8Fa9z
         V58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557717; x=1778162517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=O6qu86hFkLGJA4VnAhY5YSohvuZ6BYNeWbjJxD963tfvWhvM7BdeSdgKnSV9Yo/6+j
         NYrpjUv1+uGktvxi75xFbY3uGWX7oNEb79Jz/t+zrYzr0yWGW3t/AyFJ8G5pSjFlQYzT
         SQTeQdNJfXgE9SMoGNuu8EluRMrih/ev8IdhTNzWYXWaCZCTl4MEO0JF0gk9YQ5JVMeB
         jAXWGfdn4onusQbXhynsLY7lbZUqioQeO6qfSrOiaYZ9RtTjPx3IYLLtEnC8Sl95fHmK
         4scvVPqA2PpkCffcLAzQlp2Vry9tzcvb9hh7JgzLZ0/tV/bH8X2ONYgfdAYSUPsnReNW
         I4TA==
X-Forwarded-Encrypted: i=1; AFNElJ/0A/7XoEWF0TJt/vLceixAlJUAxwfpY5cXraaXqE6OG7TcQk59WunupwEl9U40am25+PISIzZNwtIS@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUyxXPrzynpWKtiXSMHsFix8SluP0ima4I2wUQBJ9snrKSbH/
	j5i6yfiAKOad5S0OcHVK7NvKBM9PVdogEFm7De1lSrLCxHY/az8ZiWykfEjGGJTZExGLR5FA7Vl
	jcSPkJpqRpLy8hb3c/M/X+LGXIXnvZkDTukiL0Tei06QbCr/8uay0Q6NzADPHzHmM
X-Gm-Gg: AeBDievFA7UJtRg1ucxJDRoDE7jUlQbw4g25IGo+yIPJswUIuoxX4GyTwMNhab3yuuk
	/o8xyR8xSf958IVAFeeCWVmmUnS0yN0/Mvmax+lP8XBv9YRQ9Kgvg6+YVcSS98CzPAhOpeWM1Hm
	uz7qNxFOMZQX7iRicyvQWAJVdf14ixCCLunDbLHRctYpIdmdIu7014KXChBcFXyuNrTyKfJ3VWc
	9ABN0cDi34vMosneBNEhaLbml/9baV0LoRftMLgXYDmFgg9hEbgSWU98jc34wX+7sMC6TrHx0BF
	i1BGgOwIsLnz0gSVKhXYlF+fwJed1Zq6RylPfMalDSFg/Sr9Q2ZRED8Y45LsBMt1/bOFQwAijMu
	uSbrFb5QlMGacJ5XtQl8FpyBWECq2rAY1GX5tRQiqosCEE4odDG942fkTVwc0CKYK2A==
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424572b3a.48.1777557716096;
        Thu, 30 Apr 2026 07:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424508b3a.48.1777557715330;
        Thu, 30 Apr 2026 07:01:55 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7ecf57sm5314312b3a.50.2026.04.30.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:01:54 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Thu, 30 Apr 2026 19:31:18 +0530
Message-Id: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f360d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uk8a1l6paNbkfHKRL0QA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: PNrIfc03j86U9iM1hvBJxdpADhtzAlTB
X-Proofpoint-GUID: PNrIfc03j86U9iM1hvBJxdpADhtzAlTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NCBTYWx0ZWRfX2UiGImMx8Bkt
 wdFA6JpgFQoQopwlOz8MQyeRXDM70P5dcC38k0oRYrqVcrjZy+qtKAqaqvjXBOhX7WA0izXdZZg
 6ahLDXFWIKhe10wzJ6tEcPdkiEuyKdDKiXMUZ/34JqhvcKdcbQmJvJa3acNLp3FqDdSnu9ktkpS
 6vQF15rq6Dnc9R41AWqTsk6FfOxAUvZKGJdD2ItOudsSdZqxSOY7RLKJJT5JzsrUIC6MhwgILdu
 YmNb9Zw3FfMj0OnZpEx/RCQZORv6MEg2ZwrmafrbA/wPszCVBsN7kOzXq2em/w7g/Gt1dgbGDlJ
 Pi2Sr4Lqerjq2FAXdkipettX0FIU/J0iuHBWCRtHIjR8sDOnzZxposTB2hZoa+7o9SxqC7wo6bN
 BLxiq+MTkxC6xKrizmjBppYyxjTlaBcRpvAUOin+QQ9rFfZDfJWer7XJ6q+UNeSSYBswC9ZgU8m
 c0iTBNvtl/+IR4zhsnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300144
X-Rspamd-Queue-Id: 02E8A4A3D25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35928-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1


