Return-Path: <linux-gpio+bounces-20328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 003AFABCDF2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 05:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0445E189A1A2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 03:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641D0258CC8;
	Tue, 20 May 2025 03:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dE9qFPqu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281502586EB;
	Tue, 20 May 2025 03:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747712704; cv=fail; b=bAqrFBtvwR+/naqHuFSZLzvdVaxT/+56f6/Vyvt5OBeg5jDNZtAy/zdVSgpkgknKNslO/IWstGSCyqWR6yA0l8AXi1nP0JOOeRwDo0sd7xBMEynrZF7q/p8R1/5QDMefLKcOqWGOnsGhhdwq4+mYDRJ5Bm61UYhS33fGcCwD4XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747712704; c=relaxed/simple;
	bh=km/S5YkEoQJr5i/ZrW5/0SE0DrBmYkBgvIOQUNCMK84=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mWAADAq0ML2ulHZhbpC7miTgx+bc/ibv+fIZI94y8gKkSgitQm4XsMEF1Ch3t8FxZnmXJ7KdNH9BJpgD5TPI0Bc5BdVSA0l8d01KIPzenBWaxfDHFhMeTQQhCvfEnPGZ73BiAMrG4WOSZxEzPXMVFa9Yv8VoSvke0v3lkd/yo+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dE9qFPqu; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIB39kGJde+VLhjBlhkhqLGoPa8dwSBzt9WQwv10jCiXm0TBrW5+D5uJ8VRkbqSq1jG6d5ilXKiS6GCGNLewX1oj6uo2H4DCeQZks97c+7YZG4Q+jfdjQ+QwDORmt7JiwiCmyh9Lg+SHkigOIjDeiilwf8Xc/ymGnXneFSCxxJsMrIUm+Q8jis4Quqn115rqyRcbZqVBVpjV27cftKwIKOT7bdeqQlt6hGkfd+fu+lZxQGJpwe2+0kJ3BD4tWC8ejaICQIkOA0f4H3C4rqbZikWFCeVzcdO+fsgLJvrHaM96NVYvqFLXUamK3tWCG7vUSy+U0VGOrA2ley3TJcemEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f4fpZkf6EH62kSTk/yRPCc/n8tCKEvujh4nidMT6hg=;
 b=IYHe8FkLaGWN/ZwtWyJ0MMo8tG9Iq4ZoNv8M6dVtnjjbSDGW2SxdRqhCtFTb9vLCg74dni29gBBmKti1ExJcJBtBtVLxIR6FHh/LmHtn22WQ/Cmfet0WEyzuIwL17pc6Te//7/Pja3bNgnTka0RSGxIqwlWBEs7C8NFuPILsJZaQooDIhq3TBfwm2fOGTXk+LnwnnU1pgasBjAE5DPxqPqDITK7cuKI45bBtwUOUO8nu0/jK7nlR0bcD+vwG6KIjGiLaiE3zmtPltwYJ+9gzsmeqlZ54bkCkxcfsM2nq27o1KUUYLCtVx1pmtcylVzA+v3farjuLvKhN+cdoTWieOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f4fpZkf6EH62kSTk/yRPCc/n8tCKEvujh4nidMT6hg=;
 b=dE9qFPquymNOFTnvd1M+7fzkTD9jCPqVVWEbz8QHesG0MLswEERDD1GBXWibwtCcR5b+fnJKGGsTJUVBhAkJyUWaWJ9l/9PQfHDLRZ7qybGsdmMqIYAlylJXWI1/vf0IzwaGeZta8E2AwvYnfFdWyyoZq9VW5vX5EJSx89X4dERbofNEtktZJHKecuA21v6dgjiEmx4D6eVi1IL2dcH4YrAgEg0GbPwNB1eQbtdZROkgW6Aq5dH6Efu+HiF8xiKfM618W10INrrUOIJxSaPXpDeNvExeTbq7CfAzRaO4upLQ4QDKgZJMiictcLx1aoRJXvrd8mNn4tSYvy6zLSLDaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 03:44:59 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 03:44:59 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 20 May 2025 11:46:13 +0800
