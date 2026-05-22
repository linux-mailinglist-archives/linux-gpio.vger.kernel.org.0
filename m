Return-Path: <linux-gpio+bounces-37328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E2DBHQeEGqjTwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:14:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 145A55B0F58
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D176300A260
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57DC3BAD9A;
	Fri, 22 May 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIl/1b+q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBCCYcAe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BD3B95EC
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441177; cv=none; b=ZBd2g31MTM16JVvtsGjgD7etzferqCVmmWKGPCb3EL3zcUudaUL12i+IMyYG8gvrZ6jKR/IuHL8weumGcA4UCfnI9bjEMekqQhlM5ldgU/MH3N9YFFHxBalpYLvUnbcoM0U6PLpPRXxOM+cm6KKlmf7V0gMoN1Eei7q8NOz9fZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441177; c=relaxed/simple;
	bh=s/zZIjFeP8/2k81esWo2MCwCvK3NUWqItzbOgSvm+XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrxOgy/5IDKoeR9W1LStOZpLau3G57+d9rbF2trQwJz7BQSS5NfVtfVEed+T54yu1LKCo+5geSJAd89wD/CZIM6YUQOdKMcp0ekvShDXQV/o9oeX3jNHyWbVMDvKCrP4l1xIl3GcV2e3AW2KFphjIYW7QskdL9hUwaEeLaHuQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIl/1b+q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBCCYcAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M41WeO1816126
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K08GxGjbyjk9lS2Rm9N/zaIGPK47NJLVvBwRaxBMJg8=; b=kIl/1b+qYIrHQHI0
	LdxOsHC5mDFatqNAlwDeUN2kdNBS3LML8Bey6NMhML2aX1ZG3EbvCKpaoCHydZty
	EzSXcF+LrNvqdqfd1RRe7LkkS9Qtopuyle5BkSGSM1NDW4YT/+habWRW+s7ukrkN
	e1Nsqsr60QQKDsobXUx4wSeIuKNsckjm49l9UWW1WbaIcrh1BaU8vFJr+0yTmlyD
	T9Lu+OC0U0CZg/oIJD0hKD0eNu35V/sf33naliJ64hwPgtWHVob4hp4/6vDdjazO
	20aIItoNVXrbzWfVfY+lNyyQykY5DIfQyeG7wvVHLVpPJdauEWfV+b52lDeiG3gI
	fuuaRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm18ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 09:12:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ceea1984so29528921cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441173; x=1780045973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K08GxGjbyjk9lS2Rm9N/zaIGPK47NJLVvBwRaxBMJg8=;
        b=LBCCYcAeq19xjZCLgfQGCFY1v6zegv7e5YJy5zPHRhs3F9Bp6caeBymXQd6jQ5hSZz
         R4rInaczlBEPPTJ3wci/u97vvaPoDD5b0P4dm7icrKikdhewZbQ7vYv4brjd2sUbjNkG
         ooIqw0ySewOFcoyDmZ7Jea5rH1TcxuSZU20czc1TMA7kVrbc63NoYfi7n2Zg+14OSsNA
         5rFOJY0PvSRIhqkGwxP4eXQ9ecB9OPIb68EN9h+l0uTI7Dd3DH3aMMd+c7Hp7MlYjGa1
         tUWHDFpJk5qVNJ2freKV4orsjaldzaqLpTTK7xekTCVziktzzn2sum4l1AHNJQxqiffV
         gEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441173; x=1780045973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K08GxGjbyjk9lS2Rm9N/zaIGPK47NJLVvBwRaxBMJg8=;
        b=NXp6tUT/io/4+rN1N8AAhS3mQ7xPVZ8dWewjWX4qIr2ePxoBOEamy0+KsPwsS8bC6m
         qnmlOm/7fGRJSFpnMKNbI6QMvfpD9527p7vqaRSqA7DO6jBnLmQYfcL/fazwbW5mVboE
         3Un0sINI7RjcPp4+JBIDb8wPRdKpr9WeWY2twIKfPtVfynYdtlY5Z1nkOQKwWOXwonu6
         5L9RgNNWL4DOl7GN61I4V/PHKDy4i9tUd2do4I+V1NFhKdXT6czNzjnYK51rPiX+uY19
         bMEF69T1YJr82wdIy/iGNW31o8+3aHYQ9cZ8mmAV7G2WPYzdr5sajzF/BsxBhuDeVGSP
         Atwg==
X-Gm-Message-State: AOJu0YxPcFpHZjnfTNiSSiCqMGrNpvxY2fSGb2O0LVmrI8kbcIRPpQIy
	HyE9nLRfKKDp9lAkUPX+niJkPYg81bmoLdsU9wBDWjZMy9l5B+Q2AUxxHQC9vDEP7HuGEbTn1bt
	gerj0V+kp21BBsQTIXjxfFmzAawVB//QUH4BgdQ/SuuKP99dkVtt9Bb/r6kXN37wO
X-Gm-Gg: Acq92OH6FN/MlQYynCJgInbjL4d3EIiiC2y9Grg56kktPB8KlgGT509mwSbmrM1qsx0
	FdizfjZWBdto3TFdzUflHp+USJkbHmacrRlUFcAjNAXePHHogZ4CpauCqmqmNSXa68ULzhe1PQZ
	XXhJBbCTgCkDWSbjWFaQXzpdGuP137iAMZDTPP4W076ehiIXv85WE6hAO8WpRyreKE0mV0oixOw
	rOg+JA7twi0IE2R6axc2tfzXECQFdNmCUf+SpIE7flWJ+0F58RzGLNs+yJDWr587MRx6dOfpthR
	YIJingmDxV8lBoW9s9wWziM1f23mwOQQjG9gcoAn3XTuNeq+xn0NVKUgul+4a2iXsEHdZaH+Fqh
	gYpXFN741UxxCP600kWw+V6Xa+XUK2PvJojj6rUWQq9xr/E0yWiz0iuMq381W
