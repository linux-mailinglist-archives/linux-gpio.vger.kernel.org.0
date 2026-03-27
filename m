Return-Path: <linux-gpio+bounces-34250-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDxMO4Jixmm+JAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34250-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:57:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED7342F27
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E36430CDB4B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BFE3E4C68;
	Fri, 27 Mar 2026 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7a3tUsa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5qToxGh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78C3E3C54
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608567; cv=none; b=OeOLjJhnc/okjvY/+APPH52+SNovWpLco0O5vT5x2QZ2mPec2tqiqpYgZHAiMj6FMH2FsziTcz2sPSqYkPiXv+V1uOKZdXoZCaV1cugziXHGNdPnLfO7pfYsbNbDSLUPOj6rf081RvVqAFxj168Y9+POF8AoCwe4B0Mqy7Yx0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608567; c=relaxed/simple;
	bh=XuIPI4ieBoEl2z7TePLiJbxNf6IybKJInbnNQo0jmzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDc/vHp4N2PTAbbsPkHfFKplYRZUFqNH7dxLvAlNpOMSvMKsbF/DZumc7tHfhExzse5SbtlrLer3U59UoGcHCx+wF69Qi7ti/ugWryziBsNFrq6cfuJG28eUm3LqfF/gV+lbHJhC+AT3Z4ZKaKv7o6dznr+a0MrbefIRIlmjqkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7a3tUsa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5qToxGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w8vl3132258
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/MgRnxQcAW10ujPvz24jsVPOtUwPkJbS8tZTcpuIFI=; b=I7a3tUsaussnunkK
	fQ1PbUpep02E/EynskQfvlyHuvQlYbKnfOzwASK6/5D7WDXyHG+saUlhRiDGHZc0
	aOum1NSv5CBHOqIckgcilDEfN7JbqPt2hBPw5UMklqnKFqyQUFdLnAzPR4dzY9Nt
	SwnfcI6sUjYCvKk6dj1qQDIHmCgoj/Zr3nWkvYbbFcwFgL6miF4hO09Otio84KSj
	IsbjYIExsXgbTjnSWyWF3zFXvGSSCk3fxALSvBM3ccZa3cKTDz6nOv1JR1RENsYQ
	XX1B4qiB6sSLX5HoInheFwM9NrBiObdWsR0rBBr4WcECpArm7TASgX+mu5sRmBDa
	gKlI1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s434kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 10:49:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso29622211cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774608564; x=1775213364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/MgRnxQcAW10ujPvz24jsVPOtUwPkJbS8tZTcpuIFI=;
        b=g5qToxGhl5Uzh2kwo1lIsrUmDbjH2T96YDV9KE/ZNdZGJb2Q+EwHSxxC3kGUMHjZLN
         7pHZa9MMtK1pZ7V524mAmruYygATWavotkwdv1cKl2uBxXpD2U2TdiDwWYtyjwVsiK5E
         Dj12NR5z+6HaEg8QxXX1iNBt0rzptY4FIEdhuqhshOZksvtIMXLaBSzl9RSn9rI/peg4
         irNh91aBP5F/dXV6Rx007aeW7Pr89YWVeuWx28Xp4ohKB1wj0z7c6MppfAnO5T2/LnBk
         JBmV5qCnSBztrza232YqWOblWLWvjEEIycoSGJfLKIgclxHnOLVxuV9mgBN0/CtuH6Ry
         +h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608564; x=1775213364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/MgRnxQcAW10ujPvz24jsVPOtUwPkJbS8tZTcpuIFI=;
        b=RJtMhVlA5vHtBbu+sohmsKBA8NsD4DLSZpx4x/n0JZjcANFYecYCXmUQqJQHysz9IT
         +925iKdkCLnCwxObecFsFGY2otwWzqdEu1SUQbW4dJRYGXtDbmLmTza4hnlXhNsDdT4k
         NMUAOVTOwoswWDkomvKnBsAYbI+tf6DXVNp6HJcy/SnyxvEZalOy0FdH7vMvu1tKkUc0
         vBKzvQyKWVy03X9wPIHPAgY3ZRENGYMcQxdjiioEQ7t479aqit3fGpopTgQtLQA8Y3+5
         YPMvT/NmvDADOiCiZCtXuSqE3J2ojolLpBYUq2l3nZxHUzvH+xka398aPHU07VCqe+i+
         UD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCULGtppbHeyXDNWlaqcZ/HnaZVz84ujjElAMtCyRDGkSXjdeJQWgXeqR/FBjkCmExQJQjZ14Q5jB2WP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5J47eiJp0xp4CbNB2WgeZDieuaDBt/+uN0kxCaLi69oV7J7C
	ehGJi/CsvFLt87PGl95qeqvnBpvlWn67xKmzskt/LIT/s3J5D8LVpI5LNeU+Hq5njakJxc8P4q1
	XR+2Mzwgh+J4jskfzeb1b8W1f6vSRsBdBIGJDbBqiIR0vQzPtZRRIwzYHbbnu/DoYBMxmOtAR
