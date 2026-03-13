Return-Path: <linux-gpio+bounces-33327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHLHDkXis2ktcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:09:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B676281238
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D41031510DE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CC438C422;
	Fri, 13 Mar 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKUeixkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9hKDCwI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680338A725
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396311; cv=none; b=CHFd16FKAYQP9uOFfg0DN5i3T6DbhN/cQ9hn6C8fAPLFeiDiWTPxUPFCPfZMWMvBLgxAqv0+axELO/LWrB6GDw9SWn6yN9OFB8e+fsVskUocygIHTnrdEK5Ldibl2HKR6pqy5Uy5vb8zz+GuhSQFgJWMjDU+Kf64KROioeVRrns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396311; c=relaxed/simple;
	bh=2H/1PFCqce2Xc0BdSQcrz9YOQGrzzMShT6CN+886Z4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjJ2rG4c03uqMSGXGnmZaHL8AeTydB3jbdEc9B03sfzPztJsGA1Qe23Ptfl4S47Lj6WPDzuo1WzYnIoIBenGmamOFB0+6t/1RFVm5eGrDvd5EctQ5Ye0YF1pYEAS2rLo7tJeD6R17Pn4o0iRPVi9OhdG2TrPtbMgk6Tvzd4fpDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKUeixkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9hKDCwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcKd4140736
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eprOg/UR9ReViWGeSY9AvMEXF6GXDgc7oCGfK4+GfTg=; b=BKUeixkRI/jdgOWY
	f9F7KO17d7awMfyco5yUXubg64aeP+mL+VulOjx2lCcL0ylsL+FhV68rzD4iGDKM
	rEybHejOBsCsHl1Wao/Uh3mrPQqUjUVsTeZZzXI9Fqi5OpPgDsuYy60Do4nCX+JO
	fChPMorM9hMSgWKustAKf8Ry4GO48Um9AJdtvu3psnTUIq/JMNRteXBhhOzwbJqc
	pl2Uhpn0L9FLq4oDdFIBa3l8J96LEX8qKNUq/OabXw4RgMxFDF5GE0MHV2ZfcVLB
	qxplRHE/0aAZbu3VJnaawZCbnrNNgFyeQi1CZO2018YAY24LKR2AFI21snGx9MbZ
	5AMAGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn294dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 10:05:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso1922206985a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396306; x=1774001106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eprOg/UR9ReViWGeSY9AvMEXF6GXDgc7oCGfK4+GfTg=;
        b=U9hKDCwI3/9QUK6nEaoxO9lXqAyj9Dr+VULXnKEt14s0BQpYtTg8qWiZbrIkaNqjck
         FTqDHPI+cJLfd9Lr5qJSVpi6NN3Fp8BN96mjGVrPau4UDm+/b8yaRLktXtW304ej2NpG
         DAjmT09Pu1RmHtKg6/MqWdqmEf0YeEltGKPUVF4r/2aBgfmzxcZ2g4kZ69vKFJOsXCPY
         GcEstSdJRabrXwdM1YwpqRxZKpFhd50o7WL2jjOGqW7OGCZ7nAhLFm//JjYbzB/bu5Dl
         kctkXFLdRXQOt7bh4QUMWiQDUzANiQ2LPpr0mm5Ak6DTdjY/cKJ6/GxzPGC6K+0lb0t4
         62aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396306; x=1774001106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eprOg/UR9ReViWGeSY9AvMEXF6GXDgc7oCGfK4+GfTg=;
        b=FM6pGbhx9zzknk4A6mrpnTGoSSVjSFZDrU8aa7Gqx+ITXXErkLeOAmi/kdZp/SkJPD
         zV+CD9M4o6rn5yN7SrVMy7m0ne7FTJ+uz2IRUr+qjD9LLpoogAYQncJBtcNJ9CuMIg6j
         QYodsNGfSbd99soqvuxoekGHfljABHgbUJ+JwUx0J3Bm8dk8gP8a142ryD9Vm+YSmaKA
         7mRbQ206UxoORGBA2UDY2ZNmA5YRCXajRA3fBtdtnyaancFjFyNW5yTEUkqUPZp2FQVQ
         0CE+RoMHZPX6oOYA1ZYGKPvVCY+HhTtwpm2LlS0D96FNg0ztp7gLlvrdTx1fBF9P3myT
         JNyA==
