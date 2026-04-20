Return-Path: <linux-gpio+bounces-35259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKHaN+Ud5mkMsAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:36:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A5142AD07
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 14:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C0023021FF8
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277C53A8F7;
	Mon, 20 Apr 2026 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlyrpvaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCzBr3jI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853039FCDF
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688320; cv=none; b=DDqj8pVeWydpPRmIZWlojvL1Uzd/3T/Q8R7I4OyNHXvHMybkqXAfYDFNl2L2LSbatmD7FCTygjbUU9Z0qkGxYgsadN/1STzZJggZmEikqQxIQu7A35wy7/SqihWxXtmWJ60bCv0JO1d0kKKluNU0fRXOfine0fW1qXGeYj20nZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688320; c=relaxed/simple;
	bh=6f3IpDFEVSvlAI3TZLLrLLPk4t6G7ajFECiGdRI1Y80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C3iRbDq7+KIKFCwAdWhBTUu26Oyx68m0suF9/tYBbnWwWaVjqwlJbK1JcUKii5CUgDMx5Yol1HCs0xdtdqh1BA+NXYhjP1Ddh9hfBy8FevdlANY23QupEZRFnUM/T2uKE+Tjb59qxu0A26ljqAy7+vsNy1egQwouA/poc/lGGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlyrpvaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCzBr3jI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91RJF2281683
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0ku/M9yomju
	ipZxzTUJYUaxo42NUSLKIHXheMPFr2hw=; b=IlyrpvaTWPPDRX4SCujBY0YHiMt
	Cb1AjJM0eWub6+G0UAFmpQPDbdKn+1cxkYpMp8nC2JyBrHn+z6YFuLchpf5d0qG8
	B9C41UQCPbIAr8UBkn5nl29EGAxGonOgbMIUYi7WGDyp51FxlQ9zzOk+HLHdobPa
	XFVW8YW8EHtJY0BYLtmbkD6jtoTL5yeyUWLbzdR7ocME/v0Ox+iNEHKPxVanaz3n
	Hg28oSlYW2kfg7AFPQncnwri393ib/OMfSULzqBd5z1nJu+auKnNldHFBuRNAH1o
	mlu8rs+syaYTnq86pXicQeZ9Ubr8bxBi+k5ulng9aIMJhrxehI0IrpKwPdA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598ptb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 12:31:58 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79878791ec6so60694097b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688318; x=1777293118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ku/M9yomjuipZxzTUJYUaxo42NUSLKIHXheMPFr2hw=;
        b=JCzBr3jI2re7tWbd+CGU8E7wBGgT7m2fnbx+C1LBrWZwAYQ7NQNWYmLY3luwHwviLc
         8pW+LfketHlKdlAcBUeORcF884koLmCfHdNaO6zXD6tox505ygOXWtfiYz4amJP4ZXFf
         BmjqD+ENYloL3MF/OmjvaP9ElTOAjNnLbYLWpQh67VYCJSK7+KQu05VBNGrlvgZF4oz7
         Oxl7NJX5ZkLW67RyadD4fIhqfx8eblbl21/O6ZxT0xSLjP4VPGqNlW5oGZf4/lg2oz/C
         Pneyw1t6wpmphurNUfaC1o3HjXcvhtuzs/SQjb2qMd+rzmMI03ARyINfBB2HSGruo4Z2
         0iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688318; x=1777293118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ku/M9yomjuipZxzTUJYUaxo42NUSLKIHXheMPFr2hw=;
        b=KNaFDVCmVpoFdYwjIiQsd0SgrRRq7cJoF2Fzh2jnn7kWDvniWAl7ROhn1Z8XH8YtdS
         5qCBOrNGjWnP2cWvdC+eWUApDYis7hc2xZHeaCNy31h34R/ktRtX7TNXHk3fCtjypM1h
         0gJj24gXKPgfEavNs9yj8iqcCcRyXISRqJeUTekLd33oH+v7cKdKu4TENI+upJV25XNh
         BNZ+Cu9kUQqyQqzTMq4Giba8llFtu+X1doLWrEasj+yNFAcAMJuCSRu+nSADGtSQkTI3
         M6wxo/Kmlpf01Ob5mEFkRn7GQ9S2+BM8jautPNHHeinEBS6lrhQtge+JAsFCVnP0+U1H
         7p6A==
