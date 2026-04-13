Return-Path: <linux-gpio+bounces-35087-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMZmFSDg3GnrXgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35087-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:22:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D63EBDB0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A442B30098A3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76613C4559;
	Mon, 13 Apr 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzLNs6Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huPLBe2g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669433C4542
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082974; cv=none; b=NWccwY9kVka1e6YR+v35MV5lWzZ9u8CnMBNFoFhVBGWbvBQH19hcW9XxooDCPYWKTMG434uiJUl0C/KVOkNJ4EEsWvQ5ncKZ9Vm3thZ31hlETWMYr5lftSz/rHADC/+hUF1U27FjulkJtUm8T9hos+DWRY3M4tItnJu+wPY3qoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082974; c=relaxed/simple;
	bh=WqGjp+3nNmWD37jnenV4bomrrnmUA2taflFijifU3W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bbRFkEPzEIm1ZnBFtswzu7Hc46Ua4mGbREBIy2hV+qhuBxNDHOG8VKsqoTo45WRyvgz2ZQQgUqJpuWGoB4itbH6UiuNHTG0AO5fXG28qoC8slbAGUj2Yo6xgdPwxbEGsacdx6wQMnVsMhWZVyV8Hpz2ze7S+D7/1LBJA0HV12XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzLNs6Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huPLBe2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7T9lr445957
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jIHQxfHe8DT
	AODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=; b=TzLNs6Ggz6DeART+AVrG3FRXxtD
	kyPJRNCrvj0usGt7jNTK7yp8mTmOe7beCeUW19wxAHkQAGLKH73aAynvuP9dS+h9
	2i8mGWW7fJc6SzoOak7pL3S3SYACHIQAVBj1fTiiIj7NLOCt7oQyxCUPaTUromOt
	8tcj2qJLXnSMH1H60D9LtL32tMBBUTWojSJtoe3o2wQwdCh1RQOi0OEuBPpKTxD+
	LyaoAtG0RpeaXjiCjg6ATQlAS11mDJkBNMAKXnTjiDeP1jw0bvAfNRDvEezOarf2
	Z+HjrcFPI1/ONNHLPU4JVVpzb5wB9+IHmukPfUL31Aun0YQn2T/g3BTxR2w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhw6fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 12:22:52 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79aa3a19ea3so68905667b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082972; x=1776687772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIHQxfHe8DTAODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=;
        b=huPLBe2gQufZ3Kz1wblHBW7Wwinu5CYsQtSQ7j6UrN8hshtYJttcJd8WZD1JlzxXF7
         ZJ6Ry3x9I6pfCLbp5Tm05CeVvfqSOZIc6DSsOZ4KgKIFKcPQPreGSmstrGBjQRjtGGtD
         rWtsDZKAAOP70JSfiym+vPJipyheyIMODUZglWCbicmXOSe3GDP60ntEvEshrzQH0Ckx
         MsIczoOzpCG2xdRdHkKaol573hOjJs4Aufoy/NVVWa63cHvSlkEshvAIxzaF2tlFZ/Y9
         eZoJQTfdUy8mzz3R9M8ur5iZMZvIuI8MgJvSaCYu/Jp8MLXcbpSAejCZx0x/aseYUdAm
         buaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082972; x=1776687772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIHQxfHe8DTAODaHCq4F4LiV1LMXh8MqG2eRCRTxoak=;
        b=g4N/1HdJNQCha0hQyGR8X/9H/RwEAEvfHhLgkE0682+NP1bTiKAvW4P97sGPSYrj7p
         N36Qkv58g47/mi61Br/IJew98wyvt1eUdHvXEAMUUd0EJHzHg/DLhWDCBorxCWFrrRWm
         m6b38JmwDxUlwfP9wsrkL6S9akO3a9LgBSJ/0w9qlaRPVCZRnie07ttgIedEZ+VGXNjC
         PFZpoq547GcTn0EwPWKv8AMvPwhcT8Q09nGYtxIQnJHMYKvl20DOk3sUs8RFVBtqWtSm
         iTBNc5nr3KgTGpFBYBY6e0D5WFpa6uHlpVogNtwbmPLZVE5VJQAuA3315Ns/3IXmaRL3
         tLsA==
X-Forwarded-Encrypted: i=1; AFNElJ+wVZ2hjCeBhQ16QBPpGiC2LMvqEDMK/RpJnTFGbbl6qxnYnDKhRrQCxRdmIzZ8/LNgWt753XeHh0rp@vger.kernel.org
X-Gm-Message-State: AOJu0YzwL64LGA923MtcpozF6GCw0H6CqTbuwE+FmtngvdXdXDCIwhBW
	NBsd0mkI3uNRfJQYqKfDcEJWlcuItDTI+6wzPa6L8/skSB2giRK/GJj+QJEHSSkXrz5jdWAqTh8
	GqZP6infRLzsTYGfCAHI5QtwldTbTWNCEKxK5ItFS9R69144GPx0CJhBmum3aChBL
