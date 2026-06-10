Return-Path: <linux-gpio+bounces-38259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kZV6C0ZoKWpsWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:36:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DD669CD0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D0WUJZeh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="VFlCL/Ty";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38259-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38259-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07CEA3363D48
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F05409E0A;
	Wed, 10 Jun 2026 13:29:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54D409630
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098174; cv=none; b=bGhh0g0a5Om0eHS2qBH28wslpYGkXhAIYUPLXebtrwe+eMytWHEI5QWw7mR8LuQXqE/G1CS/r7jVsg6MLQuzrLGR/4StQyhzqPDwO6wEZpThvtUka1rtJWWMqpY2Yzxa3I71GPRMS+JRG0mAtFtk+07kRMwp/2E8hlAOqYL/Xpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098174; c=relaxed/simple;
	bh=MHcyiEOqnDHhxawId2wiL8dWJjmiX5OYwuCOKDZ4Ofg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0AY84+G/Ooja6s8QDX79AzqBMXLuSBgddpg/BGnElKrva/U0FTz1kIGiE6Jyn5TOfIt8Ov05FR7ORCfWg6EVfrDSQVxLLoybBNZN1RQYZP0ZEAVaj/AycxvYtWAKyWajYVMUP3xAtLxkaR9pIN7faBmKTvNUB5BkbmPzQjORtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0WUJZeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFlCL/Ty; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdQe3763309
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWR36xdmBb9qT7bk5frqIZSzQSwYzSERg5EXFZ5Fd20=; b=D0WUJZehPpYwTVfi
	YsfTVxGLoxW3LlHprrS36kY3ARdgDa9ZqzQeA38b8ZItWutsjhV5iCmQNFeoSOMU
	Q6Of6t5XUiG9USreMr6mglRY703Qf+CN4rlJm6ryD4Y1ZJn1JyD2yTRlLwgW1c6j
	Uz4nkUbB7nJOtZrwYgwmsQtnvRU5QM8gu9g/GqzbM/O5UXs/R9u/eIltue0O58pr
	e8REaP824q/c6GcpWffhXm1PmCnwNrnSwUfRrlJZNXlCjNpbV7mWyL42Cfypb2Pq
	SS1N0KybtVdLFL1FZmmpzKUybqdTfCZeipNOZIBAav0vufXJlqf4M7uDN91zHLF/
	X5Jk2w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetn60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:29:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so7421827241.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098171; x=1781702971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWR36xdmBb9qT7bk5frqIZSzQSwYzSERg5EXFZ5Fd20=;
        b=VFlCL/Ty/kfGfz5F7sBT/qgu18aJ1MaQibG7I+FxMpkklR6+vXVNNMLuQoLrP4Kh+x
         9NYNgTCp+oKnFQt3Ufjua9WQRbWisf6NS0rxO21U/UlOgcfU0a6mOfjliBqpQluApWDq
         d3oftzkNAsFG2ts7SddxwGBWZ5GklQ/YQoYipqkfY1lExnxrZgo5C26lDApTvF9Ewm7q
         rFtwcDaVzTLBck5L6+6mHu11+G/6ZjPFMbHL3nnA8D1jcV0X3gv22XZ9DpDhsz9nEoiE
         UsNg02abvpfUbpfXq17AyLI7q06Ik4og8y+wX3r1pHdkq2gXV1zc3LFdTBRc/ev5RT/f
         yt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098171; x=1781702971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dWR36xdmBb9qT7bk5frqIZSzQSwYzSERg5EXFZ5Fd20=;
        b=phNqvFE3ckY1T3nz4WcKrHmhJ07R4cAidTlGn9l0TsBsYzcWkbnqVcdHZowGHa1drC
         h/NL/H3E7ArrgxLkJqx8CK1aeL7vHCqi6jfrQEwz+e1ORBqdv+971aCkNsKislklLtkQ
         P/0ONijf9GVH2t0eW2Hrma+LrIhI+ME/GKHBBolwj5Oq9hIjgyZ5juAPpAp2DfamczvS
         EuC4+gQfaWViNTvX9O+4kdF0qdckSXvmK2s+jvI71m1zAFp7bKUXjmU4L8ChZxMaqkdf
         iLxoTwB1n8j5DWXTrgfEoTjoys6LBgpZV4oKRnnj0ZJy09Acf71we5LtCWFfFahh7fZ3
         0MUQ==
