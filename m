Return-Path: <linux-gpio+bounces-30178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FFCF75B3
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 09:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EE09300D819
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 08:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB09309F1C;
	Tue,  6 Jan 2026 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXjLicC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UaABfruY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDA2DCF67
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689585; cv=none; b=Es+dLDpIg3lQ+IcHEfjo50GpQ/oAEZQTMBfk75/Hy73+YD6wzMJkVEvIeQkksK4oQOyCyUHKQGzJyMZKe70grtRWxol8PIhcEyKilZBDMeOExqeaGbjRWE9gkrmGM7/mjmamN2n1HysO8bZGQBLopOziI4H/7ToHCOpJyYpcsR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689585; c=relaxed/simple;
	bh=Ye6JVG814YK0VLq0FTCoKeYtppyAVBZhSr6sPWI2Kos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcqRWgVWiS0MDem1JbdLi3fi4zXfqFG+qiNmJvWSc9ZHng9y4pPoYWWg8RX1FrIbJ5QFxN/AiK9LZmVLj3tPIqkFVQ5xNtuUsgFeEJ1XQvbqesZm+QcShLsfSc1HRs+EyTer9Ch9IF2kGIRE5uVGrLRZ8PmFIv6eWvwXApQ79FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXjLicC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UaABfruY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q9g73073039
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 08:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwD
	shA9XlDU=; b=SXjLicC0Irkde822s/1KkHZ2zfXDNTJAWMzY7aDz6iVz4UDNNwF
	dKnEmyagBgUXPuLiNcnklbfwZCKsdIsC1KLrMY8D81r2UgTXIIPZIQoLI0ip0hXz
	BqlVL/aUbb10EtjPv8i78N04HwMwM3vRXogvKnj+/8EHz6Be4QmRFChy7lMQ5uSd
	I5qJcpk35el2nT/tMD88mOY94kx7xNiWrRXsj1THPrYBImvLzpG+6NmU4/1/ajM2
	h21yzNfSEuVmQpSNi1IQLhrRrJvrVrLX9FEBL3lMpd5uwe8glUkWhLFv6RrZ3ioK
	JE9L3Fhz5e4D098CQeuXnbx1z/ISt0IL3XQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7h5yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 08:53:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a92bf359so20304831cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 00:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767689582; x=1768294382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=UaABfruYIN/1HsIm+qASRGc6cTXEQWviJ0q2CNkbZqI5+0uiciEMB7Edc6cXJI+1BJ
         j9X6+b6aSHtS0t4aPTUR5FBj4VIImUPwUnUQONj0nz1nwD9V2X6xMaXPcYKEptps3XNq
         dVVH+Md8Wgv5H4mwjDAryxPj8Nu/AMiJh63qRRDrvHQctlJL/nuT5CRLBp8EMofo/LPF
         X3AC2npaClXSjVC0xx/sBmSIC5rZXdlVXZKaVwtusZ7/6i5xPglqyvo5yqtSXF9Q5lxn
         wvKwTZRn8zleYgH7To7VdHkoDj/ec60UTTvXJWCYhrv77rvimFanOzrojTEbZs6My14v
         5i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689582; x=1768294382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT7o+24nrLXW+Y1n/DARQ2Tlmwc67dIpMwDshA9XlDU=;
        b=HwXoR16NoKjJ0H/3dsZHuszBFJIzawPzcxGeI/ao9MwGxsQTPKV1KB1ugWNNay/Jue
         jwcRCGGmXzSVNDsWzsRoRZVZDGr2YY/IL78Gz7qvbrdW8VKpVwnqhViu1o242EhSgSy8
         DWei3bEhMyAdWmki7Ayc5Sc/HFimuL9Hy/oK4QNcV7cMJ1PxdZjbf25/EVQTiqVuv9aP
         A9TeQ/hKaR5QvoWaKEkgC1cV+Kk/A2RIYm7NKtXR+sgHMrWxF9VR9Ze7G19VNgfxDEoZ
         9Nll0nPnPICjMHliQpkvmcVUvDmEPeLuCJY+uHr7UxvqoIeYElWQFQsEl4MOTAhckl/m
         oq7g==
