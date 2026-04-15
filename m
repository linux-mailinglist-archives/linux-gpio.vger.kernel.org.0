Return-Path: <linux-gpio+bounces-35168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGnLGB5432kATgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:35:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0F403E24
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA5963132D5D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA237C108;
	Wed, 15 Apr 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWzpPdW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tq+Mf4oO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657D37FF47
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252594; cv=none; b=k1cNr7T3VjQSYGzobD/isF/1r7+i91/QM4r8U4Jo3XCLWWaTPJf6ywbFuBc3WCpMyv3FVWF2vw9c8zxXwDpsghOwbU+eSYVi038B8POd5dvNxqQmiThV8QJQElXhNQFLaEllgWkQuH7uNNkCrWEuXlPU8sOZIocOkC3PI7D6cDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252594; c=relaxed/simple;
	bh=ev7gbVNG1XMt1Wso0pyHEd0CTSpOAX78sTj7lRrAqmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cR8DFS6ynseOSv4qh95YK6KIxtbe2PMe7m0W1KsrhEY/zLdcb0JIuNxuKygYKwfPR4m0ULRwdQpOZdOJz/Af/nS3puBL+2GgRDNWQ3u0T5K0GhqF/wix2iW56buX1ksdKg+Dk7C4oCrKUTOkJ9eV1y4cpWyBkax7BwV7lqNoNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWzpPdW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tq+Mf4oO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FACeGr1701741
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xG+QUh4wEgXYh2r3Y9k0pa8/42wc5wlNjfVtHmad/OI=; b=lWzpPdW9ilVLxrNn
	dWe/rildbn1iJ13iNIq2LzDR6xIhTadbMfRispQ7FZd0ctK0TpKJw+xQsJ5afQSi
	VhJMmlqy0378We9W+N76Pl7G0LgPzcJNKmjSBjAWsNCV3chS3Wy5NqvwTbzPfKOI
	hn4GQn3L6itZwnTmtW4r2X9sxA6eJapxjir6EoyvPGms1CLTP891XLOWGGDpiAeB
	YZ1WHkNxUbJUJO4WV7APp3dhx5iAD8PcgxkapAzw9xVvMjsOpNSTEJJFTh8Pc6s+
	tVeaKAzOZAw7X/j4YmlEefXvDeSvVpR8Fb1RFkUsZDh9aGCYoXx9ZALXYhwdSDLT
	tkad9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56u123-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so159596a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252590; x=1776857390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG+QUh4wEgXYh2r3Y9k0pa8/42wc5wlNjfVtHmad/OI=;
        b=Tq+Mf4oObLhZr24aZpxaliHyU/bGyBNMgqSoHun2EDi+cCp/wBBwGdTfxVbZpNyNbY
         za2Ru75y940vsGzcJY8AlN/+/eyALm7h9uR4hA2c55DV+nkf+ERqfIRYDQiXBnwT+aoN
         hAOBwLcYMGhXCpdv0iQnxjRp96S06FLYUUw47FrykoWq5heW1f/TAM+kiZdqTMOinNdo
         +ijVGbpmaexCAAHw7mg2M9EXHuNQ6AXgO8wfMMLSOAaBPXvtbZ/ee7nTTnaBUpH646I+
         mbhQntm9vnlT1FmG69Au+jlc60h59NKVLacbzOc/XPHsglz9H1xDl7na+YFfMktz8QB5
         E9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252590; x=1776857390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xG+QUh4wEgXYh2r3Y9k0pa8/42wc5wlNjfVtHmad/OI=;
        b=DeGvG3bdJJnaT7VLcBEORL49+LxzcIViD+IFCyxz4ifBGn3NE3cPsO9i9XRm0eAYyC
         C5PYXKTW50bnxrNYl0QmLt43SBw6UOTbnBbAyPY691SHx8Jr4idBOWeLI1v6c2szt+jA
         ugqzwIJtJtp/C6N1v2+KmDsakXQT78+FZPgvUowXU4M6L0cpBt5O7ziXnuGAmI1g3y4i
         ekDwvklz7dsz9LrREIu1OhqrlM+OfFfyl5yqktwu+m7BhhDK5DWWl8AW0Zx1R2p80ZaW
         /w7HAwGLFYZUQ4NPHqnhouaGGuSi+zM91I7z0j1lj7nqmcxAB/ApRZLVPFrssDW6Bewm
         8aZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rC+S+ZUuJkxSE790zAOQZdSFTW0sf11I8WtFyjJdSYNM2L7eZo2L4XvW26SSITAlib/l0MUCfgyVP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBeQGcDaa9WL78Wn+MjatGEjDVRBYRNrNc6X2fYfilyMp72I4c
	8TBGE0om4TkYbiGp3gWm+VIi2kFfL50EayRqrwidg7nvDWO4EEHrpVEF01guYvPFDRADvjK4pj7
	jePLD/XoxAcb//9pcP43MPS8kgqjXjoRfq31Qh5JexeBRo/sYYQa2fMV9MO0OmWga
