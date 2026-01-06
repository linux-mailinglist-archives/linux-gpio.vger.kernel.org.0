Return-Path: <linux-gpio+bounces-30190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530BCF794A
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1C7030F2BA8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD67430FC16;
	Tue,  6 Jan 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5Wr5Ok5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJIwiJ1f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605130ACF6
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692082; cv=none; b=cfqRQJxv0K+p9WEw87LqHiUlYJnadSiAnKatX7fAuATy0vfitlV5N3F8zfxtgR0SPh6Fk++OZZwL9Kn6yRbcTDj04P4PCfUxqieFdM/qb59ONL86SM6D4y1fpiMU/BChjkGry2pfCTao4dM9LZ9varR7uVAOEVdL2SqNuN0AAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692082; c=relaxed/simple;
	bh=6gdBkxEP/hTMAz/yyCxL6tCJ6ssERpAjcgaAm77KEts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=im8DnRXDqNI+hGWulP+oGPAE5BafiClyCvkpi06aVUF79cu7x1BHqENXP2zUmA2sSGvK8v3ZNcZqSQfdUjI0tHwBc0pG25oizZIUtIvJ5qLmnTt5j5rftZqsZHdoByyV01BRYT0yq2KpH607ZecypccAbScnxx8HKKA7WxMT3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5Wr5Ok5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJIwiJ1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QSEU3443141
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 09:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hrd4iZmdtKSO8597lpVeLcHuvrDRRhO0g51FyzpLiBc=; b=N5Wr5Ok5qGzy2sP/
	VNBtrfLuoDzjml6bzzpTaG24cRdXqfVCEQjEOLbUDBHDDt/G0RD7+0b1WxrnN4DX
	J6i3VKun88JXMnx9OVONPqIxuJDhMrY6UhwRq+XnZ+VBAns08vAnnhVjvPKxXiVl
	FijpRlRp/5c1ArhHUwzA8GDqd37X/XbPbR88abI166J+TPq3DhFvaFwf0GpmYx35
	QgoMU9reIgR/gr24FAp3j6DTB6UlmZQj661EcI+pzKMWNYugdwlu9c0Jcr7EeHGE
	SBpku7YyVO/fKruNZHWMY2sjoyrujNoJJII/v9GQ2PseQcwh6nz4l9In8taNxVfp
	IYtt1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9vuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 09:34:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so20612671cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692079; x=1768296879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hrd4iZmdtKSO8597lpVeLcHuvrDRRhO0g51FyzpLiBc=;
        b=IJIwiJ1fx/licxHmFdH2B37vjr6ntHrVKiLBbE+tqUsRAVUEPc7YlqzMDUgCTaj52G
         qhwDdzHnxF3f4x15a3/XGmd7t8rUFVyxF6yTa1y4q6gx3r/ecfC9fUtlF2tOIdJZBViS
         kiNFxmP/vlVhn5zpol41YGgsZqYNoPj3g2INIRM+TIFSU5d5WmIDTzR+N0DTPRbn6UKk
         HoLchnrC0s0jngw7nA4nTKlHbF+RICPcy+NAWrYLMQhycRMs6vdO5P7UPSAnnzpdSvEM
         MwZOfB6HlmLjJFCBP0w1DMczOiOYyspzpZEhDJo8RWBKm3Whe4/EACBTnuf8f+BbGUY5
         BhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692079; x=1768296879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hrd4iZmdtKSO8597lpVeLcHuvrDRRhO0g51FyzpLiBc=;
        b=jdoAyItBP5A6Cp+FzzNHg3YXjmQpeXRaFStRqY1pEP8zjbZmKNY5NcGBuS2UcxQPlJ
         H/b57BC4i5sZ93bejCdaY/H14WDW0Y4hLpuWrzxUXHG6A3zwt3Wth9INFOQ251wdJOcY
         VGQq0JcHaYVSeCLHE+a/lCDisBY7JfCnWQ2hLTR9S79/MOHtBv0WMv9Zl8uWxGHsXhk7
         eE0BFLiHZZBL5wDEPVZvpzFq6ILcadkcY43qFJtOWVe11ebUl6T9iij4z3Ce5NgfCENw
         fGJv773QcjIwKpZDG/CeDvCBovrjDxWF0jzP8QPJuANrh/OeMPZk9CsAiHlKqDgd9Y+z
         Frcw==
X-Gm-Message-State: AOJu0YxJWvQsG2drpcu03wMVYuuUc6PGfQdgTEzYJ3GoqrdhoFD0ll38
	6p9BgA0obDvrxtW22AgUVvXDCrpy/b845nRQXXoB9ZGN5CiH5kB11ODLaWLQYrUnrS+GamLiuw+
	hZO9ILLeC1tEYNMb3SngkRyVYM82Gt/s4Wft2DMpQpTOnUtnrJsPeZQbM4GZz8SqvOCkItWyY
X-Gm-Gg: AY/fxX7jRB3o3z3/YVLsTAjKc/0FoaT1NEvbPNHKxBF5XTT78KWDtqeJa7kEW06KYB+
	fYy3we+2HJCXXqUYFkEsrlf+fy8fCiGOS6Zn+jLA8lVGp8EznCgnUfdBMJL9YJUc7dMi4Aka2Fa
	Wt578T/d9jX97EHzlX+9qBmT4ORYfvi6c8Pe5CeV2FVZgMVMSXAR73dDCzgoSGnzpIl8JLxqTZS
	VPgz3pfl/7uaupsaFE67zyiw83v895mGUeNeLoFg7HGaKkLa3Cn79PK3SxB2IpGge2u956TJgcA
	XzTkpXRmv+iVVTtrwJ+gBjyFIbLEvWkfgVaPGsBZEzasKMK5e95VHmvXeHN45ciGcZ8TEY8nqeP
	8ro9VrvSuY6tgGM7hUcb+vYFol3ED7jtWPPaQGU2V
