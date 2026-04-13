Return-Path: <linux-gpio+bounces-35082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKtPJGnE3Gn5VwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:24:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454F3EA95E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 12:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29C4E30071C4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF833B52F7;
	Mon, 13 Apr 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="A/Fgzddh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020128.outbound.protection.outlook.com [52.101.188.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC943AE1A8;
	Mon, 13 Apr 2026 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075868; cv=fail; b=g/kk9DKfu6RY45UpiFkgBwMQ/rf3T0S/Jpe9ycNSUtYoIOkOv+sZMECgKZNMjMfDGt+s8vh4vwfTUzKh3ZuB9dIcQuExhcBluZ+zNOw+1z8ZcTVxUxHBLbz7zWNJEXR8TRBwKhawfUsEXRnrOPANnCB6sLKvewBtH4ikJmBrP5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075868; c=relaxed/simple;
	bh=ArG9FyT6sLqg3675+fIkDCNmH4DiwoWlSMUZvvXHjek=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bPSyTrQeDpVjU3OOJy6NqPA4DvgA2f2hHRnSqv2lok2Rn3Vo4xZE72H4l3j1g+W+/k2s5vyQ/Eyu1ZFQjDlv2HgW2YywLA3og3d1aAzxAkwE+qUtkCAPdHtQw1XvA02FHVrxmbzYBBFgX2EO9tKRT3zAH6KDTMyobCUktMMKlns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=A/Fgzddh; arc=fail smtp.client-ip=52.101.188.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB+Z7fBpackBN6Jnl14s40Ywt9bl381iohpTQYr/vTBGpa4r+C+8jdMlQzV65YaZvghgYZzFlqbJjSvharPjM1WeKRci+Q4NfKJ4X3dbev2MBd449MHQSoKWdhXtxo8Br/L8Wgo36PAp/JP7vPaY+i8+IvmrPEYFkMuvBFroxgAqu1pYflnsTDGjg/7pk7UIAk8Y30ecatu/EnlWFNYo7TYRNxqZfo+WF7O5PJsDkD+AmUB3BaQcX0U+9b/uyk1QcNqJSCIj33wQrzcASqeDvIUXHc0q5HCk29UkmiR4ruyJWsWmyn0CTiuQrJ3Lb7TFgnP7TC2g/0uwwo6LNzTSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FkMnhwE+LLszUrY3JF0QYBBuvYeRlMjERP++LMPbvA=;
 b=h/dInWRT2xPXsGu91QDuajZtwCC/jQj7gMICeJ77hh04qN/7J8GGnIIfPZdPBCyvz+v74cGixX6PhJh1200Rbfv1j7yD60uEBR/ElwphtlOpILt7oXcmT/XXKASpzRfB/8Fp9JkK3Onh0LntJYXfhXT/6QBNuUq3tWmehShktAf3xaYQc4TvtSKKHhcbnB7qwpoPpXnoA7yM7XsV3agb+muS+rmYudnZxVUr86nruqnQXuptZ6lDqz36GIZiwe1/CEIzgHvm/rlU2YHQATuMJ5O8zNlqcir928zFowU/wDhaVY/BZPYQD4KRMjT5Uk2fL4SOwMjtOI9WVPURy35CRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.3) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FkMnhwE+LLszUrY3JF0QYBBuvYeRlMjERP++LMPbvA=;
 b=A/FgzddhRSxcJf5pfakNepZbQ+xoUuXXHPd9QwAd37Ip4sxZPfsiMsZJeU1YSrvpDPmTDQjdTu9JaKqyfULY5Wm89hTLtAIM3D6DTkJlU2CtKpJJ7cG13/DB+mepK2RWEKNBYnyho9W7QzVernHuuu55R65A1zP1KZ3PJW59J9c=
Received: from AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26)
 by ZR0P278MB1652.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 10:24:22 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::c2) by AM8P189CA0021.outlook.office365.com
 (2603:10a6:20b:218::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 10:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.3)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.3 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.3; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver02.de.seppmail.cloud (162.55.72.218) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 10:24:22 +0000
