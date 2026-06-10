Return-Path: <linux-gpio+bounces-38258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Moi0MQxnKWooWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:30:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE8E669C17
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:30:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oEVLpMVI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LysTL7yt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38258-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38258-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 407833012E42
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEE340912C;
	Wed, 10 Jun 2026 13:29:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A62222582
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098171; cv=none; b=DNkzNyUDmZDEueVExuZUULYq/UHs0YYq36e4szpKGMVNRh4TAc3fPBJCJjpdxtYu2OGWOpIjK28piqx+4m/t1mf8epRIysJeUKsgzMRI3zZdrREg/6JIpvm5jBDPdJkgcPd1671wDbkmeZW5J5paRtG2Q32NrsZZsYr+f/5lsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098171; c=relaxed/simple;
	bh=7cqkWupecAEjuf0LKa4gWRkZCaU+GfxcydN7ZxirCcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukrWFHNP1E+yhS8wRMZMbBfAxAZuof/NM6arnAYkdFDS4tiNG4pFfchLdNB1pdT4q9DWwdKBua0wS83BNqSYULbwAcJzpjsAc663p+vwA08/qgTmeLHIYBExN5xpD38fIN+mCY+ClTCRGvpVyz2BYlUxh8SKqtfRAqNy7NLU430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEVLpMVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LysTL7yt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBn6S1169809
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KH5KT/EIE9qQWwWj7RyQL7c7Oy3vRO3qzDk7uheR4/A=; b=oEVLpMVIbO0r3c0O
	EIE/V9FNNybx5UtuI+T42uWsnnJ5TwMGghfcpcyhk9LpFX4zz/Vidw/3Fc20hGYB
	viVTJ7e2gEcfIq0hYOAWx49F3zzIUf1vdSlV2X4145BWp1YxRG2P0cE3f4apBNwE
	6w0mqTUDVHmbLospOORjUS3p2ZyIYMtKM7w+7fADQ9EOvSSJGYl/qAUIQ99vAstP
	uc3n5bbufk+40xKliI44sRFwWPvFB/tx0hKQJXiDgGXKPp+TJ4KuLGkJCxUGTizB
	7hODwKIAGXcCCezj83bHcqXZHQiPn7vbDTnX2t/ccHi0YyzmwAPvYY6CV+IjypMK
	YCsQUw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s0a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963c12f125aso6694445241.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098169; x=1781702969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH5KT/EIE9qQWwWj7RyQL7c7Oy3vRO3qzDk7uheR4/A=;
        b=LysTL7ytk+ymP4WI7VHhdyxxzg4ZcctaOdeUSSEEFgoGgRUD/8vJII3C141arIo6LW
         aiFDbyUyx0uYY1bHh3jylL5nAHkwlMEUd+SPETj0OGqR3f9dqY5VO+Z2UajfdLQqR46c
         QY2XbLjEzzeP2btNoolqSFOS/bbKe5B6kP3R5bwswbPgl/h0wVYTmWMpBIu8chVn7Fm1
         YJNBSYhZIlfnis9j/bLRHobo5+2PNp2uSPOf4pVb515NCAkpGimFy60w62ulpcKikJ5p
         FqTXV8mjvwgueJm/+5xCE1Mw7nkFn2rf700OfFjlaudmvfMOQ+j8fYYbTPW7x3TZdLxq
         A5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098169; x=1781702969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KH5KT/EIE9qQWwWj7RyQL7c7Oy3vRO3qzDk7uheR4/A=;
        b=oNzQOAydm2s5rmsBNkfpbFFksvUGmkIuP1Frku1m3WUmJJUELIRtly5u5P9oC3y/TO
         yabujJU65EVD2BDSLKnc1HzL6BllChaQUH6QJ2qwxfur91E74nqzNMSrFiH9ICtRJ3TD
         WjsfnmM24JCSwcJmrCuFgV1G42kh8IicJ62bOWh+nJqfqD+VQOGmfmFtxYAjTgRuKqTz
         DqLk2r/EvOs1Kzf4uJTa9mCgxkYkimX+gB2rqE+CTzELkV9aGXViIjeAZ8wPLpuVRaqi
         sqg4qpIRQb2v/oY5PzE0ywxWWsIhrydRcI67j1jYNzacfUE28xJWEx1VgC8kkSJnJqYV
         uTJA==
