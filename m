Return-Path: <linux-gpio+bounces-27474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD27BFCA6D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 16:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9586C357EBD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 14:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBE534C80A;
	Wed, 22 Oct 2025 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="JywgY/eY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021075.outbound.protection.outlook.com [40.107.130.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5234C15D;
	Wed, 22 Oct 2025 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144364; cv=fail; b=G24xKT6rvo/XqDFgKWYJxyfK8tWErmonFruhKEEwg8N/f35H/jJjuhUtZqTzJ9JnuVklxlQajlrAN6K3Rb9XDmWdYlAxEziOJleSi8XNrdkGZQ3zrChwT8joQXAxsoMbTBsH2s28cqgc4Glgb7YQSDuOgumfCR+5FfpOD6KCSng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144364; c=relaxed/simple;
	bh=LmEui1lJOwATs6/4iLcznpyfLlDvNwrvqcNSK09MsG8=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pQP44GO60Wzp4YP7/V+nN99CX2/Uo8RUWSRmdvDgWhzXBZUemnWZHr78x052tenvxRYaJUPmcA56Wrsj9BJE3Lpl8XEJkECPx47TVCxyNAe1YpGnHHmLq9Ocg7LgGm70AJ2sE7yqAfv5GKCs5Tc0wVzGIUmBUzec9ADh/etiwsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=JywgY/eY; arc=fail smtp.client-ip=40.107.130.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbXHTs7Ee1dmj6mdSEU1AMv4FtzaQuVf0kmiT8Xx4jWYz//8HxEUJJaTw1Bf4xF640syEVy8UPLUhX16hvtYDVNyYzntL571gxUOsLuGpuUAx04WY7hQo5l3n1br8E8quxd7Tl+CKlzQFpYEuupS87R/PD0qRW2dxoNKzUhbinttVz0gOR89DTPY8RSBfyEbC33nsHdE8WOE2l1tPmBVzaGISAtooJrzsI5VCwPoZckq3iRdIyQRfcAoqoDWoe2RQU/YZ3C4P+JUhGzkAbIg1YYIxAJCF/tdQyEf1FchdYKQiL/NyWUocnDMZqSMFz+me2sx+CGWksxApH78kaOqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ezqCP/m+8ImyjJ+LdNT7QMRHMCKL9Oid0+fuedDhqI=;
 b=nWhC7eF+DEoFcAuPkTeW4IpRE0sVF5VfBccJzOvTCrgApBLMTCwisrmUnRI5Gr5U4gvd6cxqhcUdJp+7W27HLq/umABJUaTJUqr/GSuwCw794BylDWUqLep6q1lahUGofJOsuIyWIISqDNEsUstnoz4Dt03xk8pPD6/R+AtufPIGrYPSy+hKIJ4woaRKL6Rb23KKHc2eA7JISxMXvfh812Twrw1cAR8oxJHj5WStJZCHm4Rl0ysRl7mBZZYnSKsh9XWW51li0PbRKDzgAREIS8cFHwsRJx9MdvIXBoI6PD0nWQsN6pKSy5Tr4Os9i9q2OrDFfc6L9PVPtSp40rJXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=svanheule.net smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ezqCP/m+8ImyjJ+LdNT7QMRHMCKL9Oid0+fuedDhqI=;
 b=JywgY/eYZ9XpudrP3WC1nesurwio6cTuNhVJKfwXalH9UrEnXBtyu+GNQLimJbEhgJG3qRmKkCMo6mneX0aZM0LJb5tRMJnUucMtQ+vugIZx1sm3RDviFeb2gDwN6dNwrFEneRgF/JIAJk4zXbroIKreQ3o9K0Bno8fLOCSii80l742q4wU3VVqyjun/EECn9Eppz6cqDMVwqPO8cl10VfadX1ICPCbmT3WJRfCLA9pU7urtN3hWwmnrzMDVF+Eht44DguXiGgSpAQInYBKcQ8bC/RhnmTMIzweK6zC2+Ek3YE8iIb6YMvYpM2bnX4mQckcz62cr429NMJo4Y5knZw==
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:45:56 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::6d) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.15 via Frontend Transport; Wed,
 22 Oct 2025 14:45:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 14:45:55 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.67) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 22 Oct 2025 14:45:54 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:45:50 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:45:50 +0000
