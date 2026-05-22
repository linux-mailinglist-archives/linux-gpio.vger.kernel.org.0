Return-Path: <linux-gpio+bounces-37389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JsQLPTAEGoSdQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:47:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C915BA301
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D52300EA81
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C2367296;
	Fri, 22 May 2026 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRV2u6q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIpyGHDg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26C357CF3
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482827; cv=none; b=JnI8ganvHcrjwBOtYZZjFW12x0fx4fT3u5iZizroCys+aiQwe9BVdT3MwTV6Sr9O+KzIzm0By8dtP1S7kK9foEs6kJ+wyk0zVr2FtdRwMrwd+8xHN+ORpkJpL9Z6mi5aYG2/4lTl/AhUeHfpWqBjW9AwLmIZJa7/PggdsgXYnJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482827; c=relaxed/simple;
	bh=1ArzpGhOQxCx3RVe6axct8hrohdVOyEEi512dTfwxgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z18uLXVBkGtdTzTDjvB9iu/6sWSzhhbnxfx8aWBJRSmlmLVCcla+1m5esCNtKre4CIPSqkoopEdHlFLqHgn+GAhTsHeuP0YA506+pK+VUZHGAg9CDD901kFp1ZHxGmYzIOLU7BXDGcfyGsQ81jBJQUbZxHj8MqQHJ2K2Zl268cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRV2u6q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIpyGHDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0hof3477048
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f33Syln7KaI
	1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=; b=eRV2u6q3RXQNKq5/I9SdjqlUyj1
	aSdZ/UesxuSYw2nI7TnBF3h9ycZEifFVwLVnr1YV55PmJPHPZKFzHxV/7IJNfb4G
	OO37qsFmcY+O5yRQ9WuMXVQU+OcIh4oF19ZKzyvRjbtmaSVAU1cPy5jxvA61UxTR
	p/eTeosoZjMw3qh50FIjR5CXUD4IxWGWCVUdhbbmiuoPIKO7vZtfNY0d/FvXYjIu
	bqHqbjX0hKbq+5r6i4PJqTCeuMlzcuqHwmPwPdHQJVoXbVPlRr/rGHuhUCR3AXpT
	G4m/XDOsfwfEXZRnrGjNDBqrzjd36WZDSKc2mlm17XDTbrxl2yAIdPqWsVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8y3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:47:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so7687416a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779482824; x=1780087624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f33Syln7KaI1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=;
        b=OIpyGHDgB9rsYcjZKCS+xNYEaJ21RjikxRu+/od8nj31Ijo6cQfagRaHy5hMT8MXmw
         WiTH8ZJB7g0sfHQk/YhlxuYqR2r1rbUu63s3qSrVR0ikmnRt5OfbxtvG8xHb2uGwNUBv
         rU37qP5OLjIoRW5tevWBn1iBJ1CwxBp5M2ir7HqH3fWHrqcUCMjbTUSRJUWoGzTP0jU5
         1hZMC52QalVXKMz0oUoT9iu7THHBnO/0/0nN0SUVPpXGw59h6uP4OELeLZSyVlnXkMSj
         JpjqNcngVhLRRNaH9hC46KsI+SzJ0LW4qBmzKsn+nyLZ4oTmKivBot0LBiW/ieipVhY6
         1dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482824; x=1780087624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f33Syln7KaI1HAb8TNlHzt9EL9a9sngfU9QVHdZizrE=;
        b=KXWJXw832gTauoItac0DGlbYYB7qFinjKB0stRY0yOHl5Rt+JSytit9J37jRy9+LxU
         0sd4/G+4KUJzNns2d3z6Awo3rzYeaHhpkP0ceFPUTJlpmeMIox5msaNQwK5/jEJAlqxI
         SkQOwn3nQCi6YlDvln7skf1EMH+40m4pKcp2SvjTQd4po0MlM4xOjv6+46ZwIqeMofGl
         w08C7FRX4ySnC2/Cq/9u3e1TcmxXXtIRbgHqC8zv8Nw059XOe99sKeKavQJdHqwT/My1
         hIb8azyYud8clmmMgEN+YIDGU/wpE94YnAoeJ52iEMiN/jrRSHBylx80ZbzWF7qIpV3x
         z4mA==
X-Forwarded-Encrypted: i=1; AFNElJ8h35kY73L7aI2LovnCVFc2oCZoFfxrkU4W6AyEGyMImbkbHtXR/Um2dJx5BnnjClK7IVOGTuUXMi90@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWhC8nEiutrKht86CK1fCAcPirnEMknbKgxxS8UcofgT5Djj9
	QspM+0HrPQ5UGS63mXbTxKUi21tT9oUss7vhS/mClXlD5uN1tvhJxyB6N6fyjrxIIkfpS95+aFB
	g9PK9qEZUB5xTUbQ+i/w+2CWut+utSs7Tlk1ppPJTbFhI//XlslqcksVIh2tBzNdc
X-Gm-Gg: Acq92OE0Rvsk4wmTNf4WWyE2ulqad9XZEPggqH2uC3CWSOHP/VQO9bc2OpLfZ+d3lPG
	79s/DzjVKeJATlgPsxLUEFrN7dopYBzorg827LM/QXZHO1CX6W4fe7YcaXVEv/Lt8fd+KDSqXAI
	7ZS79JwqSHpXQrFT7Nr1aQ/vV2kO5nLR/vMe2N/oe/aq0aPqomEJ5kVJYs89GF3gHYoaAVU9i/8
	0nv9aC5LivfhfIRC/8LO0Vtdk+E2Ck3GpAKOq1rYd4yKNPrasAYQQH75NPB2tAb/X99sJUJ23D7
	5MwqxaoO0QyJaF/Ik4rwbeO4X0LQxUUJWxOgos8aaVyQLv7TaTOuneY8fsyM6jdtHtDq3jjcGBD
	2gu04Omitgl6oo7BmR9Y1FjtkFuguJqkfqRP144TmQ2Q6OvPirun3QTUmUzN4
