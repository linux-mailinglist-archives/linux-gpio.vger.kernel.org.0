Return-Path: <linux-gpio+bounces-36781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ+cKI20BGplNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:27:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E450853807A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 278D6307D754
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AA14DBD73;
	Wed, 13 May 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/Ber0gZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTGc/y5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7C4C8FF0
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692637; cv=none; b=mz8ZPPfPgPYQ1vc57KYtHNbKna7nXgVsEClj/yEIZOuh27vxcXrXa/JdEcWNxqUX2ObTtw0N13hbuUaBLE/ks7mCuwNUYYOLmsjZ2+ccllym7Jm2noRytVIMa+DHxA9oLDnrOjIgWaUzwOss3tc0p5m4jCAEhVC9AIeMh+U8eHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692637; c=relaxed/simple;
	bh=O7ZY1AdiQuRGIWpyaBs7jFB0+sTG7KoUgEQpHyRFuKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkJYOsP+o0gXoX6U+Qzw0XyfR4NfJihvidsR3Ixf7IrTIZnHG4p1rVN5H6Q1gNh1OYZwAQlWJmB0hzB/BEe/mjPovZAGq3Pt4ZFRfwdvfdYId0dZ3EHgy0DgyskFW/7LB6BX3bzfhP9Sv0bi1DC5Oq1Gkz8oeHdBOFnIVw03Y9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/Ber0gZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTGc/y5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEZhBl2887848
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=; b=a/Ber0gZAjGFbcyA
	DcLnT3cvWA0zHeuNw4CkdOV9sEaTHQ/CC5QhPsSiBi0HD/gY+hUW42xDhJmRWHr6
	DK7/4Qt+fclHFLvyZXWSuA23qblGmuo8QNq7M0vhEkaF9NZCBHKAKdreKyf4tpep
	9YZEw+OxxdKy8jFsPUIQhmdBlueZ1UXJCZ+aL8DByt4dO3SgGrp51ypjJfQS9qiy
	iGGcIlr2wWoqGp3TnDLw/f5mpt5kgXvR76/zbPTo63RfRtrPH1v3fPErVKt07jtH
	seb8k8GGNF4ttDv15ylzVPG/Yt6I1fkP/N147zI5Wl7OIHVQL/vxs111nUqC3pv9
	Y8hhEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gj1nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so14226730eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692625; x=1779297425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=aTGc/y5RfbNYvSnddW4ZatQyEy/Z2ZfzC6xyzHkm9VFfOUsi6tdubGOpoICmSz06TA
         py8zTZuMdlVtwCyFF1JW9V38Gy9pd9fa0ofR8FhIYzg/Y8nHkuyVu/iAQ0B7b+0SkJac
         DrCQzUL/KX4aFUK/xF3VjdUFbh7LGEPHsEkQuKTzpaAvZOGqFpFjYkS99mG5HoMnjtSu
         dI9FVrhxQVpw5PBqJf+fwL9zSfYahLjY0K3OAKMTquEt5i9EkoS9S/KMkQ6cAhAhfYEK
         YIU+RpHZltw348Tj4jadh2RKdQ3XaWsRaelvKbt1hqIk92lOewjWfC6uvV6EQrJV7vBr
         ZPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692625; x=1779297425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mphgcl1+U0NC2VWtzWc6ce3S3u0PqqqNtDbXw6C9h80=;
        b=TkAnXqUetnP23Jyxp3SWDpWti69ot+YHorGAnofIs3AIjrGl9tZNbMdhPv6Ft4P1V7
         D6mKGXVQBjf6dZgAQMRs5gjebKnva1bHiFOl5QRqRWF+SDn16g8DiLpuvgoBU8iEYJPV
         XQrpsRwzizB/oU7VukY8eix26XH7UuUASUOuqkNMvD1sqshWHbYHcABhMURRfEs2UAP6
         yD1EZTEa+iTCJ4gh6jPkMnt46z+uuokzZ9vFHXL4RO2LHIYhvanf2VnXFY6t9ZcqibA8
         6diFX5iaoiY5wrtN9KYo4UkmD/bp5fcv7klYaxZGYT32AQBsyo+Awf0qanLppe35/RCJ
         Dz+g==