Message-ID: <e461ca08-ad28-44fe-85f1-afe332c1d43d@topic.nl>
Date: Wed, 22 Oct 2025 16:45:48 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: delete regmap reg_defaults to avoid
 cache sync issues
To: Sander Vanheule <sander@svanheule.net>, bigunclemax@gmail.com
CC: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20251009132651.649099-2-bigunclemax@gmail.com>
 <c046ace3d4569405e167db9cc6ede90048dc0450.camel@svanheule.net>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <c046ace3d4569405e167db9cc6ede90048dc0450.camel@svanheule.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::25) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR04MB7779:EE_|AM8PR04MB7972:EE_|DB5PEPF00014B8A:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: c93bfa70-1127-4002-1641-08de1179b4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z0hhWHJmZ2NNamdZRWM5WjdteUgxMXpyVEYrb01LUEtzQWNBYmNmNjBQRExT?=
 =?utf-8?B?OFlnTlo4aXFGcXhDdnhNZW04dHoyWkFsVzlvREQ4MnByZmwxM1BScGlncDZS?=
 =?utf-8?B?ZENjNnk2VHVZaEN3UjJxbDlObkg0OEIwUndJa0syVHdWWE8xanIrRFN3SFFw?=
 =?utf-8?B?bkcxNk00WSs4L1VWQUpQZEJ3SlBIMjRRa1M5VGxLMlFadXU5S05sV2lVY2ZG?=
 =?utf-8?B?MVRiVVdZWldZa2cxZkJkcG9rSVRpemVKeU9FMldZdFd1eFlxVTJxM1kwNEZt?=
 =?utf-8?B?TjFSbkFCeGwxY0NBRDE3QWhjZHl3ZDk3UnVFWmFkVVZMWHlrY001Sm1BUTBW?=
 =?utf-8?B?Z2RWKys3ZE5zaXN6ak5EdGYyNU15cHBDUnR5MHgwTHdVV1l2aDkzUjc0NFBi?=
 =?utf-8?B?SGQ0MG9rbVNhU2pzTm0vYUVUT1NLQXdLbVJIaWYzZWNSVng2RjhJcGpoMzFm?=
 =?utf-8?B?aWNyamE1SDRZaG5oWU43UGpnWVNndUk2TG9UdURrTlRzU0NZSmltNzc3YzY4?=
 =?utf-8?B?aHhzalBRbVhNMVVhUUZNelBxYzkySmhHeXpnMVFpaEhHdXg1ZDRURW12dmhl?=
 =?utf-8?B?Qm9wUXhZRU1FMnp3L0ZJekQvVUdUY1RrU0h1dkJyanZnV01MMHQ1SGNuaDha?=
 =?utf-8?B?bWJVa2RueFk5bmFCM095M2JtUEdrUmZjd0ZtSTYwUG0zWnoyUGxJZ2VLMU9F?=
 =?utf-8?B?T29jdndUS2dsK0NQcCsyUklSa21kMnNlSWFzVmJndjdlQXV6eDNCWFpvRS9E?=
 =?utf-8?B?NUJ5TTlzOVNZek92MFFhNVp2MHBKV3V6SDJkMkM1SHdzUytLc003RFZHNWhN?=
 =?utf-8?B?ODFDNkVLMnhnWHlJeHIvQ2xjODI2SXc3QXYzZEdLNzdVZXNWRmZvektBV2ZT?=
 =?utf-8?B?c3ViWjF0WFZxYmk3aGxqYklRZ0xaZGdnYVdwbDAwQ0Nrajk5UGc3Z3d3MFZu?=
 =?utf-8?B?ZFB0b2I0QVVuS0s2V1E0YmZBMEdqZUhiQWpTeG5DV1g1Y2RtVzBKTGZteDhh?=
 =?utf-8?B?alJHdisyRzBjV2VrTEdRYS9sU011M1J1SmVzcGNveHNySkJXSkFBcHhwZUY1?=
 =?utf-8?B?V2l6U2w1WmZYWkJRell3eGdzNGpRNHA5M1BIdURKTm9WdVM1aGZubmtDdlFF?=
 =?utf-8?B?SkJ5K2xybm5DYTJzNlN2a0FvNnNiTElKL3Q2WDBjS0ZMMWRxeHlsTEpQOWhX?=
 =?utf-8?B?UTZNVi9jOXVTdk81QmRneVBac0NJQkM4N2o1Rms5RHVlRE1PTDV3L1AydmRh?=
 =?utf-8?B?KzVJNVhnT1VwOU85ZkdEWUxabEZEWjFGUSt5UW4yeDA2U0Foc0YzY0t6d2pr?=
 =?utf-8?B?UktpKzBIRjQwOW5zcEhlSEc4QWp3V3VKcEZVcmphVUc2Zk4xTzdVeWdhTUVI?=
 =?utf-8?B?dzE4aWpKSFV5Yzl2Uit5YU5xL2hSL3VvdjZXK2M4US9udWlVNERwblRYUFdy?=
 =?utf-8?B?Y0FZR2xWay8vMW9idlI3djMwS0U0TE5JWStSWDVRUFFPV2JNUTFXNXAvVTFz?=
 =?utf-8?B?bWxGYUxPeWgyZzZSRDJqRmlKdG9neUNYa1ljTXpwWkw1OXJtbHVKbVdWOE5h?=
 =?utf-8?B?U1pMakVBOExjS1V2SVRwUGFVMkNuNkEvR21XeDZ1S1RjdW12YUlnYjFFekNH?=
 =?utf-8?B?MUw2aDBrK09rOHp3ekMwRlQwdzFQVUdYeDJkYVdaRlpnZEcxM0w1WWpDV1N0?=
 =?utf-8?B?cnQ5L1ZWL2tWS2hTcWhncDJXTmk1Q1lqT3RYSUJ3aE1JNWRvY1YxNEoxbi9U?=
 =?utf-8?B?b3RYSElndFEwK0wzTmJsRU5ESXJBeUhUNTRQbWMvQWRHS2tHVFJOdnFnTWJ3?=
 =?utf-8?B?VklDM2tSRVNpdnFWcUlVVUF4bDY0Z0hYTFhPOThnWmxxWnp6c2ZlS1pkV01l?=
 =?utf-8?B?ckRXU2FNN3Rsa0lmLzkyQ2g0Q2pES0ZGWktnWW90dkw2b0VDcjlXMnFQVUIr?=
 =?utf-8?B?dE1mMVh4dCt6YXpOTnR2b3dFSDZFYVIzNndaSC8zNFM2b3h4LzNFS3FqNGZZ?=
 =?utf-8?B?WVNoNEV1T2NGVFM1bXp0TEhXMXJBYVAyL1MzSGFjQ1FkWjB0TlNjdjNVa2Jq?=
 =?utf-8?Q?hqfnzk?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972