X-Gm-Gg: ATEYQzy7KfL0lksDiUKWjnWBwBmQ6o/eH7leI3U73hBZXa44BnPz/tRnFKvE88gfWsI
	6hD5Jv96XAh0kAM9uF+hVs8C3DKGBy0jjg6NbeTevqlV0RRkYuw1zI6/HFurmPHSfQO0AbTmCE4
	kVUsYagOoKd524UMOjTPlKjOSm32D2NWsJBb0nTI92BJVghYz812ioW9exZBkBwDXe5iNe78IJI
	fN31IeiDevleVOCKDk9F/hduASh3n1Nb8kdh5GYDvTof7KNTHL7AzS3hjRke9pBr25tGDYAcPSz
	dRB/XjMsiG0S6rpvFId4QQc1AiRIQG8uSrKUnTq6u26Nb5Pot9stOVWj4IjtjNdOxnL75Q1VLtF
	uOH+NBD4UyIPUUqOBGWWBJsDzFHwWbjAVKp+NlbGqsgPy25H6mjQ=
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr23616411cf.14.1774608563917;
        Fri, 27 Mar 2026 03:49:23 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:50b:3f50:178 with SMTP id d75a77b69052e-50ba380ba43mr23616151cf.14.1774608563474;
        Fri, 27 Mar 2026 03:49:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:94ec:a3a:baff:9151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm14989445f8f.4.2026.03.27.03.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:49:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:49:08 +0100
Subject: [PATCH v3 2/4] mfd: timberdale: set up a software node for the
 GPIO cell
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-gpio-timberdale-swnode-v3-2-9a1bc1b2b124@oss.qualcomm.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XuIPI4ieBoEl2z7TePLiJbxNf6IybKJInbnNQo0jmzk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpxmCqbHnz+JQ7fxxuKGEEJIDKi9207XwCNsREe
 K85clTSLP2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacZgqgAKCRAFnS7L/zaE
 wyf2D/9JAtxu14dgjoLaRmQXDik2R1fy36UY1NQNJXziMS53lD4HjRA7QG91OFbLMv7lHmCvr16
 +zvsdJUMM67aUNlc/j36xbGZUNkDCrr0r+jQlQevnu2s/XViQoshfmedPIQl/nYvBtRvytkzBFR
 /zHM4H21TD/TtsjSwaoX9nKj5zQ3sKRarSKKq0S0ThBoAgsB5aJeQu2vWOza18gfNFqVXbK1ZRp
 vRsXolvXHW3//GstCVY+QPsJY/pmp2NJi96l9bhmeiFIXcip/dcGC9Zlz1n7R431VmXLRtqC1PQ
 ffcm8clYnNh3/uMQ4xln7HtO0dj2/M80+qlt9oUuCfpsCuXEelZC+FSUav+asYTyNewOFLHKGBh
 o9y8EuHPS3C8brXNGl9Snr8CKf53L0XLx4Zsa/Zl019ao41JbuMM4NOwRb3BeDquPf1HsLpm8YA
 z3nB/ncR3FBEcBZHHbdCA5FgYUQQv32Ymxy5wCeO29AM4Th1U2meOY7QvAbgmlUSx9Rueoqbb4n
 C0/NRa/kAg2ubRIcWHOwO+7IQxe+aSUn/HIWeTOplR+WTt8Eu8LAnR7rDSu+KFcWot6xJSQCEba
 4PzqUFdXAk6BukYsf6yHVXvs9PVoaoQGMzzdG4Yw3L4P3Xw27I/mLr9aTck3exx7ckmZsIebA29
 5AeZelbNYyx2wYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0VMla4gqPZlNsC5BnaJw_uTX24i8abTk
