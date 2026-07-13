Return-Path: <linux-gpio+bounces-39977-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ek/6NGfYVGoBfwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39977-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:21:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56274AE2C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:21:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Log/pXES";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VactPLZu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39977-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39977-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4FF2305990C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 12:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2F340B6DF;
	Mon, 13 Jul 2026 12:16:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719B409283
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944961; cv=none; b=N0tP59OMZ7EEJxqYmfjYEa3yTriGGd4/kIcC1SE8goh/NFWUV9bCHSvO1gSHvfhT9+8bdOvdQWzAuS3REvHDx42UVG+lNWf8PK3tHHGK7e+e6E6nZ3vqJFjEn3+oZRE1k+WlH31xpgtfXAtF25wNqNQiKlkE8oPwdlqqlHoj5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944961; c=relaxed/simple;
	bh=ATDTQm/UciDupErPXbLk2PXIysxu2045xUz/FTQHuFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eXVGrPS9TJ6hE33BXwm06DGcuKOEI5XWwiz5peGsIZiSOEga4yXlW/bq0Si5KzlQDFcfHfrdBvOjLvZlDqzx51Pw1rTAA42JKlYXyWCFWUNBV3ZkaDDtnrB5gCUGCaoAYEeVs43PKsiWpQJScOO2tBanPiYOP7zZdyFhZegf5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Log/pXES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VactPLZu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEPNw1333692
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MzYXLnYT5ku
	894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=; b=Log/pXESPSqp/g/HBd2hP7Kd06b
	3rAjkTQvScrB6ON+OfEgsuk4u6GwVSUBvlH2Q6g/050UDDcqUD2PIcDavKB2Pxcv
	aFiyfG0CqpDsjzNOuCZ7gBseBDKZtaW9AWXAW4RUvyLL67skvpX9woo0WwONUnFM
	jV/IPuqbkhg1BH+tHGqSwt+iPW6iMO78GemNTeB/HDqzk2vfRsJuitOR1RTxsurQ
	xVdPZhFJOb6sBMe7MGCAz21Gv2lXGIOsTB58qQsLFP4yS9RCDdTaybuPVzFAzeNv
	2ibS3D5VJgua7mLJzC5kEw2q5a+zXTpFlpQ2SjmQqa1wwxi+ZfkERJNMYFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hdym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 12:15:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2927634a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944945; x=1784549745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=VactPLZuUO8hNXlQv9nRkHSWM7bA8YB59w+lSkl2A3aXoIsLJYdd67odtTz86uIGlO
         VHPIge5LI7iIVKThuDp+3kyzrYM22mYAkk42TTsWVDtDMUWf0RKseH31Th+zhYAeQvDo
         zU0T4vJjxoH94CRetfBa5iIfzbYo8+gT5q1+k5JJ21Rghwsa/1lDiCqFeZb4sQTR2/ty
         JmTDhbSM6wd/cGBuDaGx+7fVZswnS1xX1ZtSXlpNwEN4V/t5zs7pVgv9Er1ksCpG3DoW
         0YN1MpLOCrLLRSI1j3sro4rmwyTciqRGE/yIJ2mkEPzBeuy5GyL0y23aDTpf/T4VsDe8
         zaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944945; x=1784549745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=mZ2QRs7wxANZoefS+ua55Pzi6L2Iu7Cm45fyXEzO7Oa9g0yBTB0lJdA/tp4obB1ilH
         heXmNmiUBnHWxqvloYt6aqcGh8XkP3Br4RGbTmBbIMemGdRIYO+Xd+MW2JXNne0Oi+Mo
         xIUOGVtd7Q9CcAv2zlGZqF3kGp6c9MzkeWv51wywtpbWYBSgrtJJ7jCLEbs3Js6KiV6D
         Zd8ULgBZUn4UohSWFKnJBrfsEzsWopSYvP8g3QWbCPCB59/l/7/0JthDKQ+ldI2RUZPT
         bF8HrPhKTM2mUwmdq9mC/fNEF65xiWU4CMINbVF1Sb60yoCXdGF7Be3k9ohK5A/eQ2Jd
         FFYw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr9e3risoB7JeVDXuz49n0zBn2d2d91K+d0pK+IhwmViRl/HmvI/371q37sa0hBxBbRPx2r6MI/Wbg@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUe9k6B1B08wEl3nYz4R+igOJjUrHrRORCleGCNRooRBuAuCM
	G/jWvDZg/N221DzUc6OSQVaKDpfEzom1MTjmHaT0F+n1l0Oh1NfLdMQhiuMC/UudFQZk9ZcPz/W
	5bk49125okJGtqnd41JnZoxoBf2l25qdGhutOwSqJm2OxffTW3GFAsRLzz3WbbhoW
