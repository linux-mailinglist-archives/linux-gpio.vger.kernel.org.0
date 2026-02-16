Return-Path: <linux-gpio+bounces-31717-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOkdCEUjk2kX1wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31717-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 15:01:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209B1445CA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 15:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 281EF300A648
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF04311C05;
	Mon, 16 Feb 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoAsJApd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atFYV1AH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2F311940
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249453; cv=none; b=ZnuMFaYoZq99AxE8Pel3e7tZv1/JAwp3bA/s6OlgzMMKk1VQgF1gizKYhEvO3kHAGzIbBZP8LlS+/j68iSDwyZk7noTWMloNRrHZQUoDWVSKc+x4XI+/5/HBWJ6wEVctLAEtL+cll1hclrZ6uxyTt4dLgumzI+8itJtxMBcNeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249453; c=relaxed/simple;
	bh=voeY0qgaagnSQChXunaKTn8hWiJvQAh+eoXXg3kf6eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AigVGNNku2FA7Ssz7jq0RmcMuqCt1wsck0YFjl2jmjF5vJ5QaTu6wP5FWUZF3lzAYnhdwZ3z6YJdkbMlmDLLsUQO9Glh3t30QJkMozOW6X5qmuz6la7HYtgDFAzzoNeBhMsxD4xrdMHOmkRwGG80bTlmNBgxBiMrQ/y27/CNiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoAsJApd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atFYV1AH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G5bqfT1133455
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=; b=MoAsJApdsj03tnt3
	gsGUR1uyh07/Aml2VO4f0ffIS/gT53AbiRDICVdZ3AHUVkZQ6UhOi5m+deuN82Ae
	90J6MOUAdClpbRECByrNG6+dFY0J/+k+XOaDYzNMPFcTNUnkMTxRh1FlKpR6R317
	6oYXGgtN+QnCA8rJf2YlwxrnbmsEquILiMBT5kPmD8i/9AHc/JnVv/0PXmq3HOQh
	8wZfZ193F7kJ7U6rZU3tSz+/34cpmvyxWJj5pDmbLqdT1rboJI7lFkGCq1wq326W
	DsI+1xthe7XKtwK7evzrnbil9xfw11sNwIVhFahP8Hb2VMCPhlAcAKirCKuvg8oU
	ZVlLGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4smp19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 13:44:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so1405119885a.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249451; x=1771854251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=;
        b=atFYV1AHCYs2M1J5BaFm/ZpLS9pggJNRdpx11jhdIJClMNSiZok9JZgmjsTsAkoOOw
         UcYj3etdqktQxCYQq1zcar5QWN6MKd3YXubOTPPArDfZ2ObRu9lJeAIU6V3SZVgwmhjB
         uQGozi9ui/PogKnfQDOMVQqonSa7INePTLrbxWMfKFeH62Uc1HkwF0KVtdxQU3stH9z4
         Owg/eBrLBQQqxX2/k/izYdeJl2Tw65KkxvrEDwQpL9/8ZiAZFUt3sM+dadlTJ7kshsrw
         sHSonHqggHkhJtxprn4JJKfJY9pNTkAraAXwA55WGMIgFgYEYiHGwELZO/JLTCwan1RL
         URWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249451; x=1771854251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=;
        b=pLJE4ab0HkdLcWxMFJsueufOV64HFGAQ/YifX6VnLJGBW+q7FzDDHv3HmkHkhPyb3y
         grNPK7bgv6s/tVFbp1d9/xU99em3ks4DbayFP7B5/WlKxsRwdpbhwRQRjU7lU4a9fZ/j
         cAUA/sDWLKycE4VYVHCswDgYLYOo4L9DuV0BKu1zAwgVmC6IPWe5Bi7g+goqXOBPWvLY
         YT965mp9+WPNh/DM71FUeSMXjo3L+FmOtcZERJyXElldGKChF/I7Ixm/Xt/EDRWwvRIZ
         NcTFxw7dJghMlUNGR2PcLCdGZeiuRQopHOWUa+Mz1H0W2gow7zeZ2iL+JTI2KilW/m4O
         VH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1gQKfAwdpktKyagnK5G6w+u7kXsI76LzNTO7ZQykS6g4KYDThZOaLAUk3BAb/O4tCPqR/gxurDMx3@vger.kernel.org
X-Gm-Message-State: AOJu0YziJqd9siGO+2HvkeXWPazMhLUmDpNsmmDjbhFL6FVgRvhTmCgA
	OHS+r11wkgN9O4sfgSN0/NJY3uvCMVPzNAQcRk0iKQEjQOFpCwLTDWjuzmP9Pj+mIXolHqPqjxB
	fqkiB+KinRXzfnS5nrqAZ0T0pBveGMpirxnMfuMxJkJvPej/yinN7ZthZeA0+kRi4
X-Gm-Gg: AZuq6aKg2nmOsFy6BnRQRbUTrZ8KxonfjqbkD4QemyiP6F4gHVXocDXUiYElTiR6qXy
	+GfwBNCSdljx8PamEbkNWpT9h5oAtvCjTEPvOt4ZQYhaeDFi0AF9Uj0UUtui7HNyrs3+oSs5/ZL
	F9v8MkC8W5WVW8oj9E8kbl+HTohbk93xzumG3rOoGngvxFfsvhiFsmIdNoW1pOykjL2ZNz8k8R+
	J0l0sDgF1JFDaQhIsExkZIbJqz8A4XkcxyABXcQWQ/6dlhMYvTpFEckmKVYqk7ygu3LJnAckjv8
	Hpi9ud0r/dDkFUeFECP8TZWdG4lRYYIbnT/sGLAUUEBzWAAx/UnzEGe2bn1Mf+q6p47wnAM2J/B
	oiIGardLG95QHuGBvw3MrHUlQjeLaXA==
