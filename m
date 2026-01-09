Return-Path: <linux-gpio+bounces-30326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E4D08C14
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 11:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513C630855B7
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 10:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52CB339864;
	Fri,  9 Jan 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFJODdu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D81hq07R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A218328B7B
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956163; cv=none; b=c7fPOMA3AGOtWB+z5NJlgKwZhYVcGWmtgIvm+37J/ObigoKjAmDIz+e6ou2H89ZZGB0z9fLH3hJux3mmPD3hQmC0C35XOvqMEjhgTp+gDuopOkHASfsHK1541frExIX4+JYqortP7VaSXdL+ICNIbkjXt9wJg1/x2qE3bOOcROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956163; c=relaxed/simple;
	bh=pUNQ4yKbuQi+rnEdBpvCZxkVWVPxJUSAqxvcLO+D94M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=texviqIMPxM3s98F5DT3nLVkZ06dUdSLa3qg/wY61rIsH9RQ2c95K5mgObC6i/NGIVY6Y2uaro0E5h+TLjJsyJL8fF9GfTsSAINw4Z1E63DTdohcaA+1P9TnJBKuf93zxHCKktI3L/5qqdEt0zuyDtV4Q99Zme9HjPJk+ociHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFJODdu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D81hq07R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098M35M3727466
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 10:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x3hvM0pQwYpTkNdxivaou3G2IyHbIV9X09z
	rP1OOdEU=; b=lFJODdu5BWoBIdbwJ3z7335OCLDWpEtK9OUYbyJyFRTojUO6tSj
	F1hSeHz6Orf6raEKZWIq9DWPk1Qf+QVnEUy6g1OJ6zQ7F9tYWJx0dMg1jBM0gciU
	F6WHR6pfj6Bdg1KKkjNlE/pzkhAJNnzObq1gJWAAlvnz1ssnSHyG4WlN21i9+MOr
	VHjQwTqyEIah/uhQvc3GloQGLlgM1Y7IEredvHCSHPpdnqLW2riVCNFFY7+SrO4B
	utpm3I1IkJyk/VO9Hrt2ssizYoQNaJlE5tIJcXmN1wUVJ+zJisZj7AIgyApfRA4a
	G9h28J9Zbisrpqzv9IPtA3rzzw7usqNvmYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhrap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 10:56:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1083095985a.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956161; x=1768560961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3hvM0pQwYpTkNdxivaou3G2IyHbIV9X09zrP1OOdEU=;
        b=D81hq07R0Llsg2X37wcFT9AUAKvL86D9bcVycKx03qxTjOoYpLWyalqaEac121rigL
         rIAxfQBvVI0yzsSj6gFestZFQtRlpNEZVLpJ11e8NrNzdAEpoMDRzxkqDqXl/e568ldx
         tZ5YvyF95UJCrn+h7VpA3ZLNedubhoLLEo3sQrLkidF6+p0jkMtluwZRWxj7404rW9w4
         BVzLPs4AfB15MpKisJ6TZe2ITKxjiMXp1a/tNOm+I7hOm5NhSbL4fCc9/YqFJtH7ZV1F
         vg3KHNiLUSBkmeruirqJMxVuYrIsFde8LofhLNlBuKd6kjCWr4kQ1IEgb9O5N4CMEnQl
         GHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956161; x=1768560961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3hvM0pQwYpTkNdxivaou3G2IyHbIV9X09zrP1OOdEU=;
        b=g52muAlxnKcnC4v+PwIMrrB3iCopYxppNjC+o1Bw4nHADUUdj3QsAWTic8cDq1r/eC
         dryOu1tQHD8plA5hA+1ng+7T3urUeEL1IdBTuVXmIhVz4ukKIqmQnw8BBm28qrq45NPV
         btnBzGRMfXOlypB4yH2LmJ2xvXxdGQqLu9aOtJMn+MLc1BcGuS/835LAqVZtx1X62gRn
         oMLuYCX4lIQp9IZZFagY9h+YWHNPoZVQ3GBszSfV1sF/6u6g04h6VUc8B15b8w8bpWoX
         bQpkabeqZity58gC9xg7hQ4f/t9ho+u2jcRCUcd0Ct6bXW0i5Dbp7QB6NPKt1WoZ9EWJ
         71IA==
