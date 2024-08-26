Return-Path: <linux-gpio+bounces-9155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81195EC43
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31F86B238BC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68113140E4D;
	Mon, 26 Aug 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DNooRPpc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6813DDA7;
	Mon, 26 Aug 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661785; cv=fail; b=PjxmX9Z0Lr2lnjvJU1j5Ok1qc4WFjn1f5RVTl4hSWk/jjCjiMBgh4JfLQmOuIRZFbiERqpxjGYR1bWEo4LWfq5qcstw1q5xoTEqV9Azl0hzQvl7MN/q1LQldjTePeBtx0ORzk8ViHTYq0cA+J4suO7eYzpwwG10hFji/pcktg+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661785; c=relaxed/simple;
	bh=1NJrdS8vxC3Rs9L3wTILT1JGnDPKNOH+M4l6kRVvUxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7Lt975hVOHx9S3oq6WO2PRlUP35J8YTnKekuCbrM5FWa5WlUYn+2nteY4BbdAbW2PdTIALmFBJwstP7WIdNX2+9sUwshgRabx6RbWMO5JzomdGoqxzSsondn50OMPXiCyVR6ji0xYlMpeBGVkgwltTu+n+s2LAJlRGG8/OuqtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DNooRPpc; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXJa7woJkBOkZXqP6nPgqzyiRL+eqbMe2MlOsPyu+qd2KJ4IOv4u4/KT3e9BTVWgk+eaynwrxRPi7LZ4yjms76eVZ8hLzw6fUBA2atXqyLt8PuhBcKUZIQtQemNr5Du6sy9Hh0BNpJNSlNmt/RQOAjcpeNaJrGtGoL9pTZOJ+prU2IUt4o4OciUBfleLS4qE2xqi/4LghhEj/nOhmMa3Apq3NjWYBQZnN3ai8QCiMW81UZpgLKa5SaRpxP909NjScFx5t0kIRnpYa74RxhHpLZTex/Ky3rjKJS66oWGsCEhDY/v5SNNHzOle7kaOtgVKV+TxgDSx/bmCpW/9LFshhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ65DkhLmwqGDKqGMcrVgJr9nLqvJGogG+iYmWOwK3U=;
 b=ansZ9STYi/awLjrMAlWpx6SO7fZHs7R/iYxcHu7+Dsu9hrz8/VEW70BQS3sQrbPH8+GiLgaB8TL1IArAT0Dhkf44wjdYY8AWJLaUGq0dLzQ2qaEWEU5C5878WJHhfO8Y5PArMn4yov2bMg41UMHKtmwsLNhLH5JZAjieDpRRct67Xx/QPU8J3EnadwZLeCeN0mguJw8gt5a5nMoK4A63+vaaP50lK0xf1fgjQitKZCg/sPz8GssY/YaPM2YG4P8HO5A/jiJMPr5Yx6tPRpwIclpOPaXgpA0H0uCRVmqWmvDz9hr7ea9yKg87VzLNDTyEXCzMu9khYykBzo/hjRbMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ65DkhLmwqGDKqGMcrVgJr9nLqvJGogG+iYmWOwK3U=;
 b=DNooRPpc2sUL99y2kDDxw73Vv4jSQC3b6JJMVbdCk+kc4cxc33c7SSDg6M8jTi8eLExH3vbvFHu4tDX/koOyCRlMDyxmnMPJ8uNcMn4piwk8pJD2zk+kkX7xppcsOVUw9S5foIUeRTLZtgHQMCFptbT7IPqUd7qZII6mwUMzxtkFYP8+09LxgEza/rqo4CQMBB++5+CYODB5Auf9b9/B9826Sui1SAD2U604RKa0M+SD0BZU2olvFFIjO8z4Wv5M5c60FuNVSKwaynHX2yFN6ns+OlktuMngIP6t3ggXs0DyQXAub438T2Hl1HKNeaqz8PfdzDe8j2ofaRn19uIjTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB9PR04MB9818.eurprd04.prod.outlook.com (2603:10a6:10:4ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:42:59 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:42:59 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 3/3] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver
Date: Mon, 26 Aug 2024 11:42:10 +0300
Message-ID: <20240826084214.2368673-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB9PR04MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1e326e-3d36-4e4f-081f-08dcc5ab16dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3hramdVeXRQTFlNSnBHVVpDUGcxN0hoakQwb2F0bnBIRXdxWHRvdW5wck85?=
 =?utf-8?B?QUJoZEw2VWxuZXpGbFNhbk9CSHQ4UVJ0czUxTU5PT0FNNEI1b1lYKzRhYS9R?=
 =?utf-8?B?S3VrWlBSbzFQc1F6OXppcW5OR1gyN3k3QzZXWlNrMVhxV28xdkViMGRyTjVh?=
 =?utf-8?B?UElFcE5OU0FpYm5pbVMxbHpjS25DdmYvYkFxZ2thODBCcEtXRFcvNzJqdndk?=
 =?utf-8?B?elZUSStzVUVTbXlHem5uck81MWRRZTYxWkdLRXZla1hVL2lZVFNpWE10UTlV?=
 =?utf-8?B?KytIMUZwM3pSd2g5aTUvOWhrS2dqcGVNTDhIZnZiaHladWlJVnBQQ0gxSUp2?=
 =?utf-8?B?TXFWUS81QTZRQWdKMjlKcG9HSVRLTVhRaW1yYjNQUStrYlJjWWtiMjFreGJG?=
 =?utf-8?B?bmw0ZXpFNmkwQ3hpMjlYMlo0amxHWFpWQ0llN09UV1owcHFzVUprWnY1WXVO?=
 =?utf-8?B?cG5DSTRveDk5T2JBWWhLMXVhdWYxUDBockRpQmZXRDVvTjhhVm8rNUQ1d3JT?=
 =?utf-8?B?MldwdjJ3RGtPaVkzNnJsa0pTSW9DYWNwU2JiR1dSbTVZT1p1QmFJUFlOZlBB?=
 =?utf-8?B?R3BXSU5MVzFUSVNFYlpoVTRCblNSVkhXejlxa3UxYXF4MmVoYzFiU1JKWVBK?=
 =?utf-8?B?NHkyb3NqYm9zWHJtQys5Q3U1UXZnUkZSOVZ1SEoyRHQzRVhzbDY0ZG92cUxv?=
 =?utf-8?B?ZlZCWkVreUdWT212RmF1QUJYRDVGcEo1UkJhYnJEeHVzL3NHZjNEcnpCWlY0?=
 =?utf-8?B?V1dpUlpCV05zOWsxL1ZiNkJ0V3ltRWZnbXdjeitZTEpoRWVGUTBEK1RXYVp5?=
 =?utf-8?B?RXlrSlYyWDBVQTd6TTA4NnU0VnlUVXFjQ1B5WHgxSzZwVjB5ZlVIMW9RN2p4?=
 =?utf-8?B?VUhRSDFGMUwyalFYUjY0RHc3Y0ZHdWcxS1NCNmdlSkY5VWVsdHFIQUJlRVJ4?=
 =?utf-8?B?WUN2akd2V1JQUUpkUVdwYlBwTUZlUFZsOEEvWWgxTWRNUWVadmF5WmlkTEo0?=
 =?utf-8?B?VXJCTERsRzNQMzBYT1lLMndwdzNqQjB0RHFqRDl2Q0tHNmdDYVdmN1VMMDIr?=
 =?utf-8?B?OEdaMS9PRVI4dmpLdmZKR045VU5xeXc2RXJKUWRhVHV4MUNGMm1EdmdBc2J1?=
 =?utf-8?B?QWRKdFFIZlFpaURyNElBa1NWVEZHa2s4ajQ2ZGNGalRrcVdWT3JQU21IdmxK?=
 =?utf-8?B?c2tBNXVadTFJSFUvendpcmhTaE9hKzVpcStpS1VkS2hDSDIrQW0vRVdzTi83?=
 =?utf-8?B?SjB4V0c0cVRpZnBYRGQ5RnNDaG52aTVuOVJZbmhqNzBTZVAwYURwMld4TjQw?=
 =?utf-8?B?ZlprQzZkeU0wWWhjeGRjbWRVNC81eUVSK1FDZHlISzY3RjY0SytpRVBZNGh6?=
 =?utf-8?B?MDhJTXlGZHZaMTdqOTUybXpvOWhtQkdHWmlpWEoyRm5hSnJlcWdtYWhxS3da?=
 =?utf-8?B?SW9rTzFrTkRyOVNFWHNLa21od1MzaWRqVlVOaVpCdWQ0OXUrZFdEQW56Q2Ey?=
 =?utf-8?B?TFQ2b1VaLzJ2WUYwSG03MEZXZGpWVWdoTWdjeHM2T2h0RUpER0hhVDBlNUU3?=
 =?utf-8?B?NG5MdXFESFU3cnlrYU4xNWlKL3ZuSktxcERQSGViNWlxNk4yTkkza1VueVBs?=
 =?utf-8?B?YnJ0V2tVeHdkK0E3QnU4d0labFJxRUlJT3o3KzdOWDRVOWwyTi9seHJxV0tO?=
 =?utf-8?B?Nk9MdW9NYXdGZWM5amwrTkdrTWZmMzdFdVdrbXFqbzZRS0NhSnhDb1Vpd28y?=
 =?utf-8?B?K25vKzYyUjh5Tlk1ZGxnMXZTV1dIWDltQ0I2RnhROXk5S1cvTXM1S2pXd0NG?=
 =?utf-8?B?b0VSdTk2Ynp5dVM3ZG1meTJITUlrMkpGWWRnbzZ4aVZXRHlZV1lnekRKMTF4?=
 =?utf-8?B?QktRN1I0V0FPS3M5RXE1OWkyV28xakpJdEJyRTJkeWtmR3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2RRTVBIclk4cW05cUt5TDIwZ1NMVGZvQnB6QkxCd0l5UHNFa3QzQzU1K3hN?=
 =?utf-8?B?KzA5MnNtRU1KemJ1Z3ZPYzRSYUd0Q3cxUDJEMUMrZURVR0FCaVB0d2h3d3A4?=
 =?utf-8?B?UUhGclNDQUpTbXV1M0pYcTE4QjdUdmtsZ3FTdTcrSURBMitmdk5PQ0dVVVpz?=
 =?utf-8?B?dDBuditGSmdEUVVSNU1OdWQ0YTE3WDhmaUtSSlhoVWJmVW43VjdBaEVuWkd5?=
 =?utf-8?B?akJBTnZXcnYyL0N0NVVTQjFiNEtnOUc0RUNwWjcvbTlSbHpXOUNITlV6N2RH?=
 =?utf-8?B?NW1XMmE1SWk4K2diZU5iTnpUT1drTFlYV1c3aVRTWUZtcENNa0ZJcEo0Y3dN?=
 =?utf-8?B?QTduQldpWFprVFhwQTZRRXFSRmFTOU9PRGdGUkpQeERZNUhDSHhEUkd2V0g4?=
 =?utf-8?B?WURoMkFhTVl3dkJOM1VjWk1nSUp5UFlkNi80NUdZV1g1bXFiQnRZNjg5S0Rh?=
 =?utf-8?B?MW1BeHl6UEQ0OWQzU2ZlNlVSSENScWJRN0N0OFJXYzA0MGwvU2F5Z2JiYnNO?=
 =?utf-8?B?WUxKZ2lUa3dtanBmOEV0VVRWK2plTE1waVgyMHBiNFBKQkFxbXlWb1FJQzNL?=
 =?utf-8?B?dlRQdjdrOW8zbUJFUHU5NjVaRWQvUERQRG55Zjk1ZjlOcXRDeXgwV045bjk5?=
 =?utf-8?B?T1diRzFNdThsSWlnbEw4cktzM25ycVZyS3B0T1QyZ0J2QkwyY0JyZkJFVktJ?=
 =?utf-8?B?dzNPRDRCNmJ6eXRna2kzSmRFYzdvbTNnL1JIVDUwbUlVd3NwbWY4cGd4UW1P?=
 =?utf-8?B?bk1MUWtEUC9SanJpZlZvaGFCMG9UU2UxdTZpTHhTVno5YmdOTC9HOXMwNCtX?=
 =?utf-8?B?VHUrc2VqZDhnYWNvNkdZSTVlbUs2dXZyVDhGYStDWGR2RUNLdUFZY0pRbUYr?=
 =?utf-8?B?clB5dHIzQWgvSlNNZk9oMGRUUHlva1UxTkdBYkdWSGVPYlFRbHp3c3F2R1E4?=
 =?utf-8?B?aG5JMXhUSjFnUHVZTlpnL2hGNjIwdnFDbjU1RGRrblFWZ09Icmk0ZEFra3B4?=
 =?utf-8?B?eWM1Q1oyeEY4OXR4Sm0zQndvSHI4YXBZQWwzeGU4YTBtVm51OGVkYmtBQkU4?=
 =?utf-8?B?Wld2OHFoZHFCVzlhZ2dnc2paakVOZ3dKR3pxcGJ4eFA1dklLcTFMeXowS1dR?=
 =?utf-8?B?Tnk3bWtkalNGVnByRTRrVmtLK2tjV0pGcEY1T0VRa1dWTnlIZXdoRytrMFo0?=
 =?utf-8?B?S2RVNVl5ZDhHMFJJNDlpOWZBVkdabEl2VFc2ZklkeTR1dkdFRWp5a0V4SHBo?=
 =?utf-8?B?S2dkUzhPdkI5U3hibkhTZlp4VXBJQU9HczFpcVBKQkpjdU1nbFoyVnZDeUJs?=
 =?utf-8?B?YmMvNkVxUUJRdmcwWS9PMFFyS3QrdWZEQlNPTHl3YW5UM0NMRHQyUm9kUnhx?=
 =?utf-8?B?YUlFWDRSMjdhaXVGZjhoSWo5VFpMem9VYUxrNE5yZjNWWmFISWxrYUhaTld6?=
 =?utf-8?B?ZUdMN25ybXUzY2ZmY2F0NmdxOE1yQ2ZjVXg4S0dzRDAyVHhUVnFaeEswY2ti?=
 =?utf-8?B?SERBMHlRR01yU2hUeUljNG1LN0srWWhrNEdzNEtRRHllUnpzK042a1JhbkFn?=
 =?utf-8?B?YTdtcDlNTWJIVXNycXNqdkpMOFAwRDF1aS9zL0RNRkEvWG9vaUJ0Z0dpUmN4?=
 =?utf-8?B?YS8xMmFYb3A4V3FQZXk4R1U0NmxWSElDblhpUDIyeE9CMDdYSWZyWFRuT0lu?=
 =?utf-8?B?ZXhoLzhxaDVjRGRjZWtvOXQwM0RQWnlMbEdSMW1QQWdpeDVRQ0RYcnRmYUo3?=
 =?utf-8?B?cGpYK0dTbFU3OHc3SUlIaktaNDNSN2JxWlE0d3lFeUNWbmZOU25ELzlUMFE0?=
 =?utf-8?B?Wk5nVDkvK2k0Tm4rbFhHVklpMFQ3OFpSYU1jckh6bUN4SE9NZElUYmdyNEUw?=
 =?utf-8?B?R25TWE4xV3ZOaDdPVmR4OWw4U0dDNng0bWdjWGZRUTBINzNGT0tyVFA2UHlv?=
 =?utf-8?B?YmJWUVllaS9Dc1B6ZzZvUGM3OFk2VUY0MWlyM1poYys3Mzh1cDc2dUhMUysw?=
 =?utf-8?B?eldmNHpncXRjSTF5c0JRUEtkV3FyWWdUL0dSbGs1ZUtIYXdseHVrOGJjRXk1?=
 =?utf-8?B?d3ZPVytmTWNRTUp4NEcyOUZLaXJBYjFOclRVOFZRZUVtOEF5S3F3aC9xRFJw?=
 =?utf-8?B?M2tpbjlEdE1BK1YxbERNS0pDbnR2cHJtaGZLbEM0NVZrcTFIck1iM3lUR0xu?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1e326e-3d36-4e4f-081f-08dcc5ab16dc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:42:59.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRdUaNHapSICiJREoddFShjiIuDbehp9lbO+V6UUdH/NfwWdUlm6X2rqzCl/YL7TBCgtnLGu/djqxUoVHb0O16oWZKmzAShpgR6m46OCVVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9818

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..b961cb2d041f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2686,10 +2686,12 @@ ARM/NXP S32G ARCHITECTURE
 R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
 R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R: 	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F: 	drivers/gpio/gpio-siul2-s32g2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
-- 
2.45.2


