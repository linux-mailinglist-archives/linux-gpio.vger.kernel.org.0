Return-Path: <linux-gpio+bounces-29328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEFCAA5CA
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0291B3030983
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCD32F1FD5;
	Sat,  6 Dec 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENCKqptc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTv2yX1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB32F0C6D
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022096; cv=none; b=gCm1ktvCmSszbxKUclDhbWFQI30f76qALGK7bhRMxSgopgOBFHHATJRDIo0g91McKnbtKKrUpJIzf0vrz02MX9GvwPqqRihfY8dln/fEzQwNXLTTFzrCbkQlQ8AD6XgsUZx7rtfGlGryKQ45MLIgDLHV192f+/PSPErfJtE5jzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022096; c=relaxed/simple;
	bh=4+8MUdLIGwmgJQ5ZTCJ32TvVumfGVbi42uKMZ0IhBsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3AsZEiUk15Tk4EV8XleSAZA5LD2PQi3A2QpO5MaKM0bJ7R4wPDd7EVt4ledvFmVL1d6fV2uulrEByzc7cxG/0qe8gVVabAZzOSRfgdZLTdjjQWgXcQHzCLiFj1U5ARRX25AXkcFwawMDssPR/R6XI67IPfMM2KhuUmQ8MowknQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENCKqptc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTv2yX1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65YnHH3103431
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 11:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNZE3UbWIN17adEbRhpz6115KJRPJxsdK+D8hjXuU/k=; b=ENCKqptcFRTK3hmo
	dRFxy8dnauqFs89h2Q1gqnJXFayY+cUjz5kUwKMFec7Sw/LzzLofemVBfqf0iEiy
	iOCnGWaHjdFpfcoANVVbo5+xj1cEKbJ0po2NaaGOcV6rOczm0qj91OESn5rJQomB
	cbp2puoU6N5kBXhYPB7fdU6Zmr+v8XR0DVvz1kYY6RiPJY9xdwoz46JvzRNmc7y/
	6piNHR74gHIJMq69Fqva8mwAr6NEA12GrG8dkU05W1FH/h0mNVn3DE97RCOSn9Jw
	nin8chTHh/jnOcrMqZpf4l7+OqmxHYAzRGF1z5f5bX7p88XmUOwnIH34uvXqdQmm
	BiRB+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga0rvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 11:54:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b51396f3efso511038985a.1
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765022093; x=1765626893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNZE3UbWIN17adEbRhpz6115KJRPJxsdK+D8hjXuU/k=;
        b=HTv2yX1VviDt9hkvOoeRzywcSlM3oTlwQMabEF3X1HKpCkO97sK16waTYfU9dzH77e
         BDa515j6t+2OxcI5A/ENKZr3uGP6bLpvdUvoh2/fOLPXr4mtTcFvSw3o4JL/lHKO8xs/
         Db0xmbanvzyyeT2d2weqxE6Zg7iFPkI6ZnVFfUtzya92n7OlnOjyllKkiSukVITlfFJo
         eFjaPbZo3YiYC+3MBdolVPNOnl6pzFHqvb2L4LBzrMg6ZJyaNxw4LCPDRsVrQPC9a10w
         /SzRizv7Ja5E4vp4ZKnDKCEJx0kpL0HRGW/yd3DYqXS+7sWKjtI55/IKH5TBugm9a2mx
         1k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765022093; x=1765626893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNZE3UbWIN17adEbRhpz6115KJRPJxsdK+D8hjXuU/k=;
        b=LrfThhJl7v7/iw2jPmPLkW/UmVE2Iw7nQAaQjJHlQN0SfHmxc+0V+u8c5J8SFDNfKF
         dWjPYmkWdrydmTYmmihefWTDyL+2FOTRsSrA79DRchwcnQoYyaRsK9/uXru9m5UVhsDO
         MwiuaQKsrDI+moVgndMAcpYtJnOQJG3XKRFRA7k4WgW4lFbDM8Q2xQxAv/h3kBAu9AOK
         jYrv36KunM9NyiDxTkssV2TjxNovysHsSnxELiL5Qut/D4sdtvpc84tleQ9w2VcaJFEN
         1kemEL8+75/8sTf+Qp9+3AbyEG11hEit9U0DQ+Qf77bNyMVqtdxPe4PADNauepeRS3Cc
         ar8A==
X-Forwarded-Encrypted: i=1; AJvYcCWJsGWKiB0g+0MFwZ51Fl5rO3cZLY5DkN1Jgxck2MLKWa4x/jaPFulz7m/ugxGnhs3T+x1yTxmC3kzv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1cQfONujr1zRQC9CEBRgjx1Ye2tYA0KYVinrjmOQJWQUPM1o
	EA7kQXUKUnfBnEv2KZodsc3My6Ql9gJ/nbIUZx8MirmjJ9HDbeQoMWmSV9SaFWPBCLoiPIio1CW
	3LRz4Y8YusxOmoOQ/wukf7fKjbGtoDqQFC1NRAbMeoNvNKkMWp3uZkDguMgL/TgO1QtCsdwQ4Yj
	U=
