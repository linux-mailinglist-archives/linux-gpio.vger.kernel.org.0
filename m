Return-Path: <linux-gpio+bounces-30810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP37FdDQb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:00:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6749F19
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 20:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80B2CA02B25
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 16:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7074611DA;
	Tue, 20 Jan 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Fm+Ftk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEzK8urQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EB4534B4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924165; cv=none; b=Dgwj+P+J6fuEMq/hkA1hkYUo9NslD7bY8y8bU1e756KWMsYK7ncKk/0v8Uh/6FIdHMDQClBCliFMXCjS5nHOQ8e4zRjiSqrXozdR1PatiJWU2VhXPd8/ulzJK88jQPwIE1kmMHtL+qDTri4pKH+pCEBr1SWXNf/EYnzpA1T276g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924165; c=relaxed/simple;
	bh=+dKM5UJHXy5eoqZH1LcQ36us6cQGiQhtz+1v5l4dfAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyhfCQJASaUKbfpzTOaN7GlwX0iDuaIgfF8de4Zu2tOzGRADnz3ONQtpHdOUNBxn9d7v1gcZdzKTJpDSaN0d1UCu12BR+9zeFCenrKBbGKH9dsplFt9Vsuwr14HLA9tt80AO+PujeXsxS/X4rDQEAcSoCady1XgTa9MM+uj/EUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Fm+Ftk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEzK8urQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KCxEAg801206
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 15:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oFogIEveC3vYSRwV29+tlO0vXVJ7F6l+2wc
	ARiBmJxE=; b=p0Fm+Ftkwsc8FWSZxyetfq/BmP86Y06cfq/ePpbkWZQ045Z5b71
	BdNDxsunl8mOVaGiZjbf9Op3bT1YoRdvH2cYinsV7VJAxHbCDF8hkjPq03E602oP
	KJMw8+y3Ep5qIJ/NKrAHNF4etNyzGc+EVHRhX0iyylK5bcmK7khmdvCwYVCPcUoP
	YfnJY/WpbdnUF9vl/3tLZ9l7onWWILk2U8ynTILNpLUsv1Jj96QiT7zAw/bERlzb
	1FJRb+TnC4oTGashXt6WQWVKlF5hYiSELmxUvl1PS8JenE7+F2kwTxIPgP64lR44
	fkJxRSl1EIv2FanzaK+yXVqtpCx8JSoIZ3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q0grp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 15:49:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6cfd52556so147983885a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 07:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768924162; x=1769528962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFogIEveC3vYSRwV29+tlO0vXVJ7F6l+2wcARiBmJxE=;
        b=kEzK8urQW3vPWqRDPaggQ91Gs3y9DHmNyFZFNMy1vbYMhnsKAM44D/uako9+Rdfdd0
         0Fqkm9PmUQZQMEf7tDo23mPL9fGsrxXMIFt+x7QSrtsan+2OLYTA6Dk62anSaNo7eRxG
         pDhTZ1sAHgvlE6BrZWElwJXoRp41PZ704rJr9pvHZyqj1zIwqaQh0mpJ2ju+eaO4B+xq
         LOqZqHWYfoMaL5bYXCrclC2NbUJH8KhramCA1lz2Ohr4gcuY15OtLG+JbWLJ9X1YddIC
         FFNOEZHynIdCGdy4jp8D/idrtJ10ZGiN4HRZI4S+zIKT0WoknF15yMSlkazRTJCp5suZ
         oZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924162; x=1769528962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFogIEveC3vYSRwV29+tlO0vXVJ7F6l+2wcARiBmJxE=;
        b=kTDQmrOdYjsGlj28J0TipJWiF859DAKpBcJwb/nYuD9/e+egD9S3NA8ZgRmRut0Cfm
         WXZrinergD3B0Q1BSAQT9ltfqDYewrelsfG7t+Wzke02mTglfPbSXeJLBb6XGDZYzGGW
         tpXbw9SNVzJ/8VI6W1loKh9P4QvhZWBM8YonPxoEqa6HMe9qbL8lwmFLuquzhAGtVJbT
         M32KHS/VyzUAVPM1F+ymh9Y/2ejfrz4c5XchFX9G1PQ+dqixdYvCAVQAJ/F7ShT4CD4r
         nvkv7PL5wNkuht2xgx3cJFKXmVz5CpmAd/352bofJI0mY1gK+eBndp4ixKVRgnHeNpSS
         ZcXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRUKSxKUmWhUTmVYM63VPtWg97hoBHx2vZELprEKZY/Ttz+fjpXnSJj4ihUaqsA4BGKbY8NC7DbjA/@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZqOVzl/rQhBljytiy5OLxXF7ngyNxlNsogfL1XQ9Qlw9rdAv
	45J7LmuKBkkZih3MhBb8/1UCaziv4auheo2720y2gZFG1l6BNjDL3cylPfpJpXsCKhu1xXoCX79
	Zq0OKEXKWDWxZVNrWj+v5oFioMesdne23Y2N9QGTmTvYNQrrP4a4UH7Q/TZ2VNuoo