X-Received: by 2002:a05:620a:d8a:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb42412e7emr1353674485a.55.1771249450949;
        Mon, 16 Feb 2026 05:44:10 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb42412e7emr1353670385a.55.1771249450303;
        Mon, 16 Feb 2026 05:44:10 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48387ab1974sm74300465e9.3.2026.02.16.05.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:44:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:44:03 +0200
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-pinctrl-v3-1-a7b086595651@oss.qualcomm.com>
References: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5381;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=voeY0qgaagnSQChXunaKTn8hWiJvQAh+eoXXg3kf6eo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx8lcTo3vQal4g/xtFdcSDIRKGrmDHWznOi6F
 vlYhxjbZ1KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMfJQAKCRAbX0TJAJUV
 VlpsEACTUQyn6tHG5HxiRxKKw8KqN1nuD6ftvdkap8VR9e0xaztuEdPhs3hGKEvt4cnNyTE9er/
 N6Q82oBHHcNOz+zfJ26cJ3B83GGYg+aZrc1lpgkb+Y/UnnbTv5KcKLA7/EQ4Nd2OM0SU8GLVy2V
 q+JSnAoNhP27nDFhgrlES1G1afX852PbS5dJeH7YM6G6XCJwEcj/sCsAs6KCfCU00XJsFb+NyCK
 RQ2UuGEmC3GkuUi7w5GNe1JaZ5torBTraBHFpZmB6If15kVlIuDELTc0l1nubD+/M0Kv61yPGG3
 6BdPlzO0jdCO3FBfSNWs0Jr7irMz1lvJd+vYv/fvzuLZSATmiKk+NaTJFYL8ScTGMNuUOwEVjZH
 Zv8NB/XpS7ct8UFAcwn4UPnEXf2yGisfiLNWUwzf30hLNTal28zy93eXnG1QTPwkDF6T83D8xr/
 ei+FYdpgdJnEvgkX8u6LGqZAkDEFNGH6BAJ8FTmt0qRJHFSE+fDuhauxA1/dxfFyv/0hO8N/uMC
 P+r8uEkO0gLNTNpRfXLRaCRv6gn7aUxeigg6YutvAJ/qw8UPsPg+9DYLiwbqvPieODVE1IFwYI0
 yZuNpZsEY1S7t/Pv9ZskWXFVHJRLZqrF/H8JoxSORwMQheQ1RGz/3FJ7gVzWLEcITIo9HJzGM+0
 BSNZNOddlbkPknw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX2oASItplhMcW
 Dhmlduo6qV+OyR6BdEs6X2bHw3j5DmtxAGOhoQ+BCv9clu/bfbLc7YL7zKjuaWw01yY963Vzt1Z
 GW6dtyHJM41cLA97DKGxd3AQRpbLwR6hBUWlKI2zefinTLvEiY8cZHj77To7fyLcAshVPcvucOP
 ywTsfxT98dx8LROymgW3uKnAhMFLVeB9INPE4EluQVeR8WPowehzx3NNY8K5O6N7WteQvgauPh9
 vvvapPTWgLcMdIohv5RwPaHbyfwNA4vBbjcRvd5DCjnesK68jD2zcPFJDhddIkoFEkzELURhWah
 WlAnsw798INYT8BG5SpY7kOj4pYTMu103zUCjI+V3YbjEmuGro6MhMnvwO6m8ItCXGRgWkBtR7f
 1CCsaYWixiKusXtzgV4aF0umcvJr6HqKbcyXmciyu0aeWYGKYcFIlxRr8BP1UH3iLxNZ4DAldtg
 cg3kQQST1eooIepd6qg==
X-Proofpoint-GUID: MBJrGQAZ5jsJIvkQ2NTUuMTNM9ZorNo0
X-Proofpoint-ORIG-GUID: MBJrGQAZ5jsJIvkQ2NTUuMTNM9ZorNo0
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69931f2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=73qe-b8KcWbEUoKDdJwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-31717-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,f100000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4209B1445CA
X-Rspamd-Action: no action

Document the Top Level Mode Multiplexer on the Eliza Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
new file mode 100644
index 000000000000..282650426487
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Eliza TLMM block
+
+maintainers:
+  - Abel Vesa <abel.vesa@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,eliza-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 93
+
+  gpio-line-names:
+    maxItems: 185
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-eliza-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-eliza-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-eliza-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-4])$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, coex_uart1_rx, coex_uart1_tx,
+                coex_uart2_rx, coex_uart2_tx, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot, egpio,
+                gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1,
+                hdmi_ddc_scl, hdmi_ddc_sda, hdmi_dtest0, hdmi_dtest1,
+                hdmi_hot_plug, hdmi_pixel_clk, hdmi_rcv_det, hdmi_tx_cec,
+                host2wlan_sol, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
+                ibi_i3c, jitter_bist, mdp_esync0_out, mdp_esync1_out,
+                mdp_vsync, mdp_vsync0_out, mdp_vsync11_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
+                pcie0_clk_req_n, pcie1_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
+                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
+                qlink_big_request, qlink_little_enable,
+                qlink_little_request, qlink_wmss, qspi0, qspi_clk,
+                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
+                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
+                qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
+                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, tsense_pwm3, tsense_pwm4, uim0_clk,
+                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
+                vsense_trigger_mirnat, wcn_sw_ctrl ]
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
+        compatible = "qcom,eliza-tlmm";
+        reg = <0x0f100000 0x300000>;
+
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 186>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        qup-uart14-default-state {
+            pins = "gpio18", "gpio19";
+            function = "qup2_se5";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.48.1


