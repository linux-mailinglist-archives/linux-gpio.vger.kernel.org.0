Return-Path: <linux-gpio+bounces-34533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBLPAkrJzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:29:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C174F375E39
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38D7C303FED8
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E2C3806AB;
	Wed,  1 Apr 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyosuL/u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFBdqSPg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A72C3803E0
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028416; cv=none; b=C6dLwDxDnVoWV94HMV/HAQWRT3YvHnQoRnr4J+ldcidJ0VnkI792AcpozCD2W/WUF7M82V7GSFhKrwkSGO81TYvBFKw4dr+6SRPpX74oE0aNhAiS0bjzhfrAt4b1ciXQPcbxDY77rUaga3SimipXo6NVwwcCjrKKP/jzUNqFIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028416; c=relaxed/simple;
	bh=W2l9B2OwEz4Zivn64VXFY6OgAvWjgIUZq1Hf1pqff4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hM5ITzqEH3u2neSZBSfREEiBLm1emXVPiyMnnJyNduR2HSjP6grso/7zpR3LpA2RrKx4NRJlZeKqRxyBdCMRPWOkteNZBn7rI89UZOhyo75NB2YE3fxQsxEnZ0juBOaqp0qqYrl4q/Y9G9pXxkfho3dr44CxOI0ZNS5esAGkv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyosuL/u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFBdqSPg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IsKc1004296
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=; b=eyosuL/uMdllbuoG
	OoXppU7EyRulzXAUy4g1IxpXBgRZ7mqTI9WNAzDCVx1Sg3n3TbIJIjzsBOtDx9/S
	UFiHtgNg7Fq7HBZrUshrXV+r6kbRb2eoHTf7ccch2MLJLE5C7rRKJNm3A+UTlXId
	14Z7nHtTCFkw6Fun9+o+xr2p++DDyIdamIlrCtdSls6IdkMoXBypdUgyfyH3v7/O
	WlfFLT8c8lo+c80/dTKtwyD/L24uBA9s5VX+f/yxA5GnHIawewCbvnZ5bqNcOCrT
	asmSA4TKsxypBcF1R+cD2W13YVkos0/gaDPFpyRtYhxMiAsONdBwW/5eqqa6uUEd
	hSkfVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh337-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso205430041cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028411; x=1775633211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=;
        b=AFBdqSPgSI0jfFJkH/IBiDA9HA9/MnJesaYRLtDUCwoACWV1tg2+2kpgcVSUJ7HxOU
         lL3sSnicZfKIG7bORjD9XXP75ZWr0FVqCck+lCsYBJtZtQc8yGXOD6gs39Q08ho4ueD5
         GI6XL4Fd6xAjmK4y5nr5ZP4OCPkO9yBWt7H45w7yYvsQ32LUfs5svryCOTCG/lIzThyQ
         8kcdkR2NhVLv6Wj/1tT4RhVudNdF70p7+pt/eCOnV5LQH+7grgdx54tOA28fQdhWx36a
         WVmsjREDH2ecezCPcRAVN3kez4113n6CPujLObQ7M+VZSqUioOWuXjMK+hCjjYonAxan
         Dr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028411; x=1775633211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tuSg4uKpYZ3ltK87EQx0c6H4sS4d6Dc+WdX7+gIALo=;
        b=bJdvzsmCCdLyy/3i6Fz+1iQU1tBCWnofCc9GsN6OSjvYiHNb28rFYNheMkMrJfzZQS
         ljc3qhbWzUbZ9CQ2jTXGbil7BIfGPsTUayiEV9qD0myjg7z8RkQu2fN42vX8mRht/Ylx
         tp/MfrUvsq+jV9teNHHDjWcRGzZPdzZl152wdtecfRYE2cB/cTyK396nJsl4QsTddjWW
         JvuaYsBGHKU/1x53Vb+/zLfIEwnHMZgQffA7+nozTS6sgnOp+NvKLxlr4PJ1L1101W2b
         D2Ll6cQWJ0qCNjilYFV3uy9zcXsk0OrhzBWhPDcCnemsiZf3eJ/KSBXRhGtnFh7q7H4d
         T+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU691MWwgWy3M3/TVwtwz0IEb8kZRIakJO9hVe9ka9Av1Y2un6fAjnhwdkfMW+GG3GsOMvuX9mAgkxl@vger.kernel.org
X-Gm-Message-State: AOJu0YycqYynhDFLVoDXZXIFqltc2EesBMf+MM5FVs1+H+n4mPFxmSkq
	HTz1ZFUgEJ0RMx7wetaFG3gbR9AcrULCMFGsgACTwtQTcLYE0Ji6nOuqZ2A+Cok4xCb+qAa/Srx
	BBeGU2T3IDFYwcE5g9VMB4lVKYHm/oFTqA+NLXDWX7cFHSraziBQ2/M7l575JMfm7