X-Gm-Message-State: AOJu0Yxd3Mu5mTZvwbOBMKLcqLN+Ppyw39GGiCzfTNKwYsR2N4kbUcwM
	TB6Iyp+wgwVO+tXRXI9VVSXpwWuF2o3YQBxn19hLfCFe3oNvY4K9AVwVVdNoldoGQ4Xd3+7bIe+
	QB17vSBZZ6N6a6OttCEZhY1xTnZQu6v5bS7i38otKVYTlaI4+83DH6CTLUgtek1va
X-Gm-Gg: Acq92OGLKF5Q5D0kPE0GQT87ANjq11fsg4szAodPsodHHBu08nq+ETaTG0ei8SoSoCV
	sC35v6hzMjxWX87WQbPh6Mcy3TmYSm3UoOTQ68UNKeaBlZ8F0z2dCNE9VjLnGdnQLNIjel8MjBc
	0xTqWCB0U5q55QhoU0VbwmcZL9fhSXfj1TUFjIKAgjfngxzFCeOQIqpxEZNtp7B9z0PqLgws/G9
	3rpbMEn1WH9eK6E0WXsYBOGkVmuVEB1vbWA4vi1hmS2vUSX5bf4qFyaYLnYbFrAuP21j8+KkZu+
	eEk4acICDS30NC5z3BtggnKFWevrN/h/W/wXbzwHM4g5jx+IaFu3f3O22Y5ONVYnyp4Cbm3pIeY
	5dmOVurPcuZELI3GruDgp57x1XgFXz/BO92Pg8ugKUcvGFc/HMIYyK7ZAEpciMw==
X-Received: by 2002:a05:6102:148f:b0:632:a084:c0f7 with SMTP id ada2fe7eead31-6ff084a6d6cmr12598611137.17.1781098169118;
        Wed, 10 Jun 2026 06:29:29 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:632:a084:c0f7 with SMTP id ada2fe7eead31-6ff084a6d6cmr12598591137.17.1781098168633;
        Wed, 10 Jun 2026 06:29:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm72895423f8f.2.2026.06.10.06.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:29:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:29:17 +0200
