Return-Path: <linux-gpio+bounces-34983-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yARfKXqi2GnegAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34983-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:10:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAF3D333C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A5330086D2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987C395DB5;
	Fri, 10 Apr 2026 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="Mf7WS6Eh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022093.outbound.protection.outlook.com [40.107.168.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA5238C2C0;
	Fri, 10 Apr 2026 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805029; cv=fail; b=cdZRT+2ZEw0zoUYGSl1TlVr2JDMosxGtCYD3rkZEFTHwc7f1Ko1NPqSAx+rOBvd2ibl8557Vzdm5HGG0b0UYU3ToUJCmMSHDDTQvf6jL7MO6O5WGgzhYxHbuuyPXqxmbAWxzqoa5R2Hx9C9ULWQ3bix+Fn22RSxW3ChQQFgPawA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805029; c=relaxed/simple;
	bh=WIPTNwoxfOKGTmkXFDNyG+HvDjGdenoSQ+8Nfaw+AzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rCcs6K3nB16/ofbuVxrHSgUcurT4b+a2wTsrfjlMH4h8R8ZuByu/7ajNVIYt3iSVsLMGvUgYzgxA96pFzPwRagf4XWEp0xCuMSu7qG/kBWu/Gz5ompxzRKZIqsSPN+vqZJSO+6UXhmrA+7pbO/u/1ShXgc6c+bZy28qXlLTtXIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=Mf7WS6Eh; arc=fail smtp.client-ip=40.107.168.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3wX5wDRHd+AawlTafG5U/ceSNijvRxOiMCHo2DAVzFNDvkPKHbAEab4DGYVWK98mtTqnn2zf6krrz/z6h14B6YiOYPZ7PQ9BVwK75pSVmzrY7bZ8+rQozPUHRSu2Lg3i7KAqlyVW2YeQxAik+iTUlbTHnjvvnLS/yKCbGumvGfrA46mScVnf2AmZv6M1UV1QDnzqFwganhVN8u4DvJJ2PNhUvUl93zZXquS26jnYujzAvcCiQmI9pLya21gN/Juc7KgYU+7Tyd/eonUltEccmsPHXNwYlHo4vLYyxwlfkI/R/HPsaFBu6b1HW04SRrV0IAp2txrkSHVUvQHy/210Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHi5iw0cWIumUpNplaMG+hOo6Wb+6wvO0T1iMrzaB44=;
 b=fifwOfsiwkQL0yBjyQRuCppfahVymFmbL7TavubkPnGqZ6s1F36NHmtjRXjBOYWkLEaxMG3HsiiDQ/ul6RR91cBl+8hNunrdCmnULiuAukXEIIwuHdb5dbHOuYIY+QkMOKuI1JrnWWJhOGeXW2jgmwoG5GCLI4724n+T2Z4gwRmt+smdNljq5fo+tbUAYd261Gp8saihjrrbZBO5KOxO2ON1kQ6fVjG4oPJ4ZcUAkS798tklIUN3B2X6J7EovvvyFsCU+uR7cxhpBOPr7narkh+jvk6kXVoDBTY5/2kWumGd40QMNgZG/eftWX2FhnhWWL/HSiDp3xgoLOE6ipi/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.31) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHi5iw0cWIumUpNplaMG+hOo6Wb+6wvO0T1iMrzaB44=;
 b=Mf7WS6EhlvacbB8l60q9zHghIWpq+U+cDcCEu0K7C0SaVRNKROVUbS9G8M07qOCu1B2ReIN8AdjDBhrSYUv7vVDYSpNAKZeKzTfwZ1N0NOXVNhfjQgvnl5V28qbVJeGWp+Ia/UrQPKGB4k/rsOSMwjmyNnMY85nMiBPDvXgrtaI=
Received: from DU2PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:10:3b::7) by
 ZR5P278MB1983.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:af::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.42; Fri, 10 Apr 2026 07:10:23 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::41) by DU2PR04CA0002.outlook.office365.com
 (2603:10a6:10:3b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 07:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.31)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.31 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.31; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (2a01:4f8:272:5fe6::218) by
 DU6PEPF00009527.mail.protection.outlook.com (2603:10a6:18:3::8) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 07:10:22 +0000