X-Received: by 2002:a17:90b:564f:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-36a676f4ebcmr4536779a91.3.1779482823582;
        Fri, 22 May 2026 13:47:03 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-36a676f4ebcmr4536758a91.3.1779482823020;
        Fri, 22 May 2026 13:47:03 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7263179bsm2720956a91.1.2026.05.22.13.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:47:02 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
Date: Sat, 23 May 2026 02:16:43 +0530
Message-Id: <20260522204644.4101640-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10c0c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Rko4qIHHiJ4K03xOnZQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZAfCCdhudRqmN0SgPzMK4fD6qJwpP61B
X-Proofpoint-GUID: ZAfCCdhudRqmN0SgPzMK4fD6qJwpP61B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwNyBTYWx0ZWRfXwKZU8JGSK6dS
 qSzIf9ECOpf0MetEpcl5X3GaPhZCctMkL5CkJYMhLZxh/3Bwmt+4NLvxg3FR/iMSIJo/ncvYBjq
 FcGIfq3l3jsUEckxB/bhUbQbEIHLB6bqXBQtQ49emqFvFNKt6AdXcDvd5gDLy8XhGHn2/XJOSuK
 N47vhgIKko93eiGVnfPo/sa3aMHK9By7orssARPLdYfoPhLxM+giKE2ET8VQPNWYVVqDKl3iNjv
 OV5arI+UCyWMf0Ac6x825qxdESVNSCTplnizJOlkG2vQ9mFA3wj67sKTXCaH0V21HF4XvqizAPZ
 XsH2NkkDSXiCQseS5qXHXMFbidZRMmBWiG7MDou6qoMqkel8xvT9kdnNdfdp7WJUbeXwEJ74FdP
 7C1XBJl/e1g1Lx/EPylp49vLw+piS1rEAib0dP59ehlb6+ed5PQDglfJB5Gf0lhlETT7I2B/fHk
 uiNfAp7sH7wqlCJqXNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220207
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37389-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29C915BA301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LPASS LPI core conversion to PM clock framework relies on variant
drivers wiring runtime PM callbacks.

Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
in this patch so they are prepared for the shared core conversion.

This commit is a preparatory NOP on its own, as runtime PM is still
disabled on these devices until the following core conversion patch.

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 19 +++++++++++++------
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   |  7 +++++++
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 15 +++++++++++----
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 15 +++++++++++----
 12 files changed, 110 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 3bf6fe0cf1bb..72b8ffd97860 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-milos-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 750f410311a8..a61df10d46cb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -129,20 +131,25 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sc7280-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	}, {
-	       .compatible = "qcom,sm8350-lpass-lpi-pinctrl",
-	       .data = &sc7280_lpi_data,
+		.compatible = "qcom,sm8350-lpass-lpi-pinctrl",
+		.data = &sc7280_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc7280-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..27c47710365e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -166,17 +168,22 @@ static const struct lpi_pinctrl_variant_data sc8280xp_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
-	       .data = &sc8280xp_lpi_data,
+		.compatible = "qcom,sc8280xp-lpass-lpi-pinctrl",
+		.data = &sc8280xp_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index 65411abfbfac..7b5aacaae7d7 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -145,10 +147,15 @@ static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm660_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm660-lpass-lpi-pinctrl",
 		.of_match_table = sdm660_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 858146c408d0..0a31f7ad2e0d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -151,10 +153,15 @@ static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm670_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm670-lpass-lpi-pinctrl",
 		.of_match_table = sdm670_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index c0e178be9cfc..75bafa62426a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -221,10 +223,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm4250-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index b7d9186861a2..05435ea6e17a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -141,10 +143,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm6115-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
index 4d06abcfedfd..946b23084304 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -135,10 +137,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		   .name = "qcom-sm6350-lpass-lpi-pinctrl",
 		   .of_match_table = lpi_pinctrl_of_match,
+		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..454de788be21 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -127,17 +129,22 @@ static const struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
-	       .data = &sm8250_lpi_data,
+		.compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+		.data = &sm8250_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8250-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..834eee8dcce9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -195,17 +197,22 @@ static const struct lpi_pinctrl_variant_data sm8450_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8450-lpass-lpi-pinctrl",
-	       .data = &sm8450_lpi_data,
+		.compatible = "qcom,sm8450-lpass-lpi-pinctrl",
+		.data = &sm8450_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8450-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..875e04e5d2b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,17 +205,22 @@ static const struct lpi_pinctrl_variant_data sm8550_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8550-lpass-lpi-pinctrl",
-	       .data = &sm8550_lpi_data,
+		.compatible = "qcom,sm8550-lpass-lpi-pinctrl",
+		.data = &sm8550_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8550-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..bc7889c993d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,17 +212,22 @@ static const struct lpi_pinctrl_variant_data sm8650_lpi_data = {
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
-	       .compatible = "qcom,sm8650-lpass-lpi-pinctrl",
-	       .data = &sm8650_lpi_data,
+		.compatible = "qcom,sm8650-lpass-lpi-pinctrl",
+		.data = &sm8650_lpi_data,
 	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+		.name = "qcom-sm8650-lpass-lpi-pinctrl",
+		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


