Return-Path: <linux-gpio+bounces-28124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D868EC3602E
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 15:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BB3426055
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 14:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C749221264;
	Wed,  5 Nov 2025 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cBwmJ1Zt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25A1DC997;
	Wed,  5 Nov 2025 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352337; cv=fail; b=A+BjhoviwetHZU3cLAHRrsAB3BpVCgUNIr+AwN5ZX3NtbTdHAec5O7zCGhbkV+/rEip9VBDWQNhN75z5df7rgDEfZDawJJxrs01ksL+Xc5RK2xViOuO+c/Rs/iTn4pBKWtj282DcDVIaiW9gIdjAXbvRqhtoo4aSsdTN43VGNpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352337; c=relaxed/simple;
	bh=TLgeUci9LgqRYvXeWYjVBHkmljeK80XYOJ+dc/PhnZ0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVOAjvi45cojKIDglAMRjZ6OZYbIJioJWa+ZGNWvSV+8w1fK6I1bu4oaiYRrRfBjhpdULlBLemn3o3qq2kXBkv8gnHHzjpbBYyVEx4uLQxHRSrDuY5PljNMkiIEPrecgjL+qTfqfinDPHNdmccOWiGJ+lH7MAuM0hhyY9hJ3IvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cBwmJ1Zt; arc=fail smtp.client-ip=52.101.61.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NntdO8u7AcqRX72bTdtppbgcSWmfkCXXvnJkCJiK8PMEAjtWa43dQue2+m1tS27gyb7behWs9mqrkrJkkeMpd891diLspfsV8klyS4h/Rvwibo8wmPCkhKoOqWPi5R66LMKVF8mDJVwCfLQmbBgTZUHESSkwV+kPJ3OCl7K9ZzINeAQ4VStbAYQ7nXciwS3GXj9DvEFxM4rVinRl/ZQM+/wRaNv1UgeOYqPEYYLA9NAFuy8tM+iH99PHGWquzJDi8aUgfqkMeXPYAKTMBYvmhiJ8CAZU3iVwIZHklyt5sBPXm8qVidNlWiG/d2u82GcRpdhKP2/BQoql1/hY8QSwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/bIhWntqqMy/9t6jkY5rIVPIcHeT8Mh4+cp9Ut5c9s=;
 b=g0lcJqtbm0JYJ328amEYTgIE4EKDG9E24+dMUucQaVmnmHh5cWFmORrlm0mJU6YtrX2ANoObmQeByx7u/HoqhVFHuCi2RKCoXUZZROrEeOzGIJ0BAhNllbpKohP7yUtpp5qj2EjfeuwxwpV16dYRq4vBGl57JRsoWhutPpHVzHY6pdS7IWP6HmtpppjLW2XPAZMjJpQAO/P775WjPq/8jM8rAFcTk3NtWn+X6W4SUJGn+9IUFRko8Ts5GhBjIAxiw8PqNALhvIdzNahDcChEKxFe1XSYCpx1qMwVpTAU7LCEZmJ/0fUUQR6kYP4sRkqtmwfJM54thyUebkrWIlMOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/bIhWntqqMy/9t6jkY5rIVPIcHeT8Mh4+cp9Ut5c9s=;
 b=cBwmJ1ZtPXx8ydTKrphVXi/EWLNopfn8zBf7kWfmWg9zidngBg9aF1gpqP0/5JwHnPb1csOAP3rzXsk19WPOKgOVc4cwWMQb7VH5uawDQM584AOty7kfPwtJB6G965VcxASXGq98r3oeNt/tWjj3mUpSETQ0nwZ9UyTQ7IRN6gA=
