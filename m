Return-Path: <linux-gpio+bounces-29788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A625FCD5709
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 11:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D3E9300A9FA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 10:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D035D30FF37;
	Mon, 22 Dec 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZslxVUHS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqv7YEBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CD3112C1
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397705; cv=none; b=B2+qtzViCa4miunehTu0nzO95pYJK+1ceLKveegYfvtN9DKVFkFRwySViSrBAL44EB4qvRHmf8gGdMiKejiAPiA78AyUN0mL0WYGPK5tYGvoy+bT+km5cqQCBS1Y6XEpBy+WDTbPCm0LX8dbkes7f2hpF489Ppy6JxTZFTYEbP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397705; c=relaxed/simple;
	bh=L27WLTZVcxDySo0b2NW2P2T7jkbfMdif5zF3kG4wOsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNvsvRVWM9SvKFXhm2Ao0JhoWV3oc01ibDMTUOdxZDrohrrShYlfAwu/TNecUf65ofici4ncWNMBpGZ7Hs5g+iK/+2Gxa+AdkiCmad6mV6ReihHquvvsjrqQ4SE93N0zmLpNKIBgim/HRmJbODBIAFip3W5a6IR0ZF/NG1E4nZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZslxVUHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqv7YEBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7oKdd4176444
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qQ6b+qsM/QmOJkj60dMJt5f25gnShd+OIyr9ntovX4=; b=ZslxVUHSZj/c9qO9
	PVDGjWKJVtkM80YA52leUzCegEg4eT+Ljoe+D+Bx1McHn8S2aZ8WrMG6iZAapiUD
	lU4cPXmLXfk0h7z6Tk3Hym1hIPCCARxR+c6ZHiMub2LD8l0rii3l7bQt49SlUGw+
	fM4neKedLKzuZSR9s0mIQSbzPf2uKqzenfsqqnGH2M4cfh4oRz69MqqFLHXbxDt9
	23+3xoiXzsfRCnETb4dqh87enIHm6KbJRuNvl+CPoOsWlK5uKj/hG93220cxxC5P
	WImag1GumDojCS5u/+L0ZrwV96pOomrTNTRpPmu7aRp7bngbs8PYwheFWGFBbm+9
	AppmrA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmjq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 10:01:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a47331c39so99164656d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 02:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766397702; x=1767002502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qQ6b+qsM/QmOJkj60dMJt5f25gnShd+OIyr9ntovX4=;
        b=iqv7YEBa0xCPdGhZfR1LZfxAGzBOpcjENm94sG2Rt1HMVHbNigg4bk38IrerEJQLOd
         rF3n0mSwS1ZpMNYwYprrmKTj7aYAAccmvMLDeGeCaNoAXSng79CtVohONWJpNKda7qRA
         v5A4QhTZoUBKt9c6yGG0ndhWBRCkMJ+5Vy6wmU5X0zmgStTIOzx1aOCfnEvbUZwIWVET
         3W7fknpDQpUOoB1xre5iAXYOFUC3iLDUrG7l2tFlX18U7Q8vsgbjFZaupm+btv0C55eQ
         4NtA6/iI+KwTWO2aKLtsWvdqQdkwnYRNm6GNPixLAWc/Trl9B3DgA0WyEI9+7h0voSe6
         2ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766397702; x=1767002502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qQ6b+qsM/QmOJkj60dMJt5f25gnShd+OIyr9ntovX4=;
        b=KVjJ3buSnTR9m3us5m+ogIiyjeV/j6khhA4vgZHJFgN0RuwpNHqKwTnK/zvdiMat4x
         QodlwDVGjT2sTkI+iXAfjTYt1iXE1nWS9F1LHnc1lgwxvQ6+8jlbF9aw08O9ydO479Fk
         9k9VqU0nQBCnpMsiqACVfnK6jc18HPoIAbkZDkKWl+k+c0ojkJSCod9W7eICUXLn7qHT
         tNEZXv9wdu72pnoB0jO10VkQB0PRie8hSVd1ITjqdoxSlFPIqdC9uLa3Hr1YCnclfSts
         PcSXdBItfHYcwANz0HwR5e4A2yKKP8vXOPalA4FN0ktjkhgQs1xYVfr6hTVW3Of/b4cp
         dVAw==
