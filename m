Return-Path: <linux-gpio+bounces-30188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAFCF793C
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B1830DF058
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A69E3093AD;
	Tue,  6 Jan 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBPIi2Vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt8xsCYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8172DA775
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692080; cv=none; b=fBbY5+NZqFPa0256zXdUuD4uWbR14lIvxgCO9eTyLtUCrnvYwROVG0TwlZfDGGMcAZVRspGYSEcdPJRoXkdGfX1qDTXQzxXV7v/mKrxjRc3Hbp7bLNgmzpJsdX00DJMSTROx4Z0mHNG5+HhQvnozFN/pX5MzN4ONVY2/zg1fD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692080; c=relaxed/simple;
	bh=+qHREQZb/P8yRlR6ZEGY3Tlp5BRmeK/Y2vvYqkUUZAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJ4s7U+BDlaG/gME5QiynTm57+8vqZ3w5LFGL6QiBW+dc4UTxiutuCxnbSVOHHL49mx1f7vXcYVxH3x5gDFEIqz0aJHAOYtOmnor8lQHdfO0LPdWSS1xEMzqU2cSJJ4rZcqozBXrVsFn7PB9Rp1t1tIN3Dm+RMdJSJE4qM6vGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBPIi2Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt8xsCYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QCr33052779
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 09:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=; b=CBPIi2VlCvuOtEut
	4ToHwq4PgGuEyPdqu9YdEG9lLZtiqMkbiXrYa5Ht7sBLrZsZRZV7xqHLmZQDBWYG
	OJZjAwSJxmZOagOR7JIj7MzAW/bO0B3PTuKdofd9bGjFl30PTF02il/fNvz49V2L
	+sre2VlPWtIJddY06rEqpLoz12QRFBj/M1DOnLcLf3MpS3vs6whGxO4CG2F3qrOG
	6pok6wal+Eq3euFldaYCS+qJBQr52iOFnN/KvDhvfjx2Gk5uKql2FLkpYlBp139I
	WLrx59oVFc/y6qbLLCSU2NI/Sa0eT5X3ehSOlQR0UdzqEn8K4c6OCiCD+aDGLfuP
	cnDRyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9shuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 09:34:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d7ac8339so34755611cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692077; x=1768296877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=;
        b=Gt8xsCYv7UzfrBsdH1EdajCLLT3IFoj14dzRpILj5GLeP1Dpr1pxjnTEWWyJgyo+Hn
         no3PXQpziud/QWB8TCD1rNvzp5IrAPCwXXdB9fZGWnocBTdSxvlCcWuNjVTeqRG/NE/s
         NRltE8pK2//9g9/Tatx/qc8DE/JOnYiUCk/SmXtP/K/y/u6sUAcC3f/pe8Yn9uDlWo8h
         Z9TTqHHFLu3d/Sk6iVdTXO+00eCxzsJZNlQmYglSPQqv7sahNutPYbJwX4WvcHg+lPIg
         CpSp2O2MV9RRgNqo7LvYS8csZbgXU45EBz8zmsiR0iNu42p/GZZUNAo4DRGDwBj3mihO
         kIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692077; x=1768296877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tmZmM1DrqJyOHUhXesLJRUeqjEH4qTmC0C9qc/Ubah4=;
        b=wAZeMq1bJb6Rf8ZeN+KFFRgu6PCWkIUQrbeD8+9+5o+mXcVVYy3g1etLg38wVQJVGf
         c/SCb6yFcMBGQpp/ofVMQjhUot6bWKeyq4gqjbqgjzPoU33kTErR/VjrxlGznQ6QVn3h
         79H3knVFYp8JUD1jzC52rT7qYnk4pGN3GDnUmQB10HjsAJ7JuPmTmaFiywuy0vkIGYs6
         r92OYxLxYJu/G52Zd7q6cLxFu6lgQdIua3u1RQjL5r6rpaFCjgNqSBoXJwPEVJ6QRC/L
         OAeYWjLGoeuY/Hn9sE5G3SpB4xCqHC6F0rhIe/0QWOMJVK/UFTY2BefMX13ocyhNlLDP
         mYQA==
X-Gm-Message-State: AOJu0YyTrTxr5s/4t8BLinGEh3QW53dPqjoAGonfeZYbCf+26oVQglT7
	ETNqjJI4Ir4PKP1Rg5coTgX6OV92EaFBkBFiM8BrrLO9sSwvSixIqKwlVivANfO1MO9/eeVZJIG
	hSThs1D7He/r9wgjXnZec+dvZKknb8BuFIANF7U0TytQU9jfQGGcrSYhotMxuk6YD
X-Gm-Gg: AY/fxX5CNwDd7FnkTlY/bePkKyXGfAqaA4fxazpiHvEy9HBYSKNJBrNTEf85p7ownNF
	F9t8RIC2UMHawr08Jt188Gy7X1SLw8gxRa7jgZs5zjr5TFU8gi3OyvQcieUnMjBiTF2K1Ctz52I
	4sZopT4pzfpt4pv1ZZ6GoYDcOEJcD3PWsmTn4GySsh3fAG5rfII9qab1P9aZikRh6bsLONHonjY
	2pV4e+m3gvO65OjRmpDSwENm/43N1pJjtKOt/85TQWM/VkEJ52CNgROfHZ3vQh2vXETFhNAd1Ta
	9w/AWhxZhkqpR4WJzzDOWdc1NwFL4vXWiZqq5/8YtLQgBIBcNZLLG/2fx5c7AwpnKFV3ajyJWlJ
	nLhJWKF19UmqwKaK3UUpYbrYOi/qdQPK16PEJB7eV