X-Received: by 2002:ac8:7dc1:0:b0:4f0:2f0c:e91d with SMTP id d75a77b69052e-4ffa782419dmr30642291cf.73.1767692079184;
        Tue, 06 Jan 2026 01:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFg8ssxLlkAY9OjBS9142G2En9qJi8N8fPZ9RGYsqYEq73tjKYd0WcfY++Di+UCxSK/q8PgA==
X-Received: by 2002:ac8:7dc1:0:b0:4f0:2f0c:e91d with SMTP id d75a77b69052e-4ffa782419dmr30642111cf.73.1767692078808;
        Tue, 06 Jan 2026 01:34:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f66cd6bsm32013275e9.15.2026.01.06.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:34:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:34:23 +0100
Subject: [PATCH v2 3/3] gpio: shared: don't allocate the lookup table until
 we really need it
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-gpio-shared-fixes-v2-3-c7091d2f7581@oss.qualcomm.com>
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6gdBkxEP/hTMAz/yyCxL6tCJ6ssERpAjcgaAm77KEts=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpXNcpJeOYyZfnDryffIHGSZjVzdD6tzt/s7UT2
 cIGYyeNZ4qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVzXKQAKCRAFnS7L/zaE
 w9WjEACnBgkbZlOOp9UQ+W3G3sTNpo1uttdY5sfVg1LPGFxLSH7gTiy+mMq2/1Z9pQb5LEt3P8l
 jzdY1y39zKF279B07yodRe/4tbLutLmiivemv+uomqY+j9A3/sOcTaBlupyPPDtX51VlD9fS9OE
 gNtVecJDI5g/e0qCLhN9x/sU9++tSw+0B9lebgfvlwODYegEQDrhzY12uRxd7SPI7eOkSoL5E1x
 WD13UpVyI/Ac/BnFDpDit0oiU3GBg8tUpdvrBghhzXDowtjm5c7dftcZkMwBNIMZYa+TQNflGbA
 djaP9WGjezaw1z90+Q/5QLSw0C5DhSkwrtiK6sA86eDPPp2/eYdM7hvqI5yAKWPI40iCuLJbY3Z
 LuIafKRrDO1Sim5YCclcafy0VPc7/F3XIcUkyGQod0fswKjkOi5Dr5Fc6THHzmaQ8xiCDRjC+qh
 JHrZu17oj3WxbXlVDaFCJYbC1hz0rb21qUr7YXtKqX8d39xPXROSa+Fdfv/rvIoqLW5hdBcNhts
 FmYT6Am/2ZRBqgBvMkqgmxW86v4dTmwB0M//qVA4XmzPG8vAc19Wki+WuTOSM9RYW/lRRYDWZDQ
 c00UyvgT3VllmJ/B+iv7WRNO9mpbDvIktjDLxVtrVYgDmDJeo7zHdTLuD7xBd8Aba93Wn9v3H28
 5yK940JnSvC5bIQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kicxiE_k869NMqrmCE-zcGfYZDnF1MVQ
X-Proofpoint-ORIG-GUID: kicxiE_k869NMqrmCE-zcGfYZDnF1MVQ
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695cd72f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qyp2fEuBoOJgs2tQtksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MCBTYWx0ZWRfX/TM/vBH5KEVB
 2JJC+UHjZXHdbC481h0ZM9z/XwPTaTr/7WYPI/9f9i+++zPOC8A86kTfc6sM2JP3U/boO3XmfNQ
 k5bAw2X7SotNVtLWoPRMkTIiL8kUaP35beSqU+1DD4N+tz+yMUL1BpupUgdwkzS4rN7Pd31vUtr
 vCYkPWZNVyu49v7ErtitBAPcQlNUubKpcVie4GXOsTvLKOWBx8Tpxv4GGiGuXqIT3VoMKB8/Nvx
 rm5flR1LhNlYKT57pTaPCmzDOv68B5+oZZB4iR1381DQrMHW5jeR1BBlj8aKqAMMlkKj7ryU7Gq
 5D7bKMdJZQFFuPtJEepUa/bNqYL3K6xcrPM35tkWWHrp7lUTOW9GY/MODZrfqN8I6Gm3gN9NxVK
 Qo3vaUSPzpBqWrXuGmyH0beNAbvv45vreLcCxNl7s+pUvAUF0eEbWbRmMSfHtI2RfsZi0pRrNX3
 zYReA7INv4/qO+EubHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060080

We allocate memory for the GPIO lookup table at the top of
gpio_shared_add_proxy_lookup() but we don't use it until the very end.
Depending on the timing, we may return earlier. Move the allocation
towards the end.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 4c57b0928760c3f9f251ca88cfc54ee5887d50c9..076d8642675c2723c8938cbd22b1b51014c23871 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -443,14 +443,10 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 				 unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
+	struct gpiod_lookup_table *lookup;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
-	struct gpiod_lookup_table *lookup __free(kfree) =
-			kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
-	if (!lookup)
-		return -ENOMEM;
-
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
@@ -482,6 +478,10 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 			if (!key)
 				return -ENOMEM;
 
+			lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
+			if (!lookup)
+				return -ENOMEM;
+
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
 				 dev_id, key, ref->con_id ?: "none");
 
@@ -489,7 +489,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			ref->lookup = no_free_ptr(lookup);
+			ref->lookup = lookup;
 			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;

-- 
2.47.3


