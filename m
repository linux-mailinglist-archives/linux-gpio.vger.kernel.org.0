Return-Path: <linux-gpio+bounces-29872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C97CDBAB9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 09:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63530300E7B3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AB932E130;
	Wed, 24 Dec 2025 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwNPWQ06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dh80n/GH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5E2D0605
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564815; cv=none; b=a+TIZkpHgYTKlbZCPOVFHVvRFPG7QFXTejifn1+iZRRcV80VhFCMSJ2POlmCAt00RwKnS1lvmXQ2yJs7n7iQmIHuRRKdKjJScc9TvPVPC8m2ZfswWnuN+Rz0GXDlGkcLgWWEoV2sBNCCGvfBWGiw8r0NZc6Y8p+CEJGQMcTmJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564815; c=relaxed/simple;
	bh=kEukkR5Eq2Lh+oTWIDJ9Sr+EiCI4X7x8olDWRf1V+WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oLGTY/t4e9Qa2n3bOZGdIe3giWi0+eogPTryTDd+dbxr1Bfl5gwTCYMC/eH+P3yAz5uJB2OUnv9GGVb0Ut3ith0OBJVrRkJUEYzaPQJg6F5342QRKe+PlxfO23lPFy9P9MhiH73FQKxtijJddP0rmP/2Ju1G0+cLc4ForjVHu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwNPWQ06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dh80n/GH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2RWkM461728
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iHBaYPOP1I0RatHSw8m3Kv
	rGdWpDNwOzEoDaeklO3fI=; b=MwNPWQ06EcUbVvun5KNTn8/yP94JiSEMwbv/Un
	XAjRxjmW+/4AJrFJ7Ggw+/Z4UyTu0a/QIx2kCMn/82lBPjjE5mbKTN9rgtKgME0W
	lPk1MMuYWpyyjn8UdYDtVZAe+LtKbheClCu3P8+chugNwGE1mJCwtSONACM9TlES
	1rWpeHrpZjxG5W0LRyoch6TGScObjYgQfOeJ4vfLloD0V3js3eUs9FPJJpoVXla/
	pd7QA+jQLb+J90cjNIu/Nn3pt4m0nJN6F2S/Xmt+OaHqFwaNbiOCTUzWFuHyQ8hT
	hmFHUrQfj4i4gCs8v8UxUuvICIssstECNIemKwNxcym6+49A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftkxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:26:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso137672641cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 00:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766564812; x=1767169612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHBaYPOP1I0RatHSw8m3KvrGdWpDNwOzEoDaeklO3fI=;
        b=dh80n/GHDvTmORkGjm9+22MxS6ReN/gsKBu7JDSaz6LO3pxtr+h1MXabA+VPOpsdCk
         B7yeT1m9U/kQBX+F0se7wA/1TBcpqVc9tAKBUGW1jwn6FgmKhBCwiiVJcr1q0oaf5/+w
         zaiD4MZTkWDRB4UCOqQ2l7fnDf0QBB9r45mB6m2qPZAZ2x5VTDdq8qvB33G/le2rKtMG
         jLr+iitOXHyY3iTP2F2tGhFj8i9YmnpKFlr2SRJYIuDYjoKQKDf84vA2OxfbIz6xV9aP
         xu2/r9Z3Byzo4BVbCv8HfK3sECpxZHDkA65za7X8TAoJanssuzCFrVr7w+CpI3rrN5Vs
         jEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564812; x=1767169612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHBaYPOP1I0RatHSw8m3KvrGdWpDNwOzEoDaeklO3fI=;
        b=XuAcqW9+BS/nvhC2Dij0YAbtvHrsETMjd9mFaNS57iYtHDYuIFnsEgx9PqaexqWeDk
         P2UuHkuKpuE3tgKVy6/YoB52c20pO/G24Q2nPLVLLeTFCwGpe35Glwv3/EIZL5TJXLxP
         bPxUDApfw8MvKECdXO7k6mJiq/CHQFNiDDdNX+7MPA3LjtCEguEyC8hyDZXwJCnu2CTy
         TSiRPB4HCgPcaZfU3sZlPrR09ZvKeKBSiguGcCQePxz3n5Xnggi5I8pUP789V+DVCb00
         sk2LTv5rOkmPQOeNLQzpgNT24uDhIzw/POgsOPpyWsp+0fliR1fZWSUd9kxWhKvXQFoo
         Z2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxQPl0ZJkDWA7aGbs6N4KRbjrLSlk5Yj4YNUXHgcTPv790b1E1QkDqoBEK0QqDdCoNxmdIILliHflj@vger.kernel.org