X-Gm-Message-State: AOJu0YxpROx12R/ItlbeOjdlA1wL8iTFb0RgIzZhRWPsSVbEC0yIfK4L
	wbpkPhFB8bye0QgM8kPB8FYqBajztqXbKYf6K6SxJoNMVK600/BQARW1QYS2PxAUWEyX4ixJ6t2
	dRrhefYrg5IywNqXk2teTBDqpbGSyK/hKw+LH/GxwV2cfvAIMmZ/fUX3Tz/NAPWHA
X-Gm-Gg: Acq92OGMmyscoCibbGPoLmEoeVEYghIUWlRMP2O1bosSGDimNgvsirY+J9/Juf5DldG
	7GW00/vTVvwdW5J0gpug77haZiNYPJc9zNDgB/Yw1H8NuTfDBex1kBphKMttuyTFxTpMYVSAce3
	jjdAzxSPYVraHigVvy11cHaFbGcFkZbRv6a5jen7kTuRypymGv4fBgZPcSJ6z0rPxUpw36p9WzY
	zKXuiYDdmFzJUIpqR/b5trKilaEiIHngEdJMyUdXoq/ZCQITNrU4mSEEKaXugTJSfo7CbQg5gms
	36RgFfnEJRNKrDi05jzAD4IyjgMB6ctkOG/kK557Wyfq2b90yojBH4o74cYmEUkzn2if66iBUZE
	1IChe88YBkxmmbzpGADBx9etNxcKv2xmhnJx4lj/caQFdjh39c4WyDIauoF0yEg==
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr15172967137.28.1781098170893;
        Wed, 10 Jun 2026 06:29:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr15172895137.28.1781098170224;
        Wed, 10 Jun 2026 06:29:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:528e:d8e3:7d1b:c55f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm72895423f8f.2.2026.06.10.06.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:29:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:29:18 +0200
