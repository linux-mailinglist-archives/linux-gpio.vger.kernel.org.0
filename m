Return-Path: <linux-gpio+bounces-36040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFMsE6d5+GmgvgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:49:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D79554BBFAA
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 12:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F9A93006B58
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 10:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AA13A6B74;
	Mon,  4 May 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRea3z4f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbiIQ34y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AEE34C155
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891746; cv=none; b=J5YO48t5ALifMxsPUA+tTnoj3CZXwGkWLAZp/AEeWc9TfLLWEsqlmxChL4wwbtM2PzFpIDoZ2Je3jvzlkOoL9TIkJV/Q0aI9BCQ0Wi5EdeMzICOBDwxccRtKHC04Zc+EEw7WHhU62HFVJQeDBUDTn6I3Lvuq5eySWiykbuZTXk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891746; c=relaxed/simple;
	bh=rVAJe8VJ52efqr5tDE/BbiD8MSFVDsOJhmvx15lWVeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7phQbq2Pg9KgE87pX77LRySp0S5uo8CN9ahZXl/0h7qgYi106rYnt+RaN05h9Yleqe7hlSgk0AmBnv7xyiBZYXoOm8L4KVLOy9BAAU+ncjifbw5SvOpG166lsNuLyupWR44z8FVNGO/aDZ/zjL1EUFRNjVuTeaHzvbTfWpPO+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRea3z4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbiIQ34y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fG5q3845911
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 10:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgZwW2GScDmEWcMIVM5yZdukZuLuLj1MgRpGKUhkQa4=; b=hRea3z4fJJVqEYfv
	6Y/GbT8ECwSm5A1vKL55GPXJukuNmXAy2QUSXpC49hepezfybVv737xWAVT1sI6t
	MqviDDOHveDhi/zMOO1PjpW2tHTdNw7uTUpKGp/Twy3JtGXwp7+yGDY+UvmBPXha
	8ZOZn80U4+vA4j7iHEnBQ3EKPYQO6kwuhe57eX3JutXAcXc/v7iwXjPrIQFz9Aov
	q0gCyn6LQEZGwKxbMb7u273hIVdOw3xNmO9ZE6smetdhWoejbrNrCsGW07JKL2QA
	S4R0kQb+czX+5woGm177ZR1r2LUmnLHMiOIrXBhTrLXChWgo2nGq0JvPDKzixw8h
	RVmcEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfdpbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 10:49:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9f5ac4e36so14010235ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777891742; x=1778496542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgZwW2GScDmEWcMIVM5yZdukZuLuLj1MgRpGKUhkQa4=;
        b=RbiIQ34yheLQvBDpne1lpVrtymZe4+JCIPQJ7G7A8Yg9v/Nco2u+u0Iq/K56sCbnMU
         hYxo7mi/nIdrXgP7a2wu6LvYeDk3fzKkUBN9xaeavsqppehCMS3URk9yBr5JT1rOYkRM
         ruF4WV+5PneSD2+Kuhg32gu2VqyOx+qC5IprHBouehQLJX1E7lfeIJCNegJuilzjR6Ff
         3SzjeF6KJvOYEfXU4OqYvaJS6TC3L/39EhuqELLEbf88pxEcxE7Ix3IW+7xRnVUUyoRo
         MDYvu14AT833XdPHU2NeIJXP0sAJ+aIJgifGT4//7bPDi9/ywduRqtWf7neF1MFdOie+
         /yrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891742; x=1778496542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgZwW2GScDmEWcMIVM5yZdukZuLuLj1MgRpGKUhkQa4=;
        b=tD7zq6KBm1bTyBrC1Go8SHf3MV1yFPAFRQVhrE2iWO/S7G9NCkXMvmjmkjLP9jMrjZ
         7UBujA38fc47AZJj/DzoKgsCcyRl+HQkVEhsOHdLXWKqd9y/NCanZYNa0mSdEnc/wV4c
         53i2GMYrSt1eZFFFCERF9g+S/ef5ESFY48EaWZdMJL5/4mRFskmICueGDxigRMkqnX7+
         5gSE4vTpqSZa/zjjZDAqmQLWVYhxh1lBJIsna0Y7NJwmBMR3W/46aasfAEe26l+xRhOZ
         dm0DUd947sZmUN8uvSamHTz3PubMozQCE8bb+wpqsw2DiQv4teWBarrcHuIu6fIFw7Ot
         +Anw==
X-Forwarded-Encrypted: i=1; AFNElJ9f539WCgESh02HnUTp+GYqPK7aOOV8/OJlCxwLtkHFRPpBibvy3K8B2N98Za6Qgcojrq/bRI8afvsb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj793jNTg8h8c+8CwYVYHYrOFJLvScoAbT3JnCqEoGvWp4PWlX
	lnEKeHSZSghMMLpJILRIEmbWbkyVujXtWvvLAWmuMVdX3HI+mgr68gyflcFFReJYLS3UMAdjzGI
	dF/6DKprHw6djAnmgWYRKhEWlpTrVkKw/oMIKVMfn+Patfq9ekxAPh7SgoTYruuH2
X-Gm-Gg: AeBDievAz2PbhUgpFw9xBT35ose9luDtznsSq9dMYSEM+HXtDfdpP5JO6KEK1rMnrna
	ICeKDqV3wmUHFLw4OwSJT5P6b4A7ZwLAAUoLgofhNsCF+22CLTyWiP7ZGnZQGuEZbT596BVGW2Y
	IJyZ/NTi9SeelceZElvYjH7JkcbYU0xgCCWzVQyhHud78ec97Duz23b0Lg0OYj/+keAKInP3g68
	5ZtrIbW9IXDNeTlJyk4zFP5Dj+4dY+5VFO9zI/21aUsSjUvMNG6OT8ZYX49FDA3sQTTxhG8v5vL
	+SQUk+t6ePXGBpRZHeiUzuCw+Ac9+SpAluT241jCOHStawsH4e/PF0rRqxuza0TAGNGgH6NEpAJ
	VbCbcQFkoTh4FO5Y1Z+QR60s06j4IehdAN/UkVeTl7PGVYX0=
X-Received: by 2002:a17:903:4515:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2b9f282ab84mr54356425ad.32.1777891741459;
        Mon, 04 May 2026 03:49:01 -0700 (PDT)
X-Received: by 2002:a17:903:4515:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2b9f282ab84mr54356115ad.32.1777891740709;
        Mon, 04 May 2026 03:49:00 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68443sm96799365ad.81.2026.05.04.03.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:49:00 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 04 May 2026 16:18:43 +0530
