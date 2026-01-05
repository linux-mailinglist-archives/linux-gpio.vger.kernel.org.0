Return-Path: <linux-gpio+bounces-30158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B13CF4872
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E0A13048BAC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF2131B800;
	Mon,  5 Jan 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UpqUORlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esO/0oJe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD33128D8
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628352; cv=none; b=fSrw1rNBdU9DfW5LGDQDH+GE0tVEkVnKP5r7ZHosLxVYDzC+/yIlhn/4QGq/M2mV+SEtJpzrtFieUQ9oXHZNKbC6rKKcVoiqWyJb4pysT/mWqq+BrCyr3DTJ3SRPzfkaN6Xm/WYvB8FtYvJtk1m+IFola5vS05s0O2eOeqjuyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628352; c=relaxed/simple;
	bh=88fU9Q1RtvRooOHgFumdTGVQLrCQ8T9Jw9nhXLKqjyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdmjxd0SshR6sxfkpWiBCCrh1vF1LRzQ86FzhvnZoIYKF/hcJn59iNGJ3PTpZY6Nup82+tMS+AflwGXECx2h+KE3P5zCICK1kr4pf6/7BtuEDvCzyJqpyBrO5CGay4RtbLRauegd3bsXUM0aEXi1zJgalFFfSLFcbm8r9NK0Ew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpqUORlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esO/0oJe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059cUg33541749
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 15:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfu3+4Sa4IlFweXtEkqr53m/KsNOi0u63kwMWsXryVU=; b=UpqUORlVa/LI9WpQ
	Ivs0XJKhf5a+OH8pIhRe/wJhfWQ3OTfDVacY6uwUOPrSHb2j/iGMcNGl1WBbTztk
	eya2vZHlENetniSr68ReAwH/m2/rQjawBwvXAsbyzi/ocH5T4NEfLdZai4zgWjir
	nx5UdFlM+gnl/q5Kn7t64DS/ogU2h2LgO/wPeEkL4NxTKl+YF0CJ5tTJMsF5c1Kb
	o60TJUy3bj50dQB6v1gi3eapRFYQin1vjotbcxhYUoANvA0TDSqwiOrMN77QtE6c
	GvrLevKuCqIfC54ae38CeUM31fGbvbKqaTR8gZJjZC45YXL7Fg2XWZJCLn5e3Hvw
	jHHKRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57sj0ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 15:52:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74ab4172so637041cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767628349; x=1768233149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfu3+4Sa4IlFweXtEkqr53m/KsNOi0u63kwMWsXryVU=;
        b=esO/0oJerOQdezURYLjWZxcLCN1g480fde6uaFZM6jMz3r3gCPMN96aGUSTI/vZ1SH
         V3Yft90fyDnz01p5hSKLQUqDbvHB9JAcHgFZUYbnXGGT9bnkMFh1m77XC4vwoCUgMRhi
         xhdFA7fIzaT+SctFZ3A14+viRfc3C7+w1/gjjHUyhnl8kKNBULD9KpyuSqAy+jxFWIgn
         3iT3FXtx3zGSnwXW+hWZ4dMg3VgwJxY0xY+ToD9xCmmPrKsbFw0hKU/T6/cI8Z23edNJ
         U3jaso0WeT5ZDdHyvtXafBQ8q9yiFm+Nn7dNllt2lTiisYHDY9P7Z9aH65vIQPrEw+I/
         bIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767628349; x=1768233149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfu3+4Sa4IlFweXtEkqr53m/KsNOi0u63kwMWsXryVU=;
        b=T32ecvMXzlJC+y8JVgmTufXYyELy+xSSL5VwTJwPPHYBSvfBkora+almC0wmmKGGea
         27kBfmkdcsIvbGMmxss64Sr7CXZgATLRzRc8qkbnvBryrF4x4iCzsK0WIyhdptwALx+Q
         M45xVlJniUC7yR57kaQ9ycB2r6+eDi6HcDAfeV91FQwq9Rga/NJz0OziZeCIepqaNSYz
         Z4pPswCRLPJTYarl0uLZESqUYvd6qoQzNRuYuad/WqblwOnjpwoc82sMbyOCSghCVlhD
         /0TerYJMavMYfHq8/zbqkAQcskX14W+j/u98rU4mWAb1mSBzQDk9bMEGrLeHQFAQJwzO
         rV3g==
X-Gm-Message-State: AOJu0YyejBj+c2Q8oguUwIXb3BURYl966xEOG+CQBFkRqoizTabFNsGN
	kBTyg2ST6UA0QuQxG554cHrGczZ5bRw+p+r6q0dpwgskjBAuCWZs66p+FGvPQj2tDBSOXN7YtiN
	euVl8hWOz9WQa+/HXGvAkjGJeUxar8mOVzMAwJ+9QSczMo8pdDS9ykLMRX9/x7zne
X-Gm-Gg: AY/fxX5PMjNBlu1qaKdcw6pOyw/YCEzvC+Zh9D1T5zkf14U0tX7qPrvVI69gs+8BUgh
	g7Zbe7fj4v1LW7SyssCGyCdjYvWG4R2qx9sqjhx781drykoB+WSM83arbTJwe8MKDZv82Z3Na6Q
	ZuHHgGwiAIwmpvaQfQ8PShMGNUxYHISuKpnm/VLd6LFIrfIxUAWAzjYbYuBo3aFCgYE4ZmBnZdE
	XJHlHLBX6x6xhvI3oTpMZ58yA7UlSBfWRhlrUAi1BAPJJbq4UCVpNnQri790X6g+bPu1M0habz5
	m5N7c+aVWdIJzD5nRk1uMDm2hds589RBeKNoZJ4rtYMzv7t5z2w1mE1DQ6kfsEigr9vwG/2/kc3
	IaBEbc7kUSD8r5QH82CsI3ZSD8VYV1IBYbEdjFs0=
