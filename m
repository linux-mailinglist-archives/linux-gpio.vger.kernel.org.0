Return-Path: <linux-gpio+bounces-34889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OwqG1Jj1mnIEwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:16:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B655B3BD850
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 16:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD813014425
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 14:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315EB3CEB85;
	Wed,  8 Apr 2026 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpWc8q1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOd2eJ6g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281D3D16EA
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657777; cv=none; b=IeV9K5jIwOFRNdGdlTCJDSdlHA4PyZkhSDdcsyrADRnYNYM+6VQR13aYtYJ6Qz/CqLp6EWCE4K4Zm3RfnqTQ+xn9SKBqI5SAsVsoy8AWsH4BZYbFjXF54IXjVWMZ93Rl4x4aO6zZciojrY6pmGylulPdVU4zpjpg2Wu5JifmomQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657777; c=relaxed/simple;
	bh=Wyys+4Tp3cPx2cErOuRUWESj8hcsIA1NZRjVJx4gHxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXfy2PvNkcoPlmsjwhlXRC5S3WfWs3iFljwMdlQc6yGQ/zhWC69AKaZF+DcqtMY97AFFSPzJ8gDYc1/+XmFzSzWY0Bqp2i4orxsrsz7QN6rDnw2ZjD+G2rr5mg7DLjtmeymZ+YMyJYMQwso9AqRluhSztdPVNyc6v0yFhoomc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpWc8q1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOd2eJ6g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389n69g2411828
	for <linux-gpio@vger.kernel.org>; Wed, 8 Apr 2026 14:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9fBsRGrlDiz35elN77TSiyOpEzoROPxY2ir19RVsX8=; b=NpWc8q1kllf9Ur9N
	HskwAiQHQS3b2NrcnLPyxHZuYMtmPuh9CdxIwyiLV1qSrmSHlMCjvssk51lfOgqc
	Dj52Lg2j54lR5Of5jSKSj9KjlJIJtzHh8uFOhZnUFSig4Gy1da8oMVy8xrUI7/+D
	HL+lTRgp1YVR3m7dQFZu2itryE31kWCqSY1jNPrWM5RjnhD06gcjCdBnToqgs5k2
	dFfx0YpVbAZqutL8+7ML/jSTiLNWgFuG0cyIiXPcUDmv8sCiZOiybdrjaFEft+Lm
	5KbDdgIdG58Xl9Bd31VaJkhf8XKwy+ivlSNH+q5gWXZCGh3RPUTRz9gB9SQAVWW1
	gAdePQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vc4e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 14:16:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso15143023a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775657771; x=1776262571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9fBsRGrlDiz35elN77TSiyOpEzoROPxY2ir19RVsX8=;
        b=dOd2eJ6g3KJKNpwbI5GECDgaWh+kjAFUI/rFRwGFpxy0mGYnVvWnTS4s7m4CRCQGBw
         SA2P2jqHe+f2enqKPnXZybXq7GNfWJfxqAVQOaRtg8PFbtUc31csTHaNKVC38MnE8fUC
         2kDNp+PqmjhToFWw9bmb3Ngar/hp2Ap+iLjZlrmKYmOg2fu416tnngtA9Cry+dgLE7M6
         f86D+JIE3EhzT4ot3l8MSZQA369+GUSUUBfguZw0WEZTT2ROA7dEjwZ+ROLD3W/iUrLk
         v6+a6SAC4KJvSxdaJ/ItNh0caF6SfIUQIXT7Dfc9q+FFddMJvtCmAc+hesXcdTXBY/NP
         KWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657771; x=1776262571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9fBsRGrlDiz35elN77TSiyOpEzoROPxY2ir19RVsX8=;
        b=oWEtJp4nj16+3wkb0Y9iB36KnNwdx+EIvuXsuIgpZ+P9DwBcA9BngTwZnQFSMw5boZ
         ZHCCR8TugWHoqmpgLAVYo4GWw36TiKlzRY05JvzEHX3DpXXgd5L9oAX3hOmSRZbIHKu/
         PIiWFNZ0i1Zo4BV0qPkpXnKsQjyjLUYKBfK/ryLPM8hHdzHFUSYLGTMp3w6GNHzVD/+1
         hIZieutz0D1duwTGl5lrJsutRvhsV/3hkXD5QDENVrEzoOHql7JJMwNgD6qH6H9RaovT
         5Kb7cAo/4OvxxBWztYhE+jIIhIiqD/ElQiGz/+3r48NNQEcfMlI1WJx4On6vQ5PSWybD
         CV2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0TU4PdEGD83XKh/JdQS9hsjFJrgt5YWgS1dMim+VYRl9yZGmLvJsQBOjwgJgdRhvytQ5yuqUCa1kU@vger.kernel.org
X-Gm-Message-State: AOJu0YwoApB+eTqRxgNoQriH9x7FnneJVGhDcTop2gaNqukCKv8GSgCU
	oFLoXo5/FeKmn+n3CgcxrIHOF7GjQeCQ6YNOEX6Sth4mX7/pFlC3jN58l2GlZt5k3YTjBJccS4f
	7CIqblITbIeYg3ZSCZCAeKNrJiDqcU+2rdWstCLkQg1P2S3ntqE5VR0lXSKivJrYP
X-Gm-Gg: AeBDieusFTDReCabe1gNcvfUadeYXpQq6dh57RckJUmZW6Xoym0emGJA3GTZxdExGJe
	LzV8gLjV3Rviojmux5+RkJ9t3eZlj7aEeXrcy3Pnv9ePDRDmL/gbPrElRYhTXkNVMIqKxFyoUvE
	5d2ySIvXBkZKlbmKpBy4p4DgwL2L71yyp/4bhY/EeVT+I3TVDDqCZ+yXJ9d62XAbM5znKREONZA
	/92WZ89Aw0LPWKs3x8Y5TCqdX4yGoMuS4WWT3iFv7IVOmT3sCDrbScLz8aPNIWz9+5dyHKt0OVO
	nLo7SrXU6q9muJtjUSb2qvVUhdtEpWzRKHOBdB1L0uBluXm0ZJMtZQ2txxpcu8kbcwZIisakJKc
	61zthVLHLpRfo1BxJE+UI9nKUi+6MPSR+lt4R78/05aiH6hyW
X-Received: by 2002:a17:90b:5586:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35de691ad63mr22141673a91.17.1775657770018;
        Wed, 08 Apr 2026 07:16:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5586:b0:35d:9d4f:f595 with SMTP id 98e67ed59e1d1-35de691ad63mr22141580a91.17.1775657768979;
        Wed, 08 Apr 2026 07:16:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm26261851a91.8.2026.04.08.07.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:16:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 19:45:48 +0530
Subject: [PATCH v2 2/2] pinctrl: qcom: Add Hawi pinctrl driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-hawi-pinctrl-v2-2-fd7f681f5e05@oss.qualcomm.com>
References: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
In-Reply-To: <20260408-hawi-pinctrl-v2-0-fd7f681f5e05@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775657757; l=58794;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Wyys+4Tp3cPx2cErOuRUWESj8hcsIA1NZRjVJx4gHxI=;
 b=G656UCK6q4LmvUPEKCHaVgTOZVEcZJOwJ/Olg/YAgIhMr88LYdnVZnYsr1STMCIE05pxTo8GK
 vO37x7vX76CAbpAOYStA9euyyUWag4SJ0571vX+nplMpENbqUvq6TE4
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMiBTYWx0ZWRfX5IGYPHJcK7LR
 Z6i8zdx5eUAzZYGF01VoJgaVafvUilmvu9v7s83Q6RsUm70uB/knzDvjGkN8YIUt5NLM8uoHJws
 L4fnVVedNPk8T1AEODLcT3T4lIRoTPg0TPmvYDQcNxaRF4IKAZfAAaboqeZgG2xtzI6qLcnyJeB
 FtVQd1lNdmawlZdYibhHp/xFFrAfuPeNvuiWKKWU6BTI09EyaQP9pZQmyWn8f57XqVn6Am7g0Bp
 l7BMlLlnoCgClRt76IFDxte8TlyVleYBgXP8VP+WrHIGI7NJQr+LJKpFv/7kNBvAqUl6p5fJtpS
 IG85m+kykGMY17Ux/eeNrUI2KrTWh91/ZTsD1kdbFDe0AXo/Nl5RGJGkZruUnXQBZoipbzoDkc8
 zC9t49yEfkwPIhSd+8MhOE4meKTHtuuEFO06JxGJwjoPrPxJFJd9bVVfOpdTHxdaFd0vsyuMMSi
 34RnwerUuAmGk/bbuzQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d6632c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ExstbVCCFKdY7kyAwbkA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: JTu8kd-9q_bbEU2kzCyCB3eWcIzXD3XU
