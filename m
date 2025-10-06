Return-Path: <linux-gpio+bounces-26805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACABBD4C3
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 10:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DCF3B0A8A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 08:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153325A357;
	Mon,  6 Oct 2025 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="c0p/6okA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023079.outbound.protection.outlook.com [52.101.83.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718114A06;
	Mon,  6 Oct 2025 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759737865; cv=fail; b=ct1NyO4bspKlrUr+bl5xAxQuq4lNhYwlLQpU/Fi1AMMQI0my9rQPrjbXJlInt2WaCgOXKPYTvCycLwD1vNjgai+XLGgNDzU4cG8LSZksmCmzZTLb2h+7KfUlJAZNP/7+lyS1SS9NI2SC35SZj4AE8dG8A6LzKowJeDe2mytdLOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759737865; c=relaxed/simple;
	bh=zkvt5YOKWjQuN0jsBR6EWKjlOi1/K0X4YoPUVUcYQcw=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b1iTziwgUI4dTNWmsN0v5B0miytmpA6DfogB58mGcjDxGQWxDIT7jIHDxBFDVj5oDWaB/7RpdXIeeQXVQ6e5Xf0C/h0FrBJRIq5/Ho8tIU+3lTLyX0EHHn1DjR98gN/B0AXsSG67RSstw6pgjHWcYiF2J13nKHlQa7oB6xf6z7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=c0p/6okA; arc=fail smtp.client-ip=52.101.83.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOyK69VMHiioa0UburOwuk9H2OhRUZ1bLUd/RM4PwqeEVWcQGsfSQd1xxGAVI26VacCeP469gMsqbWnHx9ydhmTnkwQ7gkd5sYiombqheLrH4Ero13jzgIAgWLT6J0HIbGY4MXeTpXBbLsVJnPdez7EVmHqjCunA2RATSHCOhdMPx9hvW5K13YYVC4kbUIut3dF9+N4nkftXYqkL93K/0p0/YL4Bh76oRVUwIJkcGxV4XPiYWJcnOYjsJlHabyahbo4w4DZ6u6BZDxzy+8myMo4/eVyDATEgvK9reuk7UyEoe2cIAdopabr26JTPpp/u8T/lxSCljH06ae/d6T4xOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgS0UIgtKCLL62W91GnfWDLy/NLFrVtUPZGCgFXo2Ts=;
 b=ZyKdozrl/9BiYtyje6A/eoa29K67xk18Ps93pseED5ObBMPCezfgxC+Stt/vEds8zI5t1v2ohAbvA42v39tNLbee+wPxauzWpRnWxaThAwIbDeGInDVH6x1XkQoiq0P3L1SRVmYb0A8t4bA6IhB+YC37xA6hikxp4cUFTFjXCcnrbdUMPYyEVAWw2uE2apXo8yWHxVwPrwbEWgOib9s79IEzg8nnK5xaK94IHld9rU1fN1vQTyb01lyN27iZKvzGpn7K0KfZc7sNuptQiUTL1blhgLEJwvhrN74bBSVNt27DczA5CyHjTmarnf4h1LohFuBgnPoeTLBbM9uOxA++iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgS0UIgtKCLL62W91GnfWDLy/NLFrVtUPZGCgFXo2Ts=;
 b=c0p/6okA9TFYp43tgTC8F/o9QP5VV02peoMAaHBqseJ687yysY0RprZ7cefTG0gxlOe5VlZ58Riir8xy/1kPQmWRzfh9mNcgzYeVdW8bAPv27b0IUm4CQO3ziUynqXGEttKYtmVY8s7SPuOCF+3pxIHRzmoq5hBdW8vvlCSLpUuI6qgE/lasssBJjFgjy8Tod4NhH1z9+8GNaOvo5wi9Zhq6iXnKJM91fXWov2x0PKCMnBxlbyYqSvYw5T1+P/ZVT6wctU1G8TBUCgWJVVunmhdIFAcxEy6qswfHANtzJgOMhq8ewIeqj45aQ5xSo1OBb7ypwYs3fC0v+GenpweXCg==
Received: from DB6PR0301CA0072.eurprd03.prod.outlook.com (2603:10a6:6:30::19)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:04:13 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::3a) by DB6PR0301CA0072.outlook.office365.com
 (2603:10a6:6:30::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 08:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 08:04:13 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.52) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 06 Oct 2025 08:04:12 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 08:04:10 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 08:04:10 +0000
Message-ID: <5af22765-b428-468a-8cc4-cddc561f4a50@topic.nl>
Date: Mon, 6 Oct 2025 10:04:09 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v1] pinctrl: mcp23s08: Reset all output latches to default
 at probe