Subject: [PATCH 2/2] gpio: kunit: add test cases for software node hogs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-gpio-kunit-swnode-hog-v1-2-37b3bf37096c@oss.qualcomm.com>
References: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
In-Reply-To: <20260610-gpio-kunit-swnode-hog-v1-0-37b3bf37096c@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10691;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MHcyiEOqnDHhxawId2wiL8dWJjmiX5OYwuCOKDZ4Ofg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKWa0i/P2DKS2V+4+tKpc98Dk0xobtfmSdJLVA
 HGPI3beeuOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCailmtAAKCRAFnS7L/zaE
 w0+bEACDQWChYDS9OXMe4Nk6dR2NDDogCnAxyC/yaPG8xBxO7K3fOZpSwmAKxzlGINznWLwR7GW
 SOchZR5Gi33lGAHihbdgcW+pxbAwblSlXSs9uTBXzD2Wt+vONCqS84PENvPMxA/+0IIB63B6APB
 aLw6A2/Hc3UZKL5rQRES6FXJ0QuMEUcnj0m01982fQQivyZKHebkWLXoLJBMBshI3G+f3LKK7TG
 a8wUC5odLikPRMg+6moiXp4tb4zdSLyqlbGgTZS+y62/B5VdFEIF2bx7mWZbg3BDDIc/wTGHOcS
 qm70LZtDq+nPkHFHMa5UDbzpb36kzwJt9H11AkY9qL0hNlrfEFSx9Zt1HdbPo2FxtCaVNQJofDq
 VxxjJNGIy9j00tuK4D4pTFch94HTaCUQ8xiyE3U08f05mGm7O7zdQiKF28PXLxHszCE3u8RHc4X
 bwk7qYj+Rko86OEQw1f3XeW5bcm7974TPSDskcKFTrZK7ZTmddXAhbV01pPEUENtjUlA2M2rQGz
 r4Lfx6I1Die4iv6O/7Znm17lif+Yxoe+2T9wlcJOyzLoyxi72lapKVj6kzn9cxNja00X/E9y10q
 8pclIgzO/uslNuk5o3edmEQ5wFYaRdYKu90q2amYRxX56FF4RQgCQNgLVkdXjHC/gMteaVTKIhr
 NxjNs4D8JmhRKIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: P1Xtq8fYpU80Zy1hb_CI1n56qyJiu0Te
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2966bc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JZutci34wyGWNvv-UksA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: P1Xtq8fYpU80Zy1hb_CI1n56qyJiu0Te
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX3Qa9hqpyBo3S
 UajCZC1htJVd60EGS5wQD7e8lF6sLt6P90VPBtlTG4zUmbOQnkk1vdcse+m9MhkaMtIiXshcgSY
 uX3urb+9Mg6nY7C+rQKLIde0qss4mP/ilOisk0PcvF+76bZkgb629NjbOa0i+cosqQWgPYdiG3B
 cuSZ6KqyRHW56XaexG7+LK4g4LvMTuB29QbWFWJ4+S9pnbIiZmricRx+AYV0AZBIvGZCJfc9eJo
 cM+rrRzcLKGpDg46djg6ExDywPeMvEFagGVLo9JZ0B4o6XI1HFYVXRATniLLuTqvicm/qKIGMJe
 7WA4cFVNZ/zQFYZ2+aca0DUIEfp6QQd/CCdxKXKgfA1NCbntBOWOfFRGl4Gv5jbYxNexPOZXWBq
 9DmQSWb7xdhcr+Ba2YE1yDpx1nQb51eMtZPKl1XPkq1Ug6dTdKjF61/UAE0iPCYy3fCv0Km3mJj
 WbS+2NnNWuwvt/3US8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38259-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 766DD669CD0

Add a test suite containing cases verifying that GPIO hogs described
with software nodes are correctly setup by GPIO core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 254 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 249 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index d6a80ea0354365a0050d7910d2286d6028c87b19..c9c5b437482012cf9dbf8d593fa686e248ea1c88 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -18,19 +18,67 @@
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
+#define GPIO_CONSUMER_NAME		"gpio-swnode-consumer-test-device"
+
+#define GPIO_TEST_PROVIDER_NGPIO	4
+
+/*
+ * The test provider tracks per-line direction and value so that lines can be
+ * driven as both inputs and outputs - this is needed to exercise input as well
+ * as output GPIO hogs.
+ */
+struct gpio_test_provider_data {
+	DECLARE_BITMAP(is_output, GPIO_TEST_PROVIDER_NGPIO);
+	DECLARE_BITMAP(values, GPIO_TEST_PROVIDER_NGPIO);
+};
 
 static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
-	return GPIO_LINE_DIRECTION_OUT;
+	struct gpio_test_provider_data *data = gpiochip_get_data(gc);
+
+	return test_bit(offset, data->is_output) ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int gpio_test_provider_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_test_provider_data *data = gpiochip_get_data(gc);
+
+	clear_bit(offset, data->is_output);
+
+	return 0;
+}
+
+static int gpio_test_provider_direction_output(struct gpio_chip *gc, unsigned int offset,
+					       int value)
+{
+	struct gpio_test_provider_data *data = gpiochip_get_data(gc);
+
+	set_bit(offset, data->is_output);
+	__assign_bit(offset, data->values, value);
+
+	return 0;
+}
+
+static int gpio_test_provider_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_test_provider_data *data = gpiochip_get_data(gc);
+
+	return test_bit(offset, data->values);
 }
 
 static int gpio_test_provider_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
