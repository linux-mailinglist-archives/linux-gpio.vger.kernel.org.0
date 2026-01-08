Return-Path: <linux-gpio+bounces-30273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2104D0327B
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 14:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AAF73049198
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 13:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF2A4C9E32;
	Thu,  8 Jan 2026 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNNC1cFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erbcmGIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4284C9A2E
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879576; cv=none; b=Jub8O1xv0XRbFDETgf7X6O427zUIGOfvi6I0NyPMkVX0UiKH3CKNXBRAtYGKJA6PMxeerefnymIuikyOIAbStsTdrjkpmxIgqaLOBhRkliIzEvp5gmlC3c8bgXIgTyzcgQPfr5Gs5jE9TundGHWwPjyVL/aM63zBcmPZednpe2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879576; c=relaxed/simple;
	bh=nCRiDCaT8yK5ye8iHjJw9IcWUflG3KmvYZ4eH9WPKZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J3PsMVkJkPW88FskYef6Cz/5J/pnQ+ThdKH2E9t4uPJjZ80nF+Y1zA93jhFFY3pXBX7vAH86qBLIWG+bxuii6MFeu94c46VLTZ1FhfiUrc9k1Eh7Ws0DXvUYc1DK6KDx92vnE06KBnLB0ZtIhdXX9lnoJobDRrp1CDiSPl/oEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNNC1cFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erbcmGIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087Q62j1258456
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 13:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=733x5L3JU69gmVDQP6/lL4
	XGh5m0v/GcKMZkPc8vrcU=; b=eNNC1cFDUxHoAq43NxigMO7fZ5xnZYD+I2Wifp
	6mChEOZgJuB1LKjQln3cJyPjV06Z4fzRfe/fKDf7p4ut6sg8qocEoTO0W95MvSbe
	2a8FuL4r2aNjzWc9KwIa0xwRTNao4w+v7oszJjMG635o0JH52al8l3e0zBuhFYd+
	RvfS+LLRfKNyIe9/Qvr66dGw0ZzWpxiREKiZRQn2EAoKciKhV7YcMgAXQ1Uo/zQ0
	31fnhJeqqV4IXfQHmddWqOfluKNR7CuigxlZUaBUkmbZTKNtqKc81blQ2P7nQJwj
	JQs+QOc/NS940o0mlcLxe9K70nfEaFvnxnY4+diR/AK3ULVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86gs345-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 13:39:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso924438685a.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879571; x=1768484371; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=733x5L3JU69gmVDQP6/lL4XGh5m0v/GcKMZkPc8vrcU=;
        b=erbcmGIpKguiCpiuqWq5CXwx4YKyrIjyZmnzmp2C5fpUOCgOmHQ55sJEuvv0yuAm46
         O9SaHfOmpW/TyuIPWXKaLx6+2hJ5ukGq2iM/etJ90F0/qZ+WkApljG887QuaIq5j058+
         7CWsS2cIznxLhPOGEu/tqm1eqcB0k1LTWUm1F+Ah/KGqH7wcXwfpodcdcmJFUwbFdB5s
         hxtqLvNlbjrq3WJLMPZcnc17ARllPs3yrH1Y/eTqtTJIYo9wgI9oqheji0+CFben/BW1
         18S90xOtcCRW6/fC2TJYfGOBDn7uZi6/is7BfZSQm/svmMNukc7cW1IXGeMNxquyNZXE
         rDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879571; x=1768484371;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=733x5L3JU69gmVDQP6/lL4XGh5m0v/GcKMZkPc8vrcU=;
        b=d4D52zqjjuz8/gIcqnpMRAoyYz6QK8Y9vs8EGwVVzmF2LMvFrLovZ4gfr2uv5XNymj
         LbrPPVC4uF9x5AgJIUqL6ZYYDQHwImJbXO9bG5fhetAtHtJX0kF+8/f0u21N1+o1qxjy
         QPUuOD8dqcR1fjspErr3AG6x8V5qT0M48FIrQmCXop8+7HrdM9HRsAv9Q1NMQLnZIxK7
         VQ5ArV0SAk4Mc88f7q4odjDJgT/gnTsS5QFFd58XpuPDmECWRdaaN86jAPHBOrxppzDP
         G4/MOBvxYfQB23dD6ega82l1Y0DykKNh8zDnfek88PNSQ5dd3nUnQO8fZXS4tR8fNqlg
         KlBg==
