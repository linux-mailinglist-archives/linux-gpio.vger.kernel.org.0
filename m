Return-Path: <linux-gpio+bounces-30231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A2CFF661
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 19:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A333441386
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 17:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDC133C1B0;
	Wed,  7 Jan 2026 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="RKwnuWrZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020095.outbound.protection.outlook.com [52.101.186.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E235345CB0;
	Wed,  7 Jan 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806288; cv=fail; b=aZ82iFLwZV+DMgBwMQT9AW6l+AXHBHrInleBVZYkpd1RoSn/LaTWJ8rtkQfC+qfVh8u5eJ7S5k9Ti5J/op+WXlxySFq5ypYNcrXN72py0kIiDIMSGNixPjRfP8Ba9n6KRwWXmVH/ChiEP2V8te9v8NVX2WAFs9OTA1V5t9MFcxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806288; c=relaxed/simple;
	bh=aal6pmcMFhEmC6JlNnBXYOCfNCCiB7t3tPjAWSuNE+0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rShY44osGWEdMbad791WSMmGh9GTRDv1EDfbzxvLjBNLQlHDDVPQ6ZO8uPkTvW+OysyoHaZ3n0K4lDwK2KxK58xD/mmzZ4Wq+LjEG8+V8H+lD3MjRVG7gFDzYdwcfHn8SaosQjJ6FEbBa3zm6IxG9tQ9MJxE1yxYCFULrICZzgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=RKwnuWrZ; arc=fail smtp.client-ip=52.101.186.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLgVQJFSbEkzW2UceLJVrW1TU1o8WhrVEzO/0W2D4dl0EIgv4IIkvAZzychxwyFcH3u+dLNBZm+yLNW6W6ECTnin9OtSF9xpJ9LvgkVZigeCL10sOc8n6zpg2pJiqQ1Ma4FBbNzARQnKPCB/dKWUPbM9m51YD8tHhm79TNJwjXIxEfwsaxSV+LO6KODT5DPy0cukv3Aya3icqcBXLSmOGWh1pJZC4Snc0MSNSK+02l9p6cdN1MLGWVwKF0kb1M5OVxW+cG3QZc8QU2llu2Sc9ja3hFfHcgD61VUAvdED4eQRBlWMI35vw8BBWleKJvWQQFbEJ0cqmv96cFFtIP1TlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3XrBQ338fzu3M3adibxezIEEEAlV6gMVs8ZzXInn/E=;
 b=yvF5lc7aokUZNjhfO2Oo4yMZSdgfHfjxeBW8HETCvyD2EwcRy6ruOoBlhBLBiZ4Rrc51bdkUXXu2XxRPyx5MQ1vehGoKiMzcdv/D+gE470U6kDNnNzMFGDPrFFwSiF6gSB+zEDXJ8hOYMvUwa5IN+GLxFARxkj5lARkwUDFRoVk7iFWr1u2AZVltM4kNJvnxrRfnlWnL9C4IIYVGsO7Mmfr75SZPF8cPK0L9S4RpRHD3HyiAiT1mt185UsOu+a4S8ehsNCqczeWI9XGGiGL2RFEI4itn5R3emnpTIG4Thh1K96wwxOq7IBAN26rTLRFP0rpDNbj/HRQ4oQYEkyDp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.2) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3XrBQ338fzu3M3adibxezIEEEAlV6gMVs8ZzXInn/E=;
 b=RKwnuWrZVR8cCdcX3DqGyUECaAdegjzJ4PT6/j1M4YL45pIYmGSKmFhG5Vr4qHkEANwDWwAWvlSxaldw4ObRtAY4d+ZTfVR3/xf07b1tK37LEO1yjbm8KsALe2HH4kdYRmWP+xEzqEc2y1IpfSBHkRA43TMoVDg2265VFMdYxjQ=
Received: from DUZPR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::17) by ZR3P278MB1654.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:8f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:17:54 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::c1) by DUZPR01CA0039.outlook.office365.com
 (2603:10a6:10:468::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 17:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.2)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.2 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.2; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:900b::219) by
 DB1PEPF00039233.mail.protection.outlook.com (2603:10a6:18:3::18a) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 7 Jan 2026 17:17:54 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dmZVT51Qhz4www;
	Wed,  7 Jan 2026 18:17:53 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4dmZVT4bwzz1yDk;
	Wed,  7 Jan 2026 18:17:53 +0100 (CET)
