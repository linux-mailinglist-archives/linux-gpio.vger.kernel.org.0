Return-Path: <linux-gpio+bounces-39999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oemVCYMyVWojlQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 20:46:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C035574E935
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 20:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O4DiT5JH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39999-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39999-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E68713064738
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 18:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD3E3546E5;
	Mon, 13 Jul 2026 18:46:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5A346A14;
	Mon, 13 Jul 2026 18:46:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968368; cv=none; b=ea9Ibboz/+hjuliaB2r1avv2/9FIPQjX6O2Beez/GWEMr6m7jhKtwf/CS9m6k9IyaQ0QbqYF9li3RQk++HU8dZ31fgxVg39ydxDhAJxceBgpzH2UYgSnqp/+UIDdbypij0XPgpQEspxYqwm1q9hMGCZn25sGO4DR7sYlOuCyDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968368; c=relaxed/simple;
	bh=pcHvEJVWwWcoO/jelMpgNgp6hNj+BJKyJKQN7qlBnVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjMVWedG4PbMD9B41kTpm85iQUYmTYGQxeseW4thx1QKqUYz+iKHlfX73Tt6lhDVDHwvkjkI2JjzeDOfGhDSyXnOfUG28m8QzJJnlOtxsxOT+IGzD+QlTHSoa6NRDO0UzBHHzxGnm6VmY/4eSv+E8B5SOEUC0UXUlCRUWQoy/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4DiT5JH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8Jfe1860711;
	Mon, 13 Jul 2026 18:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dQ/BkOx+qU6
	VXsejqL6pgC4thG2VcHgWwj80PV31ccE=; b=O4DiT5JHJEXYZi9EOkJbZcn/1E1
	f0uWy9kBsPUf8SoUPlnZjHXVqomvR1MD5ZT73kVYBU750r1rgyUt7tme/Ux47VS6
	rx2jaAe+6+5YP5DrEsUxUeK7PgnrtknyV0y4IvloDULyfG2KBWyKhhdcVCTdDGI5
	c4nZyrBoY7Iyly4AcSgPC0icSnBqW0QAFWxAn0n36afmTb5Ea4l8HVxyt9xQ8lkB
	p0O7mS2ED8vzNrKNCe7lvvht/tY+Cmy8FANQL4uYc3/N3cXkHmjB+8Aaui1iuQjr
	cD0nxipBBEC+UyEyWvon5/VxV1VXZSEhVS1VVbsXCACiwnUc/BEchXShlWQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj02qtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:57 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DIjs0w010050;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewjb42f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:54 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DIjrsX010024;
	Mon, 13 Jul 2026 18:45:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66DIjrol010022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:45:53 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D388563C; Tue, 14 Jul 2026 00:15:51 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v2 1/5] pinctrl: qcom: lpass-lpi: make mutex cleanup devm-managed
Date: Tue, 14 Jul 2026 00:15:45 +0530
Message-Id: <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfX2JfZwcO8mMB0
 aaAoYMMl1dEBetaQjOVaXzqJmhzCCv1PT79MwII1pA4Ua/WXARL9VUdNq9LUu277ayXQ89XA0kh
 mZGwB0P1ZUaktB2uoXS8B9ChuIJOtOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE5NCBTYWx0ZWRfXxiMj/voqMfFb
 wZGgLTmW+8BLzC5fOqXyT7pSywN58r2liDRi8ETUbGruKuFBvKVbn2JojxZGjrKLvhjc8LhgGGn
 H6AoUfcHJX7E5sAbsMd0la/sYmvJIoddc/LSADDn9JZh/ox3HY6kw3GcvpdWkTRkJoVs6inON5i
 39j4SF5wbtb1laN62KWmekUCh7SHphQe2VgJn0NmmJnZ9RCogDlkeN8WU7WQCsXJWtNoK+lR+Sa
 V7pkIshCJqAu0By8ElhawufTuXNRulXkUfafXMiUNR8Fy5TgexYvHQLXdho7di2kCGLlXaZssrh
 ey8SLWEUyA2HhaJF0+7AgUaS/aeBPH7Ybxi5HaesBweAc3ygEP3xaFNpdj1qMvtUDcwq78arhmP
 CTv3EU9QJ4xrTB1Aq2e2s/rgk7Xs32o0svjVSO3VCoM0PDV6tpU9dA/3MeiD0ThI4Ess26CxgQl
 4r6WefkeCFqbP+VgA3g==
X-Proofpoint-ORIG-GUID: Z_JaSbdm9UJJM9_KGelm1gyDW6zu-XTe
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a553266 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KWEuzqUxTflMcmSvMx4A:9
X-Proofpoint-GUID: Z_JaSbdm9UJJM9_KGelm1gyDW6zu-XTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39999-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C035574E935

The driver registers its pin controller using devm_pinctrl_register(),
which keeps the pinctrl device alive until devres teardown, after
.remove() returns. Explicitly destroying pctrl->lock in .remove() and
the probe error path leaves the mutex destroyed while the pinctrl
device is still accessible, risking a panic on concurrent debugfs
access during unbind.

Switch to devm_mutex_init() so the mutex lifetime is automatically
aligned with the devm-managed pinctrl device, and remove now
redundant mutex_destroy() calls and err_pinctrl label.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 5fd4a4eba..b3e365470 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -559,31 +559,25 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->chip.label = dev_name(dev);
 	pctrl->chip.can_sleep = true;
 
-	mutex_init(&pctrl->lock);
+	ret = devm_mutex_init(&pdev->dev, &pctrl->lock);
+	if (ret)
+		return ret;
 
 	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
-	if (IS_ERR(pctrl->ctrl)) {
-		ret = PTR_ERR(pctrl->ctrl);
-		dev_err(dev, "failed to add pin controller\n");
-		goto err_pinctrl;
-	}
+	if (IS_ERR(pctrl->ctrl))
+		return PTR_ERR(pctrl->ctrl);
 
 	ret = lpi_build_pin_desc_groups(pctrl);
 	if (ret)
-		goto err_pinctrl;
+		return ret;
 
 	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "can't add gpio chip\n");
-		goto err_pinctrl;
+		return ret;
 	}
 
 	return 0;
-
-err_pinctrl:
-	mutex_destroy(&pctrl->lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(lpi_pinctrl_probe);
 
@@ -592,8 +586,6 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
 	int i;
 
-	mutex_destroy(&pctrl->lock);
-
 	for (i = 0; i < pctrl->data->npins; i++)
 		pinctrl_generic_remove_group(pctrl->ctrl, i);
 }
-- 
2.34.1


