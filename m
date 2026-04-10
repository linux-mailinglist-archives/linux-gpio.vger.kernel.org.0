Return-Path: <linux-gpio+bounces-35000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqcGbLb2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:14:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B33D60A2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2939E300E3B1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825DF3B7747;
	Fri, 10 Apr 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBPsv6Qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmMprULa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE83446A3
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819456; cv=none; b=eSXoWyC1DaKatlovQDEegbxEZRzcjN9KkqzyZcAwhvMmdNIH2ZDCjPZfjoyEdEdCJKDGWTyjlMLommqJxrJCnO0hdDka6z+7YZOA6m7770+NOIUUppYGkgalgYeNe1dsjOTMoVxNZiVRXPl+xRc2mXIN5mS3DS84LwmFCx9Qlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819456; c=relaxed/simple;
	bh=xohaJJ/Vd5K7luswPwLOO91QBTnQ/Q7IO5bM4YaGh48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGAR5fT/4APDNrlC3A1XJ1Dr+H9i9ncZkIQfA12ZO2Ji4k3jL9EkJYa8j0TVycCrGcHHvnOIGpHmV5dmnh7KYq6Dw+S4MSYzGSIp0uTXCDV6v4U+l3ZmIGnGGbt7sFBw4gZmrp2YKbBkTJKR1aP/bL/m6lcJ84Lf1nDzBU5hPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBPsv6Qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmMprULa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA625n017428
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwR
	hnd9eFA4=; b=CBPsv6QogQAAX7HXLjEqijSmwHPwoUahh7v+cAtwb0hvorCkhKQ
	VY1QJpXO+yoPAd0wmvzUaxbGVlUSAnvC91c/CZ33fZmCum65XgBRNvhhYRxDbAgZ
	Mf+J7ccP4KJPZZ4XucaxF39mkJ6N1XWbUPZL3yefLZF97EJpGBNJvJ8IEIK56FKW
	1NOTNqwABw3AAJdpz4Yia7I7LInAsIB5IY4Xyf8qwAGOtH1Lgr2hjOx/vWuuhOLp
	2LnfybN+hRcXnAAGO5Kpw9OPhtuALkSOUNFEo5kPGgG5PJ88wAnknAjfEL37/Q5x
	18u+eWhCOUadBdGoD/rK9KWoZO2J74JYHvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j06jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:10:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so45788601cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775819453; x=1776424253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwRhnd9eFA4=;
        b=fmMprULaNUq86qv3xSFxi/yYkOcfCKaSHzjyhxoNbW023HfGC/QN0fiXdCxP9+sGkU
         OnPkZ/9YIl5a0cxYv168LifMUhD/nzI/3oxiEaSDJtlBCF3soAdV0i08vaPDSMkTlT/+
         X4kysWJjBeHjUyTDvlEjvozeCMX0utRUzRe26COgrPUA8U5ivQKILqlRd57AGIas9Dwi
         lUPVjRI2a9g6KHpLnS0dWD+cXYhCMpIeRwC6qoXyuBfrx1hOcKwzByWwIqJpjShkfdil
         v8LoURJX3/a8pI0soldIMnS8IaiDF4MYhUopkzcMdzZvJFfT7if0LO+3KZ30TsBR/O1W
         c4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819453; x=1776424253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+w8deWDxQW4rGNLFSOjvSPuzOmrqVDGRwRhnd9eFA4=;
        b=bU3b+1Dj6VB1ur70W74UyDqMGkE9fW0IfHyFYcRUrmRcBwh5YdEgm7UcEwik8hlZxc
         ILRBAmJLGf4yfMJ7VhW+n23Nzx4ifDPqHeTz8D24tp0wvDhhG/S9pD2qbz/MvEBUzhuR
         aIUqa9n1u93y7hnn1soY6IVImpC0KJaG5Y4NpEnzP219a/lBwPHWekwBBnn441pY/bWM
         QiBPH5lC0NvF5cGhZ1D1g0c7IVhGTFujpEMI6VDAIrqy5Wj8fLYiwjwaiQqtl/ASeZ1I
         7k74LLwobdhqZZ4vjt62WXEk4iPPjEJ2OS/uT7MMGQ8OcRdIXfTaPH8CgOAvDCRcmQcA
         HLWw==
X-Forwarded-Encrypted: i=1; AJvYcCUYJGNgtqvM5IGeT7RuncfZNtC0FzlatrSp3+wqrPQAl9V3PwYwjINEi9ddFmoihebQe0TJUGeT5bw8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKYcmbtZdNcAq7/OyAublA04aLvxAYC1yrO/jKRapL7TnA+jsH
	/9TWqO0d5vki+ti2hMXkz4Cd0plP6Zc4hUh3p7YDsFrUgjo9VFl+QFFRklueWMcgE0+cWNZC8xq
	pr8eHo0rXT+2gxP3fmV9qPjEGqCyjScPr9jgCEKQwjawy0HkOuITkHj22iAIjLKqg
