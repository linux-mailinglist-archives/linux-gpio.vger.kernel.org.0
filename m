Return-Path: <linux-gpio+bounces-26821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3653BBE014
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 14:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADCE93A625C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 12:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3533B27C869;
	Mon,  6 Oct 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="fuh85RGX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023082.outbound.protection.outlook.com [40.107.162.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BBC6ADD;
	Mon,  6 Oct 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753134; cv=fail; b=ubpR6/AKKKB24CR44IEZcIawvXMkJyZbxKKJ/vCDxJFWowV7EWbTbLkk4lzz7sxYLfncE7OYRH3FIlZoOt3lKAh7mFeVouZAGmu+ImDgiIFaCuwIrh9ATb0GujSAvRVi8iy0wts+pUiVxHXGKU9vYiAmCQu5xigIKmTKGq/j2aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753134; c=relaxed/simple;
	bh=rlKZ/cxVwWyHXLXLE97U7JdaHG4e6vsaCoStIOTRS7Q=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KTNGw6hMqMdQ4oUZrCky1oWWzetaiDAjcqgZIfC4J/r7xXlvrDyAxJWVEGCbWv1QVkcZmkRaRwO0gvsjMcGadE8pi2B6zELAz2Nd+iVJaFyvjYzaoOkKoNC6RQXRj55j6hJ0MxRTNklwW5cEIL0xFbZz+J7/QYjcq4QFFe6p0pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=fuh85RGX; arc=fail smtp.client-ip=40.107.162.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4d9ojWM6h4WqWJWTYo1vQfZTYUek0ezY2Vv4ll3ybCIKfDovxWCAUElvq/PvjHDJew+5EquzPG3/K9N3p8UN9VNoUIx4WAwDLG8OCqwUU3XkLpKXvNWJiuCCy4qqoIXx3Y68I0uzpBMSIq7+BNrwfiCb8dL+ZcRazmBqlk45dbP0eGuEsgPIeOuhVBClNmDALqQdH7lmn7lximVJ/2C7qsrJgXMohl8kmU1C0yK2rd6YoIM7q6WEohDjxOGVTbqRUBYPdu4uYO659nYmHLXMbnvigklu0ZZNX67wK43ui+YKtTrITAspP45eCklq8bMiZKlvgo56zVnraq/onyWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8S8unmoq6hAId7X/cocQ1oKNR2NG/ho+IIDQ2Eo+Jk=;
 b=SnrYUZepTujcrZGMRWxA6UWxXyKyUaKemixaxnTHZZeogAJ56hesrvnNl174cuNCv0Z4cIowMYRERbtYRRhayPYkRAqeiRNytM+Bc9FIXYaNWRvucTHe2bDtTyQAxnPqhpsrZlweMa429yyscoFRxKUNUFOIxvV/HbUb70zh5T4QfcXPMT2sh5K1GLKIXQ1Z/xa+pv6+Ei8WWBq974A/NB5XRant7VPn1Imga2s+ZDIUMNJdSdbch307Zihjf7taSm3YB6AClUaEF3neK1b7pIR+i7MlNLn7H+hbJBd1oPQb9fVmtMLkifGdOxvOACWPsSEQ6ldJsSOsnI+gCVcevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8S8unmoq6hAId7X/cocQ1oKNR2NG/ho+IIDQ2Eo+Jk=;
 b=fuh85RGXAuQYzJgl2x/FdrfK4ecdtfuU22zTCcVMcfRZLURCdydw6UnAjisCtD3LFfjqG4rrq2eCjUc1+4VzWSecQRP2yNbgzyS5t2evZ0DD1rqkIyHa9LEnZx6gWEhjJTt6yLjakM5+0TpXXrtSTHqoqiENicnWdiHcvRFQ20I6bJdAwrDBTxfE0AEoOgz44467d2b+yBqYxlvwpg8o4kge5UIdfyo73iNzpGNZrYEpQPRCKoj9aJlzRtWcryIkWXyVl02kLmRfF05PFjDVdTvKsvqI5ewI+j4rJNNWcFtFkkjkNMUdoQk6bu77VSvePsa1AgmGKjbIML5DNdRJ9g==