X-Forwarded-Encrypted: i=1; AJvYcCUKXSbYT4O1oEa9Dqe10qSs5tFz0ZbO2rOLxi3G4ui18JfR0C07mjCSv6o3l7OshBCey32lz+5mimwn@vger.kernel.org
X-Gm-Message-State: AOJu0YwIw3pL0pR9suP7wlQi3+A0+FDNwZ7Nyk/Kvm+bU5Ct4utOMo/I
	U404v7W2uKddlKssKG/qTPmJ1MiLe3FW8DMVLQR92HAlv520+uE3WNaZrU9n8+bxH/go3qnZAbf
	IAkfFbqu4Cc49Gea2MPQ7h2BZLVKn1FA6IjdMP9jn5dlqApIXkUdaAXDShVGXeCQsKVVGMtVZ
X-Gm-Gg: ATEYQzw8aNFh+tlD7WkKnAh/KT4XT81QlLWQysxfJbRrg/lqOHQvhiphNQmc+mg/KZk
	O2slWMgjUHEToxNIfdkSL6wSU4t3TA6Pf7Vn9DM7oaZi0oxorjakmL1j4yAXfdJPhH/2JMd8Dd3
	kLl8VLdmE/p02JuOQOlYCiboRBrmYkCxk3VtNLfJMC1fDzaWhw/PMdQvkJj5852w5LuMvzPtyCU
	+x+1TOrCLMYuYUcZgwFThz7FRwlnIGNzesRgN9R1OFD5OdfMPYUUAo69RFli9061UndZrFjswTk
	Bf+/jH3pEe9HMOfqE5wed2WNhdOtYBoi+g/xTLEXi8KLCs20MLnabuuMFAvDVANnkJ1mUzsluUq
	dRzQrexygZlaYHBHnAXMv9RTHco8YHFOQa9E128yLKZquATh8ZkwA
X-Received: by 2002:a05:620a:7112:b0:8cd:9863:331f with SMTP id af79cd13be357-8cdb57b8b57mr358644185a.0.1773396305692;
        Fri, 13 Mar 2026 03:05:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7112:b0:8cd:9863:331f with SMTP id af79cd13be357-8cdb57b8b57mr358637985a.0.1773396305184;
        Fri, 13 Mar 2026 03:05:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:840f:d4e5:5fc0:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm194215785e9.3.2026.03.13.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:05:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:04:49 +0100
Subject: [PATCH 2/3] gpio: timberdale: use device properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com>
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
In-Reply-To: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2846;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2H/1PFCqce2Xc0BdSQcrz9YOQGrzzMShT6CN+886Z4o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBps+FK/DrHLzf4SpuCn7AFf9L2uyntuMgxeGcPb
 QiOhXb7HkiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabPhSgAKCRAFnS7L/zaE
 w9hOEACD/w1qlTNSr01kijxvOLKZ2v/BXSSTvApttF+SKKAsmhwuPH2NMXG0eHnXnioXw40Q4Rl
 1hSnJTDVUAFFvoh3NFau19xlkBQKN25i3oRBsIPAAbOWFqCEWtJOpIE6bFg6J91NKq0sFrZ6ZD8
 za1wCrbqSAh+lzFKnvbfgEuP9poZ646UVw4HM2iT6cXJ3Il8Zu8/f6bWLhVFq959xCJlqVi9eBS
 4pwfxh3Yl8Hgkj5IxsZAheSsey0Rhokc7HaAVZp/Fi88LIJthJKwnhmAOL4phRtkee0AaUTZXPc
 8VtxdFq6b/2QrC6f94UYPONq2d7ct0F+C4Kj/R6+fo1aQ7is85M+l2BEsAtxBmzsdGtom1DhxFe
 z+kKVn868TadZ638/Hkm0kHLqbeQAM9+6AInWw8WYYXdl6ALsBYmArp6iB+iz1HbVz4iEVHuEyl
 U6zjuoPKhn+bUa9WSzOR74zs7eyDf8d675gyXO7hLETUpA7xaqsOggTVYNChYDr6dQW0TBmlK5Z
 w7CCyUrMEDfFbu9OvL8paWMQMoriObvqQ63nDTSI8zvtPLs1r6zYciST3T79+uAtjfONtC1EnKv
 ZrFkt23xpKqZ7Ci28ivQaNO0LFq6lFt/7rFb95RqV03i2Z4KsZJBn4lhC59co8ifTD5SmtOjoW4
 pq3OmDlZdPr/4Tg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: fJ9-_oYI-6pSQUZyX0Aqj9Ho-9T-v-zB