X-Gm-Gg: AfdE7ckmOJYhetI2zMWDtAFss3gsd6wIgxwJU8sbn9MIp1OJeen6lum8klln/Iz7nHb
	zK0++GrpfLm3m+BFs/xHkVmXVwGbBdkZMAN2juA+KvMn3qNhT3uAyUIdL+fvz4mNbDb2ox9/rVZ
	Yph6NNGKEQAHlqEyHFMroHUXsDYb3GbfrvfqFTjsiK+b8a5tW1g8uyEcHCygD5LGULr4cwRcfsh
	WKU3Ub/M9e8Sy7VozfOTb5NNl26yLHLt+llq2VL4G7H2TpfOiOYh/o/ik6NlHoh+9zHkAw4hhZ6
	M+JXmeDyzWz54kJx+6zEzBQ95IeAhsy2ohWPKfzUS6/7dZm+8ssKADNlIkeaYOPEZeUcopNs1wr
	nV2jxfHdLenzfIoEfAG6HfwUkcwreEQdN77c4iM6I
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927966a91.13.1783944944939;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927941a91.13.1783944944502;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
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
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Mon, 13 Jul 2026 17:45:17 +0530
Message-Id: <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sJu2lE5k5IsQYrz5OfUaBo-zZA-RSxmN
X-Proofpoint-ORIG-GUID: sJu2lE5k5IsQYrz5OfUaBo-zZA-RSxmN
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54d6f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AILnUmMEF99VWB6qR_8A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/CV3cqKJ8AB7
 zxBR3S1q7mgghIZ/FDB9tBgDVjLx3ZTo796YAIULc3fsz6cGvP75F6sBXDS6fLWItsWDDrCPfiz
 8xvrbOoxsTIiEzFl9XI2Sm2NFb7M90I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX3/G+8zbvzq5w
 t863vt68EB+SIJVbLa2L+dvSQ5w8CZ+MIPTzyfq/KgT2xaARfj6Dd2p1fI7XWCCwIvSu0+sUtre
 yQ4wql6gUJYVpBfT+vGJVx5+9ZtKLzjyEHF6lyXtb1oqi+ohEtjJguvMP9dd05Buq6PP9mXdHmz
 4aVcKHl13oE604ZoMDIwuCFiR8zWXGdPuIdqde8Fc+yi7uXKYfmTyaOWDh6UEXVkbs49A9yYHxA
 +AhCcR0FgtRoL3T6e0lxYOv/14itpj+K9QKc/NMn1CAzvABKJZfqYYyjyULIJTIVGPr83437hBy
 jL7aWrNEyK6me3u3neSN3SMA/St/QEhbBU7GRPy9noQukKHHz8bA9nWd1yFD6XHfwILXS48W3vX
 jN7j8BvttF/SF/BbZEZOWC6nnWn3AqZpOBKL5aDN6+IzPWoKux+bP69eaiBjX1+ynvqfFCsT0oV
 Gno8Nm/TQCnWyq5u3cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-39977-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:lkp@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,intel.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B56274AE2C

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..c81cac1a9740 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,milos-lpass-lpi-pinctrl
+      - qcom,eliza-lpass-lpi-pinctrl
 
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


