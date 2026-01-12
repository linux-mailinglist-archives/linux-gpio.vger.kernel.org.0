Return-Path: <linux-gpio+bounces-30442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177DD1186C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF1C6301DE2E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AEF30B525;
	Mon, 12 Jan 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eN70yxg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIx21sj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E55126F2BE
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210622; cv=none; b=e6r0eTnYgEls2vKKl25IgwRMAHdheTL6VjcroNY4fG1gYjgDbJl3yqQWwEBuB83w3ud3sI7XtmRlKRDij2hV0JwHZ5CaiJhpIoOBdT4nDjeICSAZI/Ez7xS8jkwPh9MVHJozuaPQTZWQNOFrpFjtv3NpjtAz6FWrOZSDVqtOEdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210622; c=relaxed/simple;
	bh=Q0ipsQlkwqgeIhPpFbWXT1cYQwh9PhJdbKzXLCMEldI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxrQM88bCAE0VlSJ/2Sjy3e6b3hsC11JpUokcfSqTNkXSX6sSuZwaIaXuz56ABFF29aOdPa3ETcmyKiVPlFiMasCL27tXhuHK/F/OvS57BDqPHpvsHPSaZt4hVeBUeSUES0ve2e+li48PceZx9cNVCDbDIwjOR2se0CZtp9kBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eN70yxg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIx21sj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84FC53455445
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jJB9omWYIAmQGF7mtK/dc2oESE01+HlakmM
	Sf9oc/g0=; b=eN70yxg4BHZS43FUvLjhtN+HOSZmncB92TCVG41qfssu4jz2HWV
	KHj1XJv5PWkg6ka6uEHu0RTEvvwh9h4+Gscyr0nJDBuZs5TCrJhPk+7WNxS9DUHa
	NlsBCMonUMOdgp3R4zWWEvBMAzdCIsHdFuBNzz4X/40TLycdYGxqnBnGHepaccGY
	d+p8gINSWj6f2swmJ6YkWeYKfA15q78v4ZtCEVWEp9ntKNC28nhO0216Nf2RFXh3
	EPA0zN1eAnyG9sy7YrwFfFE0ZflvEfcWJO+xM0ptmx+LRiUr4Jhe1oJDQlaG4q3O
	7zXB/dWA7CnnbGD2SP5/mBqbgqHl6lf3Acg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4g5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:36:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51396f3efso1208470985a.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768210619; x=1768815419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJB9omWYIAmQGF7mtK/dc2oESE01+HlakmMSf9oc/g0=;
        b=QIx21sj7cJFSeIlODWafnzPSHEgiIFvyEeLuLVR3Prv3MUz8Hn6mE38OCGLkN/WcgR
         WPS9p+OPIAPvo7689bcaR3jMpukfQOQPyzz426i6phncCK6pXaLvlC34UNTvTPsSZmj8
         7R9AAZ97jvAHSGyorBefBYCvbX9ASN7gq5qMF5TVHlLo/bEcSUHXGKlMnmtNcw0Bzr2V
         CN6VSL+mdz8CXLcjeefz0qnAuuyU1mXE8OdZ6P8kjsUnmkMjtVv/qSjczqV5NBCEMv+A
         Cs0SA4KMmYg0iB1dx0Ad+fWGhF87J3eEYtcQ47XeftoV1F1pvlcDZ+MSPQeWuozWnk4L
         JQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210619; x=1768815419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJB9omWYIAmQGF7mtK/dc2oESE01+HlakmMSf9oc/g0=;
        b=PjEPg7/hYObQFnMtZl7pGRK9tuODgJQGnWU0v3vF7ubvac0nVrrJFGuPi0n8wk+GCL
         dNyA6MQeW8RAYNuHC1Y0l1TdlulZ+EsFZghS6ykAyCP59+OPbEiqaw3u6UaZXWiS+yle
         MOROZQiI8CAJunYYztZVCXJ6QqmkalZLKy8+T5J5w8Re+Oy9B4SZGOtsPHMh36OThq1D
         9psK02DB5OzGE4vGqz3DvVBnQGZB+qE8W7X96DMXbiCpM5O8PsMUTFon2ghnvYG5Aj7h
         TwpgRTFvO2mUxFJlOLYCEu4GNRTAEz4sc9p7Z3Na3yEUDybAyOAXbclNKrIQE89zsLxX
         f+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5+9NvvEUDC3K6LOUQR1JhbL3B9JWbYvKbIPxkvmxwL4zfRNwWOI1JeyEkFwjOClewA9qVlbqDMUDC@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTn8ktvY1n22dOhaTbVjJUGe7D11OvzrZNe/HdZ2ccSbUdLU5
	j6MpXQ5c5m4d6JO2GOlxZkIFcGJt3wPp53beF2EkAX+d0hqi/ZpJ/7A0uhsDoUwNc9MkEjYYNLe
	/CpUCDqjKH9LvN32148kZGlPH+Ia9C/xHWdeXvsXNOl5FPnI9maGkjqRm+7gR83dt