X-Gm-Message-State: AOJu0Yy6SzHBmd3z/1MzzwoxEruyARGKSs8Juna1un5CDJ1d1TbaaBQO
	D0PazlVuIiPekcD9XN9c6VcwEFp1IAKVHMis0pgr0NR8nFK9K9GyF+zRhdKUPLVfmeAU+1DaiJm
	9kPhxuDoO9BP4lZZt3U3l4gXpF80IG+GAxz9+gHlQ1vveMGLS4VQXCnlJRec6qdSF
X-Gm-Gg: AY/fxX57UnFMxSJqa8B5x1uc37Kzlb3OfpwDn0t7IDRF38GGyo+GlfHQbIXpkmxkyLp
	5lkNpy70GemTAUqmKV0udQZSNZ0Olo6TC7JtGys+mPb2W5ZweQU1YYhMB1P7Mr+cXAoFFQmBy51
	8k0xMQmAQkg48O1UuVq1PENATfwjvWjc2gA0LlWexpqtpTV1wEfsdmvzp+9rzulWgn+Y4rJDvS/
	zZJ459KLUeK+TE7ZTW6XCMidhf2QTcccGGaYn3swQYbLqjsJc2mB04q50ArHaIAb2rGNjkS2Gvw
	AXgPHUBAw7ZpNlxcNVz/3gRbOlowZJzDBlwmE7lem/F7KP10QwU0Rbo4yEmd25fD/zSN4vopR93
	4nvlkTel4taZ0qAnRhVfxlVvv0E13UPrDR+y6VPs=
X-Received: by 2002:a05:620a:258c:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c3893f7e49mr762586385a.60.1767879570801;
        Thu, 08 Jan 2026 05:39:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZdxC7dh0OB77YvPHWkJ1apfDQISjG8KTfaLYvrKSDHxYPPqIPGscbzAKY2oNRCUJ1FewAXg==
X-Received: by 2002:a05:620a:258c:b0:88f:c0e1:ec2 with SMTP id af79cd13be357-8c3893f7e49mr762582885a.60.1767879570377;
        Thu, 08 Jan 2026 05:39:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5171:301c:72f8:fd25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f686sm152930485e9.3.2026.01.08.05.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:39:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 08 Jan 2026 14:39:19 +0100
Subject: [PATCH] gpio: shared: fix a false-positive sharing detection with
 reset-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-gpio-shared-false-positive-v1-1-5dbf8d1b2f7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIazX2kC/x3MTQqDMBAG0KvIrDuQpODfVUoXg/nUATEhU0QQ7
 97g8m3eRYaiMBqbiwoONU17hX81NK2yL2CN1RRcaJ13PS9ZE9sqBZFn2Qyck+lPD/AA17+7QaS
 dItUgF8x6Pvnne99/mhWb42wAAAA=
X-Change-ID: 20260108-gpio-shared-false-positive-9e08379aa6cd
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nCRiDCaT8yK5ye8iHjJw9IcWUflG3KmvYZ4eH9WPKZA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpX7OLwR27FnXinmfI56jPOMbMNSrBPnTOoKxf7
 VMcsJCevquJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaV+ziwAKCRAFnS7L/zaE
 w/jVEAC658jNRrJsZKWTgi9njV4fjHkX4/uwMQCi6sxEhMwmB/f0shgnzwG4IG7jA3o9V+tUHuA
 zttpw3cedTyXP8KvtoUkni3sod/+p3Pmou2zaAb1pkopA1qzQRIeLmGnlIpNdFJNkYohFbLRpEB
 40I1Zceq4QGE8I3f5fhn/bArFxpuUeirIfmf28yvlDaBPJ+oa/2xqWVk3X9+vHzloUJVTQ8iPQ5
 Km91LZB+5VlKeqjAObAGq1Fmye4twQtntbPrjD+tI/S1n1ind7sRGNco/3zcS1WKGVQ16MeZWlX
 9kRLQKTjCwqUxvU3dLutVVnC0fWFYYiyVip8klSCne2/fAknSw3oNSqWixy0ynQwlVzTSOBW8T8
 S/vTwKGV3BUeZ1rygw1OgavmypE6PNjGoJGEDm/l2oNWv2Ava7Pit99sPSA++sx5VcrDs5BVPGF
 lwfd9zuVD2TPA2Y7uxv3TaIr8fRsg83+l6IZ0DSeY6R4vmY352M5aCJDVxd/e0PxYkBuQtCCP3Z
 tnZEfy92hBgJHnppCPg0fe9SEVMe5G5MEgQ1SPyCuUKl4o69QWnFoB0QGWGc9QbiyjnTkhEsG+j
 9JTFOaY1Ue6LrPIsAfUS2B6CT7f9p+352H6+v3KjVuBbDDAFWRnhabxKZJCF6ok8aCG1VHd6Ft+
 RBbPmwjCHFLs0yg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695fb393 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i1YPiP8vL7GWhwZyTnAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 23d1g4eiijl5RnnaqqLnt92KEnxT16V3
