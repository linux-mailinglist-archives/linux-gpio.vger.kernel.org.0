Return-Path: <linux-gpio+bounces-30189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F7CF7953
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14FF830ED034
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9BD30C625;
	Tue,  6 Jan 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOYNCBD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw7uaRvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18682DE6FC
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692081; cv=none; b=Og6UZ225K2bNZeJR3M6Q2OLTIlxXT860HOozhKePYIoEUvqFseyXzCKXCOlkyiAu1xnguW90JmkLqd7A1/XVZ6wocI4wQZ/cwTR2GtxUBqrxPLAYdNs+hkcMTb6ZqJaDGtWIAJIr4DPT1dXL1D9AscabBWErSmu23m2l2NbcTjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692081; c=relaxed/simple;
	bh=UERTMG3e/bOHw3nQHtqYa0IAX/Hnv1dLVoWk857GePQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1/ChyuzHjlfIRCvZaWkhd4AULb3o6bOTZhIdrtPHSX0POB/lGXfV++mSe7O/ez2neMdoKuiDAHITChCA9crJBgB60VlvswG970rBMMsBJrwgxVWRO905bkcKssT8eKXuSHDoNp/3e5TrfPCKLk1f0u9Ug0qeh2blBGanbh5SrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOYNCBD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw7uaRvo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QCMx3214062
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 09:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5d8r1NNmwis8zwOib1MypX5zeM19jlIWAZ6ngmTdyE=; b=VOYNCBD5Q7cy3m2Z
	O2sEF2WtbFOiq5nHj3EF5LADEGBxihhnRswRYOUbtmMJg/kw8lYGfzKcibhpM30d
	jP2Uh3MXFOJI9riRWU+Y70hWKbJ2LbgvJ7nE33zhSkqYaJopVeHpMkJJsHpDeDGH
	f2qCtouynKwyZEfuW5rnqCSUIskIOgs/FeN7eMSzyAp0efBLubpUJKCRttCPd+Fm
	gcbedQGI3uUG4DpJ8ZuL3i2n4VBDU2UFDMd6BbEP6Z8Kkm6d0TjUyAbS6vMFsof5
	+OQx1+ITnmLE93fndr8bDM6/TwR1Pnt8rrlkRMiDSiIjmmp1KkEtq/Ol7NJ8K9Uu
	pKYgKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9jt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 09:34:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso21286491cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692078; x=1768296878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5d8r1NNmwis8zwOib1MypX5zeM19jlIWAZ6ngmTdyE=;
        b=Tw7uaRvo6lQtR4J5KrLdZ8rHZ9tuaJUXyDPbH6c40PYZEOe0nR12E1UXTmQXuNI+/l
         +xM2zCG51ncrVs3ZiaHVPCe18uDJOfYNiWVxex010CFFMOS0xheeHpXPhEo7paPbHDNU
         YP40c53C2QjckHql7t2eZ8hSuNJgx7bKYbdVJLH0MF8d5a/27JzpyLm7NCJjCFIES9pd
         gzJkv/X3gs2uxGsIxeEiobcALK7ZJgzvY4VfzSdkQiFa1GzdwnmYo8fV7TmiJxF+12MY
         e7MqXHEZh2qhHQh3H1lcaI3QWHKhRRm/uF72VcVeG8r1Ye69tCl7qE2QCL1C3JVPFJ3y
         pwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692078; x=1768296878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g5d8r1NNmwis8zwOib1MypX5zeM19jlIWAZ6ngmTdyE=;
        b=W35ptEZz0JC2tbThqgl9dNVKgLjO5mEsVUo4AJB819WrCu+T6NRkoKfMmJ8kaQy+Cb
         szgwZu2/+7IbKbfbmmUBcJzhV5YGUDUQmH/TljBIegeD6jKIKbLexUDxihfU8cKIpaG3
         YXLZMNM22OaldYdjHFE4m1dauHlcwO7TTkq8Cr1+wtlWyh3DiGt9BA5ZHwimXcOpdnvw
         aKyz19NhTGL5R3UkM+JGGIo3K+yHCTab4e8r7haArKtvdU0+59Ff14VTeIRqvQPddE9I
         DuHm1rf1WN6qh6mjZ8ZW+v4QiLZmkoLv52AM/+Vevm83s6HKnAl9am3I6rBjdUUsqtPj
         IPAQ==
