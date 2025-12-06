Return-Path: <linux-gpio+bounces-29329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DACAA5D3
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 12:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FCA8301843F
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D752E7BD2;
	Sat,  6 Dec 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgHuzie9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/l//y3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2252ED871
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765022098; cv=none; b=jtfgz7CKs7w/vlUDbKTeYxXYn+CHEwLpM63lJVA5PrsAFaJ+V2RY/VRR4BJWZGeWz+iT7lLzc1NUX1xaW796onh80UQAbHgR/MJMGPOBGz74xrkO87x4jaOj4HDZVItgnR3LFOCTD2pFGkVw4cFB1TD7gKLFME18oQhPNCkxGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765022098; c=relaxed/simple;
	bh=8aLPxI+qOg1Mqf3CpgVi0eSUBN8J5jmH1hgiR1sjyM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXivE0lWFw+02rJI8xwLwjeYN4BVGrNsT0dCeMnWChzcXjN7QMsor4U2XEPr+l7iNYpWw/ePGDk7KUBhxgP9ZIpEmUUR7Ht4rAozwaCtEyPzpaCbJN+3YrugxaUCYggIMkzLXEhe++iNTiLe804ULe26jOF+AaCBzSUVgwe7ER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgHuzie9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/l//y3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65YMNA2825814
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 11:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgMaxXIMAsnKLbG0ODAeG9yEejuvHdWNA2/k3eU9H2M=; b=mgHuzie9mlNM5wh9
	RMczdJzeYIRRVbVKFXJgzSJYnDyeCd0OuFU+OUvWFlSXTCVKmxI+xgD2tuX9oesZ
	k8xFo2cEgdhbeRCJqhQ96Q24vEyvK60eXZC71nzfnNv6DHVcd9g6eJh4HtCzd9GA
	Y7qUbZgSTuP2uIGiC5fAnQWqiYZCK2Ge+ORDBMCIbEtzZUPxVccjODGViL705Kov
	a/2PEuQoj3X/On4tsn+l7LJ6j0In/4GkmqMDep0CdNzJYcv3/WI9KT00qaihW8nb
	MPDOp5JYwXWvNhuBA2ftXeBGwRjhq0jfBq1DHkChfbISdPDdXGTQ/pQZeCOuoq67
	8q0o7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjv8nut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 11:54:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2657cfcdaso390631685a.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765022094; x=1765626894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgMaxXIMAsnKLbG0ODAeG9yEejuvHdWNA2/k3eU9H2M=;
        b=B/l//y3F1sbVgeloUF3yhuMrtXZfsjfPqqfxdyDErAIb1XrY2uobVbqH0kvwq8m+UJ
         6ALD0pZNwCQOLTNmvfAYR9SgnxLAsrTanr0uKexI0mSYYXT0W9mWmxH0HSVRK57Ee20h
         DTj5SEpjgiT2k5j7O07aF2PGSZfygKwB1kLSVKJnPQQlBBATDEshXbKovK8wAYfy7UpG
         taD7druH6IkaS54HRY5Q+vjTgOqBtpj5px6guf6n/6KQZ5z5uTdwidMv2pref/VhDt/V
         AyE23hp4qRjiu2AdtsqAnhQAY+q4ZlGvYj0RYCjeaej9kEI4jkP8WpOYOjbnnNIN2Fo+
         BEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765022094; x=1765626894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgMaxXIMAsnKLbG0ODAeG9yEejuvHdWNA2/k3eU9H2M=;
        b=U0sti4EY9dO5PKxaXXgVFR0oDSUZRpK0Tt/J/iU9sDNuri/rw+94GDxXIh85SDry9b
         MUHk1FDrR0nHpMjv9E2jUVwuzXaZvaLRFDoRXSWsAI7CrrxPihAvkOuYaDbEj6NmPHVc
         MypKvras0pTKMjx5iVv7PR9UMjYOoCc5KTo18thAsWCy0PQFAJHoHS5cub8QVY2hWj1o
         CK7LG9QQ8Ct/FKZ1z9pdg7THIw3PJJtMtn8+mOjFNsL1KaZR/ksDy8n3Ux9a4hFcgnCn
         D7H2Tmqn6mQ+xOoBuvARJ9V2uAT0R4ejWpCIAsLqBU9y2DIT+xFfHL3DnyboC0LvIbWz
         /PeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBnFKgcx6OqaQwzR6IsJgqPiyYiix9IvpqNwVPmjCXlZXLLHIyOmua3vl7QHJSvTg5ZcwaqUGDZGoH@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXJmmbv4XOPsQlzQ1Qq6rmifGouqujf8JA5NBirSaQ0sDfVkl
	HsoQLtY3fCMmRfvcShoMHoYlbD0wKUFJNRTFaEw8Nrd89TV8031P5Lk+uqd+c+bP72yIxFo+8dP
	epWJe3SK+UsNxHpg7Rzuonef4ljXXoMPV0y1wOSEUIVYNNAkub517XpceBCWQybOK
