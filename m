Return-Path: <linux-gpio+bounces-39385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6vcOl5lR2qrXgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 09:31:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E36FF910
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 09:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nM+47a3P;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kBPkwv/C";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39385-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39385-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7661C302515E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 07:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DF136A000;
	Fri,  3 Jul 2026 07:30:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF8236A02E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 07:30:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063857; cv=none; b=mtv85JTNp/6fQwhm0pNmFxJpXYUVjSFRSHO+IezxxEJByuVJ6TWCKMunkKGTA1iPPTFkjDPyGW1ZkGuOdu+kEpE1nTF+dwc073x+bwjz3b570AG0JAAlAOSFgMsNSK2/rCSvsAmmIprswtGKSdBMlPUl4h1iuS9R5ppPuvJb5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063857; c=relaxed/simple;
	bh=2ztaue1cIpZHV//WnvcJojHy9G1ocKQMr7lZ0moz7+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOZROOWi8oxmyh/XpWZ6xpwqTNM6/umUypAMYGxYVMyWXLdJtJxNgp5LlUNN46g/nuyBQz7tV6xcBBSZUF6auRL1f+M6vuu6iYNdKVsFTMvTkQQYtPrGNvM+Jc+KVZN7Nq6uLMiZS3AaoxK5hzdTm9qZyswzrSbwOhJMlSVpbQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nM+47a3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBPkwv/C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlsF3123718
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 07:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ty+/2BoJCyU
	FYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=; b=nM+47a3PR3O2wYyI0Q4o8wEiY43
	YUH1hcpzGQmuoVPQAJrhjRgfH2nvE41fpg/1Wy2O/gi33YeYH2BuiNiWet/WpovD
	07BQZwHLK81jWpiBh3Jf+TvDt+6cYqkRE5Yt0A3oS1ml4Dw1PrjcOrW1lIL+9HU/
	qOdhyTF4cScPKl+CJvYbmllzSGwOF+17Zr6g8+WlsBmSYShTKJVS9oIeMIqXUVRf
	u7nOk0irKQ9RY4APYJSPdvpet6yYYgKx64N4AR2u54z9fRZygrYREipB0VoCtRfa
	A9vmp2Rsa9ogBX10NCH/wHRD0AErs6WX4U28g6Z/n+iCZkLeIUED0iEfzgw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpc7kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 07:30:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso505425b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063847; x=1783668647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ty+/2BoJCyUFYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=;
        b=kBPkwv/Cq38+7IQiPHZViWDiRLVHZSEcNuIoEcLIkbziHBtw4wyBTNf4FzD4W8EZgW
         5/bp9WWqEOxRwdaSoXnL6tZpuw/zmsk6zNWroAREHVVyRl9m6JTyew8Sfe1ZhMeRU2E3
         Mo2AK2om8+dQDhUkl8i7SilRVXWIVeuwF9dd3sdqZLD4N/pqAicKEhYDHPpVdHYZwHp8
         djqFvbxYEWEYhjCoSiAIEoJadzdj3UleadJezkZ9cMHNMfk/b3LV6h2ieIKg0COt/wMw
         9lBoI5cPi3PoryipHD7DZbmWmiKtl4rp2pReBIzOJvuTq0Qm+3vaj7DNH8AJGzT5fxOo
         hZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063847; x=1783668647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ty+/2BoJCyUFYt9WTO9l4AhrQZc1A2Y5anJVverHIk8=;
        b=lPcy8js4mNwUj/OUW3OFuJY4eGWZMlDCqfXhGz8ybGJ8PucjsZLPBxEs1gjO4yUd+y
         YB+G8G5+4KL+uiUgKxPD1S16B6LYxE3vJE/gb3f020ucCfwNntQLpqGaDCRLRPeMiJPC
         tRhPeXFd8kK8DsCe7nAqoVavyYXY9VWKOr1vKkCUxAqlalQTS1ZNoclFY6ZTWqyFltYi
         8e+ZO54Kla1KTVHxMhVl7Bu10sWZLRCUd7KzmwZcyUPmmgx7JE0iWCsE9zbiAu6+YgKR
         rCKsP4x23ozeR3bHVWPWZZOACE/q0KE77FIzYmloyyuQJD3e8+65C34bmZ1n4a5P+qbb
         f4eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWxWNwm43E8smvTDmmv3VNHOD0RWxLIAnmIJ8cn1pXjV2dPoqnmUmQmIj3p0x6F6/F99SbdpGsTO/t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpqm9lxXsiIjNu7KWs3RgIxVo8jc78qx7VxnY5Tq5JaPtJBDeI
	wqzcnzIDZZdKaqdQrqzreMUR1mEXh+JjiDZ/ZT2E4o52YNyBkgRGeEcxE3HS0NO/LqsVkFa+J/k
	JcQv+xz9JtP9fy92N9CJEYD3vBoq3XKneO5Pms7FKhkJJd4i/VzmPuwOS2AmcQU6/
