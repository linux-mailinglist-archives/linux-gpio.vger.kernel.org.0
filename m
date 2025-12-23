Return-Path: <linux-gpio+bounces-29807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D219BCD87CE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 498D930022EC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 08:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECCA320CA7;
	Tue, 23 Dec 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="h5aPzGSl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD031BCA3
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479837; cv=fail; b=VX+YChFzdLgd7+ldWbCQ5nAXeFEAt2bLKqDJAL8pZfuT+HFRPteDjCApSG5UfhUdqDCzDqx795FIbkdEfDopaa6EDeoi/ojC6OD94EQfmKzoul1F23KrfV21Wk6WFANw16nEXbLkQSmnU4jsBGhbe1UeKU08hKsvdJUN6UY/KTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479837; c=relaxed/simple;
	bh=pukTzrEZSxHT66XFwQioXTjKVMik8bNXgXoAq7uTyRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRXt6rY4GcXxiU654XVQWBi839T9ZYFMcv11kZCEwYryymEGVZfH61LmXVTdDqW1BQeRg7c1JreE+Ebf27R/i//r4s5o3grf1hNDpVARvPwDK2Qen+Jjh56K/noBhfs81vIuHss46mqz/ZI/LUZNKcEE1ptDCvmdQ8Sz5sd60AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=h5aPzGSl; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB2snRLPKEhSFsDrBhHaGVETy8efzFlBLhDl+KBejkJN7wB3cnHJkJ0MjIu5WPm9IdkzB+nddiQ3eJM2n4fjg0ptgj8sUgRv05VJRHovlWeMV5uEifEOPVeKVI91XgxOHhdmJ7SXibdE8YhYhNeWW2UNRg/GYF5727as2MvZnfgFTx4WcP2Mx0iADtNUwkIBjzKRZ+l/OLJqBGKGSw37RbBFN0boc6aPGypDj9/eUUe4DWVGIhW4A435r5LWHBP/Q1ANExtPcMow3DRkFw5IWifXCnOTeN9LBZPTNNrHmNIkJp2fojaEV1sF0vRqwNj0DV8C8WgEsAIacRC84Qdptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAw5fA78xYQNU30lMHiPml/EFuQdobxZ8aIyFbpErSg=;
 b=DS8IqqxHUhqBQnRKnGkTfAIkZJ5IFqhKSSa4HikeQZ+rJKrowWWpS69IcZNpZ7D6RPy73F6Xy7kzmiDyMdcQLGsbldQ07/6dfcUvZEcxzBCMN4tJzRwwQmUHe5TnW8i0ghGaBc0oYzc8AAyOnV0Smgm9Gpzbwe09tVOfd9eBUPoFe3R/B9TkB6Se/tPOoof/8ZzZviQGIzpNOhmN2ogJv6wo/c9TyF/yT8BKwFanfnRaB2W5QHIfuYiDXY8jqQEeGaTQchgXvW4QEV3xPXqNGvGTBXtSLW0vIUO1Z7rZBdiku5h9xMD7DvjqKv62tugvlCFubwzeRPaBpD2US0xDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.1) smtp.rcpttodomain=kernel.org smtp.mailfrom=nokia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nokia.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAw5fA78xYQNU30lMHiPml/EFuQdobxZ8aIyFbpErSg=;
 b=h5aPzGSlBgUfRnpxOEOZYGtbJU25zvCvq+QVE7VNSZ+IKg6iGiWRhSt8H4bv6HwP6oIv8X/b/1BjMuGS2Yy8TBUq1/P4qVng+NIeUiDy1yWWr3MOL3mbWwg/4OK9aRmWVmG2vN5e6YJO9fz0134uTY9/t4Hknpv+IBEAB1dkD+crMHPduZ47XoxqEdoaPeL3kkaOIBgvqKhZFDEk5l7qCY45s1OQLEMJF+bXtHE6CVokZC3TUG8HltjvvcSy5OSkEuAp7rjYVgUtOI89vWGWN49HpnLXCuDf4VJxTJHIJNElsn0owL/Hk+DZWacvPNMxEurxPaClMM2fglK+5LVG7g==
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by AS2PR07MB9001.eurprd07.prod.outlook.com (2603:10a6:20b:554::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Tue, 23 Dec
 2025 08:50:32 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::8a) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 08:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.1)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.1; helo=fihe02smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe02smtplvp01.emea.nsn-net.net (131.228.2.1) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Tue, 23 Dec 2025 08:50:31 +0000