Received: from DUZPR01CA0237.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::20) by AM8PR04MB7892.eurprd04.prod.outlook.com
 (2603:10a6:20b:235::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:18:41 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::e5) by DUZPR01CA0237.outlook.office365.com
 (2603:10a6:10:4b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 12:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 12:18:41 +0000
Received: from DB3PR08CU002.outbound.protection.outlook.com (40.93.64.84) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 06 Oct 2025 12:18:40 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:18:35 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:18:35 +0000
Message-ID: <20a23403-2852-4422-993c-0e949144c06f@topic.nl>
Date: Mon, 6 Oct 2025 14:18:34 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v1] pinctrl: mcp23s08: Reset all output latches to default
 at probe
To: Maxim Kiselev <bigunclemax@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251006074934.27180-1-bigunclemax@gmail.com>
 <5af22765-b428-468a-8cc4-cddc561f4a50@topic.nl>
 <CALHCpMj=-N5kToZ7kKbzrpeoMM=Ky+_=J=JnwDmBVRx1OPgxhg@mail.gmail.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <CALHCpMj=-N5kToZ7kKbzrpeoMM=Ky+_=J=JnwDmBVRx1OPgxhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::20) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM8PR04MB7779:EE_|DB8PR04MB6921:EE_|DB5PEPF00014B9D:EE_|AM8PR04MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa3146c-7dad-4ca3-7fe4-08de04d27cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c1dhLzRpRFpFTFdaZXlUSWRQd3ZIWUNmZnlUSGNEcHR5ZEFRdFd0UFRtOUVo?=
 =?utf-8?B?R3o3Mm9rYWZuNXFxR1NPQWx3cjFQd0k4NUpscjVqUmh6VEVxNmxoMERBSDdR?=
 =?utf-8?B?UXlBSlNJWWxVMXp1Nk5lMW1SUU5jS0x4OXhZTW9rWmR6ckVkZlpWelNPQmhz?=
 =?utf-8?B?by9TZ1FoZjlSelY2U0VZZlRNajRCVUw1Yy96Ylp0NkhmUFlzWFFoREVDV1Yr?=
 =?utf-8?B?WHVkY0FNZm1kUm41WUFqanNlUUhaM1Z3Sk1xOTVZQW4wWEF4SzNMVVpUeWhj?=
 =?utf-8?B?b2g2V3VTR09UaXE0SWNndjdUU0dxOGNWdEN0U2VHZFliTnNBdGs3R2c5Tmxk?=
 =?utf-8?B?dDh0elRwOHRmTmJXS1pXVjVDTzlLRkxnZWRpTGpkUnpiMkkrSjRnZlpnUiti?=
 =?utf-8?B?YW9VbHViTWdjcC9FaEc3dmZ6TzdYak1XTnAzRWZUQitsOHZxaGx1WnhnVlRN?=
 =?utf-8?B?cDNud2lrMHBUN05IVDE3S1ZXeXFJT2sxbEh6UFNOWktPTXRSeHRGSy9EQUhx?=
 =?utf-8?B?TUxLOEhzcmNic1BocGJRSWt3SnZVWTBlRGR6SVBCbGNQZlJ1d2RwcGdMQzha?=
 =?utf-8?B?VWtnNXh6dTRxZlVxamwvU1YvejZyc2NmcDVxS1FmOXZJd1lFc0srR3FFcmVq?=
 =?utf-8?B?NVBrRzZGeVdKcDBWYkZmaWFGdU8rM3RFZDZsRWMxOUc2TGRzMmhubzg4UEhT?=
 =?utf-8?B?L2lNdm4xc3A2VDJYVXpVWDBvVksxK1VjZ0EvTEIwYnBqZ1hNVEhiTXdLb0lh?=
 =?utf-8?B?NWdySGFFUFo1RU9RQnFLQ0Q0MVF2QmlFTjBJUG8wSzAwczd0MUhsNTZENzJm?=
 =?utf-8?B?WmhOZ1JzM3lCcS9BTVBuZ1RzcjlHc3l4ajFFY3R6V3Q1bGE1Qm4rZ3ZydFV0?=
 =?utf-8?B?TjkzbXFpZFJYYXRYRVdid2xTM2IrZ3hqdXpNcFJURllhSnJuYXIyanYrM3ZN?=
 =?utf-8?B?RkMrVkg5Ylh2SkkrdU1vNEkwMmZySnpGWlBvd2h5cWxwcDVOd2p5eS9Bd3pI?=
 =?utf-8?B?d0xVdGtocHZxYmhOZ3hPczgrczJRTG5TSklWR2FSeG5LaGNtNHV4VGNjd0Rl?=
 =?utf-8?B?eU1rVkFXUkcyM09WL1l5Ynlrd2EyN09vYmZvT2JKOHB3anpFaHFVaXpQaWd6?=
 =?utf-8?B?TTJHSkNUWXl2UUtFYjc3eGRNR1JqUVp2b3VSNldrd3dOVytHakcrNG9rNjd0?=
 =?utf-8?B?cjNvT2duQ0d3Ukt3WllHbkxVRWU3WmVQcmRCSE5EYVNyd3pkNW9VTCtwbWtN?=
 =?utf-8?B?Q05ZRnI5RC85ZkZaSWJ2M2RLU0pwMVlIWHRXdU82K1kxdHdlT0xMVG01VGhR?=
 =?utf-8?B?WXlNSnplZ1VZd2tTbHBTNERCbnVYMzRZa1NlNVVWUWM0MDRUSnpCWXU5MTV2?=
 =?utf-8?B?QSt3Y3RvUDlKcy9uUG9xMEwwSkpJL3cvTnV0bVF4RkU5NnRiN0Zya05GV1JF?=
 =?utf-8?B?MzZZODQvYjZrejRaTmp1eXViS2RqZWQ1aFJ2VEtEeUhETnAvd0JBMmFTQkh1?=
 =?utf-8?B?cmRPSXRsYnkrOGJjK0pOQkFKdWVJU3M1U3lXQTRZSm1tcUZ6UEZreVlmYVNm?=
 =?utf-8?B?MVovSmNZbU0vckQ5Y0kxT2F5SlFhbHdzOTl6MUp4c2tFY3UrUDFwMnRsRktP?=
 =?utf-8?B?THhiT1JieGZnZmtvYW1yQ3E0cXlSNG9TSzRIQnU2M3pzRzRnQTRRTjlKTm1z?=
 =?utf-8?B?cHh1QXFBK01ITEZNTlNkTUtsVUxoSWt5ampqa29kMWRPOFZNUEZWMVZxWGti?=
 =?utf-8?B?MTMwNTRuV1VubUw4dkhob0gvNlhxaElCR3hMSEZXVXgwckEzNk9CMUtzd2Jn?=
 =?utf-8?B?UXhzcHYvWEkxcUt4VW9rb0xlTkVMbXE4UzFleFFLVHY2YVVqdFJTcHdGanAw?=
 =?utf-8?B?QUJhTkh5Ui8rVG8wRkVzVDl5RFJtU0Jvakd2SkxhaUN0bHpoVmVTVVNWTXli?=
 =?utf-8?Q?OlYFrxtg4U6LDeXe5XlbDfJRLH5yMBZP?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921