X-Gm-Message-State: AOJu0YwQmHv3ENsTlOPA2w5sEyhRDHuuy4ErAWbkbCZNBtc39psYSI4U
	CZT3vIo2zOZzRG8jxoSM5doYpq59VBcAwtq/ASbSmA6D26rqJO+FA+BsVXMvPbTOnN/BgO+VQHl
	GOEZpDlY4jigkteG8eAc9wWcXYNuQvynkBPQLp4DTZ+7qTNGPgJorZf9aVazXrgmW
X-Gm-Gg: AY/fxX6vD0D/CivCXTVtitZYFjBVH7IVwzRrCb02+a5JMV3fWuXzh42w9CXfs0VebdG
	+JrpFqJNbdGOOiy6QhIV+eg59Vj9OPwWFFubygnwK8H8st431y9Sf/i/DNmTU1nbWZHwU2agOo0
	fQORQ9BfnL4FXKgIfKboZh+U86NiRKU8rhcIydlC0KOMjjq1P9hi+R7PwMMNWwI81th3sEGWCqX
	3/rjqkh29V9x+Af6/CCtx1JbNXxlIlwheTZnqf8zCMUuZPHgmLLezcBIdDMRjW3Hi6iZHJI5K82
	8RNEKiOCnxBLmtfJOwhm7ZOl176ZQx3jobit1g8j421Ne9gcfVfqA5jQqOe7jKr8IVIH7j3hdFL
	7aLhP/OEWC37UMjhq2lee+fEoBNTwCSN5uT+4uCnI
X-Received: by 2002:a05:622a:4183:b0:4f1:b3cc:2cec with SMTP id d75a77b69052e-4f4abd756e7mr155738451cf.52.1766397701996;
        Mon, 22 Dec 2025 02:01:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/bZBEaOVW4VHMf7zDTHeEKgEociCIx+WeaLncnMJ1QEoIpoooG+7dH6f5NVOX56v+L7Uslw==
X-Received: by 2002:a05:622a:4183:b0:4f1:b3cc:2cec with SMTP id d75a77b69052e-4f4abd756e7mr155737961cf.52.1766397701399;
        Mon, 22 Dec 2025 02:01:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd86:6812:7564:9961])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm8174665f8f.21.2025.12.22.02.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:01:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:01:27 +0100
Subject: [PATCH 2/3] gpio: shared: verify con_id when adding proxy lookup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gpio-shared-reset-gpio-proxy-v1-2-8d4bba7d8c14@oss.qualcomm.com>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
In-Reply-To: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L27WLTZVcxDySo0b2NW2P2T7jkbfMdif5zF3kG4wOsc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSRb+dOQL3UpjkCwQ0XPxXcu4Kl7MkZwENnpyn
 dLMN8kRMbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUkW/gAKCRAFnS7L/zaE
 wzW/EACayoSpEHAfpmWSGlU5tjHpp13nUZI0i4WuERfr5LVZM6YvEZQHVW5vuzoGF5hfqaW4blk
 AVYfigIdGavjubD2YurqvY2r424PzbhykTLqRowLcietcGPEXcIqm59jWfw+oZzDc+bFJCcdr0o
 mbxA9WCH0xJMM3lBON3QF19353wF65U+mG5hx0CKaWVS3Z2GMLgWFL7ogmwSfktvkFr+MybJKHY
 rPvt6UGzArpBZEz6SpBTyGZa6OXwlg3Pdy7OBURkn+BFFDDPXEOsPOoaUb5vvZdb1qQdQjIOWgi
 6DmdgPV9x0sZohb6m/xwfoGK6Kdv3UWDmjqrRP4jymM8r6vFiJO020NLanWgkJAIO1KeapAL5Bf
 zbwpeYDDkISPeIYbi4vdm9ziCQ7PbubOqvULZrz60LgPADxI4ZIvscmIVHbX9iW41HoL9UbKG8w
 ivMNwJJfKEO7exEaPCCL1IbFpjXF9/f4SA3oozdzFu3tsbHZ+sAh11erzuImpBTXQgje/IcWEMM
 K+W223PFY/8pwrwi+sFVSJqE2qAXQZPIZlM0XKNnp6+pSVuNmv1vDd/t+4w+5xfZp2F9II3eoF8
 9xr46rASfs19t93JNVp5AC2lq/Efs50RqgSFFdRutklo0c+LVtHkMv4eYCFoeaAFSPuC2FKYUUm
 +C03PuWD6kY96Jw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69491706 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dxZR3yApE9zKbSvtV-kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: MAbT07j_fRyHVwP2CQbYu8oYZTuCrVdh
