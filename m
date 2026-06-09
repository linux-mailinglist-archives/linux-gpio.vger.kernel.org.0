Return-Path: <linux-gpio+bounces-38174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4riONyoGKGoA7gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:25:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34316660060
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VVF+vU5z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DcTg/ir4";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38174-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38174-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038EB30D737C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81495416D0D;
	Tue,  9 Jun 2026 12:18:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D2416CEB
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007487; cv=none; b=oLcqV+h3/UCgqT869I/3fiTjfbFU4KhRCTBzKLOPYXP0FC2Bz3EVRbSAIjeEFjdZfttdMtod6qliHpIfySJYSXpqj4Twfttx+y6J9eincG2qnvJvgdQwvYnyNd5hsTKDU/ZnQAsh+fQ0bgQCKspvi97ZtAh9tJMf15DknMVA9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007487; c=relaxed/simple;
	bh=vpvheKlTBoot2ZMcih6CkjDKeodophG0KBV9Uk6d5Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JX0c36mvFmVaTwnhy7yy7OdsieH+Ta0fdo9pCrKM8LIvbm7AjYLfH9l26HUx7nyTzh0L74j0fORuE5u89esLcMZ/yyHHRt/JoCZHZzUFa9ewS43Jcx0c9qtH8qtxNQLCue4yvAXXnhh2YQUjpcyAncqjc+WYZsgk5N/RPoa0u8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVF+vU5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcTg/ir4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnE7J2120272
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 12:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYtc7yUlRHBMopjDIVJ27EmySD3hBTepJZ+260m7f5A=; b=VVF+vU5zM0DgAZTu
	sKgc0MpPCzCptJub3hVdZYePRLpa7B8DAnLOt1FT6OqGL7b19WC6PiUG+k5s4wtz
	a/JZSRLgNXUGHamVyP0f13/e3cuebxti/mK16vQwSp3HqIjPWri5PXphJ7Zc37Jj
	DzQF7IY/5+pmu353g6OF1ejpJP84uGHJxVkSU9kgVhbobKWtVBzLTE3mcU/dNJUn
	e+c18jdzyCMQOrkG72JVRm9EdtTNdNNOLJDPAcFR7sDJ+zgvfHtA5u2xVAZNopiR
	tm+W31lXYDi/u6+zt7NHuXGbWouLeJzOdWFLhwKBC/OZrWOJREdA81gKmFGEHlV1
	jjv8hA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgh3n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 12:18:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178fc89b2aso91651591cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007484; x=1781612284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYtc7yUlRHBMopjDIVJ27EmySD3hBTepJZ+260m7f5A=;
        b=DcTg/ir4XxreDMMpt40gvJapWWeyhRqR9eyx9DeKA8xh3b73waOnCDubO81dmonHu4
         GI2AihG2j2bCX5pNwsQwmt7/j3WkYQBCUGSglvFnfUmvUnUqS9+ASyepLCARKFnOdPYC
         J3S3NC3WpDkJ27NZau53SrBW+9SDrwxw2JcBBJejCOdqSwJgXoFnveJ80Y7Ij1ClOCqq
         P8zUtlHjTgJQeFfuWDMSoG97yHWn4NM8KbXbUoVlwUCD/Oc857nnHtHV52dvKSPHNgbl
         OHd+AB8ZBzXRYwqEcsSlaQfIbRXtSNTQm1+C4UQhpYDqekETTKafnxqP8Ank8k166CV8
         pqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007484; x=1781612284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYtc7yUlRHBMopjDIVJ27EmySD3hBTepJZ+260m7f5A=;
        b=HqTrF8I2tYMz2sqVu76EzVkBx5OERDiuiSDHrUHYdbIbEoSPK5450kG/sFcz6RHhyw
         DwEPrXZXmDwpjUhTbuxyA+hhXagzP+SvKHhW4e7+gOCWd34gDqVgffme4in6JZiyaq+j
         BKmHg4WPkf8RyEfNa4/rXW1LQyHVDrtrQ4O6y6awKk2UdDR/sRfSayyp5PqRb5zi7dSs
         36Nr/A82/hAzfiSISp33oKwwg6XCjvrIlp8970bSWOTA+mvbYEcFZB5MeneEfIy1YOWY
         A/ipHZPHuUmQOSK89+A5op/QHvZsTV2zpbEJhst/TcU0RLZqYSgnRhAUngMpfnNA1gij
         ZT+g==
X-Gm-Message-State: AOJu0Yw50ffZl2XoyYDQR/ynPJ3HOH3TkQTTcVyZXPLR81DKMFaDPuOo
	tKXJnVEfw2B0Qqefe7O75ccJ9meg/vtHobWYD0levGVCuwMGsStbGxE1gPHIwtPDVyKcQw7mi3c
	FrcDwLcxnKhyKQLs8xH5vbsr92T3yTkRnX7PIL3qpv+JqUQpaE1CTcqtINGhqIOns
X-Gm-Gg: Acq92OE4AgaP1ooQIr3KClug4h8sRB6kMNmf8E3M8hV3H2QZadfkI4aBTQ0fSOCU6yy
	0rBk3kWr/h/puyT/3QE1YsJcc0JCJ1JYHZGyWlVRmdP3+vOgPHjIBKHtsx8weiKfj2otgOtrHvL
	2DEbQ6a1eZAWt0T1v3xR5aGyY7G96LylvACiFqjWXwmiIU9777E0ttlOOxMvbOzPgH76QMU9RhA
	V+kznARUzCdvMxLj98g0+oYHikV/TL0O2dyWCpMCdOEIYlCwdgA3iGIOFbKK4mXsYvMyFtitJdY
	uzlWgrloICXxr6MrxS9Qru4tFnfMJQSG/5x4kysT/aUwnHRRK63tR7M/NVbTSkM2126JMz4oM8q
	gUEJOx4X+u2qZ1aROUvGD4wXBT31+De6Y6ihIT+4RumIxeFP2NZO7fIzAqhTQ5w==