Subject: [PATCH v2 2/2] pinctrl: qcom: Add Shikra pinctrl driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-shikra-pinctrl-v2-2-14e9dcc2d685@oss.qualcomm.com>
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
In-Reply-To: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777891727; l=45751;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rVAJe8VJ52efqr5tDE/BbiD8MSFVDsOJhmvx15lWVeg=;
 b=pCF2ZaJSWnz2giw+0RuC3JRUP5+myo6CdhP55r6hTII1zv/hTItZkWhj3eNvIb3UXyJE3cCpw
 2HfJoX3B3BxB916x/VGRHeST8uZpDhGVXQX/uLIqApcZzvwu+j1P8jl
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: Ke7bxBLMqaF8VDo4pSiNieV98c_N1sni
X-Proofpoint-GUID: Ke7bxBLMqaF8VDo4pSiNieV98c_N1sni
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f8799e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Jnm5sKJ_iOhQ51in-hAA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMiBTYWx0ZWRfXzDrTDpouN6Yl
 7kUOE5auZKNb2mfxuZ5CRVMcZTkw7KTgdvzvuYpIWkC+jI+vd755jI/5XzKvhPyXj6TRJYyo48l
 QZPphu1sXHstqNsTfz7nsLCUaSlZaZaVAuaCcRTVxinmqy5by1Uximqy+LX7I5JpYFl/xVe09/+
 jaHgoAfMy+Dm9rKCKEaQ8n5RI88V2YMPizIjz+illhkJ3pEVnskhv1e260QK8bJgvgUbwrukyoS
 PBeacK9p2vOPlcN0Qu/TvcTdo48u7nR4te/csEXn6cQhcpsBcRMnjcvpa6rq/hy29zcNnOaNEKr
 eX1S+2UfyCnRHvxKAfPl0wUBixkMogBq/ykILhbLuT0luA8QxOoLSlVc35zMXqor1ru3m1cGAO+
 r0PqQrOi43k8Hrz3r+XTPpfwmW8zbgISeOLsMHeA4FrCTxZ790XZEq3H14c5iXa0UG5wc5dWQp+
 PLZ1GKNLf6vUgmeFNpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040112
X-Rspamd-Queue-Id: D79554BBFAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36040-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add pinctrl driver for TLMM block found in Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm      |   11 +
 drivers/pinctrl/qcom/Makefile         |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c | 1256 +++++++++++++++++++++++++++++++++
 3 files changed, 1268 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 836cdeca1006..20e106849273 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -369,6 +369,17 @@ config PINCTRL_SDX75
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
          Technologies Inc SDX75 platform.
 
+config PINCTRL_SHIKRA
+	tristate "Qualcomm Shikra pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
+	  found on the Qualcomm	Technologies Inc Shikra platform.
+	  Say Y here to compile statically, or M here to compile it as a module.
+	  If unsure, say N.
+
 config PINCTRL_SM4450
 	tristate "Qualcomm Technologies Inc SM4450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 84bda3ada874..07c0d236d82f 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SDX65) += pinctrl-sdx65.o
 obj-$(CONFIG_PINCTRL_SDX75) += pinctrl-sdx75.o
+obj-$(CONFIG_PINCTRL_SHIKRA) += pinctrl-shikra.o
 obj-$(CONFIG_PINCTRL_SM4250_LPASS_LPI) += pinctrl-sm4250-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM4450) += pinctrl-sm4450.o
 obj-$(CONFIG_PINCTRL_SM6115) += pinctrl-sm6115.o
diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
new file mode 100644
index 000000000000..223456b68d01
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
@@ -0,0 +1,1256 @@
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
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)	\
+	{						\
+		.grp = PINCTRL_PINGROUP("gpio" #id,	\
+			gpio##id##_pins,		\
+			ARRAY_SIZE(gpio##id##_pins)),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9,			\
+			msm_mux_##f10,			\
+			msm_mux_##f11 /* egpio mode */	\
+		},					\
+		.nfuncs = 12,				\
+		.ctl_reg = REG_SIZE * id,		\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,	\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,	\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_wakeup_enable_bit = 7,	\
+		.intr_wakeup_present_bit = 6,	\
+		.intr_target_bit = 8,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)	\
+	{					        \
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+static const struct pinctrl_pin_desc shikra_pins[] = {
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
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
+	PINCTRL_PIN(113, "GPIO_113"),
+	PINCTRL_PIN(114, "GPIO_114"),
+	PINCTRL_PIN(115, "GPIO_115"),
+	PINCTRL_PIN(116, "GPIO_116"),
+	PINCTRL_PIN(117, "GPIO_117"),
+	PINCTRL_PIN(118, "GPIO_118"),
+	PINCTRL_PIN(119, "GPIO_119"),
+	PINCTRL_PIN(120, "GPIO_120"),
+	PINCTRL_PIN(121, "GPIO_121"),
+	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
+	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
+	PINCTRL_PIN(129, "GPIO_129"),
+	PINCTRL_PIN(130, "GPIO_130"),
+	PINCTRL_PIN(131, "GPIO_131"),
+	PINCTRL_PIN(132, "GPIO_132"),
+	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
+	PINCTRL_PIN(135, "GPIO_135"),
+	PINCTRL_PIN(136, "GPIO_136"),
+	PINCTRL_PIN(137, "GPIO_137"),
+	PINCTRL_PIN(138, "GPIO_138"),
+	PINCTRL_PIN(139, "GPIO_139"),
+	PINCTRL_PIN(140, "GPIO_140"),
+	PINCTRL_PIN(141, "GPIO_141"),
+	PINCTRL_PIN(142, "GPIO_142"),
+	PINCTRL_PIN(143, "GPIO_143"),
+	PINCTRL_PIN(144, "GPIO_144"),
+	PINCTRL_PIN(145, "GPIO_145"),
+	PINCTRL_PIN(146, "GPIO_146"),
+	PINCTRL_PIN(147, "GPIO_147"),
+	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "GPIO_151"),
+	PINCTRL_PIN(152, "GPIO_152"),
+	PINCTRL_PIN(153, "GPIO_153"),
+	PINCTRL_PIN(154, "GPIO_154"),
+	PINCTRL_PIN(155, "GPIO_155"),
+	PINCTRL_PIN(156, "GPIO_156"),
+	PINCTRL_PIN(157, "GPIO_157"),
+	PINCTRL_PIN(158, "GPIO_158"),
+	PINCTRL_PIN(159, "GPIO_159"),
+	PINCTRL_PIN(160, "GPIO_160"),
+	PINCTRL_PIN(161, "GPIO_161"),
+	PINCTRL_PIN(162, "GPIO_162"),
+	PINCTRL_PIN(163, "GPIO_163"),
+	PINCTRL_PIN(164, "GPIO_164"),
+	PINCTRL_PIN(165, "GPIO_165"),
+	PINCTRL_PIN(166, "SDC1_RCLK"),
+	PINCTRL_PIN(167, "SDC1_CLK"),
+	PINCTRL_PIN(168, "SDC1_CMD"),
+	PINCTRL_PIN(169, "SDC1_DATA"),
+	PINCTRL_PIN(170, "SDC2_CLK"),
+	PINCTRL_PIN(171, "SDC2_CMD"),
+	PINCTRL_PIN(172, "SDC2_DATA"),
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
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+DECLARE_MSM_GPIO_PINS(108);
+DECLARE_MSM_GPIO_PINS(109);
+DECLARE_MSM_GPIO_PINS(110);
+DECLARE_MSM_GPIO_PINS(111);
+DECLARE_MSM_GPIO_PINS(112);
+DECLARE_MSM_GPIO_PINS(113);
+DECLARE_MSM_GPIO_PINS(114);
+DECLARE_MSM_GPIO_PINS(115);
+DECLARE_MSM_GPIO_PINS(116);
+DECLARE_MSM_GPIO_PINS(117);
+DECLARE_MSM_GPIO_PINS(118);
+DECLARE_MSM_GPIO_PINS(119);
+DECLARE_MSM_GPIO_PINS(120);
+DECLARE_MSM_GPIO_PINS(121);
+DECLARE_MSM_GPIO_PINS(122);
+DECLARE_MSM_GPIO_PINS(123);
+DECLARE_MSM_GPIO_PINS(124);
+DECLARE_MSM_GPIO_PINS(125);
+DECLARE_MSM_GPIO_PINS(126);
+DECLARE_MSM_GPIO_PINS(127);
+DECLARE_MSM_GPIO_PINS(128);
+DECLARE_MSM_GPIO_PINS(129);
+DECLARE_MSM_GPIO_PINS(130);
+DECLARE_MSM_GPIO_PINS(131);
+DECLARE_MSM_GPIO_PINS(132);
+DECLARE_MSM_GPIO_PINS(133);
+DECLARE_MSM_GPIO_PINS(134);
+DECLARE_MSM_GPIO_PINS(135);
+DECLARE_MSM_GPIO_PINS(136);
+DECLARE_MSM_GPIO_PINS(137);
+DECLARE_MSM_GPIO_PINS(138);
+DECLARE_MSM_GPIO_PINS(139);
+DECLARE_MSM_GPIO_PINS(140);
+DECLARE_MSM_GPIO_PINS(141);
+DECLARE_MSM_GPIO_PINS(142);
+DECLARE_MSM_GPIO_PINS(143);
+DECLARE_MSM_GPIO_PINS(144);
+DECLARE_MSM_GPIO_PINS(145);
+DECLARE_MSM_GPIO_PINS(146);
+DECLARE_MSM_GPIO_PINS(147);
+DECLARE_MSM_GPIO_PINS(148);
+DECLARE_MSM_GPIO_PINS(149);
+DECLARE_MSM_GPIO_PINS(150);
+DECLARE_MSM_GPIO_PINS(151);
+DECLARE_MSM_GPIO_PINS(152);
+DECLARE_MSM_GPIO_PINS(153);
+DECLARE_MSM_GPIO_PINS(154);
+DECLARE_MSM_GPIO_PINS(155);
+DECLARE_MSM_GPIO_PINS(156);
+DECLARE_MSM_GPIO_PINS(157);
+DECLARE_MSM_GPIO_PINS(158);
+DECLARE_MSM_GPIO_PINS(159);
+DECLARE_MSM_GPIO_PINS(160);
+DECLARE_MSM_GPIO_PINS(161);
+DECLARE_MSM_GPIO_PINS(162);
+DECLARE_MSM_GPIO_PINS(163);
+DECLARE_MSM_GPIO_PINS(164);
+DECLARE_MSM_GPIO_PINS(165);
+
+static const unsigned int sdc1_rclk_pins[] = { 166 };
+static const unsigned int sdc1_clk_pins[] = { 167 };
+static const unsigned int sdc1_cmd_pins[] = { 168 };
+static const unsigned int sdc1_data_pins[] = { 169 };
+static const unsigned int sdc2_clk_pins[] = { 170 };
+static const unsigned int sdc2_cmd_pins[] = { 171 };
+static const unsigned int sdc2_data_pins[] = { 172 };
+
+enum shikra_functions {
+	msm_mux_gpio,
+	msm_mux_agera_pll,
+	msm_mux_atest_bbrx,
+	msm_mux_atest_char,
+	msm_mux_atest_gpsadc,
+	msm_mux_atest_tsens,
+	msm_mux_atest_usb,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async,
+	msm_mux_cci_i2c0,
+	msm_mux_cci_i2c1,
+	msm_mux_cci_timer,
+	msm_mux_char_exec,
+	msm_mux_cri_trng,
+	msm_mux_dac_calib,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi,
+	msm_mux_dmic,
+	msm_mux_emac_dll,
+	msm_mux_emac_mcg,
+	msm_mux_emac_phy,
+	msm_mux_emac0_ptp_aux,
+	msm_mux_emac0_ptp_pps,
+	msm_mux_emac1_ptp_aux,
+	msm_mux_emac1_ptp_pps,
+	msm_mux_ext_mclk,
+	msm_mux_gcc_gp,
+	msm_mux_gsm0_tx,
+	msm_mux_i2s0,
+	msm_mux_i2s1,
+	msm_mux_i2s2,
+	msm_mux_i2s3,
+	msm_mux_jitter_bist,
+	msm_mux_m_voc,
+	msm_mux_mdp_vsync_e,
+	msm_mux_mdp_vsync_out0,
+	msm_mux_mdp_vsync_out1,
+	msm_mux_mdp_vsync_p,
+	msm_mux_mdp_vsync_s,
+	msm_mux_mpm_pwr,
+	msm_mux_mss_lte,
+	msm_mux_nav_gpio,
+	msm_mux_pa_indicator_or,
+	msm_mux_pbs_in,
+	msm_mux_pbs_out,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_phase_flag,
+	msm_mux_pll,
+	msm_mux_prng_rosc,
+	msm_mux_pwm,
+	msm_mux_qdss_cti,
+	msm_mux_qup0_se0,
+	msm_mux_qup0_se1,
+	msm_mux_qup0_se1_01,
+	msm_mux_qup0_se1_23,
+	msm_mux_qup0_se2,
+	msm_mux_qup0_se3_01,
+	msm_mux_qup0_se3_23,
+	msm_mux_qup0_se4_01,
+	msm_mux_qup0_se4_23,
+	msm_mux_qup0_se5,
+	msm_mux_qup0_se6,
+	msm_mux_qup0_se7_01,
+	msm_mux_qup0_se7_23,
+	msm_mux_qup0_se8,
+	msm_mux_qup0_se9,
+	msm_mux_qup0_se9_01,
+	msm_mux_qup0_se9_23,
+	msm_mux_rgmii,
+	msm_mux_sd_write_protect,
+	msm_mux_sdc_cdc,
+	msm_mux_sdc_tb_trig,
+	msm_mux_ssbi_wtr,
+	msm_mux_swr0_rx,
+	msm_mux_swr0_tx,
+	msm_mux_tgu_ch_trigout,
+	msm_mux_tsc_async,
+	msm_mux_tsense_pwm,
+	msm_mux_uim1,
+	msm_mux_uim2,
+	msm_mux_unused_adsp,
+	msm_mux_unused_gsm1,
+	msm_mux_usb0_phy_ps,
+	msm_mux_vfr,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux_wlan,
+	msm_mux__,
+};
+
+static const char *const gpio_groups[] = {
+	"gpio0",   "gpio1",   "gpio2",   "gpio3",   "gpio4",   "gpio5",
+	"gpio6",   "gpio7",   "gpio8",   "gpio9",   "gpio10",  "gpio11",
+	"gpio12",  "gpio13",  "gpio14",  "gpio15",  "gpio16",  "gpio17",
+	"gpio18",  "gpio19",  "gpio20",  "gpio21",  "gpio22",  "gpio23",
+	"gpio24",  "gpio25",  "gpio26",  "gpio27",  "gpio28",  "gpio29",
+	"gpio30",  "gpio31",  "gpio32",  "gpio33",  "gpio34",  "gpio35",
+	"gpio36",  "gpio37",  "gpio38",  "gpio39",  "gpio40",  "gpio41",
+	"gpio42",  "gpio43",  "gpio44",  "gpio45",  "gpio46",  "gpio47",
+	"gpio48",  "gpio49",  "gpio50",  "gpio51",  "gpio52",  "gpio53",
+	"gpio54",  "gpio55",  "gpio56",  "gpio57",  "gpio58",  "gpio59",
+	"gpio60",  "gpio61",  "gpio62",  "gpio63",  "gpio64",  "gpio65",
+	"gpio66",  "gpio67",  "gpio68",  "gpio69",  "gpio70",  "gpio71",
+	"gpio72",  "gpio73",  "gpio74",  "gpio75",  "gpio76",  "gpio77",
+	"gpio78",  "gpio79",  "gpio80",  "gpio81",  "gpio82",  "gpio83",
+	"gpio84",  "gpio85",  "gpio86",  "gpio87",  "gpio88",  "gpio89",
+	"gpio90",  "gpio91",  "gpio92",  "gpio93",  "gpio94",  "gpio95",
+	"gpio96",  "gpio97",  "gpio98",  "gpio99",  "gpio100", "gpio101",
+	"gpio102", "gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+	"gpio108", "gpio109", "gpio110", "gpio111", "gpio112", "gpio113",
+	"gpio114", "gpio115", "gpio116", "gpio117", "gpio118", "gpio119",
+	"gpio120", "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio130", "gpio131",
+	"gpio132", "gpio133", "gpio134", "gpio135", "gpio136", "gpio137",
+	"gpio138", "gpio139", "gpio140", "gpio141", "gpio142", "gpio143",
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
+	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
+	"gpio162", "gpio163", "gpio164", "gpio165",
+};
+
+static const char *const agera_pll_groups[] = {
+	"gpio22", "gpio23",
+};
+
+static const char *const atest_bbrx_groups[] = {
+	"gpio58", "gpio59",
+};
+
+static const char *const atest_char_groups[] = {
+	"gpio56", "gpio57", "gpio54", "gpio55", "gpio62",
+};
+
+static const char *const atest_gpsadc_groups[] = {
+	"gpio60", "gpio96",
+};
+
+static const char *const atest_tsens_groups[] = {
+	"gpio1", "gpio2",
+};
+
+static const char *const atest_usb_groups[] = {
+	"gpio53", "gpio58", "gpio59",  "gpio60", "gpio61", "gpio96",
+	"gpio98", "gpio99", "gpio100", "gpio101",
+};
+
+static const char *const cam_mclk_groups[] = {
+	"gpio34", "gpio35", "gpio96", "gpio98",
+};
+
+static const char *const cci_async_groups[] = {
+	"gpio39",
+};
+
+static const char *const cci_i2c0_groups[] = {
+	"gpio36", "gpio37",
+};
+
+static const char *const cci_i2c1_groups[] = {
+	"gpio41", "gpio42",
+};
+
+static const char *const cci_timer_groups[] = {
+	"gpio38", "gpio40", "gpio43", "gpio47",
+};
+
+static const char *const char_exec_groups[] = {
+	"gpio12", "gpio13",
+};
+
+static const char *const cri_trng_groups[] = {
+	"gpio6", "gpio7", "gpio20",
+};
+
+static const char *const dac_calib_groups[] = {
+	"gpio3",   "gpio4",   "gpio5",   "gpio6",   "gpio7",   "gpio8",
+	"gpio9",   "gpio14",  "gpio15",  "gpio16",  "gpio17",  "gpio18",
+	"gpio19",  "gpio63",  "gpio64",  "gpio66",  "gpio68",  "gpio69",
+	"gpio70",  "gpio88",  "gpio89",  "gpio90",  "gpio97",  "gpio116",
+	"gpio117", "gpio118",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio61",
+};
+
+static const char *const ddr_bist_groups[] = {
+	"gpio1", "gpio2", "gpio3", "gpio4",
+};
+
+static const char *const ddr_pxi_groups[] = {
+	"gpio98", "gpio99", "gpio100", "gpio101",
+};
+
+static const char *const dmic_groups[] = {
+	"gpio96", "gpio97", "gpio98", "gpio99",
+};
+
+static const char *const emac_dll_groups[] = {
+	"gpio58", "gpio59", "gpio60", "gpio61",
+};
+
+static const char *const emac_mcg_groups[] = {
+	"gpio28", "gpio29", "gpio40", "gpio43", "gpio44", "gpio45",
+	"gpio46", "gpio47",
+};
+
+static const char *const emac_phy_groups[] = {
+	"gpio120", "gpio136",
+};
+
+static const char *const emac0_ptp_aux_groups[] = {
+	"gpio60", "gpio63", "gpio69", "gpio85",
+};
+
+static const char *const emac0_ptp_pps_groups[] = {
+	"gpio60", "gpio63", "gpio69", "gpio85",
+};
+
+static const char *const emac1_ptp_aux_groups[] = {
+	"gpio31", "gpio33", "gpio60", "gpio68",
+};
+
+static const char *const emac1_ptp_pps_groups[] = {
+	"gpio31", "gpio33", "gpio60", "gpio68",
+};
+
+static const char *const ext_mclk_groups[] = {
+	"gpio103", "gpio104", "gpio110", "gpio114",
+};
+
+static const char *const gcc_gp_groups[] = {
+	"gpio45", "gpio53", "gpio61", "gpio88", "gpio89", "gpio110",
+};
+
+static const char *const gsm0_tx_groups[] = {
+	"gpio75",
+};
+
+static const char *const i2s0_groups[] = {
+	"gpio105", "gpio106", "gpio107", "gpio108", "gpio109", "gpio110",
+};
+
+static const char *const i2s1_groups[] = {
+	"gpio96", "gpio97", "gpio98", "gpio99",
+};
+
+static const char *const i2s2_groups[] = {
+	"gpio100", "gpio101", "gpio102", "gpio103",
+};
+
+static const char *const i2s3_groups[] = {
+	"gpio111", "gpio112", "gpio113", "gpio114",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio96", "gpio99",
+};
+
+static const char *const m_voc_groups[] = {
+	"gpio0",
+};
+
+static const char *const mdp_vsync_e_groups[] = {
+	"gpio94",
+};
+
+static const char *const mdp_vsync_out0_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync_out1_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync_p_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync_s_groups[] = {
+	"gpio95",
+};
+
+static const char *const mpm_pwr_groups[] = {
+	"gpio1",
+};
+
+static const char *const mss_lte_groups[] = {
+	"gpio115", "gpio116",
+};
+
+static const char *const nav_gpio_groups[] = {
+	"gpio53", "gpio58",  "gpio63",  "gpio71",  "gpio91",  "gpio92",
+	"gpio95", "gpio100", "gpio101", "gpio104",
+};
+
+static const char *const pa_indicator_or_groups[] = {
+	"gpio61",
+};
+
+static const char *const pbs_in_groups[] = {
+	"gpio48", "gpio49", "gpio50", "gpio51", "gpio53", "gpio54",
+	"gpio55", "gpio56", "gpio57", "gpio58", "gpio59", "gpio60",
+	"gpio61", "gpio62", "gpio63", "gpio74",
+};
+
+static const char *const pbs_out_groups[] = {
+	"gpio22", "gpio23", "gpio24",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio117",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio0",  "gpio1",  "gpio2",  "gpio3",  "gpio4",  "gpio5",
+	"gpio6",  "gpio7",  "gpio8",  "gpio9",  "gpio11", "gpio16",
+	"gpio17", "gpio28", "gpio29", "gpio30", "gpio31", "gpio48",
+	"gpio49", "gpio50", "gpio54", "gpio55", "gpio56", "gpio57",
+	"gpio62", "gpio63", "gpio64", "gpio69", "gpio70", "gpio71",
+	"gpio72", "gpio74", "gpio102",
+};
+
+static const char *const pll_groups[] = {
+	"gpio14", "gpio22", "gpio43", "gpio44", "gpio74", "gpio76",
+};
+
+static const char *const prng_rosc_groups[] = {
+	"gpio27", "gpio28",
+};
+
+static const char *const pwm_groups[] = {
+	"gpio32", "gpio40", "gpio45", "gpio53", "gpio54", "gpio55",
+	"gpio56", "gpio57", "gpio58", "gpio61", "gpio62", "gpio68",
+	"gpio77", "gpio79", "gpio80", "gpio87", "gpio102"
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio28", "gpio29", "gpio30", "gpio31", "gpio94", "gpio95",
+};
+
+static const char *const qup0_se0_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qup0_se1_groups[] = {
+	"gpio28", "gpio29",
+};
+
+static const char *const qup0_se1_01_groups[] = {
+	"gpio4", "gpio5",
+};
+
+static const char *const qup0_se1_23_groups[] = {
+	"gpio4", "gpio5",
+};
+
+static const char *const qup0_se2_groups[] = {
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio30", "gpio31",
+};
+
+static const char *const qup0_se3_01_groups[] = {
+	"gpio10", "gpio11",
+};
+
+static const char *const qup0_se3_23_groups[] = {
+	"gpio10", "gpio11",
+};
+
+static const char *const qup0_se4_01_groups[] = {
+	"gpio12", "gpio13",
+};
+
+static const char *const qup0_se4_23_groups[] = {
+	"gpio12", "gpio13",
+};
+
+static const char *const qup0_se5_groups[] = {
+	"gpio14", "gpio15", "gpio16", "gpio17",
+};
+
+static const char *const qup0_se6_groups[] = {
+	"gpio18", "gpio19", "gpio28", "gpio29", "gpio30", "gpio31",
+};
+
+static const char *const qup0_se7_01_groups[] = {
+	"gpio20", "gpio21",
+};
+
+static const char *const qup0_se7_23_groups[] = {
+	"gpio20", "gpio21",
+};
+
+static const char *const qup0_se8_groups[] = {
+	"gpio22", "gpio23", "gpio24", "gpio25",
+};
+
+static const char *const qup0_se9_groups[] = {
+	"gpio48", "gpio49", "gpio50", "gpio51",
+};
+
+static const char *const qup0_se9_01_groups[] = {
+	"gpio26", "gpio27",
+};
+
+static const char *const qup0_se9_23_groups[] = {
+	"gpio26", "gpio27",
+};
+
+static const char *const rgmii_groups[] = {
+	"gpio121", "gpio122", "gpio123", "gpio124", "gpio125", "gpio126",
+	"gpio127", "gpio128", "gpio129", "gpio130", "gpio131", "gpio132",
+	"gpio133", "gpio134", "gpio137", "gpio138", "gpio139", "gpio140",
+	"gpio141", "gpio142", "gpio143", "gpio144", "gpio145", "gpio146",
+	"gpio147", "gpio148", "gpio149", "gpio150",
+};
+
+static const char *const sd_write_protect_groups[] = {
+	"gpio109",
+};
+
+static const char *const sdc_cdc_groups[] = {
+	"gpio98", "gpio99", "gpio100", "gpio101",
+};
+
+static const char *const sdc_tb_trig_groups[] = {
+	"gpio32", "gpio33",
+};
+
+static const char *const ssbi_wtr_groups[] = {
+	"gpio68", "gpio69", "gpio70", "gpio71",
+};
+
+static const char *const swr0_rx_groups[] = {
+	"gpio107", "gpio108", "gpio109",
+};
+
+static const char *const swr0_tx_groups[] = {
+	"gpio105", "gpio106",
+};
+
+static const char *const tgu_ch_trigout_groups[] = {
+	"gpio14", "gpio15", "gpio16", "gpio17",
+};
+
+static const char *const tsc_async_groups[] = {
+	"gpio45", "gpio46",
+};
+
+static const char *const tsense_pwm_groups[] = {
+	"gpio21",
+};
+
+static const char *const uim1_groups[] = {
+	"gpio81", "gpio82", "gpio83", "gpio84",
+};
+
+static const char *const uim2_groups[] = {
+	"gpio77", "gpio78", "gpio79", "gpio80",
+};
+
+static const char *const unused_adsp_groups[] = {
+	"gpio35",
+};
+
+static const char *const unused_gsm1_groups[] = {
+	"gpio64",
+};
+
+static const char *const usb0_phy_ps_groups[] = {
+	"gpio90",
+};
+
+static const char *const vfr_groups[] = {
+	"gpio59",
+};
+
+static const char *const vsense_trigger_mirnat_groups[] = {
+	"gpio58",
+};
+
+static const char *const wlan_groups[] = {
+	"gpio14", "gpio15",
+};
+
+static const struct pinfunction shikra_functions[] = {
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(agera_pll),
+	MSM_PIN_FUNCTION(atest_bbrx),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_gpsadc),
+	MSM_PIN_FUNCTION(atest_tsens),
+	MSM_PIN_FUNCTION(atest_usb),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(cci_async),
+	MSM_PIN_FUNCTION(cci_i2c0),
+	MSM_PIN_FUNCTION(cci_i2c1),
+	MSM_PIN_FUNCTION(cci_timer),
+	MSM_PIN_FUNCTION(char_exec),
+	MSM_PIN_FUNCTION(cri_trng),
+	MSM_PIN_FUNCTION(dac_calib),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(ddr_bist),
+	MSM_PIN_FUNCTION(ddr_pxi),
+	MSM_PIN_FUNCTION(dmic),
+	MSM_PIN_FUNCTION(emac_dll),
+	MSM_PIN_FUNCTION(emac_mcg),
+	MSM_PIN_FUNCTION(emac_phy),
+	MSM_PIN_FUNCTION(emac0_ptp_aux),
+	MSM_PIN_FUNCTION(emac0_ptp_pps),
+	MSM_PIN_FUNCTION(emac1_ptp_aux),
+	MSM_PIN_FUNCTION(emac1_ptp_pps),
+	MSM_PIN_FUNCTION(ext_mclk),
+	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gsm0_tx),
+	MSM_PIN_FUNCTION(i2s0),
+	MSM_PIN_FUNCTION(i2s1),
+	MSM_PIN_FUNCTION(i2s2),
+	MSM_PIN_FUNCTION(i2s3),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(m_voc),
+	MSM_PIN_FUNCTION(mdp_vsync_e),
+	MSM_PIN_FUNCTION(mdp_vsync_out0),
+	MSM_PIN_FUNCTION(mdp_vsync_out1),
+	MSM_PIN_FUNCTION(mdp_vsync_p),
+	MSM_PIN_FUNCTION(mdp_vsync_s),
+	MSM_PIN_FUNCTION(mpm_pwr),
+	MSM_PIN_FUNCTION(mss_lte),
+	MSM_PIN_FUNCTION(nav_gpio),
+	MSM_PIN_FUNCTION(pa_indicator_or),
+	MSM_PIN_FUNCTION(pbs_in),
+	MSM_PIN_FUNCTION(pbs_out),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll),
+	MSM_PIN_FUNCTION(prng_rosc),
+	MSM_PIN_FUNCTION(pwm),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qup0_se0),
+	MSM_PIN_FUNCTION(qup0_se1),
+	MSM_PIN_FUNCTION(qup0_se1_01),
+	MSM_PIN_FUNCTION(qup0_se1_23),
+	MSM_PIN_FUNCTION(qup0_se2),
+	MSM_PIN_FUNCTION(qup0_se3_01),
+	MSM_PIN_FUNCTION(qup0_se3_23),
+	MSM_PIN_FUNCTION(qup0_se4_01),
+	MSM_PIN_FUNCTION(qup0_se4_23),
+	MSM_PIN_FUNCTION(qup0_se5),
+	MSM_PIN_FUNCTION(qup0_se6),
+	MSM_PIN_FUNCTION(qup0_se7_01),
+	MSM_PIN_FUNCTION(qup0_se7_23),
+	MSM_PIN_FUNCTION(qup0_se8),
+	MSM_PIN_FUNCTION(qup0_se9),
+	MSM_PIN_FUNCTION(qup0_se9_01),
+	MSM_PIN_FUNCTION(qup0_se9_23),
+	MSM_PIN_FUNCTION(rgmii),
+	MSM_PIN_FUNCTION(sd_write_protect),
+	MSM_PIN_FUNCTION(sdc_cdc),
+	MSM_PIN_FUNCTION(sdc_tb_trig),
+	MSM_PIN_FUNCTION(ssbi_wtr),
+	MSM_PIN_FUNCTION(swr0_rx),
+	MSM_PIN_FUNCTION(swr0_tx),
+	MSM_PIN_FUNCTION(tgu_ch_trigout),
+	MSM_PIN_FUNCTION(tsc_async),
+	MSM_PIN_FUNCTION(tsense_pwm),
+	MSM_PIN_FUNCTION(uim1),
+	MSM_PIN_FUNCTION(uim2),
+	MSM_PIN_FUNCTION(unused_adsp),
+	MSM_PIN_FUNCTION(unused_gsm1),
+	MSM_PIN_FUNCTION(usb0_phy_ps),
+	MSM_PIN_FUNCTION(vfr),
+	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
+	MSM_PIN_FUNCTION(wlan),
+};
+
+static const struct msm_pingroup shikra_groups[] = {
+	[0] = PINGROUP(0, qup0_se0, m_voc, _, phase_flag, _, _, _, _, _, _, _),
+	[1] = PINGROUP(1, qup0_se0, mpm_pwr, ddr_bist, _, phase_flag, atest_tsens, _, _, _, _, _),
+	[2] = PINGROUP(2, qup0_se0, ddr_bist, _, phase_flag, atest_tsens, _, _, _, _, _, _),
+	[3] = PINGROUP(3, qup0_se0, ddr_bist, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[4] = PINGROUP(4, qup0_se1_23, qup0_se1_01, ddr_bist, _, phase_flag, dac_calib, _, _, _,
+		       _, _),
+	[5] = PINGROUP(5, qup0_se1_23, qup0_se1_01, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[6] = PINGROUP(6, qup0_se2, cri_trng, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[7] = PINGROUP(7, qup0_se2, cri_trng, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[8] = PINGROUP(8, qup0_se2, _, phase_flag, dac_calib, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, qup0_se2, _, phase_flag, dac_calib, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, qup0_se3_01, qup0_se3_23, _, _, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup0_se3_01, qup0_se3_23, _, phase_flag, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup0_se4_01, qup0_se4_23, char_exec, _, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup0_se4_01, qup0_se4_23, char_exec, _, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup0_se5, pll, tgu_ch_trigout, dac_calib, wlan, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup0_se5, tgu_ch_trigout, _, dac_calib, wlan, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup0_se5, tgu_ch_trigout, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[17] = PINGROUP(17, qup0_se5, tgu_ch_trigout, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[18] = PINGROUP(18, qup0_se6, dac_calib, _, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, qup0_se6, dac_calib, _, _, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup0_se7_01, qup0_se7_23, cri_trng, _, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, qup0_se7_01, qup0_se7_23, tsense_pwm, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, qup0_se8, pll, agera_pll, pbs_out, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, qup0_se8, agera_pll, pbs_out, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, qup0_se8, pbs_out, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, qup0_se8, _, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, qup0_se9_23, qup0_se9_01, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, qup0_se9_23, qup0_se9_01, prng_rosc, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qup0_se1, qup0_se6, emac_mcg, prng_rosc, _, phase_flag, qdss_cti,
+			_, _, _, _),
+	[29] = PINGROUP(29, qup0_se1, qup0_se6, emac_mcg, _, phase_flag, qdss_cti, _, _, _, _, _),
+	[30] = PINGROUP(30, qup0_se2, qup0_se6, _, phase_flag, qdss_cti, _, _, _, _, _, _),
+	[31] = PINGROUP(31, qup0_se2, qup0_se6, emac1_ptp_aux, emac1_ptp_pps, _, phase_flag,
+			qdss_cti, _, _, _, _),
+	[32] = PINGROUP(32, pwm, sdc_tb_trig, _, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, emac1_ptp_aux, emac1_ptp_pps, sdc_tb_trig, _, _, _, _, _, _, _, _),
+	[34] = PINGROUP(34, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, cam_mclk, unused_adsp, _, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, cci_i2c0, _, _, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, cci_i2c0, _, _, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, cci_timer, _, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, cci_async, _, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, cci_timer, emac_mcg, pwm, _, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, cci_timer, emac_mcg, pll, _, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, emac_mcg, pll, _, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, tsc_async, emac_mcg, pwm, gcc_gp, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, tsc_async, emac_mcg, _, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, cci_timer, emac_mcg, _, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, _, qup0_se9, _, _, pbs_in, phase_flag, _, _, _, _, _),
+	[49] = PINGROUP(49, _, qup0_se9, _, _, pbs_in, phase_flag, _, _, _, _, _),
+	[50] = PINGROUP(50, _, qup0_se9, _, _, pbs_in, phase_flag, _, _, _, _, _),
+	[51] = PINGROUP(51, _, qup0_se9, pbs_in, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, _, _, _, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, _, nav_gpio, gcc_gp, pwm, _, pbs_in, atest_usb, _, _, _, _),
+	[54] = PINGROUP(54, _, pwm, _, pbs_in, phase_flag, atest_char, _, _, _, _, _),
+	[55] = PINGROUP(55, _, pwm, _, pbs_in, phase_flag, atest_char, _, _, _, _, _),
+	[56] = PINGROUP(56, _, pwm, _, pbs_in, phase_flag, atest_char, _, _, _, _, _),
+	[57] = PINGROUP(57, _, pwm, _, pbs_in, phase_flag, atest_char, _, _, _, _, _),
+	[58] = PINGROUP(58, _, nav_gpio, pwm, _, pbs_in, atest_bbrx, atest_usb,
+			vsense_trigger_mirnat, emac_dll, _, _),
+	[59] = PINGROUP(59, _, vfr, _, pbs_in, atest_bbrx, atest_usb, emac_dll, _, _, _, _),
+	[60] = PINGROUP(60, _, emac1_ptp_aux, emac1_ptp_pps, emac0_ptp_aux, emac0_ptp_pps, _,
+			pbs_in, atest_gpsadc, atest_usb, emac_dll, _),
+	[61] = PINGROUP(61, _, pwm, gcc_gp, pa_indicator_or, dbg_out_clk, pbs_in, atest_usb,
+			emac_dll, _, _, _),
+	[62] = PINGROUP(62, _, pwm, _, pbs_in, phase_flag, atest_char, _, _, _, _, _),
+	[63] = PINGROUP(63, _, nav_gpio, emac0_ptp_aux, emac0_ptp_pps, _, pbs_in, phase_flag,
+			dac_calib, _, _, _),
+	[64] = PINGROUP(64, _, unused_gsm1, dac_calib, _, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, _, _, _, _, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, _, dac_calib, _, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, _, _, _, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, _, ssbi_wtr, emac1_ptp_aux, emac1_ptp_pps, pwm, dac_calib, _, _, _,
+			_, _),
+	[69] = PINGROUP(69, _, ssbi_wtr, emac0_ptp_aux, emac0_ptp_pps, _, phase_flag, dac_calib,
+			_, _, _, _),
+	[70] = PINGROUP(70, _, ssbi_wtr, _, phase_flag, dac_calib, _, _, _, _, _, _),
+	[71] = PINGROUP(71, _, ssbi_wtr, nav_gpio, _, phase_flag, _, _, _, _, _, _),
+	[72] = PINGROUP(72, _, _, phase_flag, _, _, _, _, _, _, _, _),
+	[73] = PINGROUP(73, _, _, _, _, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, pll, _, pbs_in, phase_flag, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, gsm0_tx, _, _, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, pll, _, _, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, uim2, pwm, _, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, uim2, _, _, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, uim2, pwm, _, _, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, uim2, pwm, _, _, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, uim1, _, _, _, _, _, _, _, _, _, _),
+	[82] = PINGROUP(82, uim1, _, _, _, _, _, _, _, _, _, _),
+	[83] = PINGROUP(83, uim1, _, _, _, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, uim1, _, _, _, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, emac0_ptp_aux, emac0_ptp_pps, _, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, mdp_vsync_p, mdp_vsync_out0, mdp_vsync_out1, _, _, _, _, _, _, _, _),
+	[87] = PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, usb0_phy_ps, _, dac_calib, _, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, nav_gpio, _, _, _, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, nav_gpio, _, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, _, _, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, mdp_vsync_e, qdss_cti, qdss_cti, _, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, nav_gpio, mdp_vsync_s, qdss_cti, qdss_cti, _, _, _, _, _, _, _),
+	[96] = PINGROUP(96, dmic, cam_mclk, i2s1, jitter_bist, atest_gpsadc, atest_usb, _, _, _,
+			_, _),
+	[97] = PINGROUP(97, dmic, i2s1, dac_calib, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, dmic, cam_mclk, i2s1, _, sdc_cdc, atest_usb, ddr_pxi, _, _, _, _),
+	[99] = PINGROUP(99, dmic, i2s1, jitter_bist, sdc_cdc, atest_usb, ddr_pxi, _, _, _, _, _),
+	[100] = PINGROUP(100, i2s2, nav_gpio, _, sdc_cdc, atest_usb, ddr_pxi,  _, _, _, _, _),
+	[101] = PINGROUP(101, i2s2, nav_gpio, _, sdc_cdc, atest_usb, ddr_pxi, _, _, _, _, _),
+	[102] = PINGROUP(102, i2s2, pwm, _, phase_flag, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, ext_mclk, i2s2, _, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, ext_mclk, nav_gpio, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, swr0_tx, i2s0, _, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, swr0_tx, i2s0, _, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, swr0_rx, i2s0, _, _, _, _, _, _, _, _, _),
+	[108] = PINGROUP(108, swr0_rx, i2s0, _, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, swr0_rx, i2s0, sd_write_protect, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, ext_mclk, i2s0, _, gcc_gp, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, i2s3, _, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, i2s3, _, _, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, i2s3, _, _, _, _, _, _, _, _, _, _),
+	[114] = PINGROUP(114, ext_mclk, i2s3, _, _, _, _, _, _, _, _, _),
+	[115] = PINGROUP(115, mss_lte, _, _, _, _, _, _, _, _, _, _),
+	[116] = PINGROUP(116, mss_lte, _, dac_calib, _, _, _, _, _, _, _, _),
+	[117] = PINGROUP(117, pcie0_clk_req_n, _, dac_calib, _, _, _, _, _, _, _, _),
+	[118] = PINGROUP(118, _, dac_calib, _, _, _, _, _, _, _, _, _),
+	[119] = PINGROUP(119, _, _, _, _, _, _, _, _, _, _, _),
+	[120] = PINGROUP(120, emac_phy, _, _, _, _, _, _, _, _, _, _),
+	[121] = PINGROUP(121, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[122] = PINGROUP(122, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[123] = PINGROUP(123, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[127] = PINGROUP(127, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[129] = PINGROUP(129, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[130] = PINGROUP(130, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[131] = PINGROUP(131, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[132] = PINGROUP(132, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[133] = PINGROUP(133, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[134] = PINGROUP(134, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[135] = PINGROUP(135, _, _, _, _, _, _, _, _, _, _, _),
+	[136] = PINGROUP(136, emac_phy, _, _, _, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[139] = PINGROUP(139, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[145] = PINGROUP(145, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[147] = PINGROUP(147, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, rgmii, _, _, _, _, _, _, _, _, _, _),
+	[151] = PINGROUP(151, _, _, _, _, _, _, _, _, _, _, _),
+	[152] = PINGROUP(152, _, _, _, _, _, _, _, _, _, _, _),
+	[153] = PINGROUP(153, _, _, _, _, _, _, _, _, _, _, _),
+	[154] = PINGROUP(154, _, _, _, _, _, _, _, _, _, _, _),
+	[155] = PINGROUP(155, _, _, _, _, _, _, _, _, _, _, _),
+	[156] = PINGROUP(156, _, _, _, _, _, _, _, _, _, _, _),
+	[157] = PINGROUP(157, _, _, _, _, _, _, _, _, _, _, _),
+	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, _, _, _),
+	[159] = PINGROUP(159, _, _, _, _, _, _, _, _, _, _, _),
+	[160] = PINGROUP(160, _, _, _, _, _, _, _, _, _, _, _),
+	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, _, _, _),
+	[162] = PINGROUP(162, _, _, _, _, _, _, _, _, _, _, _),
+	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, _, _, _),
+	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, _, _, _),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _, _, _),
+	[166] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xac004, 0, 0),
+	[167] = SDC_QDSD_PINGROUP(sdc1_clk, 0xac000, 13, 6),
+	[168] = SDC_QDSD_PINGROUP(sdc1_cmd, 0xac000, 11, 3),
+	[169] = SDC_QDSD_PINGROUP(sdc1_data, 0xac000, 9, 0),
+	[170] = SDC_QDSD_PINGROUP(sdc2_clk, 0xaa000, 14, 6),
+	[171] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xaa000, 11, 3),
+	[172] = SDC_QDSD_PINGROUP(sdc2_data, 0xaa000, 9, 0),
+};
+
+static const struct msm_gpio_wakeirq_map shikra_mpm_map[] = {
+	{1, 9 },    {2, 31 },   {5, 49 },   {6, 53 },   {9, 72 },   {10, 10 },
+	{12, 22 },  {14, 26 },  {17, 29 },  {18, 24 },  {20, 32 },  {22, 33 },
+	{25, 34 },  {27, 35 },  {28, 36 },  {29, 37 },  {30, 38 },  {31, 39 },
+	{32, 40 },  {33, 41 },  {38, 42 },  {40, 43 },  {43, 44 },  {44, 45 },
+	{45, 46 },  {46, 47 },  {47, 48 },  {48, 60 },  {50, 50 },  {51, 51 },
+	{52, 61 },  {53, 62 },  {57, 52 },  {58, 63 },  {60, 54 },  {63, 64 },
+	{73, 55 },  {74, 56 },  {75, 57 },  {77, 3 },   {80, 4 },   {84, 5 },
+	{85, 67 },  {86, 69 },  {88, 70 },  {89, 71 },  {90, 73 },  {91, 74 },
+	{92, 75 },  {93, 76 },  {94, 77 },  {95, 78 },  {97, 79 },  {99, 80 },
+	{100, 11 }, {101, 13 }, {102, 14 }, {103, 15 }, {106, 16 }, {108, 17 },
+	{112, 18 }, {116, 19 }, {117, 20 }, {119, 21 }, {120, 23 }, {136, 25 },
+	{159, 27 }, {161, 28 },
+};
+
+static const struct msm_pinctrl_soc_data shikra_tlmm = {
+	.pins = shikra_pins,
+	.npins = ARRAY_SIZE(shikra_pins),
+	.functions = shikra_functions,
+	.nfunctions = ARRAY_SIZE(shikra_functions),
+	.groups = shikra_groups,
+	.ngroups = ARRAY_SIZE(shikra_groups),
+	.ngpios = 166,
+	.wakeirq_map = shikra_mpm_map,
+	.nwakeirq_map = ARRAY_SIZE(shikra_mpm_map),
+	.egpio_func = 11,
+};
+
+static int shikra_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &shikra_tlmm);
+}
+
+static const struct of_device_id shikra_tlmm_of_match[] = {
+	{ .compatible = "qcom,shikra-tlmm", .data = &shikra_tlmm },
+	{},
+};
+
+static struct platform_driver shikra_tlmm_driver = {
+	.driver = {
+		.name = "shikra-tlmm",
+		.of_match_table = shikra_tlmm_of_match,
+	},
+	.probe = shikra_tlmm_probe,
+};
+
+static int __init shikra_tlmm_init(void)
+{
+	return platform_driver_register(&shikra_tlmm_driver);
+}
+arch_initcall(shikra_tlmm_init);
+
+static void __exit shikra_tlmm_exit(void)
+{
+	platform_driver_unregister(&shikra_tlmm_driver);
+}
+module_exit(shikra_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI Shikra TLMM driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match);

-- 
2.34.1