X-Gm-Gg: AeBDiescbYAw6NlXhIcJraA7fjvje967o9BFuLUJL03DnRPmUwjbzZ+96qdPhyom4jv
	pdNRCVGvhTvG0eXxUmp/2nydo11rdsb2D7DhcZUKH94vbqyFVTkukilaIC+IK8y00M7GJLSk+e5
	RNeanFunuIXpujajCb/4jjxEwH+fxetIdesWA/J75WKhMIGP+jf1NgUyx5FmyoW2TgI9K5LvKhr
	VLrgcSIXyfUUHDRt3LQWzJI1yhv5x4LqWVC+l3UQf//fecdvXx+PtLTEmTEI2bRXFREcS+8smho
	3G35Crd8r0U48hiXCoxW5JlaOYodJTWimd3hhWs0LUf+5xgOdgXz6pCBFxZjIfO/8uK3DPFoIKY
	jn+zngkUCNzDi9Fl8U6JECtcTpsVMoNyAZ2Zp
X-Received: by 2002:a05:622a:6794:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50dd5c0b176mr27942061cf.41.1775819453402;
        Fri, 10 Apr 2026 04:10:53 -0700 (PDT)
X-Received: by 2002:a05:622a:6794:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50dd5c0b176mr27941781cf.41.1775819452978;
        Fri, 10 Apr 2026 04:10:52 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888acbsm77585265e9.1.2026.04.10.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:10:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing required block
Date: Fri, 10 Apr 2026 13:10:48 +0200
Message-ID: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xohaJJ/Vd5K7luswPwLOO91QBTnQ/Q7IO5bM4YaGh48=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2Nq3TbQvfeT/V9Dr0X1l2LrGZJ/6b4QixF8SX
 U78HCbPd6yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjatwAKCRDBN2bmhouD
 15i5D/0ZyYpyenFwAEQ0gw5p/fsg9YOkzYwn+iSFUxH16S8cPHq+8oZLTzthcsYVYrzaAH9S7rP
 nwwOizOVANpL+cauk2lEu16zwbsoSHIsTWb0E78nl+zwi0Gt6pPmfOLEtA9JD9EEVIOg4ycZnvF
 iS5Ryz5KGgfyzwpSrxMqt10ouwHaUbjoh6qqm34HfKTS1q8cl1g5OR+i3HSK5b9xTBNnndA9QOv
 3GJL524asKczv9N8wZ+e/qTdCO+D4lbbpKrR0lNDkLMwtEqIR8ApvlqWpIo1OkHBjyglvPJUj5L
 3ek9J+Ao5dnASu0upjiSoMerY1P1tepAAEDz13yYnP0/cCepGS9wLWhkF6Zk9dtcA2ANgtIo77q
 blrhmCNFA4iZ0DYDooOYFcutRweonvrqRblplyKn4nWBlo5YPGNbBPqOw1HOuxFFT+ZuAFvwZBv
 5X2pd82AFOyHRc5cgspN2yo7UhRmesqnumkDkojHD17bIUAfXjilPI4j0fti+oOCuTm/XYYwlW5
 TE3cVxXVeeptWk07EvNjUPI82LhN6z13ZfweLewyhHw7TATbS7zjho88KzRSijh5diIAon+7ghR
 EoAXCXsgRECNOp6UED+/8plPq6CwhjSemTgDWctp7NVXeSgtyVSYdC8hOx4AaHjG97SbntVRHFV nhJrLA0qEQVLWZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FKGlAaIdonkpXKgzAssJn5GldVnUWWFZ
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d8dabe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ssE5c4dyhQVGikaba9YA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: FKGlAaIdonkpXKgzAssJn5GldVnUWWFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNCBTYWx0ZWRfX/IwbZDaTHUDa
 /veFYlIq0+x8PinG1Z/frsGL/DzeyIJ4rn8i2ReaHv/W/Z4dB0c5uBAjTMPgxEJkN0lOqd3TZfx
 CbgRWhWzxEFOQS/Hhh9uKWYqBI0hqOqZBY9bBDoJhzTcp6DY/dbzw4bO6fL2gAPsHVGQbO8Dg6L
 yUBMTeTh5pOpeiGFeFf9osAHZn5U4vLAncjSbIozu69OEl1auyajO6ne2FHEXkWSYKihSpqgo5w
 TvYVgL22/3033ynGlKHF7yv3KGkFWQIU6Q+KkoLF+pQr68kKei4pFedZ5DjCGHzz3DP4sEAwQnm
 D4B4n3FH0CQwNJdl3UvsiYoBiQD8+6xET8CnAseemnRBno7jR7OO1Nm70w7QxYyXIpu97amefWv
 Vgdp1QzrPUlVWyx1FuqeUsPtBlja7L6eYzIXgMyR7aodo9LJsPdgTtM7iFdLM8+xNeFjWLfzVo2
 co3QQNZlk7JD0Ngo/LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100104
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35000-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 044B33D60A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Binding should require 'reg' property, because address space cannot be
missing in the hardware and is already needed by the Linux drivers.
Require also 'compatible' by convention, although it is not strictly
necessary.

Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin controllers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml          | 4 ++++
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
index db8224dfba2c..56fb9cf763ef 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
@@ -58,6 +58,10 @@ patternProperties:
                     drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
                     drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
 
+required:
+  - compatible
+  - reg
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
index f5a3a881dec4..bd305a34eee2 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -115,6 +115,10 @@ patternProperties:
                     drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
                     drive_sdmmc1_dat0_pj2 ]
 
+required:
+  - compatible
+  - reg
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