X-SEPP-Suspect: 2fe3fb769b9d4b0994e369ff9a65768b
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4dmZVT42NMz20tJ;
	Wed,  7 Jan 2026 18:17:53 +0100 (CET)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4dmZVT3Qv7zmLs;
	Wed, 07 Jan 2026 18:17:53 +0100 (CET)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Wed, 07 Jan 2026 18:17:52 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010002.outbound.protection.outlook.com [40.93.86.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4dmZVR2zXxz2wnq;
	Wed,  7 Jan 2026 18:17:51 +0100 (CET)
Received: from AM8P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::23)
 by GV0P278MB1399.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:67::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:17:48 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::ae) by AM8P190CA0018.outlook.office365.com
 (2603:10a6:20b:219::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 17:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.222.204)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.222.204 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.222.204; helo=de2-emailsignatures-cloud.codetwo.com; pr=C
Received: from de2-emailsignatures-cloud.codetwo.com (20.79.222.204) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 17:17:47 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.6) by de2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 07 Jan 2026 17:17:47 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::11)
 by ZR1P278MB1673.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:17:44 +0000
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7fab:6cfb:1321:c1fe]) by ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7fab:6cfb:1321:c1fe%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:17:44 +0000
Date: Wed, 7 Jan 2026 18:17:35 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Javier Rodriguez <josejavier.rodriguez@duagon.com>,
	linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/5] gpio: gpio-menz127: drop unneeded MODULE_ALIAS
Message-ID: <aV6VL5lZkaXBKJ1X@MNI-190>
References: <20251230215928.62258-1-josejavier.rodriguez@duagon.com>
 <d0c53c64-37c6-46dc-8df4-7dcabda4a980.d621b331-3ed1-47f1-9d60-e41be6c9e787.6c4fe9b6-7521-4dba-9edc-dba43347acca@emailsignatures365.codetwo.com>
 <20251230215928.62258-2-josejavier.rodriguez@duagon.com>
 <aVe1x3a_q4b6rSrX@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aVe1x3a_q4b6rSrX@smile.fi.intel.com>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZRAP278MB0525:EE_|ZR1P278MB1673:EE_|AMS0EPF0000019C:EE_|GV0P278MB1399:EE_|DB1PEPF00039233:EE_|ZR3P278MB1654:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f90439-3e60-4559-1e88-08de4e10b1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?IePMzeiazIM8Sqjsdq42zp+IIsPZw/PLh/S9ZvfImrZOAiUm3J4/6O2xfPnp?=
 =?us-ascii?Q?VQl84tQ59OwxWhdzvexn8rRIM0wp4XG0gTKuNwjA9wlO+vuaSEGoemw7b0lO?=
 =?us-ascii?Q?rV6WkDw4nj9PwB4L7IsmCIAkpOWkxyKfWXRMt/SGLy0l2BWcoIJLDLc+JBP3?=
 =?us-ascii?Q?jFxyL/mukiT0V25iI04JnPGm9R5h3lDygBrkG7r3e5/LzT9Q9pbIh6KqvVIo?=
 =?us-ascii?Q?D0glMksyWWA9KbgRx22nNIkArGy3eMdhz3IHYl0+5e2QqgaeXpfZy9Z4vJpU?=
 =?us-ascii?Q?7rrzTCOp/BiZME+9jLI1uKxOuomIaCicNKJptvXQDposZ+i6xtZonp4ZnQCH?=
 =?us-ascii?Q?iPRXANzPyfD15O8h/ueVVIanAbyno8SbZ8tVU0h2BBM0+5lMGMIG/Ke4ehbZ?=
 =?us-ascii?Q?zjOnY88mv33IW7CW3LpG5rrG0QDG4/4qXt6YwdT2DurkIJU9nJMKx9bXK59W?=
 =?us-ascii?Q?4VerfG1Of8g5mlfjMaZYjpVvnwhPbIaCoUkKK29XiJ5DE+XktELpKW0hm2vd?=
 =?us-ascii?Q?uduUEHL0Os1aooNo7sJBYizeiOId6Dvq/dTCb/5jL3xpZx/zyzXJDqi+cL5B?=
 =?us-ascii?Q?ew23YOR2NI9/yEyUUFGaxWCrE3rZ7eYYyjzJhT5KHLrreXipVHfoMrNF9CTs?=
 =?us-ascii?Q?ohvUkeHX67ZZy0qdznMI/MdfFwO+EGAelJdj0OKmTA4r8VOAYz+SpnzcJ54l?=
 =?us-ascii?Q?h3xmh/UdMGJBjOUlEl5xBsgt5GDwwymG7R/vsZujjRc1d5K0ZEUu2xKlpFCW?=
 =?us-ascii?Q?PfX1zugE9lO142+qRiXjYADSfdK4NVmVdD2ieWgnK58EQAa5Hqc/TY8jW48N?=
 =?us-ascii?Q?QDtFn2k7BqVP+hvLIPpjYcezzgcA4bPAx2NtN2psbrgsmSq8b8CZYrKUcPM2?=
 =?us-ascii?Q?Je8ihsru1MW+bbBV0rTm2qXAPoswhdiCbQ5U2E3cX0FWfcv516YOuvXwyk3u?=
 =?us-ascii?Q?1akaUgIssSSo0Z9t/ZDE9AeDDXdAGDNj6wtXxBsuAexm1IKLfajrjEfsK90b?=
 =?us-ascii?Q?OAgNz+rsjZKsexygN35nepPm6xTJ4O766qCIY++bsf65kdJ9qI4HaStsHHOw?=
 =?us-ascii?Q?bPQZyVoJ2TNRfV0rUCUNC+1Z+wRFgoDXLbz1+xhsUgqINBmIRlGn2ZRD3sG5?=
 =?us-ascii?Q?FIz1Nvc7/ulgn/z0Khb9clqL1iN5bQMa6HMuLSMzZD/Ly0PKRyHKXK6jQ/Xg?=
 =?us-ascii?Q?5XENMcUISGWNiVupzMd6xEOYkqmUoyDkh8hFK96yKkx6giU+JGm8c89ZVLuX?=
 =?us-ascii?Q?oxwgTJWY0WSTJwG6sdYnTidFgWPvlWLqiS7+mQtGhdhZt3USorpQQ4vJVyoK?=
 =?us-ascii?Q?XZylXRxdzIcYwwkqT7zvaQGZiYnb+9TDaZWC2dp5nA3STilu2XeE7rJz6ts9?=
 =?us-ascii?Q?uIXNTauoTHf+TQRRwASEFRbtutqZj/snwnmXpow7cMXuduGuOOjilyiyjf7m?=
 =?us-ascii?Q?uZdSftqnyUoO11NS4EHuQyJHAoHD9M+hfK3A4fszI8asAsh1d24CHuyrZWS1?=
 =?us-ascii?Q?yjN413x+mQhsCxSXun65dDiDBcOrWz+YnBGz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1673
