Return-Path: <linux-gpio+bounces-7661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C1915B94
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 03:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F084B2184A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 01:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD4414005;
	Tue, 25 Jun 2024 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PRP04t0r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2057.outbound.protection.outlook.com [40.92.98.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A73125C0;
	Tue, 25 Jun 2024 01:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.98.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719278564; cv=fail; b=aWzKQ/XVEvCKRNdM4p7xcE1xwfrciD/lxcv8hBJ0aO0XA2kTGKMktmrIYJWnOuYcxFWp2UDoY/Z0newpuXzwOB7IXD3udi+ORm7xhGytT7VJggctZmc1/CzhqAYReNmZuLVUQNL/GkV79JHAkbvdLOvLr3H1I7UhWP1o7/iBAiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719278564; c=relaxed/simple;
	bh=Qasblls7Wx1EPc1Bn+f2i+1jmtYxvgZZV7CNjivZlKA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t0e8iCTkaqopC5PRoqjeVm8vTSensIu68TNrkaBTxI2P4rK6PcEN3EG2KKJ/EiLQfMxjhJ9v5p/O6u2kMgkoEKlqHIMVH3PJ6SDYuavvnpfk7OajkLA9acG0a5CkiAHQXcs0fRrJ7UOt13plmgnWgFdFgxqz4n2UDOhZ1mjHlYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PRP04t0r; arc=fail smtp.client-ip=40.92.98.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrMI8LPct+XnVnxOa1Hhb1UaQh+3dyCkABNi53SD1VEtIm4UvvscQ5UcRs1Dh127GmYP2Zux7LXAKe4X19ypV2SdK/Dp/PB0LAhEwKw0gpKu7cIjn3BxaDTu/PvaiSgehsbneKPnjn0R13JffR+jQyvlwqCuWgrks/Pb/sWT0y4VrQxsN1N2P4FMsTlz13Z1/yNTQVFkatTcs/jWcxkUZH+7E1+f8WnMbK/I/bio4INuP+Pdr1//Df9RvTyRxP1lJ+pDMP2PJS24zqFnkGPpXK226ORp4eb7yLW9UFClVV5D9dgvDT8ysiVqmej7OklJCBwOYLeeLZxtdwSlPDTQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmVDfoWHIWQ1HAmojW4Xd+B30iohYxP0oR4kXaedYso=;
 b=BdrUtuCwh6a5db1Jv05BsMgjmDbMCe1e5tYxcQTtPRqCedQu1GzSptjan3quEAUz7eQqY1ouWlW9QByWETiiJ5vvSt4ACoNt6mdgu+WNDnSJxm1rWqkiqlhfJquN2bwsGIarQEV4my62x0xPzB6L5fLgS7ZlKJqYSQhIEX55tcg6NtzYrtWoVjED2Upqu2mrwqXAJR3VmH/G0hxou0Yg4D2Tktl9trVPp1aNwPXU87owiq9p1lJgCg4e8iaI9D1RQzN59B6XvOrkj3jnxAmhvKyLlahqxF8TGSKNlEbfRT5/dKV+7R1TRwq+esTckd220GIFeeXqkUrltLDyQL60tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmVDfoWHIWQ1HAmojW4Xd+B30iohYxP0oR4kXaedYso=;
 b=PRP04t0ra28ab+8+03frHUIRLFfv9W+Abr/+9gwjsnF0aw/UCtqqa1TCNcTygHVmNJ6h0vl2lYJaOstt3GZ16m6SgrBy1QfePHf9nKcbwcy/JT1r/sauMpDRIrS71R4rN6LyPwFGmlF7t6EfX09k89tEgS6YW+4EsspZSXNNZbjTv57P0NM6QBlfHy2g6SVnHX7O9D2f259nkM2E9X1RATIqMnK7m/2XbEMajduyBulJ36s767Ll8sSvTxXEE8eA023c11z3IKiH3RBK5a+jLaltVX04igmFO0SiWfxP6aVtg2bGoxxDqgtqJ5FWg1mCPOWRlXIQr2CXigqkxDUJ4A==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 TY1P286MB3391.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2ea::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Tue, 25 Jun 2024 01:22:38 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 01:22:38 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>,
	Mark Mentovai <mark@mentovai.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	=?UTF-8?q?L=C3=B3r=C3=A1nd=20Horv=C3=A1th?= <lorand.horvath82@gmail.com>
Subject: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
Date: Tue, 25 Jun 2024 09:19:49 +0800
Message-ID:
 <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [1xm748C15vxX+HJp7UMLJHAa7XOeRZOf]
X-ClientProxiedBy: JH0PR01CA0159.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::8) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240625011949.7865-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|TY1P286MB3391:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9d6ca8-adaf-42f3-297f-08dc94b54d29
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199025|4302099010|440099025|3412199022|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info:
	ZcWu98LG7sI8FtKn+R3SMStLmc3dyOXb8pyKFrx4lTsCGFXY7igu1BS3Fnyo4kJH9cui60AFzEV9K8SaA1hV/dwngHvsr3pJZ2lTMKoyxlfNJrYdeXVUvvOHQUXJbwrEhYeuJHKvkalVmeEXvT+ERZoMqBzzGV4FmsTi9szpzGtCMBIYAZLDDn9eGCeWpPSABF/u8+AHMQgU7XJfxsfwLV40WfFY1PKEB89I/zfBiibCouWtFMo9B0rX2mCIpdKtuRT1GwwF/Mq7sfSQzxfhR9PaYvduqEo6lxa5hn9qQfAQx3qQde5emBdMlWlREsKm37Z+0WulJz0VkF4nlbby6dBPea8ZNYTXn5DOOXclPuZmZZI2Y9MhvHdeZqFXJAV3ksu518PYNMe0+h0NjgOxGLJGgOuSfaIlG5bJILgiBcVuwFqMJtajp9IFK052QfpgXwzeJo/cYMEj49x35lTmzGQzumlVuqOeIDQpL9Y14GEeZSALiZQCTqlu6peTnYME5VCaRg1cjSulkVC5w00zDuoO436rQxyu198T/koWkO0qorjxSF9Ynkmvt5NAlB2mj4+joUOoHV3dem7nDQAjJkJvkkaFn0v5xGnSbaSka/VbKJ0kawPZElV02BbMmypMAghrrvKz8Scadvy4DbG8ttKf55xIlQGSluMEtQfvsXB4S3ECvSMbfuKr+EruLcqlfx5QGGfwFo6TAljr5BjRjQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmpvcExwbWMwbWplcG5lSkFQbXBSQmZ6UHZ0NHJjS2V2Tk1HOFRERlZvWlJ0?=
 =?utf-8?B?NmdWUkpiRWswQXR4eHc0Y3RCeUxhbyt3YVh0V2pseE5BTUUrc1JxeFg4Uk9n?=
 =?utf-8?B?NTVzNjd6d1VKejdneTFVMittRmpVVGxMN1d6SVNLYWhOd2t4eXpmVkRDeUhj?=
 =?utf-8?B?aGxBWXlsZm1jS0JwYUNsdSsxRURjUVR6dmNsdk5ER2lJWTl3cWx0dkREQ2FN?=
 =?utf-8?B?c0t4VkpjRlVJZ2ZWK3ZWQTFxNEUzYXZSaW1JVXhXMDgzc0E2dGNTSVlNbWt3?=
 =?utf-8?B?aVpqcDVMK1NFSHZXRlUxRGc3bjZ4Ry9YMGNYbmJhS1FuRkQ0NFRzR1NWc2pW?=
 =?utf-8?B?SVVBNkI1Yk9qWjVJT1o5ZFBNMUNRUm5YY1lCWFNLSW0wZkVGR2JRUU4xQ05o?=
 =?utf-8?B?MktHQ2JRNXk5NElDYWVMcWx3S1VCYXF3Y3ZhU0FCOXMyYlVVSzE3QkNYNnVh?=
 =?utf-8?B?ME5DUGNkdngrRHdwUmtiSDA3dFNqbGthOS9zTkhiaXJYVWZwRmhQcnFrNFRk?=
 =?utf-8?B?N25JOHludGRob2QwM0ZuNmNFU2tHSnZ6U1daaEhPZGdHWU1YTlU5MUtMb3ZF?=
 =?utf-8?B?K1FBL0lkRFQ1WWZHejZlbU9YTWJkUUYvMHVyc0JaeDFGcVpJaDlqeXBnQytH?=
 =?utf-8?B?UWNjOGo0QVdBelNSY2x1SHRxTlNkeE1HeTc2eUk0UlVyS2VPdkJKZ3RTWVBo?=
 =?utf-8?B?OCs2bEViY21hditGakxEY3dRekpLcXluWDU3d09sb0lPSTN4T3hud284a3J2?=
 =?utf-8?B?aGtIZXFCYkhhWWx6QlNwSjFhTWFJejZoSXg0UnVSUE5EYTlBS240ZThSTWkz?=
 =?utf-8?B?OHVrMk9ycGhmNTkvODBiVzhUbU4vUkxsS2xaRzBQeUltVkhEcjVzbTNHUlJY?=
 =?utf-8?B?TEFYd2Jic1RtU3hTTWFjazJtYW5UK05jSXdrTU14YTQraSs0ak15cFdrR21Z?=
 =?utf-8?B?UGxPWEs1N2xsNWpYWFM5TUV4S3Z5QXc5UGRtNkZVTG1HZWo2aC9OZkNIV1U2?=
 =?utf-8?B?elUvUllFV1BmaVFHVUxhVXZMQnZid3hldVF2UzY0NVNzbHRvaElVcEwrSmJW?=
 =?utf-8?B?LzI1amRMc00ybXZ1UUtxeTcvcDRJM1ZSYTNUMjJHN1FkVmJJZ1R4R2Z2d1N2?=
 =?utf-8?B?RXU0aVBld29ucCswMm1IUkpLcHBvckxraHJaMXBTVHpPcy9qMlpodGlkU0pv?=
 =?utf-8?B?QlVCSU16YkFLU0R2aWdXRUI2elFtNWFIS0MrZDFralo4SGw1QjRLVUVvYTVl?=
 =?utf-8?B?aDhGazdCVnVOUHRjaDNjK0tSUUh0a05xR21jQmMrbmk3Yk1TSURIemlPWHNm?=
 =?utf-8?B?ZElBRWJSMnRYa2R4U0tsUUpIK3JYd2tBbk16OTg2NEFWenNSYjdXYjRST1NS?=
 =?utf-8?B?MmtmZFpNN0JYZHlPWFZBbW94RDQ2U3o4Z0JIeUVMWEVQRDJad2xZaEhxTUVL?=
 =?utf-8?B?SnZLOWZSR0N2VmRRMUhGSU9ac2FjSTUxWERZdElPYmFDdWJzYkw2dlJ3N29s?=
 =?utf-8?B?d0o1aklKSXRMK25MdEhBM01lS1N6eE5MeTBlNDRzUm9JL1B6YXVOemZHbDdR?=
 =?utf-8?B?ajE0U2daQmxoVXdYRTZRdVd1eG5BSlAxZk03M0ZCaE1jOEN5SGVNZTA5QkFs?=
 =?utf-8?B?NVhnWmw2KzhNbDJLZmZPWjczMlQ1TkRwWnIxSytXelB0cE5VcTZRQkJTS3Bj?=
 =?utf-8?Q?dWfzuepd4AZWmtwuz++A?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9d6ca8-adaf-42f3-297f-08dc94b54d29
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 01:22:38.7403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3391

bgpio_bits must be aligned with the data bus width. For example, on a
32 bit big endian system and we only have 16 GPIOs. If we only assume
bgpio_bits=16 we can never control the GPIO because the base address
is the lowest address.

low address                          high address
-------------------------------------------------
|   byte3   |   byte2   |   byte1   |   byte0   |
-------------------------------------------------
|    NaN    |    NaN    |  gpio8-15 |  gpio0-7  |
-------------------------------------------------

Fixes: 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init()")
Fixes: https://github.com/openwrt/openwrt/issues/15739
Reported-by: Mark Mentovai <mark@mentovai.com>
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
Suggested-By: Mark Mentovai <mark@mentovai.com>
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Tested-by: Lóránd Horváth <lorand.horvath82@gmail.com>
---
 drivers/gpio/gpio-mmio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 71e1af7c2184..d89e78f0ead3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -619,8 +619,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 	ret = gpiochip_get_ngpios(gc, dev);
 	if (ret)
 		gc->ngpio = gc->bgpio_bits;
-	else
-		gc->bgpio_bits = roundup_pow_of_two(round_up(gc->ngpio, 8));
 
 	ret = bgpio_setup_io(gc, dat, set, clr, flags);
 	if (ret)
-- 
2.45.1