X-Received: by 2002:a05:622a:251b:b0:50d:60a4:47a7 with SMTP id d75a77b69052e-516d429dc50mr38667971cf.4.1779441173469;
        Fri, 22 May 2026 02:12:53 -0700 (PDT)
X-Received: by 2002:a05:622a:251b:b0:50d:60a4:47a7 with SMTP id d75a77b69052e-516d429dc50mr38667811cf.4.1779441173067;
        Fri, 22 May 2026 02:12:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d4cefsm11953415e9.14.2026.05.22.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:12:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:12:36 +0200
Subject: [PATCH 1/2] gpio: shared: fix deadlock on shared proxy's parent
 removal
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-gpio-shared-deadlock-v1-1-76bca088f8c0@oss.qualcomm.com>
References: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
In-Reply-To: <20260522-gpio-shared-deadlock-v1-0-76bca088f8c0@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/zZIjFeP8/2k81esWo2MCwCvK3NUWqItzbOgSvm+XA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEB4L290UDqcHSoJPDRdplmBHWS6z73Y5PvQmx
 9FRbwt+SJSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahAeCwAKCRAFnS7L/zaE
 w4J1D/95G3XAKIR96aO2aPxKtvZwZFLE0M3ofS8aEoe0ThqBN5Q0q5M/ZJAr3PICi4pEwSWecEv
 220tdJtVX3CLtd13CNsfKiCAJ6+NbEouviq+ZV2T/KMfyek60fgv81NNGQY5eNJRJ5gc+Rw+XQE
 xdOqUl+hC/EqvrcWHYJsrw0CqSIMrkHmc2zIE1HQ+y3IkLtmxq9szAF+oOBJjbq34XqobkHsLQ4
 UedzWjZySmwkmdSh9RzTuiaJm73uwrS94v0BZo2u/Zx7qoBuixcKCVKP02UaSzInmq7knVmQWob
 roNY/kS8Ce06NjWVQLnBMWxuShNeajh+4dETWmTPimOOhrO+xAHP/q2j9OaN5R5SVIuDjJ8cRCY
 AqsVJ7HJP3nwQBN6DmKndYEvaBJ+EKMpykBAaeI+CbRpFhRouOwZVTODOzYdjSZZQs5oLdCWTJy
 b9rXWh5FvT1kMsg7lRSUzuTa3baeyoudN9J1wQRMYIPZBmo+wmbcS5Y8dW7VcsCgbnDwGRBjHOj
 4BqJ5LY29/NPqMT1626pm7TP7eRPN+ukffYfgfXhqm2cNAOdMSeuRGjpOChM4XMnRZ2mgERizqz
 oQAUApsl96d9wjoyozPWOkEEBxD9wK+KIVtYtYfU85I9xciY9lBd6KMBNzFUeoYVx8jwHZbFLwU
 rcL0OGXMJaw6Piw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gTDPBfDxHNPnXorwIVrrLmrj7rZrDiAu
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a101e15 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JrNlowrVSM02oZUCpr0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MSBTYWx0ZWRfX6uPr662w1VN9
 ZNjYWKBsJHOjXRxouEAWF8UWUutVblKnS/m6QqcHvpZAF8qu+etXCnudXxFQKB4SGMqLp3RulNi
 Qb32D+f6Bh1Dt0/aypYYxpP9De1VNU4YFOoOUmVYM8yngIjDgBF5cfhP/8bTwxdpmU+xGzK0nsy
 f9Aa7d57x/NXm4AvDxYc/rq+GuCBLMw4o3f2e3b8y6axxs2Z3pkBJm/lIdw8rNO/B9Wa1xyQc1O
 29sE4LElHUpEnX2MojGtsZ7fCz/tCfG38at7pXPJ69AAS53KczqmZraeKLvmwj9aB8Q/gBxQznO
 tWkZakSw0rpRnxli7WSI05lpGehMMiXDUnv/jNaPy3zOMyonkrJb2aDiVSjUCfxrUc10b+LtWzz
 mlJrOKvQfJoj6Un6twujFnWJ3DQpvHMlQ6r0xBtjJSY0o6WYmwtXiwQg96ezArH7Jf4cP6LBLmu
 azpZVRan0EQW28TiiiA==
X-Proofpoint-GUID: gTDPBfDxHNPnXorwIVrrLmrj7rZrDiAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37328-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 145A55B0F58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
used the mutex embedded in struct gpio_shared_entry to protect the
offset field which now can be modified after assignment. The critical
section however is too wide and introduced a potential deadlock on the
removal of the shared GPIO proxy's parent.

Make the critical section shorter - only protect the offset when it's
being read.

While at it: mention the fact that the entry lock is now also used to
protect against concurrent access to the offset field in the structure's
documentation.

Cc: stable@vger.kernel.org
Fixes: 710abda58055 ("gpio: shared: call gpio_chip::of_xlate() if set")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index e02d6b93a4ab42b197f0fd64e4854a303f54f140..087b64c06c9f42b698abe5741e63102538beb488 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -53,7 +53,7 @@ struct gpio_shared_entry {
 	unsigned int offset;
 	/* Index in the property value array. */
 	size_t index;
-	/* Synchronizes the modification of shared_desc. */
+	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
 	struct kref ref;
@@ -598,12 +598,11 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		guard(mutex)(&entry->lock);
-
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		gpiod_free_commit(&gdev->descs[entry->offset]);
+		scoped_guard(mutex, &entry->lock)
+			gpiod_free_commit(&gdev->descs[entry->offset]);
 
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);

-- 
2.47.3