X-Proofpoint-GUID: JTu8kd-9q_bbEU2kzCyCB3eWcIzXD3XU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34889-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B655B3BD850
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add pinctrl driver for TLMM block found in the Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Kconfig.msm    |   10 +
 drivers/pinctrl/qcom/Makefile       |    1 +
 drivers/pinctrl/qcom/pinctrl-hawi.c | 1610 +++++++++++++++++++++++++++++++++++
 3 files changed, 1621 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 17416dce8e70..836cdeca1006 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -35,6 +35,16 @@ config PINCTRL_GLYMUR
 	  Say Y here to compile statically, or M here to compile it as a module.
 	  If unsure, say N.
 
+config PINCTRL_HAWI
+	tristate "Qualcomm Technologies Inc Hawi pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
+	  block found on the Qualcomm Technologies Inc Hawi platform.
+	  Say Y here to compile statically, or M here to compile it as a module.
+	  If unsure, say N.
+
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 4c585bad813c..84bda3ada874 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
 obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
 obj-$(CONFIG_PINCTRL_GLYMUR)	+= pinctrl-glymur.o
+obj-$(CONFIG_PINCTRL_HAWI)	+= pinctrl-hawi.o
 obj-$(CONFIG_PINCTRL_IPQ4019)	+= pinctrl-ipq4019.o
 obj-$(CONFIG_PINCTRL_IPQ5018)	+= pinctrl-ipq5018.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
