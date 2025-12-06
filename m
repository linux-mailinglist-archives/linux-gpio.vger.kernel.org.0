Return-Path: <linux-gpio+bounces-29327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA4CAA5D6
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9F630633B0
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D961B2F12B5;
	Sat,  6 Dec 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIWUEK92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8PzW0uX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF42E7BD2
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022094; cv=none; b=EZafvOb9J7mS4mVD7FSRjBYrNtruV/EhAL6y8LR1MsSSsBQnFd4IxuM4/S7zeaZAwiwNwDM1u++M15O4ZKL9QXlJGKkrFNYE8QyApekFWwLnihc+MyYIYO139jzCLGa3Bp/5OEi6t7N1wDOtGzcCuk6KEaOuWkFe4iYrAe/ysU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022094; c=relaxed/simple;
	bh=uIrarfK4jgXXr+NR+ffSBIsyZqiC6vtwPuFwfYlHqmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVDelw+F5LT28gm1xnRXu2fLxWDpZAqIqqThQfPgb9eGk7UKUE5/7csanJFPhmy0/mo590sdfFZAzJQDiJOGLnn+RscH7GdKc+3EjvwDVfjMmd/wfvrUvWXxNTSw1TrJaAzxikohrHVy2iZAdaOnGRv01PuHwgEBqz502P1iLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIWUEK92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8PzW0uX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B69qrMH3521786
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 11:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3u5yo4Df03bHNQPkwona9TVXnQQlzvzXlqMLvEOyEg=; b=YIWUEK92NemeiRvb
	bJYwpesZdvVR4AY9wYQJL30wwz99ScAreIsz0kWPs/V67/ZMxsRgFu8cQ8uJ6C6/
	1w8Hg6WyH1qJWW+Ur9X4ecBrYksPd6rw5b2qfftg8gKLgyAXm3gny32z4VezUxtj
	BoWIyjUh2+P6rLVK6GQGdLPh1PjySY5XG4GpY3SfcvxnZqjC7ey/6zQ/jM4Rcnez
	iyGCP1+22WbFdlAFcwR9lRG9fPzi1+lJfLcSY/MiRo1LoGPAxUH1WMwZ61whSBJX
	B/7+PQj3KEhf+xMZvsGdzMkeiCTtlHUbZy29rACOGqxXcElgsJMWKiet/aY0iVR2
	lOEAVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wgpu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 11:54:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so623636885a.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765022091; x=1765626891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3u5yo4Df03bHNQPkwona9TVXnQQlzvzXlqMLvEOyEg=;
        b=j8PzW0uX5sLId+MbgQmLufSImysmSUiWbsCD2LEATsxJ6/8PbnubLlWg+UlkGUlbRg
         pYyCZnCPpYAThywNPB07EmWvxFZVuDV1Y5E7XzoMjggQ6JchrUnTz5vY1XnEIOsany72
         oP6YMk+JW8r/HAz/BtkKTi/zoHkJ8vcJPCAZnF5RHNZFUf4BPjDJDsna1n1vUOPjFR0o
         skvFXVY2eaqCt7XVE3Nac1vg4LnVbu/kQtJZBJoqwWd+1ivxIN4QI41xOKctWzSL82VF
         +hlbpeT4unRgHl2G/fOhb0OLy0lK52Pfock+u7TcwjSCuikBT37HWD0Ki8JPTkERzuOh
         JAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765022091; x=1765626891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3u5yo4Df03bHNQPkwona9TVXnQQlzvzXlqMLvEOyEg=;
        b=nLliHSiFvNSmM/SQUK1EzFtqwBuatpi8jbbDVuKE66N3zkSsPflQ/jcSZVWyXidivL
         U5JBXP+/q+fuR7skXTsZtKX2H76roU+9jJeuF8U7Czy+7LHtV9BzhCKzk3705p2Oun0a
         xGmtnLTBI6NBERIzwlulo/w8d5+jE2yo+ktczMD/zqqIgPJbpSIKcJW6e5JBLPoFjZb5
         U1r2by96rDVMvuVl8QqIYGMUsMdhFMuKHdv+d0MbTGe3VKkw8cKZC4KjVAFbveoDdNKr
         qqtc2dTmCORYlVPn+gqx7eD74tQr4eoegQtK7G2neXvjDDSovr5RNKM38MThDLZmZMCT
         Ak6w==
X-Forwarded-Encrypted: i=1; AJvYcCW4BS4CE/+WkglkwmkKdP0X8DFyLC03meCxDjvs+QRyaX/2NvVTfFNTLuqpRNMz2gSQ4Yj3GCgyFuvH@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUN4vPVpvXcAdTQHqKUA7jL1ZAUWkSGGxWJG3zqrgKqINcZ6s
	OETW3Cr7wzcXrXFDWSR68tJ4j2MOMJhQoWixZsjewNrwn+QWZ3Ln1Z7jLHgM5OZK2Sm/YVCbqv5
	SHDz1VWivPZzoOAp1424+AOosA13KjaLPWh50UbGhHifFN6kA6zLz/ajpe/FIq2Ne
X-Gm-Gg: ASbGnct0Q5m+v88p+zeosU2vuv44CwlzTL7VeclmhPzdQI0E6BpVUfy6idpZPRGRO/R
	YXiCBx4YfLhoIwNtwd5p1FsFfHsqhO4nFX5OVce1Jx9HRkTOfBgotNoP5t+iqffcaNsnrSJgRIm
	M1Q6JtM5n8+mk4kC/GC7MCtN5hVL9w1bgOC3YCQ5FVcttVbzove08KbwEFpEFb/vK/Q3BdqHQwI
	0fKUg4trCe8GMT0mvfe7xOH8EnfP+citcwhNW7So78nG2WzaTpOWPLATYWFO8IeK0GMHoLYGpfr
	WzUR/rHXcxE/xfXZdw6Ji0SHNrC++ty6aQmE3zN3Bjyu3UT3u47bTII5PLk0eWB+GT5XCSPaXlQ
	QTK84WQPJ9ZH3sOPl+lsU1yDBvqyButH/ZzGOEqSfch3QP2cDHdA=
