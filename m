Return-Path: <linux-gpio+bounces-34109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ESIHkKQw2mCrgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 08:35:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960C320C2D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 08:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A306304164B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 07:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE2536998A;
	Wed, 25 Mar 2026 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgRiCr7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSrZUwRL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28435AC2B
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424124; cv=none; b=MeaQOEcxMavhO0X56T3E7pTHZkVk6jTj9vcgE+zhPftR6r0/bXQKqcPz1/tJ4EE9cD260tNxK+fbNkZ4wA57ZtqREJSUyX/WAcpNADFMQ1xzl0fYPVsahU+ufYkbmFQYVrCsC6IbZdfKfPtjjBEDjQWDljtfXt+y4bHr9uozfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424124; c=relaxed/simple;
	bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=olM2Ko5remzxAZLC/4FSKO2386p0wiZGJf17LAjZZMVPgTr2HVvfsKtkJS1OckP2JjAwwyD/Mh1FMwfuLVFBTL0AvFfRbOOUNjJl2fDSO8gXu37h2lqVEFNQLc9+QaMFqhYcjH02YmhtBMqxB+TVx2pwdnXkRth0HC0ULrFkC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgRiCr7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSrZUwRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xH5R919634
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eWN5vlTiFn9HW+Uy2PK2ok
	+Hs/VyEd9WSFLrAPs+37Y=; b=NgRiCr7S6TsjSiEOSXOcsXfQ59Ute2pxl3i9uo
	cUh1pAKHm5u8XzlwN6bg46wTwZ3Sw91tUmj6eXFe1Jx00QG/CgoMpDvFeS9ZgGtt
	V8sMD3MzsEihpiMCWIsmYsNM3HxdT7q/az6UNW+G67ASn2/TdT4IUCx0nbhDfDBS
	TzJq98GdRTZveDTSZLmFgXeyvaGrTbZ4XTmlbjutxnVzwgj/J34g9JM7FSOrFlL+
	WSfVkRTHCwYyNhX+Zformr8WVBXI6ZsytAaIjooXgmWbhS/AF7Hc+x3RJO6+6LnD
	rzRvhbxHCOKJwxrZXdm8Yeq2r6czSelmT5f76Z1OaDViyCWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mgpb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso5649416a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774424122; x=1775028922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=TSrZUwRLTdD/89Mcs5y82PEpu61yCvOwcb/Mr4IrjWFPl9yDnqgxzCti9ZRLfVhsUL
         bzUIN8Q6yGFElmQ7wZyzH+UWeA86QS0BEMIqyYm6mQMFtzvx1mdIq7NjvnuDb5RZs59w
         rSCZ9W1wJNoUryimZOVHXrv3yWwlP9aofL9K0REUAjHfuX6fyD3+GUH6TSF//hriFybf
         za5IsAhrgGsoOZzau4UcrVU2EO8JTW+h/SQhUWqTohSHh/f25C3ZEJf8V5x1Ht4hwP7r
         7Ng1+KSKuVK5MZwmqVBORljUjZ+tI/P+/LVOuxGiHChlpBQTJ9Spl2Vn1LZSTZUXWr94
         jQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424122; x=1775028922;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWN5vlTiFn9HW+Uy2PK2ok+Hs/VyEd9WSFLrAPs+37Y=;
        b=ZcBEb16+KjQLvxZR7gb21HUZCFB34p+6riZ33r8woUZEttaWjNxOvVFvieT5POkqKa
         fEtHfcoup4ChWMdKf8x8MYfltz6072DvLWUMenDgRe9xHOsFuy5t0dXhBZyUH5lk8ObM
         qIOkBQd5q1O0SV3KIgaN+m8cBYWQvhAp07TpnpfkRvadhEAmD4yLAInrvWWJTzoFFSwL
         VRJZhkYf92+MVMMAKA5vvZDXn+utrvm4YR+UdB9ED3685COkbge6RQMPZlM3Oq912uGJ
         IgCNKs+IcIg2LOoftQt1awF/kbCbDmjnv41jUUiFdlO1tUJkRWasppFUdMKYPvGoInuD
         ppgg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6MniDXkfklqmSa3D/X3tLP4HtskePPzY6Lbf501k6IAe3iP/w8oH2iEHPk1pfuH5wyoGh1hUmeoW@vger.kernel.org