X-CodeTwo-MessageID: d73fa30c-8bd5-4300-abbd-047f40e4f7e4.20260107171747@de2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 7e8429a7-9aab-4f1c-466b-08de4e10ab72
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|14060799003|82310400026|36860700013|1800799024|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?xoi5hA895CqGL78GpcrrY0LBR4CSk9LAV/PFxYbJCRPcj+czIEkDOomQao+p?=
 =?us-ascii?Q?l1OXItyJjcT/2fX7zXwE5CWv5BhOe0lln9IBJ9rNBPOaG4BUwObBupfyKxUJ?=
 =?us-ascii?Q?ipeW16knKh5DIttgNZKk7HeEuOaX2Ao0duWUY1n+CwDtm2amO70tdrsaA7uO?=
 =?us-ascii?Q?33c454bEIOBtNYkHtRqi37wra7X4GkyD2c1OhpaoW0110zNo8gQyBvB9Lvui?=
 =?us-ascii?Q?ho5V2cODJb8M7dBvcI/k1jkYNcdrt++eVgAkIp+UJfwK3IKtL1eoKSSyUKvm?=
 =?us-ascii?Q?Zf5TReNeyLyC2voJs6/J3LOHanT2bonuJQmJIw3pSY7zV3WMFcLgELpfBXjK?=
 =?us-ascii?Q?ZbwjvA5iLotx8GJU6JUlm68sfypcwGx766acfwkmYN0PLKCENAPaensoCS9z?=
 =?us-ascii?Q?89/vaQxcX4PqiHOgX8eahsiZr6a+qWVDALdxhqUlEOHLhZYyRGgwKPHwSClq?=
 =?us-ascii?Q?13te2dJX2nNITN+BtQlY7PH7nd/K2T3IDTgjNoGCAVxJsiqHMwFUifj4eIil?=
 =?us-ascii?Q?gf0FyA7XhKG9dueVn/GkPLtAuXvF6lvik4xQWSubra08k4II1hugAl4Sio9q?=
 =?us-ascii?Q?/6ln/mgw98OeWwvWXdWi/OGycJgwodelitSqVT+cGAaT28sgWPHH/b+w0WV3?=
 =?us-ascii?Q?yXFtKS1VUWoGxjcCO1AkFtSDNIXkEF2GGC7+JTKA7j2giH4mcrLHE5kqKtLv?=
 =?us-ascii?Q?c1Ri/0JBUS6/Qnh4XG1Y4OGCUrKSm1/PgLahTxtA9FNxtcFck7jM2m2sXghW?=
 =?us-ascii?Q?rQsr+8WiMFyeVl5aC661OWssDImkIsDTyOx8/BRuQYjbHNmfDx7mLRZ048Tq?=
 =?us-ascii?Q?w6Wc+gwHh/TOLUKIFxuZBfeW9RkQWvGwO/0m0yJGcKu1L7uWbwdd3DWFhYZS?=
 =?us-ascii?Q?H+/TCCtLaXAK4CoBuEOeX8gheT/zCXXnTmG5DTE8ezf9GzRSnP/Nlx0Cs68P?=
 =?us-ascii?Q?XjFDmK2uQTdaB291iEZDpa5y/Nx0MKniA9zqt9WeCM2+tbB/up0kuHBGl+k6?=
 =?us-ascii?Q?ZSVO8ijnxEaW60JrKsvau4G/zWHgDnkDtPHk7PSjjOCEVF/z2kpnayPfIbQ5?=
 =?us-ascii?Q?xwRlS+sKCXJM+bYO+RJsBaDIjXCr77leP4dWrJlhaGO3f61SAuh1Ycf2VFlr?=
 =?us-ascii?Q?jq4OgtipNADlv0xgT00BCdaYkHHMRxVMaTDKDIqOFNeWXNri25KYUZq180pH?=
 =?us-ascii?Q?yJ/lSzrFGxCHS7XMmU+rGkqRmClLPvLc2xKOnf5kz4vmgLvCx6KvknLCZIdj?=
 =?us-ascii?Q?BBZ07hJQedjcrnW80//16DwkOU6TsKu1PJaTQqwRfYjxb8tsUHF+gXvzYVnS?=
 =?us-ascii?Q?rJx9OQyVA5sVyNs2jE3/IVujoOMNB5Qbr5J6DhrQtnnhRJmaK9AjoHN9K9u8?=
 =?us-ascii?Q?YhFMFCFbFBNTO3S+fF5nzD5+ixXme6MuuzS0l2haeVMILd1QHsVjxPelcPo/?=
 =?us-ascii?Q?fWSqRrwFo2gqCvgRidj19JBa8L32ncWdSiyuDFFCEN+XOR4g76vJBN9RYM1m?=
 =?us-ascii?Q?b7sbjhKice2t755ysTbAgPJwsyUXFYdgZUus7Io2Mb52gm57aUzhBAyqz0ER?=
 =?us-ascii?Q?T6Lfn9UStbXNnr4x9Lg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.222.204;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de2-emailsignatures-cloud.codetwo.com;PTR:de2-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(1800799024)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1399
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.86.2];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.86.2];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2bce450-30fc-4d8e-b4ca-08de4e10adeb
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|10070799003|82310400026|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFzTkZTXZrBxbweeseJJuuGmcaVn9QmMWRJUzL4CJ4y8cNdcty8CdVZEeJK5?=
 =?us-ascii?Q?Gs/b4xpTTCzKjY1lcsd41K5wqzLULQ6IcVIFVYaWrDo9Z7Y7lpaT+tKcBZPl?=
 =?us-ascii?Q?7R6hFMqkRQfF9w/hMHYhy51gJTKwqAl/LzrJ171Plju+8ClzCKZ7+lqLatSM?=
 =?us-ascii?Q?hvFGNn26NZyQceLQg5b0+2xmIxLcD1dooPmySe8NGfjN8RApWVQU5LqnnP0v?=
 =?us-ascii?Q?XDEF1yLDsM4IxEe8L5XlWx3S1JEQ1g3XLj7whkAPM60WssaYbA+cMjSHthMx?=
 =?us-ascii?Q?81+I5AO2Jf/mntUN4Qg/vj++5tkG7gAMhF0DXL1jUAGRkzsBYdy92I+Kg3PX?=
 =?us-ascii?Q?5salHOpcgnr4sZ1SNOeSeVpam0wJ3R9HnXBdXWUJz8pu2HCBbCgCe7csQHpF?=
 =?us-ascii?Q?nElRnl1A+SaRdSLyiLvWTl4wW9JeVPnkJuRKI2EbRp8wYJfKxHTSDDeQ2DdJ?=
 =?us-ascii?Q?M5Dhg7VMS0/4vNDnypyEuVVecfnu6GZdm8qf4ZXGyKSo25eGptunQINrRDlS?=
 =?us-ascii?Q?bj+CT9C4tDsAaKWP0Sp7URI/AVxDG+rws5fKEz7rGHd1WC//H8GmJAFkFkWc?=
 =?us-ascii?Q?WfrXNifBjqWHcf085HLVxef5ESFU9z+lJt3OiUFK/CUlLkfGgUqOr8B6390C?=
 =?us-ascii?Q?5c14ZeOw5/ElSxJGKUkXRzI+owXKOx0KkGEZsDyl4nUpa+P6or84+gTFtZQl?=
 =?us-ascii?Q?4VAMDK1ne7RFU/bRmRJma5Tw7SsRMiLEh+Suae4roEOpEvGCykbknhBn8KQf?=
 =?us-ascii?Q?eA8HlY3VSCX/ZLPkioo4SMK6Y/0koKYC5/dfqrv7RmMLNCe823dJFr9msj0B?=
 =?us-ascii?Q?uTZMIHviqPE6mIZRmxyfNFKxswpzQ/ovZIgYKuFAzOT1sn1J97KAW2PHWLNQ?=
 =?us-ascii?Q?iiaIUVd0uej2w+BlTDDL3I3+u1Qzg92RAYP7QMPGVNQvEGh2Ixr8P5gllZDC?=
 =?us-ascii?Q?pCKd4jXcRwkMnlFNCXFDQDk3DVHU80SmcyUmC4JTeA59/5ah8b+T2HLOjOYy?=
 =?us-ascii?Q?PUE/7Coid4wN8laWFMDAl+PoeO8D5amuhWLpANs0qbNkhkjvv4k7KMbuCV6B?=
 =?us-ascii?Q?jEQC/N5lE+xRAI2KnB18peui3AgRQIxgyt0prLHe7Oto3zFxlxBNUkTcCrT3?=
 =?us-ascii?Q?DgV/jFv61qyN?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:900b::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010002.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(10070799003)(82310400026)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:17:54.1065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f90439-3e60-4559-1e88-08de4e10b1c8
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:900b::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1654