new file mode 100644
index 000000000000..5c7894f3b9cb
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -0,0 +1,1610 @@
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
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11) \
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
+		.mux_bit = 2,				\
+		.pull_bit = 0,				\
+		.drv_bit = 6,				\
+		.egpio_enable = 12,			\
+		.egpio_present = 11,			\
+		.oe_bit = 9,				\
+		.in_bit = 0,				\
+		.out_bit = 1,				\
+		.intr_enable_bit = 0,			\
+		.intr_status_bit = 0,			\
+		.intr_wakeup_present_bit = 6,	\
+		.intr_wakeup_enable_bit = 7,	\
+		.intr_target_bit = 8,			\
+		.intr_target_kpss_val = 3,		\
+		.intr_raw_status_bit = 4,		\
+		.intr_polarity_bit = 1,			\
+		.intr_detection_bit = 2,		\
+		.intr_detection_width = 2,		\
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
+		.intr_target_reg = 0,			\
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
+#define UFS_RESET(pg_name, ctl, io)			\
+	{						\
+		.grp = PINCTRL_PINGROUP(#pg_name,	\
+			pg_name##_pins,			\
+			ARRAY_SIZE(pg_name##_pins)),	\
+		.ctl_reg = ctl,				\
+		.io_reg = io,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+static const struct pinctrl_pin_desc hawi_pins[] = {
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
+	PINCTRL_PIN(166, "GPIO_166"),
+	PINCTRL_PIN(167, "GPIO_167"),
+	PINCTRL_PIN(168, "GPIO_168"),
+	PINCTRL_PIN(169, "GPIO_169"),
+	PINCTRL_PIN(170, "GPIO_170"),
+	PINCTRL_PIN(171, "GPIO_171"),
+	PINCTRL_PIN(172, "GPIO_172"),
+	PINCTRL_PIN(173, "GPIO_173"),
+	PINCTRL_PIN(174, "GPIO_174"),
+	PINCTRL_PIN(175, "GPIO_175"),
+	PINCTRL_PIN(176, "GPIO_176"),
+	PINCTRL_PIN(177, "GPIO_177"),
+	PINCTRL_PIN(178, "GPIO_178"),
+	PINCTRL_PIN(179, "GPIO_179"),
+	PINCTRL_PIN(180, "GPIO_180"),
+	PINCTRL_PIN(181, "GPIO_181"),
+	PINCTRL_PIN(182, "GPIO_182"),
+	PINCTRL_PIN(183, "GPIO_183"),
+	PINCTRL_PIN(184, "GPIO_184"),
+	PINCTRL_PIN(185, "GPIO_185"),
+	PINCTRL_PIN(186, "GPIO_186"),
+	PINCTRL_PIN(187, "GPIO_187"),
+	PINCTRL_PIN(188, "GPIO_188"),
+	PINCTRL_PIN(189, "GPIO_189"),
+	PINCTRL_PIN(190, "GPIO_190"),
+	PINCTRL_PIN(191, "GPIO_191"),
+	PINCTRL_PIN(192, "GPIO_192"),
+	PINCTRL_PIN(193, "GPIO_193"),
+	PINCTRL_PIN(194, "GPIO_194"),
+	PINCTRL_PIN(195, "GPIO_195"),
+	PINCTRL_PIN(196, "GPIO_196"),
+	PINCTRL_PIN(197, "GPIO_197"),
+	PINCTRL_PIN(198, "GPIO_198"),
+	PINCTRL_PIN(199, "GPIO_199"),
+	PINCTRL_PIN(200, "GPIO_200"),
+	PINCTRL_PIN(201, "GPIO_201"),
+	PINCTRL_PIN(202, "GPIO_202"),
+	PINCTRL_PIN(203, "GPIO_203"),
+	PINCTRL_PIN(204, "GPIO_204"),
+	PINCTRL_PIN(205, "GPIO_205"),
+	PINCTRL_PIN(206, "GPIO_206"),
+	PINCTRL_PIN(207, "GPIO_207"),
+	PINCTRL_PIN(208, "GPIO_208"),
+	PINCTRL_PIN(209, "GPIO_209"),
+	PINCTRL_PIN(210, "GPIO_210"),
+	PINCTRL_PIN(211, "GPIO_211"),
+	PINCTRL_PIN(212, "GPIO_212"),
+	PINCTRL_PIN(213, "GPIO_213"),
+	PINCTRL_PIN(214, "GPIO_214"),
+	PINCTRL_PIN(215, "GPIO_215"),
+	PINCTRL_PIN(216, "GPIO_216"),
+	PINCTRL_PIN(217, "GPIO_217"),
+	PINCTRL_PIN(218, "GPIO_218"),
+	PINCTRL_PIN(219, "GPIO_219"),
+	PINCTRL_PIN(220, "GPIO_220"),
+	PINCTRL_PIN(221, "GPIO_221"),
+	PINCTRL_PIN(222, "GPIO_222"),
+	PINCTRL_PIN(223, "GPIO_223"),
+	PINCTRL_PIN(224, "GPIO_224"),
+	PINCTRL_PIN(225, "GPIO_225"),
+	PINCTRL_PIN(226, "UFS_RESET"),
+	PINCTRL_PIN(227, "SDC2_CLK"),
+	PINCTRL_PIN(228, "SDC2_CMD"),
+	PINCTRL_PIN(229, "SDC2_DATA"),
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
+DECLARE_MSM_GPIO_PINS(166);
+DECLARE_MSM_GPIO_PINS(167);
+DECLARE_MSM_GPIO_PINS(168);
+DECLARE_MSM_GPIO_PINS(169);
+DECLARE_MSM_GPIO_PINS(170);
+DECLARE_MSM_GPIO_PINS(171);
+DECLARE_MSM_GPIO_PINS(172);
+DECLARE_MSM_GPIO_PINS(173);
+DECLARE_MSM_GPIO_PINS(174);
+DECLARE_MSM_GPIO_PINS(175);
+DECLARE_MSM_GPIO_PINS(176);
+DECLARE_MSM_GPIO_PINS(177);
+DECLARE_MSM_GPIO_PINS(178);
+DECLARE_MSM_GPIO_PINS(179);
+DECLARE_MSM_GPIO_PINS(180);
+DECLARE_MSM_GPIO_PINS(181);
+DECLARE_MSM_GPIO_PINS(182);
+DECLARE_MSM_GPIO_PINS(183);
+DECLARE_MSM_GPIO_PINS(184);
+DECLARE_MSM_GPIO_PINS(185);
+DECLARE_MSM_GPIO_PINS(186);
+DECLARE_MSM_GPIO_PINS(187);
+DECLARE_MSM_GPIO_PINS(188);
+DECLARE_MSM_GPIO_PINS(189);
+DECLARE_MSM_GPIO_PINS(190);
+DECLARE_MSM_GPIO_PINS(191);
+DECLARE_MSM_GPIO_PINS(192);
+DECLARE_MSM_GPIO_PINS(193);
+DECLARE_MSM_GPIO_PINS(194);
+DECLARE_MSM_GPIO_PINS(195);
+DECLARE_MSM_GPIO_PINS(196);
+DECLARE_MSM_GPIO_PINS(197);
+DECLARE_MSM_GPIO_PINS(198);
+DECLARE_MSM_GPIO_PINS(199);
+DECLARE_MSM_GPIO_PINS(200);
+DECLARE_MSM_GPIO_PINS(201);
+DECLARE_MSM_GPIO_PINS(202);
+DECLARE_MSM_GPIO_PINS(203);
+DECLARE_MSM_GPIO_PINS(204);
+DECLARE_MSM_GPIO_PINS(205);
+DECLARE_MSM_GPIO_PINS(206);
+DECLARE_MSM_GPIO_PINS(207);
+DECLARE_MSM_GPIO_PINS(208);
+DECLARE_MSM_GPIO_PINS(209);
+DECLARE_MSM_GPIO_PINS(210);
+DECLARE_MSM_GPIO_PINS(211);
+DECLARE_MSM_GPIO_PINS(212);
+DECLARE_MSM_GPIO_PINS(213);
+DECLARE_MSM_GPIO_PINS(214);
+DECLARE_MSM_GPIO_PINS(215);
+DECLARE_MSM_GPIO_PINS(216);
+DECLARE_MSM_GPIO_PINS(217);
+DECLARE_MSM_GPIO_PINS(218);
+DECLARE_MSM_GPIO_PINS(219);
+DECLARE_MSM_GPIO_PINS(220);
+DECLARE_MSM_GPIO_PINS(221);
+DECLARE_MSM_GPIO_PINS(222);
+DECLARE_MSM_GPIO_PINS(223);
+DECLARE_MSM_GPIO_PINS(224);
+DECLARE_MSM_GPIO_PINS(225);
+
+static const unsigned int ufs_reset_pins[] = { 226 };
+static const unsigned int sdc2_clk_pins[] = { 227 };
+static const unsigned int sdc2_cmd_pins[] = { 228 };
+static const unsigned int sdc2_data_pins[] = { 229 };
+
+enum hawi_functions {
+	msm_mux_gpio,
+	msm_mux_aoss_cti,
+	msm_mux_atest_char,
+	msm_mux_atest_usb,
+	msm_mux_audio_ext_mclk,
+	msm_mux_audio_ref_clk,
+	msm_mux_cam_mclk,
+	msm_mux_cci_async_in,
+	msm_mux_cci_i2c0,
+	msm_mux_cci_i2c1,
+	msm_mux_cci_i2c2,
+	msm_mux_cci_i2c3,
+	msm_mux_cci_i2c4,
+	msm_mux_cci_i2c5,
+	msm_mux_cci_timer,
+	msm_mux_coex_espmi,
+	msm_mux_coex_uart1_rx,
+	msm_mux_coex_uart1_tx,
+	msm_mux_dbg_out_clk,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi,
+	msm_mux_dp_hot,
+	msm_mux_egpio,
+	msm_mux_gcc_gp,
+	msm_mux_gnss_adc,
+	msm_mux_host_rst,
+	msm_mux_i2chub0_se0,
+	msm_mux_i2chub0_se1,
+	msm_mux_i2chub0_se2,
+	msm_mux_i2chub0_se3,
+	msm_mux_i2chub0_se4,
+	msm_mux_i2s0,
+	msm_mux_i2s1,
+	msm_mux_ibi_i3c,
+	msm_mux_jitter_bist,
+	msm_mux_mdp_esync0,
+	msm_mux_mdp_esync1,
+	msm_mux_mdp_esync2,
+	msm_mux_mdp_vsync,
+	msm_mux_mdp_vsync_e,
+	msm_mux_mdp_vsync_p,
+	msm_mux_mdp_vsync0_out,
+	msm_mux_mdp_vsync1_out,
+	msm_mux_mdp_vsync2_out,
+	msm_mux_mdp_vsync3_out,
+	msm_mux_mdp_vsync5_out,
+	msm_mux_modem_pps_in,
+	msm_mux_modem_pps_out,
+	msm_mux_nav_gpio,
+	msm_mux_nav_gpio0,
+	msm_mux_nav_gpio3,
+	msm_mux_nav_rffe,
+	msm_mux_pcie0_clk_req_n,
+	msm_mux_pcie0_rst_n,
+	msm_mux_pcie1_clk_req_n,
+	msm_mux_phase_flag,
+	msm_mux_pll_bist_sync,
+	msm_mux_pll_clk_aux,
+	msm_mux_qdss_cti,
+	msm_mux_qlink,
+	msm_mux_qspi,
+	msm_mux_qspi_clk,
+	msm_mux_qspi_cs,
+	msm_mux_qup1_se0,
+	msm_mux_qup1_se1,
+	msm_mux_qup1_se2,
+	msm_mux_qup1_se3,
+	msm_mux_qup1_se4,
+	msm_mux_qup1_se5,
+	msm_mux_qup1_se6,
+	msm_mux_qup1_se7,
+	msm_mux_qup2_se0,
+	msm_mux_qup2_se1,
+	msm_mux_qup2_se2,
+	msm_mux_qup2_se3,
+	msm_mux_qup2_se4_01,
+	msm_mux_qup2_se4_23,
+	msm_mux_qup3_se0_01,
+	msm_mux_qup3_se0_23,
+	msm_mux_qup3_se1,
+	msm_mux_qup3_se2,
+	msm_mux_qup3_se3,
+	msm_mux_qup3_se4,
+	msm_mux_qup3_se5,
+	msm_mux_qup4_se0,
+	msm_mux_qup4_se1,
+	msm_mux_qup4_se2,
+	msm_mux_qup4_se3_01,
+	msm_mux_qup4_se3_23,
+	msm_mux_qup4_se3_l3,
+	msm_mux_qup4_se4_01,
+	msm_mux_qup4_se4_23,
+	msm_mux_qup4_se4_l3,
+	msm_mux_rng_rosc,
+	msm_mux_sd_write_protect,
+	msm_mux_sdc4_clk,
+	msm_mux_sdc4_cmd,
+	msm_mux_sdc4_data,
+	msm_mux_sys_throttle,
+	msm_mux_tb_trig_sdc,
+	msm_mux_tmess_rng,
+	msm_mux_tsense_clm,
+	msm_mux_tsense_pwm,
+	msm_mux_uim0,
+	msm_mux_uim1,
+	msm_mux_usb0_hs,
+	msm_mux_usb_phy,
+	msm_mux_vfr,
+	msm_mux_vsense_trigger_mirnat,
+	msm_mux_wcn_sw_ctrl,
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
+	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
+	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
+	"gpio174", "gpio175", "gpio176", "gpio177", "gpio178", "gpio179",
+	"gpio180", "gpio181", "gpio182", "gpio183", "gpio184", "gpio185",
+	"gpio186", "gpio187", "gpio188", "gpio189", "gpio190", "gpio191",
+	"gpio192", "gpio193", "gpio194", "gpio195", "gpio196", "gpio197",
+	"gpio198", "gpio199", "gpio200", "gpio201", "gpio202", "gpio203",
+	"gpio204", "gpio205", "gpio206", "gpio207", "gpio208", "gpio209",
+	"gpio210", "gpio211", "gpio212", "gpio213", "gpio214", "gpio215",
+	"gpio216", "gpio217", "gpio218", "gpio219", "gpio220", "gpio221",
+	"gpio222", "gpio223", "gpio224", "gpio225",
+};
+
+static const char *const aoss_cti_groups[] = {
+	"gpio74", "gpio75", "gpio76", "gpio77",
+};
+
+static const char *const atest_char_groups[] = {
+	"gpio126", "gpio127", "gpio128", "gpio129", "gpio133",
+};
+
+static const char *const atest_usb_groups[] = {
+	"gpio70", "gpio71", "gpio72", "gpio73", "gpio129",
+};
+
+static const char *const audio_ext_mclk_groups[] = {
+	"gpio120", "gpio121",
+};
+
+static const char *const audio_ref_clk_groups[] = {
+	"gpio120",
+};
+
+static const char *const cam_mclk_groups[] = {
+	"gpio89", "gpio90", "gpio91", "gpio92", "gpio93", "gpio94",
+	"gpio95", "gpio96",
+};
+
+static const char *const cci_async_in_groups[] = {
+	"gpio15", "gpio109", "gpio110",
+};
+
+static const char *const cci_i2c0_groups[] = {
+	"gpio109", "gpio110",
+};
+
+static const char *const cci_i2c1_groups[] = {
+	"gpio111", "gpio112",
+};
+
+static const char *const cci_i2c2_groups[] = {
+	"gpio113", "gpio114",
+};
+
+static const char *const cci_i2c3_groups[] = {
+	"gpio107", "gpio160",
+};
+
+static const char *const cci_i2c4_groups[] = {
+	"gpio108", "gpio149",
+};
+
+static const char *const cci_i2c5_groups[] = {
+	"gpio115", "gpio116",
+};
+
+static const char *const cci_timer_groups[] = {
+	"gpio105", "gpio106", "gpio107", "gpio159", "gpio160",
+};
+
+static const char *const coex_espmi_groups[] = {
+	"gpio144", "gpio145",
+};
+
+static const char *const coex_uart1_rx_groups[] = {
+	"gpio144",
+};
+
+static const char *const coex_uart1_tx_groups[] = {
+	"gpio145",
+};
+
+static const char *const dbg_out_clk_groups[] = {
+	"gpio82",
+};
+
+static const char *const ddr_bist_groups[] = {
+	"gpio40", "gpio41", "gpio44", "gpio45",
+};
+
+static const char *const ddr_pxi_groups[] = {
+	"gpio43", "gpio44", "gpio45", "gpio46",
+	"gpio52", "gpio53", "gpio54", "gpio55",
+};
+
+static const char *const dp_hot_groups[] = {
+	"gpio47",
+};
+
+static const char *const egpio_groups[] = {
+	"gpio0",   "gpio1",   "gpio2",   "gpio3",   "gpio4",   "gpio5",
+	"gpio6",   "gpio7",   "gpio28",  "gpio29",  "gpio30",  "gpio31",
+	"gpio48",  "gpio49",  "gpio50",  "gpio51",  "gpio163", "gpio164",
+	"gpio165", "gpio166", "gpio167", "gpio168", "gpio169", "gpio170",
+	"gpio171", "gpio172", "gpio173", "gpio174", "gpio175", "gpio176",
+	"gpio177", "gpio178", "gpio179", "gpio180", "gpio181", "gpio182",
+	"gpio183", "gpio184", "gpio185", "gpio186", "gpio187", "gpio188",
+	"gpio189", "gpio190", "gpio191", "gpio192", "gpio193", "gpio194",
+	"gpio195", "gpio196", "gpio197", "gpio198", "gpio199", "gpio200",
+	"gpio201", "gpio202", "gpio203", "gpio204", "gpio205", "gpio206",
+	"gpio207", "gpio208", "gpio209", "gpio212", "gpio213", "gpio214",
+	"gpio215", "gpio216", "gpio217", "gpio218",
+};
+
+static const char *const gcc_gp_groups[] = {
+	"gpio86", "gpio87", "gpio130", "gpio131", "gpio132", "gpio158",
+};
+
+static const char *const gnss_adc_groups[] = {
+	"gpio40", "gpio41", "gpio42", "gpio77",
+};
+
+static const char *const host_rst_groups[] = {
+	"gpio106",
+};
+
+static const char *const i2chub0_se0_groups[] = {
+	"gpio66", "gpio67",
+};
+
+static const char *const i2chub0_se1_groups[] = {
+	"gpio78", "gpio79",
+};
+
+static const char *const i2chub0_se2_groups[] = {
+	"gpio68", "gpio69",
+};
+
+static const char *const i2chub0_se3_groups[] = {
+	"gpio70", "gpio71",
+};
+
+static const char *const i2chub0_se4_groups[] = {
+	"gpio72", "gpio73",
+};
+
+static const char *const i2s0_groups[] = {
+	"gpio122", "gpio123", "gpio124", "gpio125",
+};
+
+static const char *const i2s1_groups[] = {
+	"gpio117", "gpio118", "gpio119", "gpio120",
+};
+
+static const char *const ibi_i3c_groups[] = {
+	"gpio0",  "gpio1",  "gpio4",  "gpio5",  "gpio8",  "gpio9",
+	"gpio12", "gpio13", "gpio28", "gpio29", "gpio32", "gpio33",
+	"gpio36", "gpio37", "gpio48", "gpio49", "gpio60", "gpio61",
+};
+
+static const char *const jitter_bist_groups[] = {
+	"gpio73",
+};
+
+static const char *const mdp_esync0_groups[] = {
+	"gpio88", "gpio100",
+};
+
+static const char *const mdp_esync1_groups[] = {
+	"gpio86", "gpio100",
+};
+
+static const char *const mdp_esync2_groups[] = {
+	"gpio87", "gpio97",
+};
+
+static const char *const mdp_vsync_groups[] = {
+	"gpio86", "gpio87", "gpio88", "gpio97",
+};
+
+static const char *const mdp_vsync_e_groups[] = {
+	"gpio98",
+};
+
+static const char *const mdp_vsync_p_groups[] = {
+	"gpio98",
+};
+
+static const char *const mdp_vsync0_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync1_out_groups[] = {
+	"gpio86",
+};
+
+static const char *const mdp_vsync2_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync3_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const mdp_vsync5_out_groups[] = {
+	"gpio87",
+};
+
+static const char *const modem_pps_in_groups[] = {
+	"gpio151",
+};
+
+static const char *const modem_pps_out_groups[] = {
+	"gpio151",
+};
+
+static const char *const nav_gpio_groups[] = {
+	"gpio146", "gpio147", "gpio148", "gpio151",
+};
+
+static const char *const nav_gpio0_groups[] = {
+	"gpio150",
+};
+
+static const char *const nav_gpio3_groups[] = {
+	"gpio150",
+};
+
+static const char *const nav_rffe_groups[] = {
+	"gpio134", "gpio135", "gpio138", "gpio139",
+};
+
+static const char *const pcie0_clk_req_n_groups[] = {
+	"gpio103",
+};
+
+static const char *const pcie0_rst_n_groups[] = {
+	"gpio102",
+};
+
+static const char *const pcie1_clk_req_n_groups[] = {
+	"gpio221",
+};
+
+static const char *const phase_flag_groups[] = {
+	"gpio117", "gpio118", "gpio119", "gpio123", "gpio124", "gpio125",
+	"gpio169", "gpio170", "gpio171", "gpio172", "gpio173", "gpio175",
+	"gpio176", "gpio179", "gpio180", "gpio181", "gpio184", "gpio185",
+	"gpio192", "gpio196", "gpio197", "gpio198", "gpio199", "gpio204",
+	"gpio206", "gpio207", "gpio208", "gpio210", "gpio211", "gpio214",
+	"gpio215", "gpio216",
+};
+
+static const char *const pll_bist_sync_groups[] = {
+	"gpio104",
+};
+
+static const char *const pll_clk_aux_groups[] = {
+	"gpio94",
+};
+
+static const char *const qdss_cti_groups[] = {
+	"gpio27",  "gpio31", "gpio72", "gpio73", "gpio82", "gpio83",
+	"gpio152", "gpio158",
+};
+
+static const char *const qlink_groups[] = {
+	"gpio152", "gpio153", "gpio154",
+};
+
+static const char *const qspi_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio147",
+};
+
+static const char *const qspi_clk_groups[] = {
+	"gpio83",
+};
+
+static const char *const qspi_cs_groups[] = {
+	"gpio146", "gpio148",
+};
+
+static const char *const qup1_se0_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio83",
+};
+
+static const char *const qup1_se1_groups[] = {
+	"gpio74", "gpio75", "gpio76", "gpio77",
+};
+
+static const char *const qup1_se2_groups[] = {
+	"gpio40", "gpio41", "gpio42", "gpio43", "gpio130", "gpio131", "gpio132",
+};
+
+static const char *const qup1_se3_groups[] = {
+	"gpio44", "gpio45", "gpio46", "gpio47",
+};
+
+static const char *const qup1_se4_groups[] = {
+	"gpio36", "gpio37", "gpio38", "gpio39",
+};
+
+static const char *const qup1_se5_groups[] = {
+	"gpio52", "gpio53", "gpio54", "gpio55",
+};
+
+static const char *const qup1_se6_groups[] = {
+	"gpio56", "gpio57", "gpio58", "gpio59",
+};
+
+static const char *const qup1_se7_groups[] = {
+	"gpio60", "gpio61", "gpio62", "gpio63",
+};
+
+static const char *const qup2_se0_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3",
+};
+
+static const char *const qup2_se1_groups[] = {
+	"gpio4", "gpio5", "gpio6", "gpio7",
+};
+
+static const char *const qup2_se2_groups[] = {
+	"gpio117", "gpio118", "gpio119", "gpio120",
+};
+
+static const char *const qup2_se3_groups[] = {
+	"gpio97", "gpio122", "gpio123", "gpio124", "gpio125",
+};
+
+static const char *const qup2_se4_01_groups[] = {
+	"gpio208", "gpio209",
+};
+
+static const char *const qup2_se4_23_groups[] = {
+	"gpio208", "gpio209",
+};
+
+static const char *const qup3_se0_01_groups[] = {
+	"gpio64", "gpio65",
+};
+
+static const char *const qup3_se0_23_groups[] = {
+	"gpio64", "gpio65",
+};
+
+static const char *const qup3_se1_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio15",
+};
+
+static const char *const qup3_se2_groups[] = {
+	"gpio12", "gpio13", "gpio14", "gpio15",
+};
+
+static const char *const qup3_se3_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19",
+};
+
+static const char *const qup3_se4_groups[] = {
+	"gpio20", "gpio21", "gpio22", "gpio23",
+};
+
+static const char *const qup3_se5_groups[] = {
+	"gpio24", "gpio25", "gpio26", "gpio27",
+};
+
+static const char *const qup4_se0_groups[] = {
+	"gpio48", "gpio49", "gpio50", "gpio51",
+};
+
+static const char *const qup4_se1_groups[] = {
+	"gpio28", "gpio29", "gpio30", "gpio31",
+};
+
+static const char *const qup4_se2_groups[] = {
+	"gpio32", "gpio33", "gpio34", "gpio35",
+};
+
+static const char *const qup4_se3_01_groups[] = {
+	"gpio84", "gpio121",
+};
+
+static const char *const qup4_se3_23_groups[] = {
+	"gpio84", "gpio121",
+};
+
+static const char *const qup4_se3_l3_groups[] = {
+	"gpio98",
+};
+
+static const char *const qup4_se4_01_groups[] = {
+	"gpio161", "gpio162",
+};
+
+static const char *const qup4_se4_23_groups[] = {
+	"gpio161", "gpio162",
+};
+
+static const char *const qup4_se4_l3_groups[] = {
+	"gpio88",
+};
+
+static const char *const rng_rosc_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio84",
+};
+
+static const char *const sd_write_protect_groups[] = {
+	"gpio85",
+};
+
+static const char *const sdc4_clk_groups[] = {
+	"gpio83",
+};
+
+static const char *const sdc4_cmd_groups[] = {
+	"gpio148",
+};
+
+static const char *const sdc4_data_groups[] = {
+	"gpio80", "gpio81", "gpio82", "gpio147",
+};
+
+static const char *const sys_throttle_groups[] = {
+	"gpio99",
+};
+
+static const char *const tb_trig_sdc_groups[] = {
+	"gpio88", "gpio146",
+};
+
+static const char *const tmess_rng_groups[] = {
+	"gpio64", "gpio65", "gpio66", "gpio84",
+};
+
+static const char *const tsense_clm_groups[] = {
+	"gpio10", "gpio87", "gpio97", "gpio99", "gpio105", "gpio106",
+	"gpio159",
+};
+
+static const char *const tsense_pwm_groups[] = {
+	"gpio10", "gpio87", "gpio97", "gpio99", "gpio223", "gpio224",
+	"gpio225",
+};
+
+static const char *const uim0_groups[] = {
+	"gpio126", "gpio127", "gpio128", "gpio129",
+};
+
+static const char *const uim1_groups[] = {
+	"gpio36", "gpio37", "gpio39", "gpio54", "gpio55", "gpio56",
+	"gpio70", "gpio71", "gpio72", "gpio130", "gpio131", "gpio132",
+	"gpio133",
+};
+
+static const char *const usb0_hs_groups[] = {
+	"gpio79",
+};
+
+static const char *const usb_phy_groups[] = {
+	"gpio59", "gpio60",
+};
+
+static const char *const vfr_groups[] = {
+	"gpio146", "gpio151",
+};
+
+static const char *const vsense_trigger_mirnat_groups[] = {
+	"gpio59",
+};
+
+static const char *const wcn_sw_ctrl_groups[] = {
+	"gpio18", "gpio19", "gpio155", "gpio156",
+};
+
+static const struct pinfunction hawi_functions[] = {
+	MSM_GPIO_PIN_FUNCTION(gpio),
+	MSM_PIN_FUNCTION(aoss_cti),
+	MSM_PIN_FUNCTION(atest_char),
+	MSM_PIN_FUNCTION(atest_usb),
+	MSM_PIN_FUNCTION(audio_ext_mclk),
+	MSM_PIN_FUNCTION(audio_ref_clk),
+	MSM_PIN_FUNCTION(cam_mclk),
+	MSM_PIN_FUNCTION(cci_async_in),
+	MSM_PIN_FUNCTION(cci_i2c0),
+	MSM_PIN_FUNCTION(cci_i2c1),
+	MSM_PIN_FUNCTION(cci_i2c2),
+	MSM_PIN_FUNCTION(cci_i2c3),
+	MSM_PIN_FUNCTION(cci_i2c4),
+	MSM_PIN_FUNCTION(cci_i2c5),
+	MSM_PIN_FUNCTION(cci_timer),
+	MSM_PIN_FUNCTION(coex_espmi),
+	MSM_PIN_FUNCTION(coex_uart1_rx),
+	MSM_PIN_FUNCTION(coex_uart1_tx),
+	MSM_PIN_FUNCTION(dbg_out_clk),
+	MSM_PIN_FUNCTION(ddr_bist),
+	MSM_PIN_FUNCTION(ddr_pxi),
+	MSM_PIN_FUNCTION(dp_hot),
+	MSM_PIN_FUNCTION(egpio),
+	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gnss_adc),
+	MSM_PIN_FUNCTION(host_rst),
+	MSM_PIN_FUNCTION(i2chub0_se0),
+	MSM_PIN_FUNCTION(i2chub0_se1),
+	MSM_PIN_FUNCTION(i2chub0_se2),
+	MSM_PIN_FUNCTION(i2chub0_se3),
+	MSM_PIN_FUNCTION(i2chub0_se4),
+	MSM_PIN_FUNCTION(i2s0),
+	MSM_PIN_FUNCTION(i2s1),
+	MSM_PIN_FUNCTION(ibi_i3c),
+	MSM_PIN_FUNCTION(jitter_bist),
+	MSM_PIN_FUNCTION(mdp_esync0),
+	MSM_PIN_FUNCTION(mdp_esync1),
+	MSM_PIN_FUNCTION(mdp_esync2),
+	MSM_PIN_FUNCTION(mdp_vsync),
+	MSM_PIN_FUNCTION(mdp_vsync_e),
+	MSM_PIN_FUNCTION(mdp_vsync_p),
+	MSM_PIN_FUNCTION(mdp_vsync0_out),
+	MSM_PIN_FUNCTION(mdp_vsync1_out),
+	MSM_PIN_FUNCTION(mdp_vsync2_out),
+	MSM_PIN_FUNCTION(mdp_vsync3_out),
+	MSM_PIN_FUNCTION(mdp_vsync5_out),
+	MSM_PIN_FUNCTION(modem_pps_in),
+	MSM_PIN_FUNCTION(modem_pps_out),
+	MSM_PIN_FUNCTION(nav_gpio),
+	MSM_PIN_FUNCTION(nav_gpio0),
+	MSM_PIN_FUNCTION(nav_gpio3),
+	MSM_PIN_FUNCTION(nav_rffe),
+	MSM_PIN_FUNCTION(pcie0_clk_req_n),
+	MSM_PIN_FUNCTION(pcie0_rst_n),
+	MSM_PIN_FUNCTION(pcie1_clk_req_n),
+	MSM_PIN_FUNCTION(phase_flag),
+	MSM_PIN_FUNCTION(pll_bist_sync),
+	MSM_PIN_FUNCTION(pll_clk_aux),
+	MSM_PIN_FUNCTION(qdss_cti),
+	MSM_PIN_FUNCTION(qlink),
+	MSM_PIN_FUNCTION(qspi),
+	MSM_PIN_FUNCTION(qspi_clk),
+	MSM_PIN_FUNCTION(qspi_cs),
+	MSM_PIN_FUNCTION(qup1_se0),
+	MSM_PIN_FUNCTION(qup1_se1),
+	MSM_PIN_FUNCTION(qup1_se2),
+	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se4),
+	MSM_PIN_FUNCTION(qup1_se5),
+	MSM_PIN_FUNCTION(qup1_se6),
+	MSM_PIN_FUNCTION(qup1_se7),
+	MSM_PIN_FUNCTION(qup2_se0),
+	MSM_PIN_FUNCTION(qup2_se1),
+	MSM_PIN_FUNCTION(qup2_se2),
+	MSM_PIN_FUNCTION(qup2_se3),
+	MSM_PIN_FUNCTION(qup2_se4_01),
+	MSM_PIN_FUNCTION(qup2_se4_23),
+	MSM_PIN_FUNCTION(qup3_se0_01),
+	MSM_PIN_FUNCTION(qup3_se0_23),
+	MSM_PIN_FUNCTION(qup3_se1),
+	MSM_PIN_FUNCTION(qup3_se2),
+	MSM_PIN_FUNCTION(qup3_se3),
+	MSM_PIN_FUNCTION(qup3_se4),
+	MSM_PIN_FUNCTION(qup3_se5),
+	MSM_PIN_FUNCTION(qup4_se0),
+	MSM_PIN_FUNCTION(qup4_se1),
+	MSM_PIN_FUNCTION(qup4_se2),
+	MSM_PIN_FUNCTION(qup4_se3_01),
+	MSM_PIN_FUNCTION(qup4_se3_23),
+	MSM_PIN_FUNCTION(qup4_se3_l3),
+	MSM_PIN_FUNCTION(qup4_se4_01),
+	MSM_PIN_FUNCTION(qup4_se4_23),
+	MSM_PIN_FUNCTION(qup4_se4_l3),
+	MSM_PIN_FUNCTION(rng_rosc),
+	MSM_PIN_FUNCTION(sd_write_protect),
+	MSM_PIN_FUNCTION(sdc4_clk),
+	MSM_PIN_FUNCTION(sdc4_cmd),
+	MSM_PIN_FUNCTION(sdc4_data),
+	MSM_PIN_FUNCTION(sys_throttle),
+	MSM_PIN_FUNCTION(tb_trig_sdc),
+	MSM_PIN_FUNCTION(tmess_rng),
+	MSM_PIN_FUNCTION(tsense_clm),
+	MSM_PIN_FUNCTION(tsense_pwm),
+	MSM_PIN_FUNCTION(uim0),
+	MSM_PIN_FUNCTION(uim1),
+	MSM_PIN_FUNCTION(usb0_hs),
+	MSM_PIN_FUNCTION(usb_phy),
+	MSM_PIN_FUNCTION(vfr),
+	MSM_PIN_FUNCTION(vsense_trigger_mirnat),
+	MSM_PIN_FUNCTION(wcn_sw_ctrl),
+};
+
+/*
+ * Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup hawi_groups[] = {
+	[0] = PINGROUP(0, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[1] = PINGROUP(1, qup2_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[2] = PINGROUP(2, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[3] = PINGROUP(3, qup2_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[4] = PINGROUP(4, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[5] = PINGROUP(5, qup2_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[6] = PINGROUP(6, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[7] = PINGROUP(7, qup2_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[8] = PINGROUP(8, qup3_se1, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[9] = PINGROUP(9, qup3_se1, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[10] = PINGROUP(10, qup3_se1, _, tsense_clm, tsense_pwm, _, _, _, _, _, _, _),
+	[11] = PINGROUP(11, qup3_se1, _, _, _, _, _, _, _, _, _, _),
+	[12] = PINGROUP(12, qup3_se2, ibi_i3c, qup3_se1, _, _, _, _, _, _, _, _),
+	[13] = PINGROUP(13, qup3_se2, ibi_i3c, qup3_se1, _, _, _, _, _, _, _, _),
+	[14] = PINGROUP(14, qup3_se2, _, _, _, _, _, _, _, _, _, _),
+	[15] = PINGROUP(15, qup3_se2, cci_async_in, qup3_se1, _, _, _, _, _, _, _, _),
+	[16] = PINGROUP(16, qup3_se3, _, _, _, _, _, _, _, _, _, _),
+	[17] = PINGROUP(17, qup3_se3, _, _, _, _, _, _, _, _, _, _),
+	[18] = PINGROUP(18, wcn_sw_ctrl, qup3_se3, _, _, _, _, _, _, _, _, _),
+	[19] = PINGROUP(19, wcn_sw_ctrl, qup3_se3, _, _, _, _, _, _, _, _, _),
+	[20] = PINGROUP(20, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[21] = PINGROUP(21, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[22] = PINGROUP(22, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[23] = PINGROUP(23, qup3_se4, _, _, _, _, _, _, _, _, _, _),
+	[24] = PINGROUP(24, qup3_se5, _, _, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, qup3_se5, _, _, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, qup3_se5, _, _, _, _, _, _, _, _, _, _),
+	[27] = PINGROUP(27, qup3_se5, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qup4_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[29] = PINGROUP(29, qup4_se1, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[30] = PINGROUP(30, qup4_se1, _, _, _, _, _, _, _, _, _, egpio),
+	[31] = PINGROUP(31, qup4_se1, qdss_cti, _, _, _, _, _, _, _, _, egpio),
+	[32] = PINGROUP(32, qup4_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, qup4_se2, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[34] = PINGROUP(34, qup4_se2, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup4_se2, _, _, _, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, qup1_se4, uim1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[37] = PINGROUP(37, qup1_se4, uim1, ibi_i3c, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, qup1_se4, _, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, qup1_se4, uim1, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, qup1_se2, ddr_bist, _, gnss_adc, _, _, _, _, _, _, _),
+	[41] = PINGROUP(41, qup1_se2, ddr_bist, _, gnss_adc, _, _, _, _, _, _, _),
+	[42] = PINGROUP(42, qup1_se2, gnss_adc, _, _, _, _, _, _, _, _, _),
+	[43] = PINGROUP(43, qup1_se2, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, qup1_se3, ddr_bist, ddr_pxi, _, _, _, _, _, _, _, _),
+	[45] = PINGROUP(45, qup1_se3, ddr_bist, ddr_pxi, _, _, _, _, _, _, _, _),
+	[46] = PINGROUP(46, qup1_se3, ddr_pxi, _, _, _, _, _, _, _, _, _),
+	[47] = PINGROUP(47, qup1_se3, dp_hot, _, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, qup4_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[49] = PINGROUP(49, qup4_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio),
+	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
+	[52] = PINGROUP(52, qup1_se5, ddr_pxi, _, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, _, ddr_pxi, _, _, _, _, _, _, _, _),
+	[54] = PINGROUP(54, qup1_se5, uim1, ddr_pxi, _, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, qup1_se5, uim1, ddr_pxi, _, _, _, _, _, _, _, _),
+	[56] = PINGROUP(56, qup1_se6, uim1, _, _, _, _, _, _, _, _, _),
+	[57] = PINGROUP(57, qup1_se6, _, _, _, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, qup1_se6, _, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, qup1_se6, usb_phy, vsense_trigger_mirnat, _, _, _, _, _, _, _, _),
+	[60] = PINGROUP(60, qup1_se7, usb_phy, ibi_i3c, _, _, _, _, _, _, _, _),
+	[61] = PINGROUP(61, qup1_se7, ibi_i3c, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[63] = PINGROUP(63, qup1_se7, _, _, _, _, _, _, _, _, _, _),
+	[64] = PINGROUP(64, qup3_se0_01, qup3_se0_23, rng_rosc, tmess_rng, _, _, _, _, _, _, _),
+	[65] = PINGROUP(65, qup3_se0_01, qup3_se0_23, rng_rosc, tmess_rng, _, _, _, _, _, _, _),
+	[66] = PINGROUP(66, i2chub0_se0, rng_rosc, tmess_rng, _, _, _, _, _, _, _, _),
+	[67] = PINGROUP(67, i2chub0_se0, _, _, _, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, i2chub0_se2, _, _, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, i2chub0_se2, _, _, _, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, i2chub0_se3, uim1, _, atest_usb, _, _, _, _, _, _, _),
+	[71] = PINGROUP(71, i2chub0_se3, uim1, _, atest_usb, _, _, _, _, _, _, _),
+	[72] = PINGROUP(72, i2chub0_se4, uim1, qdss_cti, _, atest_usb, _, _, _, _, _, _),
+	[73] = PINGROUP(73, i2chub0_se4, qdss_cti, jitter_bist, atest_usb, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, qup1_se1, aoss_cti, _, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, qup1_se1, aoss_cti, _, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, qup1_se1, aoss_cti, _, _, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, qup1_se1, aoss_cti, gnss_adc, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, i2chub0_se1, _, _, _, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, i2chub0_se1, usb0_hs, _, _, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, qup1_se0, sdc4_data, qspi, _, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, qup1_se0, sdc4_data, qspi, _, _, _, _, _, _, _, _),
+	[82] = PINGROUP(82, qup1_se0, sdc4_data, qdss_cti, qspi, dbg_out_clk, _, _, _, _, _, _),
+	[83] = PINGROUP(83, qup1_se0, sdc4_clk, qdss_cti, qspi_clk, _, _, _, _, _, _, _),
+	[84] = PINGROUP(84, qup4_se3_01, qup4_se3_23, rng_rosc, tmess_rng, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, sd_write_protect, _, _, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, mdp_vsync, mdp_vsync0_out, mdp_vsync1_out, mdp_esync1, gcc_gp,
+			_, _, _, _, _, _),
+	[87] = PINGROUP(87, mdp_vsync, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+			mdp_esync2, gcc_gp, _, tsense_clm, tsense_pwm, _, _),
+	[88] = PINGROUP(88, mdp_esync0, mdp_vsync, qup4_se4_l3, tb_trig_sdc, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[94] = PINGROUP(94, cam_mclk, pll_clk_aux, _, _, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[96] = PINGROUP(96, cam_mclk, _, _, _, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, mdp_esync2, qup2_se3, mdp_vsync, tsense_clm, tsense_pwm, _, _,
+			_, _, _, _),
+	[98] = PINGROUP(98, mdp_vsync_e, qup4_se3_l3, mdp_vsync_p, _, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, sys_throttle, tsense_clm, tsense_pwm, _, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, mdp_esync1, mdp_esync0, _, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, _, _, _, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, pcie0_rst_n, _, _, _, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, pcie0_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, pll_bist_sync, _, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, cci_timer, tsense_clm, _, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, host_rst, cci_timer, tsense_clm, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, cci_i2c3, cci_timer, _, _, _, _, _, _, _, _, _),
+	[108] = PINGROUP(108, cci_i2c4, _, _, _, _, _, _, _, _, _, _),
+	[109] = PINGROUP(109, cci_i2c0, cci_async_in, _, _, _, _, _, _, _, _, _),
+	[110] = PINGROUP(110, cci_i2c0, cci_async_in, _, _, _, _, _, _, _, _, _),
+	[111] = PINGROUP(111, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[112] = PINGROUP(112, cci_i2c1, _, _, _, _, _, _, _, _, _, _),
+	[113] = PINGROUP(113, cci_i2c2, _, _, _, _, _, _, _, _, _, _),
+	[114] = PINGROUP(114, cci_i2c2, _, _, _, _, _, _, _, _, _, _),
+	[115] = PINGROUP(115, cci_i2c5, _, _, _, _, _, _, _, _, _, _),
+	[116] = PINGROUP(116, cci_i2c5, _, _, _, _, _, _, _, _, _, _),
+	[117] = PINGROUP(117, i2s1, qup2_se2, phase_flag, _, _, _, _, _, _, _, _),
+	[118] = PINGROUP(118, i2s1, qup2_se2, phase_flag, _, _, _, _, _, _, _, _),
+	[119] = PINGROUP(119, i2s1, qup2_se2, phase_flag, _, _, _, _, _, _, _, _),
+	[120] = PINGROUP(120, i2s1, qup2_se2, audio_ext_mclk, audio_ref_clk, _, _,
+			_, _, _, _, _),
+	[121] = PINGROUP(121, audio_ext_mclk, qup4_se3_01, qup4_se3_23, _, _, _, _, _, _, _, _),
+	[122] = PINGROUP(122, i2s0, qup2_se3, _, _, _, _, _, _, _, _, _),
+	[123] = PINGROUP(123, i2s0, qup2_se3, _, phase_flag, _, _, _, _, _, _, _),
+	[124] = PINGROUP(124, i2s0, qup2_se3, _, phase_flag, _, _, _, _, _, _, _),
+	[125] = PINGROUP(125, i2s0, qup2_se3, phase_flag, _, _, _, _, _, _, _, _),
+	[126] = PINGROUP(126, uim0, atest_char, _, _, _, _, _, _, _, _, _),
+	[127] = PINGROUP(127, uim0, atest_char, _, _, _, _, _, _, _, _, _),
+	[128] = PINGROUP(128, uim0, atest_char, _, _, _, _, _, _, _, _, _),
+	[129] = PINGROUP(129, uim0, atest_usb, atest_char, _, _, _, _, _, _, _, _),
+	[130] = PINGROUP(130, uim1, qup1_se2, gcc_gp, _, _, _, _, _, _, _, _),
+	[131] = PINGROUP(131, uim1, qup1_se2, gcc_gp, _, _, _, _, _, _, _, _),
+	[132] = PINGROUP(132, uim1, qup1_se2, gcc_gp, _, _, _, _, _, _, _, _),
+	[133] = PINGROUP(133, uim1, atest_char, _, _, _, _, _, _, _, _, _),
+	[134] = PINGROUP(134, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[135] = PINGROUP(135, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[136] = PINGROUP(136, _, _, _, _, _, _, _, _, _, _, _),
+	[137] = PINGROUP(137, _, _, _, _, _, _, _, _, _, _, _),
+	[138] = PINGROUP(138, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[139] = PINGROUP(139, _, _, nav_rffe, _, _, _, _, _, _, _, _),
+	[140] = PINGROUP(140, _, _, _, _, _, _, _, _, _, _, _),
+	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _, _, _),
+	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _, _, _),
+	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, coex_uart1_rx, coex_espmi, _, _, _, _, _, _, _, _, _),
+	[145] = PINGROUP(145, coex_uart1_tx, coex_espmi, _, _, _, _, _, _, _, _, _),
+	[146] = PINGROUP(146, _, vfr, nav_gpio, tb_trig_sdc, qspi_cs, _, _, _, _, _, _),
+	[147] = PINGROUP(147, _, nav_gpio, sdc4_data, qspi, _, _, _, _, _, _, _),
+	[148] = PINGROUP(148, nav_gpio, _, sdc4_cmd, qspi_cs, _, _, _, _, _, _, _),
+	[149] = PINGROUP(149, cci_i2c4, _, _, _, _, _, _, _, _, _, _),
+	[150] = PINGROUP(150, nav_gpio0, nav_gpio3, _, _, _, _, _, _, _, _, _),
+	[151] = PINGROUP(151, nav_gpio, vfr, modem_pps_in, modem_pps_out, _, _, _, _, _, _, _),
+	[152] = PINGROUP(152, qlink, qdss_cti, _, _, _, _, _, _, _, _, _),
+	[153] = PINGROUP(153, qlink, _, _, _, _, _, _, _, _, _, _),
+	[154] = PINGROUP(154, qlink, _, _, _, _, _, _, _, _, _, _),
+	[155] = PINGROUP(155, wcn_sw_ctrl, _, _, _, _, _, _, _, _, _, _),
+	[156] = PINGROUP(156, wcn_sw_ctrl, _, _, _, _, _, _, _, _, _, _),
+	[157] = PINGROUP(157, _, _, _, _, _, _, _, _, _, _, _),
+	[158] = PINGROUP(158, qdss_cti, gcc_gp, _, _, _, _, _, _, _, _, _),
+	[159] = PINGROUP(159, cci_timer, tsense_clm, _, _, _, _, _, _, _, _, _),
+	[160] = PINGROUP(160, cci_timer, cci_i2c3, _, _, _, _, _, _, _, _, _),
+	[161] = PINGROUP(161, qup4_se4_01, qup4_se4_23, _, _, _, _, _, _, _, _, _),
+	[162] = PINGROUP(162, qup4_se4_01, qup4_se4_23, _, _, _, _, _, _, _, _, _),
+	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, _, _, egpio),
+	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, _, _, egpio),
+	[165] = PINGROUP(165, _, _, _, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, _, _, _, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, _, _, _, _, _, _, _, _, _, _, egpio),
+	[175] = PINGROUP(175, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[176] = PINGROUP(176, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[177] = PINGROUP(177, _, _, _, _, _, _, _, _, _, _, egpio),
+	[178] = PINGROUP(178, _, _, _, _, _, _, _, _, _, _, egpio),
+	[179] = PINGROUP(179, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[180] = PINGROUP(180, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[181] = PINGROUP(181, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[182] = PINGROUP(182, _, _, _, _, _, _, _, _, _, _, egpio),
+	[183] = PINGROUP(183, _, _, _, _, _, _, _, _, _, _, egpio),
+	[184] = PINGROUP(184, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[185] = PINGROUP(185, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[186] = PINGROUP(186, _, _, _, _, _, _, _, _, _, _, egpio),
+	[187] = PINGROUP(187, _, _, _, _, _, _, _, _, _, _, egpio),
+	[188] = PINGROUP(188, _, _, _, _, _, _, _, _, _, _, egpio),
+	[189] = PINGROUP(189, _, _, _, _, _, _, _, _, _, _, egpio),
+	[190] = PINGROUP(190, _, _, _, _, _, _, _, _, _, _, egpio),
+	[191] = PINGROUP(191, _, _, _, _, _, _, _, _, _, _, egpio),
+	[192] = PINGROUP(192, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[193] = PINGROUP(193, _, _, _, _, _, _, _, _, _, _, egpio),
+	[194] = PINGROUP(194, _, _, _, _, _, _, _, _, _, _, egpio),
+	[195] = PINGROUP(195, _, _, _, _, _, _, _, _, _, _, egpio),
+	[196] = PINGROUP(196, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[197] = PINGROUP(197, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[198] = PINGROUP(198, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[199] = PINGROUP(199, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[200] = PINGROUP(200, _, _, _, _, _, _, _, _, _, _, egpio),
+	[201] = PINGROUP(201, _, _, _, _, _, _, _, _, _, _, egpio),
+	[202] = PINGROUP(202, _, _, _, _, _, _, _, _, _, _, egpio),
+	[203] = PINGROUP(203, _, _, _, _, _, _, _, _, _, _, egpio),
+	[204] = PINGROUP(204, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[205] = PINGROUP(205, _, _, _, _, _, _, _, _, _, _, egpio),
+	[206] = PINGROUP(206, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[207] = PINGROUP(207, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[208] = PINGROUP(208, qup2_se4_01, qup2_se4_23, phase_flag, _, _, _, _, _, _, _, egpio),
+	[209] = PINGROUP(209, qup2_se4_01, qup2_se4_23, _, _, _, _, _, _, _, _, egpio),
+	[210] = PINGROUP(210, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[211] = PINGROUP(211, phase_flag, _, _, _, _, _, _, _, _, _, _),
+	[212] = PINGROUP(212, _, _, _, _, _, _, _, _, _, _, egpio),
+	[213] = PINGROUP(213, _, _, _, _, _, _, _, _, _, _, egpio),
+	[214] = PINGROUP(214, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[215] = PINGROUP(215, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[216] = PINGROUP(216, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
+	[217] = PINGROUP(217, _, _, _, _, _, _, _, _, _, _, egpio),
+	[218] = PINGROUP(218, _, _, _, _, _, _, _, _, _, _, egpio),
+	[219] = PINGROUP(219, _, _, _, _, _, _, _, _, _, _, _),
+	[220] = PINGROUP(220, _, _, _, _, _, _, _, _, _, _, _),
+	[221] = PINGROUP(221, pcie1_clk_req_n, _, _, _, _, _, _, _, _, _, _),
+	[222] = PINGROUP(222, _, _, _, _, _, _, _, _, _, _, _),
+	[223] = PINGROUP(223, tsense_pwm, _, _, _, _, _, _, _, _, _, _),
+	[224] = PINGROUP(224, tsense_pwm, _, _, _, _, _, _, _, _, _, _),
+	[225] = PINGROUP(225, tsense_pwm, _, _, _, _, _, _, _, _, _, _),
+	[226] = UFS_RESET(ufs_reset, 0xf1004, 0xf2000),
+	[227] = SDC_QDSD_PINGROUP(sdc2_clk, 0xe6000, 14, 6),
+	[228] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xe6000, 11, 3),
+	[229] = SDC_QDSD_PINGROUP(sdc2_data, 0xe6000, 9, 0),
+};
+
+static const struct msm_gpio_wakeirq_map hawi_pdc_map[] = {
+	{ 0, 105 },   { 3, 113 },   { 4, 106 },   { 7, 107 },   { 8, 108 },   { 11, 109 },
+	{ 12, 115 },  { 15, 131 },  { 16, 116 },  { 17, 141 },  { 18, 143 },  { 19, 112 },
+	{ 23, 117 },  { 24, 118 },  { 27, 119 },  { 28, 125 },  { 31, 126 },  { 32, 127 },
+	{ 35, 101 },  { 36, 128 },  { 39, 129 },  { 43, 130 },  { 47, 154 },  { 48, 135 },
+	{ 51, 114 },  { 55, 104 },  { 57, 136 },  { 58, 137 },  { 59, 138 },  { 60, 139 },
+	{ 61, 145 },  { 63, 124 },  { 64, 110 },  { 65, 123 },  { 67, 132 },  { 68, 146 },
+	{ 69, 147 },  { 75, 151 },  { 77, 148 },  { 78, 149 },  { 79, 155 },  { 80, 156 },
+	{ 81, 157 },  { 82, 158 },  { 84, 134 },  { 85, 159 },  { 86, 160 },  { 87, 161 },
+	{ 88, 162 },  { 95, 163 },  { 96, 164 },  { 97, 133 },  { 98, 150 },  { 99, 111 },
+	{ 101, 165 }, { 102, 166 }, { 103, 167 }, { 104, 168 }, { 120, 169 }, { 123, 170 },
+	{ 125, 171 }, { 129, 153 }, { 133, 100 }, { 144, 172 }, { 146, 173 }, { 151, 174 },
+	{ 152, 175 }, { 155, 122 }, { 158, 120 }, { 162, 142 }, { 164, 176 }, { 165, 177 },
+	{ 167, 178 }, { 168, 179 }, { 174, 180 }, { 177, 181 }, { 179, 182 }, { 183, 183 },
+	{ 184, 184 }, { 185, 185 }, { 186, 152 }, { 188, 144 }, { 202, 102 }, { 203, 103 },
+	{ 205, 140 }, { 209, 186 }, { 213, 121 }, { 216, 187 }, { 221, 188 }, { 222, 189 },
+	{ 223, 190 }, { 224, 191 }, { 225, 192 },
+};
+
+static const struct msm_pinctrl_soc_data hawi_tlmm = {
+	.pins = hawi_pins,
+	.npins = ARRAY_SIZE(hawi_pins),
+	.functions = hawi_functions,
+	.nfunctions = ARRAY_SIZE(hawi_functions),
+	.groups = hawi_groups,
+	.ngroups = ARRAY_SIZE(hawi_groups),
+	.ngpios = 227,
+	.wakeirq_map = hawi_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(hawi_pdc_map),
+	.egpio_func = 11,
+};
+
+static int hawi_tlmm_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &hawi_tlmm);
+}
+
+static const struct of_device_id hawi_tlmm_of_match[] = {
+	{ .compatible = "qcom,hawi-tlmm", },
+	{},
+};
+
+static struct platform_driver hawi_tlmm_driver = {
+	.driver = {
+		.name = "hawi-tlmm",
+		.of_match_table = hawi_tlmm_of_match,
+	},
+	.probe = hawi_tlmm_probe,
+};
+
+static int __init hawi_tlmm_init(void)
+{
+	return platform_driver_register(&hawi_tlmm_driver);
+}
+arch_initcall(hawi_tlmm_init);
+
+static void __exit hawi_tlmm_exit(void)
+{
+	platform_driver_unregister(&hawi_tlmm_driver);
+}
+module_exit(hawi_tlmm_exit);
+
+MODULE_DESCRIPTION("QTI Hawi TLMM driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, hawi_tlmm_of_match);

-- 
2.53.0