X-Gm-Message-State: AOJu0YwLa25ZQGGJrSY9lENThTxVmMFn0XhyIdLBUz4Ejnxnwsg0Df+G
	vnV0Slbf1IkaMZgITGNQxLAYaI/maTGlRkneavqHt7husj7VgFD5yyRezpobxSwjojq2Gl+8a2D
	xdo3kr+5ttARMfwGyG51K/yOlU+FIGRwuo1zM325NQlxRjKmm35rj45drlBvgCuNp6U9vzgYc
X-Gm-Gg: ATEYQzzpnlYDXCBhZ0EeBa4azSvNTf5tMh1r26r0z3TRaVElX/WvQ9vgsRNFn+HvPcs
	hoVEvKP6S6nM+5tVqyFKjXMDg8Ra1CQ7c9mRKmxSC9FUnz/89m0lKJSbIHrVeS48lPYM4xBAu1z
	p2VUiMGwgvArBX5oblP/BUuxRpixaHajA6JsZr3tnIIM8uJQ7qa8Ub5rsdb+J9XgrhqhcTG5osx
	mW4zzD4yAe/tLvLtL0Zxw/DKWBkCsmXRAaDvm7ScYvf24ctoatcC+jWmJptBIwJQ47gU0iZFXn9
	5oz3J6N3nO0GlQQl241TFOGSa7yTEbSRpdD69GGML5sr/XXT8x39Ao/w93XmvsjH6Hl7J0n1s1f
	J9LM47fVunWde86o3FyDvch7C3UAfpw7T9QrH4jBnAh7ee6VmXME0q5rLTr57fUBW1gNRNo2yjr
	N+l3eOJpXqrNedfYW+rOp44UezhsGodauDj3f9ohFEk6wMpIXWhRUza+RM
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351331a91.14.1774424121661;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1b43:b0:35b:e4d5:dc71 with SMTP id 98e67ed59e1d1-35c0dcd49e6mr2351307a91.14.1774424121151;
        Wed, 25 Mar 2026 00:35:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03206dcfsm4814629a91.13.2026.03.25.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:35:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Wed, 25 Mar 2026 13:05:14 +0530
Message-Id: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKQw2kC/1XMQQqDMBCF4avIrBtJRlOlq96jSDEm1gFjNLHSI
 rl7U6GLbgb+gfftEIwnE+CS7eDNRoHclKI4ZdAN7fQwjHRqQI5nXoiK0bxIFPy+jtYy3SMKZQS
 XSkKazN709Dq4W5N6oLA6/z70Db/fH1T/QxsyzkSNuqxUoWXJry6EfHm2Y+eszdOBJsb4AX/yo
 96vAAAA
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774424117; l=1505;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rnMA1FHdt96n+5Z/F/ztIUjvAXDoz1qDvjfSjRdv2No=;
 b=tNx0j+MNihk/1BxkYrSDSUIv8s51NjBDo6BZ+Nl9MhqJcxPjyITk15mSQbHvKl/F2hog+EHg5
 Vs84kCDTWjbCxm1p6emGguxAx3k2KQjQoMiHT320tedDzjaJ1ervmzj
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MyBTYWx0ZWRfX2Ih2Bm5joWsk
 Ab5nYyrRmlDkJby1q2AFtdRoOL8m9MwmIXxLx/VspaWuIB1oZ91XGO+rFwn8YVsygAi1Q4OK9pH
 M8rtopf07xzUkzok2AA0a9KBroj2OnwOWt9Gi4IgJNgAqwijYTPegSqL+5ITuwDOJWXnrFQnGgf
 TZ+0Gdv4aItFBMwynHtw/DfI3bzKNHVEX5xOCZBy6ewky+lHg9hvhGKsc1kCXmF+UNVJnQOMO9h
 +XRK/kg28pKQ3p0tmtB47m4nvSisLRYTZO2YzYRXH89220XDqFWBJCsZfK+vslMJzct4oDix/CJ
 vnD+eME3+LRFC1k1mNYzocTSJgnbJYUL8ETIsZ066Eob1WGN1BciMpmmZfmlx71gB6Uq6JSQRtS
 wAW7Zxv2q6bRfk+OT9wpZVIMTEdKe1H/qOn8uZT0EqPcu02SkDJfmZ58TanK4lF7UwKX79cRM4r
 nm3EESOlx4aVsthHQQA==
X-Proofpoint-GUID: DVFvunoYpv9azgMQdAS2ExFVC9xPxfDq
X-Proofpoint-ORIG-GUID: DVFvunoYpv9azgMQdAS2ExFVC9xPxfDq
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3903a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DebfbtQ_iApC_oJ65UMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250053
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34109-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1960C320C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