X-Proofpoint-GUID: 0VMla4gqPZlNsC5BnaJw_uTX24i8abTk
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c660b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XD4rdcNWEOdSxKZ21CcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NiBTYWx0ZWRfXzJuLOqfejjZn
 k6sVFiv5XqWqaPFhDQx9un/VMB83LBD5uBvwgp6wVOSeqk0LWuesSkVamMhtpDM651ejX/yZyWY
 HOQ9dzFqIV3N3fC8Sg5qd8BeIObg2ypwGKC8xoT0y+KyZBQfdHudhhgvVZ6k+cnW1QK8JahOsEJ
 VlbAvygJNZ/KYNLBY3wZYCDK9GOLtH1CPQzNCA5E1dTtBdpUYFEibGotTKDvxedY9CaBbFuoEWJ
 UGAgJ4UR5qGnFYSd2N7IijEXFik7DzbJIjM2Jrl+xsWebyi/xnIuKZm6JPriO2vFc+QuI+mv0aT
 sRo7lKJHwcR4kt75UMh46CPGlkjyk5Y9lqGYeeKkyOFPWqOv+3qofs2FhUQ5PbCKQUL/RX6MYdE
 OIwr9sCMxRz1MZehG5JWVJ31HV3Y6D2YcIjRQvqyV8J1PKDed69V3+oy0MYVV8gaxNSojHt/qL3
 OuZJYx0jll6Jh72oQTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34250-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DED7342F27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using generic device properties instead of custom platform data
structures is preferred due to the resulting unification of the way
properties are accessed in consumer drivers. There's no DT node for the
GPIO cell in this driver but we can create a software node with device
properties and attach it to all the GPIO cells.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/timberdale.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index d79419215cc292b705031a6432e877b94f9a1805..0ab3da3d6818e2108694dcf73f32184a167b701a 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -38,6 +38,8 @@
 #define DRIVER_NAME "timberdale"
 
 #define GPIO_NR_PINS	16
+#define GPIO_BASE	0
+#define IRQ_BASE	200
 
 struct timberdale_device {
 	resource_size_t		ctl_mapbase;
@@ -183,6 +185,18 @@ static struct timbgpio_platform_data
 	.irq_base = 200,
 };
 
+static const struct property_entry timberdale_gpio_properties[] = {
+	PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
+	PROPERTY_ENTRY_U32("gpio-base", GPIO_BASE),
+	PROPERTY_ENTRY_U32("irq-base", IRQ_BASE),
+	{ }
+};
+
+static const struct software_node timberdale_gpio_swnode = {
+	.name = "timb-gpio",
+	.properties = timberdale_gpio_properties,
+};
+
 static const struct resource timberdale_gpio_resources[] = {
 	{
 		.start	= GPIOOFFSET,
@@ -394,6 +408,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg0[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",
@@ -456,6 +471,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg1[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-mlogicore",
@@ -518,6 +534,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg2[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",
@@ -568,6 +585,7 @@ static const struct mfd_cell timberdale_cells_bar0_cfg3[] = {
 		.resources = timberdale_gpio_resources,
 		.platform_data = &timberdale_gpio_platform_data,
 		.pdata_size = sizeof(timberdale_gpio_platform_data),
+		.swnode = &timberdale_gpio_swnode,
 	},
 	{
 		.name = "timb-video",

-- 
2.47.3