X-Gm-Gg: AeBDietAKzihnxn14shVjcf+598on6N6wrDnq7H6n/5/4RKGA/K+D0A4f4XhZClFoJy
	kxAh0Q0SYSjK7D7Nwfr738k7DHVpc57KUnAZM93CA4cJS/wNVUoVMAi3UfVMjEm/tFd+0D/oWEW
	E1TpbjbLYNUaXn5pKMTO8LIpQtJUnEZ8fIdZrs49eT4bX57MZ2FJcy5dosCgjzD8JUZl1ELyQ5U
	vwbl/0U74ebSoTwh3/rRlqZQFMpx51gSF3hUWexQli3poSsnVmRYbqZNEBKeZZZmM3v2bY2j7VG
	4TMMP3C2Efc4MHakcFizHAsnY5TC9J9zQx0/BxPyGf9w3hxglkMOY52QnLm1ciNTH4ZZ2/QL83V
	aOTgdJmgCcv+M7k9J7eUy07Iac9f3owFvDlZvwW8sGxIvvuWtGQ==
X-Received: by 2002:a05:690c:60c6:b0:79c:a09a:e596 with SMTP id 00721157ae682-7af7253064dmr143747477b3.47.1776082971496;
        Mon, 13 Apr 2026 05:22:51 -0700 (PDT)
X-Received: by 2002:a05:690c:60c6:b0:79c:a09a:e596 with SMTP id 00721157ae682-7af7253064dmr143747127b3.47.1776082970937;
        Mon, 13 Apr 2026 05:22:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af400eb1fasm50781657b3.44.2026.04.13.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:22:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
Date: Mon, 13 Apr 2026 17:52:31 +0530
Message-Id: <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMiBTYWx0ZWRfX3K+YwpIs5tqb
 EIpnsMKVxnsgxab7qzg50NIxSTV+hMFaUwbix6x92oLdTD1Nan9qzkI7faV3yn2+ccovk6R8rOd
 zD1yl/TUQErbv68quQDuBcU9rTTCcGqa/8EqwyBUJudypAddyjvkswx8fa0WnQ5nmaqkuKzXu7j
 9xhxXTI3IAXKYHCqMjC9UY1AeKh3cbesXZeQbwGFNoy6QKsTOnTCVncCYDqin/fTRl4YuWZiP0d
 A0C89HvFMlGeOy13gLuHgt3aYwmb5tSJuwFEZsTbQhASPgia5WlRA9UK10JbFepHG3f08xjD3mH
 Pj4J1L5RStwv5sQyMOAKZgan3uYdpg5CEYrZYc7RO7Vr1XNEulwk3YTV9H7l3ey0OjGxdSGom87
 iZ9anXKIXupVSX2uHqRAaBNgT2mpNeLtnyrsowUbxSR/4pL/zuIYxmSkgghi87r8iI7OKn0m+2s
 l5AwLN3m7IRJbIK7nZQ==
X-Proofpoint-ORIG-GUID: OYMJBymMF5aKibjDY88UWuaIpkiji_O3
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dce01c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hf2oG6dDkt1_u3eYQosA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: OYMJBymMF5aKibjDY88UWuaIpkiji_O3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130122
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
	TAGGED_FROM(0.00)[bounces-35087-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E6D63EBDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS LPI pinctrl driver to use the PM clock framework for
runtime power management.

This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
improves power efficiency on platforms using LPASS LPI island mode, and
aligns the driver with common runtime PM patterns used across Qualcomm
LPASS subsystems.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 36 +++++++++++++------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  2 ++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  5 +++
 3 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296..6d50e06ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -14,15 +14,16 @@
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinmux.h>
 
 #include "../pinctrl-utils.h"
 
 #include "pinctrl-lpass-lpi.h"
+#include <linux/pm_clock.h>
 
 #define MAX_NR_GPIO		32
 #define GPIO_FUNC		0
-#define MAX_LPI_NUM_CLKS	2
 
 struct lpi_pinctrl {
 	struct device *dev;
@@ -31,7 +32,6 @@ struct lpi_pinctrl {
 	struct pinctrl_desc desc;
 	char __iomem *tlmm_base;
 	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
 	/* Protects from concurrent register updates */
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
@@ -480,9 +480,6 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = data;
 	pctrl->dev = &pdev->dev;
 
-	pctrl->clks[0].id = "core";
-	pctrl->clks[1].id = "audio";
-
 	pctrl->tlmm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->tlmm_base))
 		return dev_err_probe(dev, PTR_ERR(pctrl->tlmm_base),
@@ -495,13 +492,17 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
-	ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can't enable clocks\n");
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
 	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
 	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
@@ -539,20 +540,33 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 
 err_pinctrl:
+	pm_runtime_disable(dev);
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lpi_pinctrl_probe);
 
+int lpi_pinctrl_runtime_suspend(struct device *dev)
+{
+	return pm_clk_suspend(dev);
+}
+EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_suspend);
+
+int lpi_pinctrl_runtime_resume(struct device *dev)
+{
+	return pm_clk_resume(dev);
+}
+EXPORT_SYMBOL_GPL(lpi_pinctrl_runtime_resume);
+
 void lpi_pinctrl_remove(struct platform_device *pdev)
 {
 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
 	int i;
 
+	pm_runtime_disable(pctrl->dev);
+
 	mutex_destroy(&pctrl->lock);
-	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
 
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index f48368492..ae94ef48d 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -107,5 +107,7 @@ struct lpi_pinctrl_variant_data {
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
 void lpi_pinctrl_remove(struct platform_device *pdev);
+int lpi_pinctrl_runtime_suspend(struct device *dev);
+int lpi_pinctrl_runtime_resume(struct device *dev);
 
 #endif /*__PINCTRL_LPASS_LPI_H__*/
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f41031..2d955643d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -139,10 +139,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(lpi_pinctrl_runtime_suspend, lpi_pinctrl_runtime_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