X-Gm-Gg: ASbGncs0BUrmBHNpX+jkyyWpNtXB54CYVzdC0GtLLR65yHosRi1mfw2G76kl/Ox79fA
	T7iuO/zDvE/JTF/Fw63G61+kxQOZLss3o6rcQanHrdSXaMcF7flyXXsUXONfrbCccxoUbQo7cF4
	PUEX7f4BPCPtViKuedFYg5lS2sywIvDVFf9ktUj29T6waz9oug/twLhga/3KW9CR80zreU1dQBE
	6y76hII+TiHYNVjFX0rimxzKW0YFtsSHrAsvhZnB83K/RTbEJNuHnDQPgEeKZAt1vK2ONa/SkEy
	vxlyPsvBkNzP1uo8vUClcuiEWBGoj7fjtK5FG1C51dXA2tygEN8yta8S34JJYJlDSgepm5iiUUs
	mGPRqlXhkn260gFZ5T9BXrOEXxeisCAkBq4PBXHlDvZZRxlQZ2Z4=
X-Received: by 2002:a05:620a:6cc1:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8b6a2351898mr271179985a.35.1765022094354;
        Sat, 06 Dec 2025 03:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfSVq6y4QRn/qaLx3GCHVDNEzvuyqVJVA48ihUiUq+yb/aJZMtUS5mjDrhtJR9e2H6c/M9pg==
X-Received: by 2002:a05:620a:6cc1:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8b6a2351898mr271177485a.35.1765022093729;
        Sat, 06 Dec 2025 03:54:53 -0800 (PST)