X-CodeTwo-MessageID: 36330ef6-201b-4570-ba84-13cb3456d83e.20251006121840@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64ae2fe2-c6d0-4033-3f42-08de04d278f3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|14060799003|1800799024|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnpUQkFJWlg1R1dJZVhhdzNTWjRtWEY5ZTRDV2xZdXpvYW12SVprbDZRN0I0?=
 =?utf-8?B?Ym03VGZENTBoR0VFYWxBVm0yUzBxYlpld1FWRWJWYjB6NHZ5aDN5b3N4R205?=
 =?utf-8?B?NjA1UVhwZVRWc0daREtzRDF4SVlFQld2SDhtYnFnYU04NmFTUlpkZXl3aHA5?=
 =?utf-8?B?d0tLcEZjQS9nRnA2bnpzYndNUXRMZCtwaXl3ajJHUnM4ekFqZ3VBcC81S3d2?=
 =?utf-8?B?TjRwVHA5QjlaWHFXSnJ3dlFxVzdwaktlS1lvazdqSXNjaXp2bVJBQ2Z6a1FQ?=
 =?utf-8?B?eGNFSUFMbnc4Y1M4Vm54cFJ4dDlTMWVGdWM4ejVrNDNLbVpRM1dtSWJuTjdj?=
 =?utf-8?B?STBtbmdwUkM2R1NPTlR4OTFGRCtDWFgzaGxoenowaDN3RmZ2R3BuMnJ2RDZJ?=
 =?utf-8?B?bU9NbUlVV2ZndzFjZ3BkREVBeWZqcDl4WmVwZEYyRENyVU44S1VrbXhjOFdx?=
 =?utf-8?B?dUJWOFZldjVFRXQ0OGw4eW5XOGcwYjdSdTJKQVZad1FIcTNKUFhYNjgybW5i?=
 =?utf-8?B?RVF4RWMvU0hXRUsxOEt3M2dBWnhCYUJFZGlnZXA0T0lLSUIwSFpmYjlsWjVu?=
 =?utf-8?B?UnJ3cWpHRE8wbWIxUTAzSkZSa3FQblU4VnBCTHd3R3paRFp1QU5wcTdqak1Z?=
 =?utf-8?B?SkdBVEVicERVVUpINGpxa2Q1UTBLajRKQ2MvWE1VVHY4dzk4QkEydUtoWGhJ?=
 =?utf-8?B?MjFocEcxd3BjWjFNRWhxZUo1Z3lGZGlaTzN3bjF6NzNJVVFCeTFlODJZRXR0?=
 =?utf-8?B?YXUrbGNnTktaRGZWWGE0VEJvY3hVNmRiRE1hYTVORHdCOWttNW95MWNZeXRZ?=
 =?utf-8?B?UVYram5HQm9QVjZlZDlvaHU1L3M4dGRFZE4raTNHRThFaHhrZVlpdnEzbW5W?=
 =?utf-8?B?aGZnTlNzNFI5TFY4TDRQU2FpZ1UyS3pQUXpNNlROQ0h6WlpidzB2bGxjRDMv?=
 =?utf-8?B?eTNCai91RTRCLzZURUlLTTBGbWxndVNRU1hWcVBjb21JVmNTNGpPZWsxalFT?=
 =?utf-8?B?YUl5eEMrNDJadHhBVHhmb0ZhTm1pVVJEeFBuYjBmQ3VUVTlTT2lLYXh4NHM1?=
 =?utf-8?B?RDY0ZTN6eU9NWDNJcGowWThCQ3JkTGs4enB5bTBhWmZiZFlIQzlEVUJZa0Fq?=
 =?utf-8?B?UVFyV2txQm5sQW95Y2hkMiszcDIxNlIrVEJmZDRLZnYxaDBjbThqWkNmbUZQ?=
 =?utf-8?B?U1g3U3l1SVZ5TnhUd0ljZHVUaFVrQ1dqNkhSLzE1ZHc0Q21SaS9qWXlGUHNX?=
 =?utf-8?B?VTVXdFJpQmFNQU1pSTF2ekxUYW9YblhLT2lwL2x2b1dMNnNBaU1iZi96Qzkv?=
 =?utf-8?B?QlQwaWhPcTN0L3FBcG84dmx1Z0h6SW5MK1NQRTBpQXhaTUhlREppOTNaaXA2?=
 =?utf-8?B?UWFoTlI4U2VTUUowb0UrUlBMb3BwVFVLN21zRlNYaEpLQkxFQWtDMzRpVHhE?=
 =?utf-8?B?MnN4VmpnSFd1dHFiL2pGVkFVSnU4WFpZZm5mU2oweXdhaDFBMjM5d0lwREE3?=
 =?utf-8?B?MHc2dGxWNUwzVEZEV1FTcXZBUnJLNlZOa3FpQXhFYzhrcDlNM3FLSGo4blJk?=
 =?utf-8?B?VHh0VFI2NDY0cVdYSUpxa2xRNEx5VVpxUjE5ZTNWc1JXamhsaXowM1U0Ri9z?=
 =?utf-8?B?bEx4akRNRnpPZys5OVBXSVZ5YUdwNFA2blVyUC9FS0c0WXk5VXFlMFBwVkR5?=
 =?utf-8?B?ek9abnlNTi83cDBKdlRJT1RuR1dDZ0ZkZTRqeXZSNmdPbjRoKzh6S2NoREkx?=
 =?utf-8?B?L3Q4NzJLZHF0cUdkajdGT1Y4SnpGc05hTUViVUh4NU54M0p1S3JmZUZ6dDBn?=
 =?utf-8?B?YmdyU1dleDhaTExrZnhubmF0Mzk3Qml6VU5EdXJCSEhkMG5CTFRuRGZjUkdu?=
 =?utf-8?B?c0JWeWFyRXlLN1A4YWFjalR4SkVZY1EyWFM3dlZVUzd3RENUZm0rK1cxVllV?=
 =?utf-8?B?eFFnYXNaclRuV0djR0x1cXd5T3h6KzJvTUt3YUFhM3REMThLellqempsZVVN?=
 =?utf-8?B?eWlaUUlUV0Z2eWhmaUEvbVBxM293em5iZXhPbHFmZDhxdjF6MlBydnRqMU9w?=
 =?utf-8?B?ZUtVcGZuNkY3d21rWWNIeHcrRXE2bDM2ZTZpRWRwM0JhSlBGQ05rTU5hcjBP?=
 =?utf-8?Q?65Js=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(1800799024)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:18:41.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa3146c-7dad-4ca3-7fe4-08de04d27cd3
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7892