To: bigunclemax@gmail.com
CC: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251006074934.27180-1-bigunclemax@gmail.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <20251006074934.27180-1-bigunclemax@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::13) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR04MB7779:EE_|PA4PR04MB7903:EE_|DB5PEPF00014B8C:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: aee57ca9-e166-4831-4f18-08de04aef024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RjRpa0NGUWVpdmlvczBhM05NdWdjSzQzK2xRZW8yYktSN0dGSnppZVBWcmJZ?=
 =?utf-8?B?K0dHMXBoT0NleDZ3dzUvV3JWWEVxRTJpZHR0NGdqS09Zb2dDdTVCRk5qckY3?=
 =?utf-8?B?b3hNeVhQTWlOV0ZmSy9HTDFvb2FTejFodjVtR1hIaVQ0S3hLaWt1clF2N015?=
 =?utf-8?B?VHRrTlpvMElCL3RVRW83bVIrNXRhM2M1LzFESVJOL3FKeWtHbW5lNzZyRXBj?=
 =?utf-8?B?TWhtc2NwTTJQeU94SEw4VTQveXlUd1N4aWVkMERHd0NWaFZIT3dIMXpTZ3Ez?=
 =?utf-8?B?N291SlRFZm9JemcxeW9BTWc5a3pHN3VPazVvbC9DbExxNUZRb3pxYWZ2REpz?=
 =?utf-8?B?ZW5VcEh2bDBMVDZTTE05U1V2SlFMSmJQbGw5U2V0SGxmK25sdk5teUN0aFFR?=
 =?utf-8?B?TVlDTXBGNmwvV3JOa3E4V0ZUMUlvRFhTTTRoTzdHUUVDVlJBK3NLdWFKakY5?=
 =?utf-8?B?ZVJCQnlkQ1h2cFdOSmZmaThFVGkvZnpBcTdueDNkL1JWZ3djVVd1YytXSStq?=
 =?utf-8?B?bmhWaE9Td2dXNmplR2JqUjUrR1ZwWUV5cmRWeDc5TlNYTkpDaWZiOXZUeThG?=
 =?utf-8?B?bTY3VHVqREdjZVg0V0FweFlDajJ6TTJCWUFDa2llRGZlOGxiWFhrN0RYMmJn?=
 =?utf-8?B?R1pqRmV3eVZvMkhPK2RQTWZjb0xoNFkvMzB2SWtxY0hrYXFaMmpGcDVWSGNR?=
 =?utf-8?B?ZHlnNkJtUi9wcWtiNHFhc3B3cU5aaUNBdkd3VExrdGhvL2VjR2RVMDNsbVp0?=
 =?utf-8?B?eXFXL24rSzBrY05FaTN4UGEyN0w1ZHR6ZWdRbTdvNzRDcC80MllCTXJtYWhC?=
 =?utf-8?B?dGhTak80a2VQVUVOQjUxRTRna0pGc1RPd05USjFRekdVRkRjYWFXUG9lUUFN?=
 =?utf-8?B?ZU9nWnMvdFoxYVNSdzRZbk1ZVC9CMDdQVVh5c1FsdFV5WkQ1bWR4ZzRvcjFv?=
 =?utf-8?B?ZG8xdFo1UDhrT3p5RUNkK0hNdzU1WUZsaDh1UDN1MCs4K0VTWUwvQWlBcnpJ?=
 =?utf-8?B?c3NubTljTXU5aFp5eWhjaEFuY2xnV283SG4valV3QVBDT1grS2VMQUlIa1Bh?=
 =?utf-8?B?dnpLUFBjNjhBdDV1WVdxLy9Sa1hHTUg3U05QS3UxRlk0MzhnaEl1Yk5zT2tT?=
 =?utf-8?B?MlZkK3VQaTFZd0h3dVFzVTZoQ3ZtRnY4OGFhajZYb3hXRmwrY29ZYWpmWG5S?=
 =?utf-8?B?b2l4WWptZHpkek5KbXpxUmJJVExpeWw0dzFZK25xbnhEakhOZkUrS091ejY3?=
 =?utf-8?B?bnYxYUxuWTQxU0cwa1R0YkhkQXZxR3l3Qk1vSk1sT3llNDRKRFZUa25BT1NE?=
 =?utf-8?B?N1lIb2MrbjBQMk4wWEJLeTQ2SjRyUEY0SW1ibUhtMEtEMERZWWhhb0NPdmRK?=
 =?utf-8?B?R1kzYURsYll0eEtyR09LempOcHlidkFrZG9TUjIwVEphRFR3ck9ITzZtc1NI?=
 =?utf-8?B?SStwQXJjSGtQcm1rdGl0MG5GZFh6Qm1KV0pHWnd0VkdOS2VQQ3hmcmZwNkcy?=
 =?utf-8?B?SS9SYUdtNWR4N0RDUkFOdDA3d2hRS0l3Sm5QTHROTFRBWExyVTZDa0d1dThK?=
 =?utf-8?B?MmVrQWpMU2hXa0g1NVNkSlhVQXJnMWl2aFJuSVZrQ3Nxb1ZuQ2VpQ1pjY0ds?=
 =?utf-8?B?UnlXYVhlU3BKUkE4SHhCMFJmcVVKamt6NVNRYmhVQUF4elNYU0dxcW9wcndI?=
 =?utf-8?B?TjJzdkFMYzJwRUI1Q29NRDZjdkxzT3JkcDBTeTFtZEtRbG15NEl4THN5Tndl?=
 =?utf-8?B?eW1TRzJLaW53UFVHbHM3S1pacWp4RWhmZGk1WXhnamwwTm41VDZ1N3hwRjZS?=
 =?utf-8?B?WHU0M2xQMHBkb3diR2RKQmVuSGhvUzY3UElIdXRabWk5SFAwV3QzcEFiWk9T?=
 =?utf-8?B?SGtuQUpUd3hqMmdnRnVKZ3BOb2FuejVFbXprOThVV3F1TXE5eEs5UmxXVU55?=
 =?utf-8?Q?VmzHNELNmfnL5cGXKWfcpkmEkWGra4Jc?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-CodeTwo-MessageID: 634ab1ac-1cca-4b81-9cf5-e2674ffdd7c6.20251006080412@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72b4a7b3-0993-480e-1e6d-08de04aeedff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXlaSkQ4ZHUzdk50OEdmTmg2eE93eExzWUhUMC9la3VucHlVeDFoanc2Y3Ew?=
 =?utf-8?B?WjRUVElHMEhuVTNPb0RLQlRyR2pzRjhGYnZSeGpIQmZxWUcwelJjeHV4SVVT?=
 =?utf-8?B?S0VRdXlMSUROWE4vdDA4NnpKQ2JmMFlOemUwckF5bjhTbHdmUWVzWVROaEdN?=
 =?utf-8?B?VTFmNG9SUWRYaktUZWh0d0xBblhPckdobWZRZzl0TXl5dlYrWlM1WXRlSllM?=
 =?utf-8?B?Nlp3YW1qd28wdUtoc2ZlOVh5NkJ2ZXYxWXl6NU5CWENKeFBtU0gvRHBtKzR5?=
 =?utf-8?B?RCtraU5mZkIyb1VyOWZOWGFsTWI3VUMzVjhCNStXcW5lUFo5NG5CZG1Makti?=
 =?utf-8?B?czIwd2NwdnV5UEs4cmdBbWhTSm1LYWFFZ2ErRVdOVU00Z2RMazBPZVlYNm0r?=
 =?utf-8?B?alJQTVVMRzlCbDhaai9BK3VIUDdMQkhDSWdIZER2Z1NFd1RDL2ZqOU5sYTcw?=
 =?utf-8?B?eTRtRi9YRWRRZy9yWW1tN0h5dmVHTVNwZEFvVXIwMzlvVjZJTnpjT1hQSS93?=
 =?utf-8?B?Z09BQkczUXA4eDJ4RXE0YXV6eUhBNkhkSk5wd2R6SHRsMkhKNURid2s2Y2l0?=
 =?utf-8?B?RkpwMkJkeGNSeWFQYnhFenM2V2p6cE5MMXFvYy85OGswQnpIWnVXYVlxN285?=
 =?utf-8?B?VjdyWFpYS0p5cUxpdUJKVVJuRVdkRVJFRlQ0b2dudXd4TkhtZ1k5eDNKRzZn?=
 =?utf-8?B?RTA4RmsrSW5wSmNIM0ZYU0ZOckVaLysyUk1HL1RYWStsZGxvRTRQdURDbnE5?=
 =?utf-8?B?NlJIV2pYVytkbURVV0V0bThYQUtWQVBHekhaVXZTRmx5akRyKzJjTGlMVmRv?=
 =?utf-8?B?WkNvRysyalEyYU5Pbm5wK0ErUUVIV2tvMVV6M3U4blRVMFk0a0NUK1lxZi9j?=
 =?utf-8?B?ZDVXcm0xUjF2TVZUT3ovbDNhdUkrTnNONHhPeTRnNzdxVnlPY2lXZTN4YzFE?=
 =?utf-8?B?aGtuS0JsRnFuaVpVd05IN2xVSlhSemFzZlRlQ3g3UkNuR2ZyWDErT0syVCtw?=
 =?utf-8?B?dlpUUzhhak01UFBIVW9FOTR2M1V0VG9ITXJ2emV3WUN2WHNrdmE4ZUZFSW1V?=
 =?utf-8?B?d0ZldWJjbWEwUVpGc3hneVVxWTZ2dDBUaVhjYmtzZVhDRzYxZ1BNeUVJRE9P?=
 =?utf-8?B?T0NWVXREZlE2L0ZmSkFtOU9uNWFXTVJrZlRkQkl5c2d5UnlKUzY3c2VjRTNz?=
 =?utf-8?B?T1hzMFdZZDBjMG9JaE5tYTdRbmYrWWZsalJJT2VUbmIxaThPYlVNME84RXdi?=
 =?utf-8?B?NjVDWmFKYWE1WmEzblBRYWkyN01Oa3prZlJJcW5yRTdxLzhjS1ZyMG5maGM2?=
 =?utf-8?B?c3AvR2JKTkY4SVkvTlpzd1poVXN0REttQ3B0R0I2dFZTeGZ6R1dhdmxaMml2?=
 =?utf-8?B?Mi9WM3lFVHZ2Z3EweEhMS2g0cW1LQUxHSkFiY0U3UFhtcms2N3dYUkdvR2k0?=
 =?utf-8?B?cDljcWxQUVdrVi9Qa2FyQXV3bUM3dlgzS0J1ZUorTHRKdEFmMmJURVR1S2xD?=
 =?utf-8?B?M3VreVdXSmVmMmc0Q3lpQ2dObUNNZEJNalJrOHc1SkowUGV2ZmJKNnNEbXFz?=
 =?utf-8?B?UytjVENCKzdBNWM0VXhKL3ZpYVVvMVVNd1hLUGtjNHlkRDNmaVplVWsvVjFQ?=
 =?utf-8?B?cWI5bndmNm4wdkVrejQ2YlJOWStqUThkSHpDTmI4UVI5U2FXbVpqVjVTUmxX?=
 =?utf-8?B?ZFJvLytkSjVpTjcvS09EOW94TUdocUFQL3N4SGF2RXd2eHNzNU5IT0NLenNB?=
 =?utf-8?B?NUZCcGd4dXJCbll5RGJYWGhJR3ZLMEJZaDR1WWw0azNha0lpM1lKdGNNdlBW?=
 =?utf-8?B?Z1BlMkhBbkF2b2FQTDJWQy85UlhKcHJwNnF3Yy95TFZKaVRBZXlib2gzbk1i?=
 =?utf-8?B?emF2THZCRmZRZDR5RXBCMm1XaU4xUnVqdzQ0QjkzemduK2pndUoycnQ3eW9j?=
 =?utf-8?B?bEFMM3hLV1lEY1F3dEJVV1VlR1BnQVBIeUZmajkrL0RYdEZZVndzSkpNS21u?=
 =?utf-8?B?Uk5EN2NrQ3pDM2Vvc3ZicVZLM25IT2FOQ1VMRE1FNlpLb3VVcjh5Sk9Ua0dF?=
 =?utf-8?B?NHRNOVpoYWRZRGZxZjJOK1hWR0hpN0hkYjZGS1hIaWFlOEV6NmZ3NTRhWjhR?=
 =?utf-8?Q?z4rw=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 08:04:13.2141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee57ca9-e166-4831-4f18-08de04aef024
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429

