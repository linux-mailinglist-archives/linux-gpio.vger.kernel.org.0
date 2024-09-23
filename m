Return-Path: <linux-gpio+bounces-10382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827B97EA46
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4501C21428
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDAF198A31;
	Mon, 23 Sep 2024 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Vz/nLAI+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46702198A21;
	Mon, 23 Sep 2024 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089076; cv=fail; b=kNMrqzlT1qdSevNFagv5RzczvoLVIYL/Yg9NtBBmZHuJKDt9HI0TOqVc5CCMLJlvtKNoBsDWYld0j6YevdtWVDs9WrFazFqSKMSv4lIW0WizIAcwpHRNIPUjeaELvZnHjmgaYc7PhewTedaORsLkwFNch5jrgaBZB7lw9g1X/Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089076; c=relaxed/simple;
	bh=Y6TTSuxDnKys5ez0ATpER5yuoVQ3IiAHmOISt/Q1cz4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jZ7FyiEKucRWvZ8y50JGtZlT8E6bL/jApDz0fLpiw/H3JZeojg82bHsw9o9KniP8mDEpnupLqDTacN2oV6oTPxCDRWhnbaxPnzB0KVYEMexq/PRwRqbhKeFTkKGw4FnqHT1dBVueIoIzIi/lZ7bNbnLL1PafR/4fQEgxwk8Wvc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Vz/nLAI+; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drEuswuDjwkHUtadC3wfc3iQgkZrHpAfoBaD9GSDZVOX7JGEIHOKTMx2r5s6AHzVr3y+iD7oPDwhut8DpC14N3bO7z56Fp9rcqsNgElJvB1/E3S7oPs8TmIY/XEW/xO5e3fHuXy5Wt88H2XGVh44oaMmVxYXlOyDNs2xoBH2oa5zAFEy8r4vcCKHUsfg0dRr+/MfUTRRqVJJdif4DlM5zYRRmASpjeiB8an5X6PnUBVgeU9JS+fg72VqeYe7zV8qnGeQCz+bT9yBOeqliOcIrzzuZCOE4o3T2Cnn4+ZKqx+Uk3EnfPVVJCNasDwWqi4nkwFh9lim98HSQeiTeAfnIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6TTSuxDnKys5ez0ATpER5yuoVQ3IiAHmOISt/Q1cz4=;
 b=Lf+xpG2AkzBNX5NRAC+VF7/So3usm6yRJDfCDXE0bRNgzo8CNRxcZk3w8o5KrKnOMCNIQlKJzmGvmV2fnCiB1MZDIw3+uN50bzOkhSYuP2PPJLUDE/AU3wTVF8wl/BkiINZ5aZl0HMhr7hcMddqRUKfqqGYOwEMUOLFf/tGBbXsuYjdCPCoDapqAWzZNXpW2WqEENSnc3Crd6qPnDih6ZesJXrLTnzdYXQvsBeQXEgMGdFMaZAdsjmD3y9f73bDiVLaodqpI8LoROLCI0a5vQdKdJsHaOwske9+srPZM7AjQidB9a5BL+876D7/qzcnYxAqy+VDwRwiYbmm9BInG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6TTSuxDnKys5ez0ATpER5yuoVQ3IiAHmOISt/Q1cz4=;
 b=Vz/nLAI+G4ySOyY8ffRJQdC6rs6u3F1JIU+MevV4BR5QJfLzsnE2tgza15t17DDHhnaGfBXQ8Z5ZefNAluk7/EA3Kc/ybLwWqdQEiDLKgBhBJonmFD20OWaOJNF4zQYLWAA/H0iKXKjizfFy1rTVVKnVivW+ke+dxv6imy8qeQEHkY2QDMPV48dEl9oDtgsZz0gdSmaNdeLoin1l1jbSbFZYoEvcnRzQpFxu7mCMqk+5Regno03PHispe1vobqTfgkZNeAZnASivQw20YYw5V4IaOofaAyOI2hxJ/i3P5O+5o9a2+k3eS6IssovYrDY76m6qTKO8DrETEfSrRntBLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:57:47 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 10:57:46 +0000