X-Gm-Gg: AeBDieu3gHF6L2o00r/WGP/edLbOZXQxZM6ULD7INkrRqCE00krlRVwqIiA48VLAIRe
	JXjI1Z2ADKkniHZDzfC6ruCmH3w+2wh30rxJat+urIVW4KwITIUpm8x4EWeHQ8H44je95kjH6SB
	vHMr++VaxNuSN0FwvpqRrE6KFuF4UCRV0yQUNTG1sJCp6vEgNpkb6lHC8yoP+JwgjS4lofabenH
	0CgPJTRapEOz4naeR4u8YDu9sISkHZGnua0kg1LtKtUXkTxg3OFesIcawJmvkoTD04u3kreCveN
	mUs4Ju1V7Nqt6ooECB95A8DvsmASghuIIL83g6dnkP4w3+EISdiM6S7VPmtmtgww/HvgcP7EkPb
	gwgPUufp7m4ihCJtxiLGjuuJfI9ughhvmZR6jthTZ08kPMvPPeRxf0oiAFY8RQm7PEWlz5683pQ
	54GE01V9bGLyNOEWQOpG8tAgKKE30D2+Gvv2O+5EvvXler5w8jDEWR2NF3
X-Received: by 2002:a05:6a20:939f:b0:39b:8571:3051 with SMTP id adf61e73a8af0-39fc959e2b1mr25476602637.28.1776252590181;
        Wed, 15 Apr 2026 04:29:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:939f:b0:39b:8571:3051 with SMTP id adf61e73a8af0-39fc959e2b1mr25476565637.28.1776252589406;
        Wed, 15 Apr 2026 04:29:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:59:25 +0530
Subject: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=25436;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=ev7gbVNG1XMt1Wso0pyHEd0CTSpOAX78sTj7lRrAqmg=;
 b=Ih5mKiQT6uX6BZm99vvuHVe4aGHnv0o/Nxx9tNqSfus3rNmFSf96bcqk0ly3Q1JTSMitan4R5
 5pqsZAQ6fpmDeQIewxjt5b6sycyjWrfVlI9XiE0f3NlW4f1DUMuKnVe
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: ePxAvpf_9x6ft3oq32QPNNr9-TTr35__
X-Proofpoint-GUID: ePxAvpf_9x6ft3oq32QPNNr9-TTr35__
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df76af cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9BfRLheWMJIugVHxdQMA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX0LVE8bfIskLo
 AF0lUbS+zqw4NQLHvBCbVscdK2ptxlicE+8eAWSoLlvaZxiv2MCz986Dhy7yXcnJxxr2G7eQXcK
 CaefIQCwm7W1drGqyPbm2g/jPnssVkmvYEy/FjOVGWi5RVlwbKm316v4Xb65JZexIIKb/Q0bN53
 nq1ml6Y3DpY6roXgXthUYeSpDZSaxWWXb9zFXxneA0hn+rB3dB6Na6fSTkzuDMKlRzWJjkobSvQ
 unD7oDAqYpsw6VPslUM6FF7uyQxOXTY20rGveAS9Quga92kA9MqXDyPLDJMkgpfAQ5ES5nEgKV+
 0R1JHXKyguTKAMG1GTSyVIgdWgFWAVt9fhliJ8f83xhNJ//uk+HTnUMSvrAF+PycWysSfSNwoZt
 e3zw42/93yugSZKFpEXgUJd3y9C+TMqJ9mq6SpJUaVCrKpbWUnnWKQlU3gFN+cyZp0FFxPDAVsq
 S8tsavLfbn+SkYdGQhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35168-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 21A0F403E24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