X-Gm-Gg: ASbGncvvVubIaA3wcXSnk9A4PTWEN/jQ3v9HA8TesXEepGxX81RFjuvePwAtYxrxr4s
	ICmPrgQbWPlKFyyrbDN9VfHVm7zDv9meknsWTV0CH0d+ST1CUCzkW1VBUXOOhrD8onSkivZ66vJ
	46R638jN9Hjx2BSHyhFTIAWBJ3TLrEbNfrYmZbpdYBtICKuky5+n5KCV829xb5fpJ0LYn9nc+9M
	zYqMROS6WMOQiJt+jnonNIbwZw/gJLxrXzoba8h6Ln/h9ZcVXEup4z1Pt6e3kJ4HL/qxqeM+h1R
	7dASfGFDlUtSbsn5ZKehIzSPzZmHtIbRiqRrQnXqW8D6TAq20TCz1/ptCsrdEm4M8BLpzxXU1sY
	3KMDZ2+3+5+t1vv2BfK6M63twSi32pwj0CGGMy06n3sNwmNarktY=
X-Received: by 2002:a05:620a:4086:b0:8b2:eaf3:5cd8 with SMTP id af79cd13be357-8b6a2351927mr271617585a.29.1765022092667;
        Sat, 06 Dec 2025 03:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiKtFvNiqym970oi+EC6rZhOwDHFLJ+652T/aWbJxEKq3u0T/98ycOO0NG6EXe5XvTeRrJSQ==
X-Received: by 2002:a05:620a:4086:b0:8b2:eaf3:5cd8 with SMTP id af79cd13be357-8b6a2351927mr271616285a.29.1765022092183;
        Sat, 06 Dec 2025 03:54:52 -0800 (PST)
Received: from [127.0.1.1] (75.13.23.93.rev.sfr.net. [93.23.13.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm14027048f8f.12.2025.12.06.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:54:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Sat, 06 Dec 2025 12:53:55 +0100
Subject: [PATCH 3/4] gpio: shared: fix auxiliary device cleanup order
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-gpio-shared-teardown-fixes-v1-3-35ac458cfce1@oss.qualcomm.com>
References: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
In-Reply-To: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4+8MUdLIGwmgJQ5ZTCJ32TvVumfGVbi42uKMZ0IhBsA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpNBmFR9HlMikVMs4YkDtBVQrSOmJJKLYemY/Rd
 +SahGJtQ5WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaTQZhQAKCRAFnS7L/zaE
 w/X/EAC5fqE6rLr6oi1Mt1joGL03kzKX0PnZ1flL9xXm4I/DnLkIRVHbnDmR2TmtoB4Exz+K31y
 mZXAvpWz6kgFdb4IlKoRjeW55qxeLcHM2goLgaMDN6stOjOXaKz84fIqTIU5xTsWuSEi5ewLDjD
 +tzBHpfKBnaXbsRQ5Qo/rhC9JpM4eoB1yINXCVfDgoTFyzZ7pclR21oopRPffN6RaB6r2srdPuZ
 awFNEcW+8hnGo+wXLJK1Z9dpYnON44zX561l+9Siwtd/gzWQRyuAaMFKihxIc2zO5Uvp4Mn67IU
 UiK6pvLqT0dIVakbWDnkOifwR4ZkFtcXI7BVByoYK86YTYW/+0rQVa+4zg6QNjqQ+gSpJy0wjqI
 odq/U8IBaxFXXJCq1nufqdgMuLKlSle1YHZ/dAFGidY7ze8b+ttSvyjfE7Sq/MMZzB5KQrhUfS4
 qa8yryqPZ14CVW6/i06bojLBsDMGsjiNZVXQlB1q0nTTNMjSs31nZ4LUCtCyBqyNpEOSlpbHU1E
 gLxnwJ/cez56Tt0RdEOcF5fQWxUzGBXIoGgZJV016i+RvatZ5nlxJPmWhRa4TK3zZQJr5veRMqz
 dSpm5jNkaGe6TYxRIg9nqeRnI7EpFnxr34MIC1iG+H6fOKlvBKoQX6w81FnaX5UQ4ZY6qgdDvVI
 N2kO+ySldNN3MtQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6934198d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OJCUNAs2RTwferbJ40Rlvg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jr7MYwWF2ZE4U8-iONEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3eA2FKXbJvpUyKKtj1uT5XGUMZApT80p
X-Proofpoint-ORIG-GUID: 3eA2FKXbJvpUyKKtj1uT5XGUMZApT80p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NiBTYWx0ZWRfXy2jYWyDfFlnU
 BNf7gK8qbFAboiW24NtrwatRhGcwcfOL3JBn9Bk+uWo6XwcEVrGRPTTb3bDMVe25x1w+cO/K1dG
 2cIJuf+eiK03V8sB8EqE345pjs4thPrExM0LWf2ULZBC2R6JeyhA3TyMYPDSwEHDFfYpXkyMVrq
 uZqZ67pS92mvRf56t62v0HvuHPDljlpQEJFXNwee9Ej7GDWodofx9lLOcQVzXAZF6PjkxVlnq8M
 M8qLH8nSINyVIfz5/+9nuQuXumB3PL2h/HV7Eng/6cmKV0DUH1C8Hq+uAEBvM4BKaPEfB2rucFI
 1caHxQMW43Uv5PKhcRxcyUlDQL2cMoiaFtYqAgMGITKru/lZNBbKlfY3hLbTTkEhv/uexmFg4zY
 1SMW9kOxn0GjsvRcT6qrTwMmBaYmyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060096

Dropping the last reference to the internal struct device should be the
last thing we do so delete the device first and then uninit it which
also involves the final put_device().

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 4084a28a953a7c9f4b04cbf867b05a1a74b557ca..2d3b0c3460e56941af8415af6989914104060bf7 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -415,8 +415,8 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 {
 	lockdep_assert_held(&gpio_shared_lock);
 
-	auxiliary_device_uninit(adev);
 	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
 }
 
 int gpio_device_setup_shared(struct gpio_device *gdev)

-- 
2.51.0