On 06-10-2025 12:18, Maxim Kiselev wrote:
> Hi
>
> =D0=BF=D0=BD, 6 =D0=BE=D0=BA=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 11:04, Mi=
ke Looijmans <mike.looijmans@topic.nl>:
>> On 06-10-2025 09:49, bigunclemax@gmail.com wrote:
>>> From: "Maksim Kiselev" <bigunclemax@gmail.com>
>>>
>>> It appears that resetting only the direction register is not sufficient=
,
>>> it's also necessary to reset the OLAT register to its default values.
>>>
>>> Otherwise, the following situation can occur:
>>>
>>> If a pin was configured as OUT=3D1 before driver probe(Ex: IODIR=3D1,IO=
LAT=3D1),
>>> then after loading the MCP driver, the cache will be populated from
>>> reg_defaults with IOLAT=3D0 (while the actual value in the chip is 1).
>>> A subsequent setting OUT=3D0 will fail because
>>> mcp_update_bits(mcp, MCP_OLAT, ...) calls regmap_update_bits(),
>>> which will check that the value to be set (0) matches the cached value =
(0)
>>> and thus skip writing actual value to the MCP chip.
>> Maybe it's be better to fix the underlying issue: This driver should not=
 be
>> using a pre-populated regmap cache. Unless it performs a hard reset, the
>> driver has no way of knowing what the initial values are, it should just=
 read
>> them from the chip.
>>
> I agree with you here, thought about it, but consider such a change
> too radical :)

Yeah, I had the same thought when I created the patch that resets the=20
direction register :)


> Okay, I'll remove the reg_defaults in the second version.

I think it's the proper solution. You should remove the direction register=
=20
reset as well (basically revert my patch).

M.

>
>>> To avoid this, the OLAT register must be explicitly reset at probe.
>>>
>>> Fixes: 3ede3f8b4b4b ("pinctrl: mcp23s08: Reset all pins to input at pro=
be")
>>> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
>>> ---
>>>    drivers/pinctrl/pinctrl-mcp23s08.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinct=
rl-mcp23s08.c
>>> index 78ff7930649d..23af441aa468 100644
>>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>>> @@ -622,6 +622,11 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struc=
t device *dev,
>>>        if (ret < 0)
>>>                return ret;
>>>
>>> +     /* Also reset all out latches to default values */
>>> +     ret =3D mcp_write(mcp, MCP_OLAT, 0x0);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>>        /* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
>>>         * and MCP_IOCON.HAEN =3D 1, so we work with all chips.
>>>         */
>> Mike.
>>
>>
>>