X-Gm-Message-State: AOJu0YzOpI8fEgJ+6DGGe++sp+y2ve590EpPAOMy/kOrqGT2Ejhiulau
	sD4v7dltblr3GT6fxTnds/JHEpCty7zniRjwkdKd05Qqfc6oNCKSgEUE9USJSJWQ0p6QBEy1lIF
	B6x9cPxCJ3P4j82Km/hy8n/gw5xMjl5QUb7wYezkkrwH/2g1p3orINj3QPKvmH2yH
X-Gm-Gg: AY/fxX54rVLoo98jAZND/Ocft7uMPE6yCh6tzPJ0IObcMYyv+8T0f1W/L+y6nkLe6v0
	SlgZvGxHid804tl5Mc5Ua8Q8R4hIYRiL/zpt/TdpJaI8V/zHf88qsKxG8OCqnsEIuCgYvf97CCW
	tVSeDdm73Pq3Ftq/jX7+Mpg4j93kK3YWtBp75UftW3Y2j1tUxbGkXR/yj9jGLcoOJ5Dd5Pd3ZID
	cPT8UC5+LcBZmqBsWrKRg0gIYK9Z8CjPeWJleaFyO0h/KD5/+Om7lhWAjHf5BEv2OL7d6zZGo0O
	i3yA5a4lMrWpB6b3V0aOpIqabyyqvJzixcMHdxG/siqCC8uIqyVSCiOZEg7yJzu6rEVHSEnzFKU
	EaRpqjBayskwpzoh8oyPpbQxtTKDv+CmDLgDUZyvU
X-Received: by 2002:a05:622a:13d0:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4ffa784028bmr29382311cf.83.1767692078090;
        Tue, 06 Jan 2026 01:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTTL+YhZnYD+jZYhlb413v4NMlYIez8touZGgxIrh9zP7ArKd1UiVSMuUpUiJlsMd8fJB1kg==
X-Received: by 2002:a05:622a:13d0:b0:4f3:4cde:1660 with SMTP id d75a77b69052e-4ffa784028bmr29382161cf.83.1767692077697;
        Tue, 06 Jan 2026 01:34:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f66cd6bsm32013275e9.15.2026.01.06.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:34:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:34:22 +0100
Subject: [PATCH v2 2/3] gpio: shared: fix a race condition
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-gpio-shared-fixes-v2-2-c7091d2f7581@oss.qualcomm.com>
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UERTMG3e/bOHw3nQHtqYa0IAX/Hnv1dLVoWk857GePQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpXNcnrdFJEcT3C9zrnNyvrDHrl9VDCRrXOoWzL
 oEx3JuEsleJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaVzXJwAKCRAFnS7L/zaE
 w21EEACjKeEsoceX2X4ozlaO3m2KGOKyKnIz5IHPEmIqLdjOMpnNZTIak7x/11odpdQAj/7dSzh
 W50skCbd8dHmT838+WyfMltVqIOSjslPmiWIaewu2olLw+9wkuOMFxk4Op10N+rI3l6EHJ6FZk6
 Ek5dHds1qUsTl+WMsowXZ4lIxTsnfvqV3VZ9xMkYaXpIwixvEAVlEr1hOZvln/HBfUbPoS00QGV
 8VmyykpS+h1p4Tosxx/fvLXbu8UmI0jELVxiyTrJUPcPmYSWvdxYVNEiSEr3rUVnKAowmH5FW2o
 9DKyAOUsIUIs5AwjEoKzoiibULo+tOzMcGcTBOYAaPPJi2jrDAKYzyKsApAC1sc0pl7EjS4AeU0
 TJt+jxTdp0SzdEvq3XIdMHZhdaM4KHQd7AFqY1TrjhWAX9QUq9p9i4Vrb3f7kINKJ3WofvRE9Fk
 +6G9/K/2mCBuxt391EFvupHZ2X4mTTwqNviENB2HVxDPhhsYrL/r/aflSoB13rcJ4YPY+ZqMXJ9
 LZV/B/g/Kn4HC4ZvaXipkf0IwwKgfyAf6nVtEdqeRrNtVSlsU+zMvJhsOyK9xxFejvfyqD/rvAz
 iLei1EVJFMOOXzTH8X85Ou+8cwV4OTEmEmtj/sudFmEWhn+PXuBdD0O9tAcJYruqVHbWbT49CF0
 R4r2UCljB9kZKDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kESq3CLub5_zLTwACWtsifyyFy7dfbsR