+	struct gpio_test_provider_data *data = gpiochip_get_data(gc);
+
+	__assign_bit(offset, data->values, value);
+
 	return 0;
 }
 
 static int gpio_test_provider_probe(struct platform_device *pdev)
 {
+	struct gpio_test_provider_data *data;
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
 
@@ -38,16 +86,26 @@ static int gpio_test_provider_probe(struct platform_device *pdev)
 	if (!gc)
 		return -ENOMEM;
 
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* Lines start as outputs to preserve the default for lookup tests. */
+	bitmap_fill(data->is_output, GPIO_TEST_PROVIDER_NGPIO);
+
 	gc->base = -1;
-	gc->ngpio = 4;
-	gc->label = "gpio-swnode-consumer-test-device";
+	gc->ngpio = GPIO_TEST_PROVIDER_NGPIO;
+	gc->label = GPIO_CONSUMER_NAME;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
 	gc->get_direction = gpio_test_provider_get_direction;
+	gc->direction_input = gpio_test_provider_direction_input;
+	gc->direction_output = gpio_test_provider_direction_output;
+	gc->get = gpio_test_provider_get;
 	gc->set = gpio_test_provider_set;
 
-	return devm_gpiochip_add_data(dev, gc, NULL);
+	return devm_gpiochip_add_data(dev, gc, data);
 }
 
 static struct platform_driver gpio_test_provider_driver = {
@@ -63,10 +121,12 @@ static const struct software_node gpio_test_provider_swnode = {
 
 struct gpio_swnode_consumer_pdata {
 	bool gpio_ok;
+	int errno;
 };
 
 static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
 	.gpio_ok = false,
+	.errno = 0,
 };
 
 static int gpio_swnode_consumer_probe(struct platform_device *pdev)
@@ -76,8 +136,10 @@ static int gpio_swnode_consumer_probe(struct platform_device *pdev)
 	struct gpio_desc *desc;
 
 	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
-	if (IS_ERR(desc))
+	if (IS_ERR(desc)) {
+		pdata->errno = PTR_ERR(desc);
 		return PTR_ERR(desc);
+	}
 
 	pdata->gpio_ok = true;
 
@@ -348,9 +410,191 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 	.test_cases = gpio_unbind_with_consumers_tests,
 };
 
