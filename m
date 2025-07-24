Return-Path: <linux-gpio+bounces-23801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C4BB10DC7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 16:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CC5D1CC80F7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 14:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1642E5436;
	Thu, 24 Jul 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJNUZb2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F902DFF13
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367850; cv=none; b=CwAkSB4DlFQWOj+gWRWdCU8iFX4zn63CGgjZCcVFUmprn9e1XMvlCgpc7DDONjqUjMcAfd7IAxJi2FjEc9ijtsSXHUL8xZWtKS1BixPioZCv6cqn8iRigcKl/mrA1ExnFy8QR+CP8eKsHJxSvCI9yLEL0nqwM7vpOGLUyOF8A8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367850; c=relaxed/simple;
	bh=i1slLS6fKL6k/lJjpB1zEBUCWviGCPU4GQH5Mw9K1LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgTouUv0rEcXDFpVloAWZv0hr16MlmjztsGuWz3c9xJbUT5fXE3OpxADceqMTjA7qNOWFW2AjiDRAjl3S/95rZgGfWLxajYMxFCZfKUmSEbDZNOQ+l74Daz23PvPuMwSbgC5sVHwaR6Lk3ia00fuo1E0M80Al4n5gYgKl0Ss73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJNUZb2M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9W2GM023140
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1/ClJdrWPfw
	KRkRpbRRXkAMnaqMIpW6RqyjsVq8yU5M=; b=nJNUZb2MHMlazo/lHBTTkx7RVqD
	mKkM1XLOTUjLVxHwwO6ntu5k5NMLGeu3GfWfeExSsH4CoG18PYbY2sRQZwk6GepE
	kKJnegj1qnrJ9987J981svWV6MRgM5b4e7lhl0k3JWRT/0Jsiq74Mt0sZCIoFjoz
	WzunazjjNXLOQyIBbthmKudOX/0HTUd3oKj7vZgQOiexnSKaqCApet/I4mW4AXh7
	sJOhS0RpouMRpufAsY8vfP1N+Jkfgmx2iVB3rwgPS+2EazMnGYACZFEdT+/nr0Cw
	TXwOKZIkQ1w9XlFcueMIDTmmQENAQ9g9sJ6PbIXm5simWPnD8+deTD6gRRA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48313kkr4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 14:37:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-53469abe734so277554e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 07:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367847; x=1753972647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/ClJdrWPfwKRkRpbRRXkAMnaqMIpW6RqyjsVq8yU5M=;
        b=sf62mHq33g8wSSLmbWLIt0VOHoky0YgZ4O2G9fq2amQ1RkqM8xIkf/458VFdlWmZSf
         mF7h2JJA583WkjiqltZSigm/OQElAsdoRsdhHJZa2Ro/tfhQVVWuEHWDrqIHrR5kYFqe
         igH+pCQOvxcWmLQnLJfUPdEA7boHnjjuW5DtbuabxrhzgsVe8KV+AIYkePyD/ppzdXHB
         deowZO6LkgFsCr7WKuyfocyPzkfX1aPzWUhT5rBaYCkK0KtaYIJcaCinXmeqkAgAxv19
         QZO6ChXTFCbL//tGtqlQrsCzjXbifapGt2VUs1aLTA2i+0KO7XXTkdMHPU8uk5N7Ygoz
         Wukg==
X-Gm-Message-State: AOJu0YzVk6aiPK98lx8cYx5cXKAXl4fRkQAz/d4lHTgmEgSwc7ag2a04
	J0LOqWWqfB05+uZPyBLeynTAej/a0+5ZFNLG7D09byOCZsfQ5QlxPxMCPw/10OkfKbGIBXL2ADw
	bcNWy//mOl7en8hTwsCSrhOLeAec/KVYTtgYtji3uRYiHjc5080QI/rxIeN8LrfK0
X-Gm-Gg: ASbGncv20V2n4oOGoJAEaPelz3Bh+ySOW9zUfM9m7bmjnkU5UuU3ECtCrs+NBnsd8Z1
	M2lOcQGbAaxR+ZlOenfFUeIDAMqivG1XxsbSeBavj72AM8TbggaVIMYlWtTifkeIO14ds6B7Nhw
	UbkXWaI/k7a3F4oaePaEd88qIcUQEd8IdJwtxRQHRDw9P2ND+56+jie9sZJwe+TPrcwMpeIChP8
	EVYvgsMsZEhOZhaMrkHTESuZu7dtag63MgIS0GL6SKoeB4fsBzXz42gL3grDBbZp+UjHOpcSjlW
	QBHRu2g4/gBhKPXAP9v3N8VEKl4h9gCRBhn8qaT4igwr60mDBee5cVc9BvgKYj6Iyw==