X-Gm-Message-State: AOJu0YxrI9TGOjE7+YFIQXP2GtVbyFgjl4rAr3yIfxcHLFIuBBsoNOaE
	H2Y7uiXtczRTLZfPKZrwYjbRlxXs3Yvau14Nm+vBZeDlZ1G6tUf8EjNwIANr1ZUDQjODGKESsO+
	HVGwWELDHXR0rbkpvrs4SrZlNOXKsPV8M8rtmR9ftLZBGlZU7uQOmXb51jNfTAfPj
X-Gm-Gg: AY/fxX50g7d15AfEraRW9Bma4ZcOUx9/Mt9mVeelPWtYVM6QjgW4T42SM6eQgcZl+hL
	xpyGvoCZgxDBD2oJk9HnW8cy/9bDwwm9dbQ3OoKHHvhG+QxztDTG//T731ka33gDVWkOhAhbaL1
	5PTFZZ3jUEAgkwKQsZsv+7LcP8Gad9oqYvH40MCX9ANdHbPWdSBr9n28wasKGRpp/yMGOec/fCW
	Ku5gjOkTDSzobd7ogxRkcjNPkZpnreQkYLduxYnIJJc4K0jd1HyJCxyHX1cOF0bqjToWm80Qc+5
	bOg8XB8CobXjUKF2rz/5q2Wr6LXrlTNmpUBDk4n6zG/z+Q9ZusJp18Y70+Low6gAFD/okYZNT94
	9E89PG60d0tdJsTiTwC5dGaMmRF5Zwh403Cmkqw==
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr256905551cf.30.1766564811878;
        Wed, 24 Dec 2025 00:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBWvi8EJZTc3LhSCRMSz2GqGmopRvo6e/fgHihkmuVNTA7IkazKCFMrlCEcWJzaC1v+RCMrQ==
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr256905361cf.30.1766564811453;
        Wed, 24 Dec 2025 00:26:51 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7160:5da3:b4bf:5cb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325dacae0esm21939924f8f.12.2025.12.24.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:26:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Narewski?= <pawel.narewski@nokia.com>,
        Jakub Lewalski <jakub.lewalski@nokia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] gpiolib: fix race condition for gdev->srcu
Date: Wed, 24 Dec 2025 09:26:40 +0100
Message-ID: <20251224082641.10769-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Yw2Kv59OWBBsXgssPU_QEaO3xgk4YGtB
X-Proofpoint-ORIG-GUID: Yw2Kv59OWBBsXgssPU_QEaO3xgk4YGtB
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694ba3cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=9qxNCY_qAAAA:8 a=EUspDBNiAAAA:8 a=r4MMl7k3B_iAKFCDQaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3MiBTYWx0ZWRfXw9hWX+HzN8W8
 S+Qrso1PL1t+o+zb0+jUJa8G29zfZIzfoW+LbzGs0VIwcLmHTGLEViyZx3VIYaigBsOvX3BSjSD
 X03cxFCGDlozQ+8DJr12DPY/3b15421xC7vouHN6j9q5jGX7/X47qenQQAi31bgK33TbrNeLZFm
 sBQYlyfSeVkomMZlEhIKtu70pFKWPFCClbxteMZd4TTSufy0xGEAfVMph5CP2CTUw1ildQ/j2DD
 8Bg0S9Q08ZqgLcUx2FAtmuJynRKMAFOU1Jiay3pxKzfLsKDY+qbs7AmnG7xWJeOMXjCheHsK7f4
 BwDfZBCBfc6sxB6gTiuq0h08D2/XguLzL+SNkVAoDomfK9dz61fMuTUhzdl8kpkJkrHBQvn7MV5
 EjKmd/HtYybsy2JQNU7wYH+4jnYz7yuUyimkYoTgId4/S+haXpF7Oi3+JPpF/JuLF+Y54PBA/QV
 4GQJcVnKr1HUVFmTxLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240072

From: Paweł Narewski <pawel.narewski@nokia.com>