X-Gm-Message-State: AOJu0YzbAkiLxhUOSstmq6jTMCQI2UYwOEDhd90gT/1wn85mhF9EVbdg
	/QGkDXJ+UxQPbtsXwExocGb3PT6NyF81c05ao9X7zEtESsHqmZqWpaoAr+Ody/8T6ixuGdrBGAd
	lJK06RmG4S6E8pjSQOuRcxRg+jwY36NhqNzCMCvJaap2EKj9GSRPf0hOXzH2Hfkoi
X-Gm-Gg: AY/fxX4zwMX+hyHYUPwB4h8Tr9R9A3Bo8dWvNISACmwGq7cDJNh7TFVtnWDHfNXOIjX
	sLIBWPy+v68mxmLs7P/AtXgM3e1faQdhYMyCGvUDOQWNeM4T+eDqVJNUIk8/YiMPrAyb57si/bZ
	hMMGx7u0R02x4SYQzrSGrv33dqXMpVxFJi1RzVxP8jofn78n/KZtJNBok5XbTqcACW5nTqGkzdB
	aqbqZo1e22lxhFt3i03nm1wEwwNCL+wg8scBUhMiBYDpW+K1GdMSHD67Y5129N73X3d8hx9/TUP
	B15ePWKFbx5AUQ3CgnekXhLyfAhCnLPt45hGxbvfR7hKimYHbpeR3lA3nzWtTobEMHkQDmNXwPl
	r/+TIJtIUgL8b643cTg8DXLkj7iErRakNoPfaiyA=
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528261cf.68.1767689582035;
        Tue, 06 Jan 2026 00:53:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7E9Dd0gEbHGw/qwmI9Kg/hwl220mH23Q9cPSWqNcPBGofT1gZNovh8hqrkCtABFulpregOg==
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26528171cf.68.1767689581612;
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7fb1486csm13152255e9.5.2026.01.06.00.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:53:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
Date: Tue,  6 Jan 2026 09:52:53 +0100
Message-ID: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cys5TP5Dl5vvliv0au3drD9FLf_70CzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NCBTYWx0ZWRfX/YLkwgRBWRbr
 RZDYb97RC8hbXTvln7Igo/l9ABUNe43SIQLqjDauWM5VsRZDoqcCB9j+vIE7CxCu3m4Aoi1lZ4t
 GySb5+JkvycwcbxVKJAmK/Ad54uKa3IZDXo79DLWE9K0VZbqYQHUkewIbrO0Lh/pgDUWYW9GrWP
 0NLcw6X/fqecNTDdMkQ6VOLtQiEwTmhSVeFW7ElO7cxVD+lINiOvA6wdYKn6kU45vj2/5R5zYyA
 /HAbHH+Z+LJMLUxIPWW05oYLA32ohXmAEYf9DPkcA0ecTFILCVibtZnLZwCqb3F81rH1atnS8pl
 nzKu/5sfQm+DsLBYZtRcBpC+CDy3qiND7NnSoeNagHHRPhLY+hQCDuKU1ZPWE6L/quvTwlm4jaB
 ndfrqXhqdYLQCV8t5G+Cgp+UTpH3QiK+auwafqgviMsnAYqmD8lqndWKAr69bfyKOP5SLaVlMRp
 MpktiF1EKnx0MdZTZIg==
X-Proofpoint-GUID: cys5TP5Dl5vvliv0au3drD9FLf_70CzN
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695ccd6f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=qfAtFR7Ekgvq_9IDEGwA:9
 a=dawVfQjAaf238kedN5IG:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060074

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization. This will cause
lockdep splats when used together with shared GPIOs going through the
GPIO shared proxy driver.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Cc: stable@vger.kernel.org
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index d9e3a8d5932a..ded7b218e2ec 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -893,7 +893,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,
 	.get_direction		= aml_gpio_get_direction,
-	.can_sleep		= false,
+	.can_sleep		= true,
 };
 
 static void init_bank_register_bit(struct aml_pinctrl *info,
-- 
2.47.3