X-Forwarded-Encrypted: i=1; AFNElJ+8rKIcULKVdocNNJIzVCqaGHt+QAc9GZDHahDFbPAYE0A1IyviPJes6efzKogTAH5wY2L9aG0oqv+a@vger.kernel.org
X-Gm-Message-State: AOJu0YzqD/XNVqe47JBRDTlHWAJJeijEdrIUSm6NSk7/JsUjq4aZaHvM
	rdIM8DAOxEOV3W8hzDCaJM1exjLH1RQ0MU/cJfGaNYJ/ZNp2T8CMeluyS04EpVTPcRe9FYYpxEx
	pwyu/+r+NGcyh7m+avoRPeCZ1KQmXQCBaxZHEMmdo2Je44gFJVGUCbWT7xf12I7+u
X-Gm-Gg: AeBDievG+GsK1kK4jvuFbMo+gG7T8WHAi3Lp/E3v3wpPDD7ORE2KfBl7FpY4nEenaun
	4MSUgAKyp+p10lS3zH94zuoC2ik4UufeE/2ePRKqRIt8hCl3yns0cj5mcaV70YXryFSM+vK/8VA
	8PFgQuHhUGwRoaAT3SM1ZJYowwXsZpcs0XVwC6DlXhUu6SYCcYNZEQ7DWgUdq2vnUcZhqcQ/2Z0
	Mg1T6c7Z4y6+lxuNartW2myFbvIHhgIxvSzBh9Y6akIk4fayDXhrvxjszg4o+baj5+h9EVN2h+4
	bUREbx8LbE22iMEGWxnpaNEgROAtlMtNDMq16Gjd6mO061BaDgZXHz4xml3wrZaH7cMfheKEafD
	xrWY1jDDII8W0qhOAVDvPu0L4CgmUGH96K6Gav/G0JlBTo0aGRJID9FgyRjnx
X-Received: by 2002:a05:690c:6e83:b0:7b8:f152:7526 with SMTP id 00721157ae682-7b9ecffb58fmr127722777b3.42.1776688317541;
        Mon, 20 Apr 2026 05:31:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6e83:b0:7b8:f152:7526 with SMTP id 00721157ae682-7b9ecffb58fmr127722487b3.42.1776688316964;
        Mon, 20 Apr 2026 05:31:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8be8e4sm44014267b3.14.2026.04.20.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/3] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on remaining SoCs
Date: Mon, 20 Apr 2026 18:01:34 +0530
Message-Id: <20260420123135.350446-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
References: <20260420123135.350446-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3O2Gf_Oe74bsJEPj6va1P9YQLG3IsvzP
X-Proofpoint-GUID: 3O2Gf_Oe74bsJEPj6va1P9YQLG3IsvzP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX7kkKZyVTbZZo
 ZBPtmJ/zotCtzhRoKGHuWq+7PNd5oOGcBYvHvwpni74RWRCd2eiRqxjRaYD1piMa4qogWnkd237
 Mi+v/LZuMWfQTnNfeiB3nr8KvNEe8ZaEZ/ay9+Sj9nRTpVza05rS5DHkuvEscD01ZX9N2WDatcg
 vkYjrgFLGXkFtZiW89QZLdO1DPwtm5IPDM5Q33FrD28Ov1uuUQYrfdeG+I/BpuGn4O166ZHFkJV
 2WGxVTkNchOUc3M+zUR1iXxS6erSuZTedwW2WexwsKVj0LmfQViIEeLknzXLEAd+BNpD4JvvvLZ
 /IIuLKhNC1kkIKJM/tL/esKd8Gz21h/cjNFkvWTKiwLr88TWLnXKhcW465sZz4fD1ULtqwwONnh
 /FFfhXFjhK5Cc457yWC1KBWkSb30m26bLu2IY/F5/RpOO4hDg4DLpobjUuuT5ERl10o0FUWnwG0
 nSAIT51a2OSh3vI9+IA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e61cbe cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0a-YJ0PiB8yxhyyw-9wA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35259-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17A5142AD07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LPASS LPI core was switched to the PM clock framework and runtime PM,
but only the sc7280 variant driver wired runtime PM callbacks.

Hook up runtime PM callbacks for the remaining LPASS LPI variant
drivers so all SoCs using the common core get consistent pm_clk based
clock handling:
  - sc8280xp
  - sm4250
  - sm6115
  - sm8250
  - sm8450
  - sm8550
  - sm8650

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
 7 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..1a61316c8c47 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
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
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..656f22da7dde 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..a79f99ec6df9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..9037ef0020da 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..513ddc99dd37 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
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
+			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1