X-Forwarded-Encrypted: i=1; AFNElJ96xYVw+qOyaEyQMVOj2l16Th7+llScmVT5RwuMOiBkTdJoBCH5WAXFJyJyBmSmcTRRJnx7roy7u2cm@vger.kernel.org
X-Gm-Message-State: AOJu0YyZAxxGqyOLRAzjhVP94q5ID8o4uvugMUlIm4B+7iyL5NtWxo+o
	WoR80xPZXnVaRBuFLfexcxE29FRwvkeC8XLKESGKRifbYSO3qruy0SzwASBeSJVNUlq/K6l/Ebb
	dUAeLMWrduUdZGKwBY6C/ndviuzOFcVgSKZOPMDZ+2wbEm/oB50A+n4+aSjVL9OPi
X-Gm-Gg: Acq92OFmCx4PkXl6PGQ9Qej7mA+zqIAe4EX3HwsClk7WBXP2rSLqT3LXnGTomIHPJYi
	paA4pFUeiJrZSvT5O3FuTK+SoLRSQQEAWPXkjq1kil5NyZnVLBtVGjSdk4hCizCd3ezZvuhfPSO
	xR+ISO1YITGxQjKjvE8ym3ETgNxgQrrqepeZqrfSqzot6dFt4pvuH+jOsmZs8ApXr3clIMne89K
	iWDHyD3eFportjgV+QBrhFVy7s6/9E7UxN1o4T+TrwTmTG9Ws4CQF7aYLGZveDLWlPcJ8cRDeIt
	fmqPXnvV+wJrtRH3GA4pO3SQUg9/Jl8DCKwPXuHNkdFXd5HQhHsWUkt9a4Dxteykjgfb6qNxRfY
	cn+MI/s1sWFv9ia0mV24PsNMaQgZinB2MhXy+50msTWfxVDTG9iDaeZ3cQEaO+BHH3SaKCJm+SL
	p1E5l06w==
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657888eec.1.1778692624717;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-30116f8cbdfmr2657833eec.1.1778692624174;
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:03 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:57 -0700
Subject: [PATCH v2 4/5] reset: reset-scmi: Log number of reset domains
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-4-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1390;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=O7ZY1AdiQuRGIWpyaBs7jFB0+sTG7KoUgEQpHyRFuKM=;
 b=jxL4jV0oBZIyrWaKzHWraW6cLXO/KQj3WbcU2TE/4/0plegLFbNVGLvl0thcoqS0D2Btudgxl
 UpfJ6sQLaoJDGpSTD2IgN9J/pGAioz38x5frXs1rnPofpkMniCZtxas
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: Th21Za8v6zOzWfXIeVYnxhmh0qzSDtb7
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04b211 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wud5Z5ZUIjVBoUaN5zEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Th21Za8v6zOzWfXIeVYnxhmh0qzSDtb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXzv6+UdiJm/kg
 dgsHto/qgu9QMnyuS41OjpS03o32l9jxMD9sFk4UYRe8uulF+c+XHF5UopB+CvN4inf0nh/z9ho
 kIhtucxDgwoLDfMictYDAH52P0T9uVwABQiKjHBtzkxyNR2rOaNl2hSkqrCwDwgVgeRURxHUZZN
 wzQ3Xc2o9IUgQWpnATC8L1k0K+d/2mtEqn/6jRVjSdP5Sym7uVhoi8X6sDx7OWzqeP+AgE0TdFx
 FzsqNG4oVlsLtCIx/zZ1emoJ8vSkIZPlsmeX+i8qEorBU4qS/wR1v+fVc+dk/QgFa0enrAOORO7
 iYmQaKTAfotQIrZgr2xxTXx3MmOcy6w3FCg7NGSSeksklMApih8EM1xIDh9e5v0Wik84AkcVfIf
 2Tkkp0fcwyKotNO14tWl1dzuu9Qdie6zmI/6XdauVc/U1jthdr7mruCCB0QhTWftwBHTnj2yGKb
 /+gzulb1w75DS+zcpMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-Rspamd-Queue-Id: E450853807A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36781-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI reset driver does not currently report how many reset domains
were discovered from firmware during probe. This makes it harder to
confirm the firmware reset resources during debugging.

Log the reset domain count after a successful probe, aligning the driver
with the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/reset/reset-scmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 4335811e0cfa..114470c12931 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -93,6 +93,7 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	int ret;
 
 	if (!handle)
 		return -ENODEV;
@@ -111,7 +112,12 @@ static int scmi_reset_probe(struct scmi_device *sdev)
 	data->rcdev.nr_resets = reset_ops->num_domains_get(ph);
 	data->ph = ph;
 
-	return devm_reset_controller_register(dev, &data->rcdev);
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d reset domains\n", data->rcdev.nr_resets);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