X-Proofpoint-GUID: MAbT07j_fRyHVwP2CQbYu8oYZTuCrVdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MSBTYWx0ZWRfXyaz1MnQ71FeU
 97qn8IeErfQDxhwOWeBfBx1mTggHuzEUBu/FVcwuQaMpjjsMtZ2D2ensBgK1pyo3tg6rZWJDwnW
 nFlwNugLumY7pir8kcxpLGx3ldc1juyRw/AmnAcKcbagXgy9ELGzN+B4j5ZEoYTV/F3Tnzyh8d0
 QQkTpOMX56PfV4LHnzwZBajqbr+94HcX3lnB1CQJrmDhz53sO0bzxu98+3BwlkRD/k/061nkmk7
 xk2RefArkLDQmeXRThEGivnPmqyG2KiKToHUuaIhPLKOHaNE0av2M0hgFVGQOPLuRsUde+7blgs
 mkMVDReOwz1krch0Uf7NvbO7kRNRJBgKZ7jk98nQadDQcl1dDkzpmy7PskXu4ARYuMdEhn3NT3p
 IPsFvhGWQed4TvPEBd+TeRLRZXSzVsfuSSUEEU97i8VSFzPe6fwqCH1RQzGgyPMKUnHvGTn4mFr
 DVw/IryBs8qT+bCROjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220091

When matching the firmware node with the potential consumer, we
currently omit the con_id string. This can lead to false positives in
the unlikely case of the consumer having been assigned more than one
shared GPIO. Check the connector ID before proceeding.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++++-
 drivers/gpio/gpiolib-shared.h | 4 +++-
 drivers/gpio/gpiolib.c        | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index ba4b718d40a087608fc06f59d242932df1d117e9..f589109590c7c6bc9c0c1828ea15ab9003846523 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -365,7 +365,8 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
+int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
+				 unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
 	struct gpio_shared_entry *entry;
@@ -384,6 +385,10 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 
 			guard(mutex)(&ref->lock);
 
+			if ((!con_id && ref->con_id) || (con_id && !ref->con_id) ||
+			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
+				continue;
+
 			/* We've already done that on a previous request. */
 			if (ref->lookup)
 				return 0;
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 667dbdff3585066b7cbe2ebe476725fe7d683d84..40568ef7364ccbf08b7f583e279a7d5b572af477 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -16,7 +16,8 @@ struct device;
 
 int gpio_device_setup_shared(struct gpio_device *gdev);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags);
+int gpio_shared_add_proxy_lookup(struct device *consumer, const char *con_id,
+				 unsigned long lflags);
 
 #else
 
@@ -28,6 +29,7 @@ static inline int gpio_device_setup_shared(struct gpio_device *gdev)
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
 static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
+					       const char *con_id,
 					       unsigned long lflags)
 {
 	return 0;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6d583b3b07bb5c3e5886ced53deca7cd02460890..9ccfb7af67cca61207e8479842b78942a22cb919 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4717,7 +4717,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 			 * lookup table for the proxy device as previously
 			 * we only knew the consumer's fwnode.
 			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
+			ret = gpio_shared_add_proxy_lookup(consumer, con_id,
+							   lookupflags);
 			if (ret)
 				return ERR_PTR(ret);
 

-- 
2.47.3