X-Proofpoint-GUID: fJ9-_oYI-6pSQUZyX0Aqj9Ho-9T-v-zB
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3e152 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8x3tX-5dUG4wHQunnKcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX0msm/L5TJc4m
 wn0PK+0fEZIuydCJSDxUgaeGOoz0vuAVD5WCnTw11+CsTMJNO0D0w7YH8gKg7w6nmsf8Uu2UE1l
 P1mWCH2Te5MOQfGPDG369SR+QEtRYBqMdTpx/GnevIiZmYWmmFOlIZqaAEZSMoBvug3FBIdqj7c
 +S7pF+w5I5n2Ps9fbltQD+J3Ay+mzAygUhuPcIOFiP2J99FMjy5JL3/G/Ofo7WzF048dPxod5W2
 N+GdvZ+b4aFZtS1J7sic7AKBUVgIUu72qXcDkMT6XNJACPT4HZciOB6M2bN3/uHwZuqixQhRkQL
 lab13RJ6hYkV7zu/jTt3DkQGi/U4s6vWvgDXcnMUMyrHhs2BImZfUyCDqf8/iGvAR9WTC1sq/go
 0iZ9WVPAg0tpoXq8hlRyApoC2qOWvJuyEfhwmwBXZ3iPXl4cFJZ1rZiF5wtthsFZJlEoPTiKDSh
 Iv8KsesQd9cc8mc0Fog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33327-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9B676281238
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The top-level MFD driver now passes the device properties to the GPIO
cell via the software node. Use generic device property accessors and
stop using platform data. We can ignore the "ngpios" property here now
as it will be retrieved internally by GPIO core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-timberdale.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index f488939dd00a8a7f332d3af27962a38a3b7e6ecf..7c34ea8a0ececf9432dbb16881eb53ee95d58441 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/timb_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 
@@ -225,19 +224,21 @@ static int timbgpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_chip *gc;
 	struct timbgpio *tgpio;
-	struct timbgpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	int irq = platform_get_irq(pdev, 0);
 
-	if (!pdata || pdata->nr_pins > 32) {
-		dev_err(dev, "Invalid platform data\n");
-		return -EINVAL;
-	}
-
 	tgpio = devm_kzalloc(dev, sizeof(*tgpio), GFP_KERNEL);
 	if (!tgpio)
 		return -EINVAL;
 
-	tgpio->irq_base = pdata->irq_base;
+	gc = &tgpio->gpio;
+
+	err = device_property_read_u32(dev, "intel,irq-base", &tgpio->irq_base);
+	if (err)
+		return err;
+
+	err = device_property_read_u32(dev, "intel,gpio-base", &gc->base);
+	if (err)
+		return err;
 
 	spin_lock_init(&tgpio->lock);
 
@@ -245,8 +246,6 @@ static int timbgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(tgpio->membase))
 		return PTR_ERR(tgpio->membase);
 
-	gc = &tgpio->gpio;
-
 	gc->label = dev_name(&pdev->dev);
 	gc->owner = THIS_MODULE;
 	gc->parent = &pdev->dev;
@@ -256,21 +255,22 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->set = timbgpio_gpio_set;
 	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
 	gc->dbg_show = NULL;
-	gc->base = pdata->gpio_base;
-	gc->ngpio = pdata->nr_pins;
 	gc->can_sleep = false;
 
 	err = devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
 	if (err)
 		return err;
 
+	if (gc->ngpio > 32)
+		return dev_err_probe(dev, -EINVAL, "Invalid number of pins\n");
+
 	/* make sure to disable interrupts */
 	iowrite32(0x0, tgpio->membase + TGPIO_IER);
 
 	if (irq < 0 || tgpio->irq_base <= 0)
 		return 0;
 
-	for (i = 0; i < pdata->nr_pins; i++) {
+	for (i = 0; i < gc->ngpio; i++) {
 		irq_set_chip_and_handler(tgpio->irq_base + i,
 			&timbgpio_irqchip, handle_simple_irq);
 		irq_set_chip_data(tgpio->irq_base + i, tgpio);

-- 
2.47.3