Subject: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>, 
 peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747712825; l=3033;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=km/S5YkEoQJr5i/ZrW5/0SE0DrBmYkBgvIOQUNCMK84=;
 b=GmyYxp5KxoqSEADmLp5EY9PLMXVA36sLNuaPQbWS+zkF3JPqq+8s3GDjVe7jlz12mzSUAUvg9
 MQBm8Pepe/uCswjCZPrEWra8XEbD7bHWj/WeEhZbZ5x9geKNoQHakD9
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: f210057b-6dbf-477e-7d13-08dd9750b1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|1800799024|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk5ZdG5hR2FKdmo2VXJGTUFMaVVxNStTS1pDL3J0ZjZoK2F2SVJqQVFzdmZn?=
 =?utf-8?B?UW93dzNSMTRUNjBleFIreWR2S3dVKzVub3F6aHNGUXEybEh5T1hWNk5wcElq?=
 =?utf-8?B?WjYyT0JMM0dwa3hzUkxYY0tNUkVzOGJwb0pPL1U1Wk8vOEJXL0lOa21Mb0cy?=
 =?utf-8?B?bkRCUXF5ZFE0WVlEWWpVMTBqUTE2SzRRdGhNaWtVbzBRZDdtSVl4Qmdjay8w?=
 =?utf-8?B?NzdlTVgrSGFkeUlER0k0UDYyZkdkQVRjN2dyUTI4NFBYRjdLd0xtbHk5R3pE?=
 =?utf-8?B?d0ZSMVVUeVQyWGlPT0l5byt2Si9USGNEMVFoZmZhYWtMUUg2UFBKd1VuVVdF?=
 =?utf-8?B?Y0lialQ4RkxyY3RQYktuM3JIYmx2OVV1NzlDVUZpYlpzcDk3aWJoNE9BZ1hR?=
 =?utf-8?B?RWltMHArT2gxRDRIMFJiZnpJaGFDcVpCQzJpNE1VY1pFZEZ2ZVIrU1RNTnFK?=
 =?utf-8?B?YndCTWg2NDM5bnNNbjZqOS94eUxEdU1FSzBaSDZCRHEvN1ArNjdmb3RBa0pI?=
 =?utf-8?B?QTJtUjl3YisvcGxJd0VORWxtY0RYTnB0KzQrSHQyajFHK1hacmZDTmp4dEpY?=
 =?utf-8?B?czNWY3l0N3J2QVlkL3lFSEFESllDdGhmckhrYkFTdXB6MWZTcVhOMG12ejJG?=
 =?utf-8?B?eVVhc2JNUnIrb2lMZW9JSXJibnY0R01ScDJ2dkQ4cXlZQ0cwanRmdzJsbFFC?=
 =?utf-8?B?QVprcE5FcWJTNEZwcS9uOVk1d0Q0bmkrK3hCa2lPdy9aUDROZ1dYSFNsRlov?=
 =?utf-8?B?VEJOWmJvdEZDalhSb2VnWlN6YmFhZ2p0ZFlhUnZGc1U0RXJ0U0VHVktiSEd0?=
 =?utf-8?B?UmZiVkpFNVk2aGlma2l5bm1CUHJTRWdYbHcxNm9yeEF6TStRZGtGM2tuSFR2?=
 =?utf-8?B?bHZYWHlub0J3bVBNbHB2cTl1bzB0YktZeGx0M04rMjRycWJFMkorUkx1a2d6?=
 =?utf-8?B?NklHeWtBeTdNai9JbmNWdHdka1EyTFV6eEdNaUErb3pISUZ3c3VwRFZReHc4?=
 =?utf-8?B?YmhoVFpmRENwb2lFRERyM1hyc3p3RHdnS1FoYWpkMGZLZmJ3c1FNelhuNzlW?=
 =?utf-8?B?WXFKNTJOL2RpUTAxZnFtOFNVU1gweHhhV0Z4MktaRERyTmVoc25mUmMyVll4?=
 =?utf-8?B?YWdRZ0pZbjVwL2dDRkJFWUcrVkhHdjZ6VzFqc2NmbHJUazZhQm9iZnlWczZh?=
 =?utf-8?B?Ym5Nd3FrZnlJWjdYZmdtOUJTRHU1RHE3RmU1RjA2dVZaZmlMN1ZBYy9ubzhM?=
 =?utf-8?B?MDVrUWRicXBneUgxdWFkR084bjFKM3FHTHB0eTFSV2ZrK3c2SGorT2t4cnQ2?=
 =?utf-8?B?ZXk1RldZNFowQjhRcmRycDhIdmdhc2R3bTBqUFkvdTVRZGM3S2JxeGZEWVdu?=
 =?utf-8?B?bEFaSTBxZnpRdlFNb2xscm8xN0YxT2Flc1Q2QnQvaTIraVo4N2pxeVV4OTZN?=
 =?utf-8?B?SzBCWlV2WDNWc3pGcXNsS3BaT0J5MjlBRWsxcXkzQ0VVZEgrQ2pFb1Jpa0RM?=
 =?utf-8?B?ZmkySG9QU2NQOW42ZHh5dERuRzRzcmxubHR2ajBMbk9iZkVHWmNxQ1dyajZM?=
 =?utf-8?B?b290RlIwV2ZCYWZhU0dyY0orSFZXK1F0KzJKaFRhQ0dkTy9VU3FRS2tyd0lG?=
 =?utf-8?B?U2h1ZEIvRlpTcS9JU1RqL0NBblZ1U2JWUlR0NHoyeFkvdnR6WXBKWVE3Qk90?=
 =?utf-8?B?Z011KzhZSjJmdUdkb2JZQVdndEdyZmVVam1VZW5rVktsWGhDREJoNjdoZVdP?=
 =?utf-8?B?eU91b2d4VnpHWXVoaitZSW5UQjVFUld2bmpLMzMvaU5ma29JdlYvb1FSNDly?=
 =?utf-8?B?bFJpeDRDMDRtSy9QcVF4TVh4NDNSeEhLeEM0bnoyaTRmZVh5RzVDRWhDajM3?=
 =?utf-8?B?V0VFUm5raTczU2wzcFBOOG1KTUFiS2w2TGhhOWJyRWtxMG04Rk14VUprRGM1?=
 =?utf-8?B?aFd3c2NhZGx0M0hHT2JyVmFGL0pFb0RVSjJuTUMxVFpSU2UxR1lxUkZzeEtW?=
 =?utf-8?Q?isTwKvu9xYxWDNMefURp9YbXjJnA04=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(1800799024)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkpCRThPWDB5WG1XVEgxdEI3N2JEd2hIRnVLQ2orSUV3Nmp0VDgwZXg1d0Z4?=
 =?utf-8?B?ME5ZVEVFTzV5eUsxUldjOTRGcTR0VHVoWGwyemlCcC9xUllmTkk5MnU4Szhw?=
 =?utf-8?B?OVN3QkVHQlNNTGVjVEhqTE9Fd21ubFpGU1BPYnF0eFZqQmNKZHRNRW1lY3ds?=
 =?utf-8?B?ck5IdkpranhXNkxkWFF2Smcrei82ZFRLSzg0b0M3TmVpaHhFVWpLdnByNC9s?=
 =?utf-8?B?dGZOSmhhaDZ6UVlZZTFJU25iQkszbS9qNW9NR0tod2N3N1MzZGNleFJKTjRn?=
 =?utf-8?B?SzJySjRXTXc3V1pVU2ZEVU9oZUhHNkh2cDQ1bk5LSXNubDQzWHVPemxmM3lo?=
 =?utf-8?B?UXQyZnJDMDZxSXdoM04wQlpKakhDNDJZMENyWXBXOEwyT2FtMFA1ZGZLWnc5?=
 =?utf-8?B?dmZPeDlxRTRqOEcwSWF5eEg2d1oyc28zbU0xMFVqUGx5dkc0ZUl0QmFDbmpk?=
 =?utf-8?B?bEtUVGNyYzZQZnFXL3M4Znp0RHZxdzFOQllXOGl6ZUJyN3UxM3kxeUEvTVNs?=
 =?utf-8?B?NUJ0cncvQWFvVVRxRU95OU5ub2ZMYWh5Z0ZYckNTQVE0K2FBRm9HaTdDR0Fw?=
 =?utf-8?B?R1Y0NTlqcURJT2FtaFN6RlE3em1FM3U3Z0V6UzlGcXoycFdzaDVUWFMxL3RU?=
 =?utf-8?B?aHNQa3Y4SzNuYnc5UW13bHV3ZkhMeWx3eXdacmhnc0V3RHFLSjJLUk9vYysx?=
 =?utf-8?B?R0dzOEQrNE9pZitBWDU0QktSemtIdmtQYmNjbUpMUFd3NERHTFRRTWF2SGJW?=
 =?utf-8?B?VnhMZU9qV0xyOVg4QkdscHBZdnRDVnBMQ1g2dUtFM05wS0QxWCtQNzBUZFBQ?=
 =?utf-8?B?ZktKVmlwNjlBeGEzdW8yRm1OVHJ3eVNadmE3SFdyVEt0b1piemFzODZQdGVp?=
 =?utf-8?B?NkZvbWRpaVJtWEpBcGpJc3hvUUxHOWt1dFh1QjhBY0VQNVhwcFRmdy8zdlFE?=
 =?utf-8?B?M0ZlNnhIWTMzM3J1Nk11N1Fzd2c3QVR0cllxVmpKWG9mcTgwc2d6VVpmZVZP?=
 =?utf-8?B?Qitkenp4NkJ5a3JCeTRYSDY4dWNXOGNQZTgvUS8xWlJXL3ljYnZ1UUFTYlJD?=
 =?utf-8?B?T2NTcTVBUGNMcmJUejYvQW1uUjQxTDVtVVloeUlUZkU2aHhla2x1V3Q0T2N5?=
 =?utf-8?B?d2xRVmlRL0ZFQkVoVkNoSlc2TVlON3JneTlVN2Z1Rk9HdkZiNmxjWHFCVzc5?=
 =?utf-8?B?QmpGblA1alhPN21GbVlJRnhObWhMMEVzYVk1NHdsaWJvbHRLUFpuYkxnb1pW?=
 =?utf-8?B?NXBYSHNsaUg2aVJQUy9Bellua3BFSkhXUkNYdVN4MGhWU2xWN1BGUlFnTGhR?=
 =?utf-8?B?aTUwWFJySUJnSkl0MDhiMmk2bnpzT0t0OUh1RUpRMmk3Z28raDZKaWlMTEFV?=
 =?utf-8?B?NVBRQUtBbm1KWWFTbXR0TzU3VDl2YWI5UUx1cFdRRHE2TXZuZklnN2Zrc2pI?=
 =?utf-8?B?eWdDcXgwdHY5azk5cmdlT0JjWXdBU1RQMmhYMHFna2Q5Z2c1T05GS1Zlb2Ur?=
 =?utf-8?B?b3pnQzExY3pMY0JzNzdSVFIrN3lVOEhyeXh2UDJKZ2NMQ2krYko4ckEvV200?=
 =?utf-8?B?a3Y3S2pWcmVxNUVPdDlEQzBSQkFQV3Z6ODM0U2V4dGorNWQ0SisxNktGWTNC?=
 =?utf-8?B?V20vYlF6NkFiempoMDk0NGEyQ2FPR05IK1JBeHlYUS9iZEhQemQ5VEZZdjZk?=
 =?utf-8?B?SGRKblpPL2RJbEhFdHBkcG9PNkhGc09FL0pYZ3ZzYW9MMm1ZZTVHWEZaNExr?=
 =?utf-8?B?SXh2ZHlvemgwQ0RrcHB4dHBmaUl0VGl4V0RyQUc0THNJM3puMjdqOWdWT3NP?=
 =?utf-8?B?OVJ3R1hoSFNOS2hpdXlCdWhsSnZIaWY3VFV3YUhQbFJCM2VnT0YrdjczZ0tn?=
 =?utf-8?B?c0VkckFMRDFRcitTT1FLVXo3ampzc3Z5L3lXSUFETnE4SGYzbTA2b1R0MWlo?=
 =?utf-8?B?WDJORUFxSVhVUHd3cVI2bUVrZ0sxOWtMV2NuZWtUS0djaGtNOEVKWTRLQWFT?=
 =?utf-8?B?ZjBQakxPOWdMVmJQZ0x2cmZ3Vk1xeDBYS0hBVTRDdHAvQnE4SFRUOVhGWitX?=
 =?utf-8?B?Z2FVYS9oRmpKZWxHWXcrYkdKVFJ3UXcwa245bFU3TFpId3NvVjVBTXEvTmxR?=
 =?utf-8?Q?9lChuRtds1FqRmGCPAdtVPBpf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f210057b-6dbf-477e-7d13-08dd9750b1e1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 03:44:59.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5UoMO21Bx3waarQy5zIAKwlfw624r0PVwWbz6W5guUrDrIjbgzL/Ijn9NphuDaqcJ6tylioZfq6SLBhX6M/Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