X-Received: by 2002:ac8:5d0d:0:b0:4ee:4a3a:bd0f with SMTP id d75a77b69052e-4f4abdd2f29mr781795121cf.69.1767628348678;
        Mon, 05 Jan 2026 07:52:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhH4jfPAP3afeRjSVMbE9ZBVWPehA9Dqr8KsG3D7BPe1iwf9lp82ebFju49ag7j712NwSCGg==
X-Received: by 2002:ac8:5d0d:0:b0:4ee:4a3a:bd0f with SMTP id d75a77b69052e-4f4abdd2f29mr781794741cf.69.1767628348090;
        Mon, 05 Jan 2026 07:52:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dd3b:c635:dd06:9574])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca56a24sm202757f8f.33.2026.01.05.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:52:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 16:52:09 +0100
Subject: [PATCH 2/2] gpio: shared: fix a race condition
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-gpio-shared-fixes-v1-2-76d6ff0afcd8@oss.qualcomm.com>
References: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
In-Reply-To: <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=88fU9Q1RtvRooOHgFumdTGVQLrCQ8T9Jw9nhXLKqjyw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpW943GQ3EirqqBi48szQmqaXroiIvHR4BfGsFR
 1hHspLqhfuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVveNwAKCRAFnS7L/zaE
 w8TREACTGQ4pJa6sLhoq0izT7dcCTIwbQp069duk76izxldIYDnYjGq5qfaMkc5KSHxQoO9Y1iZ
 T76iK6o/LxuDE5xLHeofuGBSWE9CDpm20WMBJAFicxfjt8cwuoRENuRjWQsdP7L6ofjSgDTa0wX
 kmDCi634oYZ51bVHUhRD86hlTAWzqVAIsSYv8CzOqXCCgSra21loJZbZhSc8nYhg26BmYDJMQAP
 /gZWqiA1TYJLIDqTd2bglioeeJctPVBhr9BhoVIpidje5TqdPkoUXrmleNim6WwCt36y7UR/LC+
 x8Vjv8YFO3aPw9qFiGhT7kfLRGTn04TTrn3iQ1anxeb3cl4e4DR9LxUI+rR9IbDEw7+hvWw6mA5
 1Vb13lzf/RTVaRRyRJMEUql5FZKW/avHbIp4AwUwRkoI4Xje1TEQVJNCx/xU+N0cudsPhjO4gEn
 ULbCTGiznI9iRYPlXEbAYGz9C6adUDg5H7TSjKgZUO3e2bgmt9W/vrGIN7Dt9fY4tuAdI9PaWsk
 TGrmoBlPd2OOkQuKH0AUlFUhaiE/EWF6CH26lOmC/5EngR83ErXVLHVOyGOPs7wAmrIOXRctS1T
 VxdwJfF+rINTyfDYFJxJL5NM/BByVTdnd3Thul01VH1/L+ie5DiWUcbYcVdQm03pLSE3DVbpegt
 U0w0XNoawI4PZ7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bde3d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=brN4eeYHC_r6Zz7vE9wA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzOSBTYWx0ZWRfX/72LxBjEvUyB
 3z+pJueB/u2KRyG0544rPwBWQrR0m/ysVtW1CVJJAB94vdx3MqMCD1Le6mLeuyKdbk2NmpRjMls
 IdYk+Hc+mSSdxjarOfyWiyhGYwtSLLkoQodcGYq26/2CjNtPwYV1QmRbBVniaJnZpdPM6PguSLH
 teNrhbi52FCeUSdwM575wTfjZx106Tjch4yL2IjorY7C2MR86onMBTOCOCImvF4Llt/mtK68DTw
 S4JLSsmlbu+aIUWjEv7D8GZtfXkbjzV/UD0LmpX+j+DzLAs/jAq0wQ2bE5q9zY7CqM3XNQ5LBeP
 +KaRiNx9SDsstxraUGqcGYtf55mzKCUsTDveEup9yzGebD6bkUfDACNoyLg5eM8mmLUPjho68CQ
 gi4d4Ac6mFw3yeUmvZD33YOcoVhHMJ0dxKS58mtMUCGMZNBrZGcIcS435r4czXeacuG/qyXUOj8
 WqnJfgrIiIW9j+Y6E4g==
X-Proofpoint-ORIG-GUID: 3Yon0gM6iMzC5QFeF7bgkmCiWLYf0LPx
X-Proofpoint-GUID: 3Yon0gM6iMzC5QFeF7bgkmCiWLYf0LPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050139

When matching the reset-gpio reference with the actual firmware node
consuming the GPIO, we also need to lock the structure associated with
the latter as it can change while we're doing it.

Fixes: 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index a68af06a6cc4e1e33946d7f200cecd4d3dc066af..198951c4c80bc0965c4b45a97f4f41ecc1f517b3 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -378,6 +378,8 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 	 * arguments match the ones from this consumer's node.
 	 */
 	list_for_each_entry(real_ref, &entry->refs, list) {
+		guard(mutex)(&real_ref->lock);
+
 		if (!real_ref->fwnode)
 			continue;
 

-- 
2.47.3