X-Received: by 2002:a05:622a:2516:b0:516:ddfa:23a4 with SMTP id d75a77b69052e-51795c8e01emr311466611cf.41.1781007484299;
        Tue, 09 Jun 2026 05:18:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:516:ddfa:23a4 with SMTP id d75a77b69052e-51795c8e01emr311466011cf.41.1781007483889;
        Tue, 09 Jun 2026 05:18:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm64099018f8f.4.2026.06.09.05.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:18:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:17:50 +0200
Subject: [PATCH 2/2] gpio: fix cleanup path on hog failure
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
In-Reply-To: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpvheKlTBoot2ZMcih6CkjDKeodophG0KBV9Uk6d5Mw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqKAR17xZyEC8KmVRAnb9cYVliFx0Y4/d2npMC6
 ip3bRmpLd2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaigEdQAKCRAFnS7L/zaE
 w3ZREACREzkHDT7I2kGq94l6E+Jcc/b4P6pswSBraw4z/LD4RyyEM3rmlkheVvBPDbSNCCng7D1
 8LxgSWkU2lQvAVhq/yGErojuG5vVwLOI6zAPcm8arw6jcsvgdVwU8035OkXMpDvtDlE3GiRnaAe
 IXxM+RyLO3mxsdI5fVjWLaaMuCA9fOuPbdJSYtsPhCnmtxSPEcHpQZJYooxjT2tp9tCiFCrJL12
 ubSQC4OvzeZ3HcWjlL1DexLuDeY9o5/2se6exU5NGT9ElSqpQTL+8Pa3FNnrAWOtOGqrHJ8tNWP
 XXdrOFDJ7QM8C0xl2xHU2Xt7VGvShslYhVyCXP3186Sbw1iCYa9H4pbFpo6Kp0sgWhRzAg/OmfJ
 cc42oRxwPih2qagbiSCgMASCjO9RrFCd0wMuTeGEEERPMLDLcnYC4MKPKyIzPNUJX5Q0uN+Huzo
 IyeNxjqhAJ9c47f02GM6zN6BeBbkxS6PKubjz5z8BbmBNA2lrDFnWnAg6rJEnpIAwvosWZwdhkD
 x1ND0E2ynUZeAz9O/n10uWGTvCKV2jamSv9ZUQT2h56oDvWapO5db9JsczIpkOzsBvYXDTmCijb
 pyXyHOlYEfC7FspzHhgWAwDGP5tx3ec/ED/Fj6bw2579LYKER3MtiqyxCfqIxQNt7d9+xeTGCCL
 1uESGmBydHzwINg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfX4+5MKXBgaBzz
 jKCHsffqaTCDSuz+mqANjU2EhsmWuROm8b2hXXN3s95copZEPbRrkRaFQJfzq0JNI24S4CdRey8
 GSHfqYlkVNLb/QEk/8WYXED/IMt4A834Su+JCs33GB80i4uM0xqG/9h0spAKS/DIX3YFDjm0zYo
 vUyMkHYcq5R8u2kdY3NpA+BQFe+F82pqr6WNMGxIJaYdzHACoyzQSsQhOzo5R5a+GaanLq8UlTj
 JX27vHt1wtdZYybyzb1U4tL8PmBM+EcoNVEyDVczQDLDbnflGM1jzREXG+Wez26Ee2wgFkQolAa
 zf+21VmSSMoUMcryhhHfyg9WWJQnHlhTRJqRkLjNkwun8BkqU9Svm9zlac/Z4UUVTUzRDiRfucl
 VxM2vPRo34MWfd0IqQiir9vBUMSnNSCZlCwc11S1J24wZo0yNgP8gVsKcrkrYC+u6hkzxgVlHdw
 csiti0ujWnlXHikLq4w==
X-Proofpoint-ORIG-GUID: O7Bw80trDf9Q7mIcNnTY5fZ411yNlcSk
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28047d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=3oFxPOZCAAAA:8 a=EUspDBNiAAAA:8 a=xCZgURHeKwfaKp8teoIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=LnykDHEuWDBM7K51tcvE:22
X-Proofpoint-GUID: O7Bw80trDf9Q7mIcNnTY5fZ411yNlcSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38174-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:mika.westerberg@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34316660060

If gpiochip_hog_lines() successfully processes some hogs but fails on
a later one, the error handling path in gpiochip_add_data_with_key()
jumps directly to err_remove_of_chip. This leaks resources allocated
earlier for ACPI, interrupts and hogs that were successfully processed.
Use the right label in error path.

Closes: https://sashiko.dev/#/patchset/20260608210108.36248-1-dan%40reactivated.net
Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1fc7ee9e1158d21f7c75e6cb95c33f0af44835c8..0cd79906d95c60035db1f6adc49bcfcfd3cc751b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1316,7 +1316,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	ret = gpiochip_hog_lines(gc);
 	if (ret)
-		goto err_remove_of_chip;
+		goto err_free_hogs;
 
 	ret = gpiochip_irqchip_init_valid_mask(gc);
 	if (ret)

-- 
2.47.3