X-Received: by 2002:a05:6122:509:b0:531:2f51:7676 with SMTP id 71dfb90a1353d-537af565921mr3835520e0c.9.1753367846976;
        Thu, 24 Jul 2025 07:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFC9QgriQyVRZksDj1oB9q4RdVIKez8rc+GtzAgwBhWM1KCgo2TsHI0fM64ZXC1O2Pn7YiEg==
X-Received: by 2002:a05:6122:509:b0:531:2f51:7676 with SMTP id 71dfb90a1353d-537af565921mr3835474e0c.9.1753367846304;
        Thu, 24 Jul 2025 07:37:26 -0700 (PDT)
Received: from HMOMMER.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c495f02sm122856266b.2.2025.07.24.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:37:25 -0700 (PDT)
From: Harald Mommer <harald.mommer@oss.qualcomm.com>
To: Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2 1/1] gpio: virtio: Fix config space reading.
Date: Thu, 24 Jul 2025 16:36:53 +0200
Message-ID: <20250724143718.5442-2-harald.mommer@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724143718.5442-1-harald.mommer@oss.qualcomm.com>
References: <20250724143718.5442-1-harald.mommer@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfX5jCVwDmhTXap
 R5rE/gtZgvKMeCqEO+ZGZgQUZInfOMEBoKDdILulwBSMkqU9dFvLlhU8r+jL2Gg6oIWU5WBcWvr
 KMHWO8h1XjR8EyhMc8uvujTKXGOyLH1wjBEzQMxwsq2Hiydr/LSyyUqXfaXcP7iZGy7R0K8ITQE
 86ewE+ECNm4XhviDBYXwKXRqxxh5Aoj6X9UWEg2hHHyOg4pnU2ESnDsUx7uTlkRWz7kgaweTYhK
 41pp0Q2BALYm7D4KXVmL2A/LDUfaY1207ajqgt9qbm6MWax770N1ynRkNTM7b6u+SElfQZyNXf6
 abzTQA0SCk7EPK8L5hSnzNa6EvsFGDPwxABKYVHlaKvuW6xRSbqO0Q+Rj3tLYplxTloBVyse6U1
 wFvTufhOvaXXe9WeA/u7CJPn+SYLEYiShyt4PtUyYKlcgZq4NSoatEeuJQ1b8CvFuxxUkEVw
X-Proofpoint-ORIG-GUID: F8q1S_TXbHoy7EcWO8qI38TayB4RAz-B
X-Proofpoint-GUID: F8q1S_TXbHoy7EcWO8qI38TayB4RAz-B
X-Authority-Analysis: v=2.4 cv=C/TpyRP+ c=1 sm=1 tr=0 ts=68824527 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=x8YHxakxDffKOoiCecoA:9 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240111

Quote from the virtio specification chapter 4.2.2.2:

"For the device-specific configuration space, the driver MUST use 8 bit
wide accesses for 8 bit wide fields, 16 bit wide and aligned accesses
for 16 bit wide fields and 32 bit wide and aligned accesses for 32 and
64 bit wide fields."

Signed-off-by: Harald Mommer <harald.mommer@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpio/gpio-virtio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 92b456475d89..07552611da98 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -527,7 +527,6 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 
 static int virtio_gpio_probe(struct virtio_device *vdev)
 {
-	struct virtio_gpio_config config;
 	struct device *dev = &vdev->dev;
 	struct virtio_gpio *vgpio;
 	struct irq_chip *gpio_irq_chip;
@@ -540,9 +539,11 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		return -ENOMEM;
 
 	/* Read configuration */
-	virtio_cread_bytes(vdev, 0, &config, sizeof(config));
-	gpio_names_size = le32_to_cpu(config.gpio_names_size);
-	ngpio = le16_to_cpu(config.ngpio);
+	gpio_names_size =
+		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
+					      gpio_names_size));
+	ngpio =  virtio_cread16(vdev, offsetof(struct virtio_gpio_config,
+					       ngpio));
 	if (!ngpio) {
 		dev_err(dev, "Number of GPIOs can't be zero\n");
 		return -EINVAL;
-- 
2.43.0