+/*
+ * GPIO line hogs are described by child software nodes of the provider
+ * carrying the "gpio-hog" property. They are picked up automatically when the
+ * gpiochip is registered. Each hog below sits on a distinct line of the
+ * provider.
+ */
+#define GPIO_HOG_OUTPUT_HIGH_OFFSET	0
+#define GPIO_HOG_OUTPUT_LOW_OFFSET	1
+#define GPIO_HOG_INPUT_OFFSET		2
+
+static const u32 gpio_hog_output_high_gpios[] = {
+	GPIO_HOG_OUTPUT_HIGH_OFFSET, GPIO_ACTIVE_HIGH,
+};
+
+static const struct property_entry gpio_hog_output_high_properties[] = {
+	PROPERTY_ENTRY_U32_ARRAY("gpios", gpio_hog_output_high_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "hog-output-high"),
+	PROPERTY_ENTRY_BOOL("output-high"),
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	{ }
+};
+
+static const struct software_node gpio_hog_output_high_swnode =
+	SOFTWARE_NODE("hog-output-high", gpio_hog_output_high_properties,
+		      &gpio_test_provider_swnode);
+
+static const u32 gpio_hog_output_low_gpios[] = {
+	GPIO_HOG_OUTPUT_LOW_OFFSET, GPIO_ACTIVE_HIGH,
+};
+
+static const struct property_entry gpio_hog_output_low_properties[] = {
+	PROPERTY_ENTRY_U32_ARRAY("gpios", gpio_hog_output_low_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "hog-output-low"),
+	PROPERTY_ENTRY_BOOL("output-low"),
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	{ }
+};
+
+static const struct software_node gpio_hog_output_low_swnode =
+	SOFTWARE_NODE("hog-output-low", gpio_hog_output_low_properties,
+		      &gpio_test_provider_swnode);
+
+static const u32 gpio_hog_input_gpios[] = {
+	GPIO_HOG_INPUT_OFFSET, GPIO_ACTIVE_HIGH,
+};
+
+static const struct property_entry gpio_hog_input_properties[] = {
+	PROPERTY_ENTRY_U32_ARRAY("gpios", gpio_hog_input_gpios),
+	PROPERTY_ENTRY_STRING("line-name", "hog-input"),
+	PROPERTY_ENTRY_BOOL("input"),
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	{ }
+};
+
+static const struct software_node gpio_hog_input_swnode =
+	SOFTWARE_NODE("hog-input", gpio_hog_input_properties,
+		      &gpio_test_provider_swnode);
+
+static const struct software_node *const gpio_hog_swnodes[] = {
+	&gpio_test_provider_swnode,
+	&gpio_hog_output_high_swnode,
+	&gpio_hog_output_low_swnode,
+	&gpio_hog_input_swnode,
+	NULL
+};
+
+/*
+ * Bring up the provider with a single hog child registered and verify both
+ * that the line was configured with the expected direction and that it is now
+ * exclusively owned (a consumer asking for the same line fails to bind).
+ *
+ * The provider node is referenced by the device through its fwnode rather than
+ * being handed to .swnode, so the device takes no software node reference of
+ * its own. Both the provider and the hog child are therefore test-managed and
+ * torn down (child first) once the test case completes.
+ */
+static void gpio_hog_assert(struct kunit *test, unsigned int offset,
+			    int expected_direction)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	struct gpio_desc *desc;
+	bool bound = true;
+	int ret;
+
+	fwnode = software_node_fwnode(&gpio_test_provider_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+
+	/* The hog must have configured the line with the expected direction. */
+	struct gpio_device *gdev __free(gpio_device_put) =
+		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
+
+	desc = gpio_device_get_desc(gdev, offset);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
+
+	ret = gpiod_get_direction(desc);
+	KUNIT_ASSERT_EQ(test, ret, expected_direction);
+
+	/* A hogged line is owned exclusively, so a consumer must fail to bind. */
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    offset, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
+		.properties = properties,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
+	KUNIT_ASSERT_EQ(test, pdata->errno, -EBUSY);
+}
+
+static void gpio_hog_output_high(struct kunit *test)
+{
+	gpio_hog_assert(test, GPIO_HOG_OUTPUT_HIGH_OFFSET, GPIO_LINE_DIRECTION_OUT);
+}
+
+static void gpio_hog_output_low(struct kunit *test)
+{
+	gpio_hog_assert(test, GPIO_HOG_OUTPUT_LOW_OFFSET, GPIO_LINE_DIRECTION_OUT);
+}
+
+static void gpio_hog_input(struct kunit *test)
+{
+	gpio_hog_assert(test, GPIO_HOG_INPUT_OFFSET, GPIO_LINE_DIRECTION_IN);
+}
+
+static int gpio_hog_suite_init(struct kunit_suite *suite)
+{
+	return software_node_register_node_group(gpio_hog_swnodes);
+}
+
+static void gpio_hog_suite_exit(struct kunit_suite *suite)
+{
+	software_node_unregister_node_group(gpio_hog_swnodes);
+}
+
+static struct kunit_case gpio_swnode_hog_tests[] = {
+	KUNIT_CASE(gpio_hog_output_high),
+	KUNIT_CASE(gpio_hog_output_low),
+	KUNIT_CASE(gpio_hog_input),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_hog_test_suite = {
+	.name = "gpio-swnode-hog",
+	.test_cases = gpio_swnode_hog_tests,
+	.suite_init = gpio_hog_suite_init,
+	.suite_exit = gpio_hog_suite_exit,
+	.init = gpio_swnode_register_drivers,
+};
+
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
+	&gpio_swnode_hog_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for the GPIO subsystem");

-- 
2.47.3