If two drivers were calling gpiochip_add_data_with_key(), one may be
traversing the srcu-protected list in gpio_name_to_desc(), meanwhile
other has just added its gdev in gpiodev_add_to_list_unlocked().
This creates a non-mutexed and non-protected timeframe, when one
instance is dereferencing and using &gdev->srcu, before the other
has initialized it, resulting in crash:

[    4.935481] Unable to handle kernel paging request at virtual address ffff800272bcc000
[    4.943396] Mem abort info:
[    4.943400]   ESR = 0x0000000096000005
[    4.943403]   EC = 0x25: DABT (current EL), IL = 32 bits
[    4.943407]   SET = 0, FnV = 0
[    4.943410]   EA = 0, S1PTW = 0
[    4.943413]   FSC = 0x05: level 1 translation fault
[    4.943416] Data abort info:
[    4.943418]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    4.946220]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    4.955261]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    4.955268] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000038e6c000
[    4.961449] [ffff800272bcc000] pgd=0000000000000000
[    4.969203] , p4d=1000000039739003
[    4.979730] , pud=0000000000000000
[    4.980210] phandle (CPU): 0x0000005e, phandle (BE): 0x5e000000 for node "reset"
[    4.991736] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
...
[    5.121359] pc : __srcu_read_lock+0x44/0x98
[    5.131091] lr : gpio_name_to_desc+0x60/0x1a0
[    5.153671] sp : ffff8000833bb430
[    5.298440]
[    5.298443] Call trace:
[    5.298445]  __srcu_read_lock+0x44/0x98
[    5.309484]  gpio_name_to_desc+0x60/0x1a0
[    5.320692]  gpiochip_add_data_with_key+0x488/0xf00
    5.946419] ---[ end trace 0000000000000000 ]---

Move initialization code for gdev fields before it is added to
gpio_devices, with adjacent initialization code.
Adjust goto statements  to reflect modified order of operations

Fixes: 47d8b4c1d868 ("gpio: add SRCU infrastructure to struct gpio_device")
Reviewed-by: Jakub Lewalski <jakub.lewalski@nokia.com>
Signed-off-by: Paweł Narewski <pawel.narewski@nokia.com>
[Bartosz: fixed a build issue, removed stray newline]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use the correct interface to initialize the raw notifier
- Remove stray newline

 drivers/gpio/gpiolib.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 409c2f415251..f834b324c247 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1105,6 +1105,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev->ngpio = gc->ngpio;
 	gdev->can_sleep = gc->can_sleep;
 
+	rwlock_init(&gdev->line_state_lock);
+	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
+
+	ret = init_srcu_struct(&gdev->srcu);
+	if (ret)
+		goto err_free_label;
+
+	ret = init_srcu_struct(&gdev->desc_srcu);
+	if (ret)
+		goto err_cleanup_gdev_srcu;
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -1119,7 +1131,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_free_label;
+				goto err_cleanup_desc_srcu;
 			}
 
 			/*
@@ -1139,22 +1151,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_free_label;
+			goto err_cleanup_desc_srcu;
 		}
 	}
 
-	rwlock_init(&gdev->line_state_lock);
-	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
-
-	ret = init_srcu_struct(&gdev->srcu);
-	if (ret)
-		goto err_remove_from_list;
-
-	ret = init_srcu_struct(&gdev->desc_srcu);
-	if (ret)
-		goto err_cleanup_gdev_srcu;
-
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
 #endif
@@ -1164,11 +1164,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	ret = gpiochip_set_names(gc);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_remove_from_list;
 
 	ret = gpiochip_init_valid_mask(gc);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_remove_from_list;
 
 	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
 		struct gpio_desc *desc = &gdev->descs[desc_index];
@@ -1248,10 +1248,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	of_gpiochip_remove(gc);
 err_free_valid_mask:
 	gpiochip_free_valid_mask(gc);
-err_cleanup_desc_srcu:
-	cleanup_srcu_struct(&gdev->desc_srcu);
-err_cleanup_gdev_srcu:
-	cleanup_srcu_struct(&gdev->srcu);
 err_remove_from_list:
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
@@ -1261,6 +1257,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gpio_device_put(gdev);
 		goto err_print_message;
 	}
+err_cleanup_desc_srcu:
+	cleanup_srcu_struct(&gdev->desc_srcu);
+err_cleanup_gdev_srcu:
+	cleanup_srcu_struct(&gdev->srcu);
 err_free_label:
 	kfree_const(gdev->label);
 err_free_descs:
-- 
2.47.3