Received: from hz-glue04.de.seppmail.cloud (unknown [10.11.0.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNn15nGrz11HK;
	Mon, 13 Apr 2026 12:24:21 +0200 (CEST)
Received: from hz-glue04.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue04.de.seppmail.cloud (Postfix) with ESMTP id 4fvNn15TNrz27y7;
	Mon, 13 Apr 2026 12:24:21 +0200 (CEST)
X-SEPP-Suspect: 337c415c59b24f4b8533a63ea0857d4d
Received: from hz-scan10.de.seppmail.cloud (unknown [10.11.0.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNn14wsSz1xLb;
	Mon, 13 Apr 2026 12:24:21 +0200 (CEST)
Received: from hz-scan10 (localhost [127.0.0.1])
	by hz-scan10.de.seppmail.cloud (Postfix) with SMTP id 4fvNn14f4Cz4h73;
	Mon, 13 Apr 2026 12:24:21 +0200 (CEST)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan10.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 13 Apr 2026 12:24:09 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com [40.93.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4fvNmm6KDHz1ytq;
	Mon, 13 Apr 2026 12:24:08 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR1P278MB0997.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Mon, 13 Apr 2026 10:24:05 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:24:05 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	wbg@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
Date: Mon, 13 Apr 2026 12:23:23 +0200
Message-ID: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0047.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::9) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR1P278MB0997:EE_|AM3PEPF0000A799:EE_|ZR0P278MB1652:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf378d9-4493-4b0c-4742-08de9946d460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 fMbaT9qLp8uVhLJs7t9NG03SsgEH/MgBGsSRWPNNjvsox6XChWnvo4kqa06fBuinvbz1P6xaUx12mwPRMO74aF+x42YpcnGw2ZG25S1+sqXC239hD6LLz109TdMEWtQ8OMDPoQV1nq3qacd61dLQaVfTaOsR8a5DnxdS1yBQozqjLBNgFlTJaIMNxx8KPpY/wewg24wMcCb6KVp+M7FZb+1cjFipg1MgVszTLyLF9P94LgQLHoT/+9eX0mBEeoCvaIJ+HibLmx98J1QoMTrYXSbgMBRGlMYxmyeud2emS8ETm8LdRyvSlLLD4ucGqddPCxN8SgrNJQ+Zx71DZ7bi+yqa3ppJY8MqIIvRK7ekAVoGHMhZC19cU8L+Rsx/WJ3cX9r5lkQMnHm9ynr4p7Qx86+dABurN8StYSPsxtZz3nkxe/rL2miKv/u9iEOCaC4hXOEO2ZQZLraIIlC82xHXhV3Xb+utWANVakh69pW6E3j4miEiijGnhqxRAXFRrWDlLtDDra3Sj2RayuQNVc9ce79ntFBfnA8B+AXmYhgFLVaE7QQp5MkaWRuB/XsHlyIrHDyiNovltLqYdYgM6E5Jr/Ocgh/Oh9Ur86dPD2uDC5JMS9ShyhcNfk8EHcNXj2qwLB5JWO3/2iruRRO0X4p3XN4PrxOY3WuTfrPfKh8SLr4y4t83FGeyFtu+leXwaoW/WLJEzEDGbEgwDs8Dr7tcqXZ70fP0hRBb5HrGstkUMMUKNH33H+s6OFago6sOE2ePAp+QtgUPHqz8ksvi5lfQlv62QmJIAZ/ODJMLqNE/nKQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 IbDHRxWFwb0UcamzrcwgwURq7gwBDHjaK2DQvVBnM/0F2wnRCNFCKOWXlKEBJKasXV9eDtEsbNY5LrUH5j7lNMT9lbGsE5UCzh/tmk6f/dk8bFjSG7O7x1mHSCnQ/vnK2O0wkBJ96N+f9+MsLXodxIulGRa2mi88PKY4qDdxJv4qIWngwlxyuLQW/YZWGulAUiBErrY7IPFyHNPoBh41GavhVY9yhIMenF0OX87SJ3hIQnMJI+vj/V0iZHPS/giA4VPSTcw1wtRmoGvzFtAY2I6CmqtNiq81Tlfh2jmwAj0wn0nLXUXNw7ri0gC5Lf+AQxdXJ+evXvVi87b4nUDpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB0997
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.3];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df2fcd1c-70e5-4687-9bef-08de9946ca37
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|156008|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?di1snQFtX+V+N94xVK/pXfpZJcsEBlfGidXt/+Q3BTkEvN41EvIe6wrwXIe9?=
 =?us-ascii?Q?eTzbHL+PWyoISZdUSZxJmkRmDgYzEquC0cxv7Ka5Ztb0/PG5rMqkME4T7O54?=
 =?us-ascii?Q?hpv6kubNT5D/QKZkEvqtav2luu38PXg/c3dGlQqm8m5MaZOcygepA67fa2lk?=
 =?us-ascii?Q?/+mqlA3GhNqvcSKYT0IQzE3FJRVZeZWW8g6gHR+xyTWB+471xrZD2Vz/1lDe?=
 =?us-ascii?Q?zvwoJ+MpOyem/J6BIXe1hsRgxeT7haKOF8paK0b8xG40yrdqBcQVbKGH7ptc?=
 =?us-ascii?Q?vO/wUqWuumw8SZGbH7OrbLjlQTKayjE1CI5UBqVmzH9tY0zjEZla6S2UqwgD?=
 =?us-ascii?Q?S7EY23WMwbe1Bmv3a/JJDM631Fmoe+xdMEz3MRu/81hcyK+gVjEo4Z1ylCZs?=
 =?us-ascii?Q?YI893XLB9TL2xhOZ/uj9x41J7MX8t4/EQ37jyRTuYIO0uUXTA0sApRDQw86T?=
 =?us-ascii?Q?VaUK1br6TTfdex5ELXnhVg2MB7teVsv+Lj4X9GnWqXDGc057irk8uicnoIsT?=
 =?us-ascii?Q?nfYXmK/qyVc2IbQYjL7NHGN7urmuzhaKOd4THkIOsMJaEUwOJWodIhRV/9sr?=
 =?us-ascii?Q?IYEXYw7QuF/GAdRWkV5V1rT3qH4/WnHn/xvAWPjXAJN0W60A/m1Whm+x7M3W?=
 =?us-ascii?Q?DsucSyTVqKV8jb84rRB5MCDo+tHkohFMo0xu4xdgj068wjX6/ZOfZggW8xAU?=
 =?us-ascii?Q?cUDyilMJOAjJZQ0jibFDb38ynvaIpgs33cu1wnxz8NdoXpZYWVhZzL41v7XD?=
 =?us-ascii?Q?EJy5ihxdtPq6YY3ubJ0yk5cHtnXuBNh8Dy7jvATVSK0jF+wRSQau/SN0ADTl?=
 =?us-ascii?Q?VaONO9Gri4uPdrhXw60e7OEUmF0zkPBKCG5cWpv4m0hnMK/5HTJSKcet6gE6?=
 =?us-ascii?Q?kPIxRng8jkQzEmT0M9JZapeYKXM626eyDN2MPt3M8FLeBFBe/u34zcJuGBAp?=
 =?us-ascii?Q?OaWm72gBQgOSVbr66ySx6jjKkEgvJQniAeeEhdv0atB4QMi1RZV18r2yzgo1?=
 =?us-ascii?Q?zmdVY1JxeZI1mGQrMhhQSVZ3ogMn5+rwm31wk+ul+k7ZxNO7MJfR2LqhG+FL?=
 =?us-ascii?Q?xvSIiNEGjJmK47Jb0AyZBjIMm8wPNQqLKJBK1lE3Y0AEd6VH7jt/ygI5tQEQ?=
 =?us-ascii?Q?fVIA22plL0YFKynvXTRW/3Cq6rL//ZQQvn5eVU5sCvLbAwSOL8KVgvuYelKm?=
 =?us-ascii?Q?fPx9LyHz9xNEoWRc7DmEhc7bG/Fqxn2hBLRDVQsUOjOed0TxCosZJK8gLFV7?=
 =?us-ascii?Q?hWOme9wYvo1/HevpPfIUNhnH4+rUGA8YCQXV3Yt1h9/W24T/qsKhmuayz3+0?=
 =?us-ascii?Q?mbc/daBUkxn8gX0dPvL0Dl6O?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010003.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(156008)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OfBVnTCZ82uOb6QksGVK1E8D9eJslm/DCpT4eAxS5xF9moxRkt+Zl2REOmlwdgWLMGiP3yW/ZqVWcq0fUcQCLQ071re/nnuK5OM9bbpLGZpWTBIyygLbyJUFhz1+kJF5XQIrbgqSs6FqGRgU3eC33J9+HYzSHWFIalFyPDeSlg6wU1dfo7AQPewKngDcigtNqc+X09FR3NO0h5Y6MBCvWztlWzbc07tox2Sr9/CHSMmkanVpiO07lXHT15r2vXIi+TFY7S+Zi2L7IWZggFtusgVx98pyTQzeY7EmWB5XVME1VB+bBB2oTZkPi/FToA3jnEnNXK57JB42Mfqx+N9PCV0QmAFlPooCzK8VXRoxOeyLX6cFEyJNacfY9Q5y1w0HlwU4kt8Y6QN/XBHNwmzEW9lHUa2XN4RQwlYTlqVdai9kl5gIyLepc+nNnlyxwSvJ
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 10:24:22.0929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf378d9-4493-4b0c-4742-08de9946d460
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1652
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35082-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:mid]
X-Rspamd-Queue-Id: 5454F3EA95E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series is an RFC for adding port-mapped I/O (PMIO) support to
gpio-mmio.

This v2 comes with all suggestions done by Linux Walleij in the
initial review [1].

For keeping compatibility with gpio_generic_chip, a new _config struct
was added instead of extending gpio_generic_chip_config. Using such new
_config struct, called gpio_generic_chip_port_config, requires a new API
function gpio_generic_chip_port_init() to access to that new structure.

Besides, structure gpio_chip_reg has been transformed to union. It reflects
better that MMIO and PMIO chips will only use one of them, saving memory
as well.

I'm still sending this as RFC but I don't know if I should send this as a
regular PATCH series.

[1] https://lore.kernel.org/linux-gpio/20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com

---
Changes in v2:
    - Move struct gpio_chip_reg to union gpio_chip_reg.
    - Add a new gpio-mmio API function to init PMIO generic chips.

Jose Javier Rodriguez Barbarin (3):
  gpio: mmio: convert accessors to generic register descriptors
  gpio: mmio: add port-mapped read/write callbacks
  gpio: mmio: add port-mapped support for gpio_generic_chip

 drivers/gpio/gpio-mmio.c     | 330 ++++++++++++++++++++++++-----------
 include/linux/gpio/generic.h |  78 ++++++++-
 2 files changed, 300 insertions(+), 108 deletions(-)

-- 
2.53.0