On Fri, Jan 02, 2026 at 02:10:47PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 30, 2025 at 10:59:24PM +0100, Javier Rodriguez wrote:
> >    From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> > 
> >    The MODULE_ALIAS() is redundant since the module alias is now
> >    automatically generated from the MODULE_DEVICE_TABLE().
> > 
> >    Remove the explicit alias.
> > 
> >    No functional change intended.
> 
> The patch is mangled.
> 
> >    Fixes: 1f4ea4838b13 ("mcb: Add missing modpost build support")
> >    Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> 
> >    Cc: Linus Walleij <linusw@kernel.org>
> >    Cc: Bartosz Golaszewski <brgl@kernel.org>
> >    Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> >    Cc: linux-gpio@vger.kernel.org
> 
> Please, move the Cc: list after the '---' line...
> 
> >    Signed-off-by: Jose Javier Rodriguez Barbarin
> >    <dev-josejavier.rodriguez@duagon.com>
> >    ---
> 
> ...here. It will have the same effect on email, but will reduce a noise in the
> Git history.
> 
> ...
> 
> >    The information contained in this message is private and confidential, as
> >    well as any enclosed document/file attached to it and is addressed
> >    exclusively to its recipient. Please if you are not the intended recipient
> >    and have received this message by mistake, notify us of this fact and
> >    delete the message from your system. The copying, dissemination or
> >    disclosure of its content to third parties without the prior written
> >    consent of DUAGON IBERIA S.L. is forbidden. Otherwise, it will violate
> >    current legislation. In accordance with Spanish Data Protection Law 3/2018
> >    and the European Data Protection Regulation 2016/679, we remind you that
> >    your data is processed by DUAGON IBERIA S.L.. You can freely exercise the
> >    rights of access, opposition, rectification, cancellation or suppression,
> >    revocation of consent, portability and limitation of data processing, by
> >    contacting DUAGON IBERIA S.L., Ronda de Europa, 5. Tres Cantos. Madrid,
> >    C.P. 28760. Spain.
> 
> This is not compatible with the Open Source workflow. Please, make sure there
> is no footer in the next version.
> 

This is a bit embarrasing. I forgot to configure git to use tu proper email account.

> ...
> 
> Also, you missed a cover letter. Or send the patches separately as I don't see
> now any evidence of the cross patch dependency.

Yes, I decided to send the patches in a way that was not the best. So I'm going to
send the patches separately for each subsystem.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Thank you so much for your review.

Regards,

Javier R.