X-Proofpoint-GUID: kESq3CLub5_zLTwACWtsifyyFy7dfbsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MCBTYWx0ZWRfXwG9/cU7yy7Ah
 vhr6RSKCeH5aOiapMWmJuq3LEO+xxocrbxOt/8fyjz/X99j8lc4eJX1a8N1YAWuMyfN1sFRS/sx
 BMFD17s+UziQYGu0z/TlMW5e+WlruuUJLLKPTvWDZItQ0KfP14ac6EcPV9XJ2305n4qM9D+qiCy
 G+bG0wlFTNXnxGfF/ab6hefx9+tXMBi/6UauBRc+bPP/fLaeyklEH/8VB1eDqj+WWXsEIlJkbTr
 acxXKXks35vyODp9oPw9cB3GggSoQqQfCGQdE+F8OiUrHhABbYlIG6FE2RvrkeUk7NWL5oHiWtD
 v34KQpx3207s4CK6B8SRvS5N4RB2B5M8xyL7EcLGWQqrvme52xBSSWmAVZ16GmhgzwKa/7CBIaY
 6KmrSaAQgQIm8GGGsW4fu6KWKxjvvyuLegfsXwGfi2Qg3FoCmeX3JCU+pkPodSLB6sS9gysyzdw
 bjW1p1gHsfZsGq035hQ==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cd72e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=5bH0XHadNbVE80xmesAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060080

When matching the reset-gpio reference with the actual firmware node
consuming the GPIO, we also need to lock the structure associated with
the latter as it can change while we're doing it.

Due to triggering lockdep false-positives, we need to use a per-reference
lockdep class but accidentally, this also allows us to remove the
previous lockdep workaround for cleaner code.

Fixes: 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index a68af06a6cc4e1e33946d7f200cecd4d3dc066af..4c57b0928760c3f9f251ca88cfc54ee5887d50c9 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -38,6 +38,7 @@ struct gpio_shared_ref {
 	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
+	struct lock_class_key lock_key;
 	struct auxiliary_device adev;
 	struct gpiod_lookup_table *lookup;
 };
@@ -99,7 +100,8 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
-	mutex_init(&ref->lock);
+	lockdep_register_key(&ref->lock_key);
+	mutex_init_with_key(&ref->lock, &ref->lock_key);
 
 	return no_free_ptr(ref);
 }
@@ -378,6 +380,11 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 	 * arguments match the ones from this consumer's node.
 	 */
 	list_for_each_entry(real_ref, &entry->refs, list) {
+		if (real_ref == ref)
+			continue;
+
+		guard(mutex)(&real_ref->lock);
+
 		if (!real_ref->fwnode)
 			continue;
 
@@ -568,15 +575,6 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		/*
-		 * For some reason if we call synchronize_srcu() in GPIO core,
-		 * descent here and take this mutex and then recursively call
-		 * synchronize_srcu() again from gpiochip_remove() (which is
-		 * totally fine) called after gpio_shared_remove_adev(),
-		 * lockdep prints a false positive deadlock splat. Disable
-		 * lockdep here.
-		 */
-		lockdep_off();
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
@@ -589,7 +587,6 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 
 			gpio_shared_remove_adev(&ref->adev);
 		}
-		lockdep_on();
 	}
 }
 
@@ -685,6 +682,7 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 {
 	list_del(&ref->list);
 	mutex_destroy(&ref->lock);
+	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
 	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);

-- 
2.47.3


