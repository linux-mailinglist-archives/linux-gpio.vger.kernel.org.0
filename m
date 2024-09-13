Return-Path: <linux-gpio+bounces-10069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B97797800B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 14:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB4D1C214C6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 12:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F61DA0F6;
	Fri, 13 Sep 2024 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mLZMJiDR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9781D932B;
	Fri, 13 Sep 2024 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230821; cv=fail; b=ADDnn8/M3eMEquptjgKgzXsdxpV2nh4LG9j1aaePemk8HkAzt94Q+4wP3iQsDpbrU5g6ENsf7vWe4L3a4L5ljMzYVU1fHNe6Le6Zr9G2T+Ha+3A9OhjEsczzVnoz6Gb9rHzB4GlSBLGn7CWyJfkULLL/FnBvrRnzIR1rKQ5Xjd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230821; c=relaxed/simple;
	bh=H5W2jix9qokvXdtQBoRw6JMyKfXWdkyj37PX0VAgbdo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XF7tb/pTIxD/7hmAEx2N8RaantoD0FtNWxXZ5uvfCF5ADag5olhWzcUzWtBgfObrjcXgoAsGf/bt21Y0A5cEmiCeRVnAjlSijNA145M2wJ2KveCwhYraPmS7aT8CAXmc2hiCccHFCXCOhsL8bp9dKR3oT7PQoXhsye6u7dDQXng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mLZMJiDR; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6fb+UO+tE2As13RuxAi9ng65sEldfAg2AFdsQTqFdHtFk9ngXo0kqZjrMTpR5LuM+s0L7O1WJLy8AQVsy1EX05W6FFMNCU4ir5gM7OzNvCGF1T+q/OLUF5lRiNqZm3i0enldPOuYbu0HaJaLQq7+zO93eP03JD/usaAVtz/q4X+UQ4MOvIaoF+lUmK5i9ZX3rKYalkWDqze131hKrv1ubkzSOYD4ZI0NrgWXowTdj7ZXWidgW0dRA4fBr+7YXjI4BnTgikfNTwk1PeQtcC/3oYLZpndz1kUu2DGoGYDZFIER6XaapSUgiTvaxjodt448zbN3esQq0KvtNb9xVog+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XKtd5TFte8eGM09S1ZNEF3shVZLC4Hvv49/Xk9ZYFk=;
 b=ZV5LB7pwFVT9wwlSfKmv6Ztros/TwYhuKBVETX6v/Wz5wxpDsnc3ETsJhSE+KX6hzhKmSMxP4BCyv2FSx+V/GY7ytYVui3KszqtYgsPUbuu7c5pNgGeyS3LjihDJPW/spoW1bL6Hporwu0zBrZz8IUJrchbf1gyIB6IkJq86EuhKRSSoxnji11YpXstrdPlSGJ4MTeKKnIZXyQqO/XFLlKzURkCeaxiTlm3/RSkVqveNwIQZHStbUp+yGDACWoqH03c2bJIB4nkuJG/Qv863sSUuViPCGqHl2eKlp9MdBOL3WL1p58eB32GrTP0N4DfcliHF769tB8vfWIrBfxzaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XKtd5TFte8eGM09S1ZNEF3shVZLC4Hvv49/Xk9ZYFk=;
 b=mLZMJiDRcyCQX2LB2nduYCwjPB4wObkhScJsY6Q0zcpotHM9jORYABiwNivGTm8oVDjdyyV+KQ5ZLGRlcnkpErGYackV47KcE/RFxFXBG048188FCp3gKAH+K+q1DOMzD8bRUH6aZCuDrMzH0XsS1zQmVq6qWraAXL6yOZTj6bDS8xodGncAlnZvULvFm0E0fABKPWJfwtIuw8GJvS0DgshTAFGpN7qfL4YrPCaaD394uY5JNDclWRnKdlszehDixZ6AvgBp9qzJJmuKjF1HNjY+tMu4yU/QGoCjytGQ9WNcgbuFaGlIBsPxNvLV1EsuOm+HFkQRHjbiC0bovcrfRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DBBPR04MB7947.eurprd04.prod.outlook.com (2603:10a6:10:1f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 12:33:34 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 12:33:34 +0000
Message-ID: <dfa1690e-8acf-4a4d-86e8-6f7426262b9c@oss.nxp.com>
Date: Fri, 13 Sep 2024 15:33:28 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO
 driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>
 <2024091327-revered-depletion-7388@gregkh>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <2024091327-revered-depletion-7388@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0089.eurprd02.prod.outlook.com
 (2603:10a6:208:154::30) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DBBPR04MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 09544494-8a72-46ad-2e8c-08dcd3f0473e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzBMS05jSk83RCt5cHpuMDV4QnpxdmxOQ3I3dVVwZGVFWm9uSnNXelA0SnBU?=
 =?utf-8?B?QkVzWjJ3S2d3dTV1OG5oQzFrZ0FJdVpaOUMxb0FaWW1NTnJOYzJSeDhuR3Jo?=
 =?utf-8?B?dDNjTGdERmFGUzc4Y2xhWVZPWXVhQVlHd3dzVFM5S2x4T1lxM0lVUWoreEZn?=
 =?utf-8?B?N1AwR2NSOTF3cmRXb3VyTitNaWVqVFkybVpwYzRkSE5pTnl0K2JtblRWYmNy?=
 =?utf-8?B?bWs0ZlhGREhjZTNsK3h2R1RuQStkd2hHdjJzbVZoZmhZZCs3TkZzWGNqQVJ6?=
 =?utf-8?B?OFlCQitaL0wxNkQzTHdJUTBsTTZMcmJORG9iOTFhelk2UHM3eWQ0dGMvZExV?=
 =?utf-8?B?d1psY3J5aE50T1VkSm9DQXdibG5jcEh4WFVlY2FINDVQWVFTSUZaQ3dJaU9R?=
 =?utf-8?B?MDFSNVhyY3Y1UExNU1A1R1NGK3dRY2VNbWN5QUtLeVJVa0hWZ2FFcndmeWJ0?=
 =?utf-8?B?bzllN01SMm1hbFF1ZXVvMlJ0YjhnZ0pUYmMwNEMxUmxHRURBQjF4a2p4U2E1?=
 =?utf-8?B?TW5zUGZES3EzaE14dzJ5VllsR09vUVVBeGV2dEZvMkhqWEFwMFFMREt2Zk5K?=
 =?utf-8?B?TmU4Nk1mUGZ0M1l1NElyTFljZlB0dTdQNnMxY1lqMlNxVGtKNmRYL3Nvamlp?=
 =?utf-8?B?UDRUajJPaTBackxJZXBsYzFxSWdVb3hYdVUvYTQxTkcrZ2I2M0lYa1B5NUM0?=
 =?utf-8?B?M3Y0c3gyR1YyS21UL3FmVHdlbFNHVXZCemxyMjJpV29tQXp6aFR4cnhjK1Fx?=
 =?utf-8?B?cm5jQlRURHhEcWtIM1pSTXVqQTZYWnNEVnlkRG16K3pMUFJPbVEyQnEyK2s4?=
 =?utf-8?B?U0hsMmlwU3VUYXBGUXhpcUxuYW9wSXYwRjdUWWx4V0FldDMwelpSc1Fwc3M0?=
 =?utf-8?B?NnNNaHpUUzJGcTlHQk9SdWdWWGZJL3VDbVlXQWFPd1orQ0R3QThFYW1MTENZ?=
 =?utf-8?B?d2tsU0pKbkNHdWJDcks3Wlh2c2VpM1BySnRkNjk2SDhFMDAzVHZsNzdIR1JN?=
 =?utf-8?B?SFgxdlpjM082ZzBGaEUrT1g2Y3hDSFpTeWkyaGdTclF5Tjh5ZGVzZTRpdkxR?=
 =?utf-8?B?OHk5VW1hMmJoZklIY1BwQm90eDVsQzdUazl1U05SQXNiTHd0cjJ5K2NNeUo4?=
 =?utf-8?B?ZzY4dEQ0SWJKcEJ0Q0lyU3ZLQkVNWk12T3l6SHJGVlpXUWFPTFFOVVF3UjhO?=
 =?utf-8?B?ZDNwejVjdnptdVhWR2RlRTc4SjZJTVVmMVhGR1BqMGYzQVNDNUp5cGl5N2th?=
 =?utf-8?B?bFRFR0R6QklBNWtXNWpvYkxMb3VlYzBrT2pvT29Jbnp4M0o5dDR4ZjkvS21I?=
 =?utf-8?B?V205emNoM2tldmh3Q1hVdGtJOE92SFhsME5DRGdYamdSMDVJR2UyVWRpenR4?=
 =?utf-8?B?LzV3dW1LQ3BlZXAvVzl0dG5oQTNibGl1N1pBbW8vaXh4cmQ5QU4vWFA4RVdv?=
 =?utf-8?B?RElqaFNSYkFWSVpMQmVIYmtudWVTRXBWd0ZrRVQ3cS9EakUwZlFBdVUveTF1?=
 =?utf-8?B?RTBSSFhpdHJ4eitFaVRBODhvSGViOHBjYnZVYU9EenJSby9XcEFwVWQxRXZj?=
 =?utf-8?B?VDk3M3NCcFE2bUlJZ21UZFB5aHJveTlLVDJvSWRNMHMxYUhaWVNtRENmUGRQ?=
 =?utf-8?B?Qi9hOXNkc1FyeHhDMTArSVpBeXFrQmtVU3RRUHRZV0MrZjJNZEdUT0F1dmZS?=
 =?utf-8?B?U29zTmJVSDc1bmlwVW9TekY5Y2tjSDJ0OEtscVdXUUtLMEZ6dThRc0NDbWNr?=
 =?utf-8?B?alAycjU5WHkwVUtWZzFnbm5IOE5iNTFMVjBuemhhRjBhR0ZrMXcvVGM5ejly?=
 =?utf-8?B?Wi9HRzZVMnhQeWtqMERqQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJ0dnJES0EzK1RaR3Zwb1RnUWtHY0FGSnFvakR0Y01Vb0xOSWtPRm1WcTlG?=
 =?utf-8?B?eHFjdEFnbmljbjFYNi9ic2tlVTNvV08xWmFmSkdPN1RiMm8vQjRSei9ZcEs3?=
 =?utf-8?B?QTF2YzVndE5VRHJpL0hxVVJuM2thVStaS3ErbHhpZ3RNTnZPOGYxUUtIVmxC?=
 =?utf-8?B?dE5CaUk5YkpBSkdzSjNZM3RMUThpa3hkcFRvNTVvOHJDRTdycFExR2R0aEdB?=
 =?utf-8?B?cnNSUXRTYXFSQ2JucmlwU3N0Y2NkeGFoQWk2L1l1RlJiY1BVbXVXVU5tRXEz?=
 =?utf-8?B?ekVJOWRDUXpvSndGb2FiU1l6elFUM1NXZHRwNWNpaGlZUzE5aE95Q1BKTG1z?=
 =?utf-8?B?NHNlV1VQeXR5U3EzNjlhSnNWUmJ6Nk55aEZEQ1J1TWtkQU1pYXZCVXREWE9w?=
 =?utf-8?B?TEdXRnpUYzRBdUcwa0hGMnJSRTY2amsrL2NEanZWcWs2MmZaa0tqS0FnTWdX?=
 =?utf-8?B?dXVMeDlsdExhNC9LYWs5Vlh5djY3eUk5SFFqaC81akpBck5LMlJ3OW1FWXRr?=
 =?utf-8?B?bHo3blhJa1hVbXZ3ZU1uNkFWTjN6SnRXd3JQell2S2lGR1NLZ1pWMkVtRnoy?=
 =?utf-8?B?bGk2OFRUSDY4dHJ0elcwbzFiYjJNbTJtSHN3S0V2clplZDNuSmFYbURFRzFO?=
 =?utf-8?B?QnNxejNUdTVzOFN6SG9YTGFBSCtmWkp6aGdGVHlrdEhLZWVvNW5DbEl3MVNn?=
 =?utf-8?B?cVd5OW4rcU9WMjZVL2RWTk8xZ0srM2IxeGVCVkFwek16YXdPaGhLcUh0Skl6?=
 =?utf-8?B?QnBHKzJiaDJKN2VHNDk3VEE2c2w4UGoxZmhMSUdmd1FLN2JscDFYYkIvd2Jq?=
 =?utf-8?B?QXMyZkoxWEhqdlhUWkR5KzBrb2ZYNndsb2cxM0V4aTVNZWpuV2VEN0R3aFZM?=
 =?utf-8?B?dTA2aXk2Y3BYbmRjdEJKT0hwcFZWUEp4N2UvMmhpWVB5OEM0Y2xMeEdJc3Rq?=
 =?utf-8?B?SVhMZlJOQUJMdCsrK0wrbG9LR0w4bzREZS8vWDR3M2R1RkJiR0FDVkx2cVFh?=
 =?utf-8?B?VUEzU3VJQUVjZFM2M2d5SHFNWTBkdXlTdUIwU2JudW9STHF4Uy9sU1ZnOWRF?=
 =?utf-8?B?MHlWVDl6MW10anFsQ2lZdlN5WWwxV2tJa3hSVGtUREdodElqelJzeStjditz?=
 =?utf-8?B?S2tXT0Y3b09qU1pydDA0RzJxSkNxWFJHdzZXZ3NPeFhrcW1TTmpIbzYya0ZG?=
 =?utf-8?B?bHpyUHlmMHpUY3RzZWpTTlBndWFhN0YxNjF4VE9ONEMvM1hmNVEwRXV3a3BG?=
 =?utf-8?B?T1FMTnF2TE1jT1RGV1BVTWd1VHltWEllVU95dFE1YytyTDdiYk9NVXlOVU1r?=
 =?utf-8?B?bmQzb0JwQkhKTkVOOTBTenoyNmROSzYvZys1Q3dIK1p3cDR5NDhGSUJWRDBT?=
 =?utf-8?B?SndSekV5QXIyTVlTYWN4elpmVm41UWI4cFR1cmlMREVBVVp4RmQ1ZlZXc1Ji?=
 =?utf-8?B?UzE4RlJsQnF5elkrVjRRclh0QWJJelV3MnVZTy9heEZHR29ndVpueVpoVXRy?=
 =?utf-8?B?MjVibkpYaE9VOFhOSEtwN3lic0hueVcyMGtoVHNMN2ViQkd4V0pGSXRRcGtB?=
 =?utf-8?B?NTN0aTk1ejhxY2xZNUp1WkNZZjdSbkhVMU9jU3k4MnZ4a2lHK2dvU1ljTEJG?=
 =?utf-8?B?blNXRFZRYU43ZjV0K3Z4M0ltU05aNGdJREQzYmoyV0liMjg4SHR0cmFCelRl?=
 =?utf-8?B?WWJnSDlVNmNPbENLK3E2TXNuRVJDbXR3N1hnSEpqN0luYUtwb2l1QThLamZo?=
 =?utf-8?B?eEE5RHVJd2RtbEFJVFVsVUVES3J6SWdlSGRHVnpraElwakhBTml1aE1pSlQw?=
 =?utf-8?B?UEk3QXRzVHVpRVI3M0pZbkFWVm1EVlBRZkVLZEhURjA0UHNSdjlQUFJmaHl2?=
 =?utf-8?B?OUxPaGRObGk5ZjE1cnZuQm50Snh2Y0dRZ0xFQjEzZllwTW0rVnNWZWpVZHZI?=
 =?utf-8?B?RUpDLzZhdEh4amhHMDczU0VBRWdqRlFRZTl3T214cTJrZ29nSTFYUGc0Ri8v?=
 =?utf-8?B?S1JhMkp6NjFHaWNnNzRPbkRuSFBhZzU3T212TXl3NHZmcWp1ZUY5NWhhZStG?=
 =?utf-8?B?MHJXYlIzM1hUMW13Z1FBcUNaWDNlMjVFeFNkYjdRb2Nubmc4VytVNXBrWVBV?=
 =?utf-8?B?SmNJYWwyMGpSVnRKc2NoT3RFSnlVRG5FV215Z3FsSHV3NVVkYkVZUE9SMDFI?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09544494-8a72-46ad-2e8c-08dcd3f0473e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:33:34.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFr86lxIzP5aykar5F0sBQQWMS8f5De7YXzSqyc7t5rAoM1pJZP8ucWewzYkrQr2ejz4F28VPvavUYNfxv6+I1/XjRhZl5zQ6s3/l/4sgO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7947

Hi Greg,

On 13/09/2024 14:05, Greg Kroah-Hartman wrote:
> On Fri, Sep 13, 2024 at 11:29:35AM +0300, Andrei Stefanescu wrote:
>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> 
> For obvious reasons, we can't take patches without any changelog text,
> even for simple stuff.
> 
> thanks,
> 
> greg k-h


Thank you! I will fix it in v3.

Best regards,
Andrei