the vf610 GPIO driver no longer uses the static number 32 for
gc->ngpio. This allows users to configure the number of GPIOs
per port.

And some gpio controllers did have less pads. So add 'ngpios' here,
this can save some memory when request bitmap, and also show user
more accurate information when use gpio tools.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 4 ++++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi    | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 3c6ef7bfba60986b797bb01b843830d364c96d45..880b9a4f32b0846a773dbf9ad30715c84ac2fda6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -399,6 +399,7 @@ gpio_ptc: gpio@40ae0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLC>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 0 20>;
+			ngpios = <20>;
 		};
 
 		gpio_ptd: gpio@40af0000 {
@@ -413,6 +414,7 @@ gpio_ptd: gpio@40af0000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLD>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 32 12>;
+			ngpios = <12>;
 		};
 
 		gpio_pte: gpio@40b00000 {
@@ -427,6 +429,7 @@ gpio_pte: gpio@40b00000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLE>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 64 16>;
+			ngpios = <16>;
 		};
 
 		gpio_ptf: gpio@40b10000 {
@@ -441,6 +444,7 @@ gpio_ptf: gpio@40b10000 {
 				 <&pcc3 IMX7ULP_CLK_PCTLF>;
 			clock-names = "gpio", "port";
 			gpio-ranges = <&iomuxc1 0 96 20>;
+			ngpios = <20>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 597f20be82f1ee044e14bfaf3bd05cff37a8ad39..a275821c35d41e97eb2139a081ef5765d07672aa 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -318,6 +318,7 @@ gpio0: gpio@40049000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 0 32>;
+				ngpios = <32>;
 			};
 
 			gpio1: gpio@4004a000 {
@@ -329,6 +330,7 @@ gpio1: gpio@4004a000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 32 32>;
+				ngpios = <32>;
 			};
 
 			gpio2: gpio@4004b000 {
@@ -340,6 +342,7 @@ gpio2: gpio@4004b000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 64 32>;
+				ngpios = <32>;
 			};
 
 			gpio3: gpio@4004c000 {
@@ -351,6 +354,7 @@ gpio3: gpio@4004c000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 96 32>;
+				ngpios = <32>;
 			};
 
 			gpio4: gpio@4004d000 {
@@ -362,6 +366,7 @@ gpio4: gpio@4004d000 {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				gpio-ranges = <&iomuxc 0 128 7>;
+				ngpios = <7>;
 			};
 
 			anatop: anatop@40050000 {

-- 
2.34.1