so add a driver for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm       |   9 +
 drivers/pinctrl/qcom/Makefile          |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 762 +++++++++++++++++++++++++++++++++
 3 files changed, 772 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 836cdeca1006..0d6f698e26ec 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -120,6 +120,15 @@ config PINCTRL_IPQ9574
           Qualcomm Technologies Inc. IPQ9574 platform. Select this for
           IPQ9574.
 
+config PINCTRL_IPQ9650
+	tristate "Qualcomm Technologies, Inc. IPQ9650 pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
+          the Qualcomm Technologies Inc. TLMM block found on the
+          Qualcomm Technologies Inc. IPQ9650 platform. Select this for
+          IPQ9650.
+
 config PINCTRL_KAANAPALI
 	tristate "Qualcomm Technologies Inc Kaanapali pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 84bda3ada874..f0bb1920b27b 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PINCTRL_IPQ5424)	+= pinctrl-ipq5424.o
 obj-$(CONFIG_PINCTRL_IPQ8074)	+= pinctrl-ipq8074.o
 obj-$(CONFIG_PINCTRL_IPQ6018)	+= pinctrl-ipq6018.o
 obj-$(CONFIG_PINCTRL_IPQ9574)	+= pinctrl-ipq9574.o
+obj-$(CONFIG_PINCTRL_IPQ9650)	+= pinctrl-ipq9650.o
 obj-$(CONFIG_PINCTRL_KAANAPALI) += pinctrl-kaanapali.o
 obj-$(CONFIG_PINCTRL_MSM8226)	+= pinctrl-msm8226.o
 obj-$(CONFIG_PINCTRL_MSM8660)	+= pinctrl-msm8660.o
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9650.c b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
new file mode 100644
index 000000000000..64e443aa31b2
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
@@ -0,0 +1,762 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-msm.h"
+
+#define REG_SIZE 0x1000
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	      \
+	{                                                             \
+		.grp = PINCTRL_PINGROUP("gpio" #id,                   \
+					gpio##id##_pins,              \
+					ARRAY_SIZE(gpio##id##_pins)), \
+		.ctl_reg = REG_SIZE * id,                             \
+		.io_reg = 0x4 + REG_SIZE * id,                        \
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
+		.intr_status_reg = 0xc + REG_SIZE * id,               \
+		.mux_bit = 2,                                         \
+		.pull_bit = 0,                                        \
+		.drv_bit = 6,                                         \
+		.oe_bit = 9,                                          \
+		.in_bit = 0,                                          \
+		.out_bit = 1,                                         \
+		.intr_enable_bit = 0,                                 \
+		.intr_status_bit = 0,                                 \
+		.intr_target_bit = 5,                                 \
+		.intr_target_kpss_val = 3,                            \
+		.intr_raw_status_bit = 4,                             \
+		.intr_polarity_bit = 1,                               \
+		.intr_detection_bit = 2,                              \
+		.intr_detection_width = 2,                            \
+		.funcs = (int[]){                                     \
+			msm_mux_gpio, /* gpio mode */                 \
+			msm_mux_##f1,                                 \
+			msm_mux_##f2,                                 \
+			msm_mux_##f3,                                 \
+			msm_mux_##f4,                                 \
+			msm_mux_##f5,                                 \
+			msm_mux_##f6,                                 \
+			msm_mux_##f7,                                 \
+			msm_mux_##f8,                                 \
+			msm_mux_##f9,                                 \
+		},                                                    \
+		.nfuncs = 10,                                         \
+	}
+
+static const struct pinctrl_pin_desc ipq9650_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+
+enum ipq9650_functions {
+	msm_mux_atest_char_start,
+	msm_mux_atest_char_status0,
+	msm_mux_atest_char_status1,
+	msm_mux_atest_char_status2,
+	msm_mux_atest_char_status3,
+	msm_mux_atest_tic_en,
+	msm_mux_audio_pri_mclk_in0,
+	msm_mux_audio_pri_mclk_out0,
+	msm_mux_audio_pri_mclk_in1,
+	msm_mux_audio_pri_mclk_out1,
+	msm_mux_audio_pri,
+	msm_mux_audio_sec,
+	msm_mux_audio_sec_mclk_in0,
+	msm_mux_audio_sec_mclk_out0,
+	msm_mux_audio_sec_mclk_in1,
+	msm_mux_audio_sec_mclk_out1,
+	msm_mux_core_voltage_0,
+	msm_mux_core_voltage_1,
+	msm_mux_core_voltage_2,
+	msm_mux_core_voltage_3,
+	msm_mux_core_voltage_4,
+	msm_mux_cri_rng0,
+	msm_mux_cri_rng1,
+	msm_mux_cri_rng2,
+	msm_mux_dbg_out_clk,
+	msm_mux_gcc_plltest_bypassnl,
+	msm_mux_gcc_plltest_resetn,
+	msm_mux_gcc_tlmm,
+	msm_mux_gpio,
+	msm_mux_mdc_mst,
+	msm_mux_mdc_slv0,
+	msm_mux_mdc_slv1,
+	msm_mux_mdio_mst,
+	msm_mux_mdio_slv,
+	msm_mux_mdio_slv0,
+	msm_mux_mdio_slv1,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_pcie0_wake,
+	msm_mux_pcie1_clk_req_n,
+	msm_mux_pcie1_wake,
+	msm_mux_pcie2_clk_req_n,
+	msm_mux_pcie2_wake,
+	msm_mux_pcie3_clk_req_n,
+	msm_mux_pcie3_wake,
+	msm_mux_pcie4_clk_req_n,
+	msm_mux_pcie4_wake,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_test,
+	msm_mux_pwm,
+	msm_mux_qdss_cti_trig_in_a0,
+	msm_mux_qdss_cti_trig_in_a1,
+	msm_mux_qdss_cti_trig_in_b0,
+	msm_mux_qdss_cti_trig_in_b1,
+	msm_mux_qdss_cti_trig_out_a0,
+	msm_mux_qdss_cti_trig_out_a1,
+	msm_mux_qdss_cti_trig_out_b0,
+	msm_mux_qdss_cti_trig_out_b1,
+	msm_mux_qdss_traceclk_a,
+	msm_mux_qdss_tracectl_a,
+	msm_mux_qdss_tracedata_a,
+	msm_mux_qspi_data,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs_n,
+	msm_mux_qup_se0,
+	msm_mux_qup_se1,
+	msm_mux_qup_se2,
+	msm_mux_qup_se3,
+	msm_mux_qup_se4,
+	msm_mux_qup_se5,
+	msm_mux_qup_se6,
+	msm_mux_qup_se7,
+	msm_mux_resout,
+	msm_mux_rx_los0,
+	msm_mux_rx_los1,
+	msm_mux_rx_los2,
+	msm_mux_sdc_clk,
+	msm_mux_sdc_cmd,
+	msm_mux_sdc_data,
+	msm_mux_tsens_max,
+	msm_mux_tsn,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",	"gpio4",  "gpio5",  "gpio6",
+	"gpio7",  "gpio8",  "gpio9",  "gpio10", "gpio11", "gpio12", "gpio13",
+	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20",
+	"gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27",
+	"gpio28", "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34",
+	"gpio35", "gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41",
+	"gpio42", "gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48",
+	"gpio49", "gpio50", "gpio51", "gpio52", "gpio53",
+};
+
+static const char *const atest_char_start_groups[] = {
+	"gpio21",
+};
+
+static const char *const atest_char_status0_groups[] = {
+	"gpio33",
+};
+
+static const char *const atest_char_status1_groups[] = {
+	"gpio35",
+};
+
+static const char *const atest_char_status2_groups[] = {
+	"gpio22",
+};
+
+static const char *const atest_char_status3_groups[] = {
+	"gpio23",
+};
+
+static const char *const atest_tic_en_groups[] = {
+	"gpio53",
+};
+
+static const char *const audio_pri_mclk_in0_groups[] = {
+	"gpio53",
+};
+
+static const char *const audio_pri_mclk_out0_groups[] = {
+	"gpio53",
+};
+
+static const char *const audio_pri_mclk_in1_groups[] = {
+	"gpio51",
+};
+
+static const char *const audio_pri_mclk_out1_groups[] = {
+	"gpio51",
+};
+
+static const char *const audio_pri_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const audio_sec_mclk_in0_groups[] = {
+	"gpio37",
+};
+
+static const char *const audio_sec_mclk_out0_groups[] = {
+	"gpio37",
+};
+
+static const char *const audio_sec_mclk_in1_groups[] = {
+	"gpio37",
+};
+
+static const char *const audio_sec_mclk_out1_groups[] = {
+	"gpio37",
+};
+
+static const char *const audio_sec_groups[] = {
+	"gpio45", "gpio46", "gpio47", "gpio48",
+};
+
+static const char *const core_voltage_0_groups[] = {
+	"gpio16",
+};
+
+static const char *const core_voltage_1_groups[] = {
+	"gpio17",
+};
+
+static const char *const core_voltage_2_groups[] = {
+	"gpio33",
+};
+
+static const char *const core_voltage_3_groups[] = {
+	"gpio34",
+};
+
+static const char *const core_voltage_4_groups[] = {
+	"gpio35",
+};
+
+static const char *const cri_rng0_groups[] = {
+	"gpio6",
+};
+
+static const char *const cri_rng1_groups[] = {
+	"gpio7",
+};
+
+static const char *const cri_rng2_groups[] = {
+	"gpio8",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio46",
+};
+
+static const char *const gcc_plltest_bypassnl_groups[] = {
+	"gpio33",
+};
+
+static const char *const gcc_plltest_resetn_groups[] = {
+	"gpio35",
+};
+
+static const char *const gcc_tlmm_groups[] = {
+	"gpio34",
+};
+
+static const char *const mdc_mst_groups[] = {
+	"gpio22",
+};
+
+static const char *const mdc_slv0_groups[] = {
+	"gpio20",
+};
+
+static const char *const mdc_slv1_groups[] = {
+	"gpio14",
+};
+
+static const char *const mdio_mst_groups[] = {
+	"gpio23",
+};
+
+static const char *const mdio_slv_groups[] = {
+	"gpio46",
+	"gpio47",
+};
+
+static const char *const mdio_slv0_groups[] = {
+	"gpio21",
+};
+
+static const char *const mdio_slv1_groups[] = {
+	"gpio15",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio24",
+};
+
+static const char *const pcie0_wake_groups[] = {
+	"gpio26",
+};
+
+static const char *const pcie1_clk_req_n_groups[] = {
+	"gpio27",
+};
+
+static const char *const pcie1_wake_groups[] = {
+	"gpio29",
+};
+
+static const char *const pcie2_clk_req_n_groups[] = {
+	"gpio51",
+};
+
+static const char *const pcie2_wake_groups[] = {
+	"gpio53",
+};
+
+static const char *const pcie3_clk_req_n_groups[] = {
+	"gpio40",
+};
+
+static const char *const pcie3_wake_groups[] = {
+	"gpio42",
+};
+
+static const char *const pcie4_clk_req_n_groups[] = {
+	"gpio30",
+};
+
+static const char *const pcie4_wake_groups[] = {
+	"gpio32",
+};
+
+static const char *const pll_bist_sync_groups[] = {
+	"gpio47",
+};
+
+static const char *const pll_test_groups[] = {
+	"gpio39",
+};
+
+static const char *const pwm_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11", "gpio16",
+	"gpio17", "gpio33", "gpio34", "gpio35", "gpio43", "gpio44", "gpio45",
+	"gpio46", "gpio47", "gpio48",
+};
+
+static const char *const qdss_cti_trig_in_a0_groups[] = {
+	"gpio53",
+};
+
+static const char *const qdss_cti_trig_in_a1_groups[] = {
+	"gpio29",
+};
+
+static const char *const qdss_cti_trig_in_b0_groups[] = {
+	"gpio42",
+};
+
+static const char *const qdss_cti_trig_in_b1_groups[] = {
+	"gpio43",
+};
+
+static const char *const qdss_cti_trig_out_a0_groups[] = {
+	"gpio51",
+};
+
+static const char *const qdss_cti_trig_out_a1_groups[] = {
+	"gpio27",
+};
+
+static const char *const qdss_cti_trig_out_b0_groups[] = {
+	"gpio40",
+};
+
+static const char *const qdss_cti_trig_out_b1_groups[] = {
+	"gpio44",
+};
+
+static const char *const qdss_traceclk_a_groups[] = {
+	"gpio45",
+};
+
+static const char *const qdss_tracectl_a_groups[] = {
+	"gpio46",
+};
+
+static const char *const qdss_tracedata_a_groups[] = {
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",	"gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio20", "gpio21",
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const qspi_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qspi_clk_groups[] = {
+	"gpio5",
+};
+
+static const char *const qspi_cs_n_groups[] = {
+	"gpio4",
+};
+
+static const char *const qup_se0_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio51", "gpio53",
+};
+
+static const char *const qup_se1_groups[] = {
+	"gpio10", "gpio11", "gpio12", "gpio13", "gpio27", "gpio29",
+};
+
+static const char *const qup_se2_groups[] = {
+	"gpio27", "gpio29", "gpio33", "gpio34",
+};
+
+static const char *const qup_se3_groups[] = {
+	"gpio16", "gpio17", "gpio20", "gpio21",
+};
+
+static const char *const qup_se4_groups[] = {
+	"gpio14", "gpio15", "gpio40", "gpio42", "gpio43", "gpio44",
+};
+
+static const char *const qup_se5_groups[] = {
+	"gpio40", "gpio42", "gpio45", "gpio46", "gpio47", "gpio48",
+};
+
+static const char *const qup_se6_groups[] = {
+	"gpio43", "gpio44", "gpio51", "gpio53",
+};
+
+static const char *const qup_se7_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const resout_groups[] = {
+	"gpio49",
+};
+
+static const char *const rx_los0_groups[] = {
+	"gpio39", "gpio47", "gpio50",
+};
+
+static const char *const rx_los1_groups[] = {
+	"gpio38", "gpio46",
+};
+
+static const char *const rx_los2_groups[] = {
+	"gpio37", "gpio45",
+};
+
+static const char *const sdc_clk_groups[] = {
+	"gpio5",
+};
+
+static const char *const sdc_cmd_groups[] = {
+	"gpio4",
+};
+
+static const char *const sdc_data_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const tsens_max_groups[] = {
+	"gpio14",
+};
+
+static const char *const tsn_groups[] = {
+	"gpio50",
+};
+
+static const struct pinfunction ipq9650_functions[] = {
+	MSM_PIN_FUNCTION(atest_char_start),
+	MSM_PIN_FUNCTION(atest_char_status0),
+	MSM_PIN_FUNCTION(atest_char_status1),
+	MSM_PIN_FUNCTION(atest_char_status2),
+	MSM_PIN_FUNCTION(atest_char_status3),
+	MSM_PIN_FUNCTION(atest_tic_en),
+	MSM_PIN_FUNCTION(audio_pri_mclk_in0),
+	MSM_PIN_FUNCTION(audio_pri_mclk_out0),
+	MSM_PIN_FUNCTION(audio_pri_mclk_in1),
+	MSM_PIN_FUNCTION(audio_pri_mclk_out1),
+	MSM_PIN_FUNCTION(audio_pri),
+	MSM_PIN_FUNCTION(audio_sec),
+	MSM_PIN_FUNCTION(audio_sec_mclk_in0),
+	MSM_PIN_FUNCTION(audio_sec_mclk_out0),
+	MSM_PIN_FUNCTION(audio_sec_mclk_in1),
+	MSM_PIN_FUNCTION(audio_sec_mclk_out1),
+	MSM_PIN_FUNCTION(core_voltage_0),
+	MSM_PIN_FUNCTION(core_voltage_1),
+	MSM_PIN_FUNCTION(core_voltage_2),
+	MSM_PIN_FUNCTION(core_voltage_3),
+	MSM_PIN_FUNCTION(core_voltage_4),
+	MSM_PIN_FUNCTION(cri_rng0),
+	MSM_PIN_FUNCTION(cri_rng1),
+	MSM_PIN_FUNCTION(cri_rng2),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(gcc_plltest_bypassnl),
+	MSM_PIN_FUNCTION(gcc_plltest_resetn),
+	MSM_PIN_FUNCTION(gcc_tlmm),
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(mdc_mst),
+	MSM_PIN_FUNCTION(mdc_slv0),
+	MSM_PIN_FUNCTION(mdc_slv1),
+	MSM_PIN_FUNCTION(mdio_mst),
+	MSM_PIN_FUNCTION(mdio_slv),
+	MSM_PIN_FUNCTION(mdio_slv0),
+	MSM_PIN_FUNCTION(mdio_slv1),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(pcie0_wake),
+	MSM_PIN_FUNCTION(pcie1_clk_req_n),
+	MSM_PIN_FUNCTION(pcie1_wake),
+	MSM_PIN_FUNCTION(pcie2_clk_req_n),
+	MSM_PIN_FUNCTION(pcie2_wake),
+	MSM_PIN_FUNCTION(pcie3_clk_req_n),
+	MSM_PIN_FUNCTION(pcie3_wake),
+	MSM_PIN_FUNCTION(pcie4_clk_req_n),
+	MSM_PIN_FUNCTION(pcie4_wake),
+	MSM_PIN_FUNCTION(pll_bist_sync),
+	MSM_PIN_FUNCTION(pll_test),
+	MSM_PIN_FUNCTION(pwm),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_in_b1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_a1),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b0),
+	MSM_PIN_FUNCTION(qdss_cti_trig_out_b1),
+	MSM_PIN_FUNCTION(qdss_traceclk_a),
+	MSM_PIN_FUNCTION(qdss_tracectl_a),
+	MSM_PIN_FUNCTION(qdss_tracedata_a),
+	MSM_PIN_FUNCTION(qspi_data),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs_n),
+	MSM_PIN_FUNCTION(qup_se0),
+	MSM_PIN_FUNCTION(qup_se1),
+	MSM_PIN_FUNCTION(qup_se2),
+	MSM_PIN_FUNCTION(qup_se3),
+	MSM_PIN_FUNCTION(qup_se4),
+	MSM_PIN_FUNCTION(qup_se5),
+	MSM_PIN_FUNCTION(qup_se6),
+	MSM_PIN_FUNCTION(qup_se7),
+	MSM_PIN_FUNCTION(resout),
+	MSM_PIN_FUNCTION(rx_los0),
+	MSM_PIN_FUNCTION(rx_los1),
+	MSM_PIN_FUNCTION(rx_los2),
+	MSM_PIN_FUNCTION(sdc_clk),
+	MSM_PIN_FUNCTION(sdc_cmd),
+	MSM_PIN_FUNCTION(sdc_data),
+	MSM_PIN_FUNCTION(tsens_max),
+	MSM_PIN_FUNCTION(tsn),
+};
+
+static const struct msm_pingroup ipq9650_groups[] = {
+	[0] = PINGROUP(0, sdc_data, qspi_data, _, _, _, _, _, _, _),
+	[1] = PINGROUP(1, sdc_data, qspi_data, _, _, _, _, _, _, _),
+	[2] = PINGROUP(2, sdc_data, qspi_data, _, _, _, _, _, _, _),
+	[3] = PINGROUP(3, sdc_data, qspi_data, _, _, _, _, _, _, _),
+	[4] = PINGROUP(4, sdc_cmd, qspi_cs_n, _, _, _, _, _, _, _),
+	[5] = PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
+	[6] = PINGROUP(6, qup_se0, pwm, _, cri_rng0, qdss_tracedata_a, _, _, _, _),
+	[7] = PINGROUP(7, qup_se0, pwm, _, cri_rng1, qdss_tracedata_a, _, _, _, _),
+	[8] = PINGROUP(8, qup_se0, pwm, _, cri_rng2, qdss_tracedata_a, _, _, _, _),
+	[9] = PINGROUP(9, qup_se0, pwm, _, qdss_tracedata_a, _, _, _, _, _),
+	[10] = PINGROUP(10, qup_se1, pwm, _, _, qdss_tracedata_a, _, _, _, _),
+	[11] = PINGROUP(11, qup_se1, pwm, _, _, qdss_tracedata_a, _, _, _, _),
+	[12] = PINGROUP(12, qup_se1, _, qdss_tracedata_a, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup_se1, _, qdss_tracedata_a, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup_se4, mdc_slv1, tsens_max, _, qdss_tracedata_a, _, _, _, _),
+	[15] = PINGROUP(15, qup_se4, mdio_slv1, _, qdss_tracedata_a, _, _, _, _, _),
+	[16] = PINGROUP(16, core_voltage_0, qup_se3, pwm, _, _, _, _, _, _),
+	[17] = PINGROUP(17, core_voltage_1, qup_se3, pwm, _, _, _, _, _, _),
+	[18] = PINGROUP(18, _, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, _, _, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, mdc_slv0, qup_se3, _, qdss_tracedata_a, _, _, _, _, _),
+	[21] = PINGROUP(21, mdio_slv0, qup_se3, atest_char_start, _, qdss_tracedata_a, _, _, _, _),
+	[22] = PINGROUP(22, mdc_mst, atest_char_status2, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, mdio_mst, atest_char_status3, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, pcie0_clk_req_n, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, pcie0_wake, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, pcie1_clk_req_n, qup_se2, qup_se1, _, qdss_cti_trig_out_a1, _, _, _, _),
+	[28] = PINGROUP(28, _, _, _, _, _, _, _, _, _),
+	[29] = PINGROUP(29, pcie1_wake, qup_se2, qup_se1, _, qdss_cti_trig_in_a1, _, _, _, _),
+	[30] = PINGROUP(30, pcie4_clk_req_n, _, _, _, _, _, _, _, _),
+	[31] = PINGROUP(31, _, _, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, pcie4_wake, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, core_voltage_2, qup_se2, gcc_plltest_bypassnl, pwm, atest_char_status0, _, _, _, _),
+	[34] = PINGROUP(34, core_voltage_3, qup_se2, gcc_tlmm, pwm, _, _, _, _, _),
+	[35] = PINGROUP(35, core_voltage_4, gcc_plltest_resetn, pwm, atest_char_status1, _, _, _, _, _),
+	[36] = PINGROUP(36, audio_pri, qup_se7, qdss_tracedata_a, _, _, _, _, _, _),
+	[37] = PINGROUP(37, audio_pri, qup_se7, audio_sec_mclk_out0, audio_sec_mclk_in0, rx_los2, qdss_tracedata_a, _, _, _),
+	[38] = PINGROUP(38, audio_pri, qup_se7, rx_los1, qdss_tracedata_a, _, _, _, _, _),
+	[39] = PINGROUP(39, audio_pri, qup_se7, audio_sec_mclk_out1, audio_sec_mclk_in1, pll_test, rx_los0, _, qdss_tracedata_a, _),
+	[40] = PINGROUP(40, pcie3_clk_req_n, qup_se5, qup_se4, _, qdss_cti_trig_out_b0, _, _, _, _),
+	[41] = PINGROUP(41, _, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, pcie3_wake, qup_se5, qup_se4, _, qdss_cti_trig_in_b0, _, _, _, _),
+	[43] = PINGROUP(43, qup_se4, qup_se6, pwm, _, qdss_cti_trig_in_b1, _, _, _, _),
+	[44] = PINGROUP(44, qup_se4, qup_se6, pwm, _, qdss_cti_trig_out_b1, _, _, _, _),
+	[45] = PINGROUP(45, qup_se5, rx_los2, audio_sec, pwm, _, qdss_traceclk_a, _, _, _),
+	[46] = PINGROUP(46, qup_se5, rx_los1, audio_sec, mdio_slv, pwm, dbg_out_clk, qdss_tracectl_a, _, _),
+	[47] = PINGROUP(47, qup_se5, rx_los0, audio_sec, mdio_slv, pll_bist_sync, pwm, _, _, _),
+	[48] = PINGROUP(48, qup_se5, audio_sec, pwm, _, _, _, _, _, _),
+	[49] = PINGROUP(49, resout, _, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, tsn, rx_los0, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, pcie2_clk_req_n, qup_se6, qup_se0, audio_pri_mclk_out1, audio_pri_mclk_in1, qdss_cti_trig_out_a0, _, _, _),
+	[52] = PINGROUP(52, _, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, pcie2_wake, qup_se6, qup_se0, audio_pri_mclk_out0, audio_pri_mclk_in0, qdss_cti_trig_in_a0, _, atest_tic_en, _),
+};
+
+static const struct msm_pinctrl_soc_data ipq9650_tlmm = {
+	.pins = ipq9650_pins,
+	.npins = ARRAY_SIZE(ipq9650_pins),
+	.functions = ipq9650_functions,
+	.nfunctions = ARRAY_SIZE(ipq9650_functions),
+	.groups = ipq9650_groups,
+	.ngroups = ARRAY_SIZE(ipq9650_groups),
+	.ngpios = 54,
+};
+
+static const struct of_device_id ipq9650_tlmm_of_match[] = {
+	{ .compatible = "qcom,ipq9650-tlmm", },
+	{},
+};
+
+static int ipq9650_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &ipq9650_tlmm);
+}
+
+static struct platform_driver ipq9650_tlmm_driver = {
+	.driver = {
+		.name = "ipq9650-tlmm",
+		.of_match_table = ipq9650_tlmm_of_match,
+	},
+	.probe = ipq9650_tlmm_probe,
+};
+
+static int __init ipq9650_tlmm_init(void)
+{
+	return platform_driver_register(&ipq9650_tlmm_driver);
+}
+arch_initcall(ipq9650_tlmm_init);
+
+static void __exit ipq9650_tlmm_exit(void)
+{
+	platform_driver_unregister(&ipq9650_tlmm_driver);
+}
+module_exit(ipq9650_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI IPQ9650 TLMM driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


