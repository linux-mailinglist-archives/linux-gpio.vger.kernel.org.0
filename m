Return-Path: <linux-gpio+bounces-7569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441A090F9AF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 01:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9051F236CB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 23:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25D815B14F;
	Wed, 19 Jun 2024 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="d3M+8Hi0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2068.outbound.protection.outlook.com [40.92.21.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42015ADA4;
	Wed, 19 Jun 2024 23:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838911; cv=fail; b=Zl4IRCLdMO+7Gd/ZqdfKaUtlTU4hDlXkAj7o/gE2Xt3rQORT6VPHqUkyfrb9vKKGmS+9nJoJ3Almv37QVSwvpfMj9SelYRfLa+40E3sQ6Drm+2zjfIZhJ68UsqCeiMXnW3y4Xn9O0hlKY7Kn1C4bZxH+2mXoqtu6CTiulBWPvPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838911; c=relaxed/simple;
	bh=tIMrqqVHt9kDH3mVracyhK/P7fubOlUBMUXbo10F8DE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D76APhJShAflateOr/PUcYenMFlJa0KaHrsRF411A/Je9B9e90W5iTP3PVtCiNIU3B6Zt8juxwGxTg+6mPbmK1u4g5ijHJB84g+xcBH292vEObDUSvzZa099OT5e8aJ2MoMQvLwBMcdqVkp0gvEOI0gcNHcGRrMTHJ0ORAyzXV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=d3M+8Hi0; arc=fail smtp.client-ip=40.92.21.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB4KqPmmPI+6ASzTOAVcSVUNij9hS9UcxbNtIuNSEW+NRY5/nIPtuOLgIAUDNEiEbfhB3fnog40cr+7QW8QaN69WZPDlY2xNufAG//un2SyiCq1owd2U2cNXcVEpNW0X9s6zsdB0F841QJIyYbRTNUy1drhZx7MZqsJRTQfKfoJl80Ciz/fD5CSwnt+91ycy9OJMKNjer4dK+Api0T0ZnwWABhKJFceD4XvOqf59J0+vNlMRVTQ36MLGreP0l8P5J9Zurp1qcKx3K7n6SoX8Ty1kjYZakKChiXG6G5rQqU0lEUgZiDUuEazsLLVJH9NsLxGqM6YB3gciAdyGPZOr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxeXzRd5S6663KaNU9eSVpJuXPKnETHitpwkPbzzPUA=;
 b=eaPQvpAGjdXcnhTVRN7OdNWZNN0GQCYkb/S8sRMgfN5gTiFBrkgaxLDhFr+mtUqnYRCfpJ4fpuq/96EF6dMT1Mvw8d4CRjWLjY4gR2VLFiGyEJUO4Hhec3CKp6YQTg5XVhWpFVLMwZJ3GfheimZHREWexImjrl8c9E3hshAtGqt0mGVhHi1sp0YeWWoLnHQ84tHVvtCmczTkImpg+VPzBpXbQHgY64JobQ5T3r9Nd13dkznA8ZhB9TmFQqgC2BhMemHGJMGh6AF06rf32SDyJecWxgn5DP6s+TgPK/18xDTdjaOVNhBAV0D0bAcgtWjcjPa13sjTcCbfw7lxYTMmfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxeXzRd5S6663KaNU9eSVpJuXPKnETHitpwkPbzzPUA=;
 b=d3M+8Hi03UuY4/hHGiz6qLhdMu55Hs7csKomvwefYbP+b1fs62HVnZgwAr3GGkYn4L+hxVoaort9/uBiChuDKvXAlEoJEB7Cpbbq0TvdYl2C2fXD+1c9jWUkzPjNnsE6z4dhbhv44oYbmkxbY4ZOLXk5d/GzT77CLbrhlvA2OpK0Kvh+oVXEAcQrLHzy+bN5PbSmOAyGUoKRnzlUlXNzwjX0UO0WQLzusHClxA641YLyfCB3f6HbKrzqJYYEEb4zXoF1mtibwQ4HRlTDDD69fyvG8rBIlUI74JUcBogxOyFnqeZ4wacgFDSSO7LuaIXykWzH3GOa0nYweJKQ1X2yXA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4602.namprd20.prod.outlook.com (2603:10b6:8:5d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 23:15:07 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 23:15:07 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: pinctrl-single: fix schmitt related properties
Date: Thu, 20 Jun 2024 07:14:47 +0800
Message-ID:
 <IA1PR20MB4953D5E7D7D68DDCE31C0031BBCF2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [NAaDRh0PTPJJNj502VRUcT2cvotVMIU6q9p/B87NR7g=]
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240619231448.171000-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bdfff3-417f-4c0f-365b-08dc90b5a86f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199025|3412199022|440099025|1710799023;
X-Microsoft-Antispam-Message-Info:
	XFZO3azER8BcuIhQuXpsAY+PFFm6+zXrPYE192yMSwS8CnLdnJnI71KEaX0wJarZ9ORiIDEgXSBvLHagbAH00drDPJltsgRxqkCf47gJItSXfQlL9NLFlQ9JP6aeoOYCBhEfLfF/ONfmTPd5LS4MRVvONIHpkYriQ2NRXTzIc9z+jMxy9PdQZbwvXY4Hwmzl+y52y3PssACnKRXlLWH1+TxuqSX2RQJriVggbpXE3o795+CRiU3cVTnevCPJHu0hlVPLoG/qbKEtXvpqq/Frr2rBgX0JrsripluPXEMsHOvJInpwPLlJQvSiEjet4kfQ0IX1PHIVLFtR8g+lWhc6AlqKhUhde2YHlpbUzBXJqTN7EdFsPFKjBt0lOqZrSzoD6wcQl81RZeElf93RwvRW3OwQDsfFe95pkUsk439J4cavsVvmR1VDUgPOpJ/henCZxchhM4Oj/wqMINaY9Gwekldh6Aw4XKF/ud3a+YP8O2awOFc8U4yyT+9WqZsCKBZMedRjtrybf9HlBAsSnvwKnyKWjHLLu9RFwptikwjTHtMa/3ZGFZBW1dqK8F9gIhmp3FFMRkV4qrbg/2nwj8OlSSMvd3fvOaMya25gLOnP+sEQ4RVsThmcuoBQB4+Dfqmq
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tdgnJXCGkRTJ6YkZugJyypwlnhVKVPgyJMiF8CRCT6mzCBTNLq7w/DY+QoIG?=
 =?us-ascii?Q?YuAOdn7aIlyI7LR7baQejbm4pRZjazBlpNzNZtE8rNPySnu7udbiFbSl1HUG?=
 =?us-ascii?Q?nOf2R3LlW1xaRM4Wpv22/o/GHpYBYQ1PiQmiWIJyXtWMeB+qZYiBl4vsUmjb?=
 =?us-ascii?Q?iik/eFG7DNHu5osaRxpr10sIc0FQsy1vskbGSuA6GoesH8BWvIAxNj887nzy?=
 =?us-ascii?Q?9NQ27wcd84bLjakuRMmy/DRxJgsJj2+8h3R+RydWBq8nCrBbqbjbqUotUsdb?=
 =?us-ascii?Q?r5W7k1rrpD2RVNc7r35/DSg2O41WRBqCJwDjls3rlg95CuZKqTyra2vpqESu?=
 =?us-ascii?Q?BG7cjx8yUwWqbpHbBc/SnKANsMIHyLMqHccn0bX8tp4+nVX0jsnwVLVmWpqK?=
 =?us-ascii?Q?tAP31gWCcMx/C0DzTq5BbELmOzTWsSUoPe4s8/vwl1wCIM8yLywU6QfqHmms?=
 =?us-ascii?Q?gDlUSpuau8owMzZ6KC50/oFMTdcrDOzfjy9ockeskEA1MGgznFt66rwCjhjX?=
 =?us-ascii?Q?bdH5DpCadi0xatH9SjZ7dKivHB7+g284DwVEpvsPKuefZ4HGO5zqFRJV8Ogl?=
 =?us-ascii?Q?2mJWDL88/8nOg0OhGuhnG9J5EWtB8jYF0/Qdji0qX3+K/jTkqb3JuEnQfAqW?=
 =?us-ascii?Q?n93ophAMDLN3WP5eTzbjvZRUwB7w5dnyNjxo5dOlEg2qDV2QabRiQTcYu7SS?=
 =?us-ascii?Q?CmmDDPt6hd0KzxPro+UNDv9/1HkxliWLjmavVczXjKJOgsJry7NKAakE/ag/?=
 =?us-ascii?Q?CRjcWzLYUBKUJTYCc1T0YQgd+etmIXF/T+7F4e/fO9SeveRhtzlS6tWQPEsU?=
 =?us-ascii?Q?TWL7ohs2qva92QnZzlI+Tv5bK/W9ywPSZA3qQIm+9wRzXH3E2QSQcHawKHrI?=
 =?us-ascii?Q?csl6u2fvym0G22Bcg1pKllPKqMXbdOOwmjwDUJL3KhxODr2jcW6EnVJEkZMw?=
 =?us-ascii?Q?qP3hWwG0LdMB0WKZIesf2GyYZ1A6y8mLjbQnNGG//+LZtgOm/jeuB6WSsTUj?=
 =?us-ascii?Q?U23tlLATk0lea0OgSI5nDMYWIVejlXqgjf8SjXgbB1cG+VfQw056I5ZSdZYg?=
 =?us-ascii?Q?zKs8UKPpOPtFts2+EQVPO5P7kkR5xZLSqulAdKvZaakisCWfLBkiu+nBw0cz?=
 =?us-ascii?Q?yFymFIvZnOY0NCtYllcqTgy4Ans0D0MNCfMfHSPJotjhim8hT8ICbIADE+Wa?=
 =?us-ascii?Q?0MQCU4YYJIpLEZrB4khqoQQzdFvqZoVSr3gVJv9qehkQMFz9KTIVhPLcstGK?=
 =?us-ascii?Q?EQO1HX+AXqLtrUpmgGzG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bdfff3-417f-4c0f-365b-08dc90b5a86f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:15:07.1340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4602

The "pinctrl-single,input-schmitt" have four arguments in the bindings
but the driver needs two. According to the meaning of other properties
and driver, it should have "enable" suffix. Fortunately, there is no
dts using this property, so it is safe to correct this property with the
right name.

Rename existed property "pinctrl-single,input-schmitt" to
"pinctrl-single,input-schmitt-enable" and add the right description for
property "pinctrl-single,input-schmitt" used by the driver.

Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use yaml")
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-single.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index c11495524dd2..e8177cc1115c 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -144,6 +144,13 @@ patternProperties:
           - description: drive strength mask

       pinctrl-single,input-schmitt:
+        description: Optional schmitt strength configuration
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: schmitt strength current
+          - description: schmitt strength mask
+
+      pinctrl-single,input-schmitt-enable:
         description: Optional input schmitt configuration
         $ref: /schemas/types.yaml#/definitions/uint32-array
         items:
--
2.45.2