On 06-10-2025 09:49, bigunclemax@gmail.com wrote:
> From: "Maksim Kiselev" <bigunclemax@gmail.com>
>
> It appears that resetting only the direction register is not sufficient,
> it's also necessary to reset the OLAT register to its default values.
>
> Otherwise, the following situation can occur:
>
> If a pin was configured as OUT=3D1 before driver probe(Ex: IODIR=3D1,IOLA=
T=3D1),
> then after loading the MCP driver, the cache will be populated from
> reg_defaults with IOLAT=3D0 (while the actual value in the chip is 1).
> A subsequent setting OUT=3D0 will fail because
> mcp_update_bits(mcp, MCP_OLAT, ...) calls regmap_update_bits(),
> which will check that the value to be set (0) matches the cached value (0=
)
> and thus skip writing actual value to the MCP chip.

Maybe it's be better to fix the underlying issue: This driver should not be=
=20
using a pre-populated regmap cache. Unless it performs a hard reset, the=20
driver has no way of knowing what the initial values are, it should just re=
ad=20
them from the chip.

>
> To avoid this, the OLAT register must be explicitly reset at probe.
>
> Fixes: 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at probe=
")
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>   drivers/pinctrl/pinctrl-mcp23s08.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 78ff7930649d..23af441aa468 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -622,6 +622,11 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct =
device *dev,
>   	if (ret < 0)
>   		return ret;
>  =20
> +	/* Also reset all out latches to default values */
> +	ret =3D mcp_write(mcp, MCP_OLAT, 0x0);
> +	if (ret < 0)
> +		return ret;
> +
>   	/* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
>   	 * and MCP_IOCON.HAEN =3D 1, so we work with all chips.
>   	 */

Mike.




