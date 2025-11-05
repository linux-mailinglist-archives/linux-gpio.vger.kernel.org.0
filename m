Return-Path: <linux-gpio+bounces-28056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C9C33B3E
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 02:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 125B8189E416
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 01:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD1519F43A;
	Wed,  5 Nov 2025 01:50:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022091.outbound.protection.outlook.com [52.101.126.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300E2C187;
	Wed,  5 Nov 2025 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762307429; cv=fail; b=oMmldY79FHUwWuUFZnQQYV5Ue2J16vWBzc0rYFcDi8HwCVtJj03ZTkyP0qEQfphLjpy/ZdXvawwW7MwhOUt2vvhGfLLavUmxYSBxQLxDEZYdU6GXFrGHOlxJL2Z08PwCrEr0I1P2h5AViRg/3oknyuhjLW108uzYSZ65YOL0PFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762307429; c=relaxed/simple;
	bh=88M1DHWtO4dVpk4trsOAR+SfiTGVB67iORiFvB/RtxI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A+aGyc88YaBzzEc1WesC6kWwuiR3zb161YMLG7DlFXx+qS2MRfxtaywhlAC3WRvNtlSsX3ArQYXVbgC+SnTJWG/a+3QA44z2SQPSvOxcUTG9mKEJ6Y46tRWYNmFr2/Xl4GOfXZLBcr+kbqjRaAzDzvyr1EHomxa4rnulv8WWSp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoYGyQf7R1mRRk++dozbamt24caeq6kiU/fPhcI18Qfh4Z8wgK0co763q0nIG1JJzUtjdNSLWvp7PjOsblyvcBtdQlLK8bY+mlHpCsMZCHRI5fpx8g+BAHrS15CwViO4xrFEnvyCgLDPu0Fh2u+jJEbvarF0Uaw7tnzi9ZywNKQjuBvG+JR/OnBpGrRh6iPWUheL0lmhJDAXxms0yAY6L9gjMIBJHBtJP+xkqz4leM1tFDqHQwBWw5n+dU0cwXQlGKFvqbORfiNABn/SO3bvey1i0smacy+6vpQO4aV4xVp+wFJv4bZRItLVfy0R2r7TRKy5EzekAgWrxTe+bS/jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88M1DHWtO4dVpk4trsOAR+SfiTGVB67iORiFvB/RtxI=;
 b=KmNuUKZ//2ucoGUbwbsyT2wMxU+vOfwtZy1b0vhBD9Pne8NIUbvcDICIb0pEJmQjLgAoqe9oOT+NSwV+lbCtu1/YqYTfPWqKgVcJRLy1sVXx3irYhp/axttpRHm9UbJXGTv/jNd8G8++QqnJKpx0+urSsXGl9LHvkD87NaiAj4f2QtFleOERjzONYFmosKFK6vDhMySsigOgiyroNokAnBIrWW8TwEa3d9aw3ElE59gsup0ZQaFZqmRL+vXRcsGR5bnQHT4xjUE3zZVULsIgiFqp8sRNUTLYHs+JFsVCuvjUOr7lqiBo9jCOXkAOPYd2KQ2Xb6/UYvLn0DfzjWlipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KL1PR06MB6090.apcprd06.prod.outlook.com (2603:1096:820:cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 01:50:22 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 01:50:21 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "sfr@canb.auug.org.au"
	<sfr@canb.auug.org.au>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIFBpbmN0cmw6IGNvcmU6IGV4cG9ydCBwaW5jdHJs?=
 =?utf-8?B?X3Byb3ZpZGVfZHVtbWllcygpIHRvIGZpeCBidWlsZCBlcnJvcg==?=
Thread-Topic: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix
 build error
Thread-Index: AQHcR9IHaZ867jmm0U6XcNpmbKn/iLTXUJmAgAEdr/CACfNsAIAA+J5Q
Date: Wed, 5 Nov 2025 01:50:21 +0000
Message-ID:
 <PUZPR06MB5887AE703E3F4E2A9B1F401FEFC5A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251028061345.3885632-1-gary.yang@cixtech.com>
 <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com>
 <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdZtQkbGnQtb3DZf1XOVpbZgnBbqZD3kxEuCCAS4Pm3AGA@mail.gmail.com>
In-Reply-To:
 <CACRpkdZtQkbGnQtb3DZf1XOVpbZgnBbqZD3kxEuCCAS4Pm3AGA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KL1PR06MB6090:EE_
x-ms-office365-filtering-correlation-id: e0938136-bc51-40b9-c19e-08de1c0dae46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1doSnN6WDZWVnVrWGg0Z1JSY2crOUV6SnVDYkVDUEI0UVZncStvRzhXSGFa?=
 =?utf-8?B?ZzFDYXVmQUozL2w0T1Zta1FWYVV1ZUg1RkFiU0tIVnNMaHpkMWRNV1BlM2lV?=
 =?utf-8?B?eWZ0L0RyN2xSdUhORHhwR1N3a3NjNzBYV0NzSjMwQy80dUdqUVdtWisrSVlG?=
 =?utf-8?B?RUE2T0ZSV2t5ZE50TW92dWM3TXJ1VVFSa204TzJuWkxiZ2dXajFSSVExRksv?=
 =?utf-8?B?eHZqMC84akVGK2ZRUVlHeGVnUTBwUWVuOUlNaXk3eVpBekZXY0cyQmdCcVdE?=
 =?utf-8?B?Qkt0VnpkYkJLVjZGZ0RwSnM3bTcyWThjc0gxQkcxdGpieEhZa1FzUUo5Qi9B?=
 =?utf-8?B?ejg0ZjNqM0ZSaFAzcUJPbTdNRGh6SWJDajFuUEc5QXZwQjZoejc5bnpHTkI5?=
 =?utf-8?B?Yk5TWVF1a201c1gyeEVuUm8raFowdk1PNG5rbzA2K0pRTU9zak9WMzN3aVV6?=
 =?utf-8?B?STB6alFuM2MvMEJhYVdpaDlEZFFFSEZBR2tqSGZ6VHZ5cXBSTDgyUTViZ3c4?=
 =?utf-8?B?NG50c3BJaTgycmFmbU1ud3B0cUNtelJCL2NuQTgzS3pGWVl2bEJCZmllSWRW?=
 =?utf-8?B?UnMwSkU5MWN2b3RZV3AxSHRXWU5tVGI5eVpmR0JuaHJZWjRkdUgvcTBVRTVv?=
 =?utf-8?B?emd5aTZDVjRicDF2TzdnUGlmTXorTzhrQTNhS0x5WExmMTUzMHZaOUN2N1I3?=
 =?utf-8?B?MVN2eXBLK0RROE5TcE1XanhOVWxjeE55SVA5aTF4THFWWDJldk0wSU1GNHpZ?=
 =?utf-8?B?N0VMb0EwMlRqczlwNTlHVHFpOWRhY0xHWVB0YVBHVjM3OWQ4bWRVaVppLzZS?=
 =?utf-8?B?NHNQUmR0Mno2cjRaeENWcGRpcGlWUEI2bHJSd3JkcldpYS81VGUrdlFDN2Vt?=
 =?utf-8?B?UjFHRjFpUVZYc1dkVXdkTlQ3bHZ2c2ZpRWs2RXZYYUFxL1BwUW1DVFVmRzhk?=
 =?utf-8?B?U3hBMEo2a1BIQUYvVzFJVmtjbjJIZi9TblRkZit4Z0JUQjNlWXEwaW1wR1Zk?=
 =?utf-8?B?VTVVciticVkzZmE4N0dpejJTNjJrRnQ3Q3pLT3QyZk9EU25sVElMWXJnT2t2?=
 =?utf-8?B?eS9TaFA4S3kxRXhKditBbGRGd1pQM0Z0TlNtOFhRTW9iUGtQL1dwcURnOUh3?=
 =?utf-8?B?blFmcG51WFZCZWxLa04vaVhHZXZsTk8vYnFMOUlXeHgyTllBKzFPNU1wQmJX?=
 =?utf-8?B?aEZiaGUzRExKMXIyU0tZbUt5THRSMzdBZTBaNDhFZWpMRTVDNmU1TDdET3VH?=
 =?utf-8?B?VVE4YXM0dUpHUlN5U2o2YWNBQUVTOTljR21oakxWcHkzNWFhMlRBcHJyTkdF?=
 =?utf-8?B?RHpXeDJ4U0FOekFkc0k4dDQ3aTc0Ry9kVklrYmU3U2JEb2g5N3F6UHFVZ0I4?=
 =?utf-8?B?Qzd6UjZIaEcrWVV4R3JmOEo0Z3ZMdERHdFJ4aHFRL3lkRFhwZUR0NmtFb2Fh?=
 =?utf-8?B?V2JLdUtjNHFPUm1ta094dnZ2V2t2ckwwdVltMkl5eWtHanpIT2FRWXcrWHNt?=
 =?utf-8?B?cEpzTEMrcE1wQTJPdzRycDRJZUxXUS9tSGhiVTdoRzRjSXJjK3ZLUFl6ZWts?=
 =?utf-8?B?R1ZhQ2FzN1UxUWh5cHdqc0lWRGdoUzZLTkdTU3V0MkQ3TE5PN0w2SFhXRWl1?=
 =?utf-8?B?ZXVqS2R0dmROMXpRUjlUVUVjUjhvZUF4cTZnOWdqamh1a1lKUDBiSENRNXor?=
 =?utf-8?B?WXRjVS84MXk3eitRNFNEWmFpcnJqU05DT0s2TldNeUFab1RoU08zTG1LUERM?=
 =?utf-8?B?YURUODZTT2NTakFZeG5JL0RmTzQzd3FzUGxHOUJBREx5SVg4YVhDdERacndJ?=
 =?utf-8?B?a1doeHUwRWZzQkJpNWNDT1Q3QXZrai9ncVd1NkFwMmdPTC9iUWxPU0QzNWQw?=
 =?utf-8?B?aXhhaVdTZlZ3QS94eWk2R3dCWlBRRE9sTHJOdFVvZHNQQVdJQW5mWHRwZ0lh?=
 =?utf-8?B?SzJpQkVJTTR0WlZRZkg0U2J4bnpJR2NibUt2VmYrcUF5MjNGRlNZQ1lPOHRk?=
 =?utf-8?B?SDFYalozOENJTWVVUTgzL0hXWkErS0ppV3A0dnA2V2thU0hpbkxVSDdhMHBh?=
 =?utf-8?Q?XaFUB6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlMwRU5HR3FNdTlmZkRDRmxiTGxzb1JjMHI0NjhEd0kwODViRTlONlRXN2Ru?=
 =?utf-8?B?b0lIdW5pK2Q0Tk1rUzhIRU5VUXg1ZjNlZXphbzE4SnJzOTQvekRKWWRmaHFJ?=
 =?utf-8?B?SGgrZkZwNUdPdGQwYUJ4RHNMSE9JcnAxMXJDNVJhVExDT042VW9NYk1ISU1Y?=
 =?utf-8?B?Y0hzYS91M0hDUWVEQmV4U3ozMnZ2OGJEbU81eDVBdUNGWUk1UzRsS2VVem9T?=
 =?utf-8?B?SDQrQXNLajJKSk9kYldqNzMrVm9zcFhwTDRlV2FGMmFVMlVFVWUyRTR4TlJs?=
 =?utf-8?B?RytWNW9CaStEeGVIK1R3Q0FXZzQ4a05jTlhla3pXSEFPblBCUlcwQkhWTXBx?=
 =?utf-8?B?ZnNFUjNCMk9ZNXZIaHZwZ29qL29DKzVsSDBiRHB2UDhGRHE3NjY0eEYyZmZ2?=
 =?utf-8?B?b2NhN3l3VE93aGgwTmhaU1c1MnBRUjVJNnZnQ0tIeitIVUtzbVk2YjBLd2Ro?=
 =?utf-8?B?cXA2Wjg3N2xYWG5wSnYwYTl2S0RzZGZZTlJtYVdFZUJZblc2TUdUdUpWSERy?=
 =?utf-8?B?cEVRRTZYS1BwQXBVbEFzcngxeW10OHpiRlNNZjd0ODcvVTdkVXhwSXBiQzhu?=
 =?utf-8?B?R2pvZWdoUlV2VGtZdWZFTWZXSCtQMUJVd1M5Y2pUS3N4SittbXRUTk9XRERT?=
 =?utf-8?B?WXNuQ211K1VrQ2dYM1VVS1VBbjVuem9lc08xVW1YRXlZUkJHd3RqNU9PTmxN?=
 =?utf-8?B?RG94NFpZVWFFc09vek1vQ0hlM29wdU1URENYaHR4L0hvK1hQWkwvL3o3NG5M?=
 =?utf-8?B?bitxY0RpdkN0TElRWVN2TUpqV2dGemJLRHhhS1FHNVNIYU8xOXJYUU9iT1hY?=
 =?utf-8?B?VzM5WU9JVlgzVjJNSkJPZGVCUjBBaHhObnA4bm4xVUJLYkpQY1JHZjE4N0F6?=
 =?utf-8?B?RDE3Z0xRL0k4WkdTM0tzemluYmM3WC82c2E3UHVKcnA4WlJOTDZpcDAxYm1x?=
 =?utf-8?B?YWVOMDI4VzZQWWVWbG05RDNJajFEZTB6VmpiN014T0syeFdqVVRMRFd6RjQ1?=
 =?utf-8?B?a1AzSWhlT3U4NFMvSXFMalo2TEhWVkFEZFZ0Q0puZDJxSTBLeS9ISHJRUDNZ?=
 =?utf-8?B?NVN2c1k5Y1pDTkYrR2hnaTJQelpJMFdvSC9TV3gzYkZWSWtRREhMRndBQTYx?=
 =?utf-8?B?aU5mT1hhUUMzN0F6Rnh3TmhoS0E5Rmxzd0RsaTBSUGhCVU1taVkyV1g1dWJS?=
 =?utf-8?B?a0d6VUxKQ1duS0dXK0FGMW5TTXdqOEdrL0RaZ09FaEtWVFBiczRLbnNySmFH?=
 =?utf-8?B?cWhmb3hwemEzVHZpUDNlRWQ2NzhJanl6WURjcVNpSVYwTXNNMHYwajlqQ1JR?=
 =?utf-8?B?OU5VUThsaDltL2p0RHNnaDJvRmtUWkVJR09EZXhqSmZzWnFTN0NGRUJpN2ts?=
 =?utf-8?B?UDRpL28zOXF2TkdsZUhGN1FtMU9hY3QrQWVwU3FOMFZPWkJjUWdoKzRvREpk?=
 =?utf-8?B?M2p6MDRPV3JXam16K1o1blJaQTcwNE5xSTF0a0dFa3RhaHlINEZsTWNTN1BM?=
 =?utf-8?B?REM5VjR4d05xWU14dXluQnh2K1lmUXcwQ0FPS0dUOE9nejYybEJpeWxRM0pK?=
 =?utf-8?B?WTZIYVRGNkRsWjZzSy94ekJFRTJmVkNEcXdGaVBoRHB4ZkoxZzVNKzdQWEFi?=
 =?utf-8?B?cVdrdDF5Yy85Y3IxYzc3NE5qN0h3UmtiT3N6RWFpMlJSOU5xWG83SWU0RlFp?=
 =?utf-8?B?R3Vkc1RTS2p4eWY0L2ZQWmhNTVRPb2xLbmJsQXJJUFZ5MnBtR3BtSTZxUWZB?=
 =?utf-8?B?bThmaUtDNGpSOGhpL1dCdVp6bGFYaTczUENOTnNycjhGQ0VOVkptSkpmOEhO?=
 =?utf-8?B?d1BiWnJldEt5NlN2ODRKR1ZzWkZzZitpa1pYdU0zQjdSN3NhamhTUXVlVjMr?=
 =?utf-8?B?WW1rMGpGTlFXRml3SXBMN3Yvb01kQU93Z3dPV0NQcUxpTjUxQUpCKzVZMDJU?=
 =?utf-8?B?bGhYbDlKWnV1aFczakVsWGo2MENIaGZzN2V0RTBITElSTGg1dUx6VWdXNUJR?=
 =?utf-8?B?QUtEYTJqTXBCNzVwZWE2a0h1cmVQaCtHSlF5VU9nWTU4ajBLbWVuMmtOUDRw?=
 =?utf-8?B?SWdRMjlOZDZEcVZ3VjFHQjBNZTYybTdTK0w2SUVXd0J4V2ljS0d5VHgwd051?=
 =?utf-8?Q?Gk8QBOJuBWVKmBSWBsq1eulmc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0938136-bc51-40b9-c19e-08de1c0dae46
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 01:50:21.6645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtVpM3fuJ83pKfZNmGDWABXP6EoFhE8NFTthNjPiUpkgcMsc8CbjSYU1WzWg7JnRAhlzRyrX2eW7xY8sWpFkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6090

SGkgTGludXMsDQoNCj4gRVhURVJOQUwgRU1BSUwNCj4gDQo+IE9uIFdlZCwgT2N0IDI5LCAyMDI1
IGF0IDQ6MzXigK9BTSBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4gd3JvdGU6DQo+
IA0KPiANCj4gPiBHZW5lcmFsbHkgYSBkZXZpY2UgbWF5IGhhcyB0d28gc3RhdGVzOiBkZWZhdWx0
IHN0YXRlIGFuZCBzbGVlcCBzdGF0ZS4gVGhleSBhcmUNCj4gaW5jbHVkZWQgaW4gRFRTIGZpbGUu
DQo+ID4gU28gRFRTIGhhcyB0d28gbm9kZXMsIG9uZSBpcyBmb3IgZGVmYXVsdCBzdGF0ZSwgYW5k
IHRoZSBvdGhlciBpcyBmb3INCj4gPiBzbGVlcCBzdGF0ZS4gV2hlbiB0aGUgZGV2aWNlIHdvcmtz
LCBzZWxlY3QgZGVmYXVsdCBzdGF0ZSwgYnV0IHNlbGVjdCBzbGVlcA0KPiBzdGF0ZSB3aGVuIHRo
ZSBzeXN0ZW0gZW50ZXJzIHN0ci4NCj4gDQo+IFdoYXQgaXMgInN0ciI/IHN0YW5kLWJ5LXJldGVu
dGlvbj8gKFNvcnJ5IGZvciBteSBpZ25vcmFuY2UuKQ0KPiANCg0KU29ycnksIHdlIGZvcmdvdCB0
byBleHBsYWluIGl0IGJlZm9yZS4gU3RyIG1lYW5zIHN1c3BlbmQgdG8gUkFNDQoNCj4gPiBUaGVy
ZSBpcyB0d28gcGluY3RybCBjb250cm9sbGVycyBvbiBDSVggc2t5MS4gT25lIGlzIHVzZWQgdW5k
ZXIgUzAgc3RhdGUsIGFuZA0KPiB0aGUgb3RoZXIgaXMgdXNlZCB1bmRlciBTMCBhbmQgUzUgc3Rh
dGUuDQo+ID4gV2hlbiBlbnRlciBzdHIsIHRoZSBzeXN0ZW0gZW50ZXIgUzMgc3RhdGUgYW5kIFMw
IGRvbWFpbiBwb3dlciBvZmYuIFNvIHRoZQ0KPiBwaW5jdHJsIGNvbnRyb2xsZXIgdW5kZXIgUzAg
c3RhdGUgaXMgYWxzbyBvZmYuDQo+ID4gVGhlIHNldHRpbmdzIGZvciBzbGVlcCBzdGF0ZSBhcmUg
bG9mdCBhbmQgbWFrZSBubyBzZW5zZS4NCj4gPg0KPiA+IEJ1dCBpZiB3ZSByZW1vdmUgdGhlc2Ug
c2V0dGluZ3MsIHRoZSBwaW5jdHJsIGNhbid0IGZpbmQgc2xlZXAgc3RhdGUgYW5kIGNhbid0DQo+
IGNoYW5nZSBzdGF0ZSB3aGVuIHN5c3RlbSBlbnRlciBzdHIuDQo+ID4gV2hlbiByZXN1bWUgcGlu
Y3RybCwgcGluY3RybCBjb3JlIG1heSB0aGluayBzdGF0ZSBpcyBzdGlsbCB0aGUgc2FtZSBhcw0K
PiA+IGJlZm9yZS4gU28gdGhlIHNldHRpbmdzIGNhbid0IGJlIGFwcGxpZWQgYXMgZXhwZWN0ZWQu
DQo+IA0KPiBBaGEhDQo+IA0KPiA+IFRvIGF2b2lkIHdyaXRlIHRoZXNlIHVudXNlZCBzZXR0aW5n
cyBpbiBEVFMgZmlsZSwgd2UgaGF2ZSB0byB1c2UNCj4gcGluY3RybF9wcm92aWRlX2R1bW1pZXMo
KSBpbnRlcmZhY2UuDQo+ID4gRG8geW91IGFncmVlIG91ciBzY2hlbWVzPyBXaGF0J3MgeW91ciBv
cGluaW9uPyBQbGVhc2UgZ2l2ZSB1cyBzb21lDQo+ID4gc3VnZ2VzdGlvbnMuIFRoYW5rcw0KPiAN
Cj4gSSB0aGluayBpdCdzIGZpbmUgdG8gdXNlIHRoZSBwaW5jdHJsIGR1bW1pZXMsIEkgd2lsbCBk
cmFmdCBhIHBhdGNoIGFuZCBzZW5kIHNvIHlvdQ0KPiBjYW4gQUNLIGl0Lg0KPiANCj4gSXQncyBm
dW4gdG8gZ2V0IHRoZSB3aG9sZSBwaWN0dXJlIG9mIGhvdyB0aGlzIHdvcmtzIG9uIENJWCBzaWxp
Y29uLCBpdCdzIGEgbmV3IHdheQ0KPiBvZiBkb2luZyB0aGluZ3Mgd2l0aCB0d28gZGlmZmVyZW50
IHBpbiBjb250cm9sbGVycyBzbyBJIGhhdmVuJ3Qgc2VlbiB0aGlzIGJlZm9yZSENCj4gDQoNCkdy
ZWF0ISBJdCdzIGEgYmlnIHN1cnByaXNlIQ0KVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmdz
DQoNCj4gWW91cnMsDQo+IExpbnVzIFdhbGxlaWoNCg==