X-Gm-Gg: AfdE7cktyGUW9xP8zPpiygDqKkuj0NY+VILZnnS3etqK3OKUTWip0Hy9wUq/X62yXx0
	L/Z76xcLwKMOkHpyzSCcstmlv52WyLjSDx5bVf7tP6TjoVai3c4fskhr3gfplfx2WAp287YauEU
	oluPHBw7magZbsKL06Pvjf7BBNrSV4ss35N6RmCqdmCAsQ+8J2zKm8Cch/M99HjXhKDKxVEgdck
	zdHeyzRVu0NmO5yeHLKxaEo63wsbiEyTc0vUY0HUS+ixaqGejETxTqh3d04qn9ce+j1yskagAwC
	h0t3SiBXUFogyM2Sgwe1xYCmW32y//E/Z/7Kjn6xPo3cA8AIojpGbpycKAXM3DI4pOdovd9sjoN
	XDZKRT5DLbRAtVzA1/5OSs0tPhEtU5opJ3dEgk2Jg
X-Received: by 2002:a05:6a00:b93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-847c07be445mr9957260b3a.20.1783063847003;
        Fri, 03 Jul 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:b93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-847c07be445mr9957234b3a.20.1783063846551;
        Fri, 03 Jul 2026 00:30:46 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9902efsm2456176b3a.45.2026.07.03.00.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:30:46 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Fri,  3 Jul 2026 13:00:28 +0530
Message-Id: <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX2wQR2MjROhxF
 koKF8x7esdATRsc4acV6Y6Zikk3hCGq40i/AY0n28oLYAR+zy4PIl1TasMlqK7VJh8KGP+4K90q
 2HtcWIQ5/Okt61aP6q/oq4j4TmJ8DEc=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a476528 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AILnUmMEF99VWB6qR_8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX+fHwSfnYALfy
 njhS2Jf7URt7vguLMd4Sk7RBCeSSh24gs+kVIMwokJEWnweDNAJviHC78mZiH/RV6EadQ5Ti3Ej
 uLuwUi8Rg4fIoFR5SSzhSyANeVSAcnqT6Xtt7SF54iP73h5OfIg08iFGbzS1TW8wUPqloSgyZlG
 bNBkTOvq0XY6LQaGjY9RsaKtGf8LtIKLmu5axaRGX6nzcu4QyjXzPAKsUBPGCBLr/YH2o5gNDbx
 xOL8mgzP1Wae4szPrLVZD5kkVOmAoSEx0CdLPjOCmYoOaKPqRt3Cr9nuiKI2W6tpaL0uO7YkjE2
 Z4J1ROzCb+S0aDFqCjNhnMW6Ov0px5xoVFDPvow+kd8UcL0kVN5sMDavxhYSAZCVO3T5JvZ+X7g
 trV9wVijglDqlNLNsRb7ldzQGEXsTm251EOe9oUsYwIETtmYFRnFecfppl8qT5paU38JLdrOc07
 +3L4QL6lrNoJQNUPo4w==
X-Proofpoint-ORIG-GUID: 0igc4RVJGZ8tqL0euSkx5Vew2HNlxGbK
X-Proofpoint-GUID: 0igc4RVJGZ8tqL0euSkx5Vew2HNlxGbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030069
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-39385-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 891E36FF910

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..5cb9addb975f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,12 +15,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,milos-lpass-lpi-pinctrl
+      - const: qcom,eliza-lpass-lpi-pinctrl
 
   reg:
-    items:
-      - description: LPASS LPI TLMM Control and Status registers
-      - description: LPASS LPI MCC registers
+    minItems: 1
+    maxItems: 2
 
   clocks:
     items:
@@ -74,6 +75,19 @@ $defs:
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