X-Gm-Gg: ATEYQzw76ekLDcjGVtr+cGepfM/ABcSD/TSU7eLKDUnv8v+dBUngLDxUhSsKXzmSs5Z
	oBSeqPjq46WXY5Zg+Hps1hIfI8kZ7ubOWuIpgn6cIe+uMLM9Cg6tple1JSBY+inVDo/KETRCivx
	E6P9VvyEbn0VHEJYcKCxt0p9pPhUgH032AwUEo9iFgC4CrAarKvwcneYq+OOhz0YvM5ep41YHuq
	6zFDUvI62Cu7hD/a35IJfhAckdTS22w+sZz7VAvup6MKR3hMfQjkqJPhCG5PiGisz8m75s8Q4YO
	rqIW/gzTnrk57MjQ6INfprMenwIL68KpSJ35dstVTNgRv5qG66nnVHo4JMmuzV/7YN/y9pVfIW2
	fPCojr6bNdnzV4pkCUUCuchMgN9Pl86v1YX5XPe04XGTB8/6f8HsdXyCIUwQwMJ8zV5UjI0uRB2
	cORkGCSqVAgn1uZhbh8b99xgwt1lic0LG65PY=
X-Received: by 2002:a05:622a:1a84:b0:509:cbc:127b with SMTP id d75a77b69052e-50d3bd5731fmr33063111cf.60.1775028411363;
        Wed, 01 Apr 2026 00:26:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:509:cbc:127b with SMTP id d75a77b69052e-50d3bd5731fmr33062941cf.60.1775028410903;
        Wed, 01 Apr 2026 00:26:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:24 +0300
Subject: [PATCH 05/19] dt-bindings: dipslay/panel: describe panels using
 Focaltech OTA7290B
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-5-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2l9B2OwEz4Zivn64VXFY6OgAvWjgIUZq1Hf1pqff4o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirhSCbwfrsUoindh5tIcQpjN2BUzdd9VLtD
 N3aR28c0wqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1ep0B/9Y4MLaoQn9Rs+aojsS9sQIFOYrYmuNPvJk/MBys5hamRAKdl8Ug9esCtE8LDpcO54zQgf
 8dwQKQv7MEmw9ymrd/RtBHQfwkXrdrBapeENdwYUIqxBPowWtbUB7uCnIn2LpKusg8zOs7OCD//
 ALY2OrArJG8tDkU3qH9ICtLT4Gya7cF7W1D0aemlxB84yeakbCGNBYECnmZUQchq1ZXiGvAjKMy
 uIvwL0DbQc7EABVZp2uiII1Ne/cgGor57MYp77DLY+zp2xoomZ0tSvfNntiVriQF0TGkPc+Qh2l
 ipCZylqfWFDSTXCGnc1R88jr2BwkVPa+8mWlQLNH02Su/m5K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FupdrNxS5_wvvULm0zNcoa2pkP06EgM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX27Hd0v7Z5X/8
 vNbC+OIi7rItQHzxpn+HhPJVR0TgEWf9Ad+ak8kq/JKIvW1DA33k72xvr37twoR9TplFYOAiFvA
 Zd9dOZpFkrZ2qJ++cb0mWqFWeb6VOFReCWvjqvQW0le7D5QHZlNNFDuVvABCojVTTYzKesDdtN2
 AiR63cf6qqYyH+sV69pO7a4clUVQ/33fzhc9rICx+Ldp6WdCaWgbGTJtiRMTZTq8fhbMWNbS45r
 wYjsfPA1MIvsmqsaYGCPlwGl7DczjpGF50WLE9w3EXgxh9Da85/EGN8bFSystHqnHQMfLuv2e7F
 8pAz+hGUU0/Pljwdnnm0bZtIsPm8+6BZ418eA7ffJSp9lM32cdIJXV1ut2x3DXwogxii1lon36X
 vOmjtikFuleK1k2iqJK+w6rkRecxwcY9/o34cfuAVyk4FYujHRK8or+Pg68XlZJ8d5ziEB4LEAg
 BFtLDMSb1VSKAoLkYzg==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=QaDNpyu5kUm-e7c-h_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FupdrNxS5_wvvULm0zNcoa2pkP06EgM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34533-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C174F375E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add schema for the panels using Focaltech OTA7290B controller. For now
there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
new file mode 100644
index 000000000000..da5237404dc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/focaltech,ota7290b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech OTA7290B DSI panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    - const: waveshare,8.88-dsi-touch-a
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: supply regulator for VDD, usually 3.3V
+
+  vdda-supply:
+    description: supply regulator for VDDA, 7-10V
+
+  vcc-supply:
+    description: supply regulator for VCCIO, usually 1.5V
+
+  reset-gpios: true
+  backlight: true
+  rotation: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vccio-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "waveshare,8.8-dsi-touch-a";
+            reg = <0>;
+            vdd-supply = <&vdd>;
+            vccio-supply = <&vccio>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
+

-- 
2.47.3