X-Received: by 2002:a05:622a:1b1f:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-4ffa772d574mr27246671cf.25.1767692076739;
        Tue, 06 Jan 2026 01:34:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcESeKF2iwYSUjbkWzhDypOKB95tx24IZB+LbG8lT5vLTkucOzZwAeo0fKeU+mpsVopwQRXQ==
X-Received: by 2002:a05:622a:1b1f:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-4ffa772d574mr27246531cf.25.1767692076341;
        Tue, 06 Jan 2026 01:34:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f66cd6bsm32013275e9.15.2026.01.06.01.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:34:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:34:21 +0100
Subject: [PATCH v2 1/3] gpio: shared: assign the correct firmware node for
 reset-gpio use-case
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-gpio-shared-fixes-v2-1-c7091d2f7581@oss.qualcomm.com>
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+qHREQZb/P8yRlR6ZEGY3Tlp5BRmeK/Y2vvYqkUUZAY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpXNcmGQ+SusPx1lJhTryWqLTPN1yJcWE3qcX0+
 aCvRDUTugKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVzXJgAKCRAFnS7L/zaE
 ww4OEACveQI/ReF3ZZK4xdXhdM5r1F4k7vRVduvg9wGsmAcntN/w2xnXCXSh/PDz1MOcIsacUIq
 Mr5JHFkESy2PKIOrjyj9Nx+TYFaVD3GmEOQjk9h6dww6JgWaxb7ZSGyK38YMtrggC9w6nHYVGe6
 KywuuvkRF/wczmN/4mtiI+icIkpYT/1yLIADP7rOHs2EoZXdt4ApQ3P6gnEC1oEXO/3IxeQn1gr
 /HuApYtdnVDjdachs34GJZN5J/8rZluTrBiXpH4W0GeTuipF4Abg2G4EbfcDV+raDB/ADRY4i6S
 3GfpCmsOPhiRTzO3Xz6cRJOy+0cuBkdxL8BsTcFsvadY8h47Jj+N+I8J/q3v/rBrTXhP3i7Papy
 eF45mvOzyK9D4ctlrTK0ExtferSHFd0vRHbOAK2ToXB1emwDqYOKZA1HB0VkVXnLNuFn0Cc8bt7
 VrZJDC5M8sKYMenErs8aVqJzXiQioPvC+UX00YjQsbCh0sraoMepdyxiAJ3JwplE9aElt8A80QV
 idmhG4VtdSTg4gEgJy8C79VtceZ1n9P8U6BfhQ7uAfmZ+L+XCSQgqmW6QaAF+LgOvPHgfC1MPNc
 pAgOBisW0mo7Ux3vepTH7KGJFSoYhKX9I0Z9+rDxBns5WXVLQn5D0ikePr26eiUebtyreANQwHD
 DCc+KW/9UPLeHKA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ml20FUqNDa2bLQ0sOT_1D5eHBgD__1s3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MCBTYWx0ZWRfX0d84CIrf9GTQ
 iV6tw/1oWVvbRibIEJSK9TjtG/EuUsy/Q8Q629aEBbSgywJgBizoZRa4M3A0HqIl3iZXB06niL5
 jJOdfEVt1P09Y8g9fXC3ZmvL7Z2L22DMKAvIYNOv32thojiQrztUcZz/8tFJ7ZuoTxW1Pqshbxg
 suaRvFJLNkcWfQAhbAQfHPSe42LVw3y8XeG/xIGhYNKTgqObj5gK8kEKiZd2xnC2a5g6+fZCndp
 qjJlK3Ar80kQX/+iaz3Dxs6zwf203Vmo6/m52kNGMSLndzrQ8BF7dECE8Hjqy5cUYuoDd3AXhAo
 paUxGszSDn/UbW4o/6HdZc//bp6jSToiDTw6Prlu7kaN777u6KrpO99SfJV8vpGf1ttnYnZQK+I
 qRbV4lxJMqJ5xuCD4n2NFKV7nZsIHMLyF3ojz9wh9qp3WWpgdkkMlM8gioo5udiXkwUeRyy+MxM
 6A6Fvvmy2bbXWcbTzcg==
X-Proofpoint-GUID: ml20FUqNDa2bLQ0sOT_1D5eHBgD__1s3
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695cd72d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=0jxSSTtIkrDbntYdqkUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060080

When we defer probe due to unlucky timing of adding the lookup table, we
assign the matching firmware node to the shared reference for the future
probing. However, the fwnode we assign is wrong so fix it and assign the
one associated with the reset-gpio device.

Fixes: 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index baf7e07a3bb887dab8155078666a15779e304409..a68af06a6cc4e1e33946d7f200cecd4d3dc066af 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -417,7 +417,7 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 		 * Reuse the fwnode of the real device, next time we'll use it
 		 * in the normal path.
 		 */
-		ref->fwnode = fwnode_handle_get(real_ref->fwnode);
+		ref->fwnode = fwnode_handle_get(reset_fwnode);
 		return true;
 	}
 

-- 
2.47.3