X-Gm-Gg: AY/fxX7IQo2DOyuPYXXJsoP473ThuYrOcwSJcUynvNxnndkXAZTmyJYHEyuqpLHZp3w
	uBHkgjbxdrO+g77AqzuG6Rfw5WNXSfO1CUfNIUT0jSNrOE9AIRdRL7n+MpybrTLz6Y7+aRgTx6q
	LxsnPZnnkFFyTIv3AYmzl4Sm9moQDRXem3RJakQKAnDwyNQ2MM4HD5eyDfp9d/gOZcu3Ov13O/P
	kabC1fUBYvYdvOptUTtq05x2fyPjoN3V6rT19mk0b9iSsWfvAEBK2zx9HQriclcEEOLNueMkvsr
	zqx+zs2yGmaGevG5PW/6BGKtvGWE5DC6zmy4IVFMgWqVp7s6/vCSRbzgwTF5CWctSesAUWUlkCi
	SFG26KFFMWbLxU+LyuSArwp8yaMRe78FvKhwzmg==
X-Received: by 2002:a05:620a:284d:b0:8b2:6bdf:3d14 with SMTP id af79cd13be357-8c389368a6bmr2436740885a.17.1768210619356;
        Mon, 12 Jan 2026 01:36:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7lbpiv4280YviFHb1uXcJeLmBDFrCAbpQx8ad8Zkr1I25GbyJHsHDji5uFGXyVyxDogsrfw==
X-Received: by 2002:a05:620a:284d:b0:8b2:6bdf:3d14 with SMTP id af79cd13be357-8c389368a6bmr2436738385a.17.1768210618941;
        Mon, 12 Jan 2026 01:36:58 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a056:e497:8fff:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm341629175e9.13.2026.01.12.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:36:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] gpio: shared: use device_is_compatible() for reset-gpio
Date: Mon, 12 Jan 2026 10:36:51 +0100
Message-ID: <20260112093651.23639-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6iTg7tzxJwMxYwDRNCXBvqtCASNuFmri
X-Proofpoint-ORIG-GUID: 6iTg7tzxJwMxYwDRNCXBvqtCASNuFmri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3NSBTYWx0ZWRfXybBUgz3tfIY8
 zdiyqoLqTRdn+00XOv3VEJh7lCqjSZX0424zKUqADwoDgNdefSRzYVgRytNsMIt2+EI0C0iYCjf
 UMiJwiF5cMhzVkYd5CObnrCujVqIz3Bkf1Gn9BDVMHhVLxC9RJBZkSPaw+b7pAYTfqiIdV8w2Pz
 t8hPh6F/k+khvozBUxrUT9uechgDKaS9Xi5F99DSUhVljW1wftdY23CD9tocSPwMvZJKb+LgRtr
 FlAZGlXGlxufQGiTs+EmVawRpT1owNe0iGwHBEm16RbFa2TcrDT6fFGaRt80N2c0sxLlRKyEyJk
 DJnp2JEJT0YzewULAjBZ8CVfvxedkxnpKH+Edz8LSZXif8wbLP7+zE5jYs9jlwox3vx+1rzuTzb
 Borm+Jkrw0lOfrwuToYsfFetDUIfwsRZLNGHjSqo7Vc+b8039/+Uu0xrQvEOffkX/glR0RFhf8P
 iew5mGOy2fYZ1wU3uNw==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964c0bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OiVkx1ddLC1L1kcJBsEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120075

reset-gpio devices now can be identified with device_is_compatible() so
use it instead of checking the device name string.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 076d8642675c..c97229c90c91 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -451,12 +451,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			/*
-			 * FIXME: use device_is_compatible() once the reset-gpio
-			 * drivers gains a compatible string which it currently
-			 * does not have.
-			 */
-			if (!ref->fwnode && strstarts(dev_name(consumer), "reset.gpio.")) {
+			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (!device_match_fwnode(consumer, ref->fwnode)) {
-- 
2.47.3