X-Gm-Gg: AY/fxX6U6CbILdGHcGOF08oBO3bF/UQ2Ye8KZVJhWobVSCIlX22wnDfuPoMqXlb+Gw1
	0pIuhXxkJpRcFHIJ1jG8Jj71sOzJp90oCUInBE85xCuWYOZD0EYdBKIp0zgWxnTImO99+bK9iGx
	as3EfTXMXO56S2DieY9xOR6Sa7bznj64VnGOkyKVW2tj7kU67n9IXoycx2Ls9A51t1SXIcNDKuL
	/NSgYV6RZiXn92Lob7MAXKDjwyhFqwkmLCszADGfUE/302PuDYxZk3dUHZ/1T/2h3Hr0++JpJlX
	sI3Y6VJLlRye+G8J7kZv3fkA6N4IYLjaCx9HDzxqsRtjP6b+Wg2KryRawZBeJRVxo8Ez26V1NJV
	1/5BimJMqKxy2pkVahmSMEJM2bi0fMVQM9qbi020=
X-Received: by 2002:a05:620a:10b4:b0:8c5:ee3b:db47 with SMTP id af79cd13be357-8c5ee3bdb6cmr1806846085a.15.1768924161515;
        Tue, 20 Jan 2026 07:49:21 -0800 (PST)
X-Received: by 2002:a05:620a:10b4:b0:8c5:ee3b:db47 with SMTP id af79cd13be357-8c5ee3bdb6cmr1806843185a.15.1768924160938;
        Tue, 20 Jan 2026 07:49:20 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d658:1080:8fdc:24b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm5766600f8f.11.2026.01.20.07.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:49:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohs@qti.qualcomm.com>,
        Ravi Hothi <raviravi@qti.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: shared: propagate configuration to pinctrl
Date: Tue, 20 Jan 2026 16:49:13 +0100
Message-ID: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696fa402 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=_-Igu1BY_wOfoJTKwNsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEzMSBTYWx0ZWRfXxJPPSL/Ry2gV
 U1bpeS4zez6oCLhVGnfwDh7k0FFebsDOoGPsKILTEPfk53bX5Tf9qake6snqR4iGCH4lbmzPdRL
 lWHYGhRHYTs7iKejzdCx0iK8/ThsZyFEL3tL/x5gPo5lvMjaciNfs9HdINs2mqwfmTZBCrWpWfD
 +ih3K5m7MByeNv5WFfpCV77CHI6Qsrf3eP/mC5sOK69rPBMG5prxOSjEltEqE53cmXM+ZDjYPoI
 q94BEh+ITFqFnzYnPi1eHdSr5iq6fp2C2LA5HaUwysZbg7YBRt9pOFxh6ymWSAHN2eHfWwQJDuA
 BrFyIkyrpcFiqSLgliFiG3pK/ADTbG1pzCLuBXx81BOTwgf/9Wf62yBlWGCWPU3YwLchWz9lTEP
 kSlYUOBzjAswQpmrLneIlv3DThJtI8wJ4zyFNfbga7dl5f4WmpAhyb80eNGKBE+KSwzd2temW5U
 S4j8KY/IvB1zGFE6J4w==
X-Proofpoint-GUID: QJtMxAlsRlD52Y2P65prPC-QUK5w7Pst
X-Proofpoint-ORIG-GUID: QJtMxAlsRlD52Y2P65prPC-QUK5w7Pst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200131
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30810-lists,linux-gpio=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6B6749F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just toggling the descriptor's "requested" flag is not enough. We need
to properly request it in order to potentially propagate any
configuration to pinctrl via the .request() callback.

We must not take the reference to the device at this point (the device
is not ready but we're also requesting the device's own descriptor) so
make the _commit() variants of request and free functions available to
GPIO core in order to use them instead of their regular counterparts.

This fixes an audio issue reported on one of the Qualcomm platforms.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 16 +++++++++++-----
 drivers/gpio/gpiolib.c        |  4 ++--
 drivers/gpio/gpiolib.h        |  2 ++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 17343fdc9758..9e6544203439 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -515,7 +515,7 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	unsigned long *flags;
+	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -543,15 +543,17 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		flags = &gdev->descs[entry->offset].flags;
+		desc = &gdev->descs[entry->offset];
 
-		__set_bit(GPIOD_FLAG_SHARED, flags);
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 		/*
 		 * Shared GPIOs are not requested via the normal path. Make
 		 * them inaccessible to anyone even before we register the
 		 * chip.
 		 */
-		__set_bit(GPIOD_FLAG_REQUESTED, flags);
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
 
 		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
 			 entry->offset, gpio_device_get_label(gdev));
@@ -562,8 +564,10 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 				 ref->con_id ?: "(none)");
 
 			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret)
+			if (ret) {
+				gpiod_free_commit(desc);
 				return ret;
+			}
 		}
 	}
 
@@ -579,6 +583,8 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fe2d107b0a84..1578cf3a8c74 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2453,7 +2453,7 @@ EXPORT_SYMBOL_GPL(gpiochip_remove_pin_ranges);
  * on each other, and help provide better diagnostics in debugfs.
  * They're called even less than the "set direction" calls.
  */
-static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
+int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	unsigned int offset;
 	int ret;
@@ -2515,7 +2515,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 	return ret;
 }
 
-static void gpiod_free_commit(struct gpio_desc *desc)
+void gpiod_free_commit(struct gpio_desc *desc)
 {
 	unsigned long flags;
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 77f6f2936dc2..3abb90385829 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -244,7 +244,9 @@ DEFINE_CLASS(gpio_chip_guard,
 	     struct gpio_desc *desc)
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
+int gpiod_request_commit(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
+void gpiod_free_commit(struct gpio_desc *desc);
 
 static inline int gpiod_request_user(struct gpio_desc *desc, const char *label)
 {
-- 
2.47.3