Message-ID: <1f1a7746-8c06-417a-8bd9-495fdb1daa93@oss.nxp.com>
Date: Mon, 23 Sep 2024 13:57:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Amit Singh Tomar <amitsinght@marvell.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-4-andrei.stefanescu@oss.nxp.com>
 <690a7534-9f15-4220-9edf-ca56203c7fa0@marvell.com>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <690a7534-9f15-4220-9edf-ca56203c7fa0@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::6) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a9eb33-c450-461b-78aa-08dcdbbe8edf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2NaUVFTMDcwbDlkR0QyMzZPWFBCUGs3T1ZVQ3VzQ0tvbVVXbUV3ZXpKTEVp?=
 =?utf-8?B?bVpkZGM5WW5iVHBYNVhsbWlCbFZBbEkxeHJNSVhndTN1Qm9oblNtZ1RpZlo1?=
 =?utf-8?B?RFVPNCtBQ2hEdTNRd1BIS2g4bUsxUG41ODJhZVV5WStBbnowM2NSaU9pWGdG?=
 =?utf-8?B?ZHJhdEtsNWJncCtrVFBOUzUreS9DTUw4bUlYR21WL3UvWUg3N2hHV0V1bGdx?=
 =?utf-8?B?UU0ydHFYVUU4b3RTSzRQVEt4WVZWYW15dGZOKzhheDlBdHhLZXo1eGY5RHRw?=
 =?utf-8?B?cUdodEtJNmlCWkUxKzhDVFM5Q25rN0g1bDliT2l3Vm9BcDgyUTIrNGwzZUJl?=
 =?utf-8?B?S29qSGErWWVjakdXREVjVGx2eHMvU3VvZmp3Q24xN0FKV1NSTStKdE1pN05m?=
 =?utf-8?B?YWc5dHdVUWhQTlNRRXprNHo1U0haZE1VWnJ2c200VXFCL1cxc2xaQnpSL0Zn?=
 =?utf-8?B?SEsva0pGeDVwZEFPWHZUdTBpSm1yRGprd05aYVovNGtIdGowT00vOU10Um1V?=
 =?utf-8?B?YnlvYUZlN2t4ZEk3VzU4OUJJNm9EZXdSM1FKZzAraFphbFFRaU9JVFRoVGFh?=
 =?utf-8?B?a01tTkRLMm1NaXo3ZnhKVWFtdFVUOVc2TVkrRjZEYVlVbk92ZEFVckRUc0M2?=
 =?utf-8?B?VnRJK0laMExZWnFLUnIyTGtQci9GRTFnQnYrUWUxOG1NNTd4T2FkSjVZbVpX?=
 =?utf-8?B?R052MUhEZnpQREJSU2FMVi9VenlURzd4US9jeENIMG0rbjVPa2N5cy9SNnQz?=
 =?utf-8?B?T2hKcHoyS21PS1Myb09ld0ZVWGl0bmRxejY1ZENuUmVZRGZucGhiMWxJZ0lv?=
 =?utf-8?B?NkR2NmI0MHJhYWl0Z2YwZ3pZcjFEenJIZFZFVE45WjEvT3IyVmtBRjdSd0tT?=
 =?utf-8?B?NWl1MnlYOE8rSGxjOE1XdmZSQTBHdFFvbWtRWkNsUUlKNWtibTgrZHVWZnFv?=
 =?utf-8?B?Wm8xMzlmWU90MHFoZDdDVmhVRi94VDB3MzQzWDhlWmxIc0UwUXVJd3BpclRm?=
 =?utf-8?B?d0dYVm9KTGYxb1JSSjBOcUZjYVBBUlcyckRaWldUV0dnRm9WYzY2dzBqbjFr?=
 =?utf-8?B?enptQkhyZ244akhZenppT2RyUFQvcVdodW90UmFudTQvZFFRMDg4eFI4RzJE?=
 =?utf-8?B?TVpMNkk3ZXk0UXplcTFOYzhaekplNG1pZk5MeDM4MjhiTW1uWmFSVnlrOEJt?=
 =?utf-8?B?a2lCeGMvaG0rZVBVWSttUTNObDVhNjJHck0xY3NUVmVxdVZ4NWpKdGVRdmdB?=
 =?utf-8?B?a2U2RFpmU0l0YVNJTVZWMmw0eWUycGRESW1PQTlMdnlKenRlT2hKblppNEpF?=
 =?utf-8?B?TDJ1MWtyb1FzeDJrcEtGUnJmdHRXd3JjRGRIMU0wR1JxN1BFc1k3RzhBaXpD?=
 =?utf-8?B?MC9Ec05GZXQ3T3lpWUxjM2lvZzNwTDJLMm1ITjVQUVI5M3NyeENFVzNUdmFr?=
 =?utf-8?B?VDVBSzNyY0V0TnFZSHBkczd2N1lLazJtZEszeSt1WG9seE1zaDVoRlp0aWVV?=
 =?utf-8?B?czhVOUI2bmc0UEJ4OHBaVldJeEtuc1RlRlVEcXVNaGdzeXljb25IRGppYUFS?=
 =?utf-8?B?UEkxbndxVk1DMGJ3S2IyNVBqVU51MTd0bHByRHRkSE5QL1VXOTFPZGpyWlFB?=
 =?utf-8?B?MFVkd05KUExqekNHUWYzbHNkR2g0T2Y0dTZ5OE5pQTdtY2xLUXJ4UitqcVRh?=
 =?utf-8?B?eERHTm0yTmFJNEQ3a08xMjV5aU1Pa1BqL1hUYmIwRHY3Q0dYMXBGcXlYaUJi?=
 =?utf-8?B?YUlJVWZUTTBzamJYT1ZqN1VlVUZxazB3WTVWVDB3R2NLKzBxOTlzRG13SVo1?=
 =?utf-8?B?WDd1Q2FMYU1IR1Rwc2d4THEwdGpWZW5qUkhaRUE0Y0hCUmt2bGhuMTJ1QllK?=
 =?utf-8?Q?oU2JzJ6TPA5PY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWVZcVFFTzFQc0h0SjM0bm56NUNYelo5aFdhUElaeUlOaFUxMzRGZW91YkZC?=
 =?utf-8?B?R3lVdVkyWlFSOSt2MDZyc3JxV3BGc252QkJYL1lKS3REd0prWkJFc0hWSkJQ?=
 =?utf-8?B?TVF1VzJTY2FJTVorQmcxNHFOemZHdzhLNVpFdGs3WlFzaEFBaHVvZ3BRcjZX?=
 =?utf-8?B?VmsxZXlDczNZOVFBUmhKNlhpcklkeGxwTElqTmI3ektMeTY3VGpRR1FvZDhM?=
 =?utf-8?B?U1BSY0ZpSms5aUFhUlBrUjd1VDZIcUdMbkpLOER1UWdhb0lRQ25pS08wUnhv?=
 =?utf-8?B?N3ZjdGhoS1daVUFETGxkYlB6Ri9nZTNsZ2VlL1ZkVWJlUkZxb0pjQm4zVHkv?=
 =?utf-8?B?NEovODU0SHI4RDJFRk9qb0J3MHBuUUpxeUVXcWQxaWQ2TmRHWEpXVXpuOEpC?=
 =?utf-8?B?enhUVHdZVHlneVhvK2hleUM1U1g2Y0wxMC9ENUczZXYzc2swWktydEhjbldl?=
 =?utf-8?B?VThoaUNtNDdzcXRPYUZLdXphVUxZcThlQUhHWUtXekVTdDF2RWwwUG14Z3pV?=
 =?utf-8?B?VklrcGd0bmg5dDFGMTFGTnlCbUQ5WkdPSHB3V2JxMmZpWm5wRnRhUVlRMkxF?=
 =?utf-8?B?eXlwdC9XL1JvMWljbXk3K0M1ZVdveG9zYmVqckdnRy9TcmUwY3JadjlOVXN1?=
 =?utf-8?B?VjNGQnVVRk10V1c4cERrTjJQMDJwZ0UrMWJzNTdxMC9jZlpuVldjaVBGMWw3?=
 =?utf-8?B?Q1NPOUhQSDFkc2cybnlBMHR3Q1BrSWN6YlltTTZHSEVHSHBqcHJlRDAyR05Y?=
 =?utf-8?B?eWFKVUJWNmdXOXRNVjFjQnlEcGhSb3dPUEJZWG1JSENCaW9GVWViRjlSZldK?=
 =?utf-8?B?dkwzTTN4eXlKd2M0VGo3Q1ZZUmhBbzRBOGlIZW9qaDBubGxrRXp5S084b29s?=
 =?utf-8?B?TmYrcDMxVnFDdTNNU1YvTVl3Tld1Ym1UcG9TNXFZbjRXajJVNUJQUWhXcHZo?=
 =?utf-8?B?YWRkc0lpeTdRaUlXZ0VjaHBwZlM1YmVzWjNCYklPajF3MVBUUmplZk1vY3JF?=
 =?utf-8?B?eWJ6UEJKYXJHQkZIUkJCYjRUd0hmZDRFY3MvMmZ0WW9xWGJTcmFva1Yvblpa?=
 =?utf-8?B?cG4weXMxN1R4TGFCcXVOUWJxNmpXMys0dmw2d1dEdnNDaHZTV0JySVI1SmZt?=
 =?utf-8?B?M3VHeWg5VjgvK0xRR2lENktFaUorUFM0S0pjazlsNzBPSUo4ekkwbEdYdW5m?=
 =?utf-8?B?RmZpZG5lRW1aWGFZallLS2cvUDVzVEF5QUg3bkw3SzdHMndaSmNsd3NCSnlQ?=
 =?utf-8?B?d3pXT05VVXJoZUQxWVZqODlENXg2enE4L0hOQVk2cG9GWFRUQkQ3Sk9lZnp4?=
 =?utf-8?B?YXkxeDNxU085eFJYc2V5YWxJTmp2Rm41MWc3QUJ5NXJndlQyWUgyQS9CN0hJ?=
 =?utf-8?B?SDhVMU5lRG5LZk85WlY3OFgvQXlQYzJKaGsvNlpxc0hjZnlNSHlSZEVYaWtW?=
 =?utf-8?B?aU81cnN3a2NwTHRNc0J0dHBaMVVZTDdwUTVCdW04eTlnNVVpU05FZlE2MnAz?=
 =?utf-8?B?MXdjbml1K0srYTZYL2YwSEloRERsQzVacGJPL1BIeERBSUM4SG5HQmRZb3dW?=
 =?utf-8?B?Si9aSERFcDE0Zmp0ZWhQcnB2WFkxVlNFektXM1JQUGh1ekJqYXZqaHB4KzBH?=
 =?utf-8?B?V3JRaUlRTUFsSkZpZEVlc0c1N2lFek1VSFMxVUZWYjNwMnRJK09jYndmNmNJ?=
 =?utf-8?B?aE5rY3IxQytDWEI4V3ppSHYxcmlsbVFHR1lrVXE3djcxamw3eERiZmNQSEdQ?=
 =?utf-8?B?TFQ2SzgxTUFhU25ydnV2Y2NDRk8wTkw3cVNtbXIwWWZCQldDVHVLZitDejJ1?=
 =?utf-8?B?Z3paWUxJTTJRTXlDSHF5TWVZdVI4SU1oT3gvVWR6b3ZZODhFRUR0alAvaU5q?=
 =?utf-8?B?UGM4QlpnOUwwVEcwU2poYXJFUUpYeFlZVXlCUXNMN3JBeWp0OEJUVGJ6Nm55?=
 =?utf-8?B?aHE0bmF1cXEzZnV2YThWdVVDOEExL2dJdVdGRUd6bit0V2tpdlNzKzI4RDdr?=
 =?utf-8?B?V0ZoVzRwL29oQ2NWZDhab1JvSnFVWnM4N2tYL1FVVUxZUGZsN3BnamJZMTZr?=
 =?utf-8?B?Q2ZTNDVOTjNWVGxmVy81d0k4ck1KWDVYMDBwWTBJMFBqOFJKOE43QnBMdXRY?=
 =?utf-8?B?Y0RuUWhtV1BLZ0RaMlBIZHFQVytrYUdlWW1LREUxeWZqb2FKQ2txRzZQd2xi?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a9eb33-c450-461b-78aa-08dcdbbe8edf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:57:46.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EEnm6fvRZi6rwl4sL02jSDXcAeu6Ao5ydvxIzI2/hulchkJuaysO3yBQ0Sf87g+Ua96gJ1rzUi793VHe01MMugy6FsjRfTH2p3dEMPgCN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800

Hi,

>> +#define SIUL2_PGPDO(N)        (((N) ^ 1) * 2)
>> +#define S32G2_SIUL2_NUM        2
>> +#define S32G2_PADS_DTS_TAG_LEN    (7)
> nit: Parentheses are not required here, please remove it.

Thank you for the review! I will remove the parentheses
from "S32G2_PADS_DTS_TAG_LEN" in v4.

Best regards,
Andrei

