Return-Path: <linux-gpio+bounces-35001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNPdNdPa2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:11:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C236A3D6025
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22A4C3021181
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F9B3B585D;
	Fri, 10 Apr 2026 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV2G9NGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiPq1Jku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8AF3B7B76
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819465; cv=none; b=Dx5bCUQK8K4Z6I+R/c90D3S6EhK6WGabN43msvfGdavbY2+0gCDzm8kU4r7CpZAkKG7g5VSLdHQEPfMIpViSWL4igZ9hAyASzEb08JNESslhiflpiNL5/qeJNaQSdx1Bwji/cebPp/n1wk3Hrj0UjfiLzRGLG0txxixFGmmqbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819465; c=relaxed/simple;
	bh=81m559Qm6SjLLX40vo8GQTMVfwyBMUS0e1HYD2duGuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK6t4I5zQC2AlXeJ3DOmoKyjILhZPW3mWWmiaUPnkcLYy08kgI4fJcT9Ceu18d0XMcY1wJDN6jLZ1yxLTPMJsdddyRht/lltNo7AXe31E97HL8M0zC4iNTBPIOOzMBhd0qG2wt7wmA1HBz9r4BX5gR935Lf71cLq3vVFxUGngTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV2G9NGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiPq1Jku; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA5aS61498597
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BG5SUK1DsCV
	NFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=; b=JV2G9NGQSy3buTAm16imzxdr8CP
	+yQDeB/Qzkty9/F/IdFw1BrLstc/Vk1pm/0/NPX+P56fNNRwLgAOd6q9uk8ZY5re
	uNGuU9E/iqmNb9t+MywYlq06jykJvpshxSSMpr90NW9ULgqJKgSc+bAm72ckKsik
	dvwi0D8oK1ikVUEWhIH7Y53ePYN7ak8B5yUh+JYLJTAtZWLYkct0FjHZzLKqKMKw
	+QJnGHrebD+k3HTovCEXrwF0dEZjp4aJLcCizzo/U+bPmBi+PJuFPsTZobMpBE91
	92rX8GOr6V7IPhE0wxMFRQikoF8+n3kCX8rX10LyIfR9d6kNda4zVp9lhSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b06un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:10:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b6f869676so38312701cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775819455; x=1776424255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG5SUK1DsCVNFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=;
        b=AiPq1Jku97Z7qogIq1jMQ0AMk6Lw3iShnUAJlCAEv0EjkEmq+3Qr9LrI9RZDuR/+GN
         hKCuW2MmH/vZwrgTZPK/NQWuxAzmACm74uMbWbCdLpekNVMbSreExhsRNYDXFkO44qSg
         bsA6NgKR10MDCZ2yq9hXWsHphi/qHLcNal/vvxzxkqzI82TS/2nyEsDkOOCtt35XGPSn
         tKnEipc8FE0RbFKIGlZf6Tr0SYtMPvj+1OKiWfDY1U1S9vpSQNk0TQ4Mr3NQqCJSOT6/
         ZypOdJLjBLbJb6EuaTppYmSm1R6iBACTwqVNN+rOhSF2+gaeD9D0wcGpMa+3DzRgnDJ3
         Ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775819455; x=1776424255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BG5SUK1DsCVNFWbXyc3Qfhvj5m8rTy0XKTDLJjT37mg=;
        b=AV2kap1doTMO3sOQebGpj7xZPDpKhgNhOsWIMfu3LLqFYl2HW0y9VGS1yjUgmAlgz0
         Ijt1/39gbkxz640UBw2v/7reveyNMO4Wr3VDpKHWWQs+58e8p4dDRnlukzi7z25Xt75K
         6/ThAYSr0fbjoQySfiCJYgkpyySz2MGLIZ40hDp0XQ4fDdbKAgbgbjqDFRKShkfg/yOL
         r8EkWK9GcWdUx8UgoxFKxrnO0UG6RvGfKQQUiiA/OSZDG0jiuSU7vvLjHGoJ01Fh+9cx
         7u/mGr6CVByyv5wkXi9zFLQ4vjifDr5hcR8ffbfj4PGBMFo12qTQBAmnQ4urYz6HQsFm
         ZzWg==
X-Forwarded-Encrypted: i=1; AJvYcCUKzRScpDY9tGZmhRRkDSkChCeUxlUNuaEhIm9q4kEytoQ4jDuQuY40x/yPbGAwhMTzea4w82B51IP7@vger.kernel.org
X-Gm-Message-State: AOJu0YzhItQHODziKOUFdLzAXDicrz/V0BKy3OgACquo1negDyr1ma9E
	QDfMK0y8bUJmQqtWotOMjRKeDxgYLOb2WZQSpv8yQ8AzChyWW+5HJqgLw972NjA9Oya0lVKyZ4y
	a048NN3nIXkobFCY5voudZ9Q/HOvdBUUlKp8nCDz8LgyZZoEKoWrdFlwN8x8lIvZg