X-CodeTwo-MessageID: 1ad1f9dc-d2b2-47c1-8dd6-9f3bce8ad932.20251022144554@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39d4dcc6-6387-4f10-1771-08de1179b1ae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWp6M2hja0piMjFsenRjWlBwR1BzdkRxZUFRYythM1cvRTkvNFVZZGx0enJM?=
 =?utf-8?B?SHdFdzFFYWpQYVdLa21UcDVTczlMMkg3VnQwRmJWb2NrQWpzNkJ3OHpLTjVa?=
 =?utf-8?B?QWNSNXN4S0hYZEEvamdTbHBEb3ZvQ2lGVmhvZkt2RWw4K1JnNGNTbG8zdHpI?=
 =?utf-8?B?cWhZZUlTR21SQVZEeFM0dkJHQkFzb0E2L0lySEVmdmlSVUR4US9DVCtrK1Fi?=
 =?utf-8?B?RzZ0WVA1SzR4UW4za3NqNWxYdUIzQmh6ZEhoL1BjdDR0ZDhzMFNSWlhRcHI1?=
 =?utf-8?B?dHJwY09sRUxyUi9GMTQvNjg4VnI0SzJCa1hJY3BiMFU2Y3hJUjRDS1IycDhi?=
 =?utf-8?B?OUJEMWtHd291YXlLM2xCR202ZlRqemNCNS9FQ3NWUUNPaDROODRKY3V3STh4?=
 =?utf-8?B?WE5WcDRxVkN5cTVvaEZZbWNPK3lRNEQwR3Z1cnBtYitMQUdPZ3ZKa2VjQUVS?=
 =?utf-8?B?Qk51RDZkZGhPN1dsU3V4ZGN6cWZIdk0yNk01UVlXNm45V3JjTTNZV2JHa2M5?=
 =?utf-8?B?eTJ2UVI2NnRJV281LzNHTXZjQm9EVUVCRVpyblBzZVFPckUyVW03M0VqTDBx?=
 =?utf-8?B?SVJ6cXhHVVFFTmRPNGlhQysvYWVsdk5jNmNNM2FBVEw1RTBLbnRNckp0a2kz?=
 =?utf-8?B?T2JualZkYk9pTjZLVTJ2Tzk1Z2xHUmJJNkNkSHU3WHlRZnFHdXBRT3NoOE9D?=
 =?utf-8?B?NTFORkZVOHQ2ZnA2MTJieWJyQ0ZnYlVxQ0NYeElISC9zMzVoVGZsRHdWMnBQ?=
 =?utf-8?B?WVBGcDNsREg1RXBSL09wUXZJV3Y2ZXd2TU1qSXgvbG9ac2JkdXFSV1FxYXNu?=
 =?utf-8?B?Rm5rci9ZNmhlYUFSdTdEeWUwQ3JiK3l3S1FYcWZxK2xLZnlCdENSaVFpNWlY?=
 =?utf-8?B?eXpPV3lTalRaend4Um5nR2kzbzVITHIxVWF0dVZRMGVhNTU0NDJQckxzN2hS?=
 =?utf-8?B?MjJ2UkVBaTZJSXR1M0FzdUpONXZxbDYwV2RRS1VJY3FRTWJuQ21zTnF0WUQz?=
 =?utf-8?B?NG8wZ1B1cGM4cGErVk90M1V2aWd1d2NVcWUzWTFKY0pkaVpPdDl3cXMzNDl1?=
 =?utf-8?B?MXlYVzc1c1NhOVBzUWQxcVNUcEV2MlZPeGhQbDZqM3R0S2xzM095a3Z0ZURQ?=
 =?utf-8?B?TGFYSVZteDRrL0pMclZWN1ZpZ3YvWHZFL0hSNE9wbXlTNzlBclp4YmdQbkVp?=
 =?utf-8?B?dWIrczg3bGRyNW1oMk1LLzRMdG9qZm5xSjZvUG03c1RlT3k4NHJ5dUswSGtT?=
 =?utf-8?B?T3FBRFFRRENoTWZ6ZEduS1ArU0h0S2RnK0tKMHM1QUs5STR1S1QwZkdoS0VI?=
 =?utf-8?B?bXlENEkwaXBSY0VXVTVnWDBlR2FPRmNQeGRvMndJSGoyZ0pKbFVndVBRRitD?=
 =?utf-8?B?WnBOUDgrb1d5ZXZsOENFekFob1NDeWNwRHgyc3RRWWhzZGg3ZGh6Z00xU01X?=
 =?utf-8?B?bitNN1BUbUxDd0wrbUF5cXZsM253NVUwWC9RbVpSazhvR0Z4dTkxQ2s0ZHo4?=
 =?utf-8?B?a1NXeWRwZ013MEo1YW5OcFc5VEp5ZFhYMEdOTHBMaXovVTFBR21tUHc0elZx?=
 =?utf-8?B?VFgyQTREQWoxcHBIOXNvSC9wcUZLWFFnNUZqYUE4SHFCSytaL0RFb3IyQmd2?=
 =?utf-8?B?cDQzWkpEeGpKcG82TEx2cmJHZVN0RGFmRVpnTkRrcWJMRS9XeWRzQ0FJK3NM?=
 =?utf-8?B?NDdMS05EaEhkZmt5cXRCRm9uSk8vYlZ3V1NVeXoxaTBJR3U4NVhDZFNzVzNM?=
 =?utf-8?B?TFJrQlQxSmNaK05OT3IyZ09ISzNSckpscWRHK0RxSDdjUUUzMi93VWxkR04w?=
 =?utf-8?B?TWpFaVY3M052Y3FIVFJSVVFUb3R6OVBieTVDdHlzU3pFblYrdUNFYnovRys5?=
 =?utf-8?B?QXQzTFI2MXlpa3UvMFIwRXZXQkxpWTJiK3FQTlU0RGRDN0xmbWRQbEFXdG80?=
 =?utf-8?B?K01JSFFoVjcrakNFRXN6QitNdmJSSlZKTnV5UFo0S05ISWVVcXVOSHFtTnhR?=
 =?utf-8?B?MGhPa09PNVZXT011Y1c0Q25uTTd3elBXUTFFMHYwWlh1R013UWRTTHVETWlh?=
 =?utf-8?B?MFJ4dDJSZHJYMHdlWENTZWdiNUUxRk5tRVJmV2lrWEdlaDVQNldvYVFhb21y?=
 =?utf-8?Q?YZyA=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 14:45:55.0904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c93bfa70-1127-4002-1641-08de1179b4dc
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