Subject: [PATCH 1/2] gpio: kunit: shrink initialization code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-gpio-kunit-swnode-hog-v1-1-37b3bf37096c@oss.qualcomm.com>
References: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
In-Reply-To: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7cqkWupecAEjuf0LKa4gWRkZCaU+GfxcydN7ZxirCcU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKWazmXAj1rBR/x6qZs8nYxR6AJOcHnTFd5m3D
 SYHU9uXVZKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCailmswAKCRAFnS7L/zaE
 w+bFD/9NZnHrUmXqWdtdYG4YM934630YDO1ZSp5+cu7AkXWvhlDJDMYprOx49Nq2cuVFYkJPFVa
 205w9K7GSyScwII2OKtJQzqHuxex5XbQU2zvmdBRuLqrEhjQ0iS2wX7n1Ljx5CnwRXTrEOAsVpT
 VA2uds4jd13ZxgopuRGtA+71JUqqxcolQ/h1X6gyJUrZE8pLXXFxrlMkD0OCYU0Bod7UjnnJxJJ
 E5VUvNxmaOOyBg17MN6R6JVNw1JBOg2X9+wwd6tdzheHFD3RfJWQoUHqlYYiVG1shkq1NQmFlBH
 D2vqi1zOdLtQCTUJrhIZdNQhVmCQlt8AiNya+JhRt+AMr39DdCAvms+VaRH9HaFcjDdhzYuIJXR
 Oy2lxYdMtk7DIqoP8RBqAlN1HYnpE/dtGDbOuJk3wQ0hdBAaCmtJvd3dE1y0gs+k9y7/PRyS9J+
 Vju2iUX1UzE0s1nN9iMc3UY+fnhg48LXuhdxoG1v5jTpz8sUci5oGojkH0zx82JlcLYbg8ITKam
 f9x51Sshm0HH9yWLDSIrhOmRydAKaOkt1FMcs1V2a2V0ASAnxdEca8Qpf46VzpGB+KjxcvvVe8q
 fOEThLJCdgYuuNPDgcpDCDfX+L8vBulERilp8QFMKHyaGci7dfxZUGSVNUrIxEtuZM2HPLe50VH
 WZI3B43HyAEKEZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: GP15OufuQFwL6V6XmmTuFXj7VqwNhygg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX8iddP3aqCXWC
 QfoB5KJvMbBNAFrrTQEBlxYNVkI/pNrJvUERjOMCXTusFzEE/wQgz7vqaKyqSwjuImVaVAr9uSu
 uBypW3gbE8tkY160Ia5HEYUsPJ42WfxsZepJr94nB1LzMClWYEqCg/ToDh7gfrDg3ZE0XcT02u3
 ugBUIIgxJT88ySlROH8FBEF9GWpARnVLJsGb/0cK1xBE8LvJE1HhAtDtUeJcOobHemVCbZLG4qe
 WGedggB8bM8GN3ne1/Kb3lud9JofD85+YUz2qVKmBGNZE+7NDGA+HP/nsCJ4vII8QqQ2DMw4eeu
 /O4xqg1h4rFKskC8P07KCsVXTshQazniIapwLzvoKIQHCo8ifLCk//Q0Qn8xYneP981h7U32gwg
 ktan+CJFQpUdJJp3hLVUawiuhlgjsZGlSNV9zG+S/6O7ZjFuB0SZ78zfjnqPCmTUGoPnCd4fmvv
 Bhpj6Bq2MWzAEMpqdbQ==
X-Proofpoint-GUID: GP15OufuQFwL6V6XmmTuFXj7VqwNhygg
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2966ba cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mQR2GTK49kTnea62ndEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38258-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE8E669C17

We always start the swnode lookup test cases by registering the provider
and consumer drivers. Factor it out into a common function and use the
.init() callback of the kunit suite struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..d6a80ea0354365a0050d7910d2286d6028c87b19 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -91,13 +91,8 @@ static struct platform_driver gpio_swnode_consumer_driver = {
 	},
 };
 
-static void gpio_swnode_lookup_by_primary(struct kunit *test)
+static int gpio_swnode_register_drivers(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
-	struct platform_device_info pdevinfo;
-	struct property_entry properties[2];
-	struct platform_device *pdev;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -106,6 +101,17 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	return 0;
+}
+
+static void gpio_swnode_lookup_by_primary(struct kunit *test)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *pdev;
+	bool bound = false;
+
 	pdevinfo = (struct platform_device_info){
 		.name = GPIO_TEST_PROVIDER,
 		.id = PLATFORM_DEVID_NONE,
@@ -149,7 +155,6 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	struct fwnode_handle *primary;
 	struct platform_device *pdev;
 	bool bound = false;
-	int ret;
 
 	/*
 	 * Can't live on the stack as it will still get referenced in cleanup
@@ -158,12 +163,6 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	primary = kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
 
-	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
 	fwnode_init(primary, NULL);
 
 	pdevinfo = (struct platform_device_info){
@@ -211,6 +210,7 @@ static struct kunit_case gpio_swnode_lookup_tests[] = {
 static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.name = "gpio-swnode-lookup",
 	.test_cases = gpio_swnode_lookup_tests,
+	.init = gpio_swnode_register_drivers,
 };
 
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);

-- 
2.47.3