X-Received: by 2002:a05:620a:28c2:b0:8b5:222d:ce3b with SMTP id af79cd13be357-8b6a25a9527mr318170785a.52.1765022091257;
        Sat, 06 Dec 2025 03:54:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaT3kRv70fXmev5flwo2Ss2eHBTAciT1pUtMwvrC9XHWatCHPoJzv5n0BuoaTsgH6GxabDLw==
X-Received: by 2002:a05:620a:28c2:b0:8b5:222d:ce3b with SMTP id af79cd13be357-8b6a25a9527mr318169685a.52.1765022090880;
        Sat, 06 Dec 2025 03:54:50 -0800 (PST)
Received: from [127.0.1.1] (75.13.23.93.rev.sfr.net. [93.23.13.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm14027048f8f.12.2025.12.06.03.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:54:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Sat, 06 Dec 2025 12:53:54 +0100
Subject: [PATCH 2/4] gpio: shared: check if a reference is populated before
 cleaning its resources
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-gpio-shared-teardown-fixes-v1-2-35ac458cfce1@oss.qualcomm.com>
References: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
In-Reply-To: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uIrarfK4jgXXr+NR+ffSBIsyZqiC6vtwPuFwfYlHqmg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpNBmFsmO7/LHJtIldE2l0Ccw456dwSb/k2wyKW
 gDyxxHzQ3GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaTQZhQAKCRAFnS7L/zaE
 w6Q/D/9bJrIH2mXGQPjeLTBePZgzQ4zazPoptHAvdSakXSoode0XlPfad218JnhgP0aOX/wP7Vl
 kNhEFKZCq71HUYRHo7NZTy+avcx5hOGHs20/+5VTSyhiL71LSIGfQgSYo/26DObo7NzwscqKDq7
 9eGlhu0bPzhX3n6reGnu7JEgJsUi2CwQP0/rf92atIBbb/AaojmFDktWGiaCJf+VSAiHMIDzmam
 wSlfcT/DZ7tli4KxVwHe1efVjHNuT5FgjNJOglX/c6E7xMbLNR9JhUSk38cVTFiJiyTN0jNfgTM
 bbISnhf3UFuU1uT8U4wtiDO2GHcNgXOUpJJtGksdPoW0RclRcqfzbrw09LCK2J1eMvJ3XD5OS5c
 w37jm8luaAh7tm82F9mmHWaeJJZIucmhv/eUEE2KWdgQ3elY2g8TpcUZ2LZkSdVNGaeDdneEEWQ
 vSqktjRZebVpeS2/pGkDmNJFkya18WoaOlUl7xgGQI3OeqzxsKPaXob/BsT3lQwh3G6pvOCXhtO
 CzVER0IRHeBYHk7iZhjkoINV6t4DaviDAEoiBlgPIAL6ES6HVKuKU5a/Ox3vJIhS+JycEGul6ma
 GgkL++ssnJ5A/bHAy0YvREab0xnf0DSFcdIUPD7zNhdAdfmCRWQBQLn8vl1eATTc/bqjJdpX6O4
 fwpuizYyB9Vij9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 3eNk18L5lGLOx7-lDuZH3Kc8TdEEWxkv
X-Proofpoint-ORIG-GUID: 3eNk18L5lGLOx7-lDuZH3Kc8TdEEWxkv
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=6934198b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=OJCUNAs2RTwferbJ40Rlvg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1wcC7Ly_4S32lYx0NjMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NiBTYWx0ZWRfX2L6zcG4Fzam1
 hYcE0YyxtT9YcRVRRZ064OjEqJr9pdtMXyimqyKRqpflNA7934rs9emCgGw6tPtLxgb3LJXrq0M
 ITtDza+FYjMSwi6ODdelGbJBw8xBFCepsKVpqOtX5FcWvNb1FaMiLxp0h/AcGZP8mETRKGlTUo/
 YE+CqCy+G8R6VVtz1VJFnn52MyW86KRSWeJT7vdH5bBHlD3VHac7mE2cBWu8RIlud1Zmd2qyrKH
 m+4K0Vh3bUjpbLwcXgGh9r/E3vBouVnoS+p/q5zlalFPxsExrISY//0YJF2/vdbfu0w0Z9yDbHA
 teM10wuPGWwYALnQYjvd1W3BfbR4TNAqXDEnA57ww8Emxy/9gDsVgmRqHynLvlPwmolvgw+usG+
 Q1OGJG5eUnzTM80w/E4dEppItLc5hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060096

It's possible that not all proxy entries will be set up when the device
gets removed so check if they are before trying to dereference members
which are still NULL. This can happen if some consumers never requested
their shared GPIOs.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 17da15c1075f97f4ebed969b38197ac155141406..4084a28a953a7c9f4b04cbf867b05a1a74b557ca 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -491,10 +491,13 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			continue;
 
 		list_for_each_entry(ref, &entry->refs, list) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
+			if (ref->lookup) {
+				gpiod_remove_lookup_table(ref->lookup);
+				kfree(ref->lookup->table[0].key);
+				kfree(ref->lookup);
+				ref->lookup = NULL;
+			}
+
 			gpio_shared_remove_adev(&ref->adev);
 		}
 	}

-- 
2.51.0