On 10/20/25 21:40, Sander Vanheule wrote:
> Hi,
>
> On Thu, 2025-10-09 at 16:26 +0300, bigunclemax@gmail.com wrote:
>> From: Maksim Kiselev <bigunclemax@gmail.com>
>>
>> The probe function does not guarantee that chip registers are in their
>> default state. Thus using reg_defaults for regmap is incorrect.
>>
>> ---
>>
>> @@ -82,25 +71,12 @@ const struct regmap_config mcp23x08_regmap =3D {
>>  =C2=A0 .reg_stride =3D 1,
>>  =C2=A0 .volatile_table =3D &mcp23x08_volatile_table,
>>  =C2=A0 .precious_table =3D &mcp23x08_precious_table,
>> - .reg_defaults =3D mcp23x08_defaults,
>> - .num_reg_defaults =3D ARRAY_SIZE(mcp23x08_defaults),
>>  =C2=A0 .cache_type =3D REGCACHE_FLAT,
>>  =C2=A0 .max_register =3D MCP_OLAT,
>>  =C2=A0 .disable_locking =3D true, /* mcp->lock protects the regmap */
> As Andy mentioned, the problem you will now have to deal with is that you=
r cache
> is not initialized at all. Unlike the other cache types, REGCACHE_FLAT wi=
ll
> zero-initialize its cache, perhaps making your cache sync issues worse.

Ouch...

I have access to hardware this week (boards with 2 and 3 of the I2C=20
chips), I'll be able to do some hands-on testing, and report back.

> You have two options to initialize the cache properly:
>   * Provide .num_reg_defaults_raw (=3D MCP_OLAT + 1). This will give you =
a warning
>     on probe about the cache defaults being initialized from hardware.
>   * Switch to another cache type (REGCACHE_MAPLE), which is aware of (in)=
valid
>     cache entries. regmap will then init the cache on the first access to=
 a
>     register.

Using REGCACHE_MAPLE sounds like the obvious solution to me. That's what mo=
st other drivers use.


> You could also combine the two, like the Cypress driver Andy referred to
> (pinctrl-cy8c95x0.c). In that case you get cache loading at init, instead=
 of at
> first use, but without the risk of missing something.


--=20
Mike Looijmans