Received: from SJ0PR13CA0152.namprd13.prod.outlook.com (2603:10b6:a03:2c7::7)
 by SJ0PR10MB4736.namprd10.prod.outlook.com (2603:10b6:a03:2d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 14:18:52 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::39) by SJ0PR13CA0152.outlook.office365.com
 (2603:10b6:a03:2c7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 14:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 14:18:52 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 08:18:51 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 08:18:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 08:18:51 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5EIpOI3830845;
	Wed, 5 Nov 2025 08:18:51 -0600
Date: Wed, 5 Nov 2025 08:18:51 -0600
From: Bryan Brattlof <bb@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Andrew
 Davis" <afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
Message-ID: <20251105141851.lppglxryjbzwboqv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251031-am62lx-v7-0-cb426be9d6ee@ti.com>
 <20251031-am62lx-v7-3-cb426be9d6ee@ti.com>
 <aQhcTbQbSZj-MniQ@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aQhcTbQbSZj-MniQ@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SJ0PR10MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad7dfa3-c664-4b85-ffe3-08de1c763f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|376014|36860700013|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b21GQXJBM2RqQWxSam40am8wSzZoSUZlV3B6UjhjZXdFbkZBT29NMVI4YjhI?=
 =?utf-8?B?aUcyQlRMbzAybG4ycExlNlQwOWpwZE5EWS93K0pDL2xZZUpRZTBtOWFmcENv?=
 =?utf-8?B?UTQrMitQSkxjQTFaSkJ4dExSR0lvVzMzc1EzZEdtQXpPOENWdm9MaERxcUx6?=
 =?utf-8?B?VHdqMEVOTzRuRHQ2cFlOcXhxMUtHakIzaWJBbFhHeUR0b0xRbVZjczJ5akJn?=
 =?utf-8?B?RWxXaHpCUG02UmJ0TVVtY080ZHhYQ2t4Zk1sVU9IN0RaZHdFSzlOZXlqNXZY?=
 =?utf-8?B?WEdJdHREZXBjOXNvWDgrZ1U4YU9YZGU3STRxMk1XbFo1eEQ1QWVWRlRTZkNC?=
 =?utf-8?B?dVZVUWZEVmcrd0ptYXhpMytFdjFraXZuRmx1WVV0QUJZWlZ1RnNqc0ppOXlG?=
 =?utf-8?B?SVRtbkZENDJnZTJNQkVrOXVCR1Rodm9kN3BHZ1I1VHpzejlzcHhHbEZ6TUtO?=
 =?utf-8?B?YXc3cy8wVmt6TkdXV2lHam1PWmVuaUJ0TUNKRm9rQm95ZUpoL1kzSUFVMlhE?=
 =?utf-8?B?SCs2d1o3MVBxZXFvYThyUlEwWW9oVWNRUlJVZnhCYjZyZzdYRWZoYm04VGMx?=
 =?utf-8?B?aTBtK3ZHRWkrc1lTeVF2THU2SkhwNlcyblVpWmJGZ3NlVGxOa09WR1hDMy9X?=
 =?utf-8?B?TVJmREJnS0IyUEhnalRvaEZNQW1xdVJpRld4a2FaK2xEQWUwbDM1YzllSS80?=
 =?utf-8?B?bjVMdTl1a21VOGJRNTJBNXdTTGsxTG0yR3E0K245eVRiWmVkOWFHaDNubDdT?=
 =?utf-8?B?dUZlZmQ4aWE4YUVHckpwMHRHVmZ4REJvaFJQMXptdmtTc2dhWHpjZmZmVUF2?=
 =?utf-8?B?d2hmUk5oRy9UYTJoQmhHOVJIMGZDdm5BUHdjcUs0S3NUbWIwbVhER1psTzg3?=
 =?utf-8?B?OUlLZ2VhNVd0TlVBK0dBR2Nld3ZFMjYzd1B6RlVYcWlBb05JT0pTNzN1RUhZ?=
 =?utf-8?B?dWlObFRURDFmMDNpaFdVZGhzS1hqaEN3WXl5akxENkpqZk0rU2FIU0lZU1JQ?=
 =?utf-8?B?ZWphcWxCZXg5eXhhVkdmQzBFOSsyYm84bFQydU9yTGl4blNBdmFpUVQzSVFm?=
 =?utf-8?B?VDN5TWZmbDJTSjRaeittVmNzME1BQlZiVjMxNGF4dE81TTlrdVBsbnJVMW9G?=
 =?utf-8?B?UWh1V0pWcXlDVzhHZUtGMzM5RktCSWFmUmlPNlBwbVVlVDRzK0tpampVenFU?=
 =?utf-8?B?ak1mQmpndCtOc1BRcHJZaXlMd3djR05pMm1maWp2UzdkYWRrK0w4ZGorajY5?=
 =?utf-8?B?NnhlY2ZCQmNHWFBJOFpLUXB3aWNhSHhRdW5QWEIrMklkMHlhOVBlazlGVmh2?=
 =?utf-8?B?ZnQ5VlIvcC9VOFRndmJ6bVBQbWxjSWhYUXViU0FKc2tQeGM4eWRuQ0c1RGRS?=
 =?utf-8?B?WHpON2F6WldHUnF1bDMwUy8yaGQ5K1h1TjhnOUswdmcycDVrYkE1bjl4SmJk?=
 =?utf-8?B?d09QWTFJcm9wVnk4alhqaUJCT29PdWJZaEh5MmZUbWR2U3R2Qmp2QU5ESVNt?=
 =?utf-8?B?cXJNZ3hxQVZNT1lscVV5YUZYcFdwdjNyR2JLY1VxUnZtSnk3NzhmL1NpVndJ?=
 =?utf-8?B?b1R3NmZybUM5T1dYeDZTelFoQ0tkRVBlU0pBNWpsM2hMaStmb3hFMjlkSUFF?=
 =?utf-8?B?Nk9WTUt3YStrbHFDdW9pOEFLL0JQSkRqdE80S01qbXh4R0RDRzhDYitOOVdi?=
 =?utf-8?B?NTFYWWIxdkFrRU9HQThmVXJ6SjdOVldYM3g3dHFKbTFCTUtGSXcyeWE1bFY4?=
 =?utf-8?B?VUVZMFJPMUxRV20xRjhXSlFUMEJUbDA3aUh5TEVzZ01vNGxvcmtjUTZPUm82?=
 =?utf-8?B?cnVHSUo0MmozRlZFa3duTlhJWFAyc01CdDNRTVgwQ09URy8wRlhMYmVVOFdv?=
 =?utf-8?B?MjgvOGJmemU2MUMrWm9uTTVFSU9MRng0VkNxU0lLaktSRDdWM09CN3hZZlRY?=
 =?utf-8?B?UDF2Sjk3SGFiM1VTUmlMNkhFcVc0SHlERGR6WlFRVm41UE8rb3kyYjdTRGtC?=
 =?utf-8?B?b1NDZEdHc2wzTHJxcjJ6TGFkVXJYbTBTL1VxTkR4WUl6NXh2c2VrV0FXblp2?=
 =?utf-8?B?eis1bjZ2Nk5QelVaZFZxR1gwc1FITS8wNjl4ZFRHRENXTzJwaTd4endPNTlZ?=
 =?utf-8?Q?Qr6A=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(376014)(36860700013)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 14:18:52.6769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad7dfa3-c664-4b85-ffe3-08de1c763f54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4736

On November  3, 2025 thus sayeth Sascha Hauer:
> On Fri, Oct 31, 2025 at 09:08:06AM -0500, Bryan Brattlof wrote:
> > +&i2c0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins_default>;
> > +	clock-frequency = <400000>;
> 
> status = "okay" missing here.

Good catch! Thanks for looking this over

~Bryan