Received: from hz-glue02.de.seppmail.cloud (unknown [10.11.0.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4fsScY6KQfz115t;
	Fri, 10 Apr 2026 09:10:21 +0200 (CEST)
Received: from hz-glue02.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTP id 4fsScY66L7z1x2B;
	Fri, 10 Apr 2026 09:10:21 +0200 (CEST)
X-SEPP-Suspect: ada016998396411a89cef8c7b6f74bd1
Received: from hz-scan02.de.seppmail.cloud (unknown [10.11.0.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue02.de.seppmail.cloud (Postfix) with ESMTPS id 4fsScY5fzZz1vlB;
	Fri, 10 Apr 2026 09:10:21 +0200 (CEST)
Received: from hz-scan02 (localhost [127.0.0.1])
	by hz-scan02.de.seppmail.cloud (Postfix) with SMTP id 4fsScY5BGmz6Fdh;
	Fri, 10 Apr 2026 09:10:21 +0200 (CEST)
Received: from hz-m365gate02.de.seppmail.cloud (unknown [10.11.0.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan02.de.seppmail.cloud (Postfix) with ESMTPS;
	Fri, 10 Apr 2026 09:10:20 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com [40.93.85.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate02.de.seppmail.cloud (Postfix) with ESMTPS id 4fsScW3VFYz2wdd;
	Fri, 10 Apr 2026 09:10:19 +0200 (CEST)
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::11)
 by ZR2P278MB1033.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:60::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 07:10:15 +0000
Received: from ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f383:28c1:ea22:fb29]) by ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f383:28c1:ea22:fb29%3]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 07:10:15 +0000
Date: Fri, 10 Apr 2026 09:10:09 +0200
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] gpio: mmio: convert accessors to generic
 register descriptors
Message-ID: <adiiUaqMwYBKS892@MNI-190>
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
 <20260407184805.807328-5-dev-josejavier.rodriguez@duagon.com>
 <CAD++jLmeCMAGmLjpSok7ouX080tQtGH9_jystGgh7RASTSrzEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmeCMAGmLjpSok7ouX080tQtGH9_jystGgh7RASTSrzEQ@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::18) To ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZRAP278MB0525:EE_|ZR2P278MB1033:EE_|DU6PEPF00009527:EE_|ZR5P278MB1983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8cbdd5-a12f-4099-6529-08de96d03b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 izWh6Iy/5bAq0Hek5ctrqoq+tTrOlXw2aZnEXUgLyiZZf7wBpHJD1s1Mz8xlXk3nG4HncefDGxKGRr5ZifBYZPwuKFihd6aJW0P86NVb/EiR8TbpXmSid1KCMsvBAn3mqoJltSuAk0QzgYvvwNRIk7lFcQk4CgbOHVK50ba/TWC/loKcX0Jvi4x48DTnXZFpid+d8o0wyguIUSehIcpXQqeZ5gWCBQIOgd3osC5Lmtq+a52bQ0cZ/2rCe2GUI545ZZamdEe73W2q24yw8GAwmSOZvnf7CflOI598OKYM4An9hpkNMVmB6vqmI3pZMQFoJChlLvem4vRbWxLf7wTl3xh4SSSKSOFpvJQU+qZkTBdSq7n0gsnFHjFybxRb/XqUJXH3b728epSQ6yB/KxMZBhmrmjCxiBXSWXgdn5Owz1GqeWTGzPIyjq0Pzl1aW3/C1IziLu4NZLbVlARXeKkhZ7G9DR1Iou/hhoNfOdpua91+3s3jkiaI/K0EN9gS1exbPD+xOY1K4j6C7cEHKIAi6NRhKeB/0bewTI45qr14+yPIV2YWHReD0li5QtGSero758jrRZMVRHWUEQH57iMQAyJKiF6yFYVGdhN8aBgVsjovnFIswFaRSsx/pewlbZtgmrlWjEnaa2KubFyzVPJ4DsfGQYP3BT2BBgizizhzk/oMe/QN6FX9F6P5VISgjZjv1ZNuIoNfhbDtOWtKxlFWcy3nEHMg4H70cV9i6fM/xgG3moBb2Rs1eZ8p2tCDx9oozbJEEqTfbsyNi3l5zc9hn4oovachm9PX9C07tjxMrYc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0525.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 FeFkQQSf0HVwtNMR24rLAQ3t7fE535iOSBq9SvwGqRQL346R2IwO/VV2L1WLv/C25yvNqZnXCE4z7uXtvStajiuQoRpzp0RS0UwOt19SSPuKpy+hmwsrh11MDv0+WeI1t2ToWBgdWR0yMMhoUZmjLt5qvUBiaPfEntP9rWW5Mb/76I61bJviPPQ0N7ZGzsLsD0yHiK0CHTv+VqXE9Q7pkzwR7MNngP+aKcu1ChBZwTCcsWYDihiwssL8fZQfM2/XBWmAAuFNVkskZ1Sw0b5Xc+X4M/gOO5/RQzOgIG8Itu8I7C3R4qKNkAG9HTj/XBmPLF3u6i2xAQXioa8vE8UVGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1033
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3614cbf-815f-49cd-51e3-08de96d03732
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704161411799003|1800799024|35042699022|82310400026|10070799003|376014|36860700016|14060799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SytHaHQ4ZytISnQyRzF5dHV6aTlPTUNxM3lFeTMwRGlYczF6cW9xUnRCdkdr?=
 =?utf-8?B?YVBXNGhNYU1xTDZxRmduaVY1c0ZqMlo2SWJISk9tMzBQaXh0cGcveVNxNXdy?=
 =?utf-8?B?STVRcFNMU3NtaW85Y3cwakpkZjdLWDNaK094Ym9QUDZqU01ZTFpMVnAyVzdG?=
 =?utf-8?B?dlVTeUM3ZHhRR2tROVlHdnVBdVd0UHlRL1lrYVEwRTdHMFpkTGxmQm9uaGk5?=
 =?utf-8?B?U0o1cHlaQ3paMkh2Y2N5TTNmc01hUmxZTm5zZTFjZ01ZUzhwVzVOMTIrUjcw?=
 =?utf-8?B?MXozNndhYzRwVUtodTNqRkJDT1AwblJkU2xOY0dWanFaL1ZFbGcwTmpiRGRl?=
 =?utf-8?B?OHRHVlc3UkZRSHJxbS80dDFUOUxBbi9OSVFhUm1vVFljb3hzcU11TWlTQTZx?=
 =?utf-8?B?OUszbUFybHVGZG9CUnVpWTBCYVJSSmdHRlZlQVlqaUl6V0szODdDSmlzWkxT?=
 =?utf-8?B?VWZ4cDdQbVVHREhOUUt0akdkb3VZZGtWK0pucWtKSG1rMHJpNnJhVjBmc3Fo?=
 =?utf-8?B?eEFoZ29ldnR3L3hTUmhJZXdTbW82TmlUWkJiMmg1VHdaMExLWlZyYXgyWHdO?=
 =?utf-8?B?dlI5VmZJMnZmWmk0WnlWeGViYkcvRjB2T2ZIc1l4L1ljcFRMeGF3K2h5eVlq?=
 =?utf-8?B?WmorOG5rdmIyWldaUzVnSldJTWE0NVlXcHRYazNVQ1hSVTZidjcvVXIwV29W?=
 =?utf-8?B?M250emU5UWF6KzU4dFd4RnhBejVLcnhnUnRCbUdodFFLd3VrbXZrSVJvVFd5?=
 =?utf-8?B?QW52dUNEczFFT2thRE9QU29NcTQ3VlJ1RGtRV0NMQWsxL1JwbUhmKytTQm95?=
 =?utf-8?B?THZmZXFKUlpyK0VuY2ZzSWowVndqTXVwSGh4NHREOFozdlNINDBaZW1qN1NT?=
 =?utf-8?B?RUN5dHZIZG9JNXp1em1KU1pBS0lveXJ2dGsxRW5QL1BmT0pPU1VEV1A4SVdp?=
 =?utf-8?B?L1VHc3lLSzhNeXNyUlpvTkxRTU1wUmxuSUF2NVhFTldDdUZEak9ieFBqUDVC?=
 =?utf-8?B?V2FianJTbmdtRWpTVDU5d2ZZNk1Xd0J5UFMzcFROS2JycmZOb2UrVldtMjVm?=
 =?utf-8?B?MU11T1Z3b0E1VFlPeDJiOEdQdTNERWtCME1ZdUJwNmtIVzVvMUpialkyQS9O?=
 =?utf-8?B?bFpzL3d3R2dlOEZNVUZLckdnK2VERk8vNjZtMXorYVMxeTZYaWd5NkFWMmt3?=
 =?utf-8?B?QTI2MytxR00wU3J4WkxnZ1NXcDRzVGkwNHdRclQ1VTFSNDh0dC83QXZIQlNs?=
 =?utf-8?B?eVNLOTF0NlJUUEVmTEZzZDdIMzRpU094VHZDWDJaeEttQzVVaTFSVHBFaFU1?=
 =?utf-8?B?TkM4bWt0alh1d3I1SDg3Y01CTnU0dEd6YmdDYUhKa2gyQmhOYTRYYTFXdG1z?=
 =?utf-8?B?aWt3emRsZk0yNHBWcEdMOE5CSHd5WGI2QmFsK1p3SndNRzhlckExYjdxdCtl?=
 =?utf-8?B?LzZLMzdmT2kydlFGZlh1dlZmN1c1UGRSSGdFdmRCK1h5WTN1NEhHdWZCRzJI?=
 =?utf-8?B?T2ZhTjZxWnFvemZWN0NRaTZPZUoyTWtmZ0dkeWU1c3VobXFuaktUSTBWc2VN?=
 =?utf-8?B?Z01Nays5a2lsWElPdmJvMVpuQkNkTTkvUWlKRVJKZWVnaDJjUTM5bjFBSTNJ?=
 =?utf-8?B?YTBBZVgybWVaNlBwakpuMkNodFN4Mnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:272:5fe6::218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704161411799003)(1800799024)(35042699022)(82310400026)(10070799003)(376014)(36860700016)(14060799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	57KYPOCc3rwkJJuXGsBXtYfhH6wZVtfDFrwYaKmkASZmd4Jo4H7yN3Q1ny6LHKTaH1YYcAbxvnjxdSAk660HreYjTQX+bFvdm8dWVxC+CUNOkakgPpnOfFbcGKq4e1K8R/TujjPAorVhFghFXufiK3hJa/l1+uIQDHQ7DBVzxx85US6kVkEgzRzeNJQg1GdPb/+ZO6o3tQ0dUuc8T29Vx0jfa1zql3abSjJ3iwTu0nsbKC/jRUaB29gJnavsZGvUD+iwlg1gLZgr4+NTFA64l13jSnfpSOBt9Liwmc9+sva98ZK7YA7p/Efs/ewEDmkiO/ewFnsWwSRTz+iUHfegI34ZeyKFjKuJS+WzmVkBgxTyu62BPfaFNMQI8I8vESKiQAh0mlH4zD158w7j9ksyHTv0u3ZD4CgflvWAreRu9EXYpjEj3RQW6tH1c7eD7IH2
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:10:22.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8cbdd5-a12f-4099-6529-08de96d03b2c
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:272:5fe6::218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB1983
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34983-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email]
X-Rspamd-Queue-Id: 05EAF3D333C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 10:07:24AM +0200, Linus Walleij wrote:
> Hi Jose,
> 
> thanks for your patch!
> 
Hi Linus,

Thanks for your answer

> On Tue, Apr 7, 2026 at 8:49 PM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
> 
> > Convert the gpio-mmio accessors to use struct gpio_chip_reg instead of
> > the previous MMIO-only register type.
> >
> > This allows the same accessors to operate on both MMIO and PMIO
> > registers and aligns gpio-mmio with the updated gpio_generic_chip API.
> >
> > Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> 
> This should work the same fine with a union as described per
> patch 1, and this is where that will start saving a bunch of memory.
> 
> Possibly squash patch 1 into this patch? The new struct/union
> isn't used until here.

Yes, I can squash both patches. I sent them separated to make a quick
introduction of the new structure in first patch but as you pointed
out, it is better to squash them.

> 
> Yours,
> Linus Walleij

Regards,

Javier R.