Received: from uleclfsdev08.linsee.dyn.nesc.nokia.net.net (uleclfsdev08.linsee.dyn.nesc.nokia.net [10.47.240.163])
	by fihe02smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id 3BE9A8000093;
	Tue, 23 Dec 2025 10:50:31 +0200 (EET)
From: =?UTF-8?q?Pawe=C5=82=20Narewski?= <pawel.narewski@nokia.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	=?UTF-8?q?Pawe=C5=82=20Narewski?= <pawel.narewski@nokia.com>,
	Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: [PATCH] gpiolib: fix race condition for gdev->srcu
Date: Tue, 23 Dec 2025 09:42:38 +0100
Message-ID: <20251223084952.1847489-1-pawel.narewski@nokia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|AS2PR07MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: 156b3b35-a752-4c53-2afc-08de4200548d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blM0L1dLQWZCM212TkFTVVJBREtGN2JaY0svRWd1Z2gxckkxQ1hBeG4za1Zk?=
 =?utf-8?B?OVJJb0h0a3dtN2xJdUdSYUZuMTVKTEtXQmlseFN3bXVtSnRSWXdxRDZndUlM?=
 =?utf-8?B?WmFzeTlqbFBVSXpSV2xmdHBiNDZjT25PZjUrTms5MzR3Yll0UWVLSzdvNE0v?=
 =?utf-8?B?QUF6cFVGMXUyTjdMWU81ckZMZlZwNU5NM2s4Z2xMYW9PTzZ3MEhvdmsvNCtq?=
 =?utf-8?B?SDBtOXhjYU96cHNVcXVyaXgxaVR1Y0tyYTlXQ3MyQUdvQ3owSTk2Z3dCVitt?=
 =?utf-8?B?dmEvNHA5MjlmMUxVUjBTKzJFeXhVWkJGZ1RUSjgzTFIwV3R4U0ZpYlhubnV0?=
 =?utf-8?B?dG5HdUpJL3AwOXEvMytYSG1yL1MwUGpsd3BudjhHVXg4V2JkMjFZUldZbmFk?=
 =?utf-8?B?WnlHQnI5V3BtM25LaHF2bGxRb05aOUp4QjFWWWVoaG83ays2RVUzM3gyQysv?=
 =?utf-8?B?TVhQSnhnM0RiTExTSzRydHljMVVJZlA3VG1DeUh3UkFhL3BOK1Bkdlg1TmNw?=
 =?utf-8?B?TXhXU2J5MG9mV1U0L21YanRlUTdhMkdwaE5sOHZTYjA1N2hRc1BBdW9iRDNu?=
 =?utf-8?B?S3dncjBDMGQyOFV3RkFYdkMveThEV3NKVU5scjhpbFJxOFNEeXZRbHBMeDY2?=
 =?utf-8?B?M2orcFNybU9KSEorNWNYczYzSnQwRzFaamlBMUhZa0NIa1ZCb3RTY2lTZFA4?=
 =?utf-8?B?MTc3MDBnRHlLeW1wQnpkdVZSSG8rVFFDQ1lTZlFPSUQwMlJ6VFp6anZhQnBQ?=
 =?utf-8?B?dzZpaXhKOURrYml5RGxZblU0Q09xMWdwemFObnY5bWVaTW5mUGNqUiswS1c5?=
 =?utf-8?B?SEYxR0lRM2REYVo1UWgrd1Q4SkdOcXlNN3g3c045WURoSVRwVFVOSmk4UlNF?=
 =?utf-8?B?VHltWnZnaEt3N1E4L3JxbUorWXhCMy92VDlFOGJudFVYUmwxN0NKOEN2c1pC?=
 =?utf-8?B?WW1KWStHZkkxWTdubUNnaFVqRS9MM0ZTcERvS0JKRnBad1FIT0ErL0dYK0pH?=
 =?utf-8?B?Qmg1dmkxQ1Y5OHNuN2JLSXBkaVBGTmNiWUR2bVYxUHlLeWNkMHhrODVUbTBZ?=
 =?utf-8?B?aklYajJOZ3QrTWRYRkUzWmFmZ2NEeExtT3lzKzJsZWNHNHI1Q2RGWVBUZTc3?=
 =?utf-8?B?MllGS3VPL28wWjUyalYwOUN2NFRlVlU1U0ZndUk0VU9hZ1lFaWVlYXJCWlJx?=
 =?utf-8?B?aHgyNWVSUDMwbVJjNm1ZZnp1NTJpeUoyK3RLSmQ0MUpQOU1XdXYrYk9UYlNI?=
 =?utf-8?B?QmpORkNaN21TYks1WU9GVGU5YnpIUW9uRzdybmtrNms1SW9oVWdnOXNmY2Uy?=
 =?utf-8?B?WFRsM2dScU1SYkxSSXFlZk9yT3R1UG9ZQ2xqd0JXY0gvRDNQSlh1ODdvQXhN?=
 =?utf-8?B?VG8vRnNKTXZId3I5Ymk2MEJNYTB3enErNnRLNTRKM2I4cW4vSE5wSXJXZmxr?=
 =?utf-8?B?ZnZBTkIvdFZJUEFWWEl6cUhHOVRyYTRsME41NitMWHRUWnAzQ2duWEc4YVFr?=
 =?utf-8?B?VlQxeGtpMVBYdEhEVGpvSVFkRWR3U3BydEJHc1NQZmRVZzhYZnVXd0ViVnZu?=
 =?utf-8?B?UkpiamYwdGRYYXZSREhlVWlROFl6MFdHSEtGMWpnY2M2eUpWVC92VTJOT3dU?=
 =?utf-8?B?ZmRmL3BadTZCcGtiU0ZRdlNjMlB5eHJrbFhQdG5CUHQ1SUZDMzBMUmdtVUxY?=
 =?utf-8?B?L1RUVTV5SkhtcStDdTExZnNxVjZOSWtoVlJ4VTdkbzZ5SEhrd2JHSnhnOUxT?=
 =?utf-8?B?ZHZtNjlmeFVEU1p6eG9JN1ZEZTl1VlI3VDRMWmhZbWR2OEdvUzZCNkRpdFo0?=
 =?utf-8?B?Z21JOUpNYVRlTVM0R29TSS9vbHFEUFdrODR2ZmdPY0R4SkM2ZlhDd1l2dzND?=
 =?utf-8?B?SnFTWGQvcngrUjh6UlZBRUFkSmw2S3RqTkUveG9kZWYvZVppbjFzOGNuNFda?=
 =?utf-8?B?OTJKMDRuSkQ4cG9UQ1o1OXQvUFJnbktRN3VUanlPT1VjeFExY0pTMUF0NDNQ?=
 =?utf-8?B?MWh3Q2w3Tk10dFZWcVlURi9tQXhENWU5bllGMXlnczVVZkIybXBpc0ZNSEs2?=
 =?utf-8?B?VCtVSzVGY1Fod2FIdzg1OE00Q1c4TXlaMmxkdStrSFZGOVRIWUNoZ2FFWEpl?=
 =?utf-8?Q?WEHo=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.1;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe02smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 08:50:31.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 156b3b35-a752-4c53-2afc-08de4200548d
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.1];Helo=[fihe02smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9001

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
---
 drivers/gpio/gpiolib.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 409c2f415251..f25a7584b45e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1105,6 +1105,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev->ngpio = gc->ngpio;
 	gdev->can_sleep = gc->can_sleep;
 
+	rwlock_init(&gdev->line_state_lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
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
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -1119,7 +1132,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_free_label;
+				goto err_cleanup_desc_srcu;
 			}
 
 			/*
@@ -1139,22 +1152,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
@@ -1164,11 +1165,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
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
@@ -1248,10 +1249,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
@@ -1261,6 +1258,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
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
2.42.0