X-Forwarded-Encrypted: i=1; AJvYcCWvYDFNLahZLA9MKSVsQ1fu/zDjyBN7HfKoKo9DxAcR2rAz+XuGonSMS38w2kUCePzmv31phB24Ufrm@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRkgW1TVKTpZGlcmHDyZp9Ow3/kPN3V9McZji0XWKNBr21z8m
	CKC1jRI1KSrS0cV14R6xRyauuaGWAUYjxXPhywf3mExF4Nv7ML3mKAh93jVADoGvEoLSNc+idRt
	1drOVNgBfNsiesW3+/JdK9LV8djOkICC6p4I7gVji2u4xXQNjE2c+EGZ3ZfZFKY9OiZmPxWJM
X-Gm-Gg: AY/fxX5ctHMi4XYAP0trnUCFJ3Ct+kx4g6wZaNtIVNd6ksMSqPSb2Bf4fO+BBwP93k/
	z0RuDu34TTvrk/UPFIR1Ag4Oce3MXeuiXnd67CewxmX1Ruh67VZHCh92Yrra6GhHBH0g1kxfc49
	lEAZLEX1LZgcCN0fQ45/lI8gaLFzjl4fKjLWu8t5ZUnprYdQjuZkX00zZaxzJg9dLmhxr91QGXu
	X5EPhSZaquged5RuK66JFH/FuHse1bky2UQFNRCMhew2bD0h24ftuGCNmdZeyMkM+etbD1MnbZx
	McuIzibDRt1pPYZ6XgUtLaCKBe8LRKiUTSt48aeB6+JyIdgyxkAjL7hDFlFpWFZ4Bb+vUJXQFAR
	eENl8muJl7PXga85kuCizyt3jzFw+yc0rX1OaUw==
X-Received: by 2002:a05:620a:7101:b0:8b2:eea5:3324 with SMTP id af79cd13be357-8c389392555mr1272844885a.27.1767956160771;
        Fri, 09 Jan 2026 02:56:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGETBlW0rXG+obctkdor0XxgffcWzuQHjfo4r27SFgGxgsvTHt8XNBEM6bHhvHK1AAuXK01Fg==
X-Received: by 2002:a05:620a:7101:b0:8b2:eea5:3324 with SMTP id af79cd13be357-8c389392555mr1272842385a.27.1767956160311;
        Fri, 09 Jan 2026 02:56:00 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5b0:5859:6099:b45c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee893sm21445709f8f.37.2026.01.09.02.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:55:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>
Subject: [PATCH] gpiolib: remove redundant callback check
Date: Fri,  9 Jan 2026 11:55:56 +0100
Message-ID: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960dec1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UaC_jXYBCyrhuv0RKjMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wuzvlDDNXSmryY-kZ2xBe04Ghkk2Givp
X-Proofpoint-ORIG-GUID: wuzvlDDNXSmryY-kZ2xBe04Ghkk2Givp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfXyYBPpTr6WmN/
 gVPHNmKHM6a8D+I8ml7oC6ey5gVZz6PKrTWNqs3WHY+TrEjJU0LIf9pP6Z05gFc874DRsgRlQue
 xxOUqHSCRS+zdcqb0Fl76w6MOywYSnpTyjA7NozT+BqOJybHpJtllOJNWg4S0esLBwNokv3VmAX
 4TuamFEYq8H6ish5oXrv6F/d+u75D5hxQPBy+iYaH5TfQ2eE9ymhN+ZgK7WRiTbLqUhlCIoOJ2P
 BvOnInlJlvb4Y47USF/To484huAM6NvFYKKl2TOFfKSAzYE+w2BDEnH8DWCLKb7VnBb0ZkSdMQp
 kn8w7H7beNZdfqF+r0qrI5ngcZZNjz1DxrmcJ6VctHMMo2T9DElVPirKjTPiQ9jQ2UgQxvyGGOr
 fbSeiWUF4THref+M5GFa8wjAOnFqq+9nljX1oooC6s4+C6wygPm+FV0hYlb+Xo4BhYgDN5BLXWt
 Ner3gHgtGfljSXRfDpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080

The presence of the .get_direction() callback is already checked in
gpiochip_get_direction(). Remove the duplicated check which also returns
the wrong error code to user-space.

Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Reported-by: Michael Walle <mwalle@kernel.org>
Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0a14085f3871..5eb918da7ea2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -468,9 +468,6 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
-	if (!guard.gc->get_direction)
-		return -ENOTSUPP;
-
 	ret = gpiochip_get_direction(guard.gc, offset);
 	if (ret < 0)
 		return ret;
-- 
2.47.3