X-Gm-Gg: AeBDietE89QeIeQKpBkvLBVIH9tD+/y+6XVoLkHY0yZV0jBrTBz1YhwaMSdC9G9phs2
	6AOm6ZNxCbwzzEgSSCp7B7CiYI/ElIREqy1niB2iLvOxc7Pm8havqbV5j+FIbFPb/JXO86e9xSe
	QRs6EpJKyieRvnpt+XkJzeruBzATvxt3+xqgykrTtx3f/xVdr/BoORATGjK2eqIsaOLvbpe32vd
	a3mTMPEo1VCBZazclIAiMjaouyVjQkVpguk5uMFhR6BBIkZzFyd98bOa1o5D87AoJF0hWB2Az59
	yAm0sHqwbRz18snDpHYhSY2XfTwu5xZiAvWUEEVNLE2MFJYkpJ7/cVKHQ2bbFtRWu4VEnjY4l0i
	WW2tzdwFk1W7aQq1SYBhymYTi/qspiU8EW2PX
X-Received: by 2002:a05:622a:90d:b0:50d:b030:fc6a with SMTP id d75a77b69052e-50dd5bbe532mr41414541cf.49.1775819455392;
        Fri, 10 Apr 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a05:622a:90d:b0:50d:b030:fc6a with SMTP id d75a77b69052e-50dd5bbe532mr41413941cf.49.1775819454879;
        Fri, 10 Apr 2026 04:10:54 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888acbsm77585265e9.1.2026.04.10.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: pinctrl: nvidia,tegra234: Correctly use additionalProperties
Date: Fri, 10 Apr 2026 13:10:49 +0200
Message-ID: <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=81m559Qm6SjLLX40vo8GQTMVfwyBMUS0e1HYD2duGuA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2Nq4FY3or+M4f5GQ3JJAbgnqoheseefPUNYfN
 YKJiGBNTZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjauAAKCRDBN2bmhouD
 1z1dD/9RfoDDf5mH4lwBRNwWS1oSKdY3K1HmQ0KN63DoB+kCrOKjTPRGVo0+Fo54tzhPEs7BG16
 xL7rZwpZXIPzcp8bePJSiuLZ4lRNTdndxtFK9iBMsIfSJdpknmD+30lcq0wAWx91zRf5xYwqSUd
 ZNO1CnDAx8lEpW65suAt7Bz6mr3sexNrvqkeKRi99O0W5RyAtGzdMKvKgb9KLKr66vO4Dd+uTYS
 O6U1+5U54TWryqcTS8x2ahzuq5Yz12E83KTllv6n6KuUdc2dQ7AVaQ+gsDAGJk4V865FYcFTT0U
 aYXqQjjxTxJrRas4TKx/6E3F83DwtZMRmmvhMxDWYn7Z43EqvDLnOet6A7LxczhNgpeWWouvrTQ
 fPbUTfm/0/2XKOD9xZ4oSwCsUpD2YlheXQ2G0DWf5yKh29FSPrCPSV1OvDg06EnWglhrkZWvixP
 oR1Zoi4Vjbcx/uiMMguuV0v4BG3QPm7fxcaWhSY14BVm39ig5PcYD+RQ5EhM9oD9YArMkc79CLH
 eCwjHapxaczA4eOcmChi6aeqJ3QdtSMdywLV+pTNG/blj41+rOpaaWM30JVEsgHb//SlYzDEk6q
 OZqFkw1ZO28VUNgmeRGkh1VgtR7E5a2WhuzuSUG6D4EnbwzII2FGLGQU688uALrfGg3VcdvdJsl 8Elt/cWsQUlWvkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wP_kQHy6AUDYl5E413DlyZrkcrZ7NhZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNCBTYWx0ZWRfX3Cg0N2u0/B8Y
 IrYkEDDrjSMjsmTxf/4VTH/eh1tpqL7nMPE7G3wRlW6/s6l4yBvegyK7PF1mWcOjBhh9US2uSzN
 TUFdTqwni/t2u828ZXl+5psWTavWWGfFnmRfYF6TQI+fbl4EyozhrDJNdwtFmR7rkyp2Ch9q24x
 2nCyoPdX1MsgNPn1qqmBiSMQ96+mB8Qr5KjKs2O3Kau6DdqvHWnXe0RcRrK/2iwV5WMDu6vkxnK
 DJ5JpLwQgrrASKBu039ZigJaxdxvt0DzR8dQEcIOB99ptM6VVtzzK9ODUckWR7IiZyoMI6NOiVU
 h9kFS9SMXTqvyOlFNRI5V4Xk8FciwVoGjBBDtntwf++DFHq4TG7otD4mY9VHlpYT9uDVEZVPN6Q
 j8LPXHW7EPUtdouirq+2UvoR6+ciNcWEmebcF2SpjW9bV7gOhQayWJ9Eit4nRrPDKFF6mviihrx
 FSqdUYoq7dl9BZks5KA==
X-Proofpoint-GUID: wP_kQHy6AUDYl5E413DlyZrkcrZ7NhZJ
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d8dac0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yOyev7M9wBkhzMrpsB8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100104
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35001-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C236A3D6025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml | 2 +-
 .../devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
index 56fb9cf763ef..4910dc8e8aeb 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux-aon.yaml
@@ -62,7 +62,7 @@ required:
   - compatible
   - reg
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
index bd305a34eee2..52b3d40e8839 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
@@ -119,7 +119,7 @@ required:
   - compatible
   - reg
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
-- 
2.51.0