Received: from [127.0.1.1] (75.13.23.93.rev.sfr.net. [93.23.13.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm14027048f8f.12.2025.12.06.03.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:54:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Sat, 06 Dec 2025 12:53:56 +0100
Subject: [PATCH 4/4] gpio: shared: make locking more fine-grained
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-gpio-shared-teardown-fixes-v1-4-35ac458cfce1@oss.qualcomm.com>
References: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
In-Reply-To: <20251206-gpio-shared-teardown-fixes-v1-0-35ac458cfce1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8aLPxI+qOg1Mqf3CpgVi0eSUBN8J5jmH1hgiR1sjyM4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpNBmGdw/CpHc3NdjctUHp+gQ2eD0aIIKB0O65l
 u/2aKW6G5WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaTQZhgAKCRAFnS7L/zaE
 w3FYD/9Z/trMqRnnmD3n+td14xD06w+oEbFr6KqYCmzwmiK6vVjPo41quQdILLgUAYnKf5aa+Sv
 jRf6U3xghzX7BPBFD7pL1L6sZ+XQV+YBZLlIEK8Oqxd9K5k68qXXG5P538yM132TQGm9A4kbkd+
 vAfCLth4lSvRVeIj4oeTVTfDkzmq9WE+PjylFz0foHtWHdTZK1ntHmYk3gu1Yo4WBri7GztHD7o
 Y30P5uxNHH9rcP/F4N7JGnZAGKi+tQIRcrtrcOI7LkfxIgNt+1KWJnxj7XkSF+BtVCatzzQK+Lt
 jrKB/ScrAUiRTyuvkbcy9Do852tJA+7QbMxOY6BCMMUwok6Zygxx8MiGh17h5NpJizBxYlD36iA
 iS5YNMymbjBbRrBdtmQMC4gqYboZsGSST1leGL8sr29hCDsj6EBtqmuLBSZjO/aS3LFG0wib3rX
 TIRfMl2iwwF76PniUNTKSXVdwfoWqnjuonDeuL9oueUEBgpxzQ2sRBDt0MjxuiaD0wepBZStPTD
 j1Xik4PdO0eVsiep9NmshUQxt2pp48wzPBM95VuHvqptjigAfSFeUC2OMM6Z6YlCqMil5tdoZrE
 zWJof1oqymzxHnbpVyUDK7peuOg3rtS7gKBhUqCrPRFbXO9BwE8IecLz8NZoCX9nC9Bd9o5zx1O
 V2+1EdQIPvJmAWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6934198f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=OJCUNAs2RTwferbJ40Rlvg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4uwEqWdDE5ZWJF26yDYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5NiBTYWx0ZWRfX1D/25uQjNV1d
 kQdZnzoS2DFhdP52x6om8OCCWZ1AlMF4vlgIb1DRs/l/mnWqVSNnKeDlqTDoI2OHGYkmjjtwMVN
 ooPAGfmUA/4/iGCQ6MMvTGYJhMvZyfD4gvnGJX739sbTlW22pEaZAu6KXsdQj8vlYiYjeBy8HrL
 ahMt6C9wdnkZ5MJ10AaB3UTRZhj2depTZvztXzc1eq6ptS2i8qoB7bW5rAexoobFiZoJ5yCNX78
 Lhr98ZwE2Ms7LALvFGpunjJDkdooiopLb8Eu3vzsyoOeHdU0fS0COQCN3PEG1Ut/S/xZFd+tPmp
 Xozyent7+cIbOLTaeZf9z6ukfp5vaBtrALyL96FaYF+VmvspCGd7/XLnYSmk6nB/5LPZ03ZFiBp
 e50Vu/4HWiD/tb8WnROg+qVJFbXD8Q==
X-Proofpoint-ORIG-GUID: -AbcDlfPFEF_o2DPO9a_zvSUr2VX1lCx
X-Proofpoint-GUID: -AbcDlfPFEF_o2DPO9a_zvSUr2VX1lCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060096

The global gpio_shared_lock has caused some issues when recursively
removing GPIO shared proxies. The thing is: we don't really need it.
Once created from an init-call, the shared GPIO data structures are
never removed, there's no need to protect the linked lists of entries
and references. All we need to protect is the shared GPIO descriptor
(which we already do with a per-entry mutex) and the auxiliary device
data in struct gpio_shared_ref.

Remove the global gpio_shared_lock and use a per-reference mutex to
protect shared references when adding/removing the auxiliary devices and
their GPIO lookup entries.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 2d3b0c3460e56941af8415af6989914104060bf7..ba4b718d40a087608fc06f59d242932df1d117e9 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -36,6 +36,8 @@ struct gpio_shared_ref {
 	enum gpiod_flags flags;
 	char *con_id;
 	int dev_id;
+	/* Protects the auxiliary device struct and the lookup table. */
+	struct mutex lock;
 	struct auxiliary_device adev;
 	struct gpiod_lookup_table *lookup;
 };
@@ -49,6 +51,7 @@ struct gpio_shared_entry {
 	unsigned int offset;
 	/* Index in the property value array. */
 	size_t index;
+	/* Synchronizes the modification of shared_desc. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
 	struct kref ref;
@@ -56,7 +59,6 @@ struct gpio_shared_entry {
 };
 
 static LIST_HEAD(gpio_shared_list);
-static DEFINE_MUTEX(gpio_shared_lock);
 static DEFINE_IDA(gpio_shared_ida);
 
 #if IS_ENABLED(CONFIG_OF)
@@ -187,6 +189,7 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
 			ref->flags = args.args[1];
+			mutex_init(&ref->lock);
 
 			if (strends(prop->name, "gpios"))
 				suffix = "-gpios";
@@ -258,7 +261,7 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	struct auxiliary_device *adev = &ref->adev;
 	int ret;
 
-	lockdep_assert_held(&gpio_shared_lock);
+	guard(mutex)(&ref->lock);
 
 	memset(adev, 0, sizeof(*adev));
 
@@ -373,14 +376,14 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 	if (!lookup)
 		return -ENOMEM;
 
-	guard(mutex)(&gpio_shared_lock);
-
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			if (!device_match_fwnode(consumer, ref->fwnode) &&
 			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 				continue;
 
+			guard(mutex)(&ref->lock);
+
 			/* We've already done that on a previous request. */
 			if (ref->lookup)
 				return 0;
@@ -413,8 +416,6 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 
 static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 {
-	lockdep_assert_held(&gpio_shared_lock);
-
 	auxiliary_device_delete(adev);
 	auxiliary_device_uninit(adev);
 }
@@ -426,8 +427,6 @@ int gpio_device_setup_shared(struct gpio_device *gdev)
 	unsigned long *flags;
 	int ret;
 
-	guard(mutex)(&gpio_shared_lock);
-
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			if (gdev->dev.parent == &ref->adev.dev) {
@@ -484,13 +483,22 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
-	guard(mutex)(&gpio_shared_lock);
-
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
+		/*
+		 * For some reason if we call synchronize_srcu() in GPIO core,
+		 * descent here and take this mutex and then recursively call
+		 * synchronize_srcu() again from gpiochip_remove() (which is
+		 * totally fine) called after gpio_shared_remove_adev(),
+		 * lockdep prints a false positive deadlock splat. Disable
+		 * lockdep here.
+		 */
+		lockdep_off();
 		list_for_each_entry(ref, &entry->refs, list) {
+			guard(mutex)(&ref->lock);
+
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);
@@ -500,6 +508,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 
 			gpio_shared_remove_adev(&ref->adev);
 		}
+		lockdep_on();
 	}
 }
 
@@ -523,8 +532,6 @@ static void gpiod_shared_put(void *data)
 {
 	struct gpio_shared_entry *entry = data;
 
-	lockdep_assert_not_held(&gpio_shared_lock);
-
 	kref_put(&entry->ref, gpio_shared_release);
 }
 
@@ -562,8 +569,6 @@ struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
 	struct gpio_shared_entry *entry;
 	int ret;
 
-	lockdep_assert_not_held(&gpio_shared_lock);
-
 	entry = dev_get_platdata(dev);
 	if (WARN_ON(!entry))
 		/* Programmer bug */
@@ -598,6 +603,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
 static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 {
 	list_del(&ref->list);
+	mutex_destroy(&ref->lock);
 	kfree(ref->con_id);
 	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);

-- 
2.51.0