X-Proofpoint-GUID: 23d1g4eiijl5RnnaqqLnt92KEnxT16V3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX5I0MxVvV8g2r
 jblacuiXQsWxVc4/xZEEvJKgOxHyjGKtp/0cfq6MVk5QOFSH+w9vIGzgiHxwVlQ+TbrTZLJ4Hoc
 sbsCojIcxbOAPnL/29nLm2PDV1y8KafBtoBI2lXM7vlmX/ErtbDjuTyVfMdcZaWubmE8OP+pPXX
 PulMzHNO6AJB3XX5pO28wYfiR5gKwfjgehGK32A+pjRjlU0PPDl9890o4ux5utUriTx8w5Kf+Pm
 Ezp766+aZWiGy+at1fIjgVYV1u8LsemKXB1QbZUgxGmqVJ3kPq5Hw9X8CXhbNrOiIl7YZdxDS7G
 SQlDt+NW6HpuWOtA1cTwFK8xg+G/4OPYkGloX6JzHJO/LEREbk190ER9WCwCK6dVB1+/ucn2g5N
 V3MHGQrCWBEnQv0bDVHZYIwp0kr2CmXR6I2H3IWsiZzKjLo4kfZBZx/zUe8J/MXb1cJHlBuUdlh
 b4Vw77hNGpEtunA9N9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080096

After scanning the devicetree, we remove all entries that have only one
reference, while creating GPIO shared proxies for the remaining, shared
entries. However: for the reset-gpio corner-case, we will have two
references for a "reset-gpios" pin that's not really shared. In this
case one will come from the actual consumer fwnode and the other from
the potential auxiliary reset-gpio device. This causes the GPIO core to
create unnecessary GPIO shared proxy devices for pins that are not
really shared.

Add a function that can detect this situation and remove entries that
have exactly two references but one of them is a reset-gpio.

Fixes: 7b78b26757e0 ("gpio: shared: handle the reset-gpios corner case")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 076d8642675c2723c8938cbd22b1b51014c23871..17343fdc9758402b3cc7c8d61ee908591c977539 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -41,6 +41,7 @@ struct gpio_shared_ref {
 	struct lock_class_key lock_key;
 	struct auxiliary_device adev;
 	struct gpiod_lookup_table *lookup;
+	bool is_reset_gpio;
 };
 
 /* Represents a single GPIO pin. */
@@ -112,7 +113,8 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(ref, &entry->refs, list) {
-		if (!ref->fwnode && ref->con_id && strcmp(ref->con_id, "reset") == 0)
+		if (ref->is_reset_gpio)
+			/* Already set-up. */
 			return 0;
 	}
 
@@ -120,6 +122,8 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 	if (!ref)
 		return -ENOMEM;
 
+	ref->is_reset_gpio = true;
+
 	list_add_tail(&ref->list, &entry->refs);
 
 	pr_debug("Created a secondary shared GPIO reference for potential reset-gpio device for GPIO %u at %s\n",
@@ -714,12 +718,38 @@ static void __init gpio_shared_teardown(void)
 	}
 }
 
+static bool gpio_shared_entry_is_really_shared(struct gpio_shared_entry *entry)
+{
+	size_t num_nodes = list_count_nodes(&entry->refs);
+	struct gpio_shared_ref *ref;
+
+	if (num_nodes <= 1)
+		return false;
+
+	if (num_nodes > 2)
+		return true;
+
+	/* Exactly two references: */
+	list_for_each_entry(ref, &entry->refs, list) {
+		/*
+		 * Corner-case: the second reference comes from the potential
+		 * reset-gpio instance. However, this pin is not really shared
+		 * as it would have three references in this case. Avoid
+		 * creating unnecessary proxies.
+		 */
+		if (ref->is_reset_gpio)
+			return false;
+	}
+
+	return true;
+}
+
 static void gpio_shared_free_exclusive(void)
 {
 	struct gpio_shared_entry *entry, *epos;
 
 	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
-		if (list_count_nodes(&entry->refs) > 1)
+		if (gpio_shared_entry_is_really_shared(entry))
 			continue;
 
 		gpio_shared_drop_ref(list_first_entry(&entry->refs,

---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260108-gpio-shared-false-positive-9e08379aa6cd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


